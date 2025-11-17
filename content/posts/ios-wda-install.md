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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YOJV47XP%2F20251117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251117T061813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCPO0aR5ud%2F0Ce8ogMyJxR90Kf%2F2SgxnyOWe8rgY%2FPuWAIhAIgxkJRkQsI7WMG5NSZpoJ7FqxT92ZNYG%2BGInDKE%2BgdFKogECKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyBVHWdxBc77CjHST4q3AMJXujd%2FONhz9e6d69p8i0o0F6oyvltOmDub4EEViAA4JP7ELPP45XazudFGkbUfsPSeD2YdXiAFlv7D83C5WNHAYOZIEh8A%2FLQIujbQEY96PrCcFlJY6B%2FVa4JbyWkU7rcLk%2BlKeQ%2B3ITPHr1qrV7QvWj350%2FwW6DWg4CiNzjECJ8VkSmuVMIAKKBiuC5tU2LYeTrmgXPUOBd9RY%2BWfvBBMJqnJCG1DD4lPjC0xZ3DqQAq4EroRW5%2FwcKNVyBNLgEl0cqfMzbXy6FC0HUiluhUz9cZXpn%2BKre0j1UCQ4t%2Fr9JtnZsQ3opAXxMgdL2rQVdVT939z1ISUZegwJHHZt0FXMJDlD49VMVVSnhKEA69AqTLJSFKjLQ%2B0YBMWPmfbi77AygqkS%2FG9Xuj3HORNalhT63A%2BlTJOloeTvQgK7zYfUoF7qtJ4rJKOp1LXv%2Bs77CWTEWJtUvs66EGNy0Tel4I3TMQw3%2B7TzKRwp15LqAogil9b3vHKK8r3JN9wPXiaPumkRYYdGY%2Bow08f7ojIfhFa9pOsel4iW%2Bd1WcwZAt047dRE54mZKoTjTeMReNTjf2itTZbI75%2FUXZHIbDwIlEke9cX2Zq%2BKppuYfuXcadRnDLxIi%2BFQhts0GiwGzC41erIBjqkASJZGTRRa6%2B%2FafFmjqFLdsKyMrO1H3VKkvFmCYL7p2ruBRwT62TT155qJ1jaoIDjnIxRcVgkuaWCCSGfZJFmeFSZkVoJHLMzRmaI7uDz0Ycjm%2Bw7LWWWAqwneZk7PYQZuFgS1mZ5RjN7%2B4ScUcHcT2xjPVcR6cGcLXCFyoi%2BtkCqZrM6O5B%2BaHOOkCrHwNHTZwe2pQ2p9%2FKj%2FyN5A7C1LI92%2FiTX&X-Amz-Signature=753ed4145278c152b42ab40e449b6e758df7784f3cc49bcbf8b1b75c5bcf707a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YOJV47XP%2F20251117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251117T061813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCPO0aR5ud%2F0Ce8ogMyJxR90Kf%2F2SgxnyOWe8rgY%2FPuWAIhAIgxkJRkQsI7WMG5NSZpoJ7FqxT92ZNYG%2BGInDKE%2BgdFKogECKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyBVHWdxBc77CjHST4q3AMJXujd%2FONhz9e6d69p8i0o0F6oyvltOmDub4EEViAA4JP7ELPP45XazudFGkbUfsPSeD2YdXiAFlv7D83C5WNHAYOZIEh8A%2FLQIujbQEY96PrCcFlJY6B%2FVa4JbyWkU7rcLk%2BlKeQ%2B3ITPHr1qrV7QvWj350%2FwW6DWg4CiNzjECJ8VkSmuVMIAKKBiuC5tU2LYeTrmgXPUOBd9RY%2BWfvBBMJqnJCG1DD4lPjC0xZ3DqQAq4EroRW5%2FwcKNVyBNLgEl0cqfMzbXy6FC0HUiluhUz9cZXpn%2BKre0j1UCQ4t%2Fr9JtnZsQ3opAXxMgdL2rQVdVT939z1ISUZegwJHHZt0FXMJDlD49VMVVSnhKEA69AqTLJSFKjLQ%2B0YBMWPmfbi77AygqkS%2FG9Xuj3HORNalhT63A%2BlTJOloeTvQgK7zYfUoF7qtJ4rJKOp1LXv%2Bs77CWTEWJtUvs66EGNy0Tel4I3TMQw3%2B7TzKRwp15LqAogil9b3vHKK8r3JN9wPXiaPumkRYYdGY%2Bow08f7ojIfhFa9pOsel4iW%2Bd1WcwZAt047dRE54mZKoTjTeMReNTjf2itTZbI75%2FUXZHIbDwIlEke9cX2Zq%2BKppuYfuXcadRnDLxIi%2BFQhts0GiwGzC41erIBjqkASJZGTRRa6%2B%2FafFmjqFLdsKyMrO1H3VKkvFmCYL7p2ruBRwT62TT155qJ1jaoIDjnIxRcVgkuaWCCSGfZJFmeFSZkVoJHLMzRmaI7uDz0Ycjm%2Bw7LWWWAqwneZk7PYQZuFgS1mZ5RjN7%2B4ScUcHcT2xjPVcR6cGcLXCFyoi%2BtkCqZrM6O5B%2BaHOOkCrHwNHTZwe2pQ2p9%2FKj%2FyN5A7C1LI92%2FiTX&X-Amz-Signature=321f48bfcd9574136f4c2ad41e1884bcb1c809801192b5ceea45072d8563dbec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
