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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RXFEQKKW%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T184553Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJIMEYCIQC%2BBeGiIZHhpPg8Edqh9k%2B7176KBzL%2FZTLdHepcnbxwnAIhAKo4opnYJCQy3BfiDunqN6FM0RYbMQ5EgVM1P%2FdpD9D%2BKogECNH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwIRDG6q8pW7K7MkJ8q3AMBCvkUaSWYOjaKeZGTX%2FsPqP0ekTxt%2BRiGvhMzALQDvHXrlobVvN2iw%2FGNY1tXXtUk4KO8MQjh2xcPmOh8dN1RVijVA1634T5FTKWEyUg0B2n8W3%2B%2FDrkhoX4eoMcZm1OL4pzHFTXf7M3RGMrc6249Ltlzwcntu2SYtLsziJ57RLl4bEJtGqE%2Bm7jW6%2BxyWPVtkVUnBjybQm%2B0j14V%2FC2ul60SQUHSRhGsMtYvAfqvDH4YYX0GuZI4PkBRlAiXmjLQmGrOUcWzqdSyOF%2FK0BG%2FBfEspP9qlBd7QAGqrMfVhDMnWHNn8MzSyih7jUb5%2Fl7sIMCdTAQr7m8gDikzFEvrq88E1T2j0FmfoMK84rlbV%2FmnWdpy9RUHcbffYhFnirK%2FBg0Y5CNAZylPKAcmkws0lqq%2FTJRvHf9OP1j7qg%2BlNd8Bvv2wDMWI1Q%2BrfC1UDVMBJvbPAp2bGJ2birT01B5Y8Pmvc7KM7OocvVlSh35qsLJGH9XH6EibP%2FBdlFnoiI6mmrtOAWWYcfiXm8E6HHzfZ3QkrK4xSz1R3rPFi%2B9JeIFEfkyfo%2Bb1Uocbrj57J1%2BuJXRVCgBZ4%2BnH6Vp6aTNHrjOcn4wfTHq7u5dxgO5APv1bmMCAJopOA71TmzCVs%2FLTBjqkAQkswxTNO1Vj0SrXXaXB07kmsplLnOVb4VRj38DUQq7GnE4wINH1skeO6yXZoPqMSPQEI4s3RdAbFviJlZ%2FaD%2FpYCHP8c%2FQNQgEbv0ljMSgAY0bnyPWSCGPZq4Ep0y2BFRkM%2Bwxs2oCsov1kmyi%2FweddwL%2FVpDuKgBnNDPkKi5VnQtofKdCHdSk1aF9FvRMHJE6%2BggRPsflpi3CWvxYGyD47JZu%2F&X-Amz-Signature=1d0a4607f46d54dbff3d5c37b904b650336ad67db5eb968d2772e2d7f0524c40&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RXFEQKKW%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T184554Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJIMEYCIQC%2BBeGiIZHhpPg8Edqh9k%2B7176KBzL%2FZTLdHepcnbxwnAIhAKo4opnYJCQy3BfiDunqN6FM0RYbMQ5EgVM1P%2FdpD9D%2BKogECNH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwIRDG6q8pW7K7MkJ8q3AMBCvkUaSWYOjaKeZGTX%2FsPqP0ekTxt%2BRiGvhMzALQDvHXrlobVvN2iw%2FGNY1tXXtUk4KO8MQjh2xcPmOh8dN1RVijVA1634T5FTKWEyUg0B2n8W3%2B%2FDrkhoX4eoMcZm1OL4pzHFTXf7M3RGMrc6249Ltlzwcntu2SYtLsziJ57RLl4bEJtGqE%2Bm7jW6%2BxyWPVtkVUnBjybQm%2B0j14V%2FC2ul60SQUHSRhGsMtYvAfqvDH4YYX0GuZI4PkBRlAiXmjLQmGrOUcWzqdSyOF%2FK0BG%2FBfEspP9qlBd7QAGqrMfVhDMnWHNn8MzSyih7jUb5%2Fl7sIMCdTAQr7m8gDikzFEvrq88E1T2j0FmfoMK84rlbV%2FmnWdpy9RUHcbffYhFnirK%2FBg0Y5CNAZylPKAcmkws0lqq%2FTJRvHf9OP1j7qg%2BlNd8Bvv2wDMWI1Q%2BrfC1UDVMBJvbPAp2bGJ2birT01B5Y8Pmvc7KM7OocvVlSh35qsLJGH9XH6EibP%2FBdlFnoiI6mmrtOAWWYcfiXm8E6HHzfZ3QkrK4xSz1R3rPFi%2B9JeIFEfkyfo%2Bb1Uocbrj57J1%2BuJXRVCgBZ4%2BnH6Vp6aTNHrjOcn4wfTHq7u5dxgO5APv1bmMCAJopOA71TmzCVs%2FLTBjqkAQkswxTNO1Vj0SrXXaXB07kmsplLnOVb4VRj38DUQq7GnE4wINH1skeO6yXZoPqMSPQEI4s3RdAbFviJlZ%2FaD%2FpYCHP8c%2FQNQgEbv0ljMSgAY0bnyPWSCGPZq4Ep0y2BFRkM%2Bwxs2oCsov1kmyi%2FweddwL%2FVpDuKgBnNDPkKi5VnQtofKdCHdSk1aF9FvRMHJE6%2BggRPsflpi3CWvxYGyD47JZu%2F&X-Amz-Signature=6162904872998259cd23815e42bb5cb0995d464a1d4a8ce91cafb5a65493681e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
