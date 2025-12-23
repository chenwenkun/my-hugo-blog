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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667LTGCPX4%2F20251223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251223T181802Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQCzr3pfXFK1UwM69USPGFLOuMeZjnwQkuc4rSPlvJyIlwIhAJKDDPm%2FQ5sN3AXPUWsiiJXe6rReWOzovmv94iH7xlWKKv8DCBIQABoMNjM3NDIzMTgzODA1Igyp1Jk0c8i5yVdOG0wq3AMOegtApQaTC7n6YBMIclgoLFH0sOZpu6S%2FC1UcEMZOvkd6Eygz2DeQNbC0xuBQxmXy%2BUr9fGIDSL37mRcLKq%2B4HwmfTU3fJW5KaK7dSmrHg%2BMBUw68BTJpYjkSCukxYjkoxU0jWSYTOjtcQYYgRmO3krWoJC25K%2FBlvjzE2Ht6G6m1c8Ebm%2BfQCwPC3A6iVElJUIq5g1TfWmF%2Foi%2Fp%2BmSg7gfavnINl1EwICDLh8E2zMpQSqd3UdomhDw3LYNpYgfoH8S2dkSqXvR6hiZ3tvY2hXOY4XhrjSUuYKCRpB8XxdzVE4y%2F3BBxxDzHDBNboW2%2FGKzDxpVpbS8iXZZPR%2F0b3SCpR1M4vpOILwBwafv5fPCFOnBJLDLgHjCCXgqi4ugGgbFvl6GfkMOopVLa298iJZ6%2BCevcL05sCHi9IbT9ZEzqiD2iMJMEDP5Nc2imWVlOI4EfJ53FYfGWoVzludpwWFeq1nSbVvLiXk3chG6cVqK7OQyWlu8VGR1pjtJQc3nBSFnauR6xa5PoLmyNukQq2ghc81BKLeidQ2kkWsyUw1QflNwVi3E%2BLBSE1EuG5NFjTMnW%2BPdLxGg24bY6dMnfYHJ4kbwrRKcaRJ9%2FYCLIWSSHlgwvDVozNkZb6jD3navKBjqkAYqZ%2B6q9YE1O9B6UD17oVa%2BVCe4DIBTJaVSib3ukrpktRc%2FVIBbwLTn5OYU18LzHBprysu%2FwuZUxsVEItvgiH5U8MT3t%2B3GtYUIfLeyB38wfU9qV8u2JUZNINTps6afO%2FyPuuJNLaiKX14Q5742bkPtArcefTWqtoj3oPAebT8nze9u7OCMpojI0jDjc%2FMwj67UNWq5Z2GvHZ4%2B5O%2FTLP22Gr5iZ&X-Amz-Signature=368dce1de11b86bde173d979fdfa55d10ae10f44bbd2cc13369c45d57385be02&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667LTGCPX4%2F20251223%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251223T181802Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLXdlc3QtMiJIMEYCIQCzr3pfXFK1UwM69USPGFLOuMeZjnwQkuc4rSPlvJyIlwIhAJKDDPm%2FQ5sN3AXPUWsiiJXe6rReWOzovmv94iH7xlWKKv8DCBIQABoMNjM3NDIzMTgzODA1Igyp1Jk0c8i5yVdOG0wq3AMOegtApQaTC7n6YBMIclgoLFH0sOZpu6S%2FC1UcEMZOvkd6Eygz2DeQNbC0xuBQxmXy%2BUr9fGIDSL37mRcLKq%2B4HwmfTU3fJW5KaK7dSmrHg%2BMBUw68BTJpYjkSCukxYjkoxU0jWSYTOjtcQYYgRmO3krWoJC25K%2FBlvjzE2Ht6G6m1c8Ebm%2BfQCwPC3A6iVElJUIq5g1TfWmF%2Foi%2Fp%2BmSg7gfavnINl1EwICDLh8E2zMpQSqd3UdomhDw3LYNpYgfoH8S2dkSqXvR6hiZ3tvY2hXOY4XhrjSUuYKCRpB8XxdzVE4y%2F3BBxxDzHDBNboW2%2FGKzDxpVpbS8iXZZPR%2F0b3SCpR1M4vpOILwBwafv5fPCFOnBJLDLgHjCCXgqi4ugGgbFvl6GfkMOopVLa298iJZ6%2BCevcL05sCHi9IbT9ZEzqiD2iMJMEDP5Nc2imWVlOI4EfJ53FYfGWoVzludpwWFeq1nSbVvLiXk3chG6cVqK7OQyWlu8VGR1pjtJQc3nBSFnauR6xa5PoLmyNukQq2ghc81BKLeidQ2kkWsyUw1QflNwVi3E%2BLBSE1EuG5NFjTMnW%2BPdLxGg24bY6dMnfYHJ4kbwrRKcaRJ9%2FYCLIWSSHlgwvDVozNkZb6jD3navKBjqkAYqZ%2B6q9YE1O9B6UD17oVa%2BVCe4DIBTJaVSib3ukrpktRc%2FVIBbwLTn5OYU18LzHBprysu%2FwuZUxsVEItvgiH5U8MT3t%2B3GtYUIfLeyB38wfU9qV8u2JUZNINTps6afO%2FyPuuJNLaiKX14Q5742bkPtArcefTWqtoj3oPAebT8nze9u7OCMpojI0jDjc%2FMwj67UNWq5Z2GvHZ4%2B5O%2FTLP22Gr5iZ&X-Amz-Signature=c6079406d0d27fe95214e166e59b7ef5766ab315b4fe2b23f9d605ad8e12d0ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
