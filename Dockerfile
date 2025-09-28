# 使用多阶段构建来优化镜像大小
# 第一阶段：构建阶段
FROM --platform=linux/arm64 node:20-alpine AS node-builder

WORKDIR /app

# 复制 package.json 文件
COPY package*.json ./

# 安装 Node.js 依赖
RUN npm ci --only=production

# 第二阶段：Hugo构建阶段
FROM --platform=linux/arm64 alpine:3.18 AS hugo-builder

# 安装必要工具
RUN apk add --no-cache \
    wget \
    git \
    ca-certificates \
    && rm -rf /var/cache/apk/*

# 手动安装最新版Hugo
RUN wget -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.119.0/hugo_extended_0.119.0_linux-arm64.tar.gz \
    && tar -xzf hugo.tar.gz \
    && mv hugo /usr/local/bin/ \
    && rm hugo.tar.gz \
    && chmod +x /usr/local/bin/hugo

WORKDIR /src

# 复制整个项目
COPY . .

# 复制 Node.js 依赖
COPY --from=node-builder /app/node_modules ./node_modules

# 构建 Hugo 站点
RUN hugo --minify --gc

# 第三阶段：运行阶段
FROM --platform=linux/arm64 nginx:1.25-alpine

# 安装 Node.js、Git、SSH 和 crond 用于 Git 拉取功能
RUN apk add --no-cache nodejs npm git openssh-client dcron ca-certificates wget

# 手动安装最新版Hugo（与构建阶段保持一致）
RUN wget -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.119.0/hugo_extended_0.119.0_linux-arm64.tar.gz \
    && tar -xzf hugo.tar.gz \
    && mv hugo /usr/local/bin/ \
    && rm hugo.tar.gz \
    && chmod +x /usr/local/bin/hugo

# 创建应用目录
WORKDIR /app

# 复制构建好的静态文件到 Nginx 目录
COPY --from=hugo-builder /src/public /usr/share/nginx/html

# 复制源代码和依赖（用于 Notion 同步）
COPY --from=hugo-builder /src /app
COPY --from=node-builder /app/node_modules /app/node_modules

# 复制自定义 Nginx 配置
COPY docker/nginx.conf /etc/nginx/nginx.conf

# 复制启动脚本
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 设置权限
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chown -R nginx:nginx /app

# 暴露端口
EXPOSE 80 1313

# 健康检查
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# 使用自定义入口点
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
