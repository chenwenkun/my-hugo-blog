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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBBSP4PQ%2F20260410%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260410T071440Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF8aCXVzLXdlc3QtMiJIMEYCIQDr94RkEAJYtHceYmre3gz%2FjYGvR6If4w9hh%2Fox5i2BuAIhAKG%2FUBnKGIPD2IWLzJ62madGdTMDwzWinRiTe%2BslRPAsKv8DCCgQABoMNjM3NDIzMTgzODA1IgwhfHqXgbgoVbFzBCEq3AMj%2BzUyfZTgnYAYJiEqDNx5FjEKhTbP91vHoIgTdxysrVrAdMrjprYArmmIYCI9wPxF%2B1p6b5s27GNhUq31LjY72hX7HS85PHVwla3nJagOI%2FdFo4Frptb6f20nofAUB5a%2BvPqsbVuFjGAKRQ4Cv%2FR9HXqlhA31RDsJHqlHKsHlBNnTXwr0Z4zgB%2B%2FaVz6hnQjRHjtCC6ptOhGw%2FM8GUutdUed6JK9pwufxwrn7alHO2PDgEfxPRFbub3bzguWdqNrXmmrlXGFS8ZAzpH3KHJIkwq1PNIZDCuSSXIFVQzBGfy8priIX6KfJi4WNHojPmknVAsR77EVLzvwEJBsjCqcDzpPvtZSrSAe2i%2BBScaUIC2qJgYs%2BSK9cTz8BOhl4o9EzEQWCmDfjLGc6OuJhdqAltDOQCiiOjvOSbOvyD1Y%2Fw58bX3DxsyZckQ55dNI3XqexMo4xzdYxfCf7Qiu8Ncah9r0I4uYhanNb5RVGt2lou8PQ%2BbfvtHbp7zo1jFHFK%2FCoc%2B%2FMzviCFJ80gKpBmeJPJaWxwKz6Oy4gin%2BcsdLQvwhhQR5LH8N6FaCebsuRG%2BenF87GCiCmg%2BjOiRZdMUGgCcXuzxsPAWMyAypZ%2BzkbpjdMwi%2B7oT2nvfZ%2BBDD2suLOBjqkAbXBeuJ7rBluObyvsgzMZSZKvpIMafcnnSsadwQUDcSUflAU%2FRkR3rWVuzQW%2FoYzwD7l1AHUsdVRmQ%2Folex%2BE8XEPVoHJhQyEt8LdZmMKsP8eQ63GHDJSp5mawu%2BxUxVhX6UhKLCVxY7RUxRZH6kr6AVovaxC0qG%2Bte09qPt1hXOEs4ptHmIkgFr3H9f1vorzMIuSTqYCamb6d1xZU0bRcVBljcL&X-Amz-Signature=2e87373f70eb0b2ee042502f0139fc6029da1294482a0be7a8ecbdcd26c57677&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBBSP4PQ%2F20260410%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260410T071440Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF8aCXVzLXdlc3QtMiJIMEYCIQDr94RkEAJYtHceYmre3gz%2FjYGvR6If4w9hh%2Fox5i2BuAIhAKG%2FUBnKGIPD2IWLzJ62madGdTMDwzWinRiTe%2BslRPAsKv8DCCgQABoMNjM3NDIzMTgzODA1IgwhfHqXgbgoVbFzBCEq3AMj%2BzUyfZTgnYAYJiEqDNx5FjEKhTbP91vHoIgTdxysrVrAdMrjprYArmmIYCI9wPxF%2B1p6b5s27GNhUq31LjY72hX7HS85PHVwla3nJagOI%2FdFo4Frptb6f20nofAUB5a%2BvPqsbVuFjGAKRQ4Cv%2FR9HXqlhA31RDsJHqlHKsHlBNnTXwr0Z4zgB%2B%2FaVz6hnQjRHjtCC6ptOhGw%2FM8GUutdUed6JK9pwufxwrn7alHO2PDgEfxPRFbub3bzguWdqNrXmmrlXGFS8ZAzpH3KHJIkwq1PNIZDCuSSXIFVQzBGfy8priIX6KfJi4WNHojPmknVAsR77EVLzvwEJBsjCqcDzpPvtZSrSAe2i%2BBScaUIC2qJgYs%2BSK9cTz8BOhl4o9EzEQWCmDfjLGc6OuJhdqAltDOQCiiOjvOSbOvyD1Y%2Fw58bX3DxsyZckQ55dNI3XqexMo4xzdYxfCf7Qiu8Ncah9r0I4uYhanNb5RVGt2lou8PQ%2BbfvtHbp7zo1jFHFK%2FCoc%2B%2FMzviCFJ80gKpBmeJPJaWxwKz6Oy4gin%2BcsdLQvwhhQR5LH8N6FaCebsuRG%2BenF87GCiCmg%2BjOiRZdMUGgCcXuzxsPAWMyAypZ%2BzkbpjdMwi%2B7oT2nvfZ%2BBDD2suLOBjqkAbXBeuJ7rBluObyvsgzMZSZKvpIMafcnnSsadwQUDcSUflAU%2FRkR3rWVuzQW%2FoYzwD7l1AHUsdVRmQ%2Folex%2BE8XEPVoHJhQyEt8LdZmMKsP8eQ63GHDJSp5mawu%2BxUxVhX6UhKLCVxY7RUxRZH6kr6AVovaxC0qG%2Bte09qPt1hXOEs4ptHmIkgFr3H9f1vorzMIuSTqYCamb6d1xZU0bRcVBljcL&X-Amz-Signature=3948f47877c4a1526c0911e2000603dc2643c6b58f4589864fd40b00e210575c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
