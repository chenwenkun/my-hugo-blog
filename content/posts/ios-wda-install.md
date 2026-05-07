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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664VLLJQK3%2F20260507%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260507T192438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC5LQQ7Ez2tCUx6Cjm1rKZghOApGPcuMg5uK%2FZwXFpB%2BgIhAKqWeGMKTiusMeu96GkT4TFszvyOkOPbJxZB7KkGUaZaKogECLv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyoFxwYdGNUs7zIX4Mq3AMF8YKLPM3jXt2Yd3E9Wy1tL6FZT2tbtQ%2BK2J7tIrB%2FjNCUbJG%2FqXyhzpMEahhUHH7ovpEHiFZ%2F1TpuLSn0XIq1xEikJMjBTdfpFzSTeFVoghMEsfr1nccYR6EkD8Ctc9TihzIkOtwHe9VdDAvhykEaMCFcpLkolSMCI%2F3XKHVzpqvnQNa7Y35AOvkbvndr5497%2BuQ9qfQtNkjQ9kqAftQ1RFAkuNv9z559T3YaFwlwW9FIJ8Hqn8C%2FKy5Rnn3TkwCpWq5CHLHN3ftM%2B9Xrlv5uRspvZJNInAtCyxY9Rzbzlc0lPU25%2FlIfftn1YVD9rKIEniOIgSdq06kDx8qayX8VQNLzs%2Bmu802DYcYKsdMvS1I5E4NE7%2Bfg5CgQG9UP9DvFajKyh4uNKAIc%2Bc5wGzZrTlngc3CaCQc0nMIeJXPNPRCX%2B5RNswK4h7ElLvOWGVNAnovY%2FzdLNE0B%2FMMtDkZuZ%2FAhMWTRdpeb%2FaYbYmDlbP4cOEpq42%2F9nTw0obHYqeWkucK2jDiUCisITJevOKETtbc3dXpYcD1s%2BPqd8lzCgTPTK5ikPs0KhmeNDR9I12Lo322z%2FfQmjuNisV5ndRwWrSm%2BMWlJCnTZAwLvm%2BtHffB6qyLtKcipI347PDDDrPPPBjqkAYgLMFfcRpjS76XKEh9Q%2FXVLzTm%2FFzPZWr3rBWyjqRV%2FXpK3p03%2FhYvzfXjWWch1UgoG%2Bz8RNrMil9eKyfkhAfKFAR3xNjO5dljwXLUI7FEdZsyyJm7FWWwoGh97kiS4J2kyD0e9A7nahnH4O0OJdqPORYn2j058roabEWuS8mHzX7c7pDy%2B%2FP2NFVgIK9SRQRjJuLlwgp3nKhf%2F6nf6igfot5OB&X-Amz-Signature=227dc40bd244144a3ed24933fb9f6febd83edc195f3a793acf995db2828a1776&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664VLLJQK3%2F20260507%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260507T192438Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC5LQQ7Ez2tCUx6Cjm1rKZghOApGPcuMg5uK%2FZwXFpB%2BgIhAKqWeGMKTiusMeu96GkT4TFszvyOkOPbJxZB7KkGUaZaKogECLv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyoFxwYdGNUs7zIX4Mq3AMF8YKLPM3jXt2Yd3E9Wy1tL6FZT2tbtQ%2BK2J7tIrB%2FjNCUbJG%2FqXyhzpMEahhUHH7ovpEHiFZ%2F1TpuLSn0XIq1xEikJMjBTdfpFzSTeFVoghMEsfr1nccYR6EkD8Ctc9TihzIkOtwHe9VdDAvhykEaMCFcpLkolSMCI%2F3XKHVzpqvnQNa7Y35AOvkbvndr5497%2BuQ9qfQtNkjQ9kqAftQ1RFAkuNv9z559T3YaFwlwW9FIJ8Hqn8C%2FKy5Rnn3TkwCpWq5CHLHN3ftM%2B9Xrlv5uRspvZJNInAtCyxY9Rzbzlc0lPU25%2FlIfftn1YVD9rKIEniOIgSdq06kDx8qayX8VQNLzs%2Bmu802DYcYKsdMvS1I5E4NE7%2Bfg5CgQG9UP9DvFajKyh4uNKAIc%2Bc5wGzZrTlngc3CaCQc0nMIeJXPNPRCX%2B5RNswK4h7ElLvOWGVNAnovY%2FzdLNE0B%2FMMtDkZuZ%2FAhMWTRdpeb%2FaYbYmDlbP4cOEpq42%2F9nTw0obHYqeWkucK2jDiUCisITJevOKETtbc3dXpYcD1s%2BPqd8lzCgTPTK5ikPs0KhmeNDR9I12Lo322z%2FfQmjuNisV5ndRwWrSm%2BMWlJCnTZAwLvm%2BtHffB6qyLtKcipI347PDDDrPPPBjqkAYgLMFfcRpjS76XKEh9Q%2FXVLzTm%2FFzPZWr3rBWyjqRV%2FXpK3p03%2FhYvzfXjWWch1UgoG%2Bz8RNrMil9eKyfkhAfKFAR3xNjO5dljwXLUI7FEdZsyyJm7FWWwoGh97kiS4J2kyD0e9A7nahnH4O0OJdqPORYn2j058roabEWuS8mHzX7c7pDy%2B%2FP2NFVgIK9SRQRjJuLlwgp3nKhf%2F6nf6igfot5OB&X-Amz-Signature=ac5a7654de61204741d15e5214647284aab4ffbd16a1af7ebedd505aa4252f22&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
