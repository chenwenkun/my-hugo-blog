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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666R3VKYZI%2F20251211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251211T181615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJHMEUCIQD42uj%2FBqLcjX3bvu6eqScwZSzHm94TSogR6JB5wv5B%2BwIgDQkTuI13tKRuqz80zkbtU4gebmT%2FWQKMgwXWL5bQSosqiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEpOO9bngBxNsINkiSrcA251a%2B82%2BQT75rHPBdIJ2h582yj2ZGZOKghLuWC%2BTW4vuf3Iom5wv%2BtkRMFKDChJBBdEJHX4mftXgxF5Bpvh%2FMKDpwOVV8uSejUEKw9vMuxU1%2Ba29i0tPp1h0pM%2BGHmNIkC%2BOBbc%2FT%2FsdZ17RzOHGUHwp6A91ELLp3ek8RenmvLkpu1SKeI1V4QP31eb5nNE1I0CFtNwRx85nnjCa9zvLzgZYu%2BIpHmoCA%2Fk89UnXm1%2FH88Q8o0Z3C6H0UbLnE01ed1IXHEPWGiel7YmQZHeynH9enpI4l3kfgIfRhuqR8dIxGZWFI5Q4Ikpo45YpEncjE4q05p3FnAttkM2FEhyrTwd%2Bqc8YgWMdYH2kgRZrFzKT4Km%2BlmiaiHkb0%2BS2u%2FMloCsa4X1W2arkeSWIjBM%2FwLTMwpYGG8DxaqLcQMdjwDczFkrGXv%2BaVO1hxNqZU5u5Nt6ote8yU2lZBkrYc%2F8n0HdAwvdz3B8A78QEhPgm3%2F24OcCu4Qd58Y6ClqIbMRoe1TAfmO1SoHo0SCDAbj5Yz97ywbhzxVoGMauELN5AY0BzonexLkn0%2Bz4iz0Zu%2BYybmFZPn00lS%2BsvJXoSue1AGEZL6HybGJc4HfT67lqi3nsMBXG6giMhTRL6ECZMM%2BP7MkGOqUBz9jLLeBX3x5BKYygKorygObMCsad4sMabw01x7uyb%2Fn1xQCVkdMw6F00srCTgkQBft6NQdTTR7vLXsUYMfkOKjM7H%2Fevfgm18N%2FqMPWVf4NVSD1DAy0t%2BgsDg2Y3IxcKD%2FFb6osxgsrKWExY0uLtgtMC3kQCwI13NpsKgncTnYg1iGChe%2FN1TmWr5%2FlbEJqRxN%2FsOSkn%2FcCkZgmIwOE0ekchcXKR&X-Amz-Signature=6f414e991c521acafc9ba1430a8880c9256086b03c52059fb856e42bb4575ce5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666R3VKYZI%2F20251211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251211T181615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJHMEUCIQD42uj%2FBqLcjX3bvu6eqScwZSzHm94TSogR6JB5wv5B%2BwIgDQkTuI13tKRuqz80zkbtU4gebmT%2FWQKMgwXWL5bQSosqiAQI8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEpOO9bngBxNsINkiSrcA251a%2B82%2BQT75rHPBdIJ2h582yj2ZGZOKghLuWC%2BTW4vuf3Iom5wv%2BtkRMFKDChJBBdEJHX4mftXgxF5Bpvh%2FMKDpwOVV8uSejUEKw9vMuxU1%2Ba29i0tPp1h0pM%2BGHmNIkC%2BOBbc%2FT%2FsdZ17RzOHGUHwp6A91ELLp3ek8RenmvLkpu1SKeI1V4QP31eb5nNE1I0CFtNwRx85nnjCa9zvLzgZYu%2BIpHmoCA%2Fk89UnXm1%2FH88Q8o0Z3C6H0UbLnE01ed1IXHEPWGiel7YmQZHeynH9enpI4l3kfgIfRhuqR8dIxGZWFI5Q4Ikpo45YpEncjE4q05p3FnAttkM2FEhyrTwd%2Bqc8YgWMdYH2kgRZrFzKT4Km%2BlmiaiHkb0%2BS2u%2FMloCsa4X1W2arkeSWIjBM%2FwLTMwpYGG8DxaqLcQMdjwDczFkrGXv%2BaVO1hxNqZU5u5Nt6ote8yU2lZBkrYc%2F8n0HdAwvdz3B8A78QEhPgm3%2F24OcCu4Qd58Y6ClqIbMRoe1TAfmO1SoHo0SCDAbj5Yz97ywbhzxVoGMauELN5AY0BzonexLkn0%2Bz4iz0Zu%2BYybmFZPn00lS%2BsvJXoSue1AGEZL6HybGJc4HfT67lqi3nsMBXG6giMhTRL6ECZMM%2BP7MkGOqUBz9jLLeBX3x5BKYygKorygObMCsad4sMabw01x7uyb%2Fn1xQCVkdMw6F00srCTgkQBft6NQdTTR7vLXsUYMfkOKjM7H%2Fevfgm18N%2FqMPWVf4NVSD1DAy0t%2BgsDg2Y3IxcKD%2FFb6osxgsrKWExY0uLtgtMC3kQCwI13NpsKgncTnYg1iGChe%2FN1TmWr5%2FlbEJqRxN%2FsOSkn%2FcCkZgmIwOE0ekchcXKR&X-Amz-Signature=a34c0c4db6be2cae203f64709c874d3e507d1431908f4f1a9b1363904e92d064&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
