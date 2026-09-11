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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46623KQVAD3%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T201113Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBPZS0RHh%2BAN0Ruz4H%2FGFPuVX5FTPNXmyy%2FWS7P%2FCS9ZAiA8t1lR6MOh90fwZjlSvnLlr8K7PKfVsKl3D%2B7yZtbNZSqIBAil%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMLilBejfuHCUP83AJKtwDl7nCagxwTkDql97jmbcOkuqnVALcpLLc%2Bh2HMDQlWqCHkLf29QYjR2uMrcEpwIE9ORenl%2BPv%2BHeZ8Cd2tIPaO4Xl0RvaeqEC4%2BJvgtQYlqK5jn6YFPhszYK7KCBvBsmuvZy3lrG5WC4lwODHO6JoEuLh0Ekl5NVh4GrDTs9kRUmgx6N67lsvDxIl5hrfy7smpnRCVtl5DkuW3DI3AiU2XeEC2wbAtHqePVZsoJPcl6hLWLNXRYDwdaLl6jUfIOlbPh%2FBpvCOq65DPAYMi3Y7VTx%2BiooqHBBIj%2FKWd6q797iWBBIM7cmAWOjtQcturf%2BRslSF7WTsODfsVvrMq2LUsSOB059Sl4BHpDetAyvC%2B6Gvx%2F4YorHr7xZf5PwdgOo0C%2BhL68iSoUvQR1FRUKtTruEqoOUInN2Xg%2BfdB4hJMKf3wzf66%2BzZeQC%2BEYhJvHtv1Vhq%2FBpvslC%2F3XJLMNyjNTHwtu5C9c%2BEvSrLHaFsm%2F3WUjefXNFvcqWK%2BQwxMOSLqBYHTtKA5I%2FpOGlYurTN%2Fy%2F6uXMS%2BPga%2BEysQqWu9aTGvR96SPRxhvrhe40dfigoW6uv5AhLnsK9VQtON9GCQSRobNEe57wc2mik5eYg0yeOPn6ZcCtveo3qriIwxbCR1QY6pgFKoq2NC7dVrmyfwaU9ml%2FxzwMMN1K6uzmEouqTCg8VYEQfIOy3O5xNJnz3Lji2781A27bVC0AJp0DqtdonztKARW1h9rftWR96PY8shyowzt%2B31zToAv1J%2BPu5z6qsm6WtUDnk2tPNJrr1MpE1BOmB1uBIs834kaXmSSl1dmMs76bcNSE8KpleqjYiNlW77OrY0en2AH62YKP%2F95x%2BzjUCupUhzVQi&X-Amz-Signature=5f5e3b803fc4a4f8aa70f8a53500d95070d7f27dd33d6a845e9fbf04d3507d4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46623KQVAD3%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T201113Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBPZS0RHh%2BAN0Ruz4H%2FGFPuVX5FTPNXmyy%2FWS7P%2FCS9ZAiA8t1lR6MOh90fwZjlSvnLlr8K7PKfVsKl3D%2B7yZtbNZSqIBAil%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMLilBejfuHCUP83AJKtwDl7nCagxwTkDql97jmbcOkuqnVALcpLLc%2Bh2HMDQlWqCHkLf29QYjR2uMrcEpwIE9ORenl%2BPv%2BHeZ8Cd2tIPaO4Xl0RvaeqEC4%2BJvgtQYlqK5jn6YFPhszYK7KCBvBsmuvZy3lrG5WC4lwODHO6JoEuLh0Ekl5NVh4GrDTs9kRUmgx6N67lsvDxIl5hrfy7smpnRCVtl5DkuW3DI3AiU2XeEC2wbAtHqePVZsoJPcl6hLWLNXRYDwdaLl6jUfIOlbPh%2FBpvCOq65DPAYMi3Y7VTx%2BiooqHBBIj%2FKWd6q797iWBBIM7cmAWOjtQcturf%2BRslSF7WTsODfsVvrMq2LUsSOB059Sl4BHpDetAyvC%2B6Gvx%2F4YorHr7xZf5PwdgOo0C%2BhL68iSoUvQR1FRUKtTruEqoOUInN2Xg%2BfdB4hJMKf3wzf66%2BzZeQC%2BEYhJvHtv1Vhq%2FBpvslC%2F3XJLMNyjNTHwtu5C9c%2BEvSrLHaFsm%2F3WUjefXNFvcqWK%2BQwxMOSLqBYHTtKA5I%2FpOGlYurTN%2Fy%2F6uXMS%2BPga%2BEysQqWu9aTGvR96SPRxhvrhe40dfigoW6uv5AhLnsK9VQtON9GCQSRobNEe57wc2mik5eYg0yeOPn6ZcCtveo3qriIwxbCR1QY6pgFKoq2NC7dVrmyfwaU9ml%2FxzwMMN1K6uzmEouqTCg8VYEQfIOy3O5xNJnz3Lji2781A27bVC0AJp0DqtdonztKARW1h9rftWR96PY8shyowzt%2B31zToAv1J%2BPu5z6qsm6WtUDnk2tPNJrr1MpE1BOmB1uBIs834kaXmSSl1dmMs76bcNSE8KpleqjYiNlW77OrY0en2AH62YKP%2F95x%2BzjUCupUhzVQi&X-Amz-Signature=b800efb5d86b8403d0a46e730f6024e62c8df722eb96ebc6a6ca7c3b2283f5f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
