---
title: Claude Code 在测试开发中的实战应用-1
date: '2025-09-25'
tags:
  - Claude Code
draft: false
---
### **图片处理**

Claude Code支持粘贴图片，可以让Claude根据图片来完成任务，例如：“根据图片设计网页”或“分析错误截图原因”。

上传后的图片不会直接显示出来，而是会用`[Image #id]`的占位符替代。

![](https://pic2.zhimg.com/v2-90a582d7a9e9b608a3e269135c59927d_1440w.jpg)

### **Safe YOLO 模式**

为了安全起见， Claude Code执行一些命令时默认请求你的同意。为了实现更方便的自动化，你可以设置Safe YOLO模式。

在启动Claude的时候，执行下面的指令即可：

`claude --dangerously-skip-permissions`

执行这个之后，Claude 会**自动跳过所有权限确认**，不需要你手动点允许。这对于一些重复性任务十分方便。

## **二、交互与会话管理**

### **清除聊天上下文**

使用 `**/clear**` 清除聊天上下文，避免累积过多历史信息影响效率。

![](https://picx.zhimg.com/v2-b6fa580659c878dea09c2beed92d7aef_1440w.jpg)

### **快捷键操作**

- `/` 查看命令
- 方向键翻历史
- `Tab` 补全
- `Option+Enter` 换行
- `Ctrl+C` 退出等。
### **中断操作**

输错指令时，按 `ESC` 键立即停止 AI 当前任务。

![](https://picx.zhimg.com/v2-cf4d6b2ad270d90ee347d953a163b657_1440w.jpg)

### **恢复历史会话**

在启动的时候，执行`claude -c`，可以继续上次对话

执行`claude -r`，可以选择历史对话继续。如果你已经打开了某个对话，你也可以输入 `/resume` 来切换到其他会话中。

![](https://pica.zhimg.com/v2-1a0378318241d62a5a7517b064ff4d50_1440w.jpg)

### **上下文压缩**

Claude Code提供了`/compact` ，它的作用是**压缩对话历史**，只保留上下文摘要，从而减少 token 占用。

![](https://pica.zhimg.com/v2-1ef6384b697dcf63d8f888c8ec33bdb2_1440w.jpg)

这样 Claude 就不会因为上下文太杂而卡壳或跑偏。
