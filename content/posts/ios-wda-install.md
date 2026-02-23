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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UTH4WS2R%2F20260223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260223T184825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJHMEUCIQDcL4SWYFJrddjXkzkvhuwfJMBp%2FH9gAWPBlEHDv%2BmP%2FAIgOUf3nfD5fk1M5VjMHnQuH%2FmO%2FAPUOtfqSZVyYjLCWUIqiAQI4%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP6o8DkPiL6KHVElWSrcAwNz%2FyXkgXHKSABJnyXBWNq8awC1IZyGW3s1K956QmPfpsIdJIkVFlWa0g2vF6u79cvXG6NTJv7UDPMhKi42BJaN5DGJNQNxaRY1va3jffPq9LdjDCTqAT96UEgs5oPxDou%2B3Ivqb4A9FjA%2FhjNt9vL5V6aljx6tBNLkLiNznHomiTpTuL610EPVnIEuongYGR%2Bt02ak1TrX6x3nFoSAJOf9VQ0OW2IWpCVtnkJeNaqJP57sbSONJSCNzciD6%2F82nVekcgHLywviHIEFO3xCw4jCIOKSu2E1JaT9CxBx%2FCsMTlMLZbDr4ysQuew5xTvrHIzfukE4cDTTrCSsDYOUUNr2t7oF11oJYp96BY8yfQ2NOLpGIBeH3rd1SkJTqjdcN3C8fmDU%2BvXQ3HljFBhJBoIjdGJX6OClqfLtucwkJX62%2Bpya4%2FkJXVpKByLPGqVd7q8E9OtFf7rOsdN7x3w9JrKXPOymCsffJwA0IFpZyP5OKGYL%2BbzZxRE5rh8KlgNYjDAv0fqfI%2FjVPK8wPK4mo1zHDD%2BIu9Drj0HTfsuX9lRM8bDf4kIgqbvC57Iv6GBrBB6bovIdkveVn%2BN8p40Oe0lXhvQ22Js2PUd4TXDbOXXdPccF54%2BMpbJjFLcEMMCu8swGOqUBPeInbuLHy9v0z2YPQPtUJ3EUoxvosoyMRve40qqIboHh8hbz32llYk9pa96fkB%2FEhsKvNpDFzmkxKikpRsQP6AGw2cij4GwXf9X6dsdtZvp7XIr8IPbDrasKfJt3MZpjiFe4n8Z2vPa2e737ME%2BjtwBOImEpqJR7rbG002dQp4JYQYCJLSzIw1N2SJ16fviu07VWa0D%2FH5dnwgj2YTQolS0I3HMk&X-Amz-Signature=5f036bfedf0426dccdb5d626409d012edbcaa979fc512a310e1654ee76fc1385&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UTH4WS2R%2F20260223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260223T184825Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBoaCXVzLXdlc3QtMiJHMEUCIQDcL4SWYFJrddjXkzkvhuwfJMBp%2FH9gAWPBlEHDv%2BmP%2FAIgOUf3nfD5fk1M5VjMHnQuH%2FmO%2FAPUOtfqSZVyYjLCWUIqiAQI4%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDP6o8DkPiL6KHVElWSrcAwNz%2FyXkgXHKSABJnyXBWNq8awC1IZyGW3s1K956QmPfpsIdJIkVFlWa0g2vF6u79cvXG6NTJv7UDPMhKi42BJaN5DGJNQNxaRY1va3jffPq9LdjDCTqAT96UEgs5oPxDou%2B3Ivqb4A9FjA%2FhjNt9vL5V6aljx6tBNLkLiNznHomiTpTuL610EPVnIEuongYGR%2Bt02ak1TrX6x3nFoSAJOf9VQ0OW2IWpCVtnkJeNaqJP57sbSONJSCNzciD6%2F82nVekcgHLywviHIEFO3xCw4jCIOKSu2E1JaT9CxBx%2FCsMTlMLZbDr4ysQuew5xTvrHIzfukE4cDTTrCSsDYOUUNr2t7oF11oJYp96BY8yfQ2NOLpGIBeH3rd1SkJTqjdcN3C8fmDU%2BvXQ3HljFBhJBoIjdGJX6OClqfLtucwkJX62%2Bpya4%2FkJXVpKByLPGqVd7q8E9OtFf7rOsdN7x3w9JrKXPOymCsffJwA0IFpZyP5OKGYL%2BbzZxRE5rh8KlgNYjDAv0fqfI%2FjVPK8wPK4mo1zHDD%2BIu9Drj0HTfsuX9lRM8bDf4kIgqbvC57Iv6GBrBB6bovIdkveVn%2BN8p40Oe0lXhvQ22Js2PUd4TXDbOXXdPccF54%2BMpbJjFLcEMMCu8swGOqUBPeInbuLHy9v0z2YPQPtUJ3EUoxvosoyMRve40qqIboHh8hbz32llYk9pa96fkB%2FEhsKvNpDFzmkxKikpRsQP6AGw2cij4GwXf9X6dsdtZvp7XIr8IPbDrasKfJt3MZpjiFe4n8Z2vPa2e737ME%2BjtwBOImEpqJR7rbG002dQp4JYQYCJLSzIw1N2SJ16fviu07VWa0D%2FH5dnwgj2YTQolS0I3HMk&X-Amz-Signature=8aa1afe04af0544b81aa3fb499d4eb78728bd64b46ae45cd172956bc7c50dc20&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
