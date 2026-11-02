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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y5PZ2ZPY%2F20261102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261102T140752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC4%2F3H4DLGGNtqf0gDnLkMcvTNQQUBx%2Fa8ks6YGvzUqSAIgc%2FLALuQ2FR16ZDjJkhywcaIBxK3zED67xzZU2sGnU4Yq%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDOSZeoIxuL%2FW%2BbzBWCrcA2G%2FfIoagu6ODscTj5kC%2FFetCXFj8i3smR3fCeME7ZjUNHJaG2zC2if7qQb4%2FoPUpeq7SmCSfqREhOV3OTHyZ0BpW4f648L9jwz2Yg5Hi4U9YNo%2FfhI%2BGd1geARTjW%2BaxK1SudD4QJ0HiQqgYnDYPw%2FegU7LXzwcm1Hghp%2FOPHFxn2zdDi8i25ouhvoYcxoklPOPXmQyeTHpaJW40P4aDNbHbPEwwd8H%2FdKroTZA%2BewAYdQC6XH9uO%2BHQaYHuO8lOdfrg38W8zrVwCrbmmet3EueKcTo5zU1DomsJC5vUSb%2BDmVAnEDdVQKta%2BOxJ7azlgN8V%2B4j6SNkDczaLoGhCLz3SWCh7ctC283GtOdu%2BA5goZOoRRk9mXBF1zx28cP2odYHxOsjwcRQLzmw166H%2FgPczBEm4gIMjat4ftg811lUEEaL5FwSapiJq%2F0xFchnQKwDL8vsmxZAm1dNIRR36M6kVk%2F0AlU1p4kzwWxvrmnlyKaLaSraLroo7zrP69Jds7gC3G%2BOr%2FI8RFrFfm8hb2sdg5Pro48rF982jYvSml59us4jr2VBYBGAYMrvXUgsyMAYenA1HIiZ94O9D1DCzr9XB9r3ZoVZsQftNjQvfVqOem04nDBW7VkncNa8MP%2BDotcGOqUBgTVJwPFwRMMAnPtiGDIcvS84YaPedwkH1Sg44NV082tCsPY56XjBikJeDCJJUO35nfd%2FaSSNdgdDdAHynaosY%2BVLIE%2B6vxnokaOy5Nc3vo9RykS20Z8KrIHN3aygar2OH80wr2SoI%2FqITsp0p8NR2EL%2BbxmPmmjF42I33ueWtzmxwDxkhHLyuLtH0T0%2BwIyyaalw4OfKBiy9WvZLkz%2FA%2FiR2zzcM&X-Amz-Signature=98bc439118554b31ce3dfb404b61830dec080ccc32db4fb5424a07308411fa87&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y5PZ2ZPY%2F20261102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261102T140752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC4%2F3H4DLGGNtqf0gDnLkMcvTNQQUBx%2Fa8ks6YGvzUqSAIgc%2FLALuQ2FR16ZDjJkhywcaIBxK3zED67xzZU2sGnU4Yq%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDOSZeoIxuL%2FW%2BbzBWCrcA2G%2FfIoagu6ODscTj5kC%2FFetCXFj8i3smR3fCeME7ZjUNHJaG2zC2if7qQb4%2FoPUpeq7SmCSfqREhOV3OTHyZ0BpW4f648L9jwz2Yg5Hi4U9YNo%2FfhI%2BGd1geARTjW%2BaxK1SudD4QJ0HiQqgYnDYPw%2FegU7LXzwcm1Hghp%2FOPHFxn2zdDi8i25ouhvoYcxoklPOPXmQyeTHpaJW40P4aDNbHbPEwwd8H%2FdKroTZA%2BewAYdQC6XH9uO%2BHQaYHuO8lOdfrg38W8zrVwCrbmmet3EueKcTo5zU1DomsJC5vUSb%2BDmVAnEDdVQKta%2BOxJ7azlgN8V%2B4j6SNkDczaLoGhCLz3SWCh7ctC283GtOdu%2BA5goZOoRRk9mXBF1zx28cP2odYHxOsjwcRQLzmw166H%2FgPczBEm4gIMjat4ftg811lUEEaL5FwSapiJq%2F0xFchnQKwDL8vsmxZAm1dNIRR36M6kVk%2F0AlU1p4kzwWxvrmnlyKaLaSraLroo7zrP69Jds7gC3G%2BOr%2FI8RFrFfm8hb2sdg5Pro48rF982jYvSml59us4jr2VBYBGAYMrvXUgsyMAYenA1HIiZ94O9D1DCzr9XB9r3ZoVZsQftNjQvfVqOem04nDBW7VkncNa8MP%2BDotcGOqUBgTVJwPFwRMMAnPtiGDIcvS84YaPedwkH1Sg44NV082tCsPY56XjBikJeDCJJUO35nfd%2FaSSNdgdDdAHynaosY%2BVLIE%2B6vxnokaOy5Nc3vo9RykS20Z8KrIHN3aygar2OH80wr2SoI%2FqITsp0p8NR2EL%2BbxmPmmjF42I33ueWtzmxwDxkhHLyuLtH0T0%2BwIyyaalw4OfKBiy9WvZLkz%2FA%2FiR2zzcM&X-Amz-Signature=a0917399bd8ed0e9969bb779485567d9fb06bd734c1eb455c5f615e2b38305bc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
