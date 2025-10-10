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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2V4VVVU%2F20251010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251010T004922Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJGMEQCIDeIq9%2BBJc6ccHgLKxMTK3oacD8q7QNYne6tUHtOAuIPAiBaxzi69keb9%2FMGZlmAKuJwVX6WanTWNTQZUpgVpRmHMiqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMWGgG7NzZjptjEXuVKtwDbDDpzaT5M7vmWq%2BBVs%2BdvV11e0gZ%2FM4gojXNlaprJtrdgj0AyCvPJv33VATtZF%2FPR3wMae5bQq7PwgDiTnWyulzYOlqsPidpd4r3RxVGejpoUiGFomL%2FuezCur10svSzBI55JmGAPGjeIIJkagdz1yusG0gcSnZ2xBeLB9pwDu2RJkngliObqhy5gQtMQ%2Boy6N1SFwK%2FC8%2BtCm14rnAifSpcrLM1OCNRiQYZ19IRRmYBvyeN7VnTYY8gdiyuSEHaSUY%2BEzZDDi3VGhtZId2wtXmq%2Fo82E5qIeUjonBhNkn3FBlzlGuFkeFSIAKKCuztAF3cPkQAyDWCi873GqVQkznKHNw45gdWeILwDlo3KHk0A9Tw3BsBEzNC%2Fj%2F64dEgaldtjB6pPj2Bn8n0JON8c4g7D1cyt4FAXL6zBDdJbRRfmq15Log0um5uYMc76hEMhjhnTYzLSOKGmpBtPNdJR2%2B6c8mMnfYyekscHLuAVxqOJWY%2FZigHn%2BLop0%2FZkqbc3JAizqSaD8Z6voEV1K9Sh4Yx0Ka%2BkeEnKI07EM0wZJBIel5TxaVo5ERJAT0IPYUtUitYjHFVpoLiuhVjiFKOI0zCUuuD3EY9ZdppHZeYWRSFnhrGtnJdOIVKerp0w%2BqehxwY6pgEx3zTtIrpqUugQcKRv7Qs478lIAIsK6tMMn0N8GMejEt%2FRUq0jXJNfGEzqu0mFCwD51Cj%2BA2SN929QOOBQysdBVhEv4S70ljnZ6wXWzkJuyD%2Feh94szUGZL9etQCrVPXcSM8eMPW0pPumpV%2F4okLWT7IU7gtvh4F%2B8nw2HEWlY7eQPrTsaXXa5KNS7YlY81a7AmHSCfxq%2BhllAyUDYev0f3Q3CItPf&X-Amz-Signature=d03e03cd7ab8aa3e533ce03dce587127ded4a6ff512c5842b0cb5a31a818e881&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2V4VVVU%2F20251010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251010T004922Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJGMEQCIDeIq9%2BBJc6ccHgLKxMTK3oacD8q7QNYne6tUHtOAuIPAiBaxzi69keb9%2FMGZlmAKuJwVX6WanTWNTQZUpgVpRmHMiqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMWGgG7NzZjptjEXuVKtwDbDDpzaT5M7vmWq%2BBVs%2BdvV11e0gZ%2FM4gojXNlaprJtrdgj0AyCvPJv33VATtZF%2FPR3wMae5bQq7PwgDiTnWyulzYOlqsPidpd4r3RxVGejpoUiGFomL%2FuezCur10svSzBI55JmGAPGjeIIJkagdz1yusG0gcSnZ2xBeLB9pwDu2RJkngliObqhy5gQtMQ%2Boy6N1SFwK%2FC8%2BtCm14rnAifSpcrLM1OCNRiQYZ19IRRmYBvyeN7VnTYY8gdiyuSEHaSUY%2BEzZDDi3VGhtZId2wtXmq%2Fo82E5qIeUjonBhNkn3FBlzlGuFkeFSIAKKCuztAF3cPkQAyDWCi873GqVQkznKHNw45gdWeILwDlo3KHk0A9Tw3BsBEzNC%2Fj%2F64dEgaldtjB6pPj2Bn8n0JON8c4g7D1cyt4FAXL6zBDdJbRRfmq15Log0um5uYMc76hEMhjhnTYzLSOKGmpBtPNdJR2%2B6c8mMnfYyekscHLuAVxqOJWY%2FZigHn%2BLop0%2FZkqbc3JAizqSaD8Z6voEV1K9Sh4Yx0Ka%2BkeEnKI07EM0wZJBIel5TxaVo5ERJAT0IPYUtUitYjHFVpoLiuhVjiFKOI0zCUuuD3EY9ZdppHZeYWRSFnhrGtnJdOIVKerp0w%2BqehxwY6pgEx3zTtIrpqUugQcKRv7Qs478lIAIsK6tMMn0N8GMejEt%2FRUq0jXJNfGEzqu0mFCwD51Cj%2BA2SN929QOOBQysdBVhEv4S70ljnZ6wXWzkJuyD%2Feh94szUGZL9etQCrVPXcSM8eMPW0pPumpV%2F4okLWT7IU7gtvh4F%2B8nw2HEWlY7eQPrTsaXXa5KNS7YlY81a7AmHSCfxq%2BhllAyUDYev0f3Q3CItPf&X-Amz-Signature=b32f924757b5c8d80e67ad6457a6dc7135c7ef297d53afe5ca34caf8f238fa5f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
