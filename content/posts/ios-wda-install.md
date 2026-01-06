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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V7HANVI7%2F20260106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260106T181800Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICqEKvqYsSA0hj1d9GF3YYGnQWP7TOMjUnOJioAWoVwpAiAEiCXWRcsG7PR6rOQyP%2BuhKThnqBGz3zscvnLBfnkNICr%2FAwhjEAAaDDYzNzQyMzE4MzgwNSIMsZ2X8rwByho9WQTcKtwD7GbRis%2Fv0UrgzScyZKfaEAwxDiMMS7qzIxkaduXM0Y9tZWyS%2FXX62UpjlqWrYaYN2Qfpj4R3xvxmtu7oA24GYRDuuki%2FwOhXoK5FLG6IzVxFZ3eZrpE0x7Woyhhmn0zHqs1qZQjjTGUJzi%2BUrgEOYWlm9EgOyRFhMBAlpt7cqElHcKGrYrb1xJfHYvn07f7RCs1PGjs0%2Fl%2B686kd8pB0AUaIDdYObTGH%2BoAT508nwlFPU9wN09%2BSsjb8Cap0BvIUF7JiHgBNoNPuTNUN1R9uB%2B%2BRU8gyKzXslyzlkiHT2rmYvosw39twd7AR6owyUKORKORFEpYB3g0BOJg9r%2FcCEl1Zkoo1ekwYPokYUfuW03fOzyyc2Xb3qcgPXXUEjckbxDl0omDq53gBr4e3naZfEDe6AymPSH%2BJAhWaK2NhbyQhRbXTU09ibZRWprFNxunIJbEeDw1WIEIsqyXw5tqNUJDJrY%2BO5t5g4%2B7wdXYkf1rBNGnrzBkUDHrxhKit5LE%2BUfpPVwtKvAfz7ltA%2FOWaGOhDSiunn1VSv23xCZDeb3a4Nio6mKmmzPEEIkGKcbuvTRgXKizYhq%2FFYZdMe8ZM699%2BxyrEHSInwrCztsIT%2BabZgA72iMlkz8B32vEww6L1ygY6pgEVgBvqQ5Ws0RixbAOM9Qwx1haVXsiDwG9Rtr6qcOvNWSK2HYSOy%2FYkhti01Mg5iQ7HLVZAmxEPeDvCxHMmnhAd9CLO517OBRs7RMJb3ZbxMAReZWwjOU%2BRUKcT6HWh6dmTbcVQ%2BRnom5kfQjWfw8kRiNgOtmPXbKeoB%2FUabwUnxk8vP2R1O3yfq3AzLrBYa3yqulZu21tgCgK8kRkSRvHqTEPmykRK&X-Amz-Signature=4920b7984a449e797848cfc36928ef5e2b02dae28ffb6df41f5fda03f8d0dbde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V7HANVI7%2F20260106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260106T181800Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICqEKvqYsSA0hj1d9GF3YYGnQWP7TOMjUnOJioAWoVwpAiAEiCXWRcsG7PR6rOQyP%2BuhKThnqBGz3zscvnLBfnkNICr%2FAwhjEAAaDDYzNzQyMzE4MzgwNSIMsZ2X8rwByho9WQTcKtwD7GbRis%2Fv0UrgzScyZKfaEAwxDiMMS7qzIxkaduXM0Y9tZWyS%2FXX62UpjlqWrYaYN2Qfpj4R3xvxmtu7oA24GYRDuuki%2FwOhXoK5FLG6IzVxFZ3eZrpE0x7Woyhhmn0zHqs1qZQjjTGUJzi%2BUrgEOYWlm9EgOyRFhMBAlpt7cqElHcKGrYrb1xJfHYvn07f7RCs1PGjs0%2Fl%2B686kd8pB0AUaIDdYObTGH%2BoAT508nwlFPU9wN09%2BSsjb8Cap0BvIUF7JiHgBNoNPuTNUN1R9uB%2B%2BRU8gyKzXslyzlkiHT2rmYvosw39twd7AR6owyUKORKORFEpYB3g0BOJg9r%2FcCEl1Zkoo1ekwYPokYUfuW03fOzyyc2Xb3qcgPXXUEjckbxDl0omDq53gBr4e3naZfEDe6AymPSH%2BJAhWaK2NhbyQhRbXTU09ibZRWprFNxunIJbEeDw1WIEIsqyXw5tqNUJDJrY%2BO5t5g4%2B7wdXYkf1rBNGnrzBkUDHrxhKit5LE%2BUfpPVwtKvAfz7ltA%2FOWaGOhDSiunn1VSv23xCZDeb3a4Nio6mKmmzPEEIkGKcbuvTRgXKizYhq%2FFYZdMe8ZM699%2BxyrEHSInwrCztsIT%2BabZgA72iMlkz8B32vEww6L1ygY6pgEVgBvqQ5Ws0RixbAOM9Qwx1haVXsiDwG9Rtr6qcOvNWSK2HYSOy%2FYkhti01Mg5iQ7HLVZAmxEPeDvCxHMmnhAd9CLO517OBRs7RMJb3ZbxMAReZWwjOU%2BRUKcT6HWh6dmTbcVQ%2BRnom5kfQjWfw8kRiNgOtmPXbKeoB%2FUabwUnxk8vP2R1O3yfq3AzLrBYa3yqulZu21tgCgK8kRkSRvHqTEPmykRK&X-Amz-Signature=75e6ed3689299d1a289e63e1dfbc0127a09bf32cb4ffe019a67ba28e600c39a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
