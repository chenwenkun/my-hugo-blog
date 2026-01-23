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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QLBUGKRP%2F20260123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260123T181925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCICKctjt0jN0QWQonmVVWT1A87x18mHQimbF1IqzgEkIUAiEAyQsFn3mU7Zcr%2BVZHlt9LcvZnKu1Gt2IAWyUSWjAgSg0qiAQI%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPZl5RK25QH8VrWTOCrcA61iJGt7mQBCkrdufRDlveumvQYAv0NUqtX%2BKMUr5d50UuqoYIV%2Bu9Frfejx2rXlXaWwWxhjQqX9NPwvQneGy2wQT7XXUSfuecWmLliqRIWkn%2BlnFR729JvvYZ7Z2CN66aJTOzX4ZYFa5oM0NNivPUowDn4ocGxC2BPOnY1cWAlrepPHsLMRKyX2DzUrTEA5C2mozYOaDqJwzlcZI1Ebvg5dGpKpr1XDA8%2Fi%2FPVfGmz%2FVHd7NWPeBT%2Fc1ZCMLJxmQEwsUzsrgB0DNEiPTBwziaklufEWgxFFy%2Ba%2BWMUdJ0qs9IlhgoiurOWabmcSvjCHxzRh%2BWE52tzW9neu8mhjwgPfAK05xhm1qzKB6isGW0F1KyHdxLHqIMu7zZO98BzuvufT1hTgSNw0jerzgvQXvGPyrxCmhgrjPsdxHhMuU9obzSY6%2BRnyZD1pAZSGrsVDPL4YZ9WUqEj1BHs2vVUOey%2FpVk0q7jqK9FDjkU2gF8Gf3QbuwzHZdizTdoZFz7vXjaGX2t4X8ILIyyQS3DmvtexiOvZf5yclxEVRcCLj61NuqrQA3URSS6M6nA66qtFVLZOtdoDhZrprA7qo8Vjhz4t0mH2AUc2cF4xT3t1Np6I2olAs166Zs6D9rmvpMM7ezssGOqUBoC0CtmG1JCojXcMImaaf8Pmyw%2Bp8y3PLB4BtBwM8PJ%2BzSam5VoriNp%2B5U6pkp0jOq%2FHohSkPy1cmrtOVoNQvN2tvgxnGN%2FQMgOijbnHekF6yZvsbr9s6ZnKjhZsqyvtNHD6zr5g3s0N1FyT3mF8DWWJ6gtWlstM3%2BV6UuRqFcQ9mH2oYOJUREJZ5qg5qjOlou19s%2FWrZ0b4jr5MUvF35gXm6gMXF&X-Amz-Signature=fa95d0a1826190e1c57ad86bcf1e11fc4fe95c111137b3fd6034a3797cabfb2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QLBUGKRP%2F20260123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260123T181925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJHMEUCICKctjt0jN0QWQonmVVWT1A87x18mHQimbF1IqzgEkIUAiEAyQsFn3mU7Zcr%2BVZHlt9LcvZnKu1Gt2IAWyUSWjAgSg0qiAQI%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPZl5RK25QH8VrWTOCrcA61iJGt7mQBCkrdufRDlveumvQYAv0NUqtX%2BKMUr5d50UuqoYIV%2Bu9Frfejx2rXlXaWwWxhjQqX9NPwvQneGy2wQT7XXUSfuecWmLliqRIWkn%2BlnFR729JvvYZ7Z2CN66aJTOzX4ZYFa5oM0NNivPUowDn4ocGxC2BPOnY1cWAlrepPHsLMRKyX2DzUrTEA5C2mozYOaDqJwzlcZI1Ebvg5dGpKpr1XDA8%2Fi%2FPVfGmz%2FVHd7NWPeBT%2Fc1ZCMLJxmQEwsUzsrgB0DNEiPTBwziaklufEWgxFFy%2Ba%2BWMUdJ0qs9IlhgoiurOWabmcSvjCHxzRh%2BWE52tzW9neu8mhjwgPfAK05xhm1qzKB6isGW0F1KyHdxLHqIMu7zZO98BzuvufT1hTgSNw0jerzgvQXvGPyrxCmhgrjPsdxHhMuU9obzSY6%2BRnyZD1pAZSGrsVDPL4YZ9WUqEj1BHs2vVUOey%2FpVk0q7jqK9FDjkU2gF8Gf3QbuwzHZdizTdoZFz7vXjaGX2t4X8ILIyyQS3DmvtexiOvZf5yclxEVRcCLj61NuqrQA3URSS6M6nA66qtFVLZOtdoDhZrprA7qo8Vjhz4t0mH2AUc2cF4xT3t1Np6I2olAs166Zs6D9rmvpMM7ezssGOqUBoC0CtmG1JCojXcMImaaf8Pmyw%2Bp8y3PLB4BtBwM8PJ%2BzSam5VoriNp%2B5U6pkp0jOq%2FHohSkPy1cmrtOVoNQvN2tvgxnGN%2FQMgOijbnHekF6yZvsbr9s6ZnKjhZsqyvtNHD6zr5g3s0N1FyT3mF8DWWJ6gtWlstM3%2BV6UuRqFcQ9mH2oYOJUREJZ5qg5qjOlou19s%2FWrZ0b4jr5MUvF35gXm6gMXF&X-Amz-Signature=665a4213d08a8264bcb946ded958a58925d165d1102e0fe8038f3e36bc503752&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
