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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W5N5VCRF%2F20260730%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260730T080548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIH7FQURaZspNNJVDSMI8c4XH0p4kvdvwldVWcMLqcpVhAiAk6rFpHpcCwjfBIGCtJO9HJvkZLBRUapFWJfRK1z080iqIBAiR%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMGM2BYADzrjqXE%2FN7KtwDBh0ka%2Buu5kGowh0HD%2FyVdu9ZYfEdQ9ORyvhdWx7qEixkIbV5P8eXbEMXO97Bh73usH9fzPqQD6tITDcIOymcmNTs48y2rlvs2uaTd%2BbAuuO27C8IydtIbzE9bRb3H9d2vNOQtz2TtuQsfxdBxU3sLMkLMgzXgBuG%2F%2F8v0riXk5d37b9ayeE3V2e%2FJAML5sbrG8%2BjPz1gjvGcopF69lM8%2BAF%2BF3LXRkEbraIkOEgEwdYq3Eb8uBbtY1jx8r6Uz1Z86flEWqWyxC4hiT1sxTnrIPQ3kCTaEK%2Bz6H0TrNqpfrS2oaNnEiov%2B9dRcvQ%2BW6TDdx%2F36AmWYRvxDO9Uk4ZXg6N6pxeR60AtjNSEafQi61ppBdp6ZtIJRWpyYnVnF0J2bx%2Ff3xG8zqMKch5XhxBjuGBLD8Oepit3wa%2FeJze%2FK%2FOMmlNc3mXtLeSvjZFVkpybZmE014iPKyFdFOINDDLd%2F0rPrxzTtY9yxG4jjZURnbEx5Y%2FxBTjNjo4yP5aDlqyUPbJPsbtQAVAqLsqVbxP2fvyzocEynFPzsO9VPqovA3oX4kA2NR7ExQSvZ%2FozV8yyWvwMYBYLb0JaE3lGRcmWKx8QvFVTKyu3NmVtnKPKmF5DC5nIzjG%2F6h98NcMw6Ias0wY6pgEyEtpy7brO7myQpQaNzQ%2F7nZ72XQnfYUQVZPulM4g7ArjPi9Y%2F794zugs9TnD545BDIjmGHR3gKNjxlG72IdOQCuRcuomAYn7hziggGVHcbI%2BsgQhfqcZvTpXC2W7R%2Bg4O1WbeCqhPcXgTlZJOCVWQoDCzGwUsayJYHSwLgjZqGB2aeHp8zHqKr8ve7vnrWpAnyd8CEuDYlk3GJh7ZvOWV6AdTrbzn&X-Amz-Signature=384521b824c4ba0df14618dc1ae0e5b4073cc75f3290b4de79ff7ce9ffc834e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W5N5VCRF%2F20260730%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260730T080548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIH7FQURaZspNNJVDSMI8c4XH0p4kvdvwldVWcMLqcpVhAiAk6rFpHpcCwjfBIGCtJO9HJvkZLBRUapFWJfRK1z080iqIBAiR%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMGM2BYADzrjqXE%2FN7KtwDBh0ka%2Buu5kGowh0HD%2FyVdu9ZYfEdQ9ORyvhdWx7qEixkIbV5P8eXbEMXO97Bh73usH9fzPqQD6tITDcIOymcmNTs48y2rlvs2uaTd%2BbAuuO27C8IydtIbzE9bRb3H9d2vNOQtz2TtuQsfxdBxU3sLMkLMgzXgBuG%2F%2F8v0riXk5d37b9ayeE3V2e%2FJAML5sbrG8%2BjPz1gjvGcopF69lM8%2BAF%2BF3LXRkEbraIkOEgEwdYq3Eb8uBbtY1jx8r6Uz1Z86flEWqWyxC4hiT1sxTnrIPQ3kCTaEK%2Bz6H0TrNqpfrS2oaNnEiov%2B9dRcvQ%2BW6TDdx%2F36AmWYRvxDO9Uk4ZXg6N6pxeR60AtjNSEafQi61ppBdp6ZtIJRWpyYnVnF0J2bx%2Ff3xG8zqMKch5XhxBjuGBLD8Oepit3wa%2FeJze%2FK%2FOMmlNc3mXtLeSvjZFVkpybZmE014iPKyFdFOINDDLd%2F0rPrxzTtY9yxG4jjZURnbEx5Y%2FxBTjNjo4yP5aDlqyUPbJPsbtQAVAqLsqVbxP2fvyzocEynFPzsO9VPqovA3oX4kA2NR7ExQSvZ%2FozV8yyWvwMYBYLb0JaE3lGRcmWKx8QvFVTKyu3NmVtnKPKmF5DC5nIzjG%2F6h98NcMw6Ias0wY6pgEyEtpy7brO7myQpQaNzQ%2F7nZ72XQnfYUQVZPulM4g7ArjPi9Y%2F794zugs9TnD545BDIjmGHR3gKNjxlG72IdOQCuRcuomAYn7hziggGVHcbI%2BsgQhfqcZvTpXC2W7R%2Bg4O1WbeCqhPcXgTlZJOCVWQoDCzGwUsayJYHSwLgjZqGB2aeHp8zHqKr8ve7vnrWpAnyd8CEuDYlk3GJh7ZvOWV6AdTrbzn&X-Amz-Signature=75f09a0f4754c83813c47b0a35e8d201f51db876e35ee50c07bc476c552a3994&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
