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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTSPEKXJ%2F20260302%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260302T183235Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCohEUSTaU%2BhpWBpYHxwUjv3V22Bo9V2ooMhDNxwR7LiAIhAMTvYjJqk77LOSIMDrIwFQE2bi7e1MbIQT%2BeYr%2B5my0mKogECIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyWNQfFIK%2B2NO%2FCiJUq3AOjF0KsyRwoJnfrc6uuKbluWeBFgTeEerNuc5mxkGaOTf2gzvlazhNgAXI3owKs9x0PPz2lsctSmkdjt5O8OYYCy0%2BZoR0ivapnnHeUqs1LvMM%2BGbPEzz1Rk5BkX9xauufVhl0pqmWQIoA6Kn0fNQcLRzrxSejkfcEKgXT150R0zSscu1VSu%2FzcK31bLCtSkIopVoot7PQ8JhS4OxSkd1k1FpkdpocRljQFTBPpyb0gXe8k0fG1cCMcSfdqx4C8ik2n75%2BpMYi%2BMI19he4IDd%2F2wLmicO5ksMCrBAUoEsLSJSeNQw0g%2FH9HyUT3uoR3tO2pp13peqbRgodeLy6hOHms%2FjhZPVKaP4mQrUHuA%2BrPihTMwSIi%2Fkl4HaUxRNqXQoy7reqWAV8MK1R%2Fzlxs3ftIEeZHCyUA1fBuughHtDhyDT98Al0l3%2BiTrN1xVlc%2FAIj2Ne2cL7T%2F1bEO%2BEdLIBuhHLwEHNZZMQ04pnjBM1QrjCR081mDD86YsHinvFrMx230pGw%2BSuerAOhOdPWtISl9oZuDsHQn8Ulw31mj7tO5O3%2FmIy8MiHp%2F2S7iiXxRHeRuyYLGp%2FeCkVWWaJQP9AFiOGNkcmdXEH1L9xCB6r%2F3%2BsSvXudfm833uFim1jCPnZfNBjqkAffPeXW9kplt9C0TT%2BzvMgCZ8qk385Rwt%2FEcv6rxYg4Hxe6VMNxf8%2FpDQOlb2Yw0D0EHcZUNpHP3XULLmZrnWGK3CFK7JoNStoewhf7sjX9MSaAwoG%2B7FPAFNj6128ppg9%2FUbzaCmEA5MfR753UTGAIBtAw%2BE7jQjU4hhsn73NH684FcxFl%2F9KLEvnXQBhZfh5AgyA6n8UEGqFNC4uYOc63b3pTI&X-Amz-Signature=ba642aefe37261cc644cd201205c72a559e9f1dab31d55a14d03018a67088c4f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTSPEKXJ%2F20260302%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260302T183235Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCohEUSTaU%2BhpWBpYHxwUjv3V22Bo9V2ooMhDNxwR7LiAIhAMTvYjJqk77LOSIMDrIwFQE2bi7e1MbIQT%2BeYr%2B5my0mKogECIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyWNQfFIK%2B2NO%2FCiJUq3AOjF0KsyRwoJnfrc6uuKbluWeBFgTeEerNuc5mxkGaOTf2gzvlazhNgAXI3owKs9x0PPz2lsctSmkdjt5O8OYYCy0%2BZoR0ivapnnHeUqs1LvMM%2BGbPEzz1Rk5BkX9xauufVhl0pqmWQIoA6Kn0fNQcLRzrxSejkfcEKgXT150R0zSscu1VSu%2FzcK31bLCtSkIopVoot7PQ8JhS4OxSkd1k1FpkdpocRljQFTBPpyb0gXe8k0fG1cCMcSfdqx4C8ik2n75%2BpMYi%2BMI19he4IDd%2F2wLmicO5ksMCrBAUoEsLSJSeNQw0g%2FH9HyUT3uoR3tO2pp13peqbRgodeLy6hOHms%2FjhZPVKaP4mQrUHuA%2BrPihTMwSIi%2Fkl4HaUxRNqXQoy7reqWAV8MK1R%2Fzlxs3ftIEeZHCyUA1fBuughHtDhyDT98Al0l3%2BiTrN1xVlc%2FAIj2Ne2cL7T%2F1bEO%2BEdLIBuhHLwEHNZZMQ04pnjBM1QrjCR081mDD86YsHinvFrMx230pGw%2BSuerAOhOdPWtISl9oZuDsHQn8Ulw31mj7tO5O3%2FmIy8MiHp%2F2S7iiXxRHeRuyYLGp%2FeCkVWWaJQP9AFiOGNkcmdXEH1L9xCB6r%2F3%2BsSvXudfm833uFim1jCPnZfNBjqkAffPeXW9kplt9C0TT%2BzvMgCZ8qk385Rwt%2FEcv6rxYg4Hxe6VMNxf8%2FpDQOlb2Yw0D0EHcZUNpHP3XULLmZrnWGK3CFK7JoNStoewhf7sjX9MSaAwoG%2B7FPAFNj6128ppg9%2FUbzaCmEA5MfR753UTGAIBtAw%2BE7jQjU4hhsn73NH684FcxFl%2F9KLEvnXQBhZfh5AgyA6n8UEGqFNC4uYOc63b3pTI&X-Amz-Signature=b9a690cc310b43a5d472b7b9736d1e8a95efac9d4694b0889fea1bad03ff12b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
