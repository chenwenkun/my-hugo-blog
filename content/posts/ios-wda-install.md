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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TBXMF55J%2F20260509%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260509T184317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJHMEUCIQCoLw0GANf8yetmIZB%2FSM0ImuXG5N9l%2FNGn64OQ4hO3igIgEdRVZWyZkg3HOSa7abVvzPeQ%2FNAVG5ywDf5LONVpjDwqiAQI6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNERYY3mld4j2k4ZJircAz%2B%2BThthJv3kWZAXkC2UV3PjB9KgL1TTOtgTPtbLLdYToaKdNlXlwv0QSiR13PYO7dJuG0YjRCbmh4KjIIXdLCBgZ2b2eutkxWafxJTbO4dj9%2BSDxZX76Wda3fmcKohJJoZxzCdzMrll1WhgF78wd%2FPcW9VvKfDlfYPl1Ql0uLr3LbkiLSmBvhbkl%2Bsmfq25t84%2BlRBJ%2FvuvKQw5MOTAaTT2pCenZ3%2FpdW3L7hLYX%2BDkXVOYk9d86EIEI32ta8j%2F40Xn3%2FSplhVcRumIOg6fnufOUM2d5GQXPjDGPja08STOjH7oZWpTxIIgGITKjYLn3BNn33KiU1VhMUyiIBZg0e805c6UjTYF5Ia6PJnTXpqVqzfWkErgS8P7BU2yqs%2BnhaLB9PKUWO4ChILXYE%2B4f%2Be3A4blOVQL7rElL5wP0I8Apca%2FaQqhPfJlSadjNoyQo%2B11MzDCfphDVcvM9vThFtgPOAZj%2F%2FScaw350MtvcXMfUyHPzNsZ075yEHWH4D9NJPqYM5v0LWuGX7LpoM3LskHnNcApPtm6c6RxldxPEMm2JJkzZevpX43e1p5zH2%2FRv2%2FK0nTX%2FiXPHlZDEVae6sYix0Qf1oKvaMG%2B8m32ESM2uC8TvdPNeW9%2FixhnMKrc%2Fc8GOqUB%2FsTF2j8U4oKdncps4Q4IllupEOPgYzgxNDrTU%2F330UoIPim7873wMg27Wl6bn2WJRfcHRuFyLVYZ%2FGlW6SRljV9V7O%2By2KYBpVCLTDalYpZF714cCEJ6hoYH2KH1QtlW59qxBD4tns5fbmkfbaOA0QiDZnbU3rk%2BOZWM2WFvzCcnBe13upFi6OLwjEQKf9dwzju99T7CDD%2FgA5XcW5%2FRmIqN%2Fj26&X-Amz-Signature=ed713842a1691b1872ecad989b2a3722915bf9ad9ce4468e0da6555c99e88505&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TBXMF55J%2F20260509%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260509T184317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECIaCXVzLXdlc3QtMiJHMEUCIQCoLw0GANf8yetmIZB%2FSM0ImuXG5N9l%2FNGn64OQ4hO3igIgEdRVZWyZkg3HOSa7abVvzPeQ%2FNAVG5ywDf5LONVpjDwqiAQI6%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNERYY3mld4j2k4ZJircAz%2B%2BThthJv3kWZAXkC2UV3PjB9KgL1TTOtgTPtbLLdYToaKdNlXlwv0QSiR13PYO7dJuG0YjRCbmh4KjIIXdLCBgZ2b2eutkxWafxJTbO4dj9%2BSDxZX76Wda3fmcKohJJoZxzCdzMrll1WhgF78wd%2FPcW9VvKfDlfYPl1Ql0uLr3LbkiLSmBvhbkl%2Bsmfq25t84%2BlRBJ%2FvuvKQw5MOTAaTT2pCenZ3%2FpdW3L7hLYX%2BDkXVOYk9d86EIEI32ta8j%2F40Xn3%2FSplhVcRumIOg6fnufOUM2d5GQXPjDGPja08STOjH7oZWpTxIIgGITKjYLn3BNn33KiU1VhMUyiIBZg0e805c6UjTYF5Ia6PJnTXpqVqzfWkErgS8P7BU2yqs%2BnhaLB9PKUWO4ChILXYE%2B4f%2Be3A4blOVQL7rElL5wP0I8Apca%2FaQqhPfJlSadjNoyQo%2B11MzDCfphDVcvM9vThFtgPOAZj%2F%2FScaw350MtvcXMfUyHPzNsZ075yEHWH4D9NJPqYM5v0LWuGX7LpoM3LskHnNcApPtm6c6RxldxPEMm2JJkzZevpX43e1p5zH2%2FRv2%2FK0nTX%2FiXPHlZDEVae6sYix0Qf1oKvaMG%2B8m32ESM2uC8TvdPNeW9%2FixhnMKrc%2Fc8GOqUB%2FsTF2j8U4oKdncps4Q4IllupEOPgYzgxNDrTU%2F330UoIPim7873wMg27Wl6bn2WJRfcHRuFyLVYZ%2FGlW6SRljV9V7O%2By2KYBpVCLTDalYpZF714cCEJ6hoYH2KH1QtlW59qxBD4tns5fbmkfbaOA0QiDZnbU3rk%2BOZWM2WFvzCcnBe13upFi6OLwjEQKf9dwzju99T7CDD%2FgA5XcW5%2FRmIqN%2Fj26&X-Amz-Signature=be808000bb00f190010df000dc86573520c1a9ab83a69596065ac05e7f69594d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
