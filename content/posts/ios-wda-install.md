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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KOLL4B3%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T020310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCY4qFnBpRSqTmb7V5ClkPPVAEDF9TiBedxyFiZMIx64wIgOJB63E2d7hG3RNMxjaBtLnGm95SoNdpsfmX9fbqs%2FGwqiAQIqf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBTfTeafRpCkCXXlVSrcA%2Bl2lGF5oRn508kpnPEog88IKGomfIdD%2Blyi4l0T8nDGumxO3bd6IKcJuqtDF%2BjKU1LICBDTD%2Fy%2BpArJfqJPvc%2BGoUL9rFSsn47acUufafi5FvFZBk54KCYqHRzRR8HkdM5pukNoSWkji6ZqYr01L7a%2BzJtuZGrWoJ0E1Js%2BZKB9zrwhLjBijqU4LMrvDfG%2FOaEuaWEUTKb3yPbSCb80xByckr2WpEQU4lkfOHPjNcSAyOIw4KSkYKOcENWlKvia76IfMI20QA8R4BkZNuxV%2FdX1Qp9EbqDMa5%2Bh5m0GoksN1CkJn4k0tLF6Z3XKiD2JF6PekkH2hiKWGN3fu5jnXOkCoW2tuRJa2ZKd3ttNK0zpwiUlDRUHxIsMqB%2B9if3ImAlPAWGjDbdEriWF2O7ZpDbRs8U9%2BI7GapD2B81BtsCyBrQYCWx3vRMcd%2BOoDFIEXJu1sAx0tWno5uO%2Bh6luWLW03oL54QKbF4eSNAjeOB0s0jYW9iYSesCMCpgQYhZgmHQv%2BtGNbdfJm4xEw0hLLZJxmQR2v9Bcu2R02uGx46XHTYEtx%2F9w0AaEfTqF7doKbmBq2x5zXdu4uneXIWUeutOZnA6Av78s5O5hOoIx9%2Buvs1eGqPHM85BWijYJMKytktUGOqUBki%2FnEVP7DOY88WsNxB2sPvFLawH%2FKYq7HTwPMubtcSHkM7%2FG%2B2WZOksFnXy8BrYDMxqQ4toQ2HHJA6loLlFmLSnMbOZISBG5SnFrLWQPkOeARxwLQzhEyFc2wuUQ0pkMa9gB0U3iJR4F2cfPgOjIUnVTylfRUqvUhjv7h7PpHBEmwXKrZqRJZdrq%2BCAHTzzxOqTmarzLLu%2Bh%2FgnJL%2FsIN5%2FMeGW3&X-Amz-Signature=84db5c94db94398ce97cdde572051b1b6fd258a5703c1aefe9cb8266d7c1fd76&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KOLL4B3%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T020310Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCY4qFnBpRSqTmb7V5ClkPPVAEDF9TiBedxyFiZMIx64wIgOJB63E2d7hG3RNMxjaBtLnGm95SoNdpsfmX9fbqs%2FGwqiAQIqf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBTfTeafRpCkCXXlVSrcA%2Bl2lGF5oRn508kpnPEog88IKGomfIdD%2Blyi4l0T8nDGumxO3bd6IKcJuqtDF%2BjKU1LICBDTD%2Fy%2BpArJfqJPvc%2BGoUL9rFSsn47acUufafi5FvFZBk54KCYqHRzRR8HkdM5pukNoSWkji6ZqYr01L7a%2BzJtuZGrWoJ0E1Js%2BZKB9zrwhLjBijqU4LMrvDfG%2FOaEuaWEUTKb3yPbSCb80xByckr2WpEQU4lkfOHPjNcSAyOIw4KSkYKOcENWlKvia76IfMI20QA8R4BkZNuxV%2FdX1Qp9EbqDMa5%2Bh5m0GoksN1CkJn4k0tLF6Z3XKiD2JF6PekkH2hiKWGN3fu5jnXOkCoW2tuRJa2ZKd3ttNK0zpwiUlDRUHxIsMqB%2B9if3ImAlPAWGjDbdEriWF2O7ZpDbRs8U9%2BI7GapD2B81BtsCyBrQYCWx3vRMcd%2BOoDFIEXJu1sAx0tWno5uO%2Bh6luWLW03oL54QKbF4eSNAjeOB0s0jYW9iYSesCMCpgQYhZgmHQv%2BtGNbdfJm4xEw0hLLZJxmQR2v9Bcu2R02uGx46XHTYEtx%2F9w0AaEfTqF7doKbmBq2x5zXdu4uneXIWUeutOZnA6Av78s5O5hOoIx9%2Buvs1eGqPHM85BWijYJMKytktUGOqUBki%2FnEVP7DOY88WsNxB2sPvFLawH%2FKYq7HTwPMubtcSHkM7%2FG%2B2WZOksFnXy8BrYDMxqQ4toQ2HHJA6loLlFmLSnMbOZISBG5SnFrLWQPkOeARxwLQzhEyFc2wuUQ0pkMa9gB0U3iJR4F2cfPgOjIUnVTylfRUqvUhjv7h7PpHBEmwXKrZqRJZdrq%2BCAHTzzxOqTmarzLLu%2Bh%2FgnJL%2FsIN5%2FMeGW3&X-Amz-Signature=a6c5a053dc784be6717285f358103efd71a6f5c8f40505aef98b99d74df7891d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
