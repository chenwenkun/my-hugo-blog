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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKCTS5SF%2F20260324%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260324T124502Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCocJh15Ns30Q10%2BigM0Gb760wv749bzqSwf6jR7ufyvAIgTDrPMgPQXn8Ut9uaqs8u6rUmcRBz2%2FUIWWsbtd3z7cgqiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFJDJ3MDqghjpXsPwCrcA8CNB9AEs7%2Bc4gdNHeD%2BOBgEeXcRTWT%2FgvjsZxfjPtMGotxVhfL7eVlkckioEc9%2F3F9xQ%2BFuFWMPBeBDbD4K78osFr%2BBLZNF8xNs%2ByW2roCVNQMpYtD6BjvFP1TdYaVHV9fXys3btAho42c78mItVUfvqb1mJKr5G6aO%2BDKKI%2BLXUTLYXNO7Mm7e%2Brzdp%2F%2FSgLvrpC%2BOAIPDUvJHBxSRNxcyvs6euwog94VAhm0i6YXNWOFl%2BV3Pa9mOcODRH7UK4zVBNE%2B8nz%2BiVmZnHlUlt5vTVhg%2FBc7lp9JRy8PFkcQy%2BZcOhqwIJ9nYqAiq66OjdJJibWBBaYcAf4dhp5iUQs4nZTZfTI7PwF4CBirobAI7B6WxJN3DDgbk4BfuLG2RWdvrHbExHmLQXRgOoaFbJa8DTLLZL%2ByANGjwwLht1gSY%2FFsTpPXUb4hG%2B%2F4pV3E1sZCmIqkUR1qOTiz04wXJ3%2Fs7HKomaUBm8XLfG6v7qK4aA7mtoQrTkzNKcVyqbvTVjkSEyO9h3FuTvtyogeyf4aY9Hjo3uhKtQHVbpuTsKnHlJXWAQhA9EuBAdzKN8REdtiy8reLiVrqjcxUHB3P3CZbmoW5fDDNIFOB9AGdN928ZIEM2uHLrgplkfhbXMLONis4GOqUBPi85Nj%2BvBOH%2Bm2SLvbrssgmygTgl7DyREelCDkMWKm19HQvJGw9pUkeDTRtvQTO2zDaAjmzGZz%2BzCOzhoUxMfZrKj02X8LmDzWiA3HWtsQQnCiD2IUneQvfc%2By%2BJovxW35hiNlqKS3kxc2cRx7Fttfaj87MxuW31tntrks4BsPa6JdUhRuyaVSYcUdTgjFXmrNhYEVkdFjKFHEAo20j5JNYU9mkj&X-Amz-Signature=b0443d7a8507f471afacd17546e782e7378583dc533c562246ec644673c59a07&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKCTS5SF%2F20260324%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260324T124502Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCocJh15Ns30Q10%2BigM0Gb760wv749bzqSwf6jR7ufyvAIgTDrPMgPQXn8Ut9uaqs8u6rUmcRBz2%2FUIWWsbtd3z7cgqiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFJDJ3MDqghjpXsPwCrcA8CNB9AEs7%2Bc4gdNHeD%2BOBgEeXcRTWT%2FgvjsZxfjPtMGotxVhfL7eVlkckioEc9%2F3F9xQ%2BFuFWMPBeBDbD4K78osFr%2BBLZNF8xNs%2ByW2roCVNQMpYtD6BjvFP1TdYaVHV9fXys3btAho42c78mItVUfvqb1mJKr5G6aO%2BDKKI%2BLXUTLYXNO7Mm7e%2Brzdp%2F%2FSgLvrpC%2BOAIPDUvJHBxSRNxcyvs6euwog94VAhm0i6YXNWOFl%2BV3Pa9mOcODRH7UK4zVBNE%2B8nz%2BiVmZnHlUlt5vTVhg%2FBc7lp9JRy8PFkcQy%2BZcOhqwIJ9nYqAiq66OjdJJibWBBaYcAf4dhp5iUQs4nZTZfTI7PwF4CBirobAI7B6WxJN3DDgbk4BfuLG2RWdvrHbExHmLQXRgOoaFbJa8DTLLZL%2ByANGjwwLht1gSY%2FFsTpPXUb4hG%2B%2F4pV3E1sZCmIqkUR1qOTiz04wXJ3%2Fs7HKomaUBm8XLfG6v7qK4aA7mtoQrTkzNKcVyqbvTVjkSEyO9h3FuTvtyogeyf4aY9Hjo3uhKtQHVbpuTsKnHlJXWAQhA9EuBAdzKN8REdtiy8reLiVrqjcxUHB3P3CZbmoW5fDDNIFOB9AGdN928ZIEM2uHLrgplkfhbXMLONis4GOqUBPi85Nj%2BvBOH%2Bm2SLvbrssgmygTgl7DyREelCDkMWKm19HQvJGw9pUkeDTRtvQTO2zDaAjmzGZz%2BzCOzhoUxMfZrKj02X8LmDzWiA3HWtsQQnCiD2IUneQvfc%2By%2BJovxW35hiNlqKS3kxc2cRx7Fttfaj87MxuW31tntrks4BsPa6JdUhRuyaVSYcUdTgjFXmrNhYEVkdFjKFHEAo20j5JNYU9mkj&X-Amz-Signature=9b1ebfb70ff0c3a9368da3e405c29842c2da106d4acf59c1b508d8e11f6f580c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
