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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3XOWQCL%2F20260528%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260528T094315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICV9wPLnyi2VZnvYuIi%2B1YKkyHWpSeu4ZmGJLy%2F%2BmExgAiBnqHOt9pbK2occbUDxPq8hTse4AhJcB9kPDimzjtrzOyqIBAiq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4jpMnNChCcEHPKjLKtwDmdnQCKzIj8reseGqKZ%2Ba%2BEDQgDWDNC7TO13oFgHYlUyWwhL3%2FoLp4DqsWQXgF2Ab5fEnmm0aYP8PjXd0%2FwmaMTVYactbqoVI%2B5a1WeH0wb4PXBD%2FcRhVntvyCiGyAm8yShr%2BBO7ZETuRW1u%2Fz3MBVCNC%2Bg3Ln%2FLq3Mfrw7AQK0MZneG0iTCQhUNk3zpzaX%2FqCM1k6m%2BSXfrcFBazPWYkhE%2BXIL6uq8FxY22WoRlpmNxrJepLt52kEgZitEX9Id88g2aQQ323nlAGk7%2BQJP5mcR4XYSJSV0fKDi2EZEk7eVcnkXCle8n2swDsbBMiVl6%2BCYkByR2wSbxtHC6R3b%2BcJaaux6F1j1dA7m%2B%2BXM3QT71GAjHfa3cj7SljxHi%2BN0VsSv7mPzefsc232fAoWu7hIiJuV0Qfhl%2BM%2BFZr0Al3CMuK1Zv3lGlnX%2BTFVkhoQLQMvUMvNkrtlimqK306WDkZODRMy%2FjUoIg2wXXqM4OgYRw7l5JmthL%2BdAkmQdofNZ2HD0t6OpZljMK%2BCv%2FxyBbAYzPsOi5qm6q99o4F076NtXnuhxbZLt1fJ1xolURnb6ixFiO%2BUGDGsEgpR2EniaoyIuupQOo%2BjxvbA7qbTv4HEoNfc2OgQS65cq9vTGMwm5Lg0AY6pgHky8XM1mMcOszLin%2FBu7UIFwkeZQ02qt8zmU1lJWddpPiDO8%2FiiCh7%2B78D6Z6LZUjtsToAMlKpmfpTqSFt3WkJF56BxLsA1hRDxvfjvTBAWzEiz1cVsyzbkC0U%2FDfhjPjs9SOG4bIBQG7unlo%2FYnPi%2F2Xm7GRzI7buewnQirrJ%2F6APu%2BBE7mPPu1n7yrvg6EnNzR7RxkFDzel2DdjSBCH8g18wLfbG&X-Amz-Signature=f15d4451bec9b7aa55db4011f30a3479f59c2e02f3b2c6b42afcd5665c11d0cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T3XOWQCL%2F20260528%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260528T094315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICV9wPLnyi2VZnvYuIi%2B1YKkyHWpSeu4ZmGJLy%2F%2BmExgAiBnqHOt9pbK2occbUDxPq8hTse4AhJcB9kPDimzjtrzOyqIBAiq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4jpMnNChCcEHPKjLKtwDmdnQCKzIj8reseGqKZ%2Ba%2BEDQgDWDNC7TO13oFgHYlUyWwhL3%2FoLp4DqsWQXgF2Ab5fEnmm0aYP8PjXd0%2FwmaMTVYactbqoVI%2B5a1WeH0wb4PXBD%2FcRhVntvyCiGyAm8yShr%2BBO7ZETuRW1u%2Fz3MBVCNC%2Bg3Ln%2FLq3Mfrw7AQK0MZneG0iTCQhUNk3zpzaX%2FqCM1k6m%2BSXfrcFBazPWYkhE%2BXIL6uq8FxY22WoRlpmNxrJepLt52kEgZitEX9Id88g2aQQ323nlAGk7%2BQJP5mcR4XYSJSV0fKDi2EZEk7eVcnkXCle8n2swDsbBMiVl6%2BCYkByR2wSbxtHC6R3b%2BcJaaux6F1j1dA7m%2B%2BXM3QT71GAjHfa3cj7SljxHi%2BN0VsSv7mPzefsc232fAoWu7hIiJuV0Qfhl%2BM%2BFZr0Al3CMuK1Zv3lGlnX%2BTFVkhoQLQMvUMvNkrtlimqK306WDkZODRMy%2FjUoIg2wXXqM4OgYRw7l5JmthL%2BdAkmQdofNZ2HD0t6OpZljMK%2BCv%2FxyBbAYzPsOi5qm6q99o4F076NtXnuhxbZLt1fJ1xolURnb6ixFiO%2BUGDGsEgpR2EniaoyIuupQOo%2BjxvbA7qbTv4HEoNfc2OgQS65cq9vTGMwm5Lg0AY6pgHky8XM1mMcOszLin%2FBu7UIFwkeZQ02qt8zmU1lJWddpPiDO8%2FiiCh7%2B78D6Z6LZUjtsToAMlKpmfpTqSFt3WkJF56BxLsA1hRDxvfjvTBAWzEiz1cVsyzbkC0U%2FDfhjPjs9SOG4bIBQG7unlo%2FYnPi%2F2Xm7GRzI7buewnQirrJ%2F6APu%2BBE7mPPu1n7yrvg6EnNzR7RxkFDzel2DdjSBCH8g18wLfbG&X-Amz-Signature=bc24805f442a76d16fbe77f770e88abc6b7c17afd75e5371197a2f15a298946e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
