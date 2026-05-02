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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SE7E4UJW%2F20260502%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260502T124438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIQDXBUhReV%2Ba9hJ8Iy0Wq%2BEliwmCwMCkMBCMbc0k295JWgIgJXwSjYi4p9Y%2B7RDu4nAs2v379vMWw7F%2Fa9O6qt03nxUq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDB7o0doDuKz9EscQhSrcA8GpbzbaWaRYMkE3MrKqQp%2B3WIYj1ou%2BIhLUDsxq7EPSDp6LVrFWhY6hYm%2BkTMa7jx%2FHYmISUfcnXOE0d9DNIpje9nfY%2Fuu8bXQO3IGNz7pPzdYGb2dzgCWOo2jikzV7R9h6jkS%2BhBuUogo7tSnTcf9EDTVilb%2BMNnDe8BEAM%2BQvrAW1skIb2DboMb2k4Ut86ry4Dyh4omoV5rQMGQk45DI3IRfHTJRPD5sKOH1NHmgYNuAq2xsPmPL5LixP1OCpUwSMqLXsiKnbu7YDR%2F2oeKiMa%2FYoxAUdgyWAW2LfaFEl%2B1Fqvnh0H9KoysWDZxY8twoFabt6kQ5UI%2BmXmEgkNHI1M87VRc9WvzQtMBZcfOS7WD%2FIibmqReIKS0uJR%2FcjTTXbg91CISKIFaRR7UWMCaUbT2QwVNbOItW9TF%2FIj6npkHVhQiQbgfyuzjYmGSJt6tiZcIyI96LxxK2kdAS3XxQ5mBQoTGM%2FjzZ2okSb4rn1n74ZdAT1LeLCsLg07dQjQHIUKh1yh6sLXy8hcAEFKBL0p%2FrlSzoC8pU51sK%2FNyS2ySmBCcTBcm%2FYVNPWKII1X2ThzEMalR07kxlSi2GjPZIpJjsX4a2uzS5BZPICCkUGmfnybpbBpbIqiNzMMOna188GOqUB5qNl6AMdIRI9dXujVi8TBli8KLFIp5JnB9gZwAOineFexwdu%2BEd%2BU%2BIO4MXA%2Bnsgc9Zl4LmmKBLsQsx6MSQyAaTJ3%2BsVDUWayNMJG4pV69dFDIw3CNKvlsTQedS0nI%2F%2BG6VZRTNOjFN3VJ3%2BA5WllCDPWBA5Uzt4tgS4OpvMLB6cNPEkkoQ9anitckCH4ZYtUWqcE4sM9qrumzleSob%2FizxZP2BO&X-Amz-Signature=b573d6d3c9a554cd07de9df9a488196bb1091482e7b6155ce5b11fdc2a758898&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SE7E4UJW%2F20260502%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260502T124438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHUaCXVzLXdlc3QtMiJHMEUCIQDXBUhReV%2Ba9hJ8Iy0Wq%2BEliwmCwMCkMBCMbc0k295JWgIgJXwSjYi4p9Y%2B7RDu4nAs2v379vMWw7F%2Fa9O6qt03nxUq%2FwMIPhAAGgw2Mzc0MjMxODM4MDUiDB7o0doDuKz9EscQhSrcA8GpbzbaWaRYMkE3MrKqQp%2B3WIYj1ou%2BIhLUDsxq7EPSDp6LVrFWhY6hYm%2BkTMa7jx%2FHYmISUfcnXOE0d9DNIpje9nfY%2Fuu8bXQO3IGNz7pPzdYGb2dzgCWOo2jikzV7R9h6jkS%2BhBuUogo7tSnTcf9EDTVilb%2BMNnDe8BEAM%2BQvrAW1skIb2DboMb2k4Ut86ry4Dyh4omoV5rQMGQk45DI3IRfHTJRPD5sKOH1NHmgYNuAq2xsPmPL5LixP1OCpUwSMqLXsiKnbu7YDR%2F2oeKiMa%2FYoxAUdgyWAW2LfaFEl%2B1Fqvnh0H9KoysWDZxY8twoFabt6kQ5UI%2BmXmEgkNHI1M87VRc9WvzQtMBZcfOS7WD%2FIibmqReIKS0uJR%2FcjTTXbg91CISKIFaRR7UWMCaUbT2QwVNbOItW9TF%2FIj6npkHVhQiQbgfyuzjYmGSJt6tiZcIyI96LxxK2kdAS3XxQ5mBQoTGM%2FjzZ2okSb4rn1n74ZdAT1LeLCsLg07dQjQHIUKh1yh6sLXy8hcAEFKBL0p%2FrlSzoC8pU51sK%2FNyS2ySmBCcTBcm%2FYVNPWKII1X2ThzEMalR07kxlSi2GjPZIpJjsX4a2uzS5BZPICCkUGmfnybpbBpbIqiNzMMOna188GOqUB5qNl6AMdIRI9dXujVi8TBli8KLFIp5JnB9gZwAOineFexwdu%2BEd%2BU%2BIO4MXA%2Bnsgc9Zl4LmmKBLsQsx6MSQyAaTJ3%2BsVDUWayNMJG4pV69dFDIw3CNKvlsTQedS0nI%2F%2BG6VZRTNOjFN3VJ3%2BA5WllCDPWBA5Uzt4tgS4OpvMLB6cNPEkkoQ9anitckCH4ZYtUWqcE4sM9qrumzleSob%2FizxZP2BO&X-Amz-Signature=4693aee892778a0972f4f0d3e79a544a2598964a9e43d1905a1ead91d5f5661b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
