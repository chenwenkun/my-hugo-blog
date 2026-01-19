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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWQZXEAZ%2F20260119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260119T010235Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCMtmyUSObYoAqGC2q%2FaATpNKKRMNUVqrb5fFarXTfkEgIhAJ8EKRK1rhqg6B0GuYs99fL6M4btdjirCaagPXzLDTiaKogECIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxwN12kJZJJvZFWtCIq3APJXOqHUoOa0rqZAIXDI6ZU%2FNk%2B5RaB5q36%2FU90M98cSNRChyRTmxU3O7X0mZ8oXOgvcWVwbDff3rKQnjOHHnXv0fVcQkv7IiYqXcZYqmO8IN8Ia%2Bm0bNTWwBdMjjEo2MN829TRsqqPP%2B%2BDycpR9L3UnIqee5JNv19Z2Fr5myHGRKWJ6rmouYMjMRXhEAQx9NjNxn5Q5xugm5NRTO1lxioKc8hEXfqKAFIVvYrJQNmL9FRnApx6Z63L4kVsshhZbcEECpmE6KB8W452xTFMZpXtsrYl5MRwVnNB1EE6fWZvTG7%2F6ymAsodUlmw5QCZb9f1Q792od0GkghjWh%2FzBerFXALbZeBPZYj98t1ySgiBa5IDWXU4gyCMaKJqCsOgL5oZn%2FS2oEeO4FcE2IZUWedW95JVBXHEokLYW0%2B3HsertUgFKi5KS%2FUfnfjSuOxNxbld2aZ2JeYSaGJ78%2BfAHTKOl9g1h8oDIjRKw2EivSumYgTg3eQE%2BX1R14ls3FiIXW%2F8M0ESncJ2yCJf%2BPyLOUDyekO01lqWZ6%2BCC%2FvEiQo1WP8q9Qy0c02nscRNtSuZ5PA3eNi4OnxUfTzc07JeEPofJPjfV0k%2FHPamGqgDtIScgGZZ9gT7K5wIkCD78xjDu3bXLBjqkAaHXGGm%2FAq91I82223vdKBxLA2Tm8NHbzGmWsG2zIHph2m0%2BGGAh8GqJy5zJIFnCCOY8atofiIhfN%2Fo6k9bOmOFo2UGi%2BUrZWcKSYLMlaYIz9zS8oB1ungx4L0yj79EGtD24mDsboC50p5WDzgFws2nPN78GrdfmzLFqpvLiB1MpPLdMWKhYtLrTet2ax%2BvU%2BMd5PDjzSnX3jcItFy%2BqhnsZoDGr&X-Amz-Signature=47d8fccbdff87b8556be9f6f1ba368f6de990f81cab7cc370093f9b81448ce51&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZWQZXEAZ%2F20260119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260119T010235Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCMtmyUSObYoAqGC2q%2FaATpNKKRMNUVqrb5fFarXTfkEgIhAJ8EKRK1rhqg6B0GuYs99fL6M4btdjirCaagPXzLDTiaKogECIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxwN12kJZJJvZFWtCIq3APJXOqHUoOa0rqZAIXDI6ZU%2FNk%2B5RaB5q36%2FU90M98cSNRChyRTmxU3O7X0mZ8oXOgvcWVwbDff3rKQnjOHHnXv0fVcQkv7IiYqXcZYqmO8IN8Ia%2Bm0bNTWwBdMjjEo2MN829TRsqqPP%2B%2BDycpR9L3UnIqee5JNv19Z2Fr5myHGRKWJ6rmouYMjMRXhEAQx9NjNxn5Q5xugm5NRTO1lxioKc8hEXfqKAFIVvYrJQNmL9FRnApx6Z63L4kVsshhZbcEECpmE6KB8W452xTFMZpXtsrYl5MRwVnNB1EE6fWZvTG7%2F6ymAsodUlmw5QCZb9f1Q792od0GkghjWh%2FzBerFXALbZeBPZYj98t1ySgiBa5IDWXU4gyCMaKJqCsOgL5oZn%2FS2oEeO4FcE2IZUWedW95JVBXHEokLYW0%2B3HsertUgFKi5KS%2FUfnfjSuOxNxbld2aZ2JeYSaGJ78%2BfAHTKOl9g1h8oDIjRKw2EivSumYgTg3eQE%2BX1R14ls3FiIXW%2F8M0ESncJ2yCJf%2BPyLOUDyekO01lqWZ6%2BCC%2FvEiQo1WP8q9Qy0c02nscRNtSuZ5PA3eNi4OnxUfTzc07JeEPofJPjfV0k%2FHPamGqgDtIScgGZZ9gT7K5wIkCD78xjDu3bXLBjqkAaHXGGm%2FAq91I82223vdKBxLA2Tm8NHbzGmWsG2zIHph2m0%2BGGAh8GqJy5zJIFnCCOY8atofiIhfN%2Fo6k9bOmOFo2UGi%2BUrZWcKSYLMlaYIz9zS8oB1ungx4L0yj79EGtD24mDsboC50p5WDzgFws2nPN78GrdfmzLFqpvLiB1MpPLdMWKhYtLrTet2ax%2BvU%2BMd5PDjzSnX3jcItFy%2BqhnsZoDGr&X-Amz-Signature=1b010ac73f867f8d1b3398e500c83c0568e9035d9ab33f983f5a34d0634bf217&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
