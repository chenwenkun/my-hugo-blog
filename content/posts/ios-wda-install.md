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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRLWQA4O%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T122132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHgpYyI4HOru6d2i4KnnsHSqlcDu1xiHBwVyyjIsqPlKAiEAot%2FDkqHEImCjcL1ciTPVOa%2F16hTHiiCq3Ort6JZw2sMq%2FwMIdRAAGgw2Mzc0MjMxODM4MDUiDIJSTqOSOE5jKcyX8SrcA6Jlv2ZfU7ncWY2epPMJYa%2FMRrRuPIspuJBGTBZr0AYSH2%2FJtuQm0vPPA0L6Q9yNqfRmG6rC7vI9Ts46cX8CxMM2rzdEN%2BLOhf%2FwtoLJ2yVTV5LE1Y%2BCZeDqYNrrtSNMzvHc92B%2FXAV%2B5tRR%2B9TeDbm0FmcN2ILcLB8nIknHtJ%2Bc2DV11qmycNf6z4bMJPeiX7VD3wHpl8om%2FTf3XOtsbBUh36I%2Fi905OgVgWRAWkkvFJ1Lvq1SLc5rocCk0YMoRSmaZaVgllfMgxPoh9876SDczKlfwvlGL4fzeDuT0wqyeSk8JWyCDdJ3teBZW1cEaVUSoJw8r6N3XBjungMIQ5mvblAVb1PvYl6dtGIrTWWulSDEzDX91rw%2Bz1wlokAnuMdluRvMIMypHLW1Jb29Dqi1oQNPzEWWmvJ%2FVauB3rlRBueuYy13WIxx3Ti5rO6FeTjSDS4ravC7qTf5fOYpLpwxjMn7%2BMB%2FRQsuNkvTSjACTm%2F%2FAPriI01sMZF0WXV9kNUtLA8VKzty7NF4ouS67uI%2BKcd6MSwW4wOeOaGOVXDQi0nUmgzJUvUwIvmuBWFZ%2FnyyPOKcuakakLHIrTJCEpHji7%2BpeR2uGN9%2BhPxqPwgqGep6P1itL2BBaZ4bgMJDP1MYGOqUBzueM7h8MDYUlhAAQ%2B9k8TeescPlyWj1bIRobFOg%2FMVjR3nKVCRZBoeZoTzl278bKw1J83UhHVtm%2B1e5I5G%2FDcPiW8qLD5j5xv%2BlOT8mXqc0367coN3Qc7VtnUru5qVt3%2B%2BnpapUi84f7uDfPNHIaXeGVAfITkB5D9MF7bOemP0F9xaVf7rZqYX5kTi7HyjJkq0Dv%2FK8c%2F8Tli20SiRIOBxnSg%2BEk&X-Amz-Signature=37b44b184b5698a471342e4d548eacc887bf13f73599d38a1bd0720655f404d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRLWQA4O%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T122132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHgpYyI4HOru6d2i4KnnsHSqlcDu1xiHBwVyyjIsqPlKAiEAot%2FDkqHEImCjcL1ciTPVOa%2F16hTHiiCq3Ort6JZw2sMq%2FwMIdRAAGgw2Mzc0MjMxODM4MDUiDIJSTqOSOE5jKcyX8SrcA6Jlv2ZfU7ncWY2epPMJYa%2FMRrRuPIspuJBGTBZr0AYSH2%2FJtuQm0vPPA0L6Q9yNqfRmG6rC7vI9Ts46cX8CxMM2rzdEN%2BLOhf%2FwtoLJ2yVTV5LE1Y%2BCZeDqYNrrtSNMzvHc92B%2FXAV%2B5tRR%2B9TeDbm0FmcN2ILcLB8nIknHtJ%2Bc2DV11qmycNf6z4bMJPeiX7VD3wHpl8om%2FTf3XOtsbBUh36I%2Fi905OgVgWRAWkkvFJ1Lvq1SLc5rocCk0YMoRSmaZaVgllfMgxPoh9876SDczKlfwvlGL4fzeDuT0wqyeSk8JWyCDdJ3teBZW1cEaVUSoJw8r6N3XBjungMIQ5mvblAVb1PvYl6dtGIrTWWulSDEzDX91rw%2Bz1wlokAnuMdluRvMIMypHLW1Jb29Dqi1oQNPzEWWmvJ%2FVauB3rlRBueuYy13WIxx3Ti5rO6FeTjSDS4ravC7qTf5fOYpLpwxjMn7%2BMB%2FRQsuNkvTSjACTm%2F%2FAPriI01sMZF0WXV9kNUtLA8VKzty7NF4ouS67uI%2BKcd6MSwW4wOeOaGOVXDQi0nUmgzJUvUwIvmuBWFZ%2FnyyPOKcuakakLHIrTJCEpHji7%2BpeR2uGN9%2BhPxqPwgqGep6P1itL2BBaZ4bgMJDP1MYGOqUBzueM7h8MDYUlhAAQ%2B9k8TeescPlyWj1bIRobFOg%2FMVjR3nKVCRZBoeZoTzl278bKw1J83UhHVtm%2B1e5I5G%2FDcPiW8qLD5j5xv%2BlOT8mXqc0367coN3Qc7VtnUru5qVt3%2B%2BnpapUi84f7uDfPNHIaXeGVAfITkB5D9MF7bOemP0F9xaVf7rZqYX5kTi7HyjJkq0Dv%2FK8c%2F8Tli20SiRIOBxnSg%2BEk&X-Amz-Signature=1476b184a7e4dff2e091aa7cf6ba295316c494f4965dfe725f2114cdcef8d502&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
