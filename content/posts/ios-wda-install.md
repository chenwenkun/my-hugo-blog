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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667B5TCQFM%2F20260504%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260504T081529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFZF9wdMQwj0HHIjASvbdxPS4FPeT%2FjOsoGzBBvdObPPAiEA3VNGNMnv8SZn3F29itfiaNpPQduObIq%2F9MJsdm0zNMQq%2FwMIaBAAGgw2Mzc0MjMxODM4MDUiDDNwug18h8qdVKioACrcAw%2F5fKvmO%2BoVqIQU1nL6ItTeEaKN2XAV9GfajLp9NoPSIxogM4pYsIQbZQq3mw8rorlTSMT2ks70phDmOOFJITjWcOD1wZEcF4kq5t48vewThN9wX0MQBjUmOjr8oKlcznkKKfxRpGhjXxGWToC4xzE6v36rMcx5sX742i5FaK0vhqfVth%2BQsBl3b1oGL5el%2B53hIGUzlMKe%2FyetUM5TOqTvKq%2Fo6E8P7Em9Q8FhnWNGo2AVWr6nYWB5jzF7Ll048xybYznRtUKzvIF9DZ4JlBWNL4kplNEehDka3rcLsoPRP%2BwABn3r18L5Ff3wtV1rvdtypDTMn24C7agQ3iXx5sHpIKS7rWW49gm%2FBhNLWPRFI9ZiRR7MwaOWLaLw0ZtaDZH2kCHEO676RlW1HmdNwLs5ucFuqMSaLMuqbAylPBfCr3bsxKeHi5gOeG0Asp1FpZZYEkarjXSkIxiiBHY%2FgoizHbMOFnqFX6yDv%2FnkEDhbjjXDcHQIMkuVENJGe%2Fua6jPFa%2B%2BpGRdaV0fYsXzwYZe4Y5Wpx7FhfJNP0C%2FeBPB1xEeLRwn9CBD3l9Tz4tXMCeW8V%2F1cE51pHTwK9ScI0JOJ1U8bP3fFGg8NKvE%2Bw9DZM6J4jr1%2FzNRJU3erML%2BE4c8GOqUBZuwe7jHT43XBO1gmWW5zlXZ0I6fmas6UGgZHQG5q9KC2vjfmMD8G8A45prd%2BO76cukXqhCpOzs3jl5LPABGxBI9o4PfaQtzKmML7a0%2BLLYkQxVXr3xQhcjFC5ZPuvfBrlqOZOFACV5Sz5wQ0NyoQUld2C3%2FuoQec43Lzs3KrmpoUmjC8%2BtvYy%2Bd6EOps7VDlL6lYfma0YoQeeI3Cp6EhG2iRPgVv&X-Amz-Signature=16a532421c2781677fb36494554a54bd7555c7961f29d9297eab78abd2b47484&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667B5TCQFM%2F20260504%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260504T081529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFZF9wdMQwj0HHIjASvbdxPS4FPeT%2FjOsoGzBBvdObPPAiEA3VNGNMnv8SZn3F29itfiaNpPQduObIq%2F9MJsdm0zNMQq%2FwMIaBAAGgw2Mzc0MjMxODM4MDUiDDNwug18h8qdVKioACrcAw%2F5fKvmO%2BoVqIQU1nL6ItTeEaKN2XAV9GfajLp9NoPSIxogM4pYsIQbZQq3mw8rorlTSMT2ks70phDmOOFJITjWcOD1wZEcF4kq5t48vewThN9wX0MQBjUmOjr8oKlcznkKKfxRpGhjXxGWToC4xzE6v36rMcx5sX742i5FaK0vhqfVth%2BQsBl3b1oGL5el%2B53hIGUzlMKe%2FyetUM5TOqTvKq%2Fo6E8P7Em9Q8FhnWNGo2AVWr6nYWB5jzF7Ll048xybYznRtUKzvIF9DZ4JlBWNL4kplNEehDka3rcLsoPRP%2BwABn3r18L5Ff3wtV1rvdtypDTMn24C7agQ3iXx5sHpIKS7rWW49gm%2FBhNLWPRFI9ZiRR7MwaOWLaLw0ZtaDZH2kCHEO676RlW1HmdNwLs5ucFuqMSaLMuqbAylPBfCr3bsxKeHi5gOeG0Asp1FpZZYEkarjXSkIxiiBHY%2FgoizHbMOFnqFX6yDv%2FnkEDhbjjXDcHQIMkuVENJGe%2Fua6jPFa%2B%2BpGRdaV0fYsXzwYZe4Y5Wpx7FhfJNP0C%2FeBPB1xEeLRwn9CBD3l9Tz4tXMCeW8V%2F1cE51pHTwK9ScI0JOJ1U8bP3fFGg8NKvE%2Bw9DZM6J4jr1%2FzNRJU3erML%2BE4c8GOqUBZuwe7jHT43XBO1gmWW5zlXZ0I6fmas6UGgZHQG5q9KC2vjfmMD8G8A45prd%2BO76cukXqhCpOzs3jl5LPABGxBI9o4PfaQtzKmML7a0%2BLLYkQxVXr3xQhcjFC5ZPuvfBrlqOZOFACV5Sz5wQ0NyoQUld2C3%2FuoQec43Lzs3KrmpoUmjC8%2BtvYy%2Bd6EOps7VDlL6lYfma0YoQeeI3Cp6EhG2iRPgVv&X-Amz-Signature=bbc409aa0cc471e68c09774bc6f2c6780d13933f90650e218d516d6a253b6a3b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
