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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SCZBKOF3%2F20260801%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260801T014924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCk%2Fgd4kahT2vZhEcZ%2FeEs6s7dte6zQ4TYPmiw1jOEb3AIgMYjZA0%2FmpSD1QlfL%2BwmG2v2IyeG63ss9XLKhEMfL4WgqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPdMu8NkfsxZJ9SKlCrcAwR3%2Bsnbd9zg1RHj2WeVZ0XvRoRIUZiYeqP3bAY7p8MCtbVd7LrjSfhpuRmkbjEX%2BQsn%2BR1sqNHUD%2FOiMmXnhaHC%2FIIB4sh6lJ%2FbkbNCKDH%2Bw%2FWunuNr4n97Ev3GFX%2BlT6EokNXlqFvSWQhr00WVlH5X4PwDh6m9UGCQYk4ecUjAAA56H1Rcqwhl%2BHPLTUNP%2F%2F8zlhqQDgqG55kuaIqPRlmGDkHlPpRVgzHccH3%2BlCSL8k%2B3DrtG5H7DJjD81Mk7qfbr4YfV5kv7WSSc2ahQhoK3xqO%2FPNLt3XPfr35q%2BQKstlA29vJbGqZQI7y7oliD%2BbRWvS%2BOYMJBtcfkEqNb7Utqvi8%2BwquzTEOW0wYHmWI%2BoxpYjvXdbY%2Bb6w4OBt6rP6Ue7DtUj5PcFS95XZXY%2BeGmxro%2BFlX8FcfervXLxvKbBy2VZDHfUdeRYNAf%2B6j0IOeBtGzNizoEsE%2B3N2ZN%2F%2Br%2BDrrAoZ4V7Ly6%2BFfHKL5xtWrlTIvC2nWZinS49uA0LTceCzVlauOWyTtxwMsRruUNGG9xvl0qJWkIr%2BqVE7c0Zcq47FsODESLNLDEX%2FtPnxW6RVGZR6dSURV1XA7wjtI88zho16Bl7EJ6UsDm47ZCW%2BsA85UkntZrkRDvMPeMtdMGOqUB5utddNRim3Yse4hJgaquOOz8geYMDI9VJk2XUU5ruvRuNG%2BN5kfbbg1reR2ZFsWoI44SP%2BFOxAd3brNB3TaY9DepWAx3gMi2y%2BOEj29gaLxn%2FLK6cVMWUwGKueHnvF7PES5%2B%2FMFu6OaQAAtndXywfi%2FVGAn7I7Vc73BszGb2U8ZPoURLJINawumf4ujKQL4lyUOWXmtsGrD%2FRbpLzj0xhQ1b7z2a&X-Amz-Signature=11153ecd3b3b2296db6099fdfd8c570589997338f384ce1ca6dbd6a06998e358&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SCZBKOF3%2F20260801%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260801T014924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCk%2Fgd4kahT2vZhEcZ%2FeEs6s7dte6zQ4TYPmiw1jOEb3AIgMYjZA0%2FmpSD1QlfL%2BwmG2v2IyeG63ss9XLKhEMfL4WgqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPdMu8NkfsxZJ9SKlCrcAwR3%2Bsnbd9zg1RHj2WeVZ0XvRoRIUZiYeqP3bAY7p8MCtbVd7LrjSfhpuRmkbjEX%2BQsn%2BR1sqNHUD%2FOiMmXnhaHC%2FIIB4sh6lJ%2FbkbNCKDH%2Bw%2FWunuNr4n97Ev3GFX%2BlT6EokNXlqFvSWQhr00WVlH5X4PwDh6m9UGCQYk4ecUjAAA56H1Rcqwhl%2BHPLTUNP%2F%2F8zlhqQDgqG55kuaIqPRlmGDkHlPpRVgzHccH3%2BlCSL8k%2B3DrtG5H7DJjD81Mk7qfbr4YfV5kv7WSSc2ahQhoK3xqO%2FPNLt3XPfr35q%2BQKstlA29vJbGqZQI7y7oliD%2BbRWvS%2BOYMJBtcfkEqNb7Utqvi8%2BwquzTEOW0wYHmWI%2BoxpYjvXdbY%2Bb6w4OBt6rP6Ue7DtUj5PcFS95XZXY%2BeGmxro%2BFlX8FcfervXLxvKbBy2VZDHfUdeRYNAf%2B6j0IOeBtGzNizoEsE%2B3N2ZN%2F%2Br%2BDrrAoZ4V7Ly6%2BFfHKL5xtWrlTIvC2nWZinS49uA0LTceCzVlauOWyTtxwMsRruUNGG9xvl0qJWkIr%2BqVE7c0Zcq47FsODESLNLDEX%2FtPnxW6RVGZR6dSURV1XA7wjtI88zho16Bl7EJ6UsDm47ZCW%2BsA85UkntZrkRDvMPeMtdMGOqUB5utddNRim3Yse4hJgaquOOz8geYMDI9VJk2XUU5ruvRuNG%2BN5kfbbg1reR2ZFsWoI44SP%2BFOxAd3brNB3TaY9DepWAx3gMi2y%2BOEj29gaLxn%2FLK6cVMWUwGKueHnvF7PES5%2B%2FMFu6OaQAAtndXywfi%2FVGAn7I7Vc73BszGb2U8ZPoURLJINawumf4ujKQL4lyUOWXmtsGrD%2FRbpLzj0xhQ1b7z2a&X-Amz-Signature=a789285df9f8e2483a523bc85dcce1478e1f4f14d380b39baa2de7c340646661&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
