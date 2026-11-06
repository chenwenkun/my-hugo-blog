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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ETUQAIF%2F20261106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261106T223005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJIMEYCIQCdl0cOoBX6c6rdnByFtUhdCSOnees83yQZeiMrZ5pyrQIhAO3gklXt2OBHyq8PeycgzcLvzfqA9fTIMhDZciaYTQO3KogECOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxI3qE866m1i7kP%2BO4q3AMjDL%2BhOiqiXib8an1HD%2B1L%2BKyj96M8pqyGsnSc3I6%2By7Qpq4Y0a3VOvTgufjudp9yBmJtSXpfjOddCNp2oNkx6tFyGdv8mOFzxxPYmBEt%2BdqLWRpZdPnKOFM0t3tADMABYjmanA9eAigxD21GcdCsalG%2Fx49em9gmvEGn113WxMm2RzK9YWW0melkhb%2B3pO1aSSX9maWhJYYhzbuw%2Fz9s9yWS0hsFeBwcpTdjcsRmk5Fki7oOp1zx9PyLENt4XbOdlHVCNZBoSC59Xbw%2Bnqaw%2BHZe7CiYUmQtTWgZXAPYX6v%2BdvXL%2BMqTbhlKWZQslXgUKXREeNh2gaou84OwqOL7tCN1lcy4fvqxq0KKtGZhj9olDhTosGkNa7OG90vszKPa2kq%2FMZPEUptrEt9l4FXL4ZdWEdqpsGSMkoI1B3GdBjcxnrAEcOUtkRoPnxB9h3y9UkRHQv6SCVbH6vZtQchPJ65wQzMsnW53NrmKqetRdGHLGd49uK4Ecgq9Z%2B9cpWMZbs67eyKegAV6O9mB%2ByH2FdYWAxBATAGF4L8ck6UEzaIQG50UvecLzQeH1vm1Yu%2BLzNtIJ%2FU9lFwy903I72zqngYUgWvT6wJs%2BmFfzd0Nmh%2F8FFmcJjD%2BB5zTwKjDH8rjXBjqkAWMGpstIU6ZykNZoBbV5FYtymaHReaVbjbg72gZ5wAv2onvivBoBmGNcfR2%2Bw%2F1Kbzgs4VXZtXf%2FmYeZRKmjPTRpIFBJSYk2syGcfyn5baL8mvnXfABB8cxlgEYc6iF6wwp79BAf%2Bcy2rMzefWtDB8HAiZPE%2FOEM64M%2BGb%2FMTUsP99W68ndL4aDkBO4MIcDhb1wtuxAUsyud2s5HcgKZnpTUe44k&X-Amz-Signature=c5a0f890d42233dda3637eba52ad1857904e4e94ab8d700e6c5818fe6e5c2912&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ETUQAIF%2F20261106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261106T223005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJIMEYCIQCdl0cOoBX6c6rdnByFtUhdCSOnees83yQZeiMrZ5pyrQIhAO3gklXt2OBHyq8PeycgzcLvzfqA9fTIMhDZciaYTQO3KogECOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxI3qE866m1i7kP%2BO4q3AMjDL%2BhOiqiXib8an1HD%2B1L%2BKyj96M8pqyGsnSc3I6%2By7Qpq4Y0a3VOvTgufjudp9yBmJtSXpfjOddCNp2oNkx6tFyGdv8mOFzxxPYmBEt%2BdqLWRpZdPnKOFM0t3tADMABYjmanA9eAigxD21GcdCsalG%2Fx49em9gmvEGn113WxMm2RzK9YWW0melkhb%2B3pO1aSSX9maWhJYYhzbuw%2Fz9s9yWS0hsFeBwcpTdjcsRmk5Fki7oOp1zx9PyLENt4XbOdlHVCNZBoSC59Xbw%2Bnqaw%2BHZe7CiYUmQtTWgZXAPYX6v%2BdvXL%2BMqTbhlKWZQslXgUKXREeNh2gaou84OwqOL7tCN1lcy4fvqxq0KKtGZhj9olDhTosGkNa7OG90vszKPa2kq%2FMZPEUptrEt9l4FXL4ZdWEdqpsGSMkoI1B3GdBjcxnrAEcOUtkRoPnxB9h3y9UkRHQv6SCVbH6vZtQchPJ65wQzMsnW53NrmKqetRdGHLGd49uK4Ecgq9Z%2B9cpWMZbs67eyKegAV6O9mB%2ByH2FdYWAxBATAGF4L8ck6UEzaIQG50UvecLzQeH1vm1Yu%2BLzNtIJ%2FU9lFwy903I72zqngYUgWvT6wJs%2BmFfzd0Nmh%2F8FFmcJjD%2BB5zTwKjDH8rjXBjqkAWMGpstIU6ZykNZoBbV5FYtymaHReaVbjbg72gZ5wAv2onvivBoBmGNcfR2%2Bw%2F1Kbzgs4VXZtXf%2FmYeZRKmjPTRpIFBJSYk2syGcfyn5baL8mvnXfABB8cxlgEYc6iF6wwp79BAf%2Bcy2rMzefWtDB8HAiZPE%2FOEM64M%2BGb%2FMTUsP99W68ndL4aDkBO4MIcDhb1wtuxAUsyud2s5HcgKZnpTUe44k&X-Amz-Signature=873751a5cc29f574b594c2457993901643d6f6a3cdabe2dcacba9639335d146b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
