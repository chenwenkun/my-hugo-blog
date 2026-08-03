---
title: Claude Code 安装与调试
date: '2025-09-25'
tags:
  - Claude Code
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

在 macOS / Linux / Windows（WSL）安装并验证 Claude Code，确保能正常启动、登录并在项目内使用。

---

## Claude Code 是什么

Claude Code 是 Anthropic 推出的命令行 AI 编程助手，可以在终端里：

- 理解项目代码与结构
- 生成/修改代码、写测试
- 结合工具（例如 MCP）完成更复杂的自动化工作流
---

## 系统要求

- macOS 10.15+
- Ubuntu 20.04+/Debian 10+
- Windows 10+（建议通过 WSL 使用）
- Node.js 18+（含 npm）
- 网络可访问 npm & Anthropic 登录流程
- 建议内存 ≥ 4GB
---

## 步骤 1：安装 Node.js（含 npm）

### macOS（Homebrew）

```bash
brew install node
```

或从 <https://nodejs.org/> 下载。

### Ubuntu/Debian

```bash
sudo apt update
sudo apt install nodejs npm
```

### Windows（WSL）

1. 管理员 PowerShell：
```powershell
wsl --install
```

1. 重启后进入 Ubuntu：
```bash
sudo apt update
sudo apt install nodejs npm
```

### 验证版本

```bash
node --version
npm --version
```

---

## 步骤 2：安装 Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

说明：全局安装。

如果遇到权限问题，先看：

```bash
npm config get prefix
```

尽量避免把全局安装目录指到系统受限路径。

---

## 步骤 3：验证安装

```bash
claude doctor
```

预期：输出版本信息与环境检查结果。

---

## 步骤 4：首次运行与认证

1. 进入项目目录（Claude Code 通常以当前目录为工作上下文）：
```bash
cd /path/to/your-project
```

1. 启动：
```bash
claude
```

1. 按提示完成 OAuth 登录（浏览器打开 → 登录 → 拿到验证码 → 粘贴回终端）
---

## 步骤 5：基础使用示例

- 指定模型（可选）：
```bash
claude --model claude-3-5-sonnet-20240620
```

- 更新版本：
```bash
npm update -g @anthropic-ai/claude-code
```

---

## 常见问题（快速排查）

- `command not found: claude`：确认全局 bin 在 PATH，或重新打开终端
- 安装报权限错误：检查 npm prefix；尽量用 nvm 或把 prefix 指到用户目录
- WSL 环境异常：优先在 WSL2 下使用，并确保网络策略允许访问
