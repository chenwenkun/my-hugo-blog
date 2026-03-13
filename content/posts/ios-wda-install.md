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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622KFKFOW%2F20260313%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260313T182748Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDrQLm3bYc6QrbW%2B8u18eINXTfEmg7gpXDCtoY1OdPdBQIhAMlqaOK7jjzJSgKtgUXssJ%2FCbqBfIcZDg4iC%2BYQNHyqCKogECJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxOc%2Bhbl34ecQlQtgEq3AMbecYunJl8LIAQNMF1KpnGaVsE40SOwzcaRcFBZiMc9CU6I7c5bdZjNe7I1XL7czV78WOFb8QgwkqsUOJXihmVDfktYDge5gcRX9PiMKB%2F5xw2naZlaLdTJAKdMs7SlndG94WHoaOCtiFEtTjbi8V3vKH%2BlRG2ZNMm3ZOhKvW%2F11BPIDlZfTsQR4TYGlc5zEJ0HZR7sfSv1zSfKhb%2FQ3livYe45mVCE8lJ3il2XHpZIz9yyx0oLbRckU3bEb6CZmzf713gktGfkWp6gzRLDqHkDDfv454j0TZOlaucA6WQu025ltk2LliPfkJhQXHOirw9OJWQ1irQbYwMHlTYeGNWeyFdKc0ClmhoT5gvfqer1y150zv61xVKCPKMeEOxlQWCVemOIfM4d3Qj4A6q8OUkuQNwVszGF%2FknnWUpOt7TE5tUkh0Qv1jULYhJV%2FV8i5VhW7JLixKrIl8QMYJeZTN%2BT%2BvE8QQWFFkPcZbBZxIH%2FatSRtujCDKOn%2Fj6dDJpN7KhMV41iXavjAvhu98E%2BPIuogFdeBg01TiHclsCzXtnoCZQxvNRph10P4slUemp6YRCm3oCArs8Bv2xmCEaOZsWdJFsxbR3zwtRxQQAh3fbQQEx6qVJKokbPZ5Q7zDGjdHNBjqkAZlcLo3c6N8YKOgT3TALr26O%2B0aKHaziM6LFAYrr874ROmBt%2FJj2D%2Fcj9HH1alvEY4SOxWUOwI0yRGsl2ChOqIrjOieG9FsJ8WpwfibP3rWtReBL%2B93p7MhKEiy%2Fi2UtOG4vTkNOVuOpreAidyeg70v%2Bf2O5p%2BnK6ZiFLQU64Tm0g3BS9Uwq6ME6XtLAXz6e3KCUeP%2FTdDCsX5VcqprVKLd8RqvV&X-Amz-Signature=1c3d2ab4d51df1bf58b1e24068b5867162657078bea4d527d31101a87b33b502&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622KFKFOW%2F20260313%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260313T182748Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDrQLm3bYc6QrbW%2B8u18eINXTfEmg7gpXDCtoY1OdPdBQIhAMlqaOK7jjzJSgKtgUXssJ%2FCbqBfIcZDg4iC%2BYQNHyqCKogECJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxOc%2Bhbl34ecQlQtgEq3AMbecYunJl8LIAQNMF1KpnGaVsE40SOwzcaRcFBZiMc9CU6I7c5bdZjNe7I1XL7czV78WOFb8QgwkqsUOJXihmVDfktYDge5gcRX9PiMKB%2F5xw2naZlaLdTJAKdMs7SlndG94WHoaOCtiFEtTjbi8V3vKH%2BlRG2ZNMm3ZOhKvW%2F11BPIDlZfTsQR4TYGlc5zEJ0HZR7sfSv1zSfKhb%2FQ3livYe45mVCE8lJ3il2XHpZIz9yyx0oLbRckU3bEb6CZmzf713gktGfkWp6gzRLDqHkDDfv454j0TZOlaucA6WQu025ltk2LliPfkJhQXHOirw9OJWQ1irQbYwMHlTYeGNWeyFdKc0ClmhoT5gvfqer1y150zv61xVKCPKMeEOxlQWCVemOIfM4d3Qj4A6q8OUkuQNwVszGF%2FknnWUpOt7TE5tUkh0Qv1jULYhJV%2FV8i5VhW7JLixKrIl8QMYJeZTN%2BT%2BvE8QQWFFkPcZbBZxIH%2FatSRtujCDKOn%2Fj6dDJpN7KhMV41iXavjAvhu98E%2BPIuogFdeBg01TiHclsCzXtnoCZQxvNRph10P4slUemp6YRCm3oCArs8Bv2xmCEaOZsWdJFsxbR3zwtRxQQAh3fbQQEx6qVJKokbPZ5Q7zDGjdHNBjqkAZlcLo3c6N8YKOgT3TALr26O%2B0aKHaziM6LFAYrr874ROmBt%2FJj2D%2Fcj9HH1alvEY4SOxWUOwI0yRGsl2ChOqIrjOieG9FsJ8WpwfibP3rWtReBL%2B93p7MhKEiy%2Fi2UtOG4vTkNOVuOpreAidyeg70v%2Bf2O5p%2BnK6ZiFLQU64Tm0g3BS9Uwq6ME6XtLAXz6e3KCUeP%2FTdDCsX5VcqprVKLd8RqvV&X-Amz-Signature=80d4bf22458921caab718f80ffd804ad38605e20f7b008d01594544895c883c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
