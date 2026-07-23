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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VYQOLGWJ%2F20260723%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260723T132228Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJIMEYCIQC9eGlRCHMZd%2FxeOs5EnaHpTdH19eCuzl%2F1tEcPNT0oUAIhALjJkXVL2jVkITjbU3jChEPDvJgzHGwFGF9s74bsxMmXKogECO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwxmDll1lVVlahg8Y4q3AMY0kYVGcpCtrFrMGp%2FSaKcLAbicb%2FFx%2B5MjmQhnZZ1NL4YqgkJ8a08x87WGLqEiPuS%2BUCb2%2B7WNqImoWtIyAboZVHnBqK0gQyVp%2BNAizFgJvii%2Fnsy2IOCNpoKnHfwriA8TJud83oUODN%2F9grREqhhJgKvINus9VxhssI%2BXuuILdRrXNY3ftBcrkrVXsnopF5a9z5B%2BsL%2Fz50iEWK1phPuIQ5RhF1q1PzABxXsSLWxLME81uzGPdDSHNqmjJ6UQrlmyUDeD7L%2FPMpXAJUaWhyEVhq4LH4cNdt2k3kUC2zttAzRLYUKzrsIz2wIk9pg3YJeaCutnspv%2Fv4i%2F9sIwjJRS3oTbuPJbInJc9FQ5VLwFUgX8%2BPOmv5nqYj1S4T2snHV4cG2RlQ0MEJxz4xv%2FEkHyjocKzPtZWPf9zNKrvmx5Z3%2BYrYELh73m9p8pGLvdrll2on%2BZxlmCapL%2BlVrVOYOfCvA3VJMZKcsXxP9PbInmcZ%2BcgykYK5r0uVJAhCaoDFPf6MnJHWfewHDganQjgE2%2FJeCVTrlraUJ3IffrjOwKTtg%2FUMvCJKq1qEg2HPLAQLiBRGVtP8QgpwE4JqcRqeWL94oBpkINT4PRNx9XVcvlSL6smJnVfvxaQzd2jCS%2BIfTBjqkAaw9bowXYQnbPoOy0%2BSDkSP5IjBaNM7V8EGk3gqmjoNG%2FLsYHb9ZWdtQdhZTeE1DmAVwPSPe9a5LqUtlI27thHJPyRY8lQKFzYmRgSQYNocDDl40s%2Bm51315mHIuIGwO26WV9Vrvbw7PG1RQcpk4iTyEy6GDUpuVIXN0vz27otY%2FrzgjNnAbhawgb2dAdqJ38WSdR5Q0NsTzBjjsu3LgUMzWxQDB&X-Amz-Signature=bf1349babf8ba2cdbffc9dbc3c7f7414dd4d63e265500a8e43f312c092850a59&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VYQOLGWJ%2F20260723%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260723T132228Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJIMEYCIQC9eGlRCHMZd%2FxeOs5EnaHpTdH19eCuzl%2F1tEcPNT0oUAIhALjJkXVL2jVkITjbU3jChEPDvJgzHGwFGF9s74bsxMmXKogECO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwxmDll1lVVlahg8Y4q3AMY0kYVGcpCtrFrMGp%2FSaKcLAbicb%2FFx%2B5MjmQhnZZ1NL4YqgkJ8a08x87WGLqEiPuS%2BUCb2%2B7WNqImoWtIyAboZVHnBqK0gQyVp%2BNAizFgJvii%2Fnsy2IOCNpoKnHfwriA8TJud83oUODN%2F9grREqhhJgKvINus9VxhssI%2BXuuILdRrXNY3ftBcrkrVXsnopF5a9z5B%2BsL%2Fz50iEWK1phPuIQ5RhF1q1PzABxXsSLWxLME81uzGPdDSHNqmjJ6UQrlmyUDeD7L%2FPMpXAJUaWhyEVhq4LH4cNdt2k3kUC2zttAzRLYUKzrsIz2wIk9pg3YJeaCutnspv%2Fv4i%2F9sIwjJRS3oTbuPJbInJc9FQ5VLwFUgX8%2BPOmv5nqYj1S4T2snHV4cG2RlQ0MEJxz4xv%2FEkHyjocKzPtZWPf9zNKrvmx5Z3%2BYrYELh73m9p8pGLvdrll2on%2BZxlmCapL%2BlVrVOYOfCvA3VJMZKcsXxP9PbInmcZ%2BcgykYK5r0uVJAhCaoDFPf6MnJHWfewHDganQjgE2%2FJeCVTrlraUJ3IffrjOwKTtg%2FUMvCJKq1qEg2HPLAQLiBRGVtP8QgpwE4JqcRqeWL94oBpkINT4PRNx9XVcvlSL6smJnVfvxaQzd2jCS%2BIfTBjqkAaw9bowXYQnbPoOy0%2BSDkSP5IjBaNM7V8EGk3gqmjoNG%2FLsYHb9ZWdtQdhZTeE1DmAVwPSPe9a5LqUtlI27thHJPyRY8lQKFzYmRgSQYNocDDl40s%2Bm51315mHIuIGwO26WV9Vrvbw7PG1RQcpk4iTyEy6GDUpuVIXN0vz27otY%2FrzgjNnAbhawgb2dAdqJ38WSdR5Q0NsTzBjjsu3LgUMzWxQDB&X-Amz-Signature=12799bbc0c37592ae8ca1634b551f03c5d4f870ff277ea6718bd0bcbb204f821&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
