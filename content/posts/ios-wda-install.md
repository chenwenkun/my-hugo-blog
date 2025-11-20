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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3OQ2C6M%2F20251120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251120T181635Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCIQCpdeBnNbIQdJYsJuXWXDemXbQ5%2F3fwbxj2%2F5%2BxOgxKkQIgFsFhpHBy%2FR0zFgFrIzXujTw1mtAOmpcRUfhPx%2BmsAIwqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM7AKXNlIAO4%2BdpFGCrcA194c4sOJjz7p5VqDe6dpNR3R6XbjxISwaJcmzjib8Q1NzzFudd%2BkrhPHag8OaYhOuRxSX%2BhbSHZQSWeTdB2aTrvNkHwm77xfihPcwTsmq0aq8n3RY1DhmO%2B0PbRUy1NgmoD10WP50T6zDR5OB56APBmoHhfBPBE29TgCZg3dfoXfZFRFaZKkXlO0ycO7n10fsFtW3v%2F4MNHdUbFtdYWb3DuZH%2B1Oz0RDPnqUAkaR1lcgeUAnl4IkHJHmPhXlIKN6AVBX4IdrYofZb%2FhUk2dBbFIFl5%2B2ruAhYch2TilBBSsZo7rUXgcGgcc5fLoiSf2k9BvRzliAQUzGm%2F%2FogYaowhhqbBfgd0sFEQdItIyEQsxhhyDClYudpOhKiZa7iq3O0m65PQkUciKwsDFWCSqEDko%2BYr9neDVet7GvHLajjUmHUyPUk1GWD2iid%2BPK4%2FAFLeEOXslPUdX2x2luBb77i%2Fqh%2FjLY%2BMFIML2rTJ7fEJN8aRDEHRNCFVOepZLSZJ7GBCY5WE4fD9Ei9HEDFMDf66%2BKjotIFVnybWVax%2B6ymheJYq5Ssgn1NFIPF6xcTECdn8hA7APwvoaeyeU%2BCtZyFwU1F1I4i%2FO8083M3Z6f5%2BMm%2FGNkXKrc3axVdY6MLWb%2FcgGOqUBxwK%2B2z09iPqlGoZgDWBwpijjQirVKLKwckJp4%2Fasr8yFXu6nJw4852fc0GDwB9H7obmE0hi9ZlLwZj8iaJ%2FubEyQOrprKUpSSD6Myjgq3Ig1w2b6Oxg5aZo%2BArFWjEQHpI4AWLFS2y43wUvcQA1MzpQ3hxucWtsLUmRpp47f043iyWZK8qTyylVZMHryzxum85dNDzLIcPv2odCzDRMOT32goSp8&X-Amz-Signature=5c0871b0838485e8de282e0e96642d80b18c7c4c88070750aee51786336003b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3OQ2C6M%2F20251120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251120T181635Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCIQCpdeBnNbIQdJYsJuXWXDemXbQ5%2F3fwbxj2%2F5%2BxOgxKkQIgFsFhpHBy%2FR0zFgFrIzXujTw1mtAOmpcRUfhPx%2BmsAIwqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM7AKXNlIAO4%2BdpFGCrcA194c4sOJjz7p5VqDe6dpNR3R6XbjxISwaJcmzjib8Q1NzzFudd%2BkrhPHag8OaYhOuRxSX%2BhbSHZQSWeTdB2aTrvNkHwm77xfihPcwTsmq0aq8n3RY1DhmO%2B0PbRUy1NgmoD10WP50T6zDR5OB56APBmoHhfBPBE29TgCZg3dfoXfZFRFaZKkXlO0ycO7n10fsFtW3v%2F4MNHdUbFtdYWb3DuZH%2B1Oz0RDPnqUAkaR1lcgeUAnl4IkHJHmPhXlIKN6AVBX4IdrYofZb%2FhUk2dBbFIFl5%2B2ruAhYch2TilBBSsZo7rUXgcGgcc5fLoiSf2k9BvRzliAQUzGm%2F%2FogYaowhhqbBfgd0sFEQdItIyEQsxhhyDClYudpOhKiZa7iq3O0m65PQkUciKwsDFWCSqEDko%2BYr9neDVet7GvHLajjUmHUyPUk1GWD2iid%2BPK4%2FAFLeEOXslPUdX2x2luBb77i%2Fqh%2FjLY%2BMFIML2rTJ7fEJN8aRDEHRNCFVOepZLSZJ7GBCY5WE4fD9Ei9HEDFMDf66%2BKjotIFVnybWVax%2B6ymheJYq5Ssgn1NFIPF6xcTECdn8hA7APwvoaeyeU%2BCtZyFwU1F1I4i%2FO8083M3Z6f5%2BMm%2FGNkXKrc3axVdY6MLWb%2FcgGOqUBxwK%2B2z09iPqlGoZgDWBwpijjQirVKLKwckJp4%2Fasr8yFXu6nJw4852fc0GDwB9H7obmE0hi9ZlLwZj8iaJ%2FubEyQOrprKUpSSD6Myjgq3Ig1w2b6Oxg5aZo%2BArFWjEQHpI4AWLFS2y43wUvcQA1MzpQ3hxucWtsLUmRpp47f043iyWZK8qTyylVZMHryzxum85dNDzLIcPv2odCzDRMOT32goSp8&X-Amz-Signature=c82861fff8d65d2bf532d916f0572bcd7f77b00d98ebc028546bce58e015fe15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
