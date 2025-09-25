---
title: '什么是 Claude Code '
date: '2025-09-25'
tags:
  - Claude Code
draft: false
---
## 💡 核心理念：可以奏效的简单方案（The Simple Thing That Works）

正如 Anthropic 内部所信奉的，**“可以奏效的简单方案”**（The Simple Thing That Works）是 **Claude Code** 成功的基石。这意味着他们砍掉了许多非必要的流程消耗，让 Claude Code 成为了一个**纯粹、简单、且专心致志**为你干活的 **AI 智能体（AI Agent）**。它没有多余的“心眼子”，只专注于交付结果。

---

### 🚀 Claude Code 制胜的秘密武器：AI 智能体的三大核心要素

为什么 Claude Code 如此简单高效？作为一个成功的 AI 智能体，它的制胜秘诀在于一个精妙的**循环执行机制**，而这个机制建立在三个核心要素之上：

1. **明确的指令（Instructions）：** 有了清晰的目标，智能体就知道该往哪里走。
1. **强大的工具集（Powerful Tools）：** 它装备了终端高手钟爱的工具，例如编辑/创建文件、使用 CLI（命令行接口）或 MCP 工具、提交 Git commit 等。
1. **循环执行机制（Loop）：** 模型会根据指令，在一个循环中**持续调用工具**，直到它能够**自主判断**任务已经圆满完成。
---

### 🧠 独特的代码理解方式：像新人入职一样探索项目

与许多依赖预先索引或 **RAG（检索增强生成）** 的传统编程 AI 工具不同，Claude Code 在理解一个庞大的代码库时，采用了更像人类的方式——它不依赖任何索引。

它的工作方式更像是一个**新人加入团队后熟悉项目的过程**，我们称之为**“智能体式搜索”**：

- 它会使用 `glob`、`grep`、`find` 等命令在代码库中**穿梭和探索**。
- 它通过阅读文件、理解项目结构和逻辑，**逐步构建**起对整个代码库的认知。
- 这意味着它可以进行一次搜索，根据结果判断：“等等，我可能还需要了解另外几件事。” 进而执行更多的搜索，这种**迭代式探索**让它能更深入、更灵活地理解项目上下文。
---

### 🛡️ 完善的辅助系统：安全、透明与灵活性的保障

在这个高效的核心智能体之上，Anthropic 还构建了一套关键的辅助系统，确保了其**安全性和可用性**：

- **轻量级用户界面：** 让你能**实时观察** Claude Code 的工作过程，一切尽在掌握。
- **权限系统（Safety Check）：**
- **高安全性与灵活性：** Claude Code 只是在模型之上的一个轻量级封装。因此，你可以轻松地将其指向通过 AWS、GCP 等云服务商提供的 Claude 模型，从而满足各种**不同的安全与合规需求**。
### 📖 Claude Code 使用入门：CLAUDE.md 文件的重要性

如果你想开始使用 Claude Code，CLAUDE.md 文件是你的必经之路。

为什么 CLAUDE.md 如此重要？

这是一个特殊的文件。在 Claude 发起对话时，它会自动将其拉入上下文。它就像是项目的“开发人员手册”和“注意事项清单”，可以存储以下对 AI 智能体极其关键的信息：

- 常用 bash 命令
- 核心文件和实用函数
- 代码风格指南、存储库规则
- 开发者环境设置、测试说明
- 项目特有的任何意外行为或警告
- 其他信息
可以在项目根和子目录创建多个 `CLAUDE.md`，为每个上下文提供个性化配置。

```shell
# Bash commands
- npm run build: Build the project
- npm run typecheck: Run the typechecker

# Code style
- Use ES modules (import/export) syntax, not CommonJS (require)
- Destructure imports when possible (eg. import { foo } from 'bar')

# Workflow
- Be sure to typecheck when you’re done making a series of code changes
- Prefer running single tests, and not the whole test suite, for performance
```

```shell
# Bash 命令  
- `npm run build`: 构建项目  
- `npm run typecheck`: 运行类型检查  

# 代码风格  
- 使用 ES 模块语法（`import/export`），而非 CommonJS（`require`）  
- 尽可能使用解构导入（例如：`import { foo } from 'bar'`）  

# 工作流程  
- 完成一系列代码修改后，务必进行类型检查  
- 出于性能考虑，优先运行单个测试，而非整个测试套件

```

```shell
# 核心原则

- 中文回答
- Claude 4并行优先
- 官方Subagents标准
- MCP工具优先
- 时间感知优先

# 复杂度决策

```python
if 文件数 < 3 and 代码行数 < 200:
    使用 Claude 4 并行模式 + 基础MCP工具
elif 文件数 <= 10 and 需要专业协作:
    使用 官方Subagents + 核心MCP工具  
else:
    使用 Opus 4 + 完整MCP生态
```

# 工具优先级

## 基础层 (必须)

- Read, Write, Edit, Grep, Glob, Bash, TodoWrite

## MCP层 (优先使用)

- mcp__Context7: 实时文档查询
- mcp__fetch: 网络资源获取
- mcp__sequential-thinking: 复杂逻辑分析
- mcp__chrome-mcp-stdio: 浏览器自动化
- mcp__Playwright: 跨浏览器测试
- mcp__tavily: 搜索和内容提取
- mcp__desktop-commander: 系统操作

## 受限工具

- ⚠️ WebFetch → ✅ mcp__fetch (WebFetch可用但MCP更优)
- ⚠️ WebSearch → ✅ mcp__tavily__tavily-search (WebSearch可用但MCP更优)

# Subagents配置

## 创建方式

- 命令: `/agents`
- 存储: `.claude/agents/{name}.md`
- 格式: YAML frontmatter + Markdown

## 调用语法

- 自动委派: 基于description字段智能匹配
- 显式调用: 
  - `Use the {agent-name} subagent to {task}`
  - `Have the {agent-name} subagent {action}`
  - `Ask the {agent-name} subagent to {request}`
- 链式调用: `First use the analyzer subagent, then use the optimizer subagent`

## 创建策略

- 项目特定: 基于当前项目技术栈和需求自动生成
- 单一职责: 每个agent专注一个明确任务
- Claude生成: 先用Claude生成基础结构，再个性化定制
- 描述优化: 在description中使用"PROACTIVELY"或"MUST BE USED"提高自动使用率
- 并行优化: 在系统提示中注入Claude 4并行工具调用指导，确保subagents也能享受78%性能提升

# 执行规则

## 必须执行

1. 获取当前时间: `mcp__mcp-server-time`
2. 并行工具调用: 同时执行独立操作
3. 验证API真实性: 通过Context7确认
4. 配置质量Hooks: PreToolUse + PostToolUse

## 并行场景

- 多文件读取 → 同时Read
- 多关键词搜索 → 同时Grep  
- 多命令执行 → 同时Bash
- 多资源获取 → 同时MCP工具

## 禁止行为

- 串行执行可并行操作
- 虚构API或配置信息
- 跳过时间感知步骤
- 使用被禁用的内置工具

# Hooks配置

```json
{
  "hooks": {
    "PreToolUse": {
      "Bash": "git status --porcelain",
      "Edit": "cp $CLAUDE_FILE $CLAUDE_FILE.backup"
    },
    "PostToolUse": {
      "Edit": "npm run lint --fix 2>/dev/null || true",
      "Write": "npm run typecheck 2>/dev/null || true"
    }
  },
  "permissions": {
    "allow": ["Bash(npm run *)", "Bash(git *)", "Edit(*)", "Write(*)"],
    "defaultMode": "acceptEdits"
  }
}
```

# MCP服务器配置

```bash
# SSE (推荐)
claude mcp add --transport sse docs-server https://api.example.com/sse

# HTTP  
claude mcp add --transport http api-server https://api.example.com/mcp

# 本地stdio
claude mcp add local-tools -- npx @local/mcp-server
```

# 项目初始化流程

1. `mcp__mcp-server-time`: 获取当前时间
2. 并行项目分析: Read + Grep + Glob
3. 技术栈识别: 基于依赖和文件模式
4. Subagents匹配: 检查`.claude/agents/`目录
5. 创建缺失专家: 使用`/agents`命令，自动注入并行工具调用优化指导
6. 配置Hooks管道: 基于项目类型设置
```
