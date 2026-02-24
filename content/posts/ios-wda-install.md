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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5QU3WWY%2F20260224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260224T123926Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJHMEUCIQCj0MDorRF0mwXZIczWrG0%2B%2BXgNDpyEW5aSXIeImhOxrgIgM1S40IDS5X8hyoKltlAl5UsOkTCisUseXs38z5tAzekqiAQI9f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD5e3XMGyIcYMeveFSrcA0W8tpA%2FeW%2FbKAl4BNnT62RrS9xu55Nx1vQ%2FT8EzdARHz990wSuwZK5Mm68yubDBwMNRC%2BhWe2nF%2BWieMYti4j8M7zV9pH7pLVcajYo7NpHclJvlhYqLoCLVo82kIwOHb6ppjWCOmOWtGlLv%2B33PTDFPKL4V3WP2iQYIRkrPhmRZUI4raF7IsJ8%2Fd1lGQyqrzanNwIV2PWrwpCvxTeMTkA0jJ2hTJnVpPQz4RHLQsHHZkTgvuHRQCde8oLrUYAbp21ucsdqnNQuSVQorX1ld4Ua00%2BRJce%2Ff4M9nETbk5EB2UwKQIBtuypufcSSj1B%2FXupXDpiYrNLHHrIWv6Br5MTOrF3Z8xLvyiIDDOPlQHVj7obxW8zVvzFRhIqSWSuNCe9AFon8qF2Ytx4%2BR96qPoRLigrd%2B1VZJHN1fnr8UoDieImk8PuM1rhqgAwZsBHIVvFlz4wKe7JvBocAdL1puvuhHRCxQyOAOkD%2B0dFRXQu6T9CAHdKnGtOKi5sPOCOZyl0mxsG7ySxTZ74XM2WTjnm7GpJQDt5SZ8yUFsJphdUFQOr1QudnqqHm3YEzziZawRUbd9x7ZIMoUPdbBOukhQ7jk5RS%2Bl1aRhoEH%2BTr1KK8MJRCNNolUKnoQeU3sMLK19swGOqUBhjWA5g2RpuYdhNnieHJAI3Yt9XRvTywRkftmCByaBzyP8TJ4g%2FPuigO2%2FiXYq5J7jzr6aGkSJ%2Bjh5SmSyahR9bvW8U3w9tXT4aoXOUWbX8hvW5fiWl2zLe%2B8%2Fr4EHmYDA%2BR4jUt728UEmsQwc8tbEBqUmXBsz0wr99bhf1T4gCfdacMpCbrz8MVk3tU8Gj11RdKkVzJlVP5yRXWPbWEYo97y7E3p&X-Amz-Signature=7d3af88c55ff4dc8888069c148cf9ebacf0c04fba3071392f763c2ac58d8faaf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5QU3WWY%2F20260224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260224T123926Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJHMEUCIQCj0MDorRF0mwXZIczWrG0%2B%2BXgNDpyEW5aSXIeImhOxrgIgM1S40IDS5X8hyoKltlAl5UsOkTCisUseXs38z5tAzekqiAQI9f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD5e3XMGyIcYMeveFSrcA0W8tpA%2FeW%2FbKAl4BNnT62RrS9xu55Nx1vQ%2FT8EzdARHz990wSuwZK5Mm68yubDBwMNRC%2BhWe2nF%2BWieMYti4j8M7zV9pH7pLVcajYo7NpHclJvlhYqLoCLVo82kIwOHb6ppjWCOmOWtGlLv%2B33PTDFPKL4V3WP2iQYIRkrPhmRZUI4raF7IsJ8%2Fd1lGQyqrzanNwIV2PWrwpCvxTeMTkA0jJ2hTJnVpPQz4RHLQsHHZkTgvuHRQCde8oLrUYAbp21ucsdqnNQuSVQorX1ld4Ua00%2BRJce%2Ff4M9nETbk5EB2UwKQIBtuypufcSSj1B%2FXupXDpiYrNLHHrIWv6Br5MTOrF3Z8xLvyiIDDOPlQHVj7obxW8zVvzFRhIqSWSuNCe9AFon8qF2Ytx4%2BR96qPoRLigrd%2B1VZJHN1fnr8UoDieImk8PuM1rhqgAwZsBHIVvFlz4wKe7JvBocAdL1puvuhHRCxQyOAOkD%2B0dFRXQu6T9CAHdKnGtOKi5sPOCOZyl0mxsG7ySxTZ74XM2WTjnm7GpJQDt5SZ8yUFsJphdUFQOr1QudnqqHm3YEzziZawRUbd9x7ZIMoUPdbBOukhQ7jk5RS%2Bl1aRhoEH%2BTr1KK8MJRCNNolUKnoQeU3sMLK19swGOqUBhjWA5g2RpuYdhNnieHJAI3Yt9XRvTywRkftmCByaBzyP8TJ4g%2FPuigO2%2FiXYq5J7jzr6aGkSJ%2Bjh5SmSyahR9bvW8U3w9tXT4aoXOUWbX8hvW5fiWl2zLe%2B8%2Fr4EHmYDA%2BR4jUt728UEmsQwc8tbEBqUmXBsz0wr99bhf1T4gCfdacMpCbrz8MVk3tU8Gj11RdKkVzJlVP5yRXWPbWEYo97y7E3p&X-Amz-Signature=66781edca9aed7b05df54110d1902adb1e51ed592449a4f3fb05227e8340182c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
