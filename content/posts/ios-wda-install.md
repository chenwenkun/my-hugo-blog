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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NKQMQE4%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T161503Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDp4Wp0WegcjEKc8%2F7I9DWyr98hQZkbifGb7Miu%2Bwd7zgIgNEecvzmrsr%2FS1gaNio2%2BRhd%2BcJpV8jhRiK6vdt1isDoq%2FwMIdxAAGgw2Mzc0MjMxODM4MDUiDDxqntR8P9sQ1YEClircAx8WytwFIOE%2FgfNlnG36lLEsGJH057M1urlzZgOA8BNIxw%2F%2FEbsH9s4UeLDHTSSbKqmZ9weI6pGzQphVWhZ3xIOAJ%2F8ddVZDeYL3cM7yFmbOVwu9sSH65OdIzdrEYDsNBT2wHvWRHipfdHdzC8IkHG38Wl8qfNE8LE0g%2BSKtOb0AgDNACgVxDidKgs382qLj0UsurKOwdOpPr36GL0ZtqbY6YnHCR6CqBB8E%2FhXfdShT2k3vW1AYoJC6LAdWl02qtIHyS6o5ObMaND0qB%2Beh7ZMbkLFc6f36JHvrDiMBmgKfMF2eqdpLyVu1tWUQquQAat5Yx%2Fg4Cyencxtxoh2YaXhdi9wWI65bNop8j%2BUHLmEgrYUg5C%2Fbh6y9FIbhaYKCjdKDvgzNNKV3UOAtsYm5Yx%2Bpwmbn4Gz5DzNlblT7JsqAYFlmwfHuf3%2FfopAmh0BE6N3RpbHCipjDugnAnyaJ5OoLD3f4Zqi%2FrYgJnwIHOOm%2BbVZu8vLW4HlGmAxzvW1mbynKKZgjpL6YkovTXJ8fKaCUAYmepZPWT9lD0TWgPYnYKG8BHli9lRmdqCzm%2BXT716lgjmQA%2BtYMWtMNV0QziBUub3MAdnU0FWFXVZ5B%2BDgGflAHdpvVElwWgCsDMODD6NYGOqUBAnW%2FnRZKemQZTs4ySNSq4gKd%2F0NAFawUJpa52OHxaEfGLEMRLInJxgZSWtECKoxz0598cNeurx1ua1U%2FZuj136h%2FohLy00j%2FMhcxoSVw3HSMcgrtbROPje5SxiKF4cRBZN4N3hIskYNORgOMKSDyyYwAA1uLsLeUe3GS%2B5NqQtcPPSeRTjOnhVj5I1BoHjny4ojejItVGmBA3K32ayUJ3fbAw6ol&X-Amz-Signature=09372becfbba0b2464d525ae1c94cdbd0c4b69a2e0c9826999eea87bb89dd776&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NKQMQE4%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T161503Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDp4Wp0WegcjEKc8%2F7I9DWyr98hQZkbifGb7Miu%2Bwd7zgIgNEecvzmrsr%2FS1gaNio2%2BRhd%2BcJpV8jhRiK6vdt1isDoq%2FwMIdxAAGgw2Mzc0MjMxODM4MDUiDDxqntR8P9sQ1YEClircAx8WytwFIOE%2FgfNlnG36lLEsGJH057M1urlzZgOA8BNIxw%2F%2FEbsH9s4UeLDHTSSbKqmZ9weI6pGzQphVWhZ3xIOAJ%2F8ddVZDeYL3cM7yFmbOVwu9sSH65OdIzdrEYDsNBT2wHvWRHipfdHdzC8IkHG38Wl8qfNE8LE0g%2BSKtOb0AgDNACgVxDidKgs382qLj0UsurKOwdOpPr36GL0ZtqbY6YnHCR6CqBB8E%2FhXfdShT2k3vW1AYoJC6LAdWl02qtIHyS6o5ObMaND0qB%2Beh7ZMbkLFc6f36JHvrDiMBmgKfMF2eqdpLyVu1tWUQquQAat5Yx%2Fg4Cyencxtxoh2YaXhdi9wWI65bNop8j%2BUHLmEgrYUg5C%2Fbh6y9FIbhaYKCjdKDvgzNNKV3UOAtsYm5Yx%2Bpwmbn4Gz5DzNlblT7JsqAYFlmwfHuf3%2FfopAmh0BE6N3RpbHCipjDugnAnyaJ5OoLD3f4Zqi%2FrYgJnwIHOOm%2BbVZu8vLW4HlGmAxzvW1mbynKKZgjpL6YkovTXJ8fKaCUAYmepZPWT9lD0TWgPYnYKG8BHli9lRmdqCzm%2BXT716lgjmQA%2BtYMWtMNV0QziBUub3MAdnU0FWFXVZ5B%2BDgGflAHdpvVElwWgCsDMODD6NYGOqUBAnW%2FnRZKemQZTs4ySNSq4gKd%2F0NAFawUJpa52OHxaEfGLEMRLInJxgZSWtECKoxz0598cNeurx1ua1U%2FZuj136h%2FohLy00j%2FMhcxoSVw3HSMcgrtbROPje5SxiKF4cRBZN4N3hIskYNORgOMKSDyyYwAA1uLsLeUe3GS%2B5NqQtcPPSeRTjOnhVj5I1BoHjny4ojejItVGmBA3K32ayUJ3fbAw6ol&X-Amz-Signature=a88a55b4419c40b716c855533688ad88f9d2729cd9ed622185618abd66274574&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
