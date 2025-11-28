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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666DUS6ZJA%2F20251128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251128T061822Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIC1k6CHJ5CV%2FBSnVBTRkC%2Fcx1sZWrboP%2Ffrwr%2BFHFyqlAiBVdy4fBudHgWHgJHvXsSfFMjx6yNa6Ez2pEOcsPyo%2BEyqIBAiu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMMksypGjWqkPtNnR2KtwDnOEXq3k8qgku0rBHhJ0VeAgs5AN9TPB61K2IR5mczDumcl8M2xxuEPl5MEf0GrJcpeh0kxYDPXYuHEn36oAPbn6TUHoDIQMDO2Cnrc2jbdMvnnUx5W8Hh9wHFd7dFMfpalfSGi%2FzqpRMr1jbSeILZxvwWmYL3sAjEpaSrYhcOG3nXwgeSVFgsPAbITrg5HwBEQg9qiuE33UNOjhXyNOekn2iwWMn%2Fa4y9AJysFvSm1eer4rl0af19XgwLey18tpWZLvVd1VaoCz4CwKQRUzkuHXCj3lRKCYAqXJlfHJ5kbEFNJa%2Fy4gE%2FGPUsqjDF7%2B6OwiZCE%2Ft0ZeAclcpfa1waIefdVxnUP0dt0rGLTJbspMNcJeUP5wnsSmIyzobAA0jgrafjqOi%2BlUKoILOcrRZXoh3nthJpVayeyrv8iOHe8cJHU1x3pU3LjHphdN%2FKeXt7bgPf58FnMg7ezkkLVQWpvUeMml46krF8SfL7p0zd%2BfjPTsogH0LEOGdjA%2Bqk4EuED8xiMZqKrR7TCRnm9TfOW1yAhkLhwbPAEsSsS8I3pDiO8HlKcMFU7%2BTn57vNKug%2B4sUv5ti7%2BAFLbcibn%2FgC%2F4dDCSDPoe3zcWoZ5HHeeRnit8ddddKMT9K%2BZEwis6kyQY6pgGS40rCyDf21XLsBwMfUX6barmc%2FHfCJ4X3q0wiL5VjBPWxPv94Jr%2FkKPoQ3N1yaDYfsFRKO7LrFwmO67jE3Q0bKgRMJA2jVaIEIWXP8hjK1vgeqpo1iXW7S8QOjhZjUHa%2F1keeBZU2EagSprRrSwX%2FfjP6Yu4IH8DXPmTRC0wdi0vVU%2FkuK3R8s6D0Kaxs%2BA6kHFujs8ZwXmCAZMiTzgOXxRMrytTP&X-Amz-Signature=72d44c94942207618441e0d511a61615c0aacf302b9288c9532b5f5d56c7803d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666DUS6ZJA%2F20251128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251128T061822Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIC1k6CHJ5CV%2FBSnVBTRkC%2Fcx1sZWrboP%2Ffrwr%2BFHFyqlAiBVdy4fBudHgWHgJHvXsSfFMjx6yNa6Ez2pEOcsPyo%2BEyqIBAiu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMMksypGjWqkPtNnR2KtwDnOEXq3k8qgku0rBHhJ0VeAgs5AN9TPB61K2IR5mczDumcl8M2xxuEPl5MEf0GrJcpeh0kxYDPXYuHEn36oAPbn6TUHoDIQMDO2Cnrc2jbdMvnnUx5W8Hh9wHFd7dFMfpalfSGi%2FzqpRMr1jbSeILZxvwWmYL3sAjEpaSrYhcOG3nXwgeSVFgsPAbITrg5HwBEQg9qiuE33UNOjhXyNOekn2iwWMn%2Fa4y9AJysFvSm1eer4rl0af19XgwLey18tpWZLvVd1VaoCz4CwKQRUzkuHXCj3lRKCYAqXJlfHJ5kbEFNJa%2Fy4gE%2FGPUsqjDF7%2B6OwiZCE%2Ft0ZeAclcpfa1waIefdVxnUP0dt0rGLTJbspMNcJeUP5wnsSmIyzobAA0jgrafjqOi%2BlUKoILOcrRZXoh3nthJpVayeyrv8iOHe8cJHU1x3pU3LjHphdN%2FKeXt7bgPf58FnMg7ezkkLVQWpvUeMml46krF8SfL7p0zd%2BfjPTsogH0LEOGdjA%2Bqk4EuED8xiMZqKrR7TCRnm9TfOW1yAhkLhwbPAEsSsS8I3pDiO8HlKcMFU7%2BTn57vNKug%2B4sUv5ti7%2BAFLbcibn%2FgC%2F4dDCSDPoe3zcWoZ5HHeeRnit8ddddKMT9K%2BZEwis6kyQY6pgGS40rCyDf21XLsBwMfUX6barmc%2FHfCJ4X3q0wiL5VjBPWxPv94Jr%2FkKPoQ3N1yaDYfsFRKO7LrFwmO67jE3Q0bKgRMJA2jVaIEIWXP8hjK1vgeqpo1iXW7S8QOjhZjUHa%2F1keeBZU2EagSprRrSwX%2FfjP6Yu4IH8DXPmTRC0wdi0vVU%2FkuK3R8s6D0Kaxs%2BA6kHFujs8ZwXmCAZMiTzgOXxRMrytTP&X-Amz-Signature=667eaa155d6605897a0666efdf6b74555c550e4072a225273602d4593b14a993&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
