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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665UONRIOY%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T012634Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCdY9XkSTyQyIcwKQYgzgG%2BlVLl0J7P5UNPYUbP9hXRAAIhAMnj6XlwhpQtEka699khq62rY7%2FNj5%2BptwFxkuDBfH37KogECIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx1eYs9vA4N8RZ1%2FT8q3AMyS6WogiKPMOxdWUDfmJGQt7aAZ0QTyA3JiNZl6%2BRD%2FTkJ68ACF9AwJk5uCf4ggBRz1RzLL0ggl4VMh97E6jzspyGbZEEMI5z54lPsMR7rKBA5AU0b7ahDgRh%2F3XL616z1fyp525RPrMI6zkjpP9gqZR78AAVKs0y2qMv%2F4j3j7S%2B%2F01it6SafKvw18P7sk%2BEXAXfEoZPr7Ud%2BWnslG8ndV%2FE%2FJ3p1ii9xXwtSONdC8eWwManII9851UOosZWQ%2F93mMZpAuLLofnWceaFUCWuY%2Fjk3S7srtauMg%2F%2FGvHcXQGDDFYLW2vU64P6qyOdztsK38HjrIvWFrmemKN1B1el26tX%2FXbDTJZKrVCtoisYFuMVbgE0tlvFERnyrcjk3mO%2BaJsVcZqemXDTFJGYPFxhAq3UHNx%2BZz3Y6%2BQXRyISTc2v57o4nFzeUPVp0q488SyIPyuKdq6NKavHD6SZ14seTEVoiE2Y6fFt5MpThvDjnWSDGXCW%2B27fhQU70zYzA5SKWzyKnoY%2FrMBo9zebRe2IG0zHQw%2Fxx4O%2F89IBzzIhojn6kaPWU9DXBELrGyHdgSOa063M4ANddPfvHT7msmLCNHWqbx4%2FWNWIiq%2BoY2r9I1GwGS3Zf9xQQ%2F2kXljDZl%2FbOBjqkAae5Je8wG1303Dm1%2BuZGhQ%2B8kTxt%2BCJioTkbpoLIx7540uyYPR8jC9fOPTYLy7W3e3GNtB%2BXp7QFgFWtZSqhdn0ej7VYnFxa4U6e6U7KZsUM6unE4amcqUgxwj%2FzxWgznPgnV7ZEZC6MvB%2BWtOTMRNFORv2%2FA2Q5PmdpkTDa%2BPMPDwP6wiFsBI3VGER5U7lPPeBS23jlQPblSxY%2B6kdLl7EYfc0p&X-Amz-Signature=c337ea4222c2f59aa9733119fbd8a2f594ee95810fa43191179fac9ebc1bb05f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665UONRIOY%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T012634Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCdY9XkSTyQyIcwKQYgzgG%2BlVLl0J7P5UNPYUbP9hXRAAIhAMnj6XlwhpQtEka699khq62rY7%2FNj5%2BptwFxkuDBfH37KogECIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx1eYs9vA4N8RZ1%2FT8q3AMyS6WogiKPMOxdWUDfmJGQt7aAZ0QTyA3JiNZl6%2BRD%2FTkJ68ACF9AwJk5uCf4ggBRz1RzLL0ggl4VMh97E6jzspyGbZEEMI5z54lPsMR7rKBA5AU0b7ahDgRh%2F3XL616z1fyp525RPrMI6zkjpP9gqZR78AAVKs0y2qMv%2F4j3j7S%2B%2F01it6SafKvw18P7sk%2BEXAXfEoZPr7Ud%2BWnslG8ndV%2FE%2FJ3p1ii9xXwtSONdC8eWwManII9851UOosZWQ%2F93mMZpAuLLofnWceaFUCWuY%2Fjk3S7srtauMg%2F%2FGvHcXQGDDFYLW2vU64P6qyOdztsK38HjrIvWFrmemKN1B1el26tX%2FXbDTJZKrVCtoisYFuMVbgE0tlvFERnyrcjk3mO%2BaJsVcZqemXDTFJGYPFxhAq3UHNx%2BZz3Y6%2BQXRyISTc2v57o4nFzeUPVp0q488SyIPyuKdq6NKavHD6SZ14seTEVoiE2Y6fFt5MpThvDjnWSDGXCW%2B27fhQU70zYzA5SKWzyKnoY%2FrMBo9zebRe2IG0zHQw%2Fxx4O%2F89IBzzIhojn6kaPWU9DXBELrGyHdgSOa063M4ANddPfvHT7msmLCNHWqbx4%2FWNWIiq%2BoY2r9I1GwGS3Zf9xQQ%2F2kXljDZl%2FbOBjqkAae5Je8wG1303Dm1%2BuZGhQ%2B8kTxt%2BCJioTkbpoLIx7540uyYPR8jC9fOPTYLy7W3e3GNtB%2BXp7QFgFWtZSqhdn0ej7VYnFxa4U6e6U7KZsUM6unE4amcqUgxwj%2FzxWgznPgnV7ZEZC6MvB%2BWtOTMRNFORv2%2FA2Q5PmdpkTDa%2BPMPDwP6wiFsBI3VGER5U7lPPeBS23jlQPblSxY%2B6kdLl7EYfc0p&X-Amz-Signature=fe30b4c2f3e1b78f7baa8d691375a9f944bedbc6a071a228dab5e9617fea7945&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
