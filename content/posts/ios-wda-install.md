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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LTU2QAM%2F20260124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260124T061819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJHMEUCIQCBsvxHa4evzwYunxtOf5PI4PZ6TkAsCsOrPAncl%2FUrgwIgVfW0c59aKDzEaDhvr%2FotyJwvqCy7lqwTf9crXbB5ilEq%2FwMIBxAAGgw2Mzc0MjMxODM4MDUiDEs798PuUPX81JcrLCrcA4xwHO1jwUocIu516Xp4vtODsJXZxfOXI%2Bk1lekv0dy%2F%2BcDiLpVCE%2FagW9RBGk7Aj%2FL0Nn5ww3WpaJQI7niyiSHz0K95xYiq4l7KWEBKJGF8VcMUgO9Nsk3LZxKAkRYtjU6wKLWqgq5zp78PFzSxPSX7WaXPuwmhHVDpxEWIRAJYuE%2FMyr9G0UWosqQNRT7F2OcLBPHj6YBX421qnhc4SU6xxfNGRMTzuSpOjQzjo%2Bh6ycK6oDhNVxqrmMS5IMcmp0UqK%2BEEQlCjvJTARuZgZnMzFO%2FLesZuMfdlBRlYsKbwSGhaGsvUcJ%2FLNQZyvE0%2BVpHcfTKoOWrO%2FpisMhbxu2oviGbHSe0VhtlWavL9uoiDXTwtI%2FSISF4tgjaUQ4gjIl2rJ5tageY8LXRTplVNtXhz0EXIL25b2GYttJgpetOk3YZet%2BBLAsjwMuusRG19CSq%2FLG1hPjk3nel2PaVEaik8pz1fJwk%2F5V5vPdhLEh6Yvr6huf5ZUijOVPE27Lq98E0AH4sW%2B5HsDIAnoFtjF71SebvMCveaQcFRYMwWTi5pjr0EZR9WxGDhNiakTA8CpEEEfDQjtlczHlEtEzXlxHrMM7Ub7R8%2FOeXkwR0ju0E6vy9AeHH0cazLyWU7MJXF0csGOqUBzBCwA6OHLCsZfoz8B9jAWn9XsiQjjD%2Fb0VUv28uAzPaeH4VZJhX%2F15WtCqfHKxK4BmO%2Fs7uYreRWNXJNvLVZEYjyDF2%2FNysTAiU2C%2Fdnht3Di4QCGebaHw1xuhvKQWA%2BnbxsR1cPfvylwUNKQEtVu2nmsiLHxtVVTB9gIE%2BRWWxC0mmxPRyLE15ufTSVE7d8FFZB41zNbLrFAXUn3C%2FfCsv8MGUi&X-Amz-Signature=467d5e5437f71dd3bdfa259ece9c38cfe86c0dbcf166de435d52ca399c628dd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664LTU2QAM%2F20260124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260124T061819Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJHMEUCIQCBsvxHa4evzwYunxtOf5PI4PZ6TkAsCsOrPAncl%2FUrgwIgVfW0c59aKDzEaDhvr%2FotyJwvqCy7lqwTf9crXbB5ilEq%2FwMIBxAAGgw2Mzc0MjMxODM4MDUiDEs798PuUPX81JcrLCrcA4xwHO1jwUocIu516Xp4vtODsJXZxfOXI%2Bk1lekv0dy%2F%2BcDiLpVCE%2FagW9RBGk7Aj%2FL0Nn5ww3WpaJQI7niyiSHz0K95xYiq4l7KWEBKJGF8VcMUgO9Nsk3LZxKAkRYtjU6wKLWqgq5zp78PFzSxPSX7WaXPuwmhHVDpxEWIRAJYuE%2FMyr9G0UWosqQNRT7F2OcLBPHj6YBX421qnhc4SU6xxfNGRMTzuSpOjQzjo%2Bh6ycK6oDhNVxqrmMS5IMcmp0UqK%2BEEQlCjvJTARuZgZnMzFO%2FLesZuMfdlBRlYsKbwSGhaGsvUcJ%2FLNQZyvE0%2BVpHcfTKoOWrO%2FpisMhbxu2oviGbHSe0VhtlWavL9uoiDXTwtI%2FSISF4tgjaUQ4gjIl2rJ5tageY8LXRTplVNtXhz0EXIL25b2GYttJgpetOk3YZet%2BBLAsjwMuusRG19CSq%2FLG1hPjk3nel2PaVEaik8pz1fJwk%2F5V5vPdhLEh6Yvr6huf5ZUijOVPE27Lq98E0AH4sW%2B5HsDIAnoFtjF71SebvMCveaQcFRYMwWTi5pjr0EZR9WxGDhNiakTA8CpEEEfDQjtlczHlEtEzXlxHrMM7Ub7R8%2FOeXkwR0ju0E6vy9AeHH0cazLyWU7MJXF0csGOqUBzBCwA6OHLCsZfoz8B9jAWn9XsiQjjD%2Fb0VUv28uAzPaeH4VZJhX%2F15WtCqfHKxK4BmO%2Fs7uYreRWNXJNvLVZEYjyDF2%2FNysTAiU2C%2Fdnht3Di4QCGebaHw1xuhvKQWA%2BnbxsR1cPfvylwUNKQEtVu2nmsiLHxtVVTB9gIE%2BRWWxC0mmxPRyLE15ufTSVE7d8FFZB41zNbLrFAXUn3C%2FfCsv8MGUi&X-Amz-Signature=c5c248860e1dc0009fe669639bac8d597a3ab092215402c5d9968527b5945164&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
