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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SH47VXVM%2F20251018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251018T004646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCIQDk%2BP2%2FRvSZ5DPbjQVS%2BZ2Jz3tfaNzPaVt97IFGXSyT7QIgNp2s%2BOHsBafGStyMM1qHX%2FKlMsrFh8bRD3Akr3IDmjAqiAQIsf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMVloShPeM8vTCnkPyrcA6z6akv4MUST16SSL53CbRMf3qFuS%2BF9AF4X%2BtcPiWgt3o%2BsyONts9R%2F6Y3tm%2B3nrx5luJU9LWwuJ6YmIrjhgeXs04FTkGC5oII%2BJn%2FNipMjdoSLaT%2FTx5BrMb3s%2FZLxo9FJ9h2sQ8V0XFH0tugg3CPi21FBTTDDXVTsU%2FtkbY%2F8it0BE4shnGEveBiZJkf6bgL3qExhMX9sMp7eNNgfQArnvmCu4RRGO0kA6BG5xM1iCOcsrqNwflGW1YakwLrjU4b10YTzyZSVy%2BFMTwuuLlJ2tLvN8I0xp6ufV%2FhGAFE2ORQxXTPvQ%2FX2P1rvpOWltQxwa00ELpaRGltmEOVQL6uaV6OGx8jUNuguOK1qmvvE2Qk9oXEMM%2BKruH2uQKLo0bpvvCNdivFaPRXe6M8CXncWOxUP1tX5whx366pJRrLzu%2F2C92tggBMP6mvkgMgPrSx9VpIu06iuCdupZmufk2ylJn%2F1A%2FwbO2cFSQ4Cc8OoCDyrralohEcwkMnhnuVqEfYfEO0pULVpIIp9KkZKE6E8fU0exRqx97pSE%2B6slRiNQgF2cdhGdfEk6fj%2F79LWwahkqUYA93gp0WREJPS%2B9fDmlM0t6ptIe9geM28xGZ3x69%2BSuNTFakBXC9MXMKW0y8cGOqUBdzm7B8BhZZrv9vNEFqQY%2F8xgX7CGHIm61FrWqVCzY4ec20VzcOyPaOjbcqvlA09BAAc310D17Pd9iAsqmQZYBw%2F%2BW0KF8QUJotc%2Fqi8KTWYAlbWxZTYuuA9sSr7fHYI9%2BFSEqfCAddZA19pNFPAZ4w5AI3673kp17uZ87QLpRIVL9gBVnu%2BCcLRh%2BA%2Ba3To%2F2lPoGBV5Y78qyr8tGxHdzBWZHabR&X-Amz-Signature=105ed2a1721e9d338ccbe906d8d2adac9047bc42cfec3a5912ac8f7c77ef8c51&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SH47VXVM%2F20251018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251018T004646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCIQDk%2BP2%2FRvSZ5DPbjQVS%2BZ2Jz3tfaNzPaVt97IFGXSyT7QIgNp2s%2BOHsBafGStyMM1qHX%2FKlMsrFh8bRD3Akr3IDmjAqiAQIsf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMVloShPeM8vTCnkPyrcA6z6akv4MUST16SSL53CbRMf3qFuS%2BF9AF4X%2BtcPiWgt3o%2BsyONts9R%2F6Y3tm%2B3nrx5luJU9LWwuJ6YmIrjhgeXs04FTkGC5oII%2BJn%2FNipMjdoSLaT%2FTx5BrMb3s%2FZLxo9FJ9h2sQ8V0XFH0tugg3CPi21FBTTDDXVTsU%2FtkbY%2F8it0BE4shnGEveBiZJkf6bgL3qExhMX9sMp7eNNgfQArnvmCu4RRGO0kA6BG5xM1iCOcsrqNwflGW1YakwLrjU4b10YTzyZSVy%2BFMTwuuLlJ2tLvN8I0xp6ufV%2FhGAFE2ORQxXTPvQ%2FX2P1rvpOWltQxwa00ELpaRGltmEOVQL6uaV6OGx8jUNuguOK1qmvvE2Qk9oXEMM%2BKruH2uQKLo0bpvvCNdivFaPRXe6M8CXncWOxUP1tX5whx366pJRrLzu%2F2C92tggBMP6mvkgMgPrSx9VpIu06iuCdupZmufk2ylJn%2F1A%2FwbO2cFSQ4Cc8OoCDyrralohEcwkMnhnuVqEfYfEO0pULVpIIp9KkZKE6E8fU0exRqx97pSE%2B6slRiNQgF2cdhGdfEk6fj%2F79LWwahkqUYA93gp0WREJPS%2B9fDmlM0t6ptIe9geM28xGZ3x69%2BSuNTFakBXC9MXMKW0y8cGOqUBdzm7B8BhZZrv9vNEFqQY%2F8xgX7CGHIm61FrWqVCzY4ec20VzcOyPaOjbcqvlA09BAAc310D17Pd9iAsqmQZYBw%2F%2BW0KF8QUJotc%2Fqi8KTWYAlbWxZTYuuA9sSr7fHYI9%2BFSEqfCAddZA19pNFPAZ4w5AI3673kp17uZ87QLpRIVL9gBVnu%2BCcLRh%2BA%2Ba3To%2F2lPoGBV5Y78qyr8tGxHdzBWZHabR&X-Amz-Signature=dd138ef6c467ef5005132bc6e6c1e41b5f0b95739362d9e963ad4c9434bb8007&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
