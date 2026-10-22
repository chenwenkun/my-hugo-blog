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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGJDEY4M%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T205730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDpHFkj%2Bd82EdUodi2FsRclZDy74625DfH4XZaxhu3WiAIhAOSGn%2FnfetyMzSBfWmdoHrWe6O00GGnkLi7%2F2XWQK2G3Kv8DCHsQABoMNjM3NDIzMTgzODA1Igyx5%2Bz2X77jDYj0MQgq3ANL9OAq8Zsu7VtjhBSebh%2Byx67MsHHT6C55CMEr0szliKDFOrLePeO80DqlebSm0JbiLIUHU6kBRu1LjDQe61N2WW90ErJ8YhEP1hAyga07ASMYQWnC6%2FESFYEpLtkHhTDzGy8fi2PnloHleeCFNcJlqtGkg%2Bt1rBh1cfdypECYLb7Us%2B1%2FueBDi0WaK4KcSx70v0Kqn%2FPLo%2BbnM%2FbFi1j99sI4a0Ozg2gPyctPJtSFPxai%2By3tmxi%2FSKPQKZB1oPi05D5%2BPQXkXwHPMJdl6HV%2BvW9%2FrazFfjOI%2Bxs8yH9Y8kIu6d2BjbOgE5veJ9rHwFQRykBZCbvPDHJSlze1JdKH4seDbTcQEL6J9whwOiv3NG0XdKcAobobqYfnrHbjrRKt9szGBRrnn20vdLWbA5QzAJ2x3beVW8vhw9RTI2MilCnzlXqtr6DpAJQdugNbhrDbJMoi3nLXFMTfC2sHKPMEa%2BB1EJ87ozQc8pOIbdbKQftdbGgRaS1hcP1RY9T48svDh4e6c1V%2F19ms5Bu26gloF3Fqn9qVy6AnlK0OEEh84Mz%2FqjRpG7OvFRMoqecD28QHWR1h1znyYDKvNknNno4I9gU4boapd%2FrRW3In9wZVDLyyupaOt2e5xyKGOTDOuOnWBjqkAYVnijwSOJaasU9In7T3%2F4gXm14Ec4pznK5Ow0o34WDUByQgqdHdVBr54ZlrWDzuVf%2Fbzg8vzTb55XAEiD5TrFuIr174SiTS0QhDEDv0j7Ccflri8yIE04Nl6QL798OFap8Coxq0%2BpbsfLC%2F7LW%2B5LZQ%2FeLxnXT%2FWyHTu%2BxqEkaW2xLXN3jrz51btBTKeo5POjAQZ6mdnooxf0SQHZ%2F2TGDo3Bro&X-Amz-Signature=03574f2ba2013451c48c67e4cf14a46e69b8e3bc01536f454c4cdc9389f18e49&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGJDEY4M%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T205730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDpHFkj%2Bd82EdUodi2FsRclZDy74625DfH4XZaxhu3WiAIhAOSGn%2FnfetyMzSBfWmdoHrWe6O00GGnkLi7%2F2XWQK2G3Kv8DCHsQABoMNjM3NDIzMTgzODA1Igyx5%2Bz2X77jDYj0MQgq3ANL9OAq8Zsu7VtjhBSebh%2Byx67MsHHT6C55CMEr0szliKDFOrLePeO80DqlebSm0JbiLIUHU6kBRu1LjDQe61N2WW90ErJ8YhEP1hAyga07ASMYQWnC6%2FESFYEpLtkHhTDzGy8fi2PnloHleeCFNcJlqtGkg%2Bt1rBh1cfdypECYLb7Us%2B1%2FueBDi0WaK4KcSx70v0Kqn%2FPLo%2BbnM%2FbFi1j99sI4a0Ozg2gPyctPJtSFPxai%2By3tmxi%2FSKPQKZB1oPi05D5%2BPQXkXwHPMJdl6HV%2BvW9%2FrazFfjOI%2Bxs8yH9Y8kIu6d2BjbOgE5veJ9rHwFQRykBZCbvPDHJSlze1JdKH4seDbTcQEL6J9whwOiv3NG0XdKcAobobqYfnrHbjrRKt9szGBRrnn20vdLWbA5QzAJ2x3beVW8vhw9RTI2MilCnzlXqtr6DpAJQdugNbhrDbJMoi3nLXFMTfC2sHKPMEa%2BB1EJ87ozQc8pOIbdbKQftdbGgRaS1hcP1RY9T48svDh4e6c1V%2F19ms5Bu26gloF3Fqn9qVy6AnlK0OEEh84Mz%2FqjRpG7OvFRMoqecD28QHWR1h1znyYDKvNknNno4I9gU4boapd%2FrRW3In9wZVDLyyupaOt2e5xyKGOTDOuOnWBjqkAYVnijwSOJaasU9In7T3%2F4gXm14Ec4pznK5Ow0o34WDUByQgqdHdVBr54ZlrWDzuVf%2Fbzg8vzTb55XAEiD5TrFuIr174SiTS0QhDEDv0j7Ccflri8yIE04Nl6QL798OFap8Coxq0%2BpbsfLC%2F7LW%2B5LZQ%2FeLxnXT%2FWyHTu%2BxqEkaW2xLXN3jrz51btBTKeo5POjAQZ6mdnooxf0SQHZ%2F2TGDo3Bro&X-Amz-Signature=ece813090babc5536ad274056172efa173a5727063141a258c291f8e8c5cd8b4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
