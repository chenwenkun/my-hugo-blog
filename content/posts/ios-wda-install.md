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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665VOLQ3NX%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T074949Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJGMEQCIHaJoD8qu%2BuWrI9TmG0LjqXwh3NnPCA7RzUk11wG50cFAiBOcedn3CpFQasLhe0XPSMn88yrqhkvKiCTjNND881x6Sr%2FAwgYEAAaDDYzNzQyMzE4MzgwNSIMUNjExDiwAAK8lukBKtwDZVzdJM64xZTe%2FiCxvIYL07zwF2kEwD690Q1W3qVy99YnNY5yBru%2FwQLTm6ptCyOnZJQULMW%2F8SIz%2FcYpFRsYACQTLma5pjmhqoq8Fq2yrSyMasQHovcnB%2FmIXGe4s%2FJiVz8unmQg%2BTy13fi%2Bs9T3Mm4bc8yakAfRQBKjUmk%2BWrVkJZ9i448p3IFQYNnXhzzxenQxfDQ4oPidvCSfnuT9gvQyu1%2FWIiwD8%2BM9IEA6XH2vPHBOMzlqCMwe5y90pSQr6LguEZiWiZ6nzgrebvmRh4E%2BLVJhAbprqyCagZxh2fqycc0nbE9lDWsYcVy2DsgEdaeItCwlqP4uEqk2MZKO4Hcy3%2FCNcBXMQqPx6AaslHps9Tr27stu7v1uRjhrAUmzqVU9MqJdftOt3wgWATsRqLWmjWCVRM47CXS3TOgkPYNhC7zQNeTVro0MZ9obSMrsZXF9gKsvXMNPDKy%2BEf3a1j54P9u2SWn%2BVXDVFoivzQJROc3Z2vjdQYmZQuWKitQGog6R%2BI4JphzYAxENgsUNCbGSLZ%2Fl8IRrb9CNFHOXHj%2BahG6VW8pTiDToaPvFRQakQUjO1uXBrOLJei03DaTEXzQYjc3CO3Fr6g1sKd4jCNbDNa6Om6jvR9KP1G0wjKiXzwY6pgGLi9Cbnk9tLMldnvUTCFHq%2BR0AsePCN2RS85PHOmzUT5MGqtbddm8Nns7GqTLhuKWUSA%2FIjddfF6bxpXmrXG75w6bLut6XW%2FPFGRFwds7b3yxtkJ0AdHQpok28jxUSI5CyWyKcsHabobVbSDIYkfS5pzlhZQA42CBBlJRWJkL%2FbKqMNejKuQ0aD2JVQjSb5kps67KUjm4hJJK8pEPoKL85xwQnbD%2BB&X-Amz-Signature=e746e4d330e9eb2050ca745e4f1f29a50f0af25dac0230675311fa37b52fb351&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665VOLQ3NX%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T074949Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJGMEQCIHaJoD8qu%2BuWrI9TmG0LjqXwh3NnPCA7RzUk11wG50cFAiBOcedn3CpFQasLhe0XPSMn88yrqhkvKiCTjNND881x6Sr%2FAwgYEAAaDDYzNzQyMzE4MzgwNSIMUNjExDiwAAK8lukBKtwDZVzdJM64xZTe%2FiCxvIYL07zwF2kEwD690Q1W3qVy99YnNY5yBru%2FwQLTm6ptCyOnZJQULMW%2F8SIz%2FcYpFRsYACQTLma5pjmhqoq8Fq2yrSyMasQHovcnB%2FmIXGe4s%2FJiVz8unmQg%2BTy13fi%2Bs9T3Mm4bc8yakAfRQBKjUmk%2BWrVkJZ9i448p3IFQYNnXhzzxenQxfDQ4oPidvCSfnuT9gvQyu1%2FWIiwD8%2BM9IEA6XH2vPHBOMzlqCMwe5y90pSQr6LguEZiWiZ6nzgrebvmRh4E%2BLVJhAbprqyCagZxh2fqycc0nbE9lDWsYcVy2DsgEdaeItCwlqP4uEqk2MZKO4Hcy3%2FCNcBXMQqPx6AaslHps9Tr27stu7v1uRjhrAUmzqVU9MqJdftOt3wgWATsRqLWmjWCVRM47CXS3TOgkPYNhC7zQNeTVro0MZ9obSMrsZXF9gKsvXMNPDKy%2BEf3a1j54P9u2SWn%2BVXDVFoivzQJROc3Z2vjdQYmZQuWKitQGog6R%2BI4JphzYAxENgsUNCbGSLZ%2Fl8IRrb9CNFHOXHj%2BahG6VW8pTiDToaPvFRQakQUjO1uXBrOLJei03DaTEXzQYjc3CO3Fr6g1sKd4jCNbDNa6Om6jvR9KP1G0wjKiXzwY6pgGLi9Cbnk9tLMldnvUTCFHq%2BR0AsePCN2RS85PHOmzUT5MGqtbddm8Nns7GqTLhuKWUSA%2FIjddfF6bxpXmrXG75w6bLut6XW%2FPFGRFwds7b3yxtkJ0AdHQpok28jxUSI5CyWyKcsHabobVbSDIYkfS5pzlhZQA42CBBlJRWJkL%2FbKqMNejKuQ0aD2JVQjSb5kps67KUjm4hJJK8pEPoKL85xwQnbD%2BB&X-Amz-Signature=84b75a397475b87cc3c80fc57515a7e1b1cbf300073d95ff3fb4ad0d49b9fdb2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
