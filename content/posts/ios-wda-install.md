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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVZ2VAI%2F20251121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251121T181628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJGMEQCICjOH93BTqxvR7PMwc1NopFnJSgZluTpA0%2FX025BNJDnAiBLlY7awJWwuFp%2B8ExYK9jcpGc0%2ByOPhsEHUaUFOWTsfSr%2FAwgSEAAaDDYzNzQyMzE4MzgwNSIMP5rZMvCjOruKHrx6KtwDrLkyaI7UkIFUPFp1RlP%2BH417GGcm3AV65x8JXPRZ4hrEo6hhK%2B3IuDufB4vUldNSQMvP2LMN4yvanr7FHI19s2asstkhJUzgBx2pIaJYLKIkH5uWVdi07AWRRQaI9wae17BluLbSZeaKTjuBukTp9bRPRX3v%2FbwXjwqVU%2B6izqS626aFsQ2ViZbx%2Fnj7zHC7h6vyjBuyIGKaSykApZOP7A0vQWoh4kVb1UAgJNLkFaGx2F8QybRX7khU%2BeGQ500Aj6dnCG36Ij6DrSXv3GSBgaw7T6nc%2BZNFhK1JQHSwuO2gOiEpR5vaiZHjQEGl6tIbA8pwwGlUHA7Rvat2XgKwaV7HxMDBTmV0Z7bdVTdICC1JoAewebqNXmy51yG1H%2BMeH%2BMNirPJWnmXA1upFzN9RNX3vthfNlHwwzYZomM49d2F6ZSwKaTIvQ%2B55TgZX3iEpB1rz4Jz1oOt0Z33CEdWS6%2FzbTOZqs5N%2BOkjtMdjBHFw%2BEj44IbIHYat9vvnmgZRhdBf7aBr1ml3QPnkSy76FeOJk8i5GgsT0uGcpiQexfsSfiOmRhDEDfs3rWHUxt2QYzhficj260trdEXKmkRfOlfkLHxuOPYbLpc16DCZ1Fb9FgJiPN0kvZZ5Nj4wlL6CyQY6pgGJHQJDGoQgQ0w9JG516ssNZL8KQifLxTFFPL4M00FgJ%2BhrZqwov7NsnYNEih5lMrBljS2Zr0fOoQff17RHrQcc3KRsy8IAV4Fe24tXyHfQgdAhRljAJ%2B6ZadFhbgnzlJy4dqA1caq%2F1YqfuETSEYIIWm92qIQG5awFTEjjbUjFbcX42GF99S596mSnMKdcoPJw1o7ZEca%2F0UvCyc1baoBVlHQwDjhG&X-Amz-Signature=17dffaddde2afd3a46eca462f6acb7058c2ec485a19a6a2e52d3a0e6ebe3bb47&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVZ2VAI%2F20251121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251121T181628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJGMEQCICjOH93BTqxvR7PMwc1NopFnJSgZluTpA0%2FX025BNJDnAiBLlY7awJWwuFp%2B8ExYK9jcpGc0%2ByOPhsEHUaUFOWTsfSr%2FAwgSEAAaDDYzNzQyMzE4MzgwNSIMP5rZMvCjOruKHrx6KtwDrLkyaI7UkIFUPFp1RlP%2BH417GGcm3AV65x8JXPRZ4hrEo6hhK%2B3IuDufB4vUldNSQMvP2LMN4yvanr7FHI19s2asstkhJUzgBx2pIaJYLKIkH5uWVdi07AWRRQaI9wae17BluLbSZeaKTjuBukTp9bRPRX3v%2FbwXjwqVU%2B6izqS626aFsQ2ViZbx%2Fnj7zHC7h6vyjBuyIGKaSykApZOP7A0vQWoh4kVb1UAgJNLkFaGx2F8QybRX7khU%2BeGQ500Aj6dnCG36Ij6DrSXv3GSBgaw7T6nc%2BZNFhK1JQHSwuO2gOiEpR5vaiZHjQEGl6tIbA8pwwGlUHA7Rvat2XgKwaV7HxMDBTmV0Z7bdVTdICC1JoAewebqNXmy51yG1H%2BMeH%2BMNirPJWnmXA1upFzN9RNX3vthfNlHwwzYZomM49d2F6ZSwKaTIvQ%2B55TgZX3iEpB1rz4Jz1oOt0Z33CEdWS6%2FzbTOZqs5N%2BOkjtMdjBHFw%2BEj44IbIHYat9vvnmgZRhdBf7aBr1ml3QPnkSy76FeOJk8i5GgsT0uGcpiQexfsSfiOmRhDEDfs3rWHUxt2QYzhficj260trdEXKmkRfOlfkLHxuOPYbLpc16DCZ1Fb9FgJiPN0kvZZ5Nj4wlL6CyQY6pgGJHQJDGoQgQ0w9JG516ssNZL8KQifLxTFFPL4M00FgJ%2BhrZqwov7NsnYNEih5lMrBljS2Zr0fOoQff17RHrQcc3KRsy8IAV4Fe24tXyHfQgdAhRljAJ%2B6ZadFhbgnzlJy4dqA1caq%2F1YqfuETSEYIIWm92qIQG5awFTEjjbUjFbcX42GF99S596mSnMKdcoPJw1o7ZEca%2F0UvCyc1baoBVlHQwDjhG&X-Amz-Signature=2ec5b7751433990722d3b9667d3062383169b254bf5fae579c6ffef66076e117&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
