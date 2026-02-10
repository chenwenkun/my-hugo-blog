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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YEQBYWXR%2F20260210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260210T012155Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIC3ubqoy%2BoPjDBE8um%2Bg6Bxd6UPw95RQFER7MgAQdiNwAiAbcXUMCOmw%2FTRYwrmBMSfiaK%2Fyhpv%2BSyzil8RJJUSStyqIBAia%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZNM8SFwWt0Aon75iKtwDfHI51cvm%2BrON3SL4gmECEL2DsjWpyRiL3DlZk3nRYu%2FWFIEg87vRvhowOsf%2BFJuAPN5k585h0z%2FvvpqmBgTn3LgaqWKHqXBYJapYWPD%2B4gAYwn%2BYuYWu7yU9%2BjV8bDl2pkJeG2b52CBPSC3Obb3lIT%2FXedp6k%2BzS%2F%2BVRqnrhtcMUOrrET5n227XWIuGjsalmhZ%2F8PEuGYQci59pIT3wTMpAW79oKkzSwNN2GeZ0%2BKBP9ekmA3LcPuiTwoPHMbJ1LEwCmxEW4SCHyjdxzyfK49vEuld%2Fr%2BIyltN52ixQnm4rzj50hPL4EqORLogImmjPhiTQ9L36gvBw%2BHlIDLM%2B4FlW8vakhjBBPDnzfeYky2gYBcKAGVOnJS0AQEmxfCXe8zZcQP3kDqot5frANKD2xlyzRE%2B0RiSlRz7H7BMacc2wsPYZQd2%2Beg0JE4KCdnn%2FyDMsS0ZmJ5EFujJzXrJJ4jEUiBs%2BSE0ptaWNc53XkPDxVLnK9d3P6cfhyhDyzvFHI9w0GERVrx7784XJXH7VbLIiuXvie6LORFIh33ZDediI0GQjAOH98azeAlrqi3DWtCoR4Z%2BVgEgeV0KPfRTmUdIQbe5mfSAoMZz4aUyIo%2FFh%2BTa5LUJN%2BvLZzCgww2fypzAY6pgEcssY3dh2JDVQtq2n1iyS3yvqOHKqDM3BF9%2FC1cYnCjvbTnuaGKdUwL4rz3PgmD%2FdkwoXEjPlMzE0lz3bhaEYI0kqqKL9RE7vY65Pk7P9cDELs4KkjBj90AuVCrOQS0twROOntnisvKmy%2BDifY3D9khbh0R%2BVZokVFdK%2BCa7CPEpn9DqLC8qe3xhlU2Nv3LMPhEoNzOfiRoRyenLirtbUC7iyk1HcY&X-Amz-Signature=8821c9f97a84f62b1d4c2f288e207384eec7391acbb48db7f13c5a52f8b09f19&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YEQBYWXR%2F20260210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260210T012155Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIC3ubqoy%2BoPjDBE8um%2Bg6Bxd6UPw95RQFER7MgAQdiNwAiAbcXUMCOmw%2FTRYwrmBMSfiaK%2Fyhpv%2BSyzil8RJJUSStyqIBAia%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZNM8SFwWt0Aon75iKtwDfHI51cvm%2BrON3SL4gmECEL2DsjWpyRiL3DlZk3nRYu%2FWFIEg87vRvhowOsf%2BFJuAPN5k585h0z%2FvvpqmBgTn3LgaqWKHqXBYJapYWPD%2B4gAYwn%2BYuYWu7yU9%2BjV8bDl2pkJeG2b52CBPSC3Obb3lIT%2FXedp6k%2BzS%2F%2BVRqnrhtcMUOrrET5n227XWIuGjsalmhZ%2F8PEuGYQci59pIT3wTMpAW79oKkzSwNN2GeZ0%2BKBP9ekmA3LcPuiTwoPHMbJ1LEwCmxEW4SCHyjdxzyfK49vEuld%2Fr%2BIyltN52ixQnm4rzj50hPL4EqORLogImmjPhiTQ9L36gvBw%2BHlIDLM%2B4FlW8vakhjBBPDnzfeYky2gYBcKAGVOnJS0AQEmxfCXe8zZcQP3kDqot5frANKD2xlyzRE%2B0RiSlRz7H7BMacc2wsPYZQd2%2Beg0JE4KCdnn%2FyDMsS0ZmJ5EFujJzXrJJ4jEUiBs%2BSE0ptaWNc53XkPDxVLnK9d3P6cfhyhDyzvFHI9w0GERVrx7784XJXH7VbLIiuXvie6LORFIh33ZDediI0GQjAOH98azeAlrqi3DWtCoR4Z%2BVgEgeV0KPfRTmUdIQbe5mfSAoMZz4aUyIo%2FFh%2BTa5LUJN%2BvLZzCgww2fypzAY6pgEcssY3dh2JDVQtq2n1iyS3yvqOHKqDM3BF9%2FC1cYnCjvbTnuaGKdUwL4rz3PgmD%2FdkwoXEjPlMzE0lz3bhaEYI0kqqKL9RE7vY65Pk7P9cDELs4KkjBj90AuVCrOQS0twROOntnisvKmy%2BDifY3D9khbh0R%2BVZokVFdK%2BCa7CPEpn9DqLC8qe3xhlU2Nv3LMPhEoNzOfiRoRyenLirtbUC7iyk1HcY&X-Amz-Signature=a73bf1c18c17f225d5fd8d99b6a4951dc58bef48e33c2fc561be5cf47775dc26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
