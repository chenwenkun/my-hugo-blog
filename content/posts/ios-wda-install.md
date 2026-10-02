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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X7QQ7U3K%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T113245Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCcbZLmo0cYKy%2B5NVZdDFnnZGCYJxnSt6C4jMlhpG%2FTMQIhALJO726zivky7eFnBri%2F%2BMnQgFbTLfconurCFw1CQohDKogECJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxgGsJ7vqsPs2Dx2Ikq3AN8cekVPyzGmEZGXFrJ5vxPvWGg3v%2F%2Ba%2FACwPQQEBHJ77QCQvcoQBqd3focmwvmxvqdBTcx2syWQ7uUG1rtEV3zAuhZKPFj4vHz893ipnaAO7vcxPgaYtw6j%2FKGub1yqCwdaMoL2BrrFC79CVLwXC3FJ3WneGDWoZLsBSA1XJeFjQ6bsk3r6PTHooT3mJ6%2F0IJ6ICeopTa71K0U1gI6ePQOHwxr2OYcgc8He99D0WvxWsiXCwiffJAnDmQ40S0ipmnFjAUdQ8jQDE%2Bux6QEJZTXRu2C63trrbn6jkNnuD85ITnBUf3DNcZlLOETyLptP1bvrvg8r8UXut1Yo2vZG6uK%2FQJBssIdSr4uXV9sxKAeoW2ZhPIE3GLXuqxYu%2FJbxLzubpkiRyXYA0gUf0TwsNDck368aSADY7C7X3ldq3qx0rhoST7UupB2BF%2F6vwx3YerJBtD4BwiXqJAIwqWcZFSERSceiDwlcwV9aLtsfAV1XUwEcyAvQW7bVMmXlSN0n%2FklLnydTwrUnGk8aFmQj%2FnaljJ0%2BiLoUbOqYZUM37uN5lRyyaSCukOMB2HEMiis2Xx20jXu02iPbCcWHJCY304njUGhpGPv%2F2dNae2v03rjzlHBFYr9mXUtE9JMfTCx%2Bf3VBjqkASAbiWxHh67ExU8tzgZZ%2F4ccxiiWlcAWR4AX%2BsFKj37NTAuDWG%2BIn8HNr1d9n4dCh%2BC1Fp1c245r59%2BFCwmGk73F9EVrjb03MtR8caJYA1UlDLugpiX%2FAQQdQulYgOloHqND4X0%2FNgPgHhGib%2BnQzDvX0QDgVWMCMmc0tfwmKpeuUfj6dQFbIvRVl28dBMla%2FjO1wOckknb7oQBWST0ER3Dtr19e&X-Amz-Signature=021be77b59abf37f4a813916fdcfe9e8e75a952799ee25b06482e55c96971181&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X7QQ7U3K%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T113246Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCcbZLmo0cYKy%2B5NVZdDFnnZGCYJxnSt6C4jMlhpG%2FTMQIhALJO726zivky7eFnBri%2F%2BMnQgFbTLfconurCFw1CQohDKogECJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxgGsJ7vqsPs2Dx2Ikq3AN8cekVPyzGmEZGXFrJ5vxPvWGg3v%2F%2Ba%2FACwPQQEBHJ77QCQvcoQBqd3focmwvmxvqdBTcx2syWQ7uUG1rtEV3zAuhZKPFj4vHz893ipnaAO7vcxPgaYtw6j%2FKGub1yqCwdaMoL2BrrFC79CVLwXC3FJ3WneGDWoZLsBSA1XJeFjQ6bsk3r6PTHooT3mJ6%2F0IJ6ICeopTa71K0U1gI6ePQOHwxr2OYcgc8He99D0WvxWsiXCwiffJAnDmQ40S0ipmnFjAUdQ8jQDE%2Bux6QEJZTXRu2C63trrbn6jkNnuD85ITnBUf3DNcZlLOETyLptP1bvrvg8r8UXut1Yo2vZG6uK%2FQJBssIdSr4uXV9sxKAeoW2ZhPIE3GLXuqxYu%2FJbxLzubpkiRyXYA0gUf0TwsNDck368aSADY7C7X3ldq3qx0rhoST7UupB2BF%2F6vwx3YerJBtD4BwiXqJAIwqWcZFSERSceiDwlcwV9aLtsfAV1XUwEcyAvQW7bVMmXlSN0n%2FklLnydTwrUnGk8aFmQj%2FnaljJ0%2BiLoUbOqYZUM37uN5lRyyaSCukOMB2HEMiis2Xx20jXu02iPbCcWHJCY304njUGhpGPv%2F2dNae2v03rjzlHBFYr9mXUtE9JMfTCx%2Bf3VBjqkASAbiWxHh67ExU8tzgZZ%2F4ccxiiWlcAWR4AX%2BsFKj37NTAuDWG%2BIn8HNr1d9n4dCh%2BC1Fp1c245r59%2BFCwmGk73F9EVrjb03MtR8caJYA1UlDLugpiX%2FAQQdQulYgOloHqND4X0%2FNgPgHhGib%2BnQzDvX0QDgVWMCMmc0tfwmKpeuUfj6dQFbIvRVl28dBMla%2FjO1wOckknb7oQBWST0ER3Dtr19e&X-Amz-Signature=91c48ba72ddf6edb55ec85ac6452a70447cbd377392543256a7038b66cdd1e22&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
