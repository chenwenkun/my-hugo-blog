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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46643SYXPVR%2F20260801%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260801T080152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvCq%2BcO8mxTTkUtfkP5W1vu1QgKvIxPZbHaHjjeOtQcwIgQgsy6wQNVvTGg9DcDDnJNx5rO4mUO0hcQ53EPfmmceoqiAQIwP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJJtuIK%2FJlwk0N0LcCrcA%2B%2FT9YweqkoDdTzwYw0UFWn%2FxfWsCvkHHATrs7n%2FIImfx5VjoGzTbpZEGFEPu7H5kr%2BKE0CwveR0zYa%2FdyLrD8O9aNG%2F4KfTP%2B6sJadeQqr8pjlPcR9TBG3SXdK7ljg7zL77x%2FxDG32D8hKtGGGW2EVmhtE3w6Fh4wVlZnQhmOdDM3xs3mjWthOIvkL%2FwrHg34exmZDnwAvVINUIUmV1yHSkqDeGrLZ0dfWxUpMiq8ixq6MRRVe6HqgjZVAyeoNCcaPj8JmQ%2F%2F%2BPw3jaizfoPkgUNN6BAC3CIu7eubBJO4%2FforMcNU3Ry86tXrKdYOwWJaMbXPETKdo3Co0UUIuOMl4mmxLa2nK%2FqUH08jOJJGyGJmFungu5VzrZT3mVL4ok7U2i8oGkFlW43m5x8T5fJeYe6qfdYUYANrfhaJSIkdGrn4xs9pBlmeWwMf0N65ehdBeceAaTfmrywqwqD5gf%2BRHeZFzARE1X8E5ap1BXr1Hv9SrZO2Q1v5mMoSV8EMSghhbR9CfUXavsQvYlIHJDPMBqN2e0lb%2Fp0VjFxIclXx8ZrNrz3Q98tlk8oDUm1iVWddABM6A8F7UdUHQ0DhYF5%2FSfIrpWxTl4j1eYFS%2B%2BsNKgF4XtNNM4%2Fm5jwWeyMMixttMGOqUBN6JOmH5fh900HgsBnC92jhGsxMyWU6CP0eyyIYXg9xxqYjbd%2Fu9g6nRP5ObTC7y7Bc5dQ%2FAI0qB%2FLjZFdJ7dVIpyomkNEKeWap6fEtqtCgOYl67gQ6%2BAwDM0VPMFyPJWTl0qOSUY79PQr7AQZTyBWB2Qus0s2SuXTCoE%2FzPj74pdTeTJFkxFn1KjpzhMoFmxA%2BcOa7U%2FjmOhjWJ3RWTtPaNqWYiM&X-Amz-Signature=aacce9bd1b14cb69ce4080948d509f5ff2b4a7126b4709ed9e009a4deea5ba48&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46643SYXPVR%2F20260801%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260801T080152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvCq%2BcO8mxTTkUtfkP5W1vu1QgKvIxPZbHaHjjeOtQcwIgQgsy6wQNVvTGg9DcDDnJNx5rO4mUO0hcQ53EPfmmceoqiAQIwP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJJtuIK%2FJlwk0N0LcCrcA%2B%2FT9YweqkoDdTzwYw0UFWn%2FxfWsCvkHHATrs7n%2FIImfx5VjoGzTbpZEGFEPu7H5kr%2BKE0CwveR0zYa%2FdyLrD8O9aNG%2F4KfTP%2B6sJadeQqr8pjlPcR9TBG3SXdK7ljg7zL77x%2FxDG32D8hKtGGGW2EVmhtE3w6Fh4wVlZnQhmOdDM3xs3mjWthOIvkL%2FwrHg34exmZDnwAvVINUIUmV1yHSkqDeGrLZ0dfWxUpMiq8ixq6MRRVe6HqgjZVAyeoNCcaPj8JmQ%2F%2F%2BPw3jaizfoPkgUNN6BAC3CIu7eubBJO4%2FforMcNU3Ry86tXrKdYOwWJaMbXPETKdo3Co0UUIuOMl4mmxLa2nK%2FqUH08jOJJGyGJmFungu5VzrZT3mVL4ok7U2i8oGkFlW43m5x8T5fJeYe6qfdYUYANrfhaJSIkdGrn4xs9pBlmeWwMf0N65ehdBeceAaTfmrywqwqD5gf%2BRHeZFzARE1X8E5ap1BXr1Hv9SrZO2Q1v5mMoSV8EMSghhbR9CfUXavsQvYlIHJDPMBqN2e0lb%2Fp0VjFxIclXx8ZrNrz3Q98tlk8oDUm1iVWddABM6A8F7UdUHQ0DhYF5%2FSfIrpWxTl4j1eYFS%2B%2BsNKgF4XtNNM4%2Fm5jwWeyMMixttMGOqUBN6JOmH5fh900HgsBnC92jhGsxMyWU6CP0eyyIYXg9xxqYjbd%2Fu9g6nRP5ObTC7y7Bc5dQ%2FAI0qB%2FLjZFdJ7dVIpyomkNEKeWap6fEtqtCgOYl67gQ6%2BAwDM0VPMFyPJWTl0qOSUY79PQr7AQZTyBWB2Qus0s2SuXTCoE%2FzPj74pdTeTJFkxFn1KjpzhMoFmxA%2BcOa7U%2FjmOhjWJ3RWTtPaNqWYiM&X-Amz-Signature=f3e0e2fb5805fc59889804ab2d874c884e6bf293c96f9a5f5dc2a9b8b584476e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
