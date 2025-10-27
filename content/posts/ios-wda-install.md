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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46672CPAVU6%2F20251027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251027T061858Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDFtYvlWSg3%2BSp7PXQ4r9gaEldMHXTZNPOKCdPDqTB36QIgegkNUEgY%2Bj9VbOnvaWtZU%2BLd3zjOQP3neBNR5fhYS5cqiAQIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPyzcB9hjo931LgwcSrcA4nlkyZISAbm3pcykBVY1xskTD14ET2BNI0G0YrEMIB8lZzo2TEJoKivhEDSsBx85qflD%2B7E41wpTbumGiQG7qoHCLDkCFdDl66VBlf2eGHKs4XJQdR08HP8hevg2RfIEW5HvIr7GhHP0nE5DXUQjxwq4cVN2PvEawhL6I%2FvTO5X6ljMtpIOcFY6T53kr0F%2FWszyMQI1jNLSkyFqoEjdYzT%2FZ3jr1qWTwEReuu4wOHhDNelSj5D4xHC62yi1L%2FNCHor3M2TMJa3qPzUZzrqky5tXl6AHaFbliPnCVS5utGW9ezMuvPf3GvpTMi%2BfhfTwULmfu2vRligLzFj3NeHWiWT7kVGcv1F5AB6CdU3VazACFuJppET8SelzpxJ%2BSmGTy4HJnRe3Z2vACPk8zyrtElOFFRgxEvhnyKFv%2FJNSh%2BYKOwdCRjVZQWCuUNCgWDL9E9H4xqZn%2FWVvGgaOUqERGv3CCmziS8g9DLFuI2yDFYHyueXepYUQwmVyFZcWsdsOtZDs2f%2BxQhxmb86qA6JluALCLC9c6xfLnE1pCr3DCkdEiEs8GeEFnJ5NScgbHxDhyVcS3bKa8dF3mSmGwYPRao2gBXAfNVQN%2FcOaynkBZN9vW%2BNFeHCs5MsYLugeMKqF%2FMcGOqUBEcH1cb1xU26zD1BBBkWlQYkdWziIkmI4uhJ2On7ufNchpPAzAmO0cfRyHK6GXF7PQGGJhqntntxWOG5HSu13U5V6tpH%2FiHuVwGgjRiRCIXvR1IXhiD4Z1c7SapiA6Mx%2Fo%2FPU4vpmXDemMIXo6MQZ%2BCl4tKVJCvfO9qLE6zJpZlfFxmeo62drtqpQ3UFKKDPA%2FaQua5YFYGy%2BwUYhVIHu1ASCOj4o&X-Amz-Signature=f2ef8db5fe09bdb8dbf407212579e658be2d169cbac827a13b7fb91bf195f751&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46672CPAVU6%2F20251027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251027T061858Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDFtYvlWSg3%2BSp7PXQ4r9gaEldMHXTZNPOKCdPDqTB36QIgegkNUEgY%2Bj9VbOnvaWtZU%2BLd3zjOQP3neBNR5fhYS5cqiAQIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPyzcB9hjo931LgwcSrcA4nlkyZISAbm3pcykBVY1xskTD14ET2BNI0G0YrEMIB8lZzo2TEJoKivhEDSsBx85qflD%2B7E41wpTbumGiQG7qoHCLDkCFdDl66VBlf2eGHKs4XJQdR08HP8hevg2RfIEW5HvIr7GhHP0nE5DXUQjxwq4cVN2PvEawhL6I%2FvTO5X6ljMtpIOcFY6T53kr0F%2FWszyMQI1jNLSkyFqoEjdYzT%2FZ3jr1qWTwEReuu4wOHhDNelSj5D4xHC62yi1L%2FNCHor3M2TMJa3qPzUZzrqky5tXl6AHaFbliPnCVS5utGW9ezMuvPf3GvpTMi%2BfhfTwULmfu2vRligLzFj3NeHWiWT7kVGcv1F5AB6CdU3VazACFuJppET8SelzpxJ%2BSmGTy4HJnRe3Z2vACPk8zyrtElOFFRgxEvhnyKFv%2FJNSh%2BYKOwdCRjVZQWCuUNCgWDL9E9H4xqZn%2FWVvGgaOUqERGv3CCmziS8g9DLFuI2yDFYHyueXepYUQwmVyFZcWsdsOtZDs2f%2BxQhxmb86qA6JluALCLC9c6xfLnE1pCr3DCkdEiEs8GeEFnJ5NScgbHxDhyVcS3bKa8dF3mSmGwYPRao2gBXAfNVQN%2FcOaynkBZN9vW%2BNFeHCs5MsYLugeMKqF%2FMcGOqUBEcH1cb1xU26zD1BBBkWlQYkdWziIkmI4uhJ2On7ufNchpPAzAmO0cfRyHK6GXF7PQGGJhqntntxWOG5HSu13U5V6tpH%2FiHuVwGgjRiRCIXvR1IXhiD4Z1c7SapiA6Mx%2Fo%2FPU4vpmXDemMIXo6MQZ%2BCl4tKVJCvfO9qLE6zJpZlfFxmeo62drtqpQ3UFKKDPA%2FaQua5YFYGy%2BwUYhVIHu1ASCOj4o&X-Amz-Signature=8230a784f84f23e2a7bbee03e49b67fd6bfc9883dd511026b2a36c5cbbdf2304&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
