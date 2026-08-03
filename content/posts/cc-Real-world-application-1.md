---
title: Claude Code 在测试开发中的实战应用-1
date: '2025-09-25'
tags:
  - Claude Code
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 主题：Claude Code 在测试开发中的实战应用（1）

这篇整理「Claude Code 在日常测试/测试开发」中的一些高频用法：图片、交互、会话管理等。

---

## 1）图片处理

Claude Code 支持粘贴图片，让模型根据图片完成任务，例如：

- “根据截图定位 UI 问题原因”
- “根据设计稿生成页面结构”
- “分析错误弹窗/日志截图”
上传后图片不会直接显示原图，而是以类似 `[Image #id]` 的占位符形式出现。

![](https://pic2.zhimg.com/v2-90a582d7a9e9b608a3e269135c59927d_1440w.jpg)

---

## 2）Safe YOLO 模式（跳过权限确认）

为了安全起见，Claude Code 执行部分命令时默认会请求你的同意。  

如果你在做大量重复、低风险的自动化操作，可以启用“跳过确认”的模式。

启动时执行：

```bash
claude --dangerously-skip-permissions
```

含义：Claude 会自动跳过权限确认，适合高频操作；但要注意风险控制（最好在隔离环境/测试机使用）。

---

## 3）交互与会话管理

### 3.1 清除聊天上下文

使用：

- `/clear`
用途：清除当前对话上下文，避免历史信息过多影响效果。

![](https://picx.zhimg.com/v2-b6fa580659c878dea09c2beed92d7aef_1440w.jpg)

### 3.2 快捷键/常用操作

- `/`：查看命令
- 方向键：翻历史
- `Tab`：补全
- `Option+Enter`：换行
- `Ctrl+C`：退出
### 3.3 中断操作

当发现输错指令或想停止当前任务时：

- `ESC`：立即停止 AI 当前任务
![](https://picx.zhimg.com/v2-cf4d6b2ad270d90ee347d953a163b657_1440w.jpg)

### 3.4 恢复历史会话

- `claude -c`：继续上次对话
- `claude -r`：选择历史对话继续
- `/resume`：在已打开对话中切换到其他会话
![](https://pica.zhimg.com/v2-1a0378318241d62a5a7517b064ff4d50_1440w.jpg)

### 3.5 上下文压缩（节省 token）

- `/compact`
作用：压缩对话历史，仅保留摘要，从而减少 token 占用；让 Claude 不容易因为上下文太杂而跑偏。

![](https://pica.zhimg.com/v2-1ef6384b697dcf63d8f888c8ec33bdb2_1440w.jpg)
