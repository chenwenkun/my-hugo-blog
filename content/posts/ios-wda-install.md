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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663KSKVFFB%2F20251025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251025T004942Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBT1wv9qlQVvdo4dWgA68R8TodJJgSkydFPbrzXxKVhCAiEAhhtQ69GBbWZvpBz0hHlA0%2F5BOgxhkqnrV9Y2y1bVGCUq%2FwMIaRAAGgw2Mzc0MjMxODM4MDUiDBDD4kGUiuNe75n3cSrcAx45egKHDOXVAfAI5QqlhuvVgfYRhLN620T8C5BEPEG712Wu62ORM%2BrXIyc0IqfjCWSLr%2BWBKOhtISkc7zjhujJrTXQGJqmg6ISNI0NLfL1nkLHkijpcuXtad6tqbMKurUxSLn8X5ZrqAUMp9iCOvSTH9ugwX4Irl7pXzMvUl2XTE%2BqLc3H3qvEIQ1UkjfPLuygj45EAuD0EauhS2r3XjIV5roIyqUHIjTRGo26vI8%2F7ZofjoLdm2JBCFv%2BX2MhyCHFpg%2F6E3M8FbwiOiYLeHNi3dZRQLtn3vVR4EFeJRQKDLlSnj2m48eF%2Bj1P8uFbehNH6Y%2BaZFZ2Y7GZnGO2QvSv6b7868ZX0JPTa399n%2BK4knXoMTMpnd1%2BXBe0vXZhXtHC0jMYw5EbmMhV0vOXxVUIAuOzvLkjIFMxDA9CKmId0nnn%2Bt5IPdvftiCjvKDT29yIulC6hXWD5vJpg4KtCp6kz8yGlViMMLNlrILNoEDRfm8jWB92QZhmKr4l5sK7AfB%2FTakVblY6sGhIKLCLO%2BQq1IZ0eMt%2BERHbU9xIHCQNrxhNQNz3fd9053NQjKGXAD4YMSaPbY7tgQkoIiGVjzrPTz0dD36a%2BpBUMu9nHlxRyBo8W2ExbUtR5QcQqMNGp8McGOqUBGEwL0AkwdMJB64dRilqE6zcAuTsHHg6xfh4MhAARw6OdZwV14FMyb95m2i0Kg4TxCch2kyS6M6AOHLO%2BRGrdwwaYPBbCwoE6EdPWzC8auwtf9pERgcIIy%2FutmzAXF0ttoh7kPAfj2N4RvN%2FJz3iWrajLVLJSdvgNzph2hzstUoCKSqqTMmb2Uf1pas70iI5EDONKZn0dmipM9udt7REx%2FaL4wU%2Fz&X-Amz-Signature=45022a33fe24fc86e0a9d390ac101a2744121cfbfc2015f17f8c53a091e611a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663KSKVFFB%2F20251025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251025T004942Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBT1wv9qlQVvdo4dWgA68R8TodJJgSkydFPbrzXxKVhCAiEAhhtQ69GBbWZvpBz0hHlA0%2F5BOgxhkqnrV9Y2y1bVGCUq%2FwMIaRAAGgw2Mzc0MjMxODM4MDUiDBDD4kGUiuNe75n3cSrcAx45egKHDOXVAfAI5QqlhuvVgfYRhLN620T8C5BEPEG712Wu62ORM%2BrXIyc0IqfjCWSLr%2BWBKOhtISkc7zjhujJrTXQGJqmg6ISNI0NLfL1nkLHkijpcuXtad6tqbMKurUxSLn8X5ZrqAUMp9iCOvSTH9ugwX4Irl7pXzMvUl2XTE%2BqLc3H3qvEIQ1UkjfPLuygj45EAuD0EauhS2r3XjIV5roIyqUHIjTRGo26vI8%2F7ZofjoLdm2JBCFv%2BX2MhyCHFpg%2F6E3M8FbwiOiYLeHNi3dZRQLtn3vVR4EFeJRQKDLlSnj2m48eF%2Bj1P8uFbehNH6Y%2BaZFZ2Y7GZnGO2QvSv6b7868ZX0JPTa399n%2BK4knXoMTMpnd1%2BXBe0vXZhXtHC0jMYw5EbmMhV0vOXxVUIAuOzvLkjIFMxDA9CKmId0nnn%2Bt5IPdvftiCjvKDT29yIulC6hXWD5vJpg4KtCp6kz8yGlViMMLNlrILNoEDRfm8jWB92QZhmKr4l5sK7AfB%2FTakVblY6sGhIKLCLO%2BQq1IZ0eMt%2BERHbU9xIHCQNrxhNQNz3fd9053NQjKGXAD4YMSaPbY7tgQkoIiGVjzrPTz0dD36a%2BpBUMu9nHlxRyBo8W2ExbUtR5QcQqMNGp8McGOqUBGEwL0AkwdMJB64dRilqE6zcAuTsHHg6xfh4MhAARw6OdZwV14FMyb95m2i0Kg4TxCch2kyS6M6AOHLO%2BRGrdwwaYPBbCwoE6EdPWzC8auwtf9pERgcIIy%2FutmzAXF0ttoh7kPAfj2N4RvN%2FJz3iWrajLVLJSdvgNzph2hzstUoCKSqqTMmb2Uf1pas70iI5EDONKZn0dmipM9udt7REx%2FaL4wU%2Fz&X-Amz-Signature=a670f72eefa6c9645a1f6f7e2685a3b3b7ffb3600547bbd9a1db9450177dbb8f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
