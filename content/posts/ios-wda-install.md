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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JQ5FZK5%2F20251202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251202T061907Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJGMEQCIDSwjsR5EnIWetOJIWe3FFSngTGR0wFg61zPT%2BWzsOJ2AiAg9Rdb4tbtKnDUTKaxwv1rJSHXJVDu%2B4hdWdqWE43%2BISr%2FAwgPEAAaDDYzNzQyMzE4MzgwNSIMFBTj5%2B9KIq0bZ2HFKtwDl10DYjmipWFIHVw8DePhZja55C%2FpuV7ugMYw%2BgUBasB0p8rpUnCEXzrZVR6IMLBTrLURaC%2FinZTHfgPGbD5kvM7CO0kNckJgiFVaX6iGuDumUqSruQP%2BdCctBckYneamSSpcAybafioyPpox9rEyZHO96RSdnwdEyoFHR68Mu4%2FCzPfAl2wGujBX44qzttlltIh%2FEnreuHgFOUnZBwB5UVClbTuY57RBAfsstpmdh%2FoafX7gTFy3BCUm898lNyV8yo4QJMFu2v%2Bqkf1utOtsrxEEptuIC4UTEEEiwMPt2Tt87y7OscSJ7sWzUk9qtiP4QpkSlUsO4ycnl0UUvBixttdrBXiGzaiQW8O7XpCN8Q7Ehl0WBOVngFp5pNiDuxACk5BA1RYXy6mQyADzFAZfWwTJWPpBbSsRpJZW0Gh7RDJGGPrSzFqdh%2BhNQPsx0XlHGaxG0hKmOjDD7Cdb%2FzKSo39ofuM4hE2C9xS3Wn7L5h6NEo8LC3HQ2Zv0Oyimu0W7I1a8%2BSf9d7stwQG3aE1jC52cs4ZCoCiEB42bSYjrd2TDsdOCpTbEgjjMDlPL%2B9oi59KUsFmC638sVW2pGhb4JXjAQqRnEwRThCswSVfPCcxMeAWU%2Bcw5as1HWdYwqf%2B5yQY6pgFmQr5ivbIWGYjM0GMLeBS2IVhwYvCIz0kXfsEEkVSUXaPM9iNvAk%2FiZeBNkksQmAHGHEqoEV02RdytvyLJvmaq%2FB632x7lCEX%2Fsav03Gto78BTnsgIl9SMw06fRBO7UiJhe2FTy0vR%2BV%2Fv83e8xUx2OZuCxZx%2FdnbyE4mCgJnjD0Akqu0QGXphZY%2FDJu0%2F8acQM6G7wMYsyE9yZtApVoasL5m6z6hr&X-Amz-Signature=45ddf645344c74a85064c795bc96ad2c8209c88f8ba92531b7e850448e0115ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664JQ5FZK5%2F20251202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251202T061907Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJGMEQCIDSwjsR5EnIWetOJIWe3FFSngTGR0wFg61zPT%2BWzsOJ2AiAg9Rdb4tbtKnDUTKaxwv1rJSHXJVDu%2B4hdWdqWE43%2BISr%2FAwgPEAAaDDYzNzQyMzE4MzgwNSIMFBTj5%2B9KIq0bZ2HFKtwDl10DYjmipWFIHVw8DePhZja55C%2FpuV7ugMYw%2BgUBasB0p8rpUnCEXzrZVR6IMLBTrLURaC%2FinZTHfgPGbD5kvM7CO0kNckJgiFVaX6iGuDumUqSruQP%2BdCctBckYneamSSpcAybafioyPpox9rEyZHO96RSdnwdEyoFHR68Mu4%2FCzPfAl2wGujBX44qzttlltIh%2FEnreuHgFOUnZBwB5UVClbTuY57RBAfsstpmdh%2FoafX7gTFy3BCUm898lNyV8yo4QJMFu2v%2Bqkf1utOtsrxEEptuIC4UTEEEiwMPt2Tt87y7OscSJ7sWzUk9qtiP4QpkSlUsO4ycnl0UUvBixttdrBXiGzaiQW8O7XpCN8Q7Ehl0WBOVngFp5pNiDuxACk5BA1RYXy6mQyADzFAZfWwTJWPpBbSsRpJZW0Gh7RDJGGPrSzFqdh%2BhNQPsx0XlHGaxG0hKmOjDD7Cdb%2FzKSo39ofuM4hE2C9xS3Wn7L5h6NEo8LC3HQ2Zv0Oyimu0W7I1a8%2BSf9d7stwQG3aE1jC52cs4ZCoCiEB42bSYjrd2TDsdOCpTbEgjjMDlPL%2B9oi59KUsFmC638sVW2pGhb4JXjAQqRnEwRThCswSVfPCcxMeAWU%2Bcw5as1HWdYwqf%2B5yQY6pgFmQr5ivbIWGYjM0GMLeBS2IVhwYvCIz0kXfsEEkVSUXaPM9iNvAk%2FiZeBNkksQmAHGHEqoEV02RdytvyLJvmaq%2FB632x7lCEX%2Fsav03Gto78BTnsgIl9SMw06fRBO7UiJhe2FTy0vR%2BV%2Fv83e8xUx2OZuCxZx%2FdnbyE4mCgJnjD0Akqu0QGXphZY%2FDJu0%2F8acQM6G7wMYsyE9yZtApVoasL5m6z6hr&X-Amz-Signature=059846691efc1828d7b5bfd0ef5418044e6a9821370e46505cf131bba367b05e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
