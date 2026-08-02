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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ERCSEWB%2F20260802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260802T185335Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBsaCXVzLXdlc3QtMiJHMEUCIE3EFISkllPxl06qGCM%2B1edt7V8849MAVjN4HH0xLYhDAiEAnnhV%2BJyjfIoAHlRqWO%2FppgGmPnTVQ%2FHMWd%2BZegwy2IgqiAQI5P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD0NZ8Nk8wYVjRiVSSrcAzFm%2FzOz8bLCKsMTkV9z47BQfYoV7wj%2B4kzpVGaJu9nBfDZRKjhQ3R8VdhP8oWMzOA0BAf2WImDxhaC8PcQ6AhEGpGwq66kfjQN8vp8RrjH0GFKA07o3IOEHcCf%2BhcALczZALPHjd17xQVe3VLH5ImNDyLdQQhYnUnw5388AUjJ4%2Fa%2F3%2FBjzGwcsiBG04U0eBnql90aiTAOVAa9CQRiFcILN%2FVLIn9DApyzwd7vMN8SQ1DKzRZ4swV1yO3JX4gw7TFQMudgBL5gOLDDv%2FdriH82rb4YLA%2BbFCaiZ1KQtX8sj3sJH6RA9R7sObDljoYIWo7iw6IB4D13yb1yM54k9ZkWxJBEaZIVG5CFcb9o36PXiUkEODHnIyYR%2B1jRR1So8ujSVsoP5aCxNo7%2F1Ej7CFl9e5Bft3%2FB3X5GJTQpHHaH%2BZYPEyATy0afExvJxUxyhEWTREQV7BWoPNSL3nWtFGzjr9tjtj%2BLtRsqy6jofu8k2X%2BxZl1PxAr0pH8aBSVHSavfO4u8puXHuLgRlT7d%2FK1Th4aNE0CXmtC%2BwGyikNUi%2BlxBunkF46l15Yi5KeEEtPMzaO8NinFjryihJHerkpQLaa56FGCYPLV8nHByzNsWmIpa4SQLk%2BrjPqg06MMyivtMGOqUBdigpY6Bx4nGp6x9pRRzf5VHJAlrRDvjxgvjB51NU7XfpwT%2B4HSYmXFKbDbGMEhPfA4h7Fyk%2BU5z%2BXyCoXb32c2CcDVTgeyOtvk1ZY877iy5J4ttkopRaggYE1LlROxJdl%2BbN8muLEx%2FPcZeg367fIeyY84%2F4PeEBFiiMRPD7TFWtSjyaLH00oGm6d0%2BkHGDWunxZ6f2%2FWLrnKF%2BvSjHI1Nb%2FxBJs&X-Amz-Signature=9f56595a49099f757546163c78999f6327d24692b064ca342b660877eff4f042&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664ERCSEWB%2F20260802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260802T185335Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBsaCXVzLXdlc3QtMiJHMEUCIE3EFISkllPxl06qGCM%2B1edt7V8849MAVjN4HH0xLYhDAiEAnnhV%2BJyjfIoAHlRqWO%2FppgGmPnTVQ%2FHMWd%2BZegwy2IgqiAQI5P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD0NZ8Nk8wYVjRiVSSrcAzFm%2FzOz8bLCKsMTkV9z47BQfYoV7wj%2B4kzpVGaJu9nBfDZRKjhQ3R8VdhP8oWMzOA0BAf2WImDxhaC8PcQ6AhEGpGwq66kfjQN8vp8RrjH0GFKA07o3IOEHcCf%2BhcALczZALPHjd17xQVe3VLH5ImNDyLdQQhYnUnw5388AUjJ4%2Fa%2F3%2FBjzGwcsiBG04U0eBnql90aiTAOVAa9CQRiFcILN%2FVLIn9DApyzwd7vMN8SQ1DKzRZ4swV1yO3JX4gw7TFQMudgBL5gOLDDv%2FdriH82rb4YLA%2BbFCaiZ1KQtX8sj3sJH6RA9R7sObDljoYIWo7iw6IB4D13yb1yM54k9ZkWxJBEaZIVG5CFcb9o36PXiUkEODHnIyYR%2B1jRR1So8ujSVsoP5aCxNo7%2F1Ej7CFl9e5Bft3%2FB3X5GJTQpHHaH%2BZYPEyATy0afExvJxUxyhEWTREQV7BWoPNSL3nWtFGzjr9tjtj%2BLtRsqy6jofu8k2X%2BxZl1PxAr0pH8aBSVHSavfO4u8puXHuLgRlT7d%2FK1Th4aNE0CXmtC%2BwGyikNUi%2BlxBunkF46l15Yi5KeEEtPMzaO8NinFjryihJHerkpQLaa56FGCYPLV8nHByzNsWmIpa4SQLk%2BrjPqg06MMyivtMGOqUBdigpY6Bx4nGp6x9pRRzf5VHJAlrRDvjxgvjB51NU7XfpwT%2B4HSYmXFKbDbGMEhPfA4h7Fyk%2BU5z%2BXyCoXb32c2CcDVTgeyOtvk1ZY877iy5J4ttkopRaggYE1LlROxJdl%2BbN8muLEx%2FPcZeg367fIeyY84%2F4PeEBFiiMRPD7TFWtSjyaLH00oGm6d0%2BkHGDWunxZ6f2%2FWLrnKF%2BvSjHI1Nb%2FxBJs&X-Amz-Signature=5033a62af323aeb91ebdf83dddffcac16fcea9cfa180a4b7b3a887763d269693&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
