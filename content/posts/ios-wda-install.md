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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S6F6DSNP%2F20251128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251128T181536Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn2SXvlkTZG0MIRfsKeoWZTm9Pl6VhqtgihcBNpCrW9QIhAPfdfWpe6jJNK52rJcbT4n%2FQ2xoJ9JduKpJV372aq9RMKogECLf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzoLn8CcqHkZ%2FGL8DUq3AN2bbYSD1j9gG83nubz2cYLjtBeHW1ejIoJjkkFNNVcjpbrHWiR8Pfd7tQ1pqRsqoqk3fRR6xE7YqZXBiHfypk%2BqzXRMYxLpBKtAmlJyP1ADhCNspVARYG94SL%2B%2FEpFDGj0TeVy6tkWKVY4dRVzvTXQrcQJgwzb38AMzn9LsMMt9z3CLMT82VVV0wjND9WHzi3OSiYfeEtAZqj36vs1bj61RNmvZrv0QkE8olOD405wMFjWtNobzT1uRwXlm8ZXUXQk4jX0IlB4pwzPYDU%2FkgNnSgqZWKuS4eak6Gr07iBvOlTjTiBnIswD8OfZJfd0yLaS7ohL7jXmgHNB2HI2DgGhcpFRcoijWwhDgXel0EIjA7tzGe4q7uZ5e4Q%2BaryOQ%2FDNvqlf5fPIXSIbj66ODdo2FXiK2dhfDFMNyGpzOfspTSTFKsW6X4JHt86s5H9nK5F%2Ft64S1hM7yrJy4jhbDjkWs8L7i6UusRnwuLWv8AGMi8H0c7FClUHDV8pKwOHn0Cjz0qu64%2FwrwgPvGUOhVRDtTKIl20kfjrORnxbN8f69cwHgmpnvmGov6rx8cGWO4Qlfn2If%2B0lEzhEvBNM2SPn49NSFZhlb4DmOlxkEXTPol7UKSD6RLOMViZnUyjDP2qbJBjqkAXbaq%2BIrassfY3PDLUov0rHKm9k3KZ7jjNzyb09oVXNkD%2F9aRSgxg3b3p%2FZLFD4vF40P7JfYmqyCyA2iUnYBSnyCPb0cH38yQAVF09SB%2BhZjzMQFIJtn9QSeU4S2X%2BH%2F1P17iN1aNaa50b%2FQgaAcWx8YwGP3ESmOiTZ0WAjbbZp64PmmlIXvHvuNdA5PE%2BRYhsURxq5auUSLS%2BrzEORiknjRHa4K&X-Amz-Signature=37905d605a424f5d397bf425d2a96c6afbb81fd29e37c0e1e626809172d6a04b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S6F6DSNP%2F20251128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251128T181536Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn2SXvlkTZG0MIRfsKeoWZTm9Pl6VhqtgihcBNpCrW9QIhAPfdfWpe6jJNK52rJcbT4n%2FQ2xoJ9JduKpJV372aq9RMKogECLf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzoLn8CcqHkZ%2FGL8DUq3AN2bbYSD1j9gG83nubz2cYLjtBeHW1ejIoJjkkFNNVcjpbrHWiR8Pfd7tQ1pqRsqoqk3fRR6xE7YqZXBiHfypk%2BqzXRMYxLpBKtAmlJyP1ADhCNspVARYG94SL%2B%2FEpFDGj0TeVy6tkWKVY4dRVzvTXQrcQJgwzb38AMzn9LsMMt9z3CLMT82VVV0wjND9WHzi3OSiYfeEtAZqj36vs1bj61RNmvZrv0QkE8olOD405wMFjWtNobzT1uRwXlm8ZXUXQk4jX0IlB4pwzPYDU%2FkgNnSgqZWKuS4eak6Gr07iBvOlTjTiBnIswD8OfZJfd0yLaS7ohL7jXmgHNB2HI2DgGhcpFRcoijWwhDgXel0EIjA7tzGe4q7uZ5e4Q%2BaryOQ%2FDNvqlf5fPIXSIbj66ODdo2FXiK2dhfDFMNyGpzOfspTSTFKsW6X4JHt86s5H9nK5F%2Ft64S1hM7yrJy4jhbDjkWs8L7i6UusRnwuLWv8AGMi8H0c7FClUHDV8pKwOHn0Cjz0qu64%2FwrwgPvGUOhVRDtTKIl20kfjrORnxbN8f69cwHgmpnvmGov6rx8cGWO4Qlfn2If%2B0lEzhEvBNM2SPn49NSFZhlb4DmOlxkEXTPol7UKSD6RLOMViZnUyjDP2qbJBjqkAXbaq%2BIrassfY3PDLUov0rHKm9k3KZ7jjNzyb09oVXNkD%2F9aRSgxg3b3p%2FZLFD4vF40P7JfYmqyCyA2iUnYBSnyCPb0cH38yQAVF09SB%2BhZjzMQFIJtn9QSeU4S2X%2BH%2F1P17iN1aNaa50b%2FQgaAcWx8YwGP3ESmOiTZ0WAjbbZp64PmmlIXvHvuNdA5PE%2BRYhsURxq5auUSLS%2BrzEORiknjRHa4K&X-Amz-Signature=25c6557d54b8c2f2904cace2228dadbc0c343d262c60b1d6d8f3811e31d8ede2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
