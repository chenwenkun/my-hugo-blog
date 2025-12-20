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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XWBZY35%2F20251220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251220T061750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLK0zgIEKGlUIfQNmWWwkA2mJT270pCV0LEJ3HxMKiCgIhAMUW%2FgzSZzP6aqkDfBKmwe8ZJnr5AEd%2FboLrj2sLAs%2FlKogECL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw%2BzYK6OQYO9aM5%2FjAq3AM9GhOMhd6IAnBGLE%2BfJsgogx3H6rwB7c4zI88DxcapyQfSRhGNrAQP%2Fltna1k6p1dnRqFJY4DBWfKEfVDwBtJ1aNPSNRx2lm1bbpIJi3cxpVQ4%2BNMjy2aqLj6U6vejIx24kUidd9DJ3O6Hd4Begsb3O6xwffx%2FgQf1QMswdJvVdpZT8Ml1Lq4zwL%2FF08n2VzuvS%2BRU6lUo%2B1DdAxzGhkxbEyOTn6J4IMD89u%2FFL7W3n0CllpyhL8o5QmY3elfNatz5ubjddevGQtV5DutTENRODu%2FX4kkL%2FOPMVtWW2hUtkoa%2BK6EeCOJ7jPcoTerg2S8sWDScUGesf%2FDqv8ZkjEsGhdo1oFY5MIYYLSKuYIRHvA0XaRYo%2FjK8DiYSJsk2zHYTgHlEEu0YguqC9IM%2ByPIu86zOy2A1QxT613bR%2FHl7DUQi963Uw00dSt7bcy1d10kxqInkDjrgkzczASv%2BXeeqrtIp7qJ2p3Qr9%2F0JuYXiGoylwImY6Q7nuRgX%2FaoobqwjiavUJpKUn4N5vBVN%2Bek5wOh7i8fuqAFLwGbxftEJWBdtdFyZXEBhRgsZIQIrYFipKBkBcptb14hKJJd6te8NFgoZD1OyzrFKif9xOKK2CbCwMSaI8q7%2FPQN4VTCg75jKBjqkAcELI%2FnUyh6FCZLajGTbGFjgzNfeed5Z51EJ49C%2FbB437YswVGebCvfnkxME%2FdSUOXiV5Nsz2XT9QJFhFIXBNpLus0NJD%2BCl3C5i6iLXdc%2FZ4ms2TOsgw7B3mJOB3jz9ZFvwtm3PqPdtB0rPHYhebxMlVgRZX2o28Vrtw9J4%2BbE4ONZoO%2B7SJ8YLwDryDQeNg4eSn5DwHQ%2FAGSv7K8CTCDH52taE&X-Amz-Signature=cb981a4f0eeb34eb7a3c72837e13d300ee8c37ec9f5faf37d4ad71128944a1c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666XWBZY35%2F20251220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251220T061750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLK0zgIEKGlUIfQNmWWwkA2mJT270pCV0LEJ3HxMKiCgIhAMUW%2FgzSZzP6aqkDfBKmwe8ZJnr5AEd%2FboLrj2sLAs%2FlKogECL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw%2BzYK6OQYO9aM5%2FjAq3AM9GhOMhd6IAnBGLE%2BfJsgogx3H6rwB7c4zI88DxcapyQfSRhGNrAQP%2Fltna1k6p1dnRqFJY4DBWfKEfVDwBtJ1aNPSNRx2lm1bbpIJi3cxpVQ4%2BNMjy2aqLj6U6vejIx24kUidd9DJ3O6Hd4Begsb3O6xwffx%2FgQf1QMswdJvVdpZT8Ml1Lq4zwL%2FF08n2VzuvS%2BRU6lUo%2B1DdAxzGhkxbEyOTn6J4IMD89u%2FFL7W3n0CllpyhL8o5QmY3elfNatz5ubjddevGQtV5DutTENRODu%2FX4kkL%2FOPMVtWW2hUtkoa%2BK6EeCOJ7jPcoTerg2S8sWDScUGesf%2FDqv8ZkjEsGhdo1oFY5MIYYLSKuYIRHvA0XaRYo%2FjK8DiYSJsk2zHYTgHlEEu0YguqC9IM%2ByPIu86zOy2A1QxT613bR%2FHl7DUQi963Uw00dSt7bcy1d10kxqInkDjrgkzczASv%2BXeeqrtIp7qJ2p3Qr9%2F0JuYXiGoylwImY6Q7nuRgX%2FaoobqwjiavUJpKUn4N5vBVN%2Bek5wOh7i8fuqAFLwGbxftEJWBdtdFyZXEBhRgsZIQIrYFipKBkBcptb14hKJJd6te8NFgoZD1OyzrFKif9xOKK2CbCwMSaI8q7%2FPQN4VTCg75jKBjqkAcELI%2FnUyh6FCZLajGTbGFjgzNfeed5Z51EJ49C%2FbB437YswVGebCvfnkxME%2FdSUOXiV5Nsz2XT9QJFhFIXBNpLus0NJD%2BCl3C5i6iLXdc%2FZ4ms2TOsgw7B3mJOB3jz9ZFvwtm3PqPdtB0rPHYhebxMlVgRZX2o28Vrtw9J4%2BbE4ONZoO%2B7SJ8YLwDryDQeNg4eSn5DwHQ%2FAGSv7K8CTCDH52taE&X-Amz-Signature=b1f4e7dc6d8dcd05bde52aada5899f89e108ace156937b2f8bfe872b0a0dccc1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
