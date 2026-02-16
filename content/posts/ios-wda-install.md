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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666YIOVKMR%2F20260216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260216T011242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJIMEYCIQDiQAHyJaytHbejhghPX4Gu4dTeD3Amxgwhz6VTsBpKMgIhAJFaX%2BtG0Ms23%2FAHDmq0cMcJtJtNnvArJK46rTwOxAZYKv8DCCkQABoMNjM3NDIzMTgzODA1IgyM3ZGfLCx%2BuZlt8MEq3AM8IkbFPCzDDbTBuF%2FRj6kldslcs7IQMz%2BWogmMJ5Jkzlngso5kZyYYPWer065ybC7k0td7%2FGUcTyv9xu8PmXylti3xVfTILHejZLg1Slv7MJ7zusCv0kVvWAS7XR3YxnxmGyrTebkNrqCqCbDvtnQUSb%2BzrD1GJUy4xGxqi2rgedJcs8LtaSyw4YDV9BMYj0niyzkemhUiEAA8%2BnQm64FFhZSTUWyH0tG6jnbitWtYQ%2F6fKdeUNZEg%2Flvbuy2kDFUOh9DnHl9fXzxprMVNjE2K%2FMGnSj6kwu5jtUQN7B06YuERZDFE0k8zFpbYzOsLF4bOClqz%2F3KxaOai55Pq6iXJz%2FteB6rs33qiq3K8hUyG6BhmU%2Bca3VoX%2FipbKG1B5PG0tGreMLB0m8LxWZGDus8gVuQlKdnLXJLTqNILXttyH2NQEDImNu4d%2FYfrvH%2B37FK%2Fu4u0OewXMt2aYEpkGJYCcpD6%2F%2FHa1rPjflbTrJ0Cexb6X3XdtRNnpGL83uqcBQtpy%2F4FTkLP4lcqVnERX9SZJzgABFEhM3cqUzu0KG8w4lDrbmxMwFYuv8H38w%2B3RaF3cdVYwnmKGTl9knNStHRsuPHG2VhBPyKc1J3%2BLhkukPwd4EC%2BVApF1GdYEjDaxcnMBjqkAdOhx0v7C3TblvSbL2IwNlTX7tZXZDvAejK5qPZYD%2FW6s%2F%2BnkHQZfMdUDFoXxXauKciGs0DZKXIzMTsT86mXYCfayVI5qeV03HkHsRTOOL8gPR5%2B57uyXr3P4dTc7d%2F2hfTEH73OznYTTJ%2BL8BAZRE%2Boyr6lc1z8llqF3EG9zWoRMxJrvJapJf0PCI8vErpa%2FgCJtDXqcUPiPGI49qvsYhc6qoiT&X-Amz-Signature=09373f34afedfed8d5e6911a1db52e9121cb1aceb636c410b812578d4d19a9db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666YIOVKMR%2F20260216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260216T011242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJIMEYCIQDiQAHyJaytHbejhghPX4Gu4dTeD3Amxgwhz6VTsBpKMgIhAJFaX%2BtG0Ms23%2FAHDmq0cMcJtJtNnvArJK46rTwOxAZYKv8DCCkQABoMNjM3NDIzMTgzODA1IgyM3ZGfLCx%2BuZlt8MEq3AM8IkbFPCzDDbTBuF%2FRj6kldslcs7IQMz%2BWogmMJ5Jkzlngso5kZyYYPWer065ybC7k0td7%2FGUcTyv9xu8PmXylti3xVfTILHejZLg1Slv7MJ7zusCv0kVvWAS7XR3YxnxmGyrTebkNrqCqCbDvtnQUSb%2BzrD1GJUy4xGxqi2rgedJcs8LtaSyw4YDV9BMYj0niyzkemhUiEAA8%2BnQm64FFhZSTUWyH0tG6jnbitWtYQ%2F6fKdeUNZEg%2Flvbuy2kDFUOh9DnHl9fXzxprMVNjE2K%2FMGnSj6kwu5jtUQN7B06YuERZDFE0k8zFpbYzOsLF4bOClqz%2F3KxaOai55Pq6iXJz%2FteB6rs33qiq3K8hUyG6BhmU%2Bca3VoX%2FipbKG1B5PG0tGreMLB0m8LxWZGDus8gVuQlKdnLXJLTqNILXttyH2NQEDImNu4d%2FYfrvH%2B37FK%2Fu4u0OewXMt2aYEpkGJYCcpD6%2F%2FHa1rPjflbTrJ0Cexb6X3XdtRNnpGL83uqcBQtpy%2F4FTkLP4lcqVnERX9SZJzgABFEhM3cqUzu0KG8w4lDrbmxMwFYuv8H38w%2B3RaF3cdVYwnmKGTl9knNStHRsuPHG2VhBPyKc1J3%2BLhkukPwd4EC%2BVApF1GdYEjDaxcnMBjqkAdOhx0v7C3TblvSbL2IwNlTX7tZXZDvAejK5qPZYD%2FW6s%2F%2BnkHQZfMdUDFoXxXauKciGs0DZKXIzMTsT86mXYCfayVI5qeV03HkHsRTOOL8gPR5%2B57uyXr3P4dTc7d%2F2hfTEH73OznYTTJ%2BL8BAZRE%2Boyr6lc1z8llqF3EG9zWoRMxJrvJapJf0PCI8vErpa%2FgCJtDXqcUPiPGI49qvsYhc6qoiT&X-Amz-Signature=185a787cc2adce6645ce5ad624a9c06d46a2d5ef789be052301ccb01af62cea0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
