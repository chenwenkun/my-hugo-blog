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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UU43L6S4%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T204018Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJIMEYCIQCEYwfenVNEyQHKu815RmprDZKvBfkY81cqhp09%2FKFXLgIhAM5S1Z3nxwCta6N5wIvPVnxcBTKqUBJSUDRSrNOzRNZvKogECNT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyq9oBymLVed%2FPFy6Eq3AMOOBmDbs4JUw1034fT3bEfJBBS2aqwVKtV2KW3sqc3HAKVGygrbLxWMYUbKxCidr3H93HCirBAP%2BloaLkZfXd%2FEfjo63mxWH%2Bd35BJWofkJEslT5RcTXfHIdyPYruFQvVnJDd%2BBuAGR58HVqh7NJ1G2GolJQYH93YHyAtYxSEUYcudu42j6VfKqsSURfSw1CXUvSyp2ySDM6mhya8bLks%2B8%2Fk%2BkYxTYGr4oqR5qDnhb2RWSX0xj2L7nR2qgdM4gjItE1fi65jpvTx0yPeWB3Tx25Jz6hLdh1SQL0IuBevTtgh6Tg%2Bb2VZp6n3wW2HESc25abkkP3Q7SVfLwT7%2FNNn3EuxEzZ72Sq07wQk%2BUgXqRwjLNLWVOK0M3UR4muqtFfV9gjGxC9Rq4myiecXnTk11hKH6M7NmpoMTm6vfTbxfzVpmy0rnf1NLYCdLGOuuTRD5bfwQZ%2FbANIpiybzK4oZvKbtQZwrH7FXjn5Q5rqeEwRMfqnJytuaHP8XLSb%2Fzv%2BFJ%2FzQTuI%2FjGkZ8qEgdlZGpCEZvbGRVocWOuq5t4iZErgvo4TLYIhd7qB3BVYoGBrCFEgFRmgtvPrDxcLmL29Q3lsaM4Li%2BIUKP9f%2BUR0Ecx50TvJWfNCPnknOtEzDM0sTWBjqkAflRtVnapfKPnIWX2jJkLrPK53xEzClPWH05vgVyIZAHKQUH6hKzdlqpLYIe3tKZMA4KlkxICCnhl1fNyw6zY6Jt6In%2Fseaq72GS54Lni1LtFPHtwvLWIuqWQVw41ANe7211hikUo%2F2ewVS4548gLPc%2B%2Bm6h45jlwIY%2B9ge%2FS6EO2dbt%2FMBy%2BCnQOc9gGy00JRnRoYPnIfFu1Z%2FEgQcTQ4rIeEtg&X-Amz-Signature=fe415a1c652e95fdb14c1c99725847c055fb1786bf04df1088e8dcd206df3d01&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UU43L6S4%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T204019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJIMEYCIQCEYwfenVNEyQHKu815RmprDZKvBfkY81cqhp09%2FKFXLgIhAM5S1Z3nxwCta6N5wIvPVnxcBTKqUBJSUDRSrNOzRNZvKogECNT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyq9oBymLVed%2FPFy6Eq3AMOOBmDbs4JUw1034fT3bEfJBBS2aqwVKtV2KW3sqc3HAKVGygrbLxWMYUbKxCidr3H93HCirBAP%2BloaLkZfXd%2FEfjo63mxWH%2Bd35BJWofkJEslT5RcTXfHIdyPYruFQvVnJDd%2BBuAGR58HVqh7NJ1G2GolJQYH93YHyAtYxSEUYcudu42j6VfKqsSURfSw1CXUvSyp2ySDM6mhya8bLks%2B8%2Fk%2BkYxTYGr4oqR5qDnhb2RWSX0xj2L7nR2qgdM4gjItE1fi65jpvTx0yPeWB3Tx25Jz6hLdh1SQL0IuBevTtgh6Tg%2Bb2VZp6n3wW2HESc25abkkP3Q7SVfLwT7%2FNNn3EuxEzZ72Sq07wQk%2BUgXqRwjLNLWVOK0M3UR4muqtFfV9gjGxC9Rq4myiecXnTk11hKH6M7NmpoMTm6vfTbxfzVpmy0rnf1NLYCdLGOuuTRD5bfwQZ%2FbANIpiybzK4oZvKbtQZwrH7FXjn5Q5rqeEwRMfqnJytuaHP8XLSb%2Fzv%2BFJ%2FzQTuI%2FjGkZ8qEgdlZGpCEZvbGRVocWOuq5t4iZErgvo4TLYIhd7qB3BVYoGBrCFEgFRmgtvPrDxcLmL29Q3lsaM4Li%2BIUKP9f%2BUR0Ecx50TvJWfNCPnknOtEzDM0sTWBjqkAflRtVnapfKPnIWX2jJkLrPK53xEzClPWH05vgVyIZAHKQUH6hKzdlqpLYIe3tKZMA4KlkxICCnhl1fNyw6zY6Jt6In%2Fseaq72GS54Lni1LtFPHtwvLWIuqWQVw41ANe7211hikUo%2F2ewVS4548gLPc%2B%2Bm6h45jlwIY%2B9ge%2FS6EO2dbt%2FMBy%2BCnQOc9gGy00JRnRoYPnIfFu1Z%2FEgQcTQ4rIeEtg&X-Amz-Signature=368625f37e6201bc3bfbe96e8e41eea059dfba37901c5fc54592f94669ef5396&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
