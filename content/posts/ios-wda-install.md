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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666P2S3325%2F20251029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T122238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJHMEUCIBch9A0a6%2FiyS6WMa4VArP0Iq0KLn6u8eWyoZNnwLkdxAiEArZKeh1wc2BtLtxFwO2jBzOU0rW6pWJ1guYTCJkstLmwqiAQI1f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHhyLpJhiIvbGrQ%2BCSrcA2VdFMrS6cy87RFlqZhugM0zr1j3eBsYMhraTJ5NyeEPdvxALXLVWN9Wnb7lan3k85YCfZ5NMlOX8xny425Yg3dcPtVUDGzdJd2voiRtNBSQw%2BfMOAkHm50f3TvyOAjI1CHgsLg1gB7k0rnY27lwgT%2FowL6M8NBYWfXuQ5yx35olOAwu1DmwPkjveFjK4pfuZ8%2ByyDVTt35R%2Bm%2FbPrlVI7bSt8EA89stjBJAt2bPlDgpwG1AUREQpW9RvrDdQpXknyNPm5GhNzv2hqiuGHYDEUMbjehc3JtwPAlucPtoJxN7eu%2Fd18DvYFkMQAqxEwHaZsNohGwuer9EFDhxlNFpsUY6qejvuYUjmk%2F0jdEd%2FpYMKXqgAfGpg33%2F%2BO27%2BiJHf2ITY%2BhakHGm6Au2kbZhCUzvL9yAB4TIGKQ5%2Fv4LtEXuHGgEL8YrTBgkLOgEHuxe2XWhOx%2BKBmZVkbKwSMMOPmyC6Nx7A%2FIxjv%2Bbdpb%2BumSGTuouhwbPGct3abmTeP7Sl4xwRt9Fu5uzmxDLovcCSq%2B1F8T%2FqimT9%2FuPfk%2F13zIF%2BJh%2B8KzZc5vqu3NF145iJZR3idWO1FHV%2B6hw%2Fq4u0qvJFcvxl%2FLKfHdMgc%2FYGzwISXdPd4MnH%2FMiAYD%2FMMn%2Fh8gGOqUBBTPucgHqtkWNEyCQ8a5okBFqnBiqjjs%2BLuLYWHuTYsv2ZhqAZjr1z%2BlpTd8T1SsCA8NzcvePwTSZQ4uniBtaXlNRJGDDpm2KtWVL%2F7S2b67z%2FDrFxxFQ2WT7D4d%2F4riRkZYFeAWiKQLWxRDAvZsgJ1DXpm%2B8xQ99X2Cf3pwgcHub5or%2BOivwidmF1kQlIucecJK5KwnRUVX%2B0KuPxYTj6EwpjInx&X-Amz-Signature=8e8e7b7ffb29d850a4f745ebe6da9fc3f05c8f7d6c3dd181b4b36e44da643686&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666P2S3325%2F20251029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T122238Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJHMEUCIBch9A0a6%2FiyS6WMa4VArP0Iq0KLn6u8eWyoZNnwLkdxAiEArZKeh1wc2BtLtxFwO2jBzOU0rW6pWJ1guYTCJkstLmwqiAQI1f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHhyLpJhiIvbGrQ%2BCSrcA2VdFMrS6cy87RFlqZhugM0zr1j3eBsYMhraTJ5NyeEPdvxALXLVWN9Wnb7lan3k85YCfZ5NMlOX8xny425Yg3dcPtVUDGzdJd2voiRtNBSQw%2BfMOAkHm50f3TvyOAjI1CHgsLg1gB7k0rnY27lwgT%2FowL6M8NBYWfXuQ5yx35olOAwu1DmwPkjveFjK4pfuZ8%2ByyDVTt35R%2Bm%2FbPrlVI7bSt8EA89stjBJAt2bPlDgpwG1AUREQpW9RvrDdQpXknyNPm5GhNzv2hqiuGHYDEUMbjehc3JtwPAlucPtoJxN7eu%2Fd18DvYFkMQAqxEwHaZsNohGwuer9EFDhxlNFpsUY6qejvuYUjmk%2F0jdEd%2FpYMKXqgAfGpg33%2F%2BO27%2BiJHf2ITY%2BhakHGm6Au2kbZhCUzvL9yAB4TIGKQ5%2Fv4LtEXuHGgEL8YrTBgkLOgEHuxe2XWhOx%2BKBmZVkbKwSMMOPmyC6Nx7A%2FIxjv%2Bbdpb%2BumSGTuouhwbPGct3abmTeP7Sl4xwRt9Fu5uzmxDLovcCSq%2B1F8T%2FqimT9%2FuPfk%2F13zIF%2BJh%2B8KzZc5vqu3NF145iJZR3idWO1FHV%2B6hw%2Fq4u0qvJFcvxl%2FLKfHdMgc%2FYGzwISXdPd4MnH%2FMiAYD%2FMMn%2Fh8gGOqUBBTPucgHqtkWNEyCQ8a5okBFqnBiqjjs%2BLuLYWHuTYsv2ZhqAZjr1z%2BlpTd8T1SsCA8NzcvePwTSZQ4uniBtaXlNRJGDDpm2KtWVL%2F7S2b67z%2FDrFxxFQ2WT7D4d%2F4riRkZYFeAWiKQLWxRDAvZsgJ1DXpm%2B8xQ99X2Cf3pwgcHub5or%2BOivwidmF1kQlIucecJK5KwnRUVX%2B0KuPxYTj6EwpjInx&X-Amz-Signature=8c60d2bef88c070c9f868aa542901f03b9ccbe42df89dbe1a25b516f2b48fa78&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
