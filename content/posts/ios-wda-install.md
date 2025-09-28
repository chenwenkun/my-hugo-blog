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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HPDLVMZ%2F20250928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250928T121830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaCXVzLXdlc3QtMiJIMEYCIQDGHGKHcTSaVbHBm1APP80us2ZXx%2BtwUNcPWSFTmnAvkgIhANC0Mc5XvQBdceEkq26%2FibsxB8zD78h65cLMBTC3SjmTKogECLz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwKuhnGRVJ%2F8HwH3hgq3APXn4TRFGjtTWDjHyKwrYsCs3kol%2FPsuCY9GMt7Xqzo6n%2FakvNNtOuPzyAV%2B6XrObjgpvkiglYMNcth4TrcsK4lgix3tHcypfHTvud7gSBIBTqvtb28s9Dp0Xqgv%2FheIfdBh8xEDr2lNUvApAv2h9E%2BcKgEOkqOiKbaLpXboIDoscwRBeKaxw8ow5S40QrTtONaVXoWiIitc3sLyFN45wH2Dqyu2KcoHSgHZ3k3Xd1JC%2Bouu3tsPeHvilvxrP9kamRoVTtvc4DXwSJCagfzd45SWUH4oSwm94o9ApcllCbcz5CMHClQs7xDkV45J6cqw1jbEwu%2BcM%2F6su4h9%2BFL0bdW6vsXAK14EgtUJWJ5p%2FVJD05AxKbCmocUugH%2Bv4TowudYDMSmqqIbCzCse308aAY3bUuQ7OBbbz2mys8U5o52YMUsKIPsGFTyTkQ%2FiDY8%2BRMTjA8p%2Boo38w5ZWTAZEBjjiiP%2Flxf2clWhpY9kQSFzxizxpf2BBiYSJ60B7jo7%2FAklpcRXbEie4iV%2BKAlBo7ZHfFDsKLa%2BlM9YEO1K4QU5ie2GKDCk3%2B3OPtFlxMyRPnzUyGVxQlYVDUaxjfsN0hZiJthBZ1M6163k2MRsCyenG%2F4hU1C2NwzTnIl63zC8ouTGBjqkARgZYEs6kDiAoVUO63BV8FgquOPE8fQrIdeW%2BCZNDwwadGu0cifNjHXffuSSIes6%2BtrS7rlm35ynadYiZBWqj3qta4VBpSf%2FhuX0MedJW8Z3cuJXK%2FrVOzFoVQSzHNCS%2FaVPV7jpIZ%2BlCXcnrnqBj9xRqetwwfgL%2BHaWCA4F7NMfhlTLLSJbaDA77Nu4jUbJei5IVy3jCrIHHBfPNdPLehqGkTBf&X-Amz-Signature=dd568aaa01b13452493b585403333ec9d35401723ec6ba0b34f0ddb2dcfbc4e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HPDLVMZ%2F20250928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250928T121830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaCXVzLXdlc3QtMiJIMEYCIQDGHGKHcTSaVbHBm1APP80us2ZXx%2BtwUNcPWSFTmnAvkgIhANC0Mc5XvQBdceEkq26%2FibsxB8zD78h65cLMBTC3SjmTKogECLz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwKuhnGRVJ%2F8HwH3hgq3APXn4TRFGjtTWDjHyKwrYsCs3kol%2FPsuCY9GMt7Xqzo6n%2FakvNNtOuPzyAV%2B6XrObjgpvkiglYMNcth4TrcsK4lgix3tHcypfHTvud7gSBIBTqvtb28s9Dp0Xqgv%2FheIfdBh8xEDr2lNUvApAv2h9E%2BcKgEOkqOiKbaLpXboIDoscwRBeKaxw8ow5S40QrTtONaVXoWiIitc3sLyFN45wH2Dqyu2KcoHSgHZ3k3Xd1JC%2Bouu3tsPeHvilvxrP9kamRoVTtvc4DXwSJCagfzd45SWUH4oSwm94o9ApcllCbcz5CMHClQs7xDkV45J6cqw1jbEwu%2BcM%2F6su4h9%2BFL0bdW6vsXAK14EgtUJWJ5p%2FVJD05AxKbCmocUugH%2Bv4TowudYDMSmqqIbCzCse308aAY3bUuQ7OBbbz2mys8U5o52YMUsKIPsGFTyTkQ%2FiDY8%2BRMTjA8p%2Boo38w5ZWTAZEBjjiiP%2Flxf2clWhpY9kQSFzxizxpf2BBiYSJ60B7jo7%2FAklpcRXbEie4iV%2BKAlBo7ZHfFDsKLa%2BlM9YEO1K4QU5ie2GKDCk3%2B3OPtFlxMyRPnzUyGVxQlYVDUaxjfsN0hZiJthBZ1M6163k2MRsCyenG%2F4hU1C2NwzTnIl63zC8ouTGBjqkARgZYEs6kDiAoVUO63BV8FgquOPE8fQrIdeW%2BCZNDwwadGu0cifNjHXffuSSIes6%2BtrS7rlm35ynadYiZBWqj3qta4VBpSf%2FhuX0MedJW8Z3cuJXK%2FrVOzFoVQSzHNCS%2FaVPV7jpIZ%2BlCXcnrnqBj9xRqetwwfgL%2BHaWCA4F7NMfhlTLLSJbaDA77Nu4jUbJei5IVy3jCrIHHBfPNdPLehqGkTBf&X-Amz-Signature=0f1397d2cddc42b9a228bde0558f843261c3d425984252a9b3ded1be2c40a38d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
