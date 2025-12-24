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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YWE57ZGU%2F20251224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251224T005621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJHMEUCIEhv9pwKGzZrt9rg9n4RwlN%2FYFGcpVVLDsfCWXit9ruTAiEA%2FexEKMl0yrnbQTGbnncshV%2F8rYbc6n7ugI3s%2FkcWcagq%2FwMIGRAAGgw2Mzc0MjMxODM4MDUiDKmdQlTRIZZ5FZFiWyrcA92yapvBoZPL3hN7piLCI%2BU%2B%2FmSKEcQKDmIYjbFLlk9zK%2BAXX%2BhFaPiABo37xrm70OGqtSrL9%2FMdXzrWVICVFQc5pcm28xsfCv%2BvKcxWvQ7bJ3Mo0dPpg9G6EcnXUgY92jCrg3HUk%2FCMpjO0kWg2XUtH787goSKgxSO2fVKjQGhDpdSfFL7yxYYuxtvS8jzChopLTUg4SbWvpYFxtbS5JuTXj1%2FkDZ1bnhtOYo%2FI1P4Quo%2BzNol7wbRshxVbIliGX0CZ9rgkk8%2Bb3Fv10QPVvc%2Fmqhzw0lb%2BjzXr6Uc3UfiUZYgdrIdelwRiUBg3FwX13QX8HBpj7KeYqqw11M8pGCiO0iF22l%2BAy7Z5t5%2Frv%2BKDXOts%2BlXd1CFHLe4MXV1ay8Sfmed1fCX7VLXCdEoYg42FeGWcLI%2BaTiGCyQFpeZw7mB13AY3KQQAQ7osWumDvk%2FgLYlfVrrKkpv8WYWDE70pxh1%2FIEyloMXx4uSrChd3C3gHq7AfH7HUCd%2Buk7JunN2UTsJN8Ig5PP%2Fy9udLJN0woebYdHQWeBa9gWTpGSjyNUFLkQzyIVRm2u12MhM74%2FzSatymkcuAwv%2BPKqaDSQ%2Fr2M4MqITPLPJ3HaiMtQmqVdXtWzBTxEfLF7NBuMN%2FgrMoGOqUBNFjvPAwQ2xIkCc9NDwoyLSy9Nlxd76XzzdhXNP%2BQ7cv6j5x0f8jJNvL4v8p%2FNnXRDBYf19luW6qC19IKE5bniVOCPd8cTV6%2F07jUf0SUlkp8AS1wbw226g7HPh2KCUxO8VQ67eH1Z0OXiTPlLRMCkFJttunKufTQF1YSS5wWnb3KNe6B%2BQwccvrU0BkjFvKIrSq8w4nwqXni24kIcK4k8FhsUzLZ&X-Amz-Signature=b32553a989e04842c131c38b2e50da6ad5007cb687561ee2f161c909e2e88984&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YWE57ZGU%2F20251224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251224T005621Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJHMEUCIEhv9pwKGzZrt9rg9n4RwlN%2FYFGcpVVLDsfCWXit9ruTAiEA%2FexEKMl0yrnbQTGbnncshV%2F8rYbc6n7ugI3s%2FkcWcagq%2FwMIGRAAGgw2Mzc0MjMxODM4MDUiDKmdQlTRIZZ5FZFiWyrcA92yapvBoZPL3hN7piLCI%2BU%2B%2FmSKEcQKDmIYjbFLlk9zK%2BAXX%2BhFaPiABo37xrm70OGqtSrL9%2FMdXzrWVICVFQc5pcm28xsfCv%2BvKcxWvQ7bJ3Mo0dPpg9G6EcnXUgY92jCrg3HUk%2FCMpjO0kWg2XUtH787goSKgxSO2fVKjQGhDpdSfFL7yxYYuxtvS8jzChopLTUg4SbWvpYFxtbS5JuTXj1%2FkDZ1bnhtOYo%2FI1P4Quo%2BzNol7wbRshxVbIliGX0CZ9rgkk8%2Bb3Fv10QPVvc%2Fmqhzw0lb%2BjzXr6Uc3UfiUZYgdrIdelwRiUBg3FwX13QX8HBpj7KeYqqw11M8pGCiO0iF22l%2BAy7Z5t5%2Frv%2BKDXOts%2BlXd1CFHLe4MXV1ay8Sfmed1fCX7VLXCdEoYg42FeGWcLI%2BaTiGCyQFpeZw7mB13AY3KQQAQ7osWumDvk%2FgLYlfVrrKkpv8WYWDE70pxh1%2FIEyloMXx4uSrChd3C3gHq7AfH7HUCd%2Buk7JunN2UTsJN8Ig5PP%2Fy9udLJN0woebYdHQWeBa9gWTpGSjyNUFLkQzyIVRm2u12MhM74%2FzSatymkcuAwv%2BPKqaDSQ%2Fr2M4MqITPLPJ3HaiMtQmqVdXtWzBTxEfLF7NBuMN%2FgrMoGOqUBNFjvPAwQ2xIkCc9NDwoyLSy9Nlxd76XzzdhXNP%2BQ7cv6j5x0f8jJNvL4v8p%2FNnXRDBYf19luW6qC19IKE5bniVOCPd8cTV6%2F07jUf0SUlkp8AS1wbw226g7HPh2KCUxO8VQ67eH1Z0OXiTPlLRMCkFJttunKufTQF1YSS5wWnb3KNe6B%2BQwccvrU0BkjFvKIrSq8w4nwqXni24kIcK4k8FhsUzLZ&X-Amz-Signature=f6638a75040fcbe948b5dfd4922e4bd3a578df24259ec9954bda4f2d3bf7421f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
