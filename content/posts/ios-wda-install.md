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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPYHPHGZ%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T211144Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFhbT0hWP%2Fun6X2SXxRv2Et92mknE63gda10vANhv4bZAiEA8X0LN7O2DVTssEPs%2B4NMZovzIqWSudg2EPDy0qtZP4Mq%2FwMIdRAAGgw2Mzc0MjMxODM4MDUiDIlUF7mOEsesIFSY7yrcA2nItBpyQ8MMzoCskpqcXWf%2BQ9d9V%2FLXagAYB7m3KxSt4EoKHfazHvCEH7vsvgdBcCQOkzpj8xznLAQA7zzIyarpvLlRKavpkgIIYFfNSjthoVlmBmY%2FtPatNq5pMmvdoBl3Caju3Nq1kjD8r25FFOZ6jgDfI0cX2oPBV3d7Qpwfe9gKYWqVL3cHN1mCPyJFnTttL1vRXJX2AfNxMIM3FhbF6E2oF%2FjVmWBkQBz%2F75Zkeruq32o3RJD8ot%2FYTb8y45exrWlDLZ1WepRQCtj4BX3uVzC6O122gmPNknWLo7f8kHEACEvFvjq7WeSD%2BbDFvnjM4e2whr7WEQGvpJ2JJBTzQU8otCAvvdTApIZRgWWhYu%2BJXvcCO64mom73Z2OJlQg800KvDNtrwzrjFcEzezJEdz9bH7NguSox4BoNFGnvG83YuzbOT%2FzgHxWoLHRtcceiPTsnWkRjd7DFlIhP%2Fro%2Fnjhxsxk%2FfoSfQJ36TP36QunTPhgMDukuMzuD%2Bps5%2Bgc2uXNRJUDLYvTdtccj9EEFUzxHZ3eo3C1yIq2Tn2DMEhU%2B%2BFapOwPNiFgabFALZnNo%2FST4K6b6fLvf%2B6iGHmbfYknSK20MicXccqydE7ydbYFvQIELyIW85hv6MP%2Frr9YGOqUBQXKvdpW%2F%2BINz1A3DyPTP%2BNICZ3onrRsQMh7PALEDvAS1ZodR4pSCK5HF713BTIM2dZwqQh%2Bzm42Bmq%2FJ5LjrpDIM1yYbVEoDkhC%2Bmwp8agoUEDvC4FVOaW1ynWlYFqqdF84%2FnjsTtlE3OfSGeVBtcRE1BRpXEtsdXTk166ijSWdm6eQ9ZTEJGLNh2sKw%2FTXelN%2BBQ12Vq5KQQrgoXYlkyC3lkQg5&X-Amz-Signature=8ea76166d513c6f771eee0bcc15c3957eaca7304ed628ade9fdfd910e758cc0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RPYHPHGZ%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T211145Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFhbT0hWP%2Fun6X2SXxRv2Et92mknE63gda10vANhv4bZAiEA8X0LN7O2DVTssEPs%2B4NMZovzIqWSudg2EPDy0qtZP4Mq%2FwMIdRAAGgw2Mzc0MjMxODM4MDUiDIlUF7mOEsesIFSY7yrcA2nItBpyQ8MMzoCskpqcXWf%2BQ9d9V%2FLXagAYB7m3KxSt4EoKHfazHvCEH7vsvgdBcCQOkzpj8xznLAQA7zzIyarpvLlRKavpkgIIYFfNSjthoVlmBmY%2FtPatNq5pMmvdoBl3Caju3Nq1kjD8r25FFOZ6jgDfI0cX2oPBV3d7Qpwfe9gKYWqVL3cHN1mCPyJFnTttL1vRXJX2AfNxMIM3FhbF6E2oF%2FjVmWBkQBz%2F75Zkeruq32o3RJD8ot%2FYTb8y45exrWlDLZ1WepRQCtj4BX3uVzC6O122gmPNknWLo7f8kHEACEvFvjq7WeSD%2BbDFvnjM4e2whr7WEQGvpJ2JJBTzQU8otCAvvdTApIZRgWWhYu%2BJXvcCO64mom73Z2OJlQg800KvDNtrwzrjFcEzezJEdz9bH7NguSox4BoNFGnvG83YuzbOT%2FzgHxWoLHRtcceiPTsnWkRjd7DFlIhP%2Fro%2Fnjhxsxk%2FfoSfQJ36TP36QunTPhgMDukuMzuD%2Bps5%2Bgc2uXNRJUDLYvTdtccj9EEFUzxHZ3eo3C1yIq2Tn2DMEhU%2B%2BFapOwPNiFgabFALZnNo%2FST4K6b6fLvf%2B6iGHmbfYknSK20MicXccqydE7ydbYFvQIELyIW85hv6MP%2Frr9YGOqUBQXKvdpW%2F%2BINz1A3DyPTP%2BNICZ3onrRsQMh7PALEDvAS1ZodR4pSCK5HF713BTIM2dZwqQh%2Bzm42Bmq%2FJ5LjrpDIM1yYbVEoDkhC%2Bmwp8agoUEDvC4FVOaW1ynWlYFqqdF84%2FnjsTtlE3OfSGeVBtcRE1BRpXEtsdXTk166ijSWdm6eQ9ZTEJGLNh2sKw%2FTXelN%2BBQ12Vq5KQQrgoXYlkyC3lkQg5&X-Amz-Signature=455b106959aade7ff1700afa4d60894526a7fa72b1578387dca62c95f50280c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
