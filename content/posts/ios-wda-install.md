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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X5PIXBMC%2F20260320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260320T183317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHMaCXVzLXdlc3QtMiJHMEUCIADUyfkd%2BgCe5D%2Be5yst0ZchkeGzqDWgQHSWdoMAXv97AiEA7eD6KLN20SuCeMBm%2FH1ql%2FilVwcdwzg0QUKxgzIORKcq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDLm5QAWLGo8NhPnWzyrcA1m7xHuSxUBbiutSAM9mRa9lglIAbCx8Eg%2FQGyAaPYaVu0pkbuxQIdt28bERfPwwgP%2Bo5nIELWpeuCt3HyuHN9G%2FyEzt9p27beXK1RRf%2Fx1fn4fUVoguCgLjwIn52x0sG4QBtW62ex60cj%2F%2BiETLLyyLE91eb%2FbMCCQJvzJJKSQGrLA3DW5j%2FmXWZVJzLpSvbLQuKZe0kB9NXqK7zJvEswMy2pNnZConfO868mobfjgBaJAOqsTJdn1%2FRl6t3cwvhRSJGKbYH771WwmHSkH1o0SbFNKziIAwMYyEb0DS07b1MezixeqZH7Sl4Ik%2F6VaKgO5gdwD4lm0VW%2BuGKvWaAJF%2BH4aSuay%2Bg93N3CidBMs3dKm3ydhdcJ6BklB7VYUJtVsVAxMKMlplcVyHlgU%2F7%2FY7hcVrjHthlMjtbyh2ipPYLgT5Dv2TolM9GxIhEEFbPEqV5d%2BJ588mbhaqCR03WhELkA90cZdD5sOcWvwlpJjHFJxe68vRpG32xS%2BYuotI2%2FC%2BibRS3X5NX6jQg%2FxSt1ef9tPm29OfvVW3bq1QT4%2BagQr5P4OHUEGoTQdOJ9FuVIKyYSzA40FkHqNaXdhHwTApqhWz1trMoQXme0vodXTPsraQrCpYjTiWjzVHMKaf9s0GOqUBgcPpO537V7FozsNJxEASFWLx381E%2BvzZ5c8iNbk0WwOFeSXNViYcwAbvWbOBAu5IbLRlVeomopFm3LKEt3jBBYrexZCSKKkmRwWRNEx2Brz5iMtkB%2B6XApoLgFCyiX3zgfqFSHchsQ4BvnoVyVGfYUuSV9lf0nbDric617m4UPecfsZmmp78sZb94UR1io%2BQyvd1LlJc9RoGHPnw6NWSuMezhn%2Br&X-Amz-Signature=f5e63355217f9df3818e5084ae456427500b12ff527880fc19cb698cfce169f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X5PIXBMC%2F20260320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260320T183317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHMaCXVzLXdlc3QtMiJHMEUCIADUyfkd%2BgCe5D%2Be5yst0ZchkeGzqDWgQHSWdoMAXv97AiEA7eD6KLN20SuCeMBm%2FH1ql%2FilVwcdwzg0QUKxgzIORKcq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDLm5QAWLGo8NhPnWzyrcA1m7xHuSxUBbiutSAM9mRa9lglIAbCx8Eg%2FQGyAaPYaVu0pkbuxQIdt28bERfPwwgP%2Bo5nIELWpeuCt3HyuHN9G%2FyEzt9p27beXK1RRf%2Fx1fn4fUVoguCgLjwIn52x0sG4QBtW62ex60cj%2F%2BiETLLyyLE91eb%2FbMCCQJvzJJKSQGrLA3DW5j%2FmXWZVJzLpSvbLQuKZe0kB9NXqK7zJvEswMy2pNnZConfO868mobfjgBaJAOqsTJdn1%2FRl6t3cwvhRSJGKbYH771WwmHSkH1o0SbFNKziIAwMYyEb0DS07b1MezixeqZH7Sl4Ik%2F6VaKgO5gdwD4lm0VW%2BuGKvWaAJF%2BH4aSuay%2Bg93N3CidBMs3dKm3ydhdcJ6BklB7VYUJtVsVAxMKMlplcVyHlgU%2F7%2FY7hcVrjHthlMjtbyh2ipPYLgT5Dv2TolM9GxIhEEFbPEqV5d%2BJ588mbhaqCR03WhELkA90cZdD5sOcWvwlpJjHFJxe68vRpG32xS%2BYuotI2%2FC%2BibRS3X5NX6jQg%2FxSt1ef9tPm29OfvVW3bq1QT4%2BagQr5P4OHUEGoTQdOJ9FuVIKyYSzA40FkHqNaXdhHwTApqhWz1trMoQXme0vodXTPsraQrCpYjTiWjzVHMKaf9s0GOqUBgcPpO537V7FozsNJxEASFWLx381E%2BvzZ5c8iNbk0WwOFeSXNViYcwAbvWbOBAu5IbLRlVeomopFm3LKEt3jBBYrexZCSKKkmRwWRNEx2Brz5iMtkB%2B6XApoLgFCyiX3zgfqFSHchsQ4BvnoVyVGfYUuSV9lf0nbDric617m4UPecfsZmmp78sZb94UR1io%2BQyvd1LlJc9RoGHPnw6NWSuMezhn%2Br&X-Amz-Signature=f674235d8909661f489ca40b228ab04f03324a3ae03855b8474c1f15e14f00c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
