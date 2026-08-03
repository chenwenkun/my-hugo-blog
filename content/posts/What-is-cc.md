---
title: '什么是 Claude Code '
date: '2025-09-25'
tags:
  - Claude Code
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 一句话定义

**Claude Code** 是一个“能在终端里自己探索代码库、调用工具并循环执行直到交付结果”的 AI 编程智能体。

---

## 核心理念：能奏效的简单方案（The Simple Thing That Works）

你这篇里最重要的点是：Claude Code 把复杂度压到最低，砍掉大量非必要流程，让它更像一个“专注交付结果”的智能体。

---

## Claude Code 的三大核心要素

1. **明确指令（Instructions）**  
1. **强大工具集（Tools）**  
1. **循环执行机制（Loop）**  
---

## 它如何理解一个项目：像新人入职一样探索

与很多依赖预索引 / RAG 的工具不同，Claude Code 更像“新人熟悉项目”：

- 用 `find / grep / glob` 等命令搜索
- 逐步阅读关键文件构建理解
- 发现缺口会继续追问/继续探索（迭代式搜索）
---

## 安全与可控：权限系统

一般情况下：

- 读操作通常自动放行
- 写文件 / 执行命令等风险操作会请求授权
这让它在“效率”和“安全”之间取得平衡。

---

## CLAUDE.md：让 Claude Code 更像团队成员

CLAUDE.md 可以理解为“项目的 AI 使用手册”，会在会话中自动被读取（取决于工具实现/配置），常用于写：

- 常用 bash 命令
- 代码风格指南
- 项目结构说明
- 测试/构建命令
- 注意事项与坑点
常见放置位置（你原文表格要点整理）：

---

## 一段示例（保留你原有风格）

```plain text
# Bash commands
- npm run build: Build the project
- npm run typecheck: Run the typechecker

# Workflow
- Prefer running single tests for performance
```

---

## 备注

你页面后半段包含了一套较完整的“工具优先级 / Subagents / Hooks / MCP 配置”清单，我已保留其思想并按阅读顺序重新组织。如果你希望把这部分进一步变成“可复制的一套标准模板（用于你的每个项目）”，我可以再拆成：

- 最小可用版（适合个人仓库）
- 团队标准版（适合团队协作）
- 安全合规版（适合企业内网）
