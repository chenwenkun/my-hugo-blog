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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RSNTFPBW%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T070242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF4GNkGtKmzAaR90s6V0pHXUrlOSs8Nm8pGMoVjgdgg3AiBdHsiF1qEvLTW%2FWHiryNPEVX1YQriafT0Vo5K34nU07Cr%2FAwhXEAAaDDYzNzQyMzE4MzgwNSIMu3wGdee4uam2PyGNKtwDcSI3HylwAx%2BqH1wPudJ2tJEh24JF%2B%2BQrvq9kEZz5wUaxKhXHFPnIMMsUtJK7OJCDiufvK5KrYX4kDlBKDsM0Rigud8k7AyC0zQ71UYfF9eU1sNzGOWdRGXC8ZYJfxpAPMSgoq%2FNbs7PU%2B3VqqT6324%2F1jCFafqvlrsE3DRSWLdQ7icxMLgmFjGj0UKceyRQIMTCRoDTTSuweI%2Fp9IlxJ%2B6KBV35IrQZFtSFGTGBWN9pMHcPkiEL67cBFJaNrzEcgVtDwj8GFZRSkMAo32CvO7oZTO%2FUVq4vGY3MDMvzuylxzpC1fUd1z%2FrjK2wgQCiUwsi3s6Qq8gLbIK4k%2BUgrp08y3QVP3CtHdWzeUmINAKkWLw6l2W5T3bJK9dJjte3LIx%2FnPRJoqGmu%2BABdBzOhjGayk09cdV9fMA8mlDvB%2F1skXjfpYlbGg6WaH3E7SSHtTkudzSLdf%2B%2FuUHlOqiqoz769ZswkzL%2BSp%2Bij5V8qxSVFWSmKIi5rHHj52Uv4dKbCy6qCO4SPE8hPayNfnuBwNIsfJrVaRZGSkbGtXkiR2v1tKci0XrEhmvzltd4cRYZrQ40XFMCEa59oIniLLwsffQ4GFkJBU8LMbRTRA%2BKSrKNco4AAkqj80Js6vaR8wovTszgY6pgFW01TvHvbvM7MFtpYZd9UhlP0Ha%2FEY87%2F0DA%2BeCaLWp1v8vgzs9sbh0l6m7%2Bf6R9wATsi118xLn4lLzZ%2F1Fl%2FMRxlL32ROnEwrvxl%2FmCH5Yg8tE9yYm4LMgmZkKGFw4%2FyViHHdoVXfmKTZrUrPsGlJOGUzW%2B8dQlT0jeScF5cCMwtC%2FJca48hW6uRYNnajsKhSE4ENd78BOWPsa2KWfQUX7XQc4okj&X-Amz-Signature=761d77e5fa9ff2f28e8f997f916a1c1b3290e4df7fa0343f0241e3fdf23d06a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RSNTFPBW%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T070242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF4GNkGtKmzAaR90s6V0pHXUrlOSs8Nm8pGMoVjgdgg3AiBdHsiF1qEvLTW%2FWHiryNPEVX1YQriafT0Vo5K34nU07Cr%2FAwhXEAAaDDYzNzQyMzE4MzgwNSIMu3wGdee4uam2PyGNKtwDcSI3HylwAx%2BqH1wPudJ2tJEh24JF%2B%2BQrvq9kEZz5wUaxKhXHFPnIMMsUtJK7OJCDiufvK5KrYX4kDlBKDsM0Rigud8k7AyC0zQ71UYfF9eU1sNzGOWdRGXC8ZYJfxpAPMSgoq%2FNbs7PU%2B3VqqT6324%2F1jCFafqvlrsE3DRSWLdQ7icxMLgmFjGj0UKceyRQIMTCRoDTTSuweI%2Fp9IlxJ%2B6KBV35IrQZFtSFGTGBWN9pMHcPkiEL67cBFJaNrzEcgVtDwj8GFZRSkMAo32CvO7oZTO%2FUVq4vGY3MDMvzuylxzpC1fUd1z%2FrjK2wgQCiUwsi3s6Qq8gLbIK4k%2BUgrp08y3QVP3CtHdWzeUmINAKkWLw6l2W5T3bJK9dJjte3LIx%2FnPRJoqGmu%2BABdBzOhjGayk09cdV9fMA8mlDvB%2F1skXjfpYlbGg6WaH3E7SSHtTkudzSLdf%2B%2FuUHlOqiqoz769ZswkzL%2BSp%2Bij5V8qxSVFWSmKIi5rHHj52Uv4dKbCy6qCO4SPE8hPayNfnuBwNIsfJrVaRZGSkbGtXkiR2v1tKci0XrEhmvzltd4cRYZrQ40XFMCEa59oIniLLwsffQ4GFkJBU8LMbRTRA%2BKSrKNco4AAkqj80Js6vaR8wovTszgY6pgFW01TvHvbvM7MFtpYZd9UhlP0Ha%2FEY87%2F0DA%2BeCaLWp1v8vgzs9sbh0l6m7%2Bf6R9wATsi118xLn4lLzZ%2F1Fl%2FMRxlL32ROnEwrvxl%2FmCH5Yg8tE9yYm4LMgmZkKGFw4%2FyViHHdoVXfmKTZrUrPsGlJOGUzW%2B8dQlT0jeScF5cCMwtC%2FJca48hW6uRYNnajsKhSE4ENd78BOWPsa2KWfQUX7XQc4okj&X-Amz-Signature=4655a188cb4efa6f08e6c5f0600f9d15fbfc2f0d5ab5f281881b03773dfc74e8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
