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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662TEFI567%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T020532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAqi9%2B%2FkFv4aagBIGR8rPHuSsIbaF54%2FV7kiP86%2FX2RtAiAeSFJsiAI%2BS%2B7m%2Fhj8b2xmWkG6%2Bf39qiKhCgu1co9M3Cr%2FAwh6EAAaDDYzNzQyMzE4MzgwNSIMhRYtM%2BnjSRFqQeaJKtwDZRnq6NNvOvLN5k%2ByGOBDPzhhlBbixer43rjIT6KkiOL2sZNCTaocY0GKoUkLWMCIDIKgS9FgmaI8zlZ8gNCEeCewNpvpqc2gZqclceMYLksTjzr3LzOwZUVM25Lt3G95PUTNF637SJRE0xStGjQ6ojzchFaGRchj%2BZvQAZo6h7rLyEJRG4WpKPIkR9BPHnxH2gzqtFc6UTempLcRN8%2B1vtAP7qJln%2F7%2BWSUwoiB%2BEhjZFTtGK%2FPOD6D8C8BEUnRAZapBpOje6GdcOx3h%2FiXmH5rfBCDo%2BQVdGPHQzuc5BgqvHK6tkW5m0XFHb4Ba0%2BENM8Ci%2FGVmP%2FWTk4lUD8X8PtUuDbAZzyq5FAJjWtonUKsNsQuEmNRom1C97gcrkg5N%2Fju5q9Y%2BcgXYtluyGPAClRj7bVc7eoKpT4AEpSMyDyybolMiCZUGQK%2FB6g8Pf6sNQNZqP20sROXSlegI8HhGY4R1GKk0%2B5xEclP0CWOlpBWUk2Ukzde5h7lpnfuKPKwGxkl8l7LSR%2FvSAZbw0nEH2PruwxRi8c0bqGhHVJ0TCM7y%2Fg8diP7xM7RMHQMmAfuSbkrHoUZdZyAkJmBTctBoIEI%2BIHNBIVjqKp34Qhz9BLb3WT9GDmVgt%2Bk0f2Aw%2B%2ByN0QY6pgGFR2OjzAAF1lEcqUBI%2FpMX1XWJVgC9nVTvCpp1wALtqmzdnrVIcBYjJbT3qWKerCvH0FSN1jh3tfut7ts9oOVzHY%2FCCcRNtKMWeFO5maaKlNaW%2F8sa1sC3lkj9oCuoUpJnRaO5xXfpa1Xd2miPBCovmhR1stq%2FYURGiiZPG73MRZo%2FWGMok7Ob7Zai3b3obsmAMIKZWWP8h%2BX%2FpyWp%2FoyiG2z8CE48&X-Amz-Signature=1fb51b77835e298a6bde12fda9131954c06de79b45a29375c0a74beebceb8e48&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662TEFI567%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T020532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAqi9%2B%2FkFv4aagBIGR8rPHuSsIbaF54%2FV7kiP86%2FX2RtAiAeSFJsiAI%2BS%2B7m%2Fhj8b2xmWkG6%2Bf39qiKhCgu1co9M3Cr%2FAwh6EAAaDDYzNzQyMzE4MzgwNSIMhRYtM%2BnjSRFqQeaJKtwDZRnq6NNvOvLN5k%2ByGOBDPzhhlBbixer43rjIT6KkiOL2sZNCTaocY0GKoUkLWMCIDIKgS9FgmaI8zlZ8gNCEeCewNpvpqc2gZqclceMYLksTjzr3LzOwZUVM25Lt3G95PUTNF637SJRE0xStGjQ6ojzchFaGRchj%2BZvQAZo6h7rLyEJRG4WpKPIkR9BPHnxH2gzqtFc6UTempLcRN8%2B1vtAP7qJln%2F7%2BWSUwoiB%2BEhjZFTtGK%2FPOD6D8C8BEUnRAZapBpOje6GdcOx3h%2FiXmH5rfBCDo%2BQVdGPHQzuc5BgqvHK6tkW5m0XFHb4Ba0%2BENM8Ci%2FGVmP%2FWTk4lUD8X8PtUuDbAZzyq5FAJjWtonUKsNsQuEmNRom1C97gcrkg5N%2Fju5q9Y%2BcgXYtluyGPAClRj7bVc7eoKpT4AEpSMyDyybolMiCZUGQK%2FB6g8Pf6sNQNZqP20sROXSlegI8HhGY4R1GKk0%2B5xEclP0CWOlpBWUk2Ukzde5h7lpnfuKPKwGxkl8l7LSR%2FvSAZbw0nEH2PruwxRi8c0bqGhHVJ0TCM7y%2Fg8diP7xM7RMHQMmAfuSbkrHoUZdZyAkJmBTctBoIEI%2BIHNBIVjqKp34Qhz9BLb3WT9GDmVgt%2Bk0f2Aw%2B%2ByN0QY6pgGFR2OjzAAF1lEcqUBI%2FpMX1XWJVgC9nVTvCpp1wALtqmzdnrVIcBYjJbT3qWKerCvH0FSN1jh3tfut7ts9oOVzHY%2FCCcRNtKMWeFO5maaKlNaW%2F8sa1sC3lkj9oCuoUpJnRaO5xXfpa1Xd2miPBCovmhR1stq%2FYURGiiZPG73MRZo%2FWGMok7Ob7Zai3b3obsmAMIKZWWP8h%2BX%2FpyWp%2FoyiG2z8CE48&X-Amz-Signature=a98c61c2104a38c58ade4a19cd8172326ed827c99e80c67a7a244334994e4df3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
