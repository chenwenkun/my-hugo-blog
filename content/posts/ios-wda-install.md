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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663DZNWRKB%2F20260321%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260321T063026Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJGMEQCIEOcVL%2BQFqwppHh%2BITcCWboPlQQtXYPPSvO3g0viFNn8AiBJEWMDnCslA%2BUl7rYS7eEieLLL7uAt5aI7bV%2B3iv0%2FxCr%2FAwhHEAAaDDYzNzQyMzE4MzgwNSIMkklaNf8%2BhsLoOIm%2BKtwDxDdpcQSvp0Yqk7ZpiAZduM18utxnLOCkqEogURUTNTAZdsu0fxSc5aB5C8zFEwqCRdg1WavG%2BoSZMyk63x60RmnWOv9qwGkmH9dPK5ZWtgFVaYje%2F5%2BBxjx7geEWJLAx0HbsS6CH90ZXEzKfoUpb20qQEbypm7pJ61xlldHXaK30l2crcn5wN53PsZHd9UWMwq6%2B%2FwGjvMUfcvQhZ0M3hsVxE9R5DYffWvRdfOpYhuXBbkbB4VCyD62qoP0s1dfYHO0gR5ZCQ6tO28%2B4Mm56tRQYDBkL84NVJP7omESGX97ZR5plf19qHia0ZeIiU0iUHz%2FQxHcRMaNVbu8y%2FBXg56EGsib9T8kswn9fvIZm5PVu3S0ct6O%2FAkHrISlVDVDg3YQN4iRFJun3b1rqH1AlK45HeDHb3K7%2B1NtTr2K%2BgeDWDSlvJ2%2F5PcA2QRh%2FyubPoG0FwQKMdVrxQx2ISvMl7aFE%2BHFivdKScpBkLnSG9XvLYFKGfTwX8GOK9Gx2iqkP59RkLIUHxviVfqD1ML04RV4N%2BZ66td67bl%2FLLxhQLU11lCwZ6zLHkr%2BbbIyPDWprWtPJmyPHHpnu2j4IZzLUsgqmjNfVU4VPNetaAsxQr9KTa1gRtB%2B%2BiSMrtFUwj%2BX4zQY6pgEcE3vAh9%2FagbeVxY6eT%2FTSLzEZ%2BW9tDPv8YlIxI8JlflrM8HcklUDcb5H7NQGk2ykt1%2BXmVI%2BrEnOHkuHNYKSbNeQFe40WMvx7WIZyjgUYUOBEJHhDFV9U7kVXk53u8wiZGufNuBRUjCKEIU1DTzWPGTmKhrAFYkIzMKd6rGkvfwN%2BQ64t6P0zoGvEsm9w99qVQO50ZGsCidoizFkupllFOx%2FdvPza&X-Amz-Signature=7d20a197e71454d9afea987e37d4b0ee614203f2019d76b7ca42545f92c5ebf5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663DZNWRKB%2F20260321%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260321T063026Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJGMEQCIEOcVL%2BQFqwppHh%2BITcCWboPlQQtXYPPSvO3g0viFNn8AiBJEWMDnCslA%2BUl7rYS7eEieLLL7uAt5aI7bV%2B3iv0%2FxCr%2FAwhHEAAaDDYzNzQyMzE4MzgwNSIMkklaNf8%2BhsLoOIm%2BKtwDxDdpcQSvp0Yqk7ZpiAZduM18utxnLOCkqEogURUTNTAZdsu0fxSc5aB5C8zFEwqCRdg1WavG%2BoSZMyk63x60RmnWOv9qwGkmH9dPK5ZWtgFVaYje%2F5%2BBxjx7geEWJLAx0HbsS6CH90ZXEzKfoUpb20qQEbypm7pJ61xlldHXaK30l2crcn5wN53PsZHd9UWMwq6%2B%2FwGjvMUfcvQhZ0M3hsVxE9R5DYffWvRdfOpYhuXBbkbB4VCyD62qoP0s1dfYHO0gR5ZCQ6tO28%2B4Mm56tRQYDBkL84NVJP7omESGX97ZR5plf19qHia0ZeIiU0iUHz%2FQxHcRMaNVbu8y%2FBXg56EGsib9T8kswn9fvIZm5PVu3S0ct6O%2FAkHrISlVDVDg3YQN4iRFJun3b1rqH1AlK45HeDHb3K7%2B1NtTr2K%2BgeDWDSlvJ2%2F5PcA2QRh%2FyubPoG0FwQKMdVrxQx2ISvMl7aFE%2BHFivdKScpBkLnSG9XvLYFKGfTwX8GOK9Gx2iqkP59RkLIUHxviVfqD1ML04RV4N%2BZ66td67bl%2FLLxhQLU11lCwZ6zLHkr%2BbbIyPDWprWtPJmyPHHpnu2j4IZzLUsgqmjNfVU4VPNetaAsxQr9KTa1gRtB%2B%2BiSMrtFUwj%2BX4zQY6pgEcE3vAh9%2FagbeVxY6eT%2FTSLzEZ%2BW9tDPv8YlIxI8JlflrM8HcklUDcb5H7NQGk2ykt1%2BXmVI%2BrEnOHkuHNYKSbNeQFe40WMvx7WIZyjgUYUOBEJHhDFV9U7kVXk53u8wiZGufNuBRUjCKEIU1DTzWPGTmKhrAFYkIzMKd6rGkvfwN%2BQ64t6P0zoGvEsm9w99qVQO50ZGsCidoizFkupllFOx%2FdvPza&X-Amz-Signature=7aa0b135a3351d96e89ecfb371776c7bbd30844374385ace7962a0254406f74c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
