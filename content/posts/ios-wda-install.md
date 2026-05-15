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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5SVGWDR%2F20260515%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260515T191534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE4tszKVfMPhs0suIY%2F8VelDAfVMsuUwxgYjrLrDq2YNAiALWs86dDwAw3GAg4R%2FKT5bjwc%2Bu5bmKCF4VN3kxs0xLir%2FAwh8EAAaDDYzNzQyMzE4MzgwNSIMOJX3pVEvqic6%2B%2Fu8KtwDGEIRhZlijZWnPttrIdnuUTk0%2F%2Byxgz13OVLNQbYcju91hpPAOsP04kq4MwIQ%2F1bYkWy3%2BHslkYIwV8UGLXuyZZ1ehgp6tlb89ZOrULBkKy6n670XcsLvclb19uwPWSCIOPAM5DVHm2XUp4vJAqNhylC3ovMoFpNI6Z%2FbuervVf9i3QAKQYD1k2uF%2BzggOnjVxSxA88%2BjeJL%2Bh3kXXbEtkU19zwfZa1aQ7zj3kua6jAclmkvBYaDpDyq9D08YioeddsyLo51eWw2zvwaQzuXe3SRgizb0M4nzmFJzWQ0aw1W20hPhP6Fyg73Sbylk%2BLuntgFZlCBLgzALkAb2Ib7gg51LRtWPwJMw1z0BQWjb586CTmfVfR2NsgznP3%2F5pl53rZOEsttL7p2ZG7KRGNQgRj6dtE17vo5sae34rQy6GI%2Faf2OgZdvoUaMrrC0%2Fiu4CMpu0mkll0uNQjk85p8dadtXXIjtIuv2gQZN%2FouE9jhanJvpqJaAp78zb1jG3pMx8ecWe%2F7aoPezpldNmu%2FuJ9qo9nOHFHo9QZJaFadFYK494sa18X%2FEBjLIszf70vpkTXcApnV0cF%2BmFnNH4tXzbMGbLHjJdbWBHvxGik1uCJcN%2BwUWJLfQwkyAiR8gw%2Bcqd0AY6pgHR67AWtZ8a5ICZoT%2BmUW62ucHCeSGvPIhQdPyBv7aqQwjrlNQjCksfOvkO2j5RhOSBuWHzWJoV4P32zuYSdfzgWMg3mKG5Q0a6ro%2FOIzUqE%2FOmM4kdlB5Ctz1dRW69YI1voCyryg5sORBzV729xk1zULKe1K5zwj%2F23f65T%2FCG4ZsBAeeUJcLU8Ery0YVVezklHxa5NPO4A3uhHf0WcqMjO4AQwSbV&X-Amz-Signature=3cc29442d55c8893b80ad60c9089010d7c7210e3dad6ab4aa7b016342744e526&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5SVGWDR%2F20260515%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260515T191534Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIE4tszKVfMPhs0suIY%2F8VelDAfVMsuUwxgYjrLrDq2YNAiALWs86dDwAw3GAg4R%2FKT5bjwc%2Bu5bmKCF4VN3kxs0xLir%2FAwh8EAAaDDYzNzQyMzE4MzgwNSIMOJX3pVEvqic6%2B%2Fu8KtwDGEIRhZlijZWnPttrIdnuUTk0%2F%2Byxgz13OVLNQbYcju91hpPAOsP04kq4MwIQ%2F1bYkWy3%2BHslkYIwV8UGLXuyZZ1ehgp6tlb89ZOrULBkKy6n670XcsLvclb19uwPWSCIOPAM5DVHm2XUp4vJAqNhylC3ovMoFpNI6Z%2FbuervVf9i3QAKQYD1k2uF%2BzggOnjVxSxA88%2BjeJL%2Bh3kXXbEtkU19zwfZa1aQ7zj3kua6jAclmkvBYaDpDyq9D08YioeddsyLo51eWw2zvwaQzuXe3SRgizb0M4nzmFJzWQ0aw1W20hPhP6Fyg73Sbylk%2BLuntgFZlCBLgzALkAb2Ib7gg51LRtWPwJMw1z0BQWjb586CTmfVfR2NsgznP3%2F5pl53rZOEsttL7p2ZG7KRGNQgRj6dtE17vo5sae34rQy6GI%2Faf2OgZdvoUaMrrC0%2Fiu4CMpu0mkll0uNQjk85p8dadtXXIjtIuv2gQZN%2FouE9jhanJvpqJaAp78zb1jG3pMx8ecWe%2F7aoPezpldNmu%2FuJ9qo9nOHFHo9QZJaFadFYK494sa18X%2FEBjLIszf70vpkTXcApnV0cF%2BmFnNH4tXzbMGbLHjJdbWBHvxGik1uCJcN%2BwUWJLfQwkyAiR8gw%2Bcqd0AY6pgHR67AWtZ8a5ICZoT%2BmUW62ucHCeSGvPIhQdPyBv7aqQwjrlNQjCksfOvkO2j5RhOSBuWHzWJoV4P32zuYSdfzgWMg3mKG5Q0a6ro%2FOIzUqE%2FOmM4kdlB5Ctz1dRW69YI1voCyryg5sORBzV729xk1zULKe1K5zwj%2F23f65T%2FCG4ZsBAeeUJcLU8Ery0YVVezklHxa5NPO4A3uhHf0WcqMjO4AQwSbV&X-Amz-Signature=dec5045cb4d2fae831559dd3e2778caff164e8d6acf4c433b866a4a377981ce7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
