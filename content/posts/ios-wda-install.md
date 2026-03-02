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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665IE5M3L7%2F20260302%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260302T064318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIA4gy4aNuBC2Dxk4xsDmQ8F7qoQqCAx7C24FhGBnEL7rAiEA%2BMqm2qmD%2FZnwlamZYcbwIyANU9ihBBLpx3jZJdSyVJcqiAQIgP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLl%2FNXS9k9ovtS64PircA0yXQhUAheWxyst%2F8HGwwQx3%2FrxZ6dM7JglniEQHx0JTjQ3q%2F9OEK10Uof69hlxVM7OHD8Ay0%2Fww3hoZ%2FWH8gGGC%2FTXBnVyMadx9rdxVpw7RQrvkeF9uWa7Ie5f0Qr91ABwf152L5vqC1u6oGlSRFWaBiXZkeNXRbVB%2FeyPHPE%2FBST2ZToiK07gqb17hF5wI5MGZqF9sU83ewPrMcjB%2B4YyMl9%2Fi4vpA8bigOd7q%2FWKmC1QNW2ySXx5q4spgARBr%2Flm8uj3Q4q8g245VyB9aFSf95POhJBxHVotOS7Aa%2FgpmMTUxP%2BnXW6XTcrVKOLTjtkEGrAFzx9VkWyHBcv%2Fa71%2FFXNSZnu8pysoY9JVqpBBYMlgMaY9Bixytyp0ob6zM0C%2FQr6qZazy6MYtnGAwksRHE%2FxKjsa56UqVDc5lMaKWapDr%2B0gy%2B2wZemQGnF%2BNUUwwcUaQaXPs1hDr6UxchqGCoaWARqgTJek41degAkL5q9ykBxYZ84A0s4X%2ByFHSfslzfVOkFln0%2F%2FX0NhJPuIU4C9pHp3E0r0WJMp9OwpBEoV0b1kmV9KdfaL4Z%2BPpjJHr5x3WOxlp5OD%2BoDm5ZtAaoAVU86ysU4Mfylf13qCBD6VdxzsHmof9DPMf3DMIrglM0GOqUB1ak9J23OgtWLJPaRFjaQdcXvVZHMkcbFGGILBz8yO4ib8yf1X6HP97MkwdbJjiGHX58CxLjbWtrkr4lN07dw%2Bm6zeDZbrktZ14LpnUUBMrBhlV8OpBg7VzAlOIVWvq5NvUH14ywW7r3CcDMZkt9zY1trkIeRGyEjakQGdHfACUm88M03UONANEjftuvuza4HDoTGYXDWZ7R4h2avuo2o704mD%2FcT&X-Amz-Signature=cb53877a8eca024ea6e8b5606eb0250db1e02bf57a4ad41f250aef7a36636d0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665IE5M3L7%2F20260302%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260302T064318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIA4gy4aNuBC2Dxk4xsDmQ8F7qoQqCAx7C24FhGBnEL7rAiEA%2BMqm2qmD%2FZnwlamZYcbwIyANU9ihBBLpx3jZJdSyVJcqiAQIgP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLl%2FNXS9k9ovtS64PircA0yXQhUAheWxyst%2F8HGwwQx3%2FrxZ6dM7JglniEQHx0JTjQ3q%2F9OEK10Uof69hlxVM7OHD8Ay0%2Fww3hoZ%2FWH8gGGC%2FTXBnVyMadx9rdxVpw7RQrvkeF9uWa7Ie5f0Qr91ABwf152L5vqC1u6oGlSRFWaBiXZkeNXRbVB%2FeyPHPE%2FBST2ZToiK07gqb17hF5wI5MGZqF9sU83ewPrMcjB%2B4YyMl9%2Fi4vpA8bigOd7q%2FWKmC1QNW2ySXx5q4spgARBr%2Flm8uj3Q4q8g245VyB9aFSf95POhJBxHVotOS7Aa%2FgpmMTUxP%2BnXW6XTcrVKOLTjtkEGrAFzx9VkWyHBcv%2Fa71%2FFXNSZnu8pysoY9JVqpBBYMlgMaY9Bixytyp0ob6zM0C%2FQr6qZazy6MYtnGAwksRHE%2FxKjsa56UqVDc5lMaKWapDr%2B0gy%2B2wZemQGnF%2BNUUwwcUaQaXPs1hDr6UxchqGCoaWARqgTJek41degAkL5q9ykBxYZ84A0s4X%2ByFHSfslzfVOkFln0%2F%2FX0NhJPuIU4C9pHp3E0r0WJMp9OwpBEoV0b1kmV9KdfaL4Z%2BPpjJHr5x3WOxlp5OD%2BoDm5ZtAaoAVU86ysU4Mfylf13qCBD6VdxzsHmof9DPMf3DMIrglM0GOqUB1ak9J23OgtWLJPaRFjaQdcXvVZHMkcbFGGILBz8yO4ib8yf1X6HP97MkwdbJjiGHX58CxLjbWtrkr4lN07dw%2Bm6zeDZbrktZ14LpnUUBMrBhlV8OpBg7VzAlOIVWvq5NvUH14ywW7r3CcDMZkt9zY1trkIeRGyEjakQGdHfACUm88M03UONANEjftuvuza4HDoTGYXDWZ7R4h2avuo2o704mD%2FcT&X-Amz-Signature=7ecc2d89ced5bdbc58be6e8dd3442a4b4244122e7b7fca47608756a3fa9c008f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
