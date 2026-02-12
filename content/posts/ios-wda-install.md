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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZLDTLLGK%2F20260212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260212T064926Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIQDHkF6mL1sD%2BQwq%2Bs9qPme7PiioQuzGqQQkyVF99GF%2BkwIgANVQZCV4M1tbDWkQfaTYdh08%2Bz08pFbZ%2FQWED5SioJgqiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCaXB8cwQUwgmh%2BheyrcA6MhcbgNauMPEV2xk9c933fsogRrjRms5ruRXvaN7h0e4I8G6%2FpWjAWsxrsVwx9vOZ62YcmN0vwQFs3WBheAKXloOHiy6b7xh4%2F8bQJ89Pqn9QOqAdh8C2N6dk74LclNKmeagDo7ajvRQaE%2BQX2rKrnB%2FbAMMMgoyU%2Fmxb84fS3MdtV54ENdas989CBrfGDoZoNBVo5gXByjewSnHI17BBe5iBJTL1%2BKJs2mY7OItNhqnkaqAVrftuFFwPaMR6I1RYxBK6o7AlM9gWrMUjICrQaqvNT2fXLSAvKZL5PH221MAZuKrUTBYLRXTxQNZ9ZeyPnLwIFHM115JxHcOcBfEXmfbuLVgd5%2BNou6NhDROtzoFobNiJpn2ksjvPxhoJCEd5Jf15FTVwd%2F9ybyYui69ghg2JZ1715bakgKWTik2E%2BoWuH%2Faf7n8irug7eLj689E4C7Al1NjucXYleOKOr%2FKJMKi3vr%2BY82ylN%2FIYui8DHj1sFBYA4MZuIgtAyjar0qSpr31WFvYw47AMU%2B4U4rsXaGYbFT2Aae2rtcPnXZ8n298Hjh%2BErxitZrn0pi25iy30syE%2BvFmn3%2FWGNFEXrk97Vd%2FQ%2Fkyqvb1e3yKSlbiq0hC2NFycLkI74m9s3yMO7ftcwGOqUBHfnodJGSBFmvpjzF2sABekXL6IIET0tePq13asbK3YBs%2F4ZsnVvQCtYA279MKtw%2FlAF91ATHrpgsL2e3V%2FvXal4bWdHGi%2BW4P8JO%2By5Rm3ozwWhRQp0c7mWsveb0zZp5RMesZYDd6pXRaeYUVCZ6Z%2BU47v6F%2BPEyeYu3v%2BOz9YrmMqxp9lpcgmXJ4EYg0JeQbBgadWPywiXZHvSudsLGb%2BIHfLf5&X-Amz-Signature=b50a31320b0d5288c362b2b65ff076b1a7e6661c38a27f249763fb026ddc2621&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZLDTLLGK%2F20260212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260212T064926Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIQDHkF6mL1sD%2BQwq%2Bs9qPme7PiioQuzGqQQkyVF99GF%2BkwIgANVQZCV4M1tbDWkQfaTYdh08%2Bz08pFbZ%2FQWED5SioJgqiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCaXB8cwQUwgmh%2BheyrcA6MhcbgNauMPEV2xk9c933fsogRrjRms5ruRXvaN7h0e4I8G6%2FpWjAWsxrsVwx9vOZ62YcmN0vwQFs3WBheAKXloOHiy6b7xh4%2F8bQJ89Pqn9QOqAdh8C2N6dk74LclNKmeagDo7ajvRQaE%2BQX2rKrnB%2FbAMMMgoyU%2Fmxb84fS3MdtV54ENdas989CBrfGDoZoNBVo5gXByjewSnHI17BBe5iBJTL1%2BKJs2mY7OItNhqnkaqAVrftuFFwPaMR6I1RYxBK6o7AlM9gWrMUjICrQaqvNT2fXLSAvKZL5PH221MAZuKrUTBYLRXTxQNZ9ZeyPnLwIFHM115JxHcOcBfEXmfbuLVgd5%2BNou6NhDROtzoFobNiJpn2ksjvPxhoJCEd5Jf15FTVwd%2F9ybyYui69ghg2JZ1715bakgKWTik2E%2BoWuH%2Faf7n8irug7eLj689E4C7Al1NjucXYleOKOr%2FKJMKi3vr%2BY82ylN%2FIYui8DHj1sFBYA4MZuIgtAyjar0qSpr31WFvYw47AMU%2B4U4rsXaGYbFT2Aae2rtcPnXZ8n298Hjh%2BErxitZrn0pi25iy30syE%2BvFmn3%2FWGNFEXrk97Vd%2FQ%2Fkyqvb1e3yKSlbiq0hC2NFycLkI74m9s3yMO7ftcwGOqUBHfnodJGSBFmvpjzF2sABekXL6IIET0tePq13asbK3YBs%2F4ZsnVvQCtYA279MKtw%2FlAF91ATHrpgsL2e3V%2FvXal4bWdHGi%2BW4P8JO%2By5Rm3ozwWhRQp0c7mWsveb0zZp5RMesZYDd6pXRaeYUVCZ6Z%2BU47v6F%2BPEyeYu3v%2BOz9YrmMqxp9lpcgmXJ4EYg0JeQbBgadWPywiXZHvSudsLGb%2BIHfLf5&X-Amz-Signature=e576745215214426759e3d5cf00b2de1a18b678db6f087346ef9f289c97852ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
