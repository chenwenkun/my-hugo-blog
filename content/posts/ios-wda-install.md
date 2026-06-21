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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X2ETBZFA%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T191321Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQCl5T%2FYzn3mue%2FF3QXBQfw0Bs5Sct%2FxISPZ6vuAm5iKYwIhAIwX8A%2B%2BCrPLPJvx1gkd8RXvyb0FwSQ00hia8ECQNolBKogECPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxfbVfhAfHVpMMb%2F0Eq3AP1QC%2FgxD%2BhGWPqmrOsUKplZP5jTMEOtK5WvD0K49JXRwAeGYGE3i3dIgrrq0NSHfsLNg35Kxh2ASu6%2B6iBbpSgqP%2BiaWqAsalKKyNa9FrZTNWV9qE3yliueKRPODHWYdo1FOLmKPPU6bh%2BuescHuT%2B41EuD4xPBx3Hmt5qvqMmBOE7cU4fbzUBHV1Au9GpdtAoom1xQfb5Adz9jwQBxYhWr7Agkdyii%2FoKL1DLP8lnXhsaZaHTOJEWvpe7GK8N0ov%2FKNFIVtZJ%2B5QVx5%2FIzpeILbTu%2BfjRWrENjWE2Zq2OsA%2FhOkdPQquslSs6xcVOBffn3Tof6TE5qloOTNva2PVASzPH17KuB56B%2F9f5Rx9zo8sD5Dl%2Bw7QJjCNrOfj4FzYmARnue6r4uKGSVTVyM%2BkO0od4JOYUgKEPCkyGbynOqnYMSO1duf2h%2FtFpxL6DzEzdvZIWI3CMpzuv7Q9lX14eTK3Jl0jz8r3pZj9klC4OgV72awFtIMIq290mTIEbmavpNj9u87iVO1nZ%2BHQTJK5falC7zJjjcFHBa3%2BAT6L%2Bzu2r3ymMq1D2K6T%2FAbX9gYt5E6mifYz6%2BCCGyeSjPdMsKeXdFNUB2Xn2epKfT3Zerow6o4cbiTC3sJ8YEDDkpODRBjqkAQ6GQkJz9v4shurJ%2FBs%2BEJ20kdtjrMG417ngKczjolhSJf6ARs3ouTTFIzdyOFrCD1hsx3LT4w2xb6kf73lPfjmukDAzUAUs%2BezMX4vc%2Fe3T6o9bOYSoSu5nBBWeZMDAK40l6%2FndiXtcUBYX%2BjZ48H6g0Jd7iGByVK5LUVYcQwvWC9J%2FpSgCCrwoHLn9PN7kAKSUdtzuovC2cBcu%2BTRDj%2B7XMYKY&X-Amz-Signature=1e248810e079b67df9a1167f47e3f2c0d072e03d17370893a87491b583619747&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X2ETBZFA%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T191321Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJIMEYCIQCl5T%2FYzn3mue%2FF3QXBQfw0Bs5Sct%2FxISPZ6vuAm5iKYwIhAIwX8A%2B%2BCrPLPJvx1gkd8RXvyb0FwSQ00hia8ECQNolBKogECPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxfbVfhAfHVpMMb%2F0Eq3AP1QC%2FgxD%2BhGWPqmrOsUKplZP5jTMEOtK5WvD0K49JXRwAeGYGE3i3dIgrrq0NSHfsLNg35Kxh2ASu6%2B6iBbpSgqP%2BiaWqAsalKKyNa9FrZTNWV9qE3yliueKRPODHWYdo1FOLmKPPU6bh%2BuescHuT%2B41EuD4xPBx3Hmt5qvqMmBOE7cU4fbzUBHV1Au9GpdtAoom1xQfb5Adz9jwQBxYhWr7Agkdyii%2FoKL1DLP8lnXhsaZaHTOJEWvpe7GK8N0ov%2FKNFIVtZJ%2B5QVx5%2FIzpeILbTu%2BfjRWrENjWE2Zq2OsA%2FhOkdPQquslSs6xcVOBffn3Tof6TE5qloOTNva2PVASzPH17KuB56B%2F9f5Rx9zo8sD5Dl%2Bw7QJjCNrOfj4FzYmARnue6r4uKGSVTVyM%2BkO0od4JOYUgKEPCkyGbynOqnYMSO1duf2h%2FtFpxL6DzEzdvZIWI3CMpzuv7Q9lX14eTK3Jl0jz8r3pZj9klC4OgV72awFtIMIq290mTIEbmavpNj9u87iVO1nZ%2BHQTJK5falC7zJjjcFHBa3%2BAT6L%2Bzu2r3ymMq1D2K6T%2FAbX9gYt5E6mifYz6%2BCCGyeSjPdMsKeXdFNUB2Xn2epKfT3Zerow6o4cbiTC3sJ8YEDDkpODRBjqkAQ6GQkJz9v4shurJ%2FBs%2BEJ20kdtjrMG417ngKczjolhSJf6ARs3ouTTFIzdyOFrCD1hsx3LT4w2xb6kf73lPfjmukDAzUAUs%2BezMX4vc%2Fe3T6o9bOYSoSu5nBBWeZMDAK40l6%2FndiXtcUBYX%2BjZ48H6g0Jd7iGByVK5LUVYcQwvWC9J%2FpSgCCrwoHLn9PN7kAKSUdtzuovC2cBcu%2BTRDj%2B7XMYKY&X-Amz-Signature=b024e5447713f709a4ca0d4d571a3b1a9ced8b8bbe1934230971a0f171510709&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
