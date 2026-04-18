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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WXRYN5H%2F20260418%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260418T012005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJGMEQCIBkRjRlooTomBCmmm5T0ylDfhBqMjUlQSDL%2BFPVoRlMSAiB%2FyiQNjBuR%2BrsI2U047d3HaTq4zDABcb5UbiSR%2B4KyTiqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMHkgQoOX3Rr7jtsXKKtwDW4pXNfrf9IGqFHAeoODVIGqr8EteP4k5%2Bft5PqYo617i9I7i84Q7mKsI%2F1bYcB0rNJQrCjnCpY3UVp90ba6b0fOv14elZ%2FhaxsjgXp6AbRyi3h3io%2BINW46FokJZ8ORzzPA8GfdsqeV%2BFIKred14JeY17ORQrt0RrILbK6EL23pei%2Bb4kwM18SqlPLY2MH9c%2B1jXHhjiPkgcnIWZ3za9Xv9zwbWg4HGHYERZZo7%2BfGzER75crbizRtoi7bfwjq0%2FyIqLrL6gTh8%2BwHGjVqIYYWmGNzPk6h%2BCOc%2BlQerqp3PR95AUDSdFBN6oAYogNDfIA%2FWSx50P%2FWbzxe0dXevnUqRVQZktTluhKqQBNOWBN%2B9j9FAoMh5KOS2KLwwciK6niTyMyYI7lAyt6uT3sAhlFxOChw%2FAtWbSn3Sd%2Bx1nLpk2iXfSiRZN4BWlZO6TruKAZXZ%2Frleuj6YWRO7upmVHE7Fc4foAc9hkEu%2BH9fTN8Fp4dtTPsaDLZLJs9F%2B07Ekho3ogLJ0fuD0%2BN33qXXAml3pZthjqgoNrKIoS84Orod6rXGpnaY7vv7S1vakWI23SdYnuEv7Sj9V57lwO18wXzhMgwSM5dZNd2VSP5ksJ5VvWz9os9hfSaEZRoA0wlK%2BLzwY6pgE60IJDuo5Llkmg9j1060Jx0a4KnipZKRcZr7tLr%2BsVkppCARZ5jvjWzTBViPiP9P8W2HjUDvxNDO43lbR1a0xuzGeuTk7t2QXKjn5MDpEASQRdFFBwUkYc2%2Bl%2BROTkQCa2mXfqmelHvPX2mUGuey6oaerutNY%2FXCQPmiGj02S5MJiyymYshGu%2FnOL%2BKJ474Qt1ArHxCNc5tki3DAkBZUSIJjxrlLb0&X-Amz-Signature=d7014b895a292eace7a5e38f08000800dc0f20cd5d3bbea8b0063248327c4f7b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662WXRYN5H%2F20260418%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260418T012005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLXdlc3QtMiJGMEQCIBkRjRlooTomBCmmm5T0ylDfhBqMjUlQSDL%2BFPVoRlMSAiB%2FyiQNjBuR%2BrsI2U047d3HaTq4zDABcb5UbiSR%2B4KyTiqIBAji%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMHkgQoOX3Rr7jtsXKKtwDW4pXNfrf9IGqFHAeoODVIGqr8EteP4k5%2Bft5PqYo617i9I7i84Q7mKsI%2F1bYcB0rNJQrCjnCpY3UVp90ba6b0fOv14elZ%2FhaxsjgXp6AbRyi3h3io%2BINW46FokJZ8ORzzPA8GfdsqeV%2BFIKred14JeY17ORQrt0RrILbK6EL23pei%2Bb4kwM18SqlPLY2MH9c%2B1jXHhjiPkgcnIWZ3za9Xv9zwbWg4HGHYERZZo7%2BfGzER75crbizRtoi7bfwjq0%2FyIqLrL6gTh8%2BwHGjVqIYYWmGNzPk6h%2BCOc%2BlQerqp3PR95AUDSdFBN6oAYogNDfIA%2FWSx50P%2FWbzxe0dXevnUqRVQZktTluhKqQBNOWBN%2B9j9FAoMh5KOS2KLwwciK6niTyMyYI7lAyt6uT3sAhlFxOChw%2FAtWbSn3Sd%2Bx1nLpk2iXfSiRZN4BWlZO6TruKAZXZ%2Frleuj6YWRO7upmVHE7Fc4foAc9hkEu%2BH9fTN8Fp4dtTPsaDLZLJs9F%2B07Ekho3ogLJ0fuD0%2BN33qXXAml3pZthjqgoNrKIoS84Orod6rXGpnaY7vv7S1vakWI23SdYnuEv7Sj9V57lwO18wXzhMgwSM5dZNd2VSP5ksJ5VvWz9os9hfSaEZRoA0wlK%2BLzwY6pgE60IJDuo5Llkmg9j1060Jx0a4KnipZKRcZr7tLr%2BsVkppCARZ5jvjWzTBViPiP9P8W2HjUDvxNDO43lbR1a0xuzGeuTk7t2QXKjn5MDpEASQRdFFBwUkYc2%2Bl%2BROTkQCa2mXfqmelHvPX2mUGuey6oaerutNY%2FXCQPmiGj02S5MJiyymYshGu%2FnOL%2BKJ474Qt1ArHxCNc5tki3DAkBZUSIJjxrlLb0&X-Amz-Signature=79282f4cd5affd14b035c9ea041108e223ee86adb10951d05d0da3b39425cb1e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
