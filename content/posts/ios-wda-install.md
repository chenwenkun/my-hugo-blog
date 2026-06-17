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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUUWES6S%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T195757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCd5DA4%2BVoG5D9bg6kI%2BWgW6gxW5DCjW%2BzgVulZHIjK3gIgBbomnJcCyT%2FYDxq0%2Fy4k5891B%2BzRAV3a3W0TFTwX4kQqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOjepjHH6NPmsIn57ircA34NAfWkncJOvg9tTPD1dT%2FMR2MpUXd4KRaogk4%2Fw9Ih6SNk7krW9VeFtk36kenjAU9Hmo0KcUqMH5%2Fy0HkZqveEPiQje8Hj8u%2Fv8t8EgpIc1B4O8VTRF9wIzX2Fs5QSWEdjW5OdNLIyiqJLumHV6K1L%2F297SZQRWYKP57yLtQsw4RPEN51ff9Flceadk%2FAo3YWHixdDLIi6Ov6AfGZupnNFhJJ0g1bAQYuyBBtAT43MPcGfIBV60ep10Xuo9Q2HfKFhAUjY%2FPj6KnMIWwSUDnNnCTGlu0X3x4qVAPHOygAhzOF1JSk1aCJJ21gFOAvQwGznJ9393NW1%2F3OES9vqs%2FEmanG4b2yP9ruIPQMOkcI9tROgF%2BAR%2Fo9ZDrbmJyJf9M5BqbOPotrybeGS5myeawxXNa%2BmYOVs40%2BejZ0inIGiu4r4LoQWNbOIXf6Qv6rKbSv2hmGIwV3Y5tbfLXch7IEiqB2xIqPmvDOwu%2BgQdilnW1iU%2F6o2dyxVbSJD9NuUTOnlMtWEIXGpYr1HjKDwKonyg5ggAwfM8nKlOuGsyd%2FjhBNnaRwXp23vFkfIzH%2FQnM6Gpm8PKoLOi6o1uAnnLvCYaj%2BOc92qz0TMnwJ62zItCy14rUEi%2FmS3S8MqMPray9EGOqUBOzBQsr6CJL3SxwmzCKX%2FKxriL3Y%2BAnId3EvQ9erEhj8ZNUlBbpWVjtdUzlK6D9bsS67VyzUXK93xdogLSt4CgXml%2BTu7sth2lkg1R49XfsLdiAlXA141jBzrHOOpDpym3kdfyxmZzKby%2FSNreLyl35V4PSJG%2FZ6fPsmNH10n%2FfzanupYoT8%2BLp2QViX%2FGAm29aiVXDFig5G4bEl1S79vVV3C8VkV&X-Amz-Signature=8f20076487e6b1d11afa3b8ea394edcfbd913682d48d5bc36bda4e30e97af953&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VUUWES6S%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T195757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCd5DA4%2BVoG5D9bg6kI%2BWgW6gxW5DCjW%2BzgVulZHIjK3gIgBbomnJcCyT%2FYDxq0%2Fy4k5891B%2BzRAV3a3W0TFTwX4kQqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOjepjHH6NPmsIn57ircA34NAfWkncJOvg9tTPD1dT%2FMR2MpUXd4KRaogk4%2Fw9Ih6SNk7krW9VeFtk36kenjAU9Hmo0KcUqMH5%2Fy0HkZqveEPiQje8Hj8u%2Fv8t8EgpIc1B4O8VTRF9wIzX2Fs5QSWEdjW5OdNLIyiqJLumHV6K1L%2F297SZQRWYKP57yLtQsw4RPEN51ff9Flceadk%2FAo3YWHixdDLIi6Ov6AfGZupnNFhJJ0g1bAQYuyBBtAT43MPcGfIBV60ep10Xuo9Q2HfKFhAUjY%2FPj6KnMIWwSUDnNnCTGlu0X3x4qVAPHOygAhzOF1JSk1aCJJ21gFOAvQwGznJ9393NW1%2F3OES9vqs%2FEmanG4b2yP9ruIPQMOkcI9tROgF%2BAR%2Fo9ZDrbmJyJf9M5BqbOPotrybeGS5myeawxXNa%2BmYOVs40%2BejZ0inIGiu4r4LoQWNbOIXf6Qv6rKbSv2hmGIwV3Y5tbfLXch7IEiqB2xIqPmvDOwu%2BgQdilnW1iU%2F6o2dyxVbSJD9NuUTOnlMtWEIXGpYr1HjKDwKonyg5ggAwfM8nKlOuGsyd%2FjhBNnaRwXp23vFkfIzH%2FQnM6Gpm8PKoLOi6o1uAnnLvCYaj%2BOc92qz0TMnwJ62zItCy14rUEi%2FmS3S8MqMPray9EGOqUBOzBQsr6CJL3SxwmzCKX%2FKxriL3Y%2BAnId3EvQ9erEhj8ZNUlBbpWVjtdUzlK6D9bsS67VyzUXK93xdogLSt4CgXml%2BTu7sth2lkg1R49XfsLdiAlXA141jBzrHOOpDpym3kdfyxmZzKby%2FSNreLyl35V4PSJG%2FZ6fPsmNH10n%2FfzanupYoT8%2BLp2QViX%2FGAm29aiVXDFig5G4bEl1S79vVV3C8VkV&X-Amz-Signature=31f3381f33d01b3945552463ffea7afa568bdc15afca076662246df5143f99a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
