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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46644WZ2YIV%2F20260202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260202T182912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJHMEUCIQCJS5gyUC3SyXUnR6il7Tvc05gQ9RTgWP9HBvJaiidEaAIgF6Yl6DBWH9E7RutFeYqRTWZRFWiFVJMg0WO9ih%2FdmPoqiAQI6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMLCLpogiqSVIoInayrcAxUL9KVNX84Z3b9KhxBc0zfzNz51%2B8lMdAHYpx5g%2BxrpArrdVxwk50sRNRiUosyZ%2BXjhrHr8Gyp6arXSBg7qjzUhOGnw9iNcDkowPX1VMkMzRKi2%2FKtGN0L%2FmRhPloiV8StzWGxfwTzBobzGFrQ16CigFTQHOh6v8RWljIxY9yiOR61u5weWmDJh1J78WBn49Hkqhs8seky4a29TxnlQSufpo%2B%2B5KXsh4qdIe3BqQhxwQ%2FoOsFqflFOW0%2Fxcj2nHGletToirsX5Tqm7HAJlkzsZ6U8zVNg8O0OndJhv2pTQwQzuYD3m6f5piKIigUM%2BmfUi2gwNMT1slBB7RCJat01ueee1mhl23L6GujNU8S920PBP%2BDjiiHsq9HC8P1PFQSdsoU62%2B27DC1RHGvRmeT228qIdowl0OeHa8kN1D04pySG3FE%2FwLqOTFkKHuyPb9imX9ztl6JYIqlSMA4h7MpnWhIulhJ%2B3%2BMBBadc98wRfosHi9Dc5lFoZ04FnwBGqKIs%2BDkEuksZRIdnGihrVn6LfMV5orVqFsFs2EPNiGtmExcvrCjhxfW9qOySyLvoTxAzzZ52Y75dOnFQf0m%2Fzc%2B5NlPkEjuSShYh1grBgohrbUdbvPwjueXZZoy8kSML%2FEg8wGOqUBo5fYXppqqRP7j0pod772FzRcPGjO04KaYrXkqvGfuS4QRGv%2FlMQbhQn%2F2DOHO9VjYtmdAcJdRd8ukRRJSLbCFxJZvZ31iovfciym%2Bh0P8HDYyqwFZogj5g%2FXkZwGW4uR5x9SMNQbegIjORFNwGwKVpCV6nY3xwrcQ3VneGC6euNXJlw50ealAsMRZQEkqWo5oiM5hFYw3tivSkrKUfI5pEk9FMeW&X-Amz-Signature=60b5bf632c12b1bd66abbcaeaef43579ba70bf04e3187038d8abb92fa19087c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46644WZ2YIV%2F20260202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260202T182912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJHMEUCIQCJS5gyUC3SyXUnR6il7Tvc05gQ9RTgWP9HBvJaiidEaAIgF6Yl6DBWH9E7RutFeYqRTWZRFWiFVJMg0WO9ih%2FdmPoqiAQI6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMLCLpogiqSVIoInayrcAxUL9KVNX84Z3b9KhxBc0zfzNz51%2B8lMdAHYpx5g%2BxrpArrdVxwk50sRNRiUosyZ%2BXjhrHr8Gyp6arXSBg7qjzUhOGnw9iNcDkowPX1VMkMzRKi2%2FKtGN0L%2FmRhPloiV8StzWGxfwTzBobzGFrQ16CigFTQHOh6v8RWljIxY9yiOR61u5weWmDJh1J78WBn49Hkqhs8seky4a29TxnlQSufpo%2B%2B5KXsh4qdIe3BqQhxwQ%2FoOsFqflFOW0%2Fxcj2nHGletToirsX5Tqm7HAJlkzsZ6U8zVNg8O0OndJhv2pTQwQzuYD3m6f5piKIigUM%2BmfUi2gwNMT1slBB7RCJat01ueee1mhl23L6GujNU8S920PBP%2BDjiiHsq9HC8P1PFQSdsoU62%2B27DC1RHGvRmeT228qIdowl0OeHa8kN1D04pySG3FE%2FwLqOTFkKHuyPb9imX9ztl6JYIqlSMA4h7MpnWhIulhJ%2B3%2BMBBadc98wRfosHi9Dc5lFoZ04FnwBGqKIs%2BDkEuksZRIdnGihrVn6LfMV5orVqFsFs2EPNiGtmExcvrCjhxfW9qOySyLvoTxAzzZ52Y75dOnFQf0m%2Fzc%2B5NlPkEjuSShYh1grBgohrbUdbvPwjueXZZoy8kSML%2FEg8wGOqUBo5fYXppqqRP7j0pod772FzRcPGjO04KaYrXkqvGfuS4QRGv%2FlMQbhQn%2F2DOHO9VjYtmdAcJdRd8ukRRJSLbCFxJZvZ31iovfciym%2Bh0P8HDYyqwFZogj5g%2FXkZwGW4uR5x9SMNQbegIjORFNwGwKVpCV6nY3xwrcQ3VneGC6euNXJlw50ealAsMRZQEkqWo5oiM5hFYw3tivSkrKUfI5pEk9FMeW&X-Amz-Signature=55dd48dab0413f9779ef575a4b8b591422c9d136e16044a2e7810acc3b94abb9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
