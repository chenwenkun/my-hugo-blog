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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUS2XSBV%2F20260222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260222T063445Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCDA%2BoEHs%2FUOYNJEzub0Ru2%2BFGDpwgDp8jaatonhPKJ7AIhALAKAf6gdKjvZpDqx5Q2MZyfAQPZ2bgwu3UMA0C0KvMyKogECMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwDA0pA9oa64K%2BjeBkq3AMmBGyro%2FF7uysJCkJL6n6hT9gaaZ5r5F87Lug9P4xQylJ3oxJY6tE48yKWoL9%2BDoOAtzIsPj9tmNZxfsHTV0%2B2XVxSWXt7y9rtnriMtbRQRlYQfuByy6yd%2FRBj0Z7lFYDRRbyEiP0p0lCwyJ11pi%2FuF5kNSynHkIJ18tPQx37IyhuPRLBlsE%2F3M4z3JzmbsixuW5YTbB0wuE9C0oSZiBtdNDSJvkihnmRMQlBwd%2BnkGL2v1y%2Fid356MwflZtl%2BiTJnbLBHiZOTsysDWZDyBUylpTt%2B%2FI6iPvLEldcRasdFXwZEPMtiWzPx29P7majH7eTY0%2FR468Zcucrd%2BLZKRPQI8BtNBxEGHqrrK3eLUJhCpOU4P8X4cnSB8Ai7cvZYUkrr%2Bce5yQxXwX%2F1yQaCPJL01uaePdm7%2FLwwj0lbpEA6TNRBvadkjFVNmCCOr9PUtAZ%2FevKe1JW562UxnfCNM59tibStUk8MClDV8yYwU0q5iOuLfM4BEfNQkzvDSu1ubHItKq1n%2FFOjNq88Es3R%2B73ljSqD8Ippm3JojWcIJ1amalbDF9hVYtIwe5MArVm6BORIfuLeMmfb4z33KANHg%2FsSPUtJQbtXF74GtI2scATqLEA4l2PMDAHPmx3AezDlxerMBjqkAY5iep%2Fw%2BHaqB6Zt9dIMgR0s8hLqJbrY1Cp8qePqW0k1EpfHZhblahNIL4kraa8JlhfbuEoOLsflnwVZ4tvaq7i%2FU9IxtvVtvRA6xI9pZwMskaOgeKzb%2BieD%2FTXnQTH2tS7imTlbwviQAXyMLBn1Gb063HshWO2FzLxgtObBtV7lwWEjk7fs5KyamNsx5yTOcRi5BSbdy79Wp%2FetuWTYtcUL%2FxfV&X-Amz-Signature=03209b5f541da2f5cff54144528082159e5f25179b788e96ad967e227694d497&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUS2XSBV%2F20260222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260222T063445Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCDA%2BoEHs%2FUOYNJEzub0Ru2%2BFGDpwgDp8jaatonhPKJ7AIhALAKAf6gdKjvZpDqx5Q2MZyfAQPZ2bgwu3UMA0C0KvMyKogECMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwDA0pA9oa64K%2BjeBkq3AMmBGyro%2FF7uysJCkJL6n6hT9gaaZ5r5F87Lug9P4xQylJ3oxJY6tE48yKWoL9%2BDoOAtzIsPj9tmNZxfsHTV0%2B2XVxSWXt7y9rtnriMtbRQRlYQfuByy6yd%2FRBj0Z7lFYDRRbyEiP0p0lCwyJ11pi%2FuF5kNSynHkIJ18tPQx37IyhuPRLBlsE%2F3M4z3JzmbsixuW5YTbB0wuE9C0oSZiBtdNDSJvkihnmRMQlBwd%2BnkGL2v1y%2Fid356MwflZtl%2BiTJnbLBHiZOTsysDWZDyBUylpTt%2B%2FI6iPvLEldcRasdFXwZEPMtiWzPx29P7majH7eTY0%2FR468Zcucrd%2BLZKRPQI8BtNBxEGHqrrK3eLUJhCpOU4P8X4cnSB8Ai7cvZYUkrr%2Bce5yQxXwX%2F1yQaCPJL01uaePdm7%2FLwwj0lbpEA6TNRBvadkjFVNmCCOr9PUtAZ%2FevKe1JW562UxnfCNM59tibStUk8MClDV8yYwU0q5iOuLfM4BEfNQkzvDSu1ubHItKq1n%2FFOjNq88Es3R%2B73ljSqD8Ippm3JojWcIJ1amalbDF9hVYtIwe5MArVm6BORIfuLeMmfb4z33KANHg%2FsSPUtJQbtXF74GtI2scATqLEA4l2PMDAHPmx3AezDlxerMBjqkAY5iep%2Fw%2BHaqB6Zt9dIMgR0s8hLqJbrY1Cp8qePqW0k1EpfHZhblahNIL4kraa8JlhfbuEoOLsflnwVZ4tvaq7i%2FU9IxtvVtvRA6xI9pZwMskaOgeKzb%2BieD%2FTXnQTH2tS7imTlbwviQAXyMLBn1Gb063HshWO2FzLxgtObBtV7lwWEjk7fs5KyamNsx5yTOcRi5BSbdy79Wp%2FetuWTYtcUL%2FxfV&X-Amz-Signature=7b4c46475eb14927eaaecf7f3433e175e64e8d1fb46e8420f10eeb45741f55f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
