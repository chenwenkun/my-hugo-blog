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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZV26YWDN%2F20260324%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260324T065220Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEWoRT6Ltj0cCs213nosFKtMpgWijKJ7WBnFs4UT%2FIMVAiEArj4qeeCp1I6w3KYANb8N8kUr%2FsB1JyvakdF3kqHJMgAqiAQIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAMN2gfl%2BbR4RxblZyrcA6yhHwRE%2BE7mkwE0NNqkuIO8DEGSH%2BwmusRP8l8yS3RAcqYck5ktM2kJ8zXcOG3NAFEsav4Q8B2HEyfo%2ByE8%2BenDMWLryHuKBFSa75xizQTSe0Fo3yX1LaUiZEN3E81ErWGyWog5ogGNjdJOY9mzoCEtBbfQLtjwpqLctTXFW4pKnI52pYMCX7cVxyL70Wh93WkuDTN3DUZDI4RB4KGTFc6npO0eWznjxbnlOmVE2NxAhEYwnYePxYA8Bb3EIhAcsKKb7p5sH1xSctr4v6156HYW1Ut6mh40QoxLLzwukBzFyiOUCAf4w4Zlk0Nl7DlRCbyYkkU9X73IPy3dJd%2FdgbIek7mjvkKIsByxxiT%2BjpACcT9in2ekswcvnOFprx37SO6QqwwvbJqAuEvwH%2FD600pIzJ2lk6oLyumIuWyipJtqEsGvmLYSkDoxpK5bbRQUotwZgQWK1E0lDbXgbp9EXVdvCxKLdtOpfQ48V5PlHFU%2FHq92L9ku4TykE3maog0M%2FBeiP5YA%2FaQ%2FlUXDKGdE3Vs56nLUGzxJBHAV2EeLAdjuUJvyF4W6UfIy4WIHESZvF7axP%2Fv8lhZW7mrmOrEZOVVaWjQ%2FXSV9F66ccH2g0IGogZEu2HAxD7fTKgJTMNXGiM4GOqUB%2Fo15OGwU7pu%2FP18JD2Rxrc0MA6ukmmTR1qEL4Mra9J3RF5%2Ba4wQIRLjhInOJkkXCNYHVB4nxSTjuM1M33yT5vz0KKmB%2FJ%2F6pYWgT1JPh0Y%2F%2FEh4le3tSD5gcBMcROglwVzh7Xm%2FMpae%2FKTuhhTAdyzUgcjGT1%2FvtFo6Q80tHgDSE7qfYsP%2F3iWqjBxt0qQU99L6xUzSxp9u2CSpYiJHpcCeinA%2FR&X-Amz-Signature=93377b76f2d07c883b0f09a66b2a4922eb59149c0dbaaa59a348cc6ff87da512&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZV26YWDN%2F20260324%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260324T065220Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEWoRT6Ltj0cCs213nosFKtMpgWijKJ7WBnFs4UT%2FIMVAiEArj4qeeCp1I6w3KYANb8N8kUr%2FsB1JyvakdF3kqHJMgAqiAQIj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAMN2gfl%2BbR4RxblZyrcA6yhHwRE%2BE7mkwE0NNqkuIO8DEGSH%2BwmusRP8l8yS3RAcqYck5ktM2kJ8zXcOG3NAFEsav4Q8B2HEyfo%2ByE8%2BenDMWLryHuKBFSa75xizQTSe0Fo3yX1LaUiZEN3E81ErWGyWog5ogGNjdJOY9mzoCEtBbfQLtjwpqLctTXFW4pKnI52pYMCX7cVxyL70Wh93WkuDTN3DUZDI4RB4KGTFc6npO0eWznjxbnlOmVE2NxAhEYwnYePxYA8Bb3EIhAcsKKb7p5sH1xSctr4v6156HYW1Ut6mh40QoxLLzwukBzFyiOUCAf4w4Zlk0Nl7DlRCbyYkkU9X73IPy3dJd%2FdgbIek7mjvkKIsByxxiT%2BjpACcT9in2ekswcvnOFprx37SO6QqwwvbJqAuEvwH%2FD600pIzJ2lk6oLyumIuWyipJtqEsGvmLYSkDoxpK5bbRQUotwZgQWK1E0lDbXgbp9EXVdvCxKLdtOpfQ48V5PlHFU%2FHq92L9ku4TykE3maog0M%2FBeiP5YA%2FaQ%2FlUXDKGdE3Vs56nLUGzxJBHAV2EeLAdjuUJvyF4W6UfIy4WIHESZvF7axP%2Fv8lhZW7mrmOrEZOVVaWjQ%2FXSV9F66ccH2g0IGogZEu2HAxD7fTKgJTMNXGiM4GOqUB%2Fo15OGwU7pu%2FP18JD2Rxrc0MA6ukmmTR1qEL4Mra9J3RF5%2Ba4wQIRLjhInOJkkXCNYHVB4nxSTjuM1M33yT5vz0KKmB%2FJ%2F6pYWgT1JPh0Y%2F%2FEh4le3tSD5gcBMcROglwVzh7Xm%2FMpae%2FKTuhhTAdyzUgcjGT1%2FvtFo6Q80tHgDSE7qfYsP%2F3iWqjBxt0qQU99L6xUzSxp9u2CSpYiJHpcCeinA%2FR&X-Amz-Signature=ab65fbf590539437bfe6b7a34c8c680c2694a7867227fbfe6f42f66220011699&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
