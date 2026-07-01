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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46634UOZJSJ%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T192824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJHMEUCIHyxJsjDeG48P2W0GYeASMqLRw1QQjkgSeMy1nfMyq21AiEAtj4MbVuOWqFKYNRU4ZqVOJxsTQAghLJmJXFBp5VyKRoqiAQI5f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFE0bgcQegslRa1cwCrcA%2FegV9UezaNv%2FjXCWNVF8erojDko1z5hGNjOPy66949IEhRNTMkkDkqIcxpWbTg9IaXo3eFtXI1HsASK6Y3fbProZI4f4Iwpb0cfuAszi3fX7ZfTgjXUwGPUtYpxy4qgTDHCoDkBIDOQo%2Fi1p%2F9CcVpsH8AnD9BmLWS1iN58R5l5qjqcHy4RXpvCzUlCoojuI3B9PtRByu9jesLu19rKaCSO6VPUeguvM6Ov0WqUQ5Y27CRarijn4X40yRC6P1OqMS%2FRwkBQaqqWjlqTXvXzEa%2FO5Yp5ly9b%2FdawUIdfOp%2Fnpnk8IYrk%2BjBtVoFrKqGVrao41F19%2F9Ia3xv2093yWNad7NKgxTvA%2Biiouj%2FdjprRnnlKhTVC2l%2FsxOlDIplfyKn10p%2FsCACcXg1%2BbbG%2BeQgF9ZoWBCY8DXsHLborrBXgrlLjtlfIhrK3ZCXwI%2FrJLDlbtdqBltHnCiR27m14iXbdin24AcwkSMeBkNaAg%2B%2FWmN6lARZL8yRDWzoB9W5TwQrgfQTQ0EZnHbWecds7IlLdG6apnQdM7EeJQZPxExp2qCDeLTuEYga4BVZK42NIdMslXi3%2Bcv5UrgERC8cZ5v2Odih2ssaZVEK%2FbHzneQnyKmV5zxWmVsoArbpTMPnSldIGOqUBJP0burYjMSYHmw3HfjgNxaOrP5B8yanRf4TF%2F8348PsnVFUDqK3zpoJuC8z0PlGGA4vPUmpIkCIEPTw%2FoeVktm3P%2BJW1erXcXtvCy5xy5KOIiQTcc5QOEfBTX%2FmPpvt%2BH6nrQWQc63WoxzTPoET6ZEr06YncykXxfM138KBmocN69%2FQb1jp7dHP1HnSrfgROucLNyiCgF2eQPrVWj5CkvBql9J2%2F&X-Amz-Signature=9d29777cb0d4055eb6f47693cdd7cd7920e71e60dcf2f088ea24aa5b925f1ea5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46634UOZJSJ%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T192824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBwaCXVzLXdlc3QtMiJHMEUCIHyxJsjDeG48P2W0GYeASMqLRw1QQjkgSeMy1nfMyq21AiEAtj4MbVuOWqFKYNRU4ZqVOJxsTQAghLJmJXFBp5VyKRoqiAQI5f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFE0bgcQegslRa1cwCrcA%2FegV9UezaNv%2FjXCWNVF8erojDko1z5hGNjOPy66949IEhRNTMkkDkqIcxpWbTg9IaXo3eFtXI1HsASK6Y3fbProZI4f4Iwpb0cfuAszi3fX7ZfTgjXUwGPUtYpxy4qgTDHCoDkBIDOQo%2Fi1p%2F9CcVpsH8AnD9BmLWS1iN58R5l5qjqcHy4RXpvCzUlCoojuI3B9PtRByu9jesLu19rKaCSO6VPUeguvM6Ov0WqUQ5Y27CRarijn4X40yRC6P1OqMS%2FRwkBQaqqWjlqTXvXzEa%2FO5Yp5ly9b%2FdawUIdfOp%2Fnpnk8IYrk%2BjBtVoFrKqGVrao41F19%2F9Ia3xv2093yWNad7NKgxTvA%2Biiouj%2FdjprRnnlKhTVC2l%2FsxOlDIplfyKn10p%2FsCACcXg1%2BbbG%2BeQgF9ZoWBCY8DXsHLborrBXgrlLjtlfIhrK3ZCXwI%2FrJLDlbtdqBltHnCiR27m14iXbdin24AcwkSMeBkNaAg%2B%2FWmN6lARZL8yRDWzoB9W5TwQrgfQTQ0EZnHbWecds7IlLdG6apnQdM7EeJQZPxExp2qCDeLTuEYga4BVZK42NIdMslXi3%2Bcv5UrgERC8cZ5v2Odih2ssaZVEK%2FbHzneQnyKmV5zxWmVsoArbpTMPnSldIGOqUBJP0burYjMSYHmw3HfjgNxaOrP5B8yanRf4TF%2F8348PsnVFUDqK3zpoJuC8z0PlGGA4vPUmpIkCIEPTw%2FoeVktm3P%2BJW1erXcXtvCy5xy5KOIiQTcc5QOEfBTX%2FmPpvt%2BH6nrQWQc63WoxzTPoET6ZEr06YncykXxfM138KBmocN69%2FQb1jp7dHP1HnSrfgROucLNyiCgF2eQPrVWj5CkvBql9J2%2F&X-Amz-Signature=d5bbcfa39f419e4f9a3e1d0a98fd50db9e077f9bf1a40ef72433f1aa93326fda&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
