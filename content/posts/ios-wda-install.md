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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YWUIANYO%2F20260708%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260708T014246Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAFaRHXiERRJw9eNTupoBJv0kpLMqDURvcfzWpFcfJ6%2BAiEAk1%2B7qq98cNGlVYpa8FhLj7FeXIt1vYF7VHbzbWmrHosq%2FwMIdhAAGgw2Mzc0MjMxODM4MDUiDHbbV8cpMjc6w1ZziSrcA8L6llV8d7Yoa%2BYSx%2BFYgGT2MX8sZNRhq7%2FmBoo2D98TmXVf6qAWREmtZdxCMpmJJc5eYYEUtyZD1QbllXr2HxdyMs5hXMC0haH5Hbytp7UHUQ%2FoEMjl4JKOpPRhVbKMFrg%2BosKk88CehqoRXKzpDi%2FU1HZcJjEOZyO9QR4cUKEp9VSPZk4TQQLENr043ayllZxvmLH%2FGLNGncN0wE5SRqqAnq6I%2FzyNTlzakbqVR8hYUSXIGe4gwbZCwykBgXnFurw7NrDh0Pg%2FY%2BALoBpF0bQEDCkpzqezlJd32TLz%2F4%2FskOpzFwE1ePG65xElgfxhPE4%2FsmVbSHEopoNCDkQCGn9oM%2F4CJ8ssPMq0hfFqaniYjuq%2B9Gs%2FFNV11IzIHeagEk5VbVv3bJ3xuSmgClzd6r0GLk4aBL0fa44oJ00kUd%2B4nxkbuEfWsQsFQ111y7gvJRMXcIXAHyi7187ng0thBmixQsxRezPtw6gku7soKUUEpUKJ6zJwzdM8AqoQRCDizpnFLmz4RlNnrbFATzQSDsJy7wybwBrnOM7FoobduLJHNGWOFyuPNQY%2BrfYIBxCBmbVFcLkRZwHzKtpkzVSiuC%2FGVYfv2gFpGDWdFlnEvIHJLdSwnLp1t2MAuJ2XMIDLtdIGOqUBvFfMmPsgMhliFKLFCHxQEeeVTdpt9zycHuNyGcOG4OPbUtk79xm7qJtHyBxCZnH6a04XImVognFI7qFgFT7prRj8vc4ofGjnz7NY8gNWdXTTMDWEyxSGcomMeAUe23n49zGuxGLCh3qP0Q4NQfsncHj%2FAjNfBHSTFyJX7iekFm6ZxAC3m%2F1ULmmZ%2BvkW1KHgKd%2BXKu%2BKa%2F3LfbylhVM0uKdMNsx%2F&X-Amz-Signature=8e0da82ca38c48c5a39c87d343cdf9a7d7713b72beadc258d280c0fd3e9ef2f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YWUIANYO%2F20260708%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260708T014246Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAFaRHXiERRJw9eNTupoBJv0kpLMqDURvcfzWpFcfJ6%2BAiEAk1%2B7qq98cNGlVYpa8FhLj7FeXIt1vYF7VHbzbWmrHosq%2FwMIdhAAGgw2Mzc0MjMxODM4MDUiDHbbV8cpMjc6w1ZziSrcA8L6llV8d7Yoa%2BYSx%2BFYgGT2MX8sZNRhq7%2FmBoo2D98TmXVf6qAWREmtZdxCMpmJJc5eYYEUtyZD1QbllXr2HxdyMs5hXMC0haH5Hbytp7UHUQ%2FoEMjl4JKOpPRhVbKMFrg%2BosKk88CehqoRXKzpDi%2FU1HZcJjEOZyO9QR4cUKEp9VSPZk4TQQLENr043ayllZxvmLH%2FGLNGncN0wE5SRqqAnq6I%2FzyNTlzakbqVR8hYUSXIGe4gwbZCwykBgXnFurw7NrDh0Pg%2FY%2BALoBpF0bQEDCkpzqezlJd32TLz%2F4%2FskOpzFwE1ePG65xElgfxhPE4%2FsmVbSHEopoNCDkQCGn9oM%2F4CJ8ssPMq0hfFqaniYjuq%2B9Gs%2FFNV11IzIHeagEk5VbVv3bJ3xuSmgClzd6r0GLk4aBL0fa44oJ00kUd%2B4nxkbuEfWsQsFQ111y7gvJRMXcIXAHyi7187ng0thBmixQsxRezPtw6gku7soKUUEpUKJ6zJwzdM8AqoQRCDizpnFLmz4RlNnrbFATzQSDsJy7wybwBrnOM7FoobduLJHNGWOFyuPNQY%2BrfYIBxCBmbVFcLkRZwHzKtpkzVSiuC%2FGVYfv2gFpGDWdFlnEvIHJLdSwnLp1t2MAuJ2XMIDLtdIGOqUBvFfMmPsgMhliFKLFCHxQEeeVTdpt9zycHuNyGcOG4OPbUtk79xm7qJtHyBxCZnH6a04XImVognFI7qFgFT7prRj8vc4ofGjnz7NY8gNWdXTTMDWEyxSGcomMeAUe23n49zGuxGLCh3qP0Q4NQfsncHj%2FAjNfBHSTFyJX7iekFm6ZxAC3m%2F1ULmmZ%2BvkW1KHgKd%2BXKu%2BKa%2F3LfbylhVM0uKdMNsx%2F&X-Amz-Signature=9f79fa600e0a989cbdb2d0fa80f8703d7da665b1184d65e402a822a72284acde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
