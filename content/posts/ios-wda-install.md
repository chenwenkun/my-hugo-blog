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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663UECUMD2%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T023218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJGMEQCIF5MnaZLSZ0W%2F1Ks78n8UmSrlKcit9kOvg%2FkSyibiSfQAiB2E9%2FoiTiLF0bqhyPYmzdoBMVqUQQ3JPUGrjB7kGvlQCr%2FAwgLEAAaDDYzNzQyMzE4MzgwNSIM1OV88VrJALkUxQVdKtwDLnOof0EezoeuVeYbOJjrjtmfIO%2BC5mFCB91EOu5NZJDx9cmVTryeX8OcYtm8mAcr4TbKBM3lm3pSHVf2tpNQr1CgWVuKo6osxikIION7pFvB0JRTW3bz34jN0%2F4VQ3LOy1vT0RfCu%2BwoYXXkRTaL3nehX9k3qbY1hXpbw54l02SGz368S5FIMOzwYdn%2FlL1DodbECijr0GhdP6ZfrZmufSOkUH8awVwrbZzgaOPin6gO3zMW1TDBrEn%2FwdLOiKZtFSFCWsYSklPrEO7VRXyl%2Be1Y0P1REO5etvLyaLSm32Df%2BMFxmevysQdqXgBYgx4n685r5c%2FPwAPivVKrTKl0XOhwtWxl%2BafjIqbczmsBWMWFw%2F1sizQs0syaXSrNHnvVKnNKamuED5NpQHTwZLPCZpe7xJO8haaIa%2BT4Fz0wBx67i8SoENvxpPBGkbOtyMjpkusx2ZMABLUUutJdzGR4RV6dU9%2FBDSzWal1SVAmJbNwW8mNRfcRbGxhs4tMzEL6S9geyvvR1thxYbY2EU0LKOISnCqakHKycOST5%2BAi4E7l40xqEY3NeUHK1U6cVweoVfFKIiOnggntnzGVNX9PnYo3ApYbSjfs3RRskw1Ye021Qtyei1l12Mm2QNbMw%2Bcut0QY6pgHBTPSt401FOTM9qJEXQBdpfzF%2BPKyKWR9injwMX%2FVlQzw3TqbykTjhbrA0dyZ2WMk9EIDFCwknsujZFy2F70vAwrFfNfVovfxhTiYnFIp4NJbB6svBkenF%2Fxg0i9vkwTp2ktQ7UZvBDSQ%2B3C%2BBQBq%2BpC8kad%2FN2pm62yJR6hqa89mqDqUegM7KOCjMHGG%2FlhxndTZ3cL8FcXkIV7SPEYj153ajMJed&X-Amz-Signature=cacc2d230d12eb6fd4c6d4c97bb6ea1c65b354e40fc6dcbbf15f378e780cffd7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663UECUMD2%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T023218Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJGMEQCIF5MnaZLSZ0W%2F1Ks78n8UmSrlKcit9kOvg%2FkSyibiSfQAiB2E9%2FoiTiLF0bqhyPYmzdoBMVqUQQ3JPUGrjB7kGvlQCr%2FAwgLEAAaDDYzNzQyMzE4MzgwNSIM1OV88VrJALkUxQVdKtwDLnOof0EezoeuVeYbOJjrjtmfIO%2BC5mFCB91EOu5NZJDx9cmVTryeX8OcYtm8mAcr4TbKBM3lm3pSHVf2tpNQr1CgWVuKo6osxikIION7pFvB0JRTW3bz34jN0%2F4VQ3LOy1vT0RfCu%2BwoYXXkRTaL3nehX9k3qbY1hXpbw54l02SGz368S5FIMOzwYdn%2FlL1DodbECijr0GhdP6ZfrZmufSOkUH8awVwrbZzgaOPin6gO3zMW1TDBrEn%2FwdLOiKZtFSFCWsYSklPrEO7VRXyl%2Be1Y0P1REO5etvLyaLSm32Df%2BMFxmevysQdqXgBYgx4n685r5c%2FPwAPivVKrTKl0XOhwtWxl%2BafjIqbczmsBWMWFw%2F1sizQs0syaXSrNHnvVKnNKamuED5NpQHTwZLPCZpe7xJO8haaIa%2BT4Fz0wBx67i8SoENvxpPBGkbOtyMjpkusx2ZMABLUUutJdzGR4RV6dU9%2FBDSzWal1SVAmJbNwW8mNRfcRbGxhs4tMzEL6S9geyvvR1thxYbY2EU0LKOISnCqakHKycOST5%2BAi4E7l40xqEY3NeUHK1U6cVweoVfFKIiOnggntnzGVNX9PnYo3ApYbSjfs3RRskw1Ye021Qtyei1l12Mm2QNbMw%2Bcut0QY6pgHBTPSt401FOTM9qJEXQBdpfzF%2BPKyKWR9injwMX%2FVlQzw3TqbykTjhbrA0dyZ2WMk9EIDFCwknsujZFy2F70vAwrFfNfVovfxhTiYnFIp4NJbB6svBkenF%2Fxg0i9vkwTp2ktQ7UZvBDSQ%2B3C%2BBQBq%2BpC8kad%2FN2pm62yJR6hqa89mqDqUegM7KOCjMHGG%2FlhxndTZ3cL8FcXkIV7SPEYj153ajMJed&X-Amz-Signature=ff174bf2199bd5af3408b0841057cd3f6e5ce81dac18c2ccc52dd31254d2e7da&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
