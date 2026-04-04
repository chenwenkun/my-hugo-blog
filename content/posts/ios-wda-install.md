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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VMXJFWJW%2F20260404%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260404T182637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAxxceo3eCZqxJBEEegGsG7VX2SHACM%2BF%2BaHRAKiU%2FyUAiBkHRdPEmy6ey0EDNrWoX2riX6crE%2FLD042sasxCex8JiqIBAij%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMWybfg1ennmVOfuOQKtwD67y61mWjn3Id9ExegBPD9hyiOB7VZc7LG%2FoMCVjWlSVbkrYf4rLr22mfEBIl7GffydMM9DwEHA84XdeXiIZHf6lcLPsl7Ap5Pg6gAx1KZahts7rYJGwaiIb9ZePDarGnkSrYoc74wg1g2r5YOM%2FkqxDT1OJD9Fy63AxFkNrpqCrfXqhbBwj960zNS%2BxA65Qimchar4GfKLOo1Z3QvJCi97pfi%2B3y0JvrHAzC%2BflU%2B3CcY5XZNRFUmJ56kSQakiKuVAq%2FDAjOB3AiLrviVOgdGjI6QXDiWxMZa%2BCofBJibaWIskwmj9csuRDzhqBTYgrkyzceCGl4oQhiiY6Qf2amnu3jpL24XIlR1xBmdZ%2FwSzzagn%2F%2FcXoGBk99wg06y7%2F1X1cvYWYCx%2FjN6p5YVwvouSa7knon7si0WReP8rufqqu24p7uyUKinzJE9isoTzZlJPEOq6JEoqRWzf0nI8SUgjTXv5GjOe%2Fvo5X1SKq4JVi4mpNV2wry29IZaNQNRpkNP2HteC%2BSSOzFCYgQPZLijamHPogPyhqjzaJ7Gs4WNkldaRHi2o7jvngcLo1yuslRslb%2BVMgElkA1EOoRykQ7UhvMpBA6J8fm%2B7drQ5jdMkjjck17qUmBDZZOXMEw8KfFzgY6pgGRHipWnWFo20kS%2FyrQRQSL3iZE5V%2BU%2BIRHNKqtL1YklTwUD2kDq0WkEq8k7YELiFC6dPK2pmpthlmbTAus1AC1uG07m1O%2Bu%2BjKt%2BL%2BqtRfABuUAgTuG93rxERFCpa5i86u%2Fkc30MgYBa2PGlKV3Bl5eTgd9vs1JP8WWFGlW%2FTTVTSOhDQfBqHLDfLP6N4QaO905am%2FxTPy1TP3L6O%2B%2BFEgdqvs%2BOuu&X-Amz-Signature=9e08ab776f6c34ccdf9d9f0ee7d459f9c3176ad474d5bd16e6f3465d849739cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VMXJFWJW%2F20260404%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260404T182637Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAxxceo3eCZqxJBEEegGsG7VX2SHACM%2BF%2BaHRAKiU%2FyUAiBkHRdPEmy6ey0EDNrWoX2riX6crE%2FLD042sasxCex8JiqIBAij%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMWybfg1ennmVOfuOQKtwD67y61mWjn3Id9ExegBPD9hyiOB7VZc7LG%2FoMCVjWlSVbkrYf4rLr22mfEBIl7GffydMM9DwEHA84XdeXiIZHf6lcLPsl7Ap5Pg6gAx1KZahts7rYJGwaiIb9ZePDarGnkSrYoc74wg1g2r5YOM%2FkqxDT1OJD9Fy63AxFkNrpqCrfXqhbBwj960zNS%2BxA65Qimchar4GfKLOo1Z3QvJCi97pfi%2B3y0JvrHAzC%2BflU%2B3CcY5XZNRFUmJ56kSQakiKuVAq%2FDAjOB3AiLrviVOgdGjI6QXDiWxMZa%2BCofBJibaWIskwmj9csuRDzhqBTYgrkyzceCGl4oQhiiY6Qf2amnu3jpL24XIlR1xBmdZ%2FwSzzagn%2F%2FcXoGBk99wg06y7%2F1X1cvYWYCx%2FjN6p5YVwvouSa7knon7si0WReP8rufqqu24p7uyUKinzJE9isoTzZlJPEOq6JEoqRWzf0nI8SUgjTXv5GjOe%2Fvo5X1SKq4JVi4mpNV2wry29IZaNQNRpkNP2HteC%2BSSOzFCYgQPZLijamHPogPyhqjzaJ7Gs4WNkldaRHi2o7jvngcLo1yuslRslb%2BVMgElkA1EOoRykQ7UhvMpBA6J8fm%2B7drQ5jdMkjjck17qUmBDZZOXMEw8KfFzgY6pgGRHipWnWFo20kS%2FyrQRQSL3iZE5V%2BU%2BIRHNKqtL1YklTwUD2kDq0WkEq8k7YELiFC6dPK2pmpthlmbTAus1AC1uG07m1O%2Bu%2BjKt%2BL%2BqtRfABuUAgTuG93rxERFCpa5i86u%2Fkc30MgYBa2PGlKV3Bl5eTgd9vs1JP8WWFGlW%2FTTVTSOhDQfBqHLDfLP6N4QaO905am%2FxTPy1TP3L6O%2B%2BFEgdqvs%2BOuu&X-Amz-Signature=66f9c7a58fc763dab024cb71bbd019d11d06e8d8c072a6dd49c1658720606cbd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
