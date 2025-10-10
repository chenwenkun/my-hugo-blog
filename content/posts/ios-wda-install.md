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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPWERDU4%2F20251010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251010T181545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJHMEUCIQCObfAbod6hqZKW3L1KFy0UF0Y9arxbKn2O5tEe1trzvAIgBOi2SzUPL85%2F8X9xWALLFw2WGaiAkEmxjIkFLo5LHE0qiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPpBr5l7m41l3obS0ircA5acJ1ecaYdyujMLXy4iN%2FgSAerXSRhYolP753uCPC9htW9kaFyfaiCUIaNMv4iTkkyypQcaDeT96Pytalt45KbdqU0PxmPP2ygmwdZwve1FYLlAyT35eprkDTDLc16gD%2BKWYAP7lMiX4KhKM%2FQ5uvgwKnpop9uWZ94fvYFdBCxlTq50FHwQooRxTVRxddR5R8U5B5QUk0SvdGsnV3ghHFVCQ04DvlM2pyIVluYj90JXbV0bigQHL85gHDmqDQw%2FcSANnPz9y9NPVBrEwPSiSHsH2IaWEggSSPLfHwyLTBOgEtilH3Qpnu9hL4uz7QuREK%2Bsbxhi68tQ9Kk%2BB1u4XSiVfh4zesLEFsAJ74j1B07BSUExJZlgP192GspDOrMrOTA7YeIxU6xAyfszpGvqiLTrUJyCOvu0iBqHxhnOP132kbRG0r8Cxj0wm6kuMPM7DW0G9ShCwivAPdoxaNiD17DaylQ%2FLAkEOXzIaR9Qd2pDg2GsnfRZuFTytn5bTJXbtiA4oAod8V0CNXDQlF1AO4MS1soBuy3gnJ4l8X%2FIJuiHuwzLokQmaGiwsHg91bpKs1Be5PS8o9hPneXkDY%2BjEo6D4bv6XjoeftuRevTEwx2WkeP0hoaFE%2BNRalFOMJOSpccGOqUBPTQFEPZ547pjl%2F6NWGd%2BXPS%2FVjOYuCHiYyQrT2Qw5V3WWEocj17jnKLqpmdoGqZvUQGNDG42fA2SZn8vyJbALMg6h5Lt8ZpDRp4AF3tm7LGtTMnpg3Bw83nu7jBFf%2FODmwTxIW6kWU3pBQSCqzuYXpcpnTQTOOybqYVtfALdBfreqhkZ7H%2FgiGiwmcxyBe2Ue%2B69nsnmHVyf3Ua0g2qbddRhbM6I&X-Amz-Signature=aa4dc411ec04342c4d3d9c1426dade07944ca641689196be91228a79b2272b41&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPWERDU4%2F20251010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251010T181545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJHMEUCIQCObfAbod6hqZKW3L1KFy0UF0Y9arxbKn2O5tEe1trzvAIgBOi2SzUPL85%2F8X9xWALLFw2WGaiAkEmxjIkFLo5LHE0qiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPpBr5l7m41l3obS0ircA5acJ1ecaYdyujMLXy4iN%2FgSAerXSRhYolP753uCPC9htW9kaFyfaiCUIaNMv4iTkkyypQcaDeT96Pytalt45KbdqU0PxmPP2ygmwdZwve1FYLlAyT35eprkDTDLc16gD%2BKWYAP7lMiX4KhKM%2FQ5uvgwKnpop9uWZ94fvYFdBCxlTq50FHwQooRxTVRxddR5R8U5B5QUk0SvdGsnV3ghHFVCQ04DvlM2pyIVluYj90JXbV0bigQHL85gHDmqDQw%2FcSANnPz9y9NPVBrEwPSiSHsH2IaWEggSSPLfHwyLTBOgEtilH3Qpnu9hL4uz7QuREK%2Bsbxhi68tQ9Kk%2BB1u4XSiVfh4zesLEFsAJ74j1B07BSUExJZlgP192GspDOrMrOTA7YeIxU6xAyfszpGvqiLTrUJyCOvu0iBqHxhnOP132kbRG0r8Cxj0wm6kuMPM7DW0G9ShCwivAPdoxaNiD17DaylQ%2FLAkEOXzIaR9Qd2pDg2GsnfRZuFTytn5bTJXbtiA4oAod8V0CNXDQlF1AO4MS1soBuy3gnJ4l8X%2FIJuiHuwzLokQmaGiwsHg91bpKs1Be5PS8o9hPneXkDY%2BjEo6D4bv6XjoeftuRevTEwx2WkeP0hoaFE%2BNRalFOMJOSpccGOqUBPTQFEPZ547pjl%2F6NWGd%2BXPS%2FVjOYuCHiYyQrT2Qw5V3WWEocj17jnKLqpmdoGqZvUQGNDG42fA2SZn8vyJbALMg6h5Lt8ZpDRp4AF3tm7LGtTMnpg3Bw83nu7jBFf%2FODmwTxIW6kWU3pBQSCqzuYXpcpnTQTOOybqYVtfALdBfreqhkZ7H%2FgiGiwmcxyBe2Ue%2B69nsnmHVyf3Ua0g2qbddRhbM6I&X-Amz-Signature=a07dde78175a447959acb213e69aec53c539fdd00af6c4871fd381cfbaca8b0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
