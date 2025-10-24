---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: false
show_reading_time: true
---
测试系统 16.6 运行闪退

18.3 18.4系统正常安装

代码地址：

本来是 facebook 的项目，目前由 appium 进行维护

代码下载

先在xcode 构建一次，修改Bundle Identifier，勾选自己的 appleid

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R6XUDXQI%2F20251024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251024T181621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEvRFwlq1dBieOfkwfin%2FnzM6VDxH%2F4UarJ8d4%2BXtd5XAiB8MqzmIZ132Zk9mKIIg2Bk025bBiZoT2gEN4t%2BA4zmGSr%2FAwhiEAAaDDYzNzQyMzE4MzgwNSIM%2BMn%2BBhwNs%2F5jMIBbKtwD%2FQU6uJGpx6mNqmDXH3thgutNH9%2Frjs%2FMwmwmMyy%2B%2FkiU%2FVoS4gNcDEZ4UnrSrMj2O3pBKccdBuCAsvGBFm7TwWf0TPqJVjnkwhPpc8Dvcgd%2Bn%2F4kDG14h1Ct95uZ82PXL7quNSXNq%2BSWhGTfv2XFQ2e1ONgB0pfe%2BYguz%2FSy5fkkp8Zq6l86ESV18Dbbt7%2BKiHX6zxofaA5usYxMgXvsKLa4oecWMg%2Fcan7n4tpq4w8oVXfc1ZDlRxxWSH8iKoKtMojZ6rgAV8pvJeC7wPcqwoS1C7cXVzOzjhD2JBzAfLbhLEqcxPv3jGwTNGfkiHZvZHQpcsVlzW1LmGu4wgPs%2Bvg%2B09MI0ovABVgt0xS0kL9EuyhU3JFeiFnz78rCnZSHvtslJ%2BlvMNpejWqX3Ys40YmuVkfHC%2BUx2bjmzLGPUchdDw%2Bf8U2K1xAlnR3pF6gDWMp%2FOxoYz6HD2K1bAAdBWcvIDm8GAcow5F%2FBqPAqIaRzpH%2Fd3SJpw8z4zDPKtrQKeCuGDLfLo0Ge7vq3%2Bopi1YQZUVZX0vf1ovHS806A%2BFn7XsywlUSbUlZ7oCVexX8z72DwzW4vU5FAgTn75zm1fw00uB1g2x%2BSaluN6MQx51Qu8IalXmckLke5xjIwquTuxwY6pgHtLAP7bDn9f63YW8J%2FuFE8%2BGJzcG9bUJ3Qi9t8Vm77c9Q8FCjGxwAD%2B6wabIZOXih%2B7Q1T%2FCYqUvsUjWxq8EC0Tz2h1KKp%2BT7tD79qXmhdpv1DdOlLT00BZtXDEXpjO%2F53xUkArbfvPANk9cb6%2FtdmDm2uZrsGkVzg7wWs8NBCLqXuTz8B5L6mCDb4%2BjhZtEKBKLc3jqw16QnV4JVKaFvLC6fAD9jP&X-Amz-Signature=500160961e1a9c7ac77e5cc9b263a223fc62d9a222e766f87fb4e5dd2de3d9a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

```shell
cd /Users/chenwenkun/Downloads/androidandios/iosui/WebDriverAgent/WebDriverAgent
# 使用xcodebuild构建WebDriverAgentRunner用于测试
$ xcodebuild build-for-testing -scheme WebDriverAgentRunner -sdk iphoneos -configuration Release -derivedDataPath /tmp/derivedDataPath

xcodebuild build-for-testing -scheme WebDriverAgentRunner -sdk iphoneos -configuration Release -derivedDataPath /tmp/derivedDataPath -arch arm64
ARCHS=arm64
# 导航到生成的构建目录
$ cd /tmp/derivedDataPath

# 进入Release-iphoneos目录（注意：实际路径可能因环境而异）
$ cd Build/Products/Release-iphoneos

# 创建iOS应用程序打包所需的Payload文件夹结构
# 创建Payload文件夹并将.app文件复制到其中
$ mkdir Payload && cp -r *.app Payload

# 将Payload文件夹压缩为zip文件，然后将扩展名更改为.ipa
# .ipa文件是iOS应用程序的标准分发格式
# 可以使用zip命令进行压缩：zip -r MyApp.ipa Payload
# 或者也可以通过文件管理器进行压缩，然后手动更改扩展名
```

然后：进入到目录 `WebDriverAgentRunner-Runner.app/Frameworks` 把XC开头的文件全部删掉

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R6XUDXQI%2F20251024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251024T181621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEvRFwlq1dBieOfkwfin%2FnzM6VDxH%2F4UarJ8d4%2BXtd5XAiB8MqzmIZ132Zk9mKIIg2Bk025bBiZoT2gEN4t%2BA4zmGSr%2FAwhiEAAaDDYzNzQyMzE4MzgwNSIM%2BMn%2BBhwNs%2F5jMIBbKtwD%2FQU6uJGpx6mNqmDXH3thgutNH9%2Frjs%2FMwmwmMyy%2B%2FkiU%2FVoS4gNcDEZ4UnrSrMj2O3pBKccdBuCAsvGBFm7TwWf0TPqJVjnkwhPpc8Dvcgd%2Bn%2F4kDG14h1Ct95uZ82PXL7quNSXNq%2BSWhGTfv2XFQ2e1ONgB0pfe%2BYguz%2FSy5fkkp8Zq6l86ESV18Dbbt7%2BKiHX6zxofaA5usYxMgXvsKLa4oecWMg%2Fcan7n4tpq4w8oVXfc1ZDlRxxWSH8iKoKtMojZ6rgAV8pvJeC7wPcqwoS1C7cXVzOzjhD2JBzAfLbhLEqcxPv3jGwTNGfkiHZvZHQpcsVlzW1LmGu4wgPs%2Bvg%2B09MI0ovABVgt0xS0kL9EuyhU3JFeiFnz78rCnZSHvtslJ%2BlvMNpejWqX3Ys40YmuVkfHC%2BUx2bjmzLGPUchdDw%2Bf8U2K1xAlnR3pF6gDWMp%2FOxoYz6HD2K1bAAdBWcvIDm8GAcow5F%2FBqPAqIaRzpH%2Fd3SJpw8z4zDPKtrQKeCuGDLfLo0Ge7vq3%2Bopi1YQZUVZX0vf1ovHS806A%2BFn7XsywlUSbUlZ7oCVexX8z72DwzW4vU5FAgTn75zm1fw00uB1g2x%2BSaluN6MQx51Qu8IalXmckLke5xjIwquTuxwY6pgHtLAP7bDn9f63YW8J%2FuFE8%2BGJzcG9bUJ3Qi9t8Vm77c9Q8FCjGxwAD%2B6wabIZOXih%2B7Q1T%2FCYqUvsUjWxq8EC0Tz2h1KKp%2BT7tD79qXmhdpv1DdOlLT00BZtXDEXpjO%2F53xUkArbfvPANk9cb6%2FtdmDm2uZrsGkVzg7wWs8NBCLqXuTz8B5L6mCDb4%2BjhZtEKBKLc3jqw16QnV4JVKaFvLC6fAD9jP&X-Amz-Signature=6ca0770e42f69d41281807bed5435a5296945ff4b95dbff2cab4e1d2f54ea722&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

用zip命令打包出来一个ipa

```shell
zip -r WDA.ipa Payload
```

下载[iOS App Resigner](https://zhida.zhihu.com/search?content_id=237756070&content_type=Article&match_order=1&q=iOS%20App%20Resigner&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NDQzNTQ0ODAsInEiOiJpT1MgQXBwIFJlc2lnbmVyIiwiemhpZGFfc291cmNlIjoiZW50aXR5IiwiY29udGVudF9pZCI6MjM3NzU2MDcwLCJjb250ZW50X3R5cGUiOiJBcnRpY2xlIiwibWF0Y2hfb3JkZXIiOjEsInpkX3Rva2VuIjpudWxsfQ.XGwOKX0ujlvhojSuRT3SlA0sDFnQK-FxDJr60CX6YqU&zhida_source=entity)进行重签名：[https://dantheman827.github.io/ios-app-signer/](https://dantheman827.github.io/ios-app-signer/)

保存为 WDA2.ipa

试了下个人开发者证书可以。

最后用tidevice把IPA装到手机上（iOS17也可以）

```shell
# install tidevice
pip install tidevice

# install WDA2 to phone
tidevice install WDA2.ipa
```

直接点击手机桌面上的WDA图标就可以了

手机浏览器打开测试一下 [http://localhost:8100/status](http://localhost:8100/status)

出现一个长长的JSON就是正常的。

国内手机需要安装

brew install --HEAD libimobiledevice

然后运行iproxy 8100 8100 监听在电脑端
