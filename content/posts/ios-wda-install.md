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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665QQOF3NU%2F20251128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251128T122220Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEHcLxxhlNu6GWMT54RFUa7wtrAXNO%2FesCoJvU2ZgKE1AiEAm%2BWEV294dmCt%2Bultl4HrUi31lRM9dZ9hILZdiFJHwi0qiAQItP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFHBvgwDlzKBy7D3TircA%2B%2Fw%2BCfzE0Ix7ngi02zzkxHSS5AxjPfi%2FGX53ameUlWpkqXPTHnl5UG4uaIPr%2FOOdYToKIaYyZHuKRD5Rtz%2FtoIq5GGqR525VNY3xFVqU5AfTsEDRxIBypwOmcz9WFM2BUbl7EgrRLyeLo1sD%2FJQHHISF%2FJVKaVso09QXjFUlTWCZQrzvC2OCXsjB7fOZBnBkIaOG4v0sfVN1wnoL2bvlt%2F%2FV8IogHxTtjv7t%2FMW7PIRNTWEmlpfPJR8R0mDXh73lK8oafFN3QnDVlpwX5N2qNykfAYXV%2BZ6uOlwsphtesrxhBiQlZqJFXOCASeZGnJRDKXCvxOzXmM6TJopbkzaMlyXF17rTFw%2FCdJ8TiSMiv7lu1ms9zg6lK3azvk7mzda52lVl0y359fLyAWnu1B%2BFseOfaCnAnYTazwh2tjyjBibqD%2BjrTWvyMxg4RKSD5WN1N6qhFE0Nnm45BbWf9ybtDMiK1jO8s6N8e6t4hQNgBiLPqItmeuUT6L6PfLGG3592QinQaur7Sn%2BCqvVAidMGibvCz6mpNiu6Ek5QeF8wfLualLmPwhd0aC6t0Bqf%2F6xLNp8I72%2BVxtcXcPryKgbk8YYg04u2bMrMrkS8N0DKsANv8p7DdxV3NOGvqGkMILypckGOqUBPT6mbeslX9uhndgM4rvl2pQ7cLDeM%2BhDKFIC4Z6DVHhfF7UKkA5JGZYTxhLt%2FtgkLnZ7prLaFXCQAO5%2F2XFm5IF6TrHuzqibTJ5QFeOGhnoLAsM9%2FA6prS1AVwh33%2BNApetZzitGXMk8eKRrMLx5yAkDivnGGFFml%2FC3LDlDdhW3uauq6DnO8QaZO8NWxkoaLavy1uAIa4VYJBy2pMibzYoqL7Xi&X-Amz-Signature=b21578229de66f378a1bef84306fba60e98849c8934ff51495dddbf43bacf756&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665QQOF3NU%2F20251128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251128T122220Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEHcLxxhlNu6GWMT54RFUa7wtrAXNO%2FesCoJvU2ZgKE1AiEAm%2BWEV294dmCt%2Bultl4HrUi31lRM9dZ9hILZdiFJHwi0qiAQItP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFHBvgwDlzKBy7D3TircA%2B%2Fw%2BCfzE0Ix7ngi02zzkxHSS5AxjPfi%2FGX53ameUlWpkqXPTHnl5UG4uaIPr%2FOOdYToKIaYyZHuKRD5Rtz%2FtoIq5GGqR525VNY3xFVqU5AfTsEDRxIBypwOmcz9WFM2BUbl7EgrRLyeLo1sD%2FJQHHISF%2FJVKaVso09QXjFUlTWCZQrzvC2OCXsjB7fOZBnBkIaOG4v0sfVN1wnoL2bvlt%2F%2FV8IogHxTtjv7t%2FMW7PIRNTWEmlpfPJR8R0mDXh73lK8oafFN3QnDVlpwX5N2qNykfAYXV%2BZ6uOlwsphtesrxhBiQlZqJFXOCASeZGnJRDKXCvxOzXmM6TJopbkzaMlyXF17rTFw%2FCdJ8TiSMiv7lu1ms9zg6lK3azvk7mzda52lVl0y359fLyAWnu1B%2BFseOfaCnAnYTazwh2tjyjBibqD%2BjrTWvyMxg4RKSD5WN1N6qhFE0Nnm45BbWf9ybtDMiK1jO8s6N8e6t4hQNgBiLPqItmeuUT6L6PfLGG3592QinQaur7Sn%2BCqvVAidMGibvCz6mpNiu6Ek5QeF8wfLualLmPwhd0aC6t0Bqf%2F6xLNp8I72%2BVxtcXcPryKgbk8YYg04u2bMrMrkS8N0DKsANv8p7DdxV3NOGvqGkMILypckGOqUBPT6mbeslX9uhndgM4rvl2pQ7cLDeM%2BhDKFIC4Z6DVHhfF7UKkA5JGZYTxhLt%2FtgkLnZ7prLaFXCQAO5%2F2XFm5IF6TrHuzqibTJ5QFeOGhnoLAsM9%2FA6prS1AVwh33%2BNApetZzitGXMk8eKRrMLx5yAkDivnGGFFml%2FC3LDlDdhW3uauq6DnO8QaZO8NWxkoaLavy1uAIa4VYJBy2pMibzYoqL7Xi&X-Amz-Signature=07a4d7eadb2c588d4c0e4abe84941f0f9c30a5005c566686a7ad18210f2ef8cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
