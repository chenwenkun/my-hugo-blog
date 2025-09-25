#!/bin/bash

# Hugo 本地部署最佳方案
# 功能：本地运行 + 定时拉取 Git + 手动更新

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PID_FILE="/tmp/hugo_deploy.pid"
LOG_FILE="$SCRIPT_DIR/deploy.log"

function log_msg() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $1" | tee -a "$LOG_FILE"
}

function git_pull_update() {
    log_msg "🔄 拉取 Git 更新..."
    
    git fetch origin
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse @{u})
    
    if [ $LOCAL != $REMOTE ]; then
        log_msg "📥 发现更新，正在拉取..."
        git pull origin main
        log_msg "✅ Git 更新完成"
        return 0
    else
        log_msg "✅ 已是最新版本"
        return 1
    fi
}

function get_local_ip() {
    # 兼容多系统的获取本机IP方法
    if command -v route >/dev/null 2>&1; then
        # macOS/BSD
        route get default | grep interface | awk '{print $2}' | xargs ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -1
    elif command -v ip >/dev/null 2>&1; then
        # Linux
        ip route get 1 | awk '{print $7; exit}'
    elif command -v hostname >/dev/null 2>&1; then
        # 通用方法
        hostname -I | awk '{print $1}' 2>/dev/null || echo "localhost"
    else
        echo "localhost"
    fi
}

function start_server() {
    log_msg "🚀 启动 Hugo 服务器..."
    
    # 获取本机IP
    LOCAL_IP=$(get_local_ip)
    
    # 后台运行 Hugo 服务器
    nohup hugo server --bind 0.0.0.0 --port 1313 --baseURL "http://$LOCAL_IP:1313" --disableFastRender > hugo.log 2>&1 &
    HUGO_PID=$!
    
    # 保存 PID
    echo $HUGO_PID > "$PID_FILE"
    
    log_msg "✅ Hugo 服务器已启动 (PID: $HUGO_PID)"
    log_msg "🌐 本地访问: http://localhost:1313"
    log_msg "🌐 局域网访问: http://$LOCAL_IP:1313"
}

function stop_server() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if kill -0 $PID 2>/dev/null; then
            kill $PID
            rm -f "$PID_FILE"
            log_msg "⏹️  Hugo 服务器已停止"
        else
            log_msg "⚠️  Hugo 服务器未运行"
            rm -f "$PID_FILE"
        fi
    else
        log_msg "⚠️  未找到 PID 文件"
    fi
}

function setup_cron() {
    log_msg "⏰ 设置定时任务 (每5小时检查更新)..."
    
    # 添加定时任务
    (crontab -l 2>/dev/null; echo "0 */5 * * * cd $SCRIPT_DIR && $0 update >/dev/null 2>&1") | crontab -
    
    log_msg "✅ 定时任务已设置"
}

function remove_cron() {
    log_msg "🗑️  移除定时任务..."
    crontab -l | grep -v "$0 update" | crontab -
    log_msg "✅ 定时任务已移除"
}

case "$1" in
    "start")
        if [ -f "$PID_FILE" ] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
            log_msg "⚠️  Hugo 服务器已在运行"
            exit 1
        fi
        
        git_pull_update
        start_server
        setup_cron
        
        LOCAL_IP=$(ip route get 1 | awk '{print $7; exit}' 2>/dev/null || hostname -I | awk '{print $1}')
        log_msg "🎉 部署完成!"
        log_msg "🌐 本地访问: http://localhost:1313"
        log_msg "🌐 局域网访问: http://$LOCAL_IP:1313"
        log_msg "📝 日志: $LOG_FILE"
        ;;
        
    "stop")
        stop_server
        remove_cron
        ;;
        
    "restart")
        stop_server
        sleep 2
        git_pull_update
        start_server
        ;;
        
    "update")
        # 定时任务或手动更新
        if git_pull_update; then
            if [ -f "$PID_FILE" ] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
                log_msg "🔄 重启服务器以应用更新..."
                stop_server
                sleep 2
                start_server
            fi
        fi
        ;;
        
    "status")
        if [ -f "$PID_FILE" ] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
            LOCAL_IP=$(get_local_ip)
            echo "✅ Hugo 服务器运行中 (PID: $(cat $PID_FILE))"
            echo "🌐 本地访问: http://localhost:1313"
            echo "🌐 局域网访问: http://$LOCAL_IP:1313"
        else
            echo "❌ Hugo 服务器未运行"
        fi
        
        echo "📊 Git 状态:"
        git status --porcelain
        ;;
        
    "logs")
        tail -f "$LOG_FILE"
        ;;
        
    *)
        echo "Hugo 本地部署管理"
        echo ""
        echo "使用方法: $0 [命令]"
        echo ""
        echo "命令:"
        echo "  start   - 启动服务器和定时更新"
        echo "  stop    - 停止服务器和定时更新"  
        echo "  restart - 重启服务器"
        echo "  update  - 手动更新内容"
        echo "  status  - 查看运行状态"
        echo "  logs    - 查看实时日志"
        echo ""
        echo "首次使用: $0 start"
        echo "手动更新: $0 update"
        ;;
esac
