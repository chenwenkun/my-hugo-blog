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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q6SYVXJ3%2F20250930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250930T181454Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJIMEYCIQDkI%2Buk52D6%2FmBicHdljJ7ue4PxYDA0Phu3ktNN6Ju8HAIhAJc9BqZQbohLyrFkWM7jsPuFhM1zqaS6O%2BQcp8fhY8s2KogECPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwM%2BxIfZUh3F7IAO%2Fwq3ANzIKod4lIa0UtG3Kj%2BR4i4aJUVSfxQR5W1mRUHQANyGo%2BzYRO%2BpMk2Kt3n7YsBr6Os1%2FpJi38Z2EyNZRJ5prMK5SsC7aNw%2BbE5%2BHUYb5n6a4eqbAB3OJvd8%2FfX0CKu2ZJRITMWZBNqZssDchenbBQkLWLMdom75YlG1VUVNcS5rTGB9T7lmK0H4bs0gtAHQJq0y4RoszqaI2C6flwrOckQLUpHYLIqzpXmy%2FkX4GlsddwWFvXfYpYeXvLcehleBsNSeffgYGeM6qT40ToqflE1bIMtvQ%2BhBwL5Cx5dUMniibXH95VdZQLawuawwuEXHflaMgYgRwb9h3gCM%2Fuk0aki2hDzex8A03XAgt2Zfe1iDpvRrGyHpmzYFbAv6EMH7KowkKesl5fNdR%2BHwmu8P4LFR%2Bg4nfC9k8Sd%2BsqFngjPfuvcJwdA7qHrub70EeXuVgoUpZYsYkBCl%2FNTxomFIAGgXzrYkaFLAhtP0hlG2bOOtqD8NXXGJsPVZXgds5lSe2LkVZ6is9vMlEXP1fZ%2FJ%2Bqxq2hzu9jFpSF5Ilao1Pw%2F987pRDmJtTaG36171dqaxj%2FZ3oUR0VUZ0iRc33FJ%2BXS7tywlmTpM8RT81ISdMIq2EYv0SHfmJTTItWoaxzCHrfDGBjqkAce1CUljt278Skwk1OaVFkwxOZRVVdpI6zUx2LBeAHuDL8JYS%2FX0EpYRNyD9CtqLSwSMRHx9KaNj10K81DTNvUyrEcGvgwjVX7uVt9EKrK%2BlX6K3ubRBnAcfSsMy3kYNxAqZJB5xL9T2jbrtnr7WuxO8w5Wo43sVgFlVqNl9rkRbLyvVFsdL1CVm8PYT8bWec6F1K9EGpPhy6zyi0KPWp%2FnF%2FWIv&X-Amz-Signature=6ee5040a5a0ea033b6ebc1e13b55b5e66ab71c8e35cc8f22ce76cdb89bd598de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q6SYVXJ3%2F20250930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250930T181454Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJIMEYCIQDkI%2Buk52D6%2FmBicHdljJ7ue4PxYDA0Phu3ktNN6Ju8HAIhAJc9BqZQbohLyrFkWM7jsPuFhM1zqaS6O%2BQcp8fhY8s2KogECPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwM%2BxIfZUh3F7IAO%2Fwq3ANzIKod4lIa0UtG3Kj%2BR4i4aJUVSfxQR5W1mRUHQANyGo%2BzYRO%2BpMk2Kt3n7YsBr6Os1%2FpJi38Z2EyNZRJ5prMK5SsC7aNw%2BbE5%2BHUYb5n6a4eqbAB3OJvd8%2FfX0CKu2ZJRITMWZBNqZssDchenbBQkLWLMdom75YlG1VUVNcS5rTGB9T7lmK0H4bs0gtAHQJq0y4RoszqaI2C6flwrOckQLUpHYLIqzpXmy%2FkX4GlsddwWFvXfYpYeXvLcehleBsNSeffgYGeM6qT40ToqflE1bIMtvQ%2BhBwL5Cx5dUMniibXH95VdZQLawuawwuEXHflaMgYgRwb9h3gCM%2Fuk0aki2hDzex8A03XAgt2Zfe1iDpvRrGyHpmzYFbAv6EMH7KowkKesl5fNdR%2BHwmu8P4LFR%2Bg4nfC9k8Sd%2BsqFngjPfuvcJwdA7qHrub70EeXuVgoUpZYsYkBCl%2FNTxomFIAGgXzrYkaFLAhtP0hlG2bOOtqD8NXXGJsPVZXgds5lSe2LkVZ6is9vMlEXP1fZ%2FJ%2Bqxq2hzu9jFpSF5Ilao1Pw%2F987pRDmJtTaG36171dqaxj%2FZ3oUR0VUZ0iRc33FJ%2BXS7tywlmTpM8RT81ISdMIq2EYv0SHfmJTTItWoaxzCHrfDGBjqkAce1CUljt278Skwk1OaVFkwxOZRVVdpI6zUx2LBeAHuDL8JYS%2FX0EpYRNyD9CtqLSwSMRHx9KaNj10K81DTNvUyrEcGvgwjVX7uVt9EKrK%2BlX6K3ubRBnAcfSsMy3kYNxAqZJB5xL9T2jbrtnr7WuxO8w5Wo43sVgFlVqNl9rkRbLyvVFsdL1CVm8PYT8bWec6F1K9EGpPhy6zyi0KPWp%2FnF%2FWIv&X-Amz-Signature=8ea172d83fd69bbe806f1e38734f44dbfa9bea7968359af76020d71df2951c16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
