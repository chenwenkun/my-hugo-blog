# Hugo 博客 Docker 部署指南

本项目已配置好适用于 Mac mini M4 的 Docker 容器环境，支持自动重启和 Git 自动拉取更新功能。

## 🚀 快速开始

### 启动Hugo博客

```bash
# 构建并启动容器
docker-compose up -d

# 查看运行状态
docker-compose ps

# 查看日志
docker-compose logs -f hugo-blog
```

访问地址：http://localhost:1313

## 🔧 配置说明

### Git 配置

容器会自动每6小时拉取Git更新。为了支持私有仓库，需要配置SSH密钥：

#### SSH密钥配置

**SSH密钥设置**：

1. **检查是否已有SSH密钥**：
```bash
# 检查是否有SSH密钥
ls -la ~/.ssh/

# 常见的密钥文件名
cat ~/.ssh/id_rsa.pub      # RSA密钥
cat ~/.ssh/id_ed25519.pub  # ED25519密钥
```

2. **如果没有SSH密钥，生成一个**：
```bash
# 生成ED25519密钥（推荐）
ssh-keygen -t ed25519 -C "your_email@example.com"

# 或生成RSA密钥
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# 查看生成的公钥
cat ~/.ssh/id_ed25519.pub
```

3. **将公钥添加到GitHub**：
   - 复制公钥内容到GitHub Settings > SSH and GPG keys

4. **容器会自动使用您的SSH密钥**：
   - Docker Compose已配置挂载您的 `~/.ssh` 目录
   - 容器启动时会自动设置权限和配置

### 端口配置

- **1313**: Hugo开发服务器端口（支持热重载）

## 📁 目录结构

```
my-hugo-blog/
├── Dockerfile              # 主 Docker 配置文件
├── docker-compose.yml      # Docker Compose 配置
├── .dockerignore           # Docker 构建忽略文件
├── .env.example            # 环境变量示例
└── docker/
    ├── nginx.conf          # Nginx 配置文件
    └── entrypoint.sh       # 容器启动脚本
```

## 🛠 常用命令

### 容器管理

```bash
# 启动容器
docker-compose up -d

# 停止容器
docker-compose down

# 重启容器
docker-compose restart

# 重新构建并启动
docker-compose up -d --build

# 查看容器状态
docker-compose ps

# 查看实时日志
docker-compose logs -f hugo-blog
```

### 内容管理

```bash
# 手动触发 Git 更新
docker-compose exec hugo-blog /app/git-update.sh

# 进入容器进行调试
docker-compose exec hugo-blog sh

# 查看Git更新日志
docker-compose exec hugo-blog tail -f /var/log/git-update.log
```

### 开发调试

```bash
# 查看实时日志
docker-compose logs -f hugo-blog

# 重新构建镜像
docker-compose build hugo-blog
```

## 🔍 故障排除

### 1. 容器无法启动

```bash
# 查看详细错误信息
docker-compose logs hugo-blog

# 检查端口占用
lsof -i :1313
```

### 2. Git 更新失败

```bash
# 检查SSH密钥
docker-compose exec hugo-blog ls -la /root/.ssh/

# 测试SSH连接到GitHub
docker-compose exec hugo-blog ssh -T git@github.com

# 检查Git状态
docker-compose exec hugo-blog git status

# 手动测试Git拉取
docker-compose exec hugo-blog /app/git-update.sh
```

### 3. 网站无法访问

```bash
# 检查 Hugo 服务器状态
docker-compose exec hugo-blog ps aux | grep hugo

# 重启容器
docker-compose restart hugo-blog
```

## 🔄 自动功能

### 自动重启
容器配置了 `restart: unless-stopped`，系统重启后会自动启动。

### 定时Git拉取
容器会每6小时自动拉取Git更新，如有新内容会自动重新加载Hugo服务器。

### 健康检查
容器内置健康检查，会定期检测服务状态。

## 🎯 性能优化

### 1. 针对 Mac mini M4 优化
- 使用 `linux/arm64` 平台构建
- 多阶段构建减少镜像大小
- 启用 Nginx gzip 压缩
- 优化静态文件缓存策略

### 2. Hugo 构建优化
- 启用 `--minify` 压缩输出
- 启用 `--gc` 垃圾回收
- 配置适当的缓存策略

## 📊 监控和日志

### 查看访问日志
```bash
docker-compose exec hugo-blog tail -f /var/log/nginx/access.log
```

### 查看错误日志
```bash
docker-compose exec hugo-blog tail -f /var/log/nginx/error.log
```

### 查看Git更新日志
```bash
docker-compose exec hugo-blog tail -f /var/log/git-update.log
```

## 🔒 安全配置

- 配置了安全的 HTTP 头部
- 禁止访问隐藏文件
- 限制客户端请求大小
- 使用非 root 用户运行 Nginx

## 📝 注意事项

1. 首次运行需要下载镜像，可能需要几分钟时间
2. 如果修改了 Docker 配置文件，需要重新构建镜像
3. 生产环境建议使用反向代理（如 Traefik 或 Nginx Proxy Manager）
4. 定期备份重要数据和配置文件

## 🆘 获取帮助

如果遇到问题，可以：

1. 查看容器日志：`docker-compose logs hugo-blog`
2. 检查容器状态：`docker-compose ps`
3. 进入容器调试：`docker-compose exec hugo-blog sh`
4. 重新构建镜像：`docker-compose up -d --build`
