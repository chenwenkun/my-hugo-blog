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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665TO4SN4V%2F20251026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251026T005505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCdEOxOFHyoajMWnz%2FCyFIrMYPmNDWzpHqBWm2UlxSt4wIhANUa%2Bj%2BBrc%2BJesBT%2FVB8J0EdaIZPcj6QOPJHP%2BgIiFmCKogECID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwLOjxqF01uAn9az7sq3APOzAViqLcznlz83n441q2O67kwTkKpvOLJ3MHMQL1I2%2F81JARVXjw9AuewAcrwRIC6vqt2smkV2p%2Bs9TwBAPf%2BI7Xe2jX8QW%2Fcd7Rmo4ArVrcQhhuW53%2F3cMuyjYfo4%2FXhG3FEM0o5sC%2F%2FLQF2633v8qmwO9L0pS39XmLmneclQ5NJ8Is4CQVFe1YP2a3psEC2rq4whwpcG5NC44TyLOaaySru7LPKuCcZsd%2F1D56whAfe8v5hTzACHIWGlFtDv1N0W9qswE8ppnSMzkX08KtRhhpePszNmfpZ34Ti6FmHwrk8z6fAcsTC8wsKSl7SGq6Boy5yqEc4anOQ1BYF3wF7el5JvF47SAVFVoPF4oUK%2FbyEOpgq4DL758XqA5P1UKtDlStgrx8ub%2BAco24FZiFM1yMdchPpdW6Y9OmuAKboAptVekoALQ6voMbdKtKJEJSxNnv5kvjQPXqHT5Rm6kr2tmjzoGoBsJ13PYW%2F2LPB0PobbBSuwTIIWEqoeO2jjfVih1m6PZh7UcXomNKfcJqVp6l2EJbIIUrFXQ4GCl65BVPtuMTO9iubeg%2BsvLNIEof4rnx4roz1IrmwVBl8%2BQGSqKmxyiTBaIzXvRwFcXpi4bQC6Pc0v%2FjYcj4CPjCjtfXHBjqkAfI4T%2Fspv68RM79VHHURQBQeZ10xoH3PYihYrKW2x%2BUmy4sOcKDe85LoifRHPeOkZqRwVK0LokLLvWJBKJ%2FaTo%2B50rKXXh3oEQRnVpHjBpUs72BZI3TUjsVXNiPc8tyBJiPZ3GIr6Bouk3dCkkfxNAqilpQVfr%2F93x0I5FrBJ%2B0n3zryAKeMtaLWpMbwLM9pUbhDx1%2B5u7lC7aU2BryKiuhRkguW&X-Amz-Signature=9ecdab765e2dd20ce3c4e2a129ad87110ed3b81c9c097d3b3fdb24ba88632bb2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665TO4SN4V%2F20251026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251026T005505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCdEOxOFHyoajMWnz%2FCyFIrMYPmNDWzpHqBWm2UlxSt4wIhANUa%2Bj%2BBrc%2BJesBT%2FVB8J0EdaIZPcj6QOPJHP%2BgIiFmCKogECID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwLOjxqF01uAn9az7sq3APOzAViqLcznlz83n441q2O67kwTkKpvOLJ3MHMQL1I2%2F81JARVXjw9AuewAcrwRIC6vqt2smkV2p%2Bs9TwBAPf%2BI7Xe2jX8QW%2Fcd7Rmo4ArVrcQhhuW53%2F3cMuyjYfo4%2FXhG3FEM0o5sC%2F%2FLQF2633v8qmwO9L0pS39XmLmneclQ5NJ8Is4CQVFe1YP2a3psEC2rq4whwpcG5NC44TyLOaaySru7LPKuCcZsd%2F1D56whAfe8v5hTzACHIWGlFtDv1N0W9qswE8ppnSMzkX08KtRhhpePszNmfpZ34Ti6FmHwrk8z6fAcsTC8wsKSl7SGq6Boy5yqEc4anOQ1BYF3wF7el5JvF47SAVFVoPF4oUK%2FbyEOpgq4DL758XqA5P1UKtDlStgrx8ub%2BAco24FZiFM1yMdchPpdW6Y9OmuAKboAptVekoALQ6voMbdKtKJEJSxNnv5kvjQPXqHT5Rm6kr2tmjzoGoBsJ13PYW%2F2LPB0PobbBSuwTIIWEqoeO2jjfVih1m6PZh7UcXomNKfcJqVp6l2EJbIIUrFXQ4GCl65BVPtuMTO9iubeg%2BsvLNIEof4rnx4roz1IrmwVBl8%2BQGSqKmxyiTBaIzXvRwFcXpi4bQC6Pc0v%2FjYcj4CPjCjtfXHBjqkAfI4T%2Fspv68RM79VHHURQBQeZ10xoH3PYihYrKW2x%2BUmy4sOcKDe85LoifRHPeOkZqRwVK0LokLLvWJBKJ%2FaTo%2B50rKXXh3oEQRnVpHjBpUs72BZI3TUjsVXNiPc8tyBJiPZ3GIr6Bouk3dCkkfxNAqilpQVfr%2F93x0I5FrBJ%2B0n3zryAKeMtaLWpMbwLM9pUbhDx1%2B5u7lC7aU2BryKiuhRkguW&X-Amz-Signature=67cfe6615504c8ae7afcead4de3f4a0f3c868700419466a5a455fec09c503e71&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
