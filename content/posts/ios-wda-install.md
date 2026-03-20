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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664BVMF6GU%2F20260320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260320T123456Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJHMEUCIQDCRwuXus5GrDSylxWiSp4Z09d0fGlIuEf5B8KxYBFA2QIgGFWIT908KdFVi7JsEG7ISiCZxAfVQFn12ESQN6iqYwIq%2FwMINBAAGgw2Mzc0MjMxODM4MDUiDA6VMriS5rvguykN9ircA5uUDiv9xtIHy86m9tel7n5H8IuDpi029zutS1EUzsUsQzgMk95ARqYYqxIrWq9HDn399iHclCyCvQmusiqkBWNGSWnPUUk8FgdVCEJivzgW9PKNSgrUDATwKN9U98drmudf%2FOrRGJ8WF%2BF%2BVhxB1jQTdBwFJtkSa%2F5W5%2BLxuoFS2DVRtG81FlWWuY%2Beo%2BhKro%2BuS0WZVjIIkZWCcEkVUYcTx9%2FFhcHW6kmeVXnujAtlU4t2CxytpR5dcFRD2YWgbgrCUPxHgL0WKxiv78okH0XnvErXFSYNEO1q7U1uEgMTq8XaGesOh5sJZoghhtsjiVfOW4e00I%2FiRufnwiTEWTTv5ZuPA9mL3dD%2FsIYByd2JiUDG%2FnYXj9HzWhu1sVXNPG2Y6osqkrhMftNWLzg8oncHbEXyE0R0Ycd3gvJHaHbZDnuxJFOGxIRL%2FQ6UHzxyL%2BOTITlLuu99de86f9%2FDMcnU36O%2Fu4XC2FAlCrDtbss2BuNB8JVf5TMNl7lXzwHKjKE39JNb6FWv08ZpncJCiMIBk%2BYWeDf6LXbg360%2FjMC4z24fJKULkXCiqxSBJGb9XAoHwdvVWZGyqcUp5%2BPpYNIpdd%2Bk4mXWVgU%2FdaS53Az%2FoZ8jahHrsz4rQNm9MK7Z9M0GOqUBRe5VaBHl7hInK4q7Rbq%2Bm0erPA1Pdw91aXfK3Vc%2BHTYNubmZyW1YChX06YU7%2B14rJ5OtNEmQw56mnFVq0miNROcSzhybKSZ4sSmSbvMZPdEUSv09kc1PZrzBFT4KzyiTGg7O30rk6PwzcB9kt1rDdnoZuaJpUG3muttBrk3iNQF8tdzDVNxwhurBYfyrSJMq6KZFxgcqIsL5oEuMnITez1a8iJW5&X-Amz-Signature=33c23846f69cf9bb65f2d6b86957a0369ac876ed2110bcb62ac17b347525f86e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664BVMF6GU%2F20260320%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260320T123456Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGsaCXVzLXdlc3QtMiJHMEUCIQDCRwuXus5GrDSylxWiSp4Z09d0fGlIuEf5B8KxYBFA2QIgGFWIT908KdFVi7JsEG7ISiCZxAfVQFn12ESQN6iqYwIq%2FwMINBAAGgw2Mzc0MjMxODM4MDUiDA6VMriS5rvguykN9ircA5uUDiv9xtIHy86m9tel7n5H8IuDpi029zutS1EUzsUsQzgMk95ARqYYqxIrWq9HDn399iHclCyCvQmusiqkBWNGSWnPUUk8FgdVCEJivzgW9PKNSgrUDATwKN9U98drmudf%2FOrRGJ8WF%2BF%2BVhxB1jQTdBwFJtkSa%2F5W5%2BLxuoFS2DVRtG81FlWWuY%2Beo%2BhKro%2BuS0WZVjIIkZWCcEkVUYcTx9%2FFhcHW6kmeVXnujAtlU4t2CxytpR5dcFRD2YWgbgrCUPxHgL0WKxiv78okH0XnvErXFSYNEO1q7U1uEgMTq8XaGesOh5sJZoghhtsjiVfOW4e00I%2FiRufnwiTEWTTv5ZuPA9mL3dD%2FsIYByd2JiUDG%2FnYXj9HzWhu1sVXNPG2Y6osqkrhMftNWLzg8oncHbEXyE0R0Ycd3gvJHaHbZDnuxJFOGxIRL%2FQ6UHzxyL%2BOTITlLuu99de86f9%2FDMcnU36O%2Fu4XC2FAlCrDtbss2BuNB8JVf5TMNl7lXzwHKjKE39JNb6FWv08ZpncJCiMIBk%2BYWeDf6LXbg360%2FjMC4z24fJKULkXCiqxSBJGb9XAoHwdvVWZGyqcUp5%2BPpYNIpdd%2Bk4mXWVgU%2FdaS53Az%2FoZ8jahHrsz4rQNm9MK7Z9M0GOqUBRe5VaBHl7hInK4q7Rbq%2Bm0erPA1Pdw91aXfK3Vc%2BHTYNubmZyW1YChX06YU7%2B14rJ5OtNEmQw56mnFVq0miNROcSzhybKSZ4sSmSbvMZPdEUSv09kc1PZrzBFT4KzyiTGg7O30rk6PwzcB9kt1rDdnoZuaJpUG3muttBrk3iNQF8tdzDVNxwhurBYfyrSJMq6KZFxgcqIsL5oEuMnITez1a8iJW5&X-Amz-Signature=e778e70cdb9b0f403da83397c7347ab9d9211c802e84ad31b520b3d660c2c107&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
