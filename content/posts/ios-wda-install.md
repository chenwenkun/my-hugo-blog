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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YXVWPLOE%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T024112Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDRE6kY9PvYu6VE%2BMZmcR9fogOK7tQAVzJW59%2FfdjT2TgIgE7qSG4PNeJzLJABuSaAVY4N2DuuUpx8q5H0ws4pdsW0q%2FwMIUxAAGgw2Mzc0MjMxODM4MDUiDHUMLFHy%2Bl2H%2FfqInCrcA%2B%2F1r8N7QVKQkaxiaIMsmVhJNIzqHMqIZPVpDHoiOA%2B2MxHFFKvP08JAouDzh3habf3k%2FubsXzF5tIjMuekCtKBdibc57zXMJRAh%2B2zSaXcdDePJGInuAZRyf%2FtKSZPBXmVDQtw2rrPpAwOSoWW1RPpLwU0MvjpgE01VqnzV4gO9MErIjToYYH%2B29khzr2DBK6IQcPIGy8uP5%2Fh6SZsY21h5hOeAiuRYIgz4vNOks5tEP20ho7gmDoIYiV3XbDDmaFJ%2BDwOoNOEUSeQR%2Bu7PEX30CtPJ1EW%2FE3xOKrosB7xeS%2BGxret%2FRJYimJ4LgIDJXcNLDBA1CCapCNocH0OmNtLel1t5WeaPDiTQvnkfknjRs37DxCVLQQ6%2FgW9XCA7ipnRAvd1hmYwrFVvNrfCfd6p3fxqYdCcY3joFWDliIQAhUM24MtARKV5h15%2FFCXvyBWnGFBUFRq%2BVa4JF%2FUWJ7vt3sOhAoYWCsCMaH0z3xLhMG%2BCJLLWg0%2F81Q6fcaJBpNx9UARPoj%2BzAfDFsXKQrOZJkGa8%2BlMRpC4DIA6lGwd6OcAdIeM1lMoq1E9h1FeMVuZeZYKS6gIbBQxCP9WpqpRzJ3%2FYqnJKaZxaETkDsxJT%2FNywkRTUOZT3pyViOMLiyvdEGOqUBxc4Be1%2BrO%2BJof1lDna8shQtPk3W1ai%2FXc8%2BOI5RLqBnWflP01I6m6qLzqZuhIAI6%2FsiQlAeEdxAEVMd51KvE9wfaOOJO6ft57%2BDULUgxx2teLHxEaujmr89v61sxKM%2F81FokdRH9D5JXqbqrHIIowUXu9HEfn0%2B8O5D6Un8jXCM8agJwDszo4I8B9ahFTMV36sb3AKnYUJZhMuWKc3X%2FDOd7mIVp&X-Amz-Signature=6cd3eda5afa8e2f6c86a4f302349da42a4bb0f5bb5a52a2698df8859028d55a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YXVWPLOE%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T024112Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDRE6kY9PvYu6VE%2BMZmcR9fogOK7tQAVzJW59%2FfdjT2TgIgE7qSG4PNeJzLJABuSaAVY4N2DuuUpx8q5H0ws4pdsW0q%2FwMIUxAAGgw2Mzc0MjMxODM4MDUiDHUMLFHy%2Bl2H%2FfqInCrcA%2B%2F1r8N7QVKQkaxiaIMsmVhJNIzqHMqIZPVpDHoiOA%2B2MxHFFKvP08JAouDzh3habf3k%2FubsXzF5tIjMuekCtKBdibc57zXMJRAh%2B2zSaXcdDePJGInuAZRyf%2FtKSZPBXmVDQtw2rrPpAwOSoWW1RPpLwU0MvjpgE01VqnzV4gO9MErIjToYYH%2B29khzr2DBK6IQcPIGy8uP5%2Fh6SZsY21h5hOeAiuRYIgz4vNOks5tEP20ho7gmDoIYiV3XbDDmaFJ%2BDwOoNOEUSeQR%2Bu7PEX30CtPJ1EW%2FE3xOKrosB7xeS%2BGxret%2FRJYimJ4LgIDJXcNLDBA1CCapCNocH0OmNtLel1t5WeaPDiTQvnkfknjRs37DxCVLQQ6%2FgW9XCA7ipnRAvd1hmYwrFVvNrfCfd6p3fxqYdCcY3joFWDliIQAhUM24MtARKV5h15%2FFCXvyBWnGFBUFRq%2BVa4JF%2FUWJ7vt3sOhAoYWCsCMaH0z3xLhMG%2BCJLLWg0%2F81Q6fcaJBpNx9UARPoj%2BzAfDFsXKQrOZJkGa8%2BlMRpC4DIA6lGwd6OcAdIeM1lMoq1E9h1FeMVuZeZYKS6gIbBQxCP9WpqpRzJ3%2FYqnJKaZxaETkDsxJT%2FNywkRTUOZT3pyViOMLiyvdEGOqUBxc4Be1%2BrO%2BJof1lDna8shQtPk3W1ai%2FXc8%2BOI5RLqBnWflP01I6m6qLzqZuhIAI6%2FsiQlAeEdxAEVMd51KvE9wfaOOJO6ft57%2BDULUgxx2teLHxEaujmr89v61sxKM%2F81FokdRH9D5JXqbqrHIIowUXu9HEfn0%2B8O5D6Un8jXCM8agJwDszo4I8B9ahFTMV36sb3AKnYUJZhMuWKc3X%2FDOd7mIVp&X-Amz-Signature=bbd5601f0c4718acff05729a6afa40db1450ab33bc8d7c63ca103f2c29218c45&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
