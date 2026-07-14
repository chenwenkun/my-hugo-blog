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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665BSJPZX7%2F20260714%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260714T012313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCIQCjzG3Y97psnJXhYPg9nfz9hjOyy3W2yQHw6UswwiZMlAIgadVJ53mtbOZjOk6L1%2Br0yVmz1B%2Fd6KNYLldIjgJKhIAq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDG%2BKQDALVU9hCbrmOircA0qz3QY6CBeRsZST%2B3NwsxqM5wmGNdPAoQCEXL1YhyHvFtybxNG6%2Fp1pJbTxxZPc7wj%2BYlsrAL3YHMOqZZBhX4650LlqU9Q7%2Bd5dtXRW%2FeEToOiMoerZbEzFYTrHgAlIPq8dMJ1Do%2FPi8VSBf6AEs2ywsTGP5RR0ZjUOJqKDkQkGAE%2FZaVWoCR5xWwTfsAGlefmf%2BSW0yIWQyoHQYlhjWQSth4SLbMpRaTCpfBOBm17TcuM9ClXVRx5xRazjKWfW5aZVuccjH%2BrgjwLUC63nC7x%2F1O%2FwckQjUsMbIRwaD7ucT%2F0XMoXF5u8VaVKqnI%2FT2wb%2BXodT6cnstW6XRGIFY1Fm6LUCqpn9arJUJa9FV5uE%2Fy%2BPMhfKg33VlaO37OZeY0G2eFSRY3HM6F5B4EVk7Zep%2B0OIS9Mxn8Znh1u97kT2hg%2BjAcWaVjyJeFwgx1LtQCw9Shvub8t4go%2BZ5XdUWs6M3%2FAqxNCmyGx3EokOR26vv4N6exZnASQ8G%2BmQ3MiE0YW0gslalIYzxIy%2Ft%2FDCeSehPCBMeCkHXQY0Fkyk7L%2BBPuLjUeiiZLFMvGpDWyAEazS0VfEquN%2FnHcRsQ7DMKyKNNbx4SHau707uw9EpsF3BLRM53Z9pO8U0Y3knMK%2F01dIGOqUBRrBWzEz2c23%2Bz2erSBFuh6Ovo7I6XBiQCFby0ch5WJuWVEPh%2FA5247QTjs5reHtl4oUrhunJzXKzQwhxko%2Fn8owTCsdCC3HsolbgatAE1p9fSmFlTES8EOYdKIhTb6Hl7ccfFJgPclQgSMcRHdEDeB%2BNid%2FVWx29zJw%2BRvjhiHsH8i9q8bkkKWG7frLMRTUUooxzLqRg2%2Fd4oJ5npMuPAZ1w6lF5&X-Amz-Signature=9df38b4e93881987f9e69baa667cb3d66cadbe46a046fc1fe35323575c95e1fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665BSJPZX7%2F20260714%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260714T012313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCIQCjzG3Y97psnJXhYPg9nfz9hjOyy3W2yQHw6UswwiZMlAIgadVJ53mtbOZjOk6L1%2Br0yVmz1B%2Fd6KNYLldIjgJKhIAq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDG%2BKQDALVU9hCbrmOircA0qz3QY6CBeRsZST%2B3NwsxqM5wmGNdPAoQCEXL1YhyHvFtybxNG6%2Fp1pJbTxxZPc7wj%2BYlsrAL3YHMOqZZBhX4650LlqU9Q7%2Bd5dtXRW%2FeEToOiMoerZbEzFYTrHgAlIPq8dMJ1Do%2FPi8VSBf6AEs2ywsTGP5RR0ZjUOJqKDkQkGAE%2FZaVWoCR5xWwTfsAGlefmf%2BSW0yIWQyoHQYlhjWQSth4SLbMpRaTCpfBOBm17TcuM9ClXVRx5xRazjKWfW5aZVuccjH%2BrgjwLUC63nC7x%2F1O%2FwckQjUsMbIRwaD7ucT%2F0XMoXF5u8VaVKqnI%2FT2wb%2BXodT6cnstW6XRGIFY1Fm6LUCqpn9arJUJa9FV5uE%2Fy%2BPMhfKg33VlaO37OZeY0G2eFSRY3HM6F5B4EVk7Zep%2B0OIS9Mxn8Znh1u97kT2hg%2BjAcWaVjyJeFwgx1LtQCw9Shvub8t4go%2BZ5XdUWs6M3%2FAqxNCmyGx3EokOR26vv4N6exZnASQ8G%2BmQ3MiE0YW0gslalIYzxIy%2Ft%2FDCeSehPCBMeCkHXQY0Fkyk7L%2BBPuLjUeiiZLFMvGpDWyAEazS0VfEquN%2FnHcRsQ7DMKyKNNbx4SHau707uw9EpsF3BLRM53Z9pO8U0Y3knMK%2F01dIGOqUBRrBWzEz2c23%2Bz2erSBFuh6Ovo7I6XBiQCFby0ch5WJuWVEPh%2FA5247QTjs5reHtl4oUrhunJzXKzQwhxko%2Fn8owTCsdCC3HsolbgatAE1p9fSmFlTES8EOYdKIhTb6Hl7ccfFJgPclQgSMcRHdEDeB%2BNid%2FVWx29zJw%2BRvjhiHsH8i9q8bkkKWG7frLMRTUUooxzLqRg2%2Fd4oJ5npMuPAZ1w6lF5&X-Amz-Signature=cfd9d99953c4ff8e8e71178d0110d6aab89969e8cfae7376ee59ddd6a5607164&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
