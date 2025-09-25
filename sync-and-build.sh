#!/bin/bash

# Notion同步和Hugo构建脚本
# 使用方法: ./sync-and-build.sh [dev|build|deploy]

set -e

echo "🚀 开始同步和构建流程..."

# 设置环境变量路径
export PATH="/opt/homebrew/bin:$PATH"

# 检查参数
MODE=${1:-dev}

# 1. 同步Notion数据
echo "📝 正在从Notion同步文章..."
if [ -f ".env" ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

if [ -n "$NOTION_API_KEY" ] && [ -n "$NOTION_DATABASE_ID" ]; then
    node sync-notion.js
    echo "✅ Notion同步完成"
else
    echo "⚠️  警告: NOTION_API_KEY 或 NOTION_DATABASE_ID 未设置，跳过同步"
fi

# 2. 根据模式执行相应操作
case $MODE in
    "dev")
        echo "🔧 启动高性能本地开发服务器..."
        # 使用本地开发优化配置
        hugo server \
          --config hugo.toml,hugo.dev.toml \
          --buildDrafts \
          --port 1313 \
          --bind 0.0.0.0 \
          --disableFastRender=false \
          --navigateToChanged \
          --noHTTPCache=false \
          --templateMetrics \
          --printMemoryUsage \
          --printPathWarnings=false
        ;;
    "build")
        echo "🏗️  构建静态站点..."
        hugo --minify
        echo "✅ 构建完成，文件位于 public/ 目录"
        ;;
    "deploy")
        echo "🏗️  构建用于部署的静态站点..."
        hugo --minify --environment production
        echo "🚀 准备部署到Netlify..."
        # 这里可以添加Netlify CLI部署命令
        # netlify deploy --prod --dir=public
        echo "✅ 构建完成，可以推送到Git触发Netlify部署"
        ;;
    *)
        echo "❌ 未知模式: $MODE"
        echo "使用方法: $0 [dev|build|deploy]"
        exit 1
        ;;
esac

echo "🎉 完成！"
