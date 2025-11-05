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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UBXRPMXA%2F20251105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251105T181603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD8F8bfgnKD3ZyutwBBsG74jgRoNnKZ4o2ImO3t6PSC9wIhAK5skhvw286yRUTzFanuKo01tzec64Ucb22lO4XMWhZfKogECI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igwe8qMi8brUNvvctDMq3AN230aRLjYMmZ06XrNEE2zX8TdM2JeLVe2GyuirNdOEF5lgwxPd6Wy9rhH8UbZABvjO2vPJDjlod8ygMnTVoKRGsi38cPaWJ4R9uXvTx6Hok0%2FYYr6zzCA2Zlw0XqSHOaW%2BGFW%2F2QhMv8tlCyc3TQ89Kcw6oyh1oxfyU9AL3O99pqKlj7%2F1l8nUZAI4laSa6p%2F2JwN0t9SdhZumfl8yOEUeRPZk7ll%2F8D7%2Fb%2FYfcrCHCskfyH8dtZPlYjyVRhM5fiawKSp7pMc2Xf%2BzlXXv28ICVSvLyG9FigpP3iJ59Wx3ysw0ct9uuCtL6xxS4ZCV8t4TYaSLGrLbALRMM7rfEB58Vh1ahgFYcX8KYJq6ERW9Srd3lIMz02FmO6oeWxcea3b0pyw%2Fh5RaG9G3ICSFucXEnPhi0OdzP2tRDEC%2FiAPjAev3RISJn70ZfNpFXajb68tZ08PmRYoYSEELBzHZginuT7G7WEpb3OKyb5rcPwDKKvCUAS0j%2BCTDO4ZUWqU%2F94oR06gdFZFZ5bQzCqtzmlGaQHnJNrB1D7FpP2XeG7Wk3oD1%2FWObB%2BJ%2BRXmsdLjhQF%2FMnOkhiW65HmtK%2BV10jWRjizV%2BNEOjbJmdRCUJm4VNUYCM705quT5boKRSUDCRra3IBjqkATI9nDEnSi%2BIkIfhUctDH82lUGGtsQ%2FynBe2jHwSAo%2FC%2F7Jgl6OmKbsWNTLk2raGIrKhbMQOVDOtDN2lzX2ejVldzeMWrbVZVdk4m5k7v4RZ8L290wB0%2BOeOgNAxBDiNUKYFamb95mCuCQOZbBc%2FIXSNV2Ht8IYrgo5N0kx0Y4j4kFQOyPAcJikPwnrfh2hYB2zAgQ07YsLW6937lFixOy2h9wAu&X-Amz-Signature=6e28fea21b61fa878bbaa50ad46eb29c3fa13cfa7adad048fc2afc1cc008af73&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UBXRPMXA%2F20251105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251105T181603Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD8F8bfgnKD3ZyutwBBsG74jgRoNnKZ4o2ImO3t6PSC9wIhAK5skhvw286yRUTzFanuKo01tzec64Ucb22lO4XMWhZfKogECI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igwe8qMi8brUNvvctDMq3AN230aRLjYMmZ06XrNEE2zX8TdM2JeLVe2GyuirNdOEF5lgwxPd6Wy9rhH8UbZABvjO2vPJDjlod8ygMnTVoKRGsi38cPaWJ4R9uXvTx6Hok0%2FYYr6zzCA2Zlw0XqSHOaW%2BGFW%2F2QhMv8tlCyc3TQ89Kcw6oyh1oxfyU9AL3O99pqKlj7%2F1l8nUZAI4laSa6p%2F2JwN0t9SdhZumfl8yOEUeRPZk7ll%2F8D7%2Fb%2FYfcrCHCskfyH8dtZPlYjyVRhM5fiawKSp7pMc2Xf%2BzlXXv28ICVSvLyG9FigpP3iJ59Wx3ysw0ct9uuCtL6xxS4ZCV8t4TYaSLGrLbALRMM7rfEB58Vh1ahgFYcX8KYJq6ERW9Srd3lIMz02FmO6oeWxcea3b0pyw%2Fh5RaG9G3ICSFucXEnPhi0OdzP2tRDEC%2FiAPjAev3RISJn70ZfNpFXajb68tZ08PmRYoYSEELBzHZginuT7G7WEpb3OKyb5rcPwDKKvCUAS0j%2BCTDO4ZUWqU%2F94oR06gdFZFZ5bQzCqtzmlGaQHnJNrB1D7FpP2XeG7Wk3oD1%2FWObB%2BJ%2BRXmsdLjhQF%2FMnOkhiW65HmtK%2BV10jWRjizV%2BNEOjbJmdRCUJm4VNUYCM705quT5boKRSUDCRra3IBjqkATI9nDEnSi%2BIkIfhUctDH82lUGGtsQ%2FynBe2jHwSAo%2FC%2F7Jgl6OmKbsWNTLk2raGIrKhbMQOVDOtDN2lzX2ejVldzeMWrbVZVdk4m5k7v4RZ8L290wB0%2BOeOgNAxBDiNUKYFamb95mCuCQOZbBc%2FIXSNV2Ht8IYrgo5N0kx0Y4j4kFQOyPAcJikPwnrfh2hYB2zAgQ07YsLW6937lFixOy2h9wAu&X-Amz-Signature=2ee1c3dc1e40064a7c17733244dc1ea14dfb06b21318cd0a0a35a9f6aad4e1b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
