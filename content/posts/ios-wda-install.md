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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUHRDQDY%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T125758Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBZ9PeFsAq%2BCz659IhdZ6z6leW%2BHMyE6QuQX4%2BMsBuWkAiB3IogZ0P0BCCTJYzdlZyB2qHcu9h8dykP%2F3rKyuhFbEir%2FAwh%2BEAAaDDYzNzQyMzE4MzgwNSIMSLVmXAFCnHW%2BN4ZIKtwD9ZrfVIcLvSUTi0J%2FoSdxh3SQfJPBGzIF7x4dOmkSO3kMCBdSONDige4dIdVORhrdpoaKDeokDMeEnioFTeDapytv%2FhW%2FhDnOUuhipY0pde%2BD1tT9asI8PKwhyZCXNf%2Fhn4sOB%2BQLfWsu74xJ6lkV5Rts9CaFgKcMkljYzT3zZTK03abATWr3eJY8btBwU26UetJonvkDiB6ZCjPnv8bTlSkVX3I93W51tQC0dCPysmiVfwlF7REVevAI3M2amQrpwo10NARpwKmMYFRg7G7RWa7Zmu2gQfzqV01CFmoDUvj2RLQtPxInMQJ2kufQscPoedQd46jpWeDc1olWakHTSOPWAbBDqvOOpyAF1kIKxGDxgorxQaE%2B7Er4D38QbgovUop4%2Fs6%2B8biCxjOd4U8dW6zgiFWODsH6CmovvIQoDcnA192Qjo%2BE659xAWDDe8ABWjnKUinzh0Kx3V1Stgxw7wSurNyBbc%2BkO7651dhhbHUWHKn1flK%2FRFBcDqiAq5hZKtn%2BJ6m68LXLvbRfIR%2FR7HRenamazbPhOR0dX5LmjU%2F90Jkwbw8%2B3i%2BOMjmLOiDqyq3S0GW%2F%2Bq%2F6aWqCoN6uvXlng74mNQFy6HLlXhj5QdzhaIDkr6%2FzC7h1XdUwqM%2BtzwY6pgFKG6Axz65txYsIqD%2FaKml13fJi5MFrduKSkjnTURdNqmsO0hEVPQCJMNy%2BHj0iT%2B1eqgOHkWV4eldYNSNw74TVxp8wfKX5GOBXu7Cc5gsstfG%2FCHlhD8436vuEdQxzBGmtyue%2F2Jrgb1NpfsGXj%2F5D8ZGL528GqxlOwc%2B2mCnyRdE2Y1FAhPF0IDMs5ilXF2%2Fcf0IJEPiRPfmKEbZPWb2dOSt182vM&X-Amz-Signature=fc27261be762974d49289e78c2bbf45182e63a2e8e57a4927cef1a8b052720e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUHRDQDY%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T125758Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBZ9PeFsAq%2BCz659IhdZ6z6leW%2BHMyE6QuQX4%2BMsBuWkAiB3IogZ0P0BCCTJYzdlZyB2qHcu9h8dykP%2F3rKyuhFbEir%2FAwh%2BEAAaDDYzNzQyMzE4MzgwNSIMSLVmXAFCnHW%2BN4ZIKtwD9ZrfVIcLvSUTi0J%2FoSdxh3SQfJPBGzIF7x4dOmkSO3kMCBdSONDige4dIdVORhrdpoaKDeokDMeEnioFTeDapytv%2FhW%2FhDnOUuhipY0pde%2BD1tT9asI8PKwhyZCXNf%2Fhn4sOB%2BQLfWsu74xJ6lkV5Rts9CaFgKcMkljYzT3zZTK03abATWr3eJY8btBwU26UetJonvkDiB6ZCjPnv8bTlSkVX3I93W51tQC0dCPysmiVfwlF7REVevAI3M2amQrpwo10NARpwKmMYFRg7G7RWa7Zmu2gQfzqV01CFmoDUvj2RLQtPxInMQJ2kufQscPoedQd46jpWeDc1olWakHTSOPWAbBDqvOOpyAF1kIKxGDxgorxQaE%2B7Er4D38QbgovUop4%2Fs6%2B8biCxjOd4U8dW6zgiFWODsH6CmovvIQoDcnA192Qjo%2BE659xAWDDe8ABWjnKUinzh0Kx3V1Stgxw7wSurNyBbc%2BkO7651dhhbHUWHKn1flK%2FRFBcDqiAq5hZKtn%2BJ6m68LXLvbRfIR%2FR7HRenamazbPhOR0dX5LmjU%2F90Jkwbw8%2B3i%2BOMjmLOiDqyq3S0GW%2F%2Bq%2F6aWqCoN6uvXlng74mNQFy6HLlXhj5QdzhaIDkr6%2FzC7h1XdUwqM%2BtzwY6pgFKG6Axz65txYsIqD%2FaKml13fJi5MFrduKSkjnTURdNqmsO0hEVPQCJMNy%2BHj0iT%2B1eqgOHkWV4eldYNSNw74TVxp8wfKX5GOBXu7Cc5gsstfG%2FCHlhD8436vuEdQxzBGmtyue%2F2Jrgb1NpfsGXj%2F5D8ZGL528GqxlOwc%2B2mCnyRdE2Y1FAhPF0IDMs5ilXF2%2Fcf0IJEPiRPfmKEbZPWb2dOSt182vM&X-Amz-Signature=b37f8d8f9cfb84de39c2ad299eb5751f7ee6d7106d470e24fb67ae88199e782a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
