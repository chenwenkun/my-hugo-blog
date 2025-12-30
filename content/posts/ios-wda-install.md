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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z6XX2MT3%2F20251230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251230T061912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDURLYj26LAehzsYL0b4rZ4eFEBrsQdjjrf8Etb9FXwYQIgSBfzHiUScGHSjokHuva%2FrLgN%2FgaajTEckuTCWYpnxLIqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK3NChJ5fOhzztpwdircAzXh3fukHcK2zCuzDzdZXGBuQ%2BUCUKJPG%2BGfMY6OZqor2BJ%2FCkjVJksz8%2FSZ7BL6lpowZASJv7SO4W7vIsb%2F%2BoiRoB75VlLhVIgfR8AdIRDV3AWgwDqXEWxPuyp40M611eJSANwEM2VX2XrQvvFNKR4xXpkIfqRyT3rlg6bVqBO6scSV0X7kNvL4dSFe6tC0SdOduimvyK3qpl8jDoJDxUfL3zirJNTBwyg8t0IPck4JHuygwGO3p2OcllAzzsRRgOndJ1cX0oHP5IUreWSeCvcOU6kSS2pMITjzCGU9Cd5dWBUldUGxrbqkgTq66Mf0SGbNbQhrh5QpWI8uOyaZPObPx2J81bn7kiv9g5db9628aZ9KzOLr8DkrDg43VJ%2BkB3mtfrlMIGwdxnP8GxNtb68UHwswrJmqCl8iRUnxO32NLLn3CqM%2F72Oey8fqQhQoGnRufEC4egjfl%2B5lZ80bvy8c4arX0yrIXueGGImHSyK%2FuFNPl9HkA0MK2sWeqOAi4W0SOgiLx6qiZ7wQhpBquHk%2Ffj38nyvKJcE5kMZ3ZRnNZrTV91%2BLARDUV522l9K8ahpjKtUsieXHOjO6%2F2moiyE6pgjLqRcVWS7T%2Fc4RQlqZr3SFCbrOquzhBZ99MO6zzcoGOqUBR1bptQwB4MVjYiG3H8qA4ozrUjQGkETBjHLO7r4vpbSmQ2qwOnS3NPmU8EsvNcveVuXepT4aAQopfqQTMkG%2Bcb0VcE%2F3VEGQy3OMrOGIdOZu%2FL3nd0IIhrTvIht9cSIJspTWA7dbV4Jnw0FmD186xv7iwJoid1S5z38YUXm4EQmEageQRZqeu6j7RT%2BBFytFCvZSE6gUvbqFKaSUk%2FUrisJ%2FwS64&X-Amz-Signature=edcd1940aba02bb5e47d0f66a0a6d19e37ae657576a1603d04c084f63f860d0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z6XX2MT3%2F20251230%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251230T061912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDURLYj26LAehzsYL0b4rZ4eFEBrsQdjjrf8Etb9FXwYQIgSBfzHiUScGHSjokHuva%2FrLgN%2FgaajTEckuTCWYpnxLIqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK3NChJ5fOhzztpwdircAzXh3fukHcK2zCuzDzdZXGBuQ%2BUCUKJPG%2BGfMY6OZqor2BJ%2FCkjVJksz8%2FSZ7BL6lpowZASJv7SO4W7vIsb%2F%2BoiRoB75VlLhVIgfR8AdIRDV3AWgwDqXEWxPuyp40M611eJSANwEM2VX2XrQvvFNKR4xXpkIfqRyT3rlg6bVqBO6scSV0X7kNvL4dSFe6tC0SdOduimvyK3qpl8jDoJDxUfL3zirJNTBwyg8t0IPck4JHuygwGO3p2OcllAzzsRRgOndJ1cX0oHP5IUreWSeCvcOU6kSS2pMITjzCGU9Cd5dWBUldUGxrbqkgTq66Mf0SGbNbQhrh5QpWI8uOyaZPObPx2J81bn7kiv9g5db9628aZ9KzOLr8DkrDg43VJ%2BkB3mtfrlMIGwdxnP8GxNtb68UHwswrJmqCl8iRUnxO32NLLn3CqM%2F72Oey8fqQhQoGnRufEC4egjfl%2B5lZ80bvy8c4arX0yrIXueGGImHSyK%2FuFNPl9HkA0MK2sWeqOAi4W0SOgiLx6qiZ7wQhpBquHk%2Ffj38nyvKJcE5kMZ3ZRnNZrTV91%2BLARDUV522l9K8ahpjKtUsieXHOjO6%2F2moiyE6pgjLqRcVWS7T%2Fc4RQlqZr3SFCbrOquzhBZ99MO6zzcoGOqUBR1bptQwB4MVjYiG3H8qA4ozrUjQGkETBjHLO7r4vpbSmQ2qwOnS3NPmU8EsvNcveVuXepT4aAQopfqQTMkG%2Bcb0VcE%2F3VEGQy3OMrOGIdOZu%2FL3nd0IIhrTvIht9cSIJspTWA7dbV4Jnw0FmD186xv7iwJoid1S5z38YUXm4EQmEageQRZqeu6j7RT%2BBFytFCvZSE6gUvbqFKaSUk%2FUrisJ%2FwS64&X-Amz-Signature=fb869e3a2d709729a2c9ebc4e0df65b7b807f451a7b709e0ff2e9a1bd8c4cc0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
