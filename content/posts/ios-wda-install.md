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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YMAGBVZW%2F20260503%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260503T184220Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDuWHWQMQGrDaDzKXmTybBFtzBEoWseDUXP7ksZfSUinAIgbt2EUPbZ2AEIxYScqBW2FTG5YxGgep1NwdGsfUshjd8q%2FwMIWxAAGgw2Mzc0MjMxODM4MDUiDC%2BALOfuwR3VkZytmircA9K7vLW42M%2BRMWHaxwBSE5vM4ms4ER36Q5igq1Jk8EZGQEioUaMvhP4n7%2FY8xqIyW%2F9XtTYf%2BLFE6Af%2FUvCbCBj06KdF3f%2FcfH6U786h6tzX8wL2q1XbSWPg7eq8v%2B243ctUlqaxzQnCAFA95Gu87Piho%2FyWnpHFJJUivaIFJxBUeBt5Gm2znwpLjCDWfUJyXh6OZjSiIiNQdJAN8EvbZhvQtQx3EGj6bTC5ESSru17XzKr99YhD29DaFoVakecvMtVcHMd%2BmYTy25I7FBmTRjYgZkY31UNTTJnR2n3GJA11O4TTOQh%2FYc9uKnfS0LRRoH8DYiAlxINsC49OpSuga824N6xVMDB4znbPMaw4oiVIbUeBPjCZp6GJTDMIe16nE9VaueX6qoHDNa6fhNbq0e8SNwfMI7T6d5bW2pFzrf19ANDZmnhrRSkBjkX3OQZOc9Aivj1jVlMPKX7OdAdprAMm5lgfwDsLdbSt2QauRI3OsNIGwn7FloUicEJDtV9iSlGUp5sK3v6E382C0TWBbdzi5yaI3gGbxfbuJNKVJ4ze6VSzlYC0CnY%2BHs35xJrxWzay5FSnGgu0wQslNwNUkNgBBQV9SbzRidUNLM5Z5dcWunGr10x2SDI3Vh1%2FMOya3s8GOqUBa2ZSZ2pPMznYrI1S0px1tol5ffJx9SWLuM5eS3v%2B3Cgq8p3zY31oAE2qJGjOzSecrV98FtDUd9nS1ZYCgK%2BTXVMUiB6FB%2FZSH8kMGdRhn4kyL%2F8Gx1EEJqC6Qfd2fUGVvJiQE1IyTqoY7sliWTGQFAYInzsHHCbGKY6A9yWbshmscFyjq0CFvA9u430OD5pEADo8k3sG53UJEHBtLlgJlQ%2BoFRM2&X-Amz-Signature=d8950ee44ad7bee0e75deb92f1173c2c1a51aff39b5c95d2d6c9c2a019437ed5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YMAGBVZW%2F20260503%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260503T184220Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDuWHWQMQGrDaDzKXmTybBFtzBEoWseDUXP7ksZfSUinAIgbt2EUPbZ2AEIxYScqBW2FTG5YxGgep1NwdGsfUshjd8q%2FwMIWxAAGgw2Mzc0MjMxODM4MDUiDC%2BALOfuwR3VkZytmircA9K7vLW42M%2BRMWHaxwBSE5vM4ms4ER36Q5igq1Jk8EZGQEioUaMvhP4n7%2FY8xqIyW%2F9XtTYf%2BLFE6Af%2FUvCbCBj06KdF3f%2FcfH6U786h6tzX8wL2q1XbSWPg7eq8v%2B243ctUlqaxzQnCAFA95Gu87Piho%2FyWnpHFJJUivaIFJxBUeBt5Gm2znwpLjCDWfUJyXh6OZjSiIiNQdJAN8EvbZhvQtQx3EGj6bTC5ESSru17XzKr99YhD29DaFoVakecvMtVcHMd%2BmYTy25I7FBmTRjYgZkY31UNTTJnR2n3GJA11O4TTOQh%2FYc9uKnfS0LRRoH8DYiAlxINsC49OpSuga824N6xVMDB4znbPMaw4oiVIbUeBPjCZp6GJTDMIe16nE9VaueX6qoHDNa6fhNbq0e8SNwfMI7T6d5bW2pFzrf19ANDZmnhrRSkBjkX3OQZOc9Aivj1jVlMPKX7OdAdprAMm5lgfwDsLdbSt2QauRI3OsNIGwn7FloUicEJDtV9iSlGUp5sK3v6E382C0TWBbdzi5yaI3gGbxfbuJNKVJ4ze6VSzlYC0CnY%2BHs35xJrxWzay5FSnGgu0wQslNwNUkNgBBQV9SbzRidUNLM5Z5dcWunGr10x2SDI3Vh1%2FMOya3s8GOqUBa2ZSZ2pPMznYrI1S0px1tol5ffJx9SWLuM5eS3v%2B3Cgq8p3zY31oAE2qJGjOzSecrV98FtDUd9nS1ZYCgK%2BTXVMUiB6FB%2FZSH8kMGdRhn4kyL%2F8Gx1EEJqC6Qfd2fUGVvJiQE1IyTqoY7sliWTGQFAYInzsHHCbGKY6A9yWbshmscFyjq0CFvA9u430OD5pEADo8k3sG53UJEHBtLlgJlQ%2BoFRM2&X-Amz-Signature=feec013c0cc4565fcad33f89bbcccdb416a75fb893726f85d0f2c560ffb95588&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
