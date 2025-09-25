#!/bin/bash

# 本地Hugo性能基准测试脚本

echo "🚀 开始Hugo本地性能测试..."

export PATH="/opt/homebrew/bin:$PATH"

echo ""
echo "📊 测试1: 标准构建性能"
echo "================================"
time hugo --quiet

echo ""
echo "📊 测试2: 本地开发配置构建性能"
echo "================================"
time hugo --config hugo.toml,hugo.dev.toml --quiet

echo ""
echo "📊 测试3: 最小化构建性能"
echo "================================"
time hugo --minify --quiet

echo ""
echo "📊 测试4: 内存使用情况"
echo "================================"
hugo --config hugo.toml,hugo.dev.toml --printMemoryUsage --quiet

echo ""
echo "📊 测试5: 模板性能分析"
echo "================================"
hugo --config hugo.toml,hugo.dev.toml --templateMetrics --quiet

echo ""
echo "🎉 性能测试完成！"
echo ""
echo "💡 建议："
echo "  - 本地开发使用: ./sync-and-build.sh dev"
echo "  - 生产构建使用: ./sync-and-build.sh build"
echo "  - 查看详细性能: hugo --templateMetrics --printMemoryUsage"
