---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

把 WebDriverAgent（WDA）**打包成可独立安装运行的 iOS App（.ipa）**，用于：

- 不依赖 Xcode 直接在真机上启动 WDA
- 远程/自动化环境更方便地拉起 WDA 服务
- iOS 17+ 也可用（按你的记录验证）
---

## 已验证情况（来自原始记录）

- iOS 16.6：运行闪退
- iOS 18.3 / 18.4：可正常安装运行
---

## 背景：WDA 与维护者

- WDA 最早来自 Facebook（现已不活跃）
- 当前常用维护版本由 Appium 维护（建议优先使用 Appium 维护分支）
（下方保留原始对象/链接块）

---

## 步骤 1：下载代码 & Xcode 首次构建

1. 下载/拉取 WebDriverAgent 代码
1. 用 Xcode 打开工程并先构建一次（确保依赖齐全）
1. 修改 `Bundle Identifier`
1. 选择并勾选你自己的 Apple ID（签名用）
（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQCUNLPU%2F20261109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261109T033525Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJHMEUCIQDr7d2m6ic61f5Ig8GGy1LCSTs8D4dc7W52%2FnN2NMcjVAIgQ8L3FO4VZJoF54Ai0bS48mNxzWht12o8y93bTp1wducq%2FwMIGxAAGgw2Mzc0MjMxODM4MDUiDBFqBUvqYAjRqRnFKCrcA2BlqaV%2BWY512XDDisKK7ZSwOrQPE1i4ThISLPgnNC2m%2BA0Ymb%2Fz58vOwzVJieMMP%2FzTm8i4ROTzDTSHFxE41qZsRLXXyt5pngQbDR0SFAajFwVVAIfU2SlKCvXrZ9X7QWquzp2GdEJ3IcjjHeEtPS%2BE%2FnChAehZ3JFwR%2BrhRNYBsat3UJZQMErk0EOPCkocAivWQFTO0UOjJQsIz61uJdoQ7X0QUM0uYGM0EH19wED1wQMAmHuxOvqxfPTxgrvDeCV0zLVBK%2BnI1GfK4SG2pCHHewOOLTsuZd9i%2BSFr1a2K%2Fh%2Fd7FfWEZZUYTcv3DBJMglTEU6k5QWrJqWkOaD8hLehqieC0la0hnW%2Br1XaLxc%2B0icR5s9NbWffYYlPJmooEone8c6pL0LdiQrSCn9qT7ldMBin6spWfxlb8hKIv0LVrrXRkcCO%2F7yBEfOmMsxy3iWX8eRPkwWEAHAdb9tnGoe5ALHgxAdLAzB2XfixL1eEJVqvyO%2B2FIcL1FXuQTlhILn6AaJLjDfquPyFgc6KnDLlV%2BDeUnRgIzjRgEKSJ6XPAi6kI1RBncm5%2BCuTs9jffz6wZOqjeQ5FI3athWqdZok%2B7dbOH5u4JLCW1m0ub3x3nSTt0l247XYG75WdMK3YxNcGOqUBioO2vCFAxvcI1pGAotxzC2%2BJyO7L%2B9weqia55rOLSi9w5dTUEfWq0kZMYOk%2FYs3lU2RbwXA7jSkbxCKbefJx6JRczQBJT9m0MojIloWYBPwLgFqQizfc6dLIvcQixlmR63OP54BFe5XgS2b6KCQksU77f8bjs9mEyzVVViJM4pj2TriFyFkBRBr%2BrR0%2F3ZMI5DduGsYSMfsm8NPUl5cMW51iA3C3&X-Amz-Signature=3dfea2f01d35282c4f96492711e194520e0392dd24a3557f91bf214e47579bd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 2：用 xcodebuild 产出可用于打包的构建产物

```bash
cd /Users/chenwenkun/Downloads/androidandios/iosui/WebDriverAgent/WebDriverAgent

# 使用 xcodebuild 构建 WebDriverAgentRunner 用于测试
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath

# Apple Silicon（可选）显式指定 arm64
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath \
  -arch arm64
```

---

## 步骤 3：组装 Payload 并打包 ipa

```bash
cd /tmp/derivedDataPath
cd Build/Products/Release-iphoneos

# 创建 Payload 并复制 .app
mkdir Payload && cp -r *.app Payload

# 打包 ipa
zip -r WDA.ipa Payload
```

---

## 步骤 4：清理 Frameworks（关键）

进入：

`WebDriverAgentRunner-Runner.app/Frameworks`

把 **XC 开头的文件全部删掉**（按你原记录的踩坑经验）

（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQCUNLPU%2F20261109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261109T033525Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJHMEUCIQDr7d2m6ic61f5Ig8GGy1LCSTs8D4dc7W52%2FnN2NMcjVAIgQ8L3FO4VZJoF54Ai0bS48mNxzWht12o8y93bTp1wducq%2FwMIGxAAGgw2Mzc0MjMxODM4MDUiDBFqBUvqYAjRqRnFKCrcA2BlqaV%2BWY512XDDisKK7ZSwOrQPE1i4ThISLPgnNC2m%2BA0Ymb%2Fz58vOwzVJieMMP%2FzTm8i4ROTzDTSHFxE41qZsRLXXyt5pngQbDR0SFAajFwVVAIfU2SlKCvXrZ9X7QWquzp2GdEJ3IcjjHeEtPS%2BE%2FnChAehZ3JFwR%2BrhRNYBsat3UJZQMErk0EOPCkocAivWQFTO0UOjJQsIz61uJdoQ7X0QUM0uYGM0EH19wED1wQMAmHuxOvqxfPTxgrvDeCV0zLVBK%2BnI1GfK4SG2pCHHewOOLTsuZd9i%2BSFr1a2K%2Fh%2Fd7FfWEZZUYTcv3DBJMglTEU6k5QWrJqWkOaD8hLehqieC0la0hnW%2Br1XaLxc%2B0icR5s9NbWffYYlPJmooEone8c6pL0LdiQrSCn9qT7ldMBin6spWfxlb8hKIv0LVrrXRkcCO%2F7yBEfOmMsxy3iWX8eRPkwWEAHAdb9tnGoe5ALHgxAdLAzB2XfixL1eEJVqvyO%2B2FIcL1FXuQTlhILn6AaJLjDfquPyFgc6KnDLlV%2BDeUnRgIzjRgEKSJ6XPAi6kI1RBncm5%2BCuTs9jffz6wZOqjeQ5FI3athWqdZok%2B7dbOH5u4JLCW1m0ub3x3nSTt0l247XYG75WdMK3YxNcGOqUBioO2vCFAxvcI1pGAotxzC2%2BJyO7L%2B9weqia55rOLSi9w5dTUEfWq0kZMYOk%2FYs3lU2RbwXA7jSkbxCKbefJx6JRczQBJT9m0MojIloWYBPwLgFqQizfc6dLIvcQixlmR63OP54BFe5XgS2b6KCQksU77f8bjs9mEyzVVViJM4pj2TriFyFkBRBr%2BrR0%2F3ZMI5DduGsYSMfsm8NPUl5cMW51iA3C3&X-Amz-Signature=780871a152d1968b23ba85bfda8d17d868350b27680a83cc6fe981ce90bcc1e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 5：重签名（Re-sign）

使用工具进行重签名：

- iOS App Signer / App Resigner
- 你原文参考链接（保留）：  
产物：保存为 `WDA2.ipa`

（你记录里提到：个人开发者证书可用）

---

## 步骤 6：安装到真机（tidevice）

```bash
pip install tidevice

tidevice install WDA2.ipa
```

---

## 步骤 7：启动与验证

1. 手机上点击 WDA 图标启动
1. 浏览器打开：
- http://localhost:8100/status
出现一段 JSON 即正常。

---

## 附件（保留）

---

## 国内环境补充（你的原始备注整理）

如果需要把端口映射到电脑端进行访问/调试：

```bash
brew install --HEAD libimobiledevice
iproxy 8100 8100
```

然后在电脑端访问 `http://localhost:8100/status`。
