---
title: Claude Code 安装与调试
date: '2025-09-25'
tags:
  - Claude Code
draft: false
---
# Claude Code 安装教程

Claude Code 是 Anthropic 推出的 AI 编程助手，支持通过命令行帮助开发者生成、调试和维护代码。以下教程详细介绍了如何在 macOS、Linux（Ubuntu/Debian）和 Windows（通过 WSL）系统上安装和配置 Claude Code。

---

## 系统要求

- 操作系统：macOS 10.15 及以上，Ubuntu 20.04+/Debian 10+，Windows 10 及以上（需启用 WSL）
- Node.js：版本 18 或更高（需含 npm）
- 互联网连接
- 推荐内存至少 4GB
---

## 步骤 1：安装 Node.js 和 npm

- macOS 用户（推荐使用 Homebrew）：
- Ubuntu/Debian 用户：
- Windows 用户（需安装 WSL）：
- 验证安装是否成功：
---

## 步骤 2：安装 Claude Code

打开终端（macOS/Linux）或 WSL 终端（Windows），执行：

```bash
npm install -g @anthropic-ai/claude-code
```

> 说明：此命令会全局安装 Claude Code。

- 如果遇到权限问题，请检查 npm 配置（运行 `npm config get prefix`），确保安装路径非系统目录。
- Windows WSL 用户若检测到操作系统异常，建议参考官方文档配置。
---

## 步骤 3：验证安装

使用以下命令检查 Claude Code 是否安装成功：

```bash
claude doctor
```

如果成功，会显示版本信息及系统兼容情况。

---

## 步骤 4：首次运行及认证

1. 进入你的项目目录（Claude Code 依据此目录工作）：
```bash
cd /你的项目路径/
```

1. 启动 Claude Code：
```bash
claude
```

1. 按提示完成以下步骤：
- 选择终端界面风格
- 打开浏览器进行 OAuth 登录认证（输入你的 Anthropic 账户信息）
- 复制浏览器显示的认证码并粘贴回终端
- 允许 Claude 访问项目文件（选择确认）
> 如果有 Claude Pro 或 Max 订阅，认证后可使用相关高级功能。

---

## 步骤 5：基本使用示例

- 指定模型运行（可选）：
```bash
claude --model claude-3-5-sonnet-20240620
```

- 在交互界面输入代码生成指令，如：
```plain text
生成一个简单的 Python 程序，用于输出“Hello, World”
```

Claude 会自动生成相应代码。

- 更新 Claude Code：
```bash
npm update -g @anthropic-ai/claude-code
```

---
