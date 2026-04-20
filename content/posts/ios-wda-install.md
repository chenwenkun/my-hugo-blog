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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TNLDE3IE%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T012930Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJHMEUCIQCPlh1P0CMTMYH116%2FYqU1iFbKG5z66wfM1zMWNEFrmNwIgGHrBT5C1oBnQFYrG9KmJw6xvfmbvWIuJAxtl7vUdylAq%2FwMIEhAAGgw2Mzc0MjMxODM4MDUiDMgoC5JxEIFeoGhN%2BSrcAyLj9Uiw3weli7otEK5oQVdhYqNXBJrX2mGqN%2FPnxG%2BS6MXb1D4q69ZMhEZojzyGeL7sYlxag07aNYwpoipe5fWA7ApmuLhR%2FzCu3P1PtwabruXIIU9Uf8zcNGcrC3H5wuDDZu8cE6akQ5AXt0ByfyAC%2BBk%2BFqhXO2wJAj7LughlDeOGxEc3D4NMuvYHK%2B2uE7iex007JqOEpJBqGZO1VkH1EQT26ZdsgNCasBxHJ5aWt4tlnP2YmwMDDTwprtMuwDAhOTv%2BNPi6rw6K5ax8MdmeaJioJmGwfgtKu7TPr0c4WzCrxxgbqY05QT2wUucJHC5k1vlc8jEjSLMFGiNaeYoq2CnCfG2k9BJar2IYr5fxmmJgUvutkcQ27yWNKrVh%2Bdn1GTkFaivxGR3lt3BSiwjAJ44LMu3PBxcD9nQ8Z1jyX%2BzHPYDHnLG5REtSHfnqxX69Yde9jUnVNR6ZLj%2BSwLscRxogchXry4Lde%2FUKzBRYR529woREhmSFjgy4Ta6LriCGJU8nAuOH7kFzkoJQa3wSZ8CPS0XXtY2G3IAOnlwK7V04%2BIlUlDq5vI%2F6Kk7tHMdFulIelGdEJlxzGOx5U0cZ2VypBlsQEtHJx2PQr5WDpMUcV94V9TrVCDH3MLDtlc8GOqUBCRe7yzvi5wLygE7DHsAze1zNEXoV9iZ5oqx6if3HneluiOhBkEEMXK4hzpQhU%2FncOYEfLtmQ3bae9k%2F8sHKs1HHrjsf1vpeL235Sie2LyHtj8QraA65qOXM8JIrC80aEnw36Av1NPHgjLu4j2Hd6PA%2Bs05enhrteBz5iZTGrYyp%2Bqd4QRNXQsI0y%2BvIJdREVv20Lb1JcfEMJVZGjPM5kfkdMoVAF&X-Amz-Signature=8e5660a45d1312d12c536fa311f75bdfd9b40b844f6565b5701544c79511a6ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TNLDE3IE%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T012930Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJHMEUCIQCPlh1P0CMTMYH116%2FYqU1iFbKG5z66wfM1zMWNEFrmNwIgGHrBT5C1oBnQFYrG9KmJw6xvfmbvWIuJAxtl7vUdylAq%2FwMIEhAAGgw2Mzc0MjMxODM4MDUiDMgoC5JxEIFeoGhN%2BSrcAyLj9Uiw3weli7otEK5oQVdhYqNXBJrX2mGqN%2FPnxG%2BS6MXb1D4q69ZMhEZojzyGeL7sYlxag07aNYwpoipe5fWA7ApmuLhR%2FzCu3P1PtwabruXIIU9Uf8zcNGcrC3H5wuDDZu8cE6akQ5AXt0ByfyAC%2BBk%2BFqhXO2wJAj7LughlDeOGxEc3D4NMuvYHK%2B2uE7iex007JqOEpJBqGZO1VkH1EQT26ZdsgNCasBxHJ5aWt4tlnP2YmwMDDTwprtMuwDAhOTv%2BNPi6rw6K5ax8MdmeaJioJmGwfgtKu7TPr0c4WzCrxxgbqY05QT2wUucJHC5k1vlc8jEjSLMFGiNaeYoq2CnCfG2k9BJar2IYr5fxmmJgUvutkcQ27yWNKrVh%2Bdn1GTkFaivxGR3lt3BSiwjAJ44LMu3PBxcD9nQ8Z1jyX%2BzHPYDHnLG5REtSHfnqxX69Yde9jUnVNR6ZLj%2BSwLscRxogchXry4Lde%2FUKzBRYR529woREhmSFjgy4Ta6LriCGJU8nAuOH7kFzkoJQa3wSZ8CPS0XXtY2G3IAOnlwK7V04%2BIlUlDq5vI%2F6Kk7tHMdFulIelGdEJlxzGOx5U0cZ2VypBlsQEtHJx2PQr5WDpMUcV94V9TrVCDH3MLDtlc8GOqUBCRe7yzvi5wLygE7DHsAze1zNEXoV9iZ5oqx6if3HneluiOhBkEEMXK4hzpQhU%2FncOYEfLtmQ3bae9k%2F8sHKs1HHrjsf1vpeL235Sie2LyHtj8QraA65qOXM8JIrC80aEnw36Av1NPHgjLu4j2Hd6PA%2Bs05enhrteBz5iZTGrYyp%2Bqd4QRNXQsI0y%2BvIJdREVv20Lb1JcfEMJVZGjPM5kfkdMoVAF&X-Amz-Signature=c69f52ea1bbc76f40b8385579c68c30b8dc6762f833b925d9b8061555e1f3388&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
