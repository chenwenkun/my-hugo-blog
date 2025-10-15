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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOQ2UQHH%2F20251015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251015T005126Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDO0mlV9q65rQnnveiUW4PrLGMpHJPuq4fJ2S3r04hdiAIgFzXI2p3H6sOTbA888X1IDE%2BKRwrFvYQV4ZBNfX2M%2FA8q%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDGwfg18UM7CMn6DknSrcAxXQafNfZFmm2EKYV9veyFsY1IEZFeOw1wnMZHkh5Pkcl9RLipiMsuwhKpOwxEHPvakW3HUg6yuwaRHUS%2FDoOAOs1V5v1RB8VEtcELUQZdIPI9ylBL0fWhJJ0UVhHYr4LRBd%2Fw6lUelPJ%2FjwZ%2B3o%2BStSktLJpx8QsL8%2BNdttqtagGfhpRzTIcaVLaXgCKl5elphKEFNgObsGpvBnthm%2FwEPxRNvQYr3P9cWvZfTa6tHtpyJpIXUp9HNbJmVjYNNYN8YsEepoG%2Bs%2B1X7j0Y5bPiob0c6ab0oljllk1ESpo1h4xvVTfGaWvtDwNUwm4QWvXkuuoB12eUlJY0FFLxeicPtGx5xBR6VEUL4duC20B51vI%2FRarEVJtULlPJ9fkrhRCYuNIsL3nKznHhtWL1Me0ED8z6CV%2BuncaWo%2FF5Jj1DRqBI4tvBDkKjuFCZb4yRkFU9O9tZrhVrY8x7qxA%2BuuXmZh69uTOAlwSX6yZuX4Fvj1au%2B90W0UOrnMrdRkIGp60fyezYYDDdwriRILwoKa42bZ2zoNp4YCCGHGNYe7RWTUflExfcBPhaWAdqXzkHNmu9McvkQFHUMIY0uqUjAeCH1qer%2FWQ2L4bA7gazdTwDKUJ8Epip6oMbfkbshdMIvdu8cGOqUB5dffx7uA5C7sxYlVJ4Lrx6xW2h%2FRifWKRgjGvsIsVijeWy4EVUsbNQbv6qY8QW8SQS7gM2X2A1lZMbEaIp0UDTvVYLStj76fMGMOZwnUKF%2FgksppWpA9MU649jePnB4JJIcSOFAl4tmtOmm9ZlvMIAxiMTjWbYBQeCtqiMXMAK86Lhfw5RNaSjlCN45AQcQIy1ycPV57dAC4gl%2BwB27VRhDTjK8B&X-Amz-Signature=64f00b8257c1373ce4b5fb15dcf922b56b98b6a97d8d89e0f6069dd2506ff7bc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QOQ2UQHH%2F20251015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251015T005126Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDO0mlV9q65rQnnveiUW4PrLGMpHJPuq4fJ2S3r04hdiAIgFzXI2p3H6sOTbA888X1IDE%2BKRwrFvYQV4ZBNfX2M%2FA8q%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDGwfg18UM7CMn6DknSrcAxXQafNfZFmm2EKYV9veyFsY1IEZFeOw1wnMZHkh5Pkcl9RLipiMsuwhKpOwxEHPvakW3HUg6yuwaRHUS%2FDoOAOs1V5v1RB8VEtcELUQZdIPI9ylBL0fWhJJ0UVhHYr4LRBd%2Fw6lUelPJ%2FjwZ%2B3o%2BStSktLJpx8QsL8%2BNdttqtagGfhpRzTIcaVLaXgCKl5elphKEFNgObsGpvBnthm%2FwEPxRNvQYr3P9cWvZfTa6tHtpyJpIXUp9HNbJmVjYNNYN8YsEepoG%2Bs%2B1X7j0Y5bPiob0c6ab0oljllk1ESpo1h4xvVTfGaWvtDwNUwm4QWvXkuuoB12eUlJY0FFLxeicPtGx5xBR6VEUL4duC20B51vI%2FRarEVJtULlPJ9fkrhRCYuNIsL3nKznHhtWL1Me0ED8z6CV%2BuncaWo%2FF5Jj1DRqBI4tvBDkKjuFCZb4yRkFU9O9tZrhVrY8x7qxA%2BuuXmZh69uTOAlwSX6yZuX4Fvj1au%2B90W0UOrnMrdRkIGp60fyezYYDDdwriRILwoKa42bZ2zoNp4YCCGHGNYe7RWTUflExfcBPhaWAdqXzkHNmu9McvkQFHUMIY0uqUjAeCH1qer%2FWQ2L4bA7gazdTwDKUJ8Epip6oMbfkbshdMIvdu8cGOqUB5dffx7uA5C7sxYlVJ4Lrx6xW2h%2FRifWKRgjGvsIsVijeWy4EVUsbNQbv6qY8QW8SQS7gM2X2A1lZMbEaIp0UDTvVYLStj76fMGMOZwnUKF%2FgksppWpA9MU649jePnB4JJIcSOFAl4tmtOmm9ZlvMIAxiMTjWbYBQeCtqiMXMAK86Lhfw5RNaSjlCN45AQcQIy1ycPV57dAC4gl%2BwB27VRhDTjK8B&X-Amz-Signature=da1cbd5be9dc375df9d78e0aa745886df31c56d24989dfd17a12f140babbddc8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
