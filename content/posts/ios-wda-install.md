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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UEZTEZGT%2F20260222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260222T182050Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJIMEYCIQCEUBm%2FC914bWSeCK2jICDcl0DcQE0i4A%2BhwJfEoScuEwIhANxSQykDaBh8QPHacHBCPITz59XSWX4JfuFl2jZvYvU%2FKogECMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx7KPLfZ2Kt6eWswHgq3APss%2Fk3947IQWMYyLC7Sbe0jyqmAJe0rhe5%2BBYAJi6WPkyn4%2FtHZeU8GrNqgYUmTvHMinYG5wuKcTZ1o1wauJSLN9dEncBFDvNYgJTB7%2BxPOagZ8mPM2XC9LIJrhs2Tr9JyDibiBbS6OSW13UHbgDF6%2Fh0Ipo4kKraGG981F6Rly8xNRAPh2e2pzmXt7GRMlOg7wkwbWvNEXesR2g1H%2BULvqv%2Baq0it%2FB3VpivjRwg7OxhIyW0r6Fauho%2FuJSIP%2BoEqlZz8jdOn6ChhM%2B1a41Hy71Mk7ZSs2IRtN1bmvn%2FLpbe37X4X9kukDfpa0ep%2BFlpeDBqDEHOUTkJfFUM%2FJuY5Px0oyZI1%2BtGZy7CnbecVdXXJHrCZSdBdZgL3pZK%2B97x1FalWWrxQydlYM59tYkQCFn5BhiQonYWd0PVaEjhuhP%2F130os%2FSNEA5Pa1xeILa72UdK1DzKxbi9m4p95QylzQMcAbH528fXGqJ6JzDiMuJv4rrrYlB2v7ICrzYhL4dNLn36MFmm6IkWjg2Mc%2BxF3001JaUOqig1wsKpHNvrIEgQNpLFI4wafc3zO5qw41uvEuoulNlmtCKnMa0buXGFG5rvoZxb5TXfNBfa7fuw4eAuNGs6KFQTr83LXozC%2Fh%2B3MBjqkAct%2FdP0WFp6UstYi2mpuiJpqB4CNuJDHEtjEW763w0biy0ijl5fhdezTCk1aoZZ9bWQmzLbHRyzvcoFvDuwUuHus7XadcIANYeZPNFIYwuE%2B%2Ff8eGtNiza4QyOB%2F1LesZDn9C1nHX9Kf%2BDwbZWYaq%2Fa9j6PH2CbKkg57bTgowR1vAn530wzL1wtrAgULPJQfwbRmvd07rkjsAqqD3ONNulA%2B4OUi&X-Amz-Signature=ce1bf7b23adfc8da9ce15cf3f41d5a5d027aa9e1ac255759f50f8f88f7ddc791&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UEZTEZGT%2F20260222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260222T182050Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJIMEYCIQCEUBm%2FC914bWSeCK2jICDcl0DcQE0i4A%2BhwJfEoScuEwIhANxSQykDaBh8QPHacHBCPITz59XSWX4JfuFl2jZvYvU%2FKogECMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx7KPLfZ2Kt6eWswHgq3APss%2Fk3947IQWMYyLC7Sbe0jyqmAJe0rhe5%2BBYAJi6WPkyn4%2FtHZeU8GrNqgYUmTvHMinYG5wuKcTZ1o1wauJSLN9dEncBFDvNYgJTB7%2BxPOagZ8mPM2XC9LIJrhs2Tr9JyDibiBbS6OSW13UHbgDF6%2Fh0Ipo4kKraGG981F6Rly8xNRAPh2e2pzmXt7GRMlOg7wkwbWvNEXesR2g1H%2BULvqv%2Baq0it%2FB3VpivjRwg7OxhIyW0r6Fauho%2FuJSIP%2BoEqlZz8jdOn6ChhM%2B1a41Hy71Mk7ZSs2IRtN1bmvn%2FLpbe37X4X9kukDfpa0ep%2BFlpeDBqDEHOUTkJfFUM%2FJuY5Px0oyZI1%2BtGZy7CnbecVdXXJHrCZSdBdZgL3pZK%2B97x1FalWWrxQydlYM59tYkQCFn5BhiQonYWd0PVaEjhuhP%2F130os%2FSNEA5Pa1xeILa72UdK1DzKxbi9m4p95QylzQMcAbH528fXGqJ6JzDiMuJv4rrrYlB2v7ICrzYhL4dNLn36MFmm6IkWjg2Mc%2BxF3001JaUOqig1wsKpHNvrIEgQNpLFI4wafc3zO5qw41uvEuoulNlmtCKnMa0buXGFG5rvoZxb5TXfNBfa7fuw4eAuNGs6KFQTr83LXozC%2Fh%2B3MBjqkAct%2FdP0WFp6UstYi2mpuiJpqB4CNuJDHEtjEW763w0biy0ijl5fhdezTCk1aoZZ9bWQmzLbHRyzvcoFvDuwUuHus7XadcIANYeZPNFIYwuE%2B%2Ff8eGtNiza4QyOB%2F1LesZDn9C1nHX9Kf%2BDwbZWYaq%2Fa9j6PH2CbKkg57bTgowR1vAn530wzL1wtrAgULPJQfwbRmvd07rkjsAqqD3ONNulA%2B4OUi&X-Amz-Signature=7318643a171029506a3ebf63ce35534d29ec37c06e04afd58e1fc8fdfd47d566&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
