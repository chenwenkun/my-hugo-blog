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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7E7HA6T%2F20250929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250929T005142Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCICUgVGzmNrtSFnbAdbdBEs6KavRF8qBzQB7OEYYt4wahAiEArD5Sqj9%2BFoNsWfNZTItuxFYZs9CcnciZ5CHQGlkQY5sqiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGm13rKhZax0BvLCWSrcA4hqbChjK0PPRMAE9fvL%2FRqb42jbnWojsjuOnfnGOEhGRSY1fiCGRPjz4ByE1guT65Hlyk7yzDbd63zIoOOnefx2a1uVakRY0crCL0LQdn1BpfuRpO5OaNBi17%2FiOmaG5EXh71K9OlyinalFBgPhezCescIYn2W%2BkKVvbJQDYN3pj4zv7xub%2F83tYiesiTKK041vFi%2B5JRdeNgvX7W%2BBv0RBDfwNXbc3HKA%2F1vGiweJA%2FKMo6liup9MEM7Xx4LS7%2FemJyuRQqDaUzl7g%2BImRZOHRR4bXaxyzlfXeDMDelMYYRE0SGyn7NaGDx8zvaVGta6UJP1%2FureTWwBh5RD6JEBF8eCUcaE%2B72rlilbfFzuq%2BFyFJ69ZYFytiJ71vP5R32GIywTZqSqXR%2BFnsIcHgPVzbna%2B1WQ4xaqoXfYX7XDIAi%2Ba6%2FCSr9INsd98JpPIkK5LNR6BB5hKPZlRTfpldZuiftR5QeNIXpoDohEEj80UVsPeCqNmZsVm7yWOaCcavvgxGbqnQ4kYX7NgODNKNywqJuYgyIX%2BejsoaNfAZ5lWVwE6wZ6KlI0OIu3kZhbCM83yOyrWGFOXKSKvVgUiU0uQnA8aald0k6WmCEq9WPpryhyq87pAl3g7frkOFMOKY58YGOqUBdt8hQIntvdlBTDCQFxeQGyit7GBfWvh%2FJTY7wFdB0ttEn0z1guc4nGGfLzTw8X%2BnEAcRFyLcANuhR22zjBVNb4yeHKRZA7Go2vUp3JTdUSVXIKtH%2BXTQsFFHz6yybUWhUsFOdUt%2Bpk%2Fvz8qY7UcnnhGKC6vWuzZdglK%2FLujI9PDN0vOx2YqhQcKjj%2BKH7Muk6lHNgkCWpFeekYGPQYfKGfWLWjMm&X-Amz-Signature=63b430a1db2fd346f1bf50879a512b54c18317d6bbe9662c22ece7a416e9d2d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7E7HA6T%2F20250929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250929T005142Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCICUgVGzmNrtSFnbAdbdBEs6KavRF8qBzQB7OEYYt4wahAiEArD5Sqj9%2BFoNsWfNZTItuxFYZs9CcnciZ5CHQGlkQY5sqiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGm13rKhZax0BvLCWSrcA4hqbChjK0PPRMAE9fvL%2FRqb42jbnWojsjuOnfnGOEhGRSY1fiCGRPjz4ByE1guT65Hlyk7yzDbd63zIoOOnefx2a1uVakRY0crCL0LQdn1BpfuRpO5OaNBi17%2FiOmaG5EXh71K9OlyinalFBgPhezCescIYn2W%2BkKVvbJQDYN3pj4zv7xub%2F83tYiesiTKK041vFi%2B5JRdeNgvX7W%2BBv0RBDfwNXbc3HKA%2F1vGiweJA%2FKMo6liup9MEM7Xx4LS7%2FemJyuRQqDaUzl7g%2BImRZOHRR4bXaxyzlfXeDMDelMYYRE0SGyn7NaGDx8zvaVGta6UJP1%2FureTWwBh5RD6JEBF8eCUcaE%2B72rlilbfFzuq%2BFyFJ69ZYFytiJ71vP5R32GIywTZqSqXR%2BFnsIcHgPVzbna%2B1WQ4xaqoXfYX7XDIAi%2Ba6%2FCSr9INsd98JpPIkK5LNR6BB5hKPZlRTfpldZuiftR5QeNIXpoDohEEj80UVsPeCqNmZsVm7yWOaCcavvgxGbqnQ4kYX7NgODNKNywqJuYgyIX%2BejsoaNfAZ5lWVwE6wZ6KlI0OIu3kZhbCM83yOyrWGFOXKSKvVgUiU0uQnA8aald0k6WmCEq9WPpryhyq87pAl3g7frkOFMOKY58YGOqUBdt8hQIntvdlBTDCQFxeQGyit7GBfWvh%2FJTY7wFdB0ttEn0z1guc4nGGfLzTw8X%2BnEAcRFyLcANuhR22zjBVNb4yeHKRZA7Go2vUp3JTdUSVXIKtH%2BXTQsFFHz6yybUWhUsFOdUt%2Bpk%2Fvz8qY7UcnnhGKC6vWuzZdglK%2FLujI9PDN0vOx2YqhQcKjj%2BKH7Muk6lHNgkCWpFeekYGPQYfKGfWLWjMm&X-Amz-Signature=422528b8afad37fc0cc270f5c10b9e4032fbe37881a0561741b4b5fe008916bd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
