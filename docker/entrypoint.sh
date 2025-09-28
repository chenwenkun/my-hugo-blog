#!/bin/sh

# 启动脚本
echo "🚀 启动 Hugo 博客容器..."

# 配置SSH和Git
echo "🔑 配置SSH和Git..."

# 设置SSH权限
if [ -d "/root/.ssh" ]; then
    chmod 700 /root/.ssh
    chmod 600 /root/.ssh/* 2>/dev/null || true
    echo "✅ SSH密钥权限已设置"
else
    echo "⚠️  未找到SSH密钥目录，请确保挂载了~/.ssh"
fi

# 配置Git用户信息（如果未配置）
if [ -z "$(git config --global user.name)" ]; then
    git config --global user.name "Docker Hugo"
    git config --global user.email "docker@hugo.local"
    echo "✅ Git用户信息已配置"
fi

# 添加GitHub到known_hosts
ssh-keyscan -H github.com >> /root/.ssh/known_hosts 2>/dev/null || echo "⚠️  无法添加GitHub到known_hosts"

# 创建Git拉取和重新部署脚本
cat > /app/git-update.sh << 'EOF'
#!/bin/sh
cd /app
echo "$(date): 开始拉取Git更新..."

# 拉取最新代码
git fetch origin
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "$(date): 发现更新，正在拉取..."
    git pull origin main
    echo "$(date): Git更新完成，重启Hugo服务器..."
    # 发送信号给Hugo进程重新加载
    pkill -HUP hugo || echo "Hugo进程未找到"
    echo "$(date): 更新完成"
else
    echo "$(date): 已是最新版本"
fi
EOF
chmod +x /app/git-update.sh

# 设置定时任务（每6小时拉取Git更新）
echo "0 */6 * * * /app/git-update.sh >> /var/log/git-update.log 2>&1" | crontab -

# 启动 crond
crond -f -d 8 &

echo "📅 定时Git拉取已设置（每6小时拉取一次）"

# 确保日志目录存在
mkdir -p /var/log

# 启动 Hugo 开发服务器
echo "🔧 启动 Hugo 开发服务器"
cd /app
exec hugo server --bind 0.0.0.0 --port 1313 --baseURL http://localhost:1313 --buildDrafts --buildFuture
