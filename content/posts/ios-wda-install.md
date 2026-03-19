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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCATFX4L%2F20260319%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260319T011451Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJHMEUCIGbPWy5n8QONGX8nXIkie94hN62VGmAoSg3bK8lpJP%2BrAiEAtNAyysGxOerxV0vTRIekO5CWVJXdcOiNKfGL8NDz10Uq%2FwMIEhAAGgw2Mzc0MjMxODM4MDUiDPAR%2FmSSl0K8ARABuCrcA846c8OD5qltHigeesPpqP7FCdPs%2FxwD4lCndLA3heaTh29YZPdalaAC5uoHIUMc7kI%2FXnFW%2BQnsAJ14OuxBA3rGjDKDJuNxkJcLg%2BpOAnPQkSYfdCadIy1oadLoIb7SynmXC4upg8DYW3eioyc8VrFPNML51KaQ9uwKn9xxpF4VsXRyz1Efext1jQya6WQaJ1FlZmz6Wj6bvX3eA6%2FvmfdKBPd1IIX3sItpPBhNzkoTaCgHAYtcaWQiZzavZDG7wtnmKAfd47acw%2B0pMsZvBuMiOgfNvEZY7kZJq3EmYcnrypEJqP7o4M7CfeZai7vxvMF%2F6EM6NK4hr7omobaPAfn2LmHM2SEaeF0Ct3VEjeUOjrAKtQdCBze7URWv7DuRvzaGjVIPpL7r5dwRlqt0z7KN43jsEFhOsJA6zUTJhmk445oi%2FoN3SkleHuUMKODMXdpOfqQ791zSBGfUb17VDgZEDw%2FUOG7GYxfQ3cIFBME10FhwA74xTNvIOyzpR4TPN%2Fx1HvawEYztbrhbxq6aupTrkYwemSAsYjHHnNqanqoZgd7jKPquhtdHtcYet5NGIOUesa0Lmts27fVZcR2S%2Fp30mxAA%2BbVM5BPGuMw7QBiwApH0j8411ipuXAVQMJaV7c0GOqUB2wzi7IHeYL0qM1A6TFryuerFiI6eFEYXDHGJh9QWsX9qrHptag21NzIK3HthOEHbb3erFZYkgIUMGiDmx%2FX35aK7suOE2Oi1qRB2SC0DLKu5DeQUTebIYCU6%2BldHZ1f22JH6wlAz5AGjNOSU3uwldudtxBJZDODQklLpJ3oqcmMCMLWIJLKLFqGPt%2FgvRgPMN%2BZBeHCE6dzVXBjpPgPNhb4cwarI&X-Amz-Signature=e3d177d51cec18cd55e37793417bde8f0c2003d2ffc6b8e65a4ceaeb15a97914&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCATFX4L%2F20260319%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260319T011451Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJHMEUCIGbPWy5n8QONGX8nXIkie94hN62VGmAoSg3bK8lpJP%2BrAiEAtNAyysGxOerxV0vTRIekO5CWVJXdcOiNKfGL8NDz10Uq%2FwMIEhAAGgw2Mzc0MjMxODM4MDUiDPAR%2FmSSl0K8ARABuCrcA846c8OD5qltHigeesPpqP7FCdPs%2FxwD4lCndLA3heaTh29YZPdalaAC5uoHIUMc7kI%2FXnFW%2BQnsAJ14OuxBA3rGjDKDJuNxkJcLg%2BpOAnPQkSYfdCadIy1oadLoIb7SynmXC4upg8DYW3eioyc8VrFPNML51KaQ9uwKn9xxpF4VsXRyz1Efext1jQya6WQaJ1FlZmz6Wj6bvX3eA6%2FvmfdKBPd1IIX3sItpPBhNzkoTaCgHAYtcaWQiZzavZDG7wtnmKAfd47acw%2B0pMsZvBuMiOgfNvEZY7kZJq3EmYcnrypEJqP7o4M7CfeZai7vxvMF%2F6EM6NK4hr7omobaPAfn2LmHM2SEaeF0Ct3VEjeUOjrAKtQdCBze7URWv7DuRvzaGjVIPpL7r5dwRlqt0z7KN43jsEFhOsJA6zUTJhmk445oi%2FoN3SkleHuUMKODMXdpOfqQ791zSBGfUb17VDgZEDw%2FUOG7GYxfQ3cIFBME10FhwA74xTNvIOyzpR4TPN%2Fx1HvawEYztbrhbxq6aupTrkYwemSAsYjHHnNqanqoZgd7jKPquhtdHtcYet5NGIOUesa0Lmts27fVZcR2S%2Fp30mxAA%2BbVM5BPGuMw7QBiwApH0j8411ipuXAVQMJaV7c0GOqUB2wzi7IHeYL0qM1A6TFryuerFiI6eFEYXDHGJh9QWsX9qrHptag21NzIK3HthOEHbb3erFZYkgIUMGiDmx%2FX35aK7suOE2Oi1qRB2SC0DLKu5DeQUTebIYCU6%2BldHZ1f22JH6wlAz5AGjNOSU3uwldudtxBJZDODQklLpJ3oqcmMCMLWIJLKLFqGPt%2FgvRgPMN%2BZBeHCE6dzVXBjpPgPNhb4cwarI&X-Amz-Signature=dba823eced35b28d8c6afa042a4c0404f619abb60481afe62d030ef6dd3ac5f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
