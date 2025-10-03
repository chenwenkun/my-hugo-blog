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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YAVDVXX%2F20251003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251003T181457Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCnckYpYBgIe91mWcs0VimtYl55ralpbEw5HlQY9OU0RgIhAKsR8vhPes5sTYp5fTFzP%2BsAocrcjpDlc5T7Xpg%2BzXlyKv8DCEsQABoMNjM3NDIzMTgzODA1Igw70Y9tihd6TPrx7wkq3APYhxuJ9AsVbIb%2BcZjeIRLMRp1ctdaNY7ywBDsrW7FRc2UtInUvqt0SqUj1qMCQMPonG4HpJSlX2vzJiazcPAoyamfOxt2u5Jz9Mfy%2B9GljP%2FInSybnm2l8MH631cV8FkPqPHuNJbtGco56nZhQo%2FwyIbh2R4j3L0gBsBMlaLdCxghkLgwsjJBqJhGbmqnkSWCI3BgBwnMdUzWUM3ChLqPQou7bwWTGSH0S2%2BM7D6yhwFayvFkH7Nr8MiW0%2B%2F6sUJb%2Fxw0m6g3JJqISoofadjQb2%2FwoCkNrYkAzeI%2FJPS6d8SdrbpSDczW%2Bk%2FenZepl8z3X8GuWEYqWYK9qNm5YyfaBhPme4ukN9x46BNmyMaSIyWChZ2jFF7X7WTvH7Q5dKxGU9VoS%2FmanveBpisYluxq4dMe%2FGHGPF8sU33%2BaRw1LgabZdHN5y6XjRw%2BoyQ5qC%2F5upZcvuzAEuLLLwwl3Cgc5BU6VNnLquAGpFiakLQC%2Ftfw6vul4kbjGgBUvjDbMySNzhnMJebx%2FUIq1AHZcIvBqQQdfBR8LHCkywJrRnUMc58rxUxPcPlI749rooN8%2FlIrxqC5ZSxQ0W%2BprVh29u2QIXW78%2FrKGg5hr3mXmVTiJDqdRlfZ9fe1w0weMQDCfj4DHBjqkARH7S%2Fa2eqlGyi3knA9bdbN3U5LDAUudTI4vzBgPffe%2Bb8fG8nUIUU%2FWvHa3S%2BAKPuX7sieJe69%2BBqZ8FxRrBm%2FVIGY%2BTXy8Da8lR0kt85m%2B8yfGOQxbfMPxiMl%2B1ZREdhWjDAin3tbGO9tnealYqpo%2FOTBq1nPzsAkvFxLClEwVwLa6DJiWBjVrYpbhSPEJ5L7v9jYFMRbWS0Eevz58WqPtNPch&X-Amz-Signature=368f06b6f0906f95be3ed7157246b6399445f442fda862cc152fe31f8aa91e85&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662YAVDVXX%2F20251003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251003T181457Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCnckYpYBgIe91mWcs0VimtYl55ralpbEw5HlQY9OU0RgIhAKsR8vhPes5sTYp5fTFzP%2BsAocrcjpDlc5T7Xpg%2BzXlyKv8DCEsQABoMNjM3NDIzMTgzODA1Igw70Y9tihd6TPrx7wkq3APYhxuJ9AsVbIb%2BcZjeIRLMRp1ctdaNY7ywBDsrW7FRc2UtInUvqt0SqUj1qMCQMPonG4HpJSlX2vzJiazcPAoyamfOxt2u5Jz9Mfy%2B9GljP%2FInSybnm2l8MH631cV8FkPqPHuNJbtGco56nZhQo%2FwyIbh2R4j3L0gBsBMlaLdCxghkLgwsjJBqJhGbmqnkSWCI3BgBwnMdUzWUM3ChLqPQou7bwWTGSH0S2%2BM7D6yhwFayvFkH7Nr8MiW0%2B%2F6sUJb%2Fxw0m6g3JJqISoofadjQb2%2FwoCkNrYkAzeI%2FJPS6d8SdrbpSDczW%2Bk%2FenZepl8z3X8GuWEYqWYK9qNm5YyfaBhPme4ukN9x46BNmyMaSIyWChZ2jFF7X7WTvH7Q5dKxGU9VoS%2FmanveBpisYluxq4dMe%2FGHGPF8sU33%2BaRw1LgabZdHN5y6XjRw%2BoyQ5qC%2F5upZcvuzAEuLLLwwl3Cgc5BU6VNnLquAGpFiakLQC%2Ftfw6vul4kbjGgBUvjDbMySNzhnMJebx%2FUIq1AHZcIvBqQQdfBR8LHCkywJrRnUMc58rxUxPcPlI749rooN8%2FlIrxqC5ZSxQ0W%2BprVh29u2QIXW78%2FrKGg5hr3mXmVTiJDqdRlfZ9fe1w0weMQDCfj4DHBjqkARH7S%2Fa2eqlGyi3knA9bdbN3U5LDAUudTI4vzBgPffe%2Bb8fG8nUIUU%2FWvHa3S%2BAKPuX7sieJe69%2BBqZ8FxRrBm%2FVIGY%2BTXy8Da8lR0kt85m%2B8yfGOQxbfMPxiMl%2B1ZREdhWjDAin3tbGO9tnealYqpo%2FOTBq1nPzsAkvFxLClEwVwLa6DJiWBjVrYpbhSPEJ5L7v9jYFMRbWS0Eevz58WqPtNPch&X-Amz-Signature=13b8fc48b6fda007a48a0b2fd28f57871fb73f222b2ce49f5bf4a2e9d68baa92&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
