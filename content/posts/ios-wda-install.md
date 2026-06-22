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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667HK3HPB2%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T024304Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaCXVzLXdlc3QtMiJHMEUCIFLTY2jjBYtqCCt9L8%2B9Rq9ovyb7HfbCJSq%2BWswgUBCzAiEA8aHBAbaO2WCzCEmJo53lzSRiwSDJ70kSuAfOLIlusrMqiAQI%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDB4moAT0OS6gYcGkQCrcAwK6kjA8VNfI0EbcQiEhBNQbQxp1eKbDSNcFwhvRStf239kMQy1tq02Gn%2B89nheTHlDjoDDU9oxe5BsKa6kXXUrj9n2m%2Ft2I7tCzkN1cTlpYyeZ9nz8v36uFZzDelfLNt1%2FGXM7ti8xUZ1m85v46aHyv91IsPhgWwqljMZ74fqQXLCQC2yCUNcpkAwXFrRKkPTNonY4mkZks89Y0Al5DLc4vcWvimn41aWeJ7cneHx9tIO3hIhjE582jOUShrtSemAKDxE547oYMREQmWT40bzff6GFBXJpVoRSdkYW1KqBBEHAJUxjnqErjnGLTK82%2BfSG0R5EwzuODLFUEEKkZ3jbOCE3%2BkPXJILWwhSuwx5xZTaPGRB374McEAPwvSOH7lxF9l%2B1GBW4wWSxWRgH%2BcdVjYIRpG191xaJtFSnF59Uu4B5Z3htRjI5FziuQA3xXAV8T0bhpslQrjTsojqKVyF77Jm%2BbV3lYbf4ymiQ5%2BVNfEvn3%2BjliuxUDQBzJvd%2F0peNXgZ1feSQSE7Lt%2BXM3YRTsq7b0c3qtqwNC33z2Hum%2B9wUAM3nR2OlUeNcY0CWJXqLN1VSsMAGwJ1foIkl%2BIFnoK6eYavDKxuvTH%2FQVEPtk86P3mO7p2BQcfa6RMLO44tEGOqUBzM4pKeSSp9dDQ747ym%2BSFQYqc%2FIDKfRjYV72rsGpFjy61ldOdszpcTulr6RlnwR8FXMXvdpJ5EBFzN62kyjnJWjn8kg%2FpEp7fHArxFDTXatRN4QSxfHR7L52QNSRRoTZX43vDYR0M5PrbY0iJF38nbLKdpW2i9gnhDtYE6rcwU%2B%2B5HqMxPfN9%2BLIqkU7gaXaFMJZVlUHqniFtb%2FlQRcQZvYu6Z8Y&X-Amz-Signature=c204a8365aaaa0bb0d24fc014b488ae1f94b29adf8a528af8e8c07a53fb76cc0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667HK3HPB2%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T024304Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaCXVzLXdlc3QtMiJHMEUCIFLTY2jjBYtqCCt9L8%2B9Rq9ovyb7HfbCJSq%2BWswgUBCzAiEA8aHBAbaO2WCzCEmJo53lzSRiwSDJ70kSuAfOLIlusrMqiAQI%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDB4moAT0OS6gYcGkQCrcAwK6kjA8VNfI0EbcQiEhBNQbQxp1eKbDSNcFwhvRStf239kMQy1tq02Gn%2B89nheTHlDjoDDU9oxe5BsKa6kXXUrj9n2m%2Ft2I7tCzkN1cTlpYyeZ9nz8v36uFZzDelfLNt1%2FGXM7ti8xUZ1m85v46aHyv91IsPhgWwqljMZ74fqQXLCQC2yCUNcpkAwXFrRKkPTNonY4mkZks89Y0Al5DLc4vcWvimn41aWeJ7cneHx9tIO3hIhjE582jOUShrtSemAKDxE547oYMREQmWT40bzff6GFBXJpVoRSdkYW1KqBBEHAJUxjnqErjnGLTK82%2BfSG0R5EwzuODLFUEEKkZ3jbOCE3%2BkPXJILWwhSuwx5xZTaPGRB374McEAPwvSOH7lxF9l%2B1GBW4wWSxWRgH%2BcdVjYIRpG191xaJtFSnF59Uu4B5Z3htRjI5FziuQA3xXAV8T0bhpslQrjTsojqKVyF77Jm%2BbV3lYbf4ymiQ5%2BVNfEvn3%2BjliuxUDQBzJvd%2F0peNXgZ1feSQSE7Lt%2BXM3YRTsq7b0c3qtqwNC33z2Hum%2B9wUAM3nR2OlUeNcY0CWJXqLN1VSsMAGwJ1foIkl%2BIFnoK6eYavDKxuvTH%2FQVEPtk86P3mO7p2BQcfa6RMLO44tEGOqUBzM4pKeSSp9dDQ747ym%2BSFQYqc%2FIDKfRjYV72rsGpFjy61ldOdszpcTulr6RlnwR8FXMXvdpJ5EBFzN62kyjnJWjn8kg%2FpEp7fHArxFDTXatRN4QSxfHR7L52QNSRRoTZX43vDYR0M5PrbY0iJF38nbLKdpW2i9gnhDtYE6rcwU%2B%2B5HqMxPfN9%2BLIqkU7gaXaFMJZVlUHqniFtb%2FlQRcQZvYu6Z8Y&X-Amz-Signature=c7c4191b063c992d77816923e40a2fde42f44c305c217eff25b035ecd03a98dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
