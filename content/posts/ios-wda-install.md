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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662D3M2EP2%2F20260717%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260717T130233Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDMuV5li43V%2ByAziDdOZXSVTjApG4oOh8TPkyUWJ7YSLwIgTsz87YlZ899XjaXde8muDkDAQ653q3a8NeyUybR7gPIq%2FwMIXBAAGgw2Mzc0MjMxODM4MDUiDDUstCYxhlXZr1mdgCrcAzKhwosuxgudNJGEsli8dnhbtMhui8fc54R9rnI14fnD4r3MQiHKPaMapGdCNq%2F%2Bk%2BS76uxR12jXOg0ng%2FYGeoE3UvVKEzzSdbdEOfjsZf1rFsCejwlX8ftHRjzGEj3p3eTj3pne0gLYBY1k%2BPeK%2B1mSXEgJZ1r5WrG%2BIzlmgJcY1FCpa8bXeqdGmzimncW3zH%2BH%2BrGc6xNZkFUgDlo2m7SyG9dplBtmJBPI8466KrbGtwYJZUYpxB1xDJ50PeSGiJEedL%2Bcl1v5VDOZCcLF%2FUKXskbYOLfgqJ1Lh%2FT5LJosHPND5rwEo3QxGDi3gK7mO0fH9nlo%2F%2FwVZMQACE8vdcPw%2FCmaaPnwnGZPD15cDCT5hLY6TZ1KGx2A0JDbTSAp%2B8uBjJt6KcJ8XDvjQcBKZM3jsYFBkBteXdcX8x9Y3cgJpg3Zm6WF1Fr4rGFAX4cfkf733CUTXP0Nk%2BVfoPKB3%2FWq1NbEBrs0YDWmf5g%2B13FtGZanqPeWYBYPDBnhBxcXrXk%2FNLSiaMT7qHLZaIrlwQIOQGYZNAvjDIpEGZdIlP2VLKPxujybrlDSwXlwlSoG11riCK9ZkHn3OBu98ZWoyR6wNl4Vol6OgdLSyM4VlJlX9kL9QZXUjE30LrRyMOeI6NIGOqUB6m23hortfhrxErnerSDYFEM%2BLIn4bJunP9I9vrODbl85SJLywHynqLCS1q6lJn1MyjnpnasiHhRxFcsSJ76ye31qgy57BkjL%2FjBNjWzUo9YeTQ30D8QjhW%2BdnnFGjDIMj4Vo86ztDepD3Vm9qnpQQ%2Fg4sVeXxrpRYMpzrIXofp%2FjqMnsS9pFETcNqir%2B%2FQgD6y%2Bxrx59EdmJyOJ1Xf2jmrLT1i%2Ft&X-Amz-Signature=ebf03873d6efa15a4097b31dfa4899dd663169b9d99ecf7e583537e252d99ca4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662D3M2EP2%2F20260717%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260717T130233Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDMuV5li43V%2ByAziDdOZXSVTjApG4oOh8TPkyUWJ7YSLwIgTsz87YlZ899XjaXde8muDkDAQ653q3a8NeyUybR7gPIq%2FwMIXBAAGgw2Mzc0MjMxODM4MDUiDDUstCYxhlXZr1mdgCrcAzKhwosuxgudNJGEsli8dnhbtMhui8fc54R9rnI14fnD4r3MQiHKPaMapGdCNq%2F%2Bk%2BS76uxR12jXOg0ng%2FYGeoE3UvVKEzzSdbdEOfjsZf1rFsCejwlX8ftHRjzGEj3p3eTj3pne0gLYBY1k%2BPeK%2B1mSXEgJZ1r5WrG%2BIzlmgJcY1FCpa8bXeqdGmzimncW3zH%2BH%2BrGc6xNZkFUgDlo2m7SyG9dplBtmJBPI8466KrbGtwYJZUYpxB1xDJ50PeSGiJEedL%2Bcl1v5VDOZCcLF%2FUKXskbYOLfgqJ1Lh%2FT5LJosHPND5rwEo3QxGDi3gK7mO0fH9nlo%2F%2FwVZMQACE8vdcPw%2FCmaaPnwnGZPD15cDCT5hLY6TZ1KGx2A0JDbTSAp%2B8uBjJt6KcJ8XDvjQcBKZM3jsYFBkBteXdcX8x9Y3cgJpg3Zm6WF1Fr4rGFAX4cfkf733CUTXP0Nk%2BVfoPKB3%2FWq1NbEBrs0YDWmf5g%2B13FtGZanqPeWYBYPDBnhBxcXrXk%2FNLSiaMT7qHLZaIrlwQIOQGYZNAvjDIpEGZdIlP2VLKPxujybrlDSwXlwlSoG11riCK9ZkHn3OBu98ZWoyR6wNl4Vol6OgdLSyM4VlJlX9kL9QZXUjE30LrRyMOeI6NIGOqUB6m23hortfhrxErnerSDYFEM%2BLIn4bJunP9I9vrODbl85SJLywHynqLCS1q6lJn1MyjnpnasiHhRxFcsSJ76ye31qgy57BkjL%2FjBNjWzUo9YeTQ30D8QjhW%2BdnnFGjDIMj4Vo86ztDepD3Vm9qnpQQ%2Fg4sVeXxrpRYMpzrIXofp%2FjqMnsS9pFETcNqir%2B%2FQgD6y%2Bxrx59EdmJyOJ1Xf2jmrLT1i%2Ft&X-Amz-Signature=c462db99843f74f91083dea3a40729949e018ba32805846cdb246293c1e648dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
