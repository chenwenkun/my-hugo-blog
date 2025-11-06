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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R72CTIG2%2F20251106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251106T122150Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCyf%2B3%2BE6SM7Axjt8RyOg5D3O9lAASmo3BOOoTmDuY5bAIhAP9%2B7SbdinSgof4c3aFTYWh%2FWfgFpGnjAgFvs6O1FBjCKogECKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzEw7sg%2B2VC5Jade7sq3ANWfnpQwzXZaAHDhGjNdyJeeFg77ddyrtxQT1a6G0x2sgfNUx8yksMZhqLqFdMbAdVvGEADXSA8PWwpgWJNNwsMOuKH7rasFWpIryigFrinnRJWqR8Nj7kAi5xp4vZ72ZGA4N2ASqZU%2BQm55Sw1OhdcX85%2FuWhEVxAyCM%2FQ3h2WD7A7qHURpEYE5EjHkbSmUfg2o9r6xzJQm%2BesaMCkgUQJx6th9BfpeCeTQQzmqvnDg8ESiM0B9j4ifGBxYMy9Tj%2FXzB8xfZwrDiqBAuPTie97yzYVecOthL7LVLUu1%2BQFooFTGqEtHRIBzEn7S%2FgU8%2B7ZDY6JY8kg5aUSGSsL9tlaxsdqXmGmVf5eVOWw8xXb78Xa9m6CwF71Huopf%2BaGHmOk0lzuJHD4to3dXP7wfATLe0xPfNuK4jMuEK0q9zb1qXQ%2BRPPQ9%2B2YqxrdemmhUnJg6S9BnQNJ9QM1n1wpBneM6fSN8C8SSmKJ5KqOaJlNnpFH9aDgPb4agFtRe7II9xbjW%2FDRvTP0eSKAnBnfSMLlpMni6BYEvZEvw7ePzYtqJcO0yg5o%2FGX3r6tivJg0fMYkbh%2F79WIoilcaYPyEKvQqVkMUwgsKm0FXaWpurt1QSpCzMN%2F%2F7Ns97nWaBTDmmrLIBjqkAYCsTN%2B1PQq47nhNAqedWXGirjaAhtGGxFWUOm1eZNL11C9ls641aEOYKmAlkOPts6y6%2FkfpYO%2BO4xI55YfRTDV4QF2vN3driXI1kHeVekoXOo5A8Rny8nAJhqqYlwiLgvI0uc8MkrKVTTw%2BoXKhJK7JzRLqaoO2ibJ3Q18ok6Am0b1NHnvtUnG78qMBAqSnDLz74TUKoQmIiKWSGvPAkcHlGARB&X-Amz-Signature=71cb5cff92924a48616859bc30f37fd4f81e1886692bb3d00353a2fc9ec881bf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R72CTIG2%2F20251106%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251106T122150Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCyf%2B3%2BE6SM7Axjt8RyOg5D3O9lAASmo3BOOoTmDuY5bAIhAP9%2B7SbdinSgof4c3aFTYWh%2FWfgFpGnjAgFvs6O1FBjCKogECKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzEw7sg%2B2VC5Jade7sq3ANWfnpQwzXZaAHDhGjNdyJeeFg77ddyrtxQT1a6G0x2sgfNUx8yksMZhqLqFdMbAdVvGEADXSA8PWwpgWJNNwsMOuKH7rasFWpIryigFrinnRJWqR8Nj7kAi5xp4vZ72ZGA4N2ASqZU%2BQm55Sw1OhdcX85%2FuWhEVxAyCM%2FQ3h2WD7A7qHURpEYE5EjHkbSmUfg2o9r6xzJQm%2BesaMCkgUQJx6th9BfpeCeTQQzmqvnDg8ESiM0B9j4ifGBxYMy9Tj%2FXzB8xfZwrDiqBAuPTie97yzYVecOthL7LVLUu1%2BQFooFTGqEtHRIBzEn7S%2FgU8%2B7ZDY6JY8kg5aUSGSsL9tlaxsdqXmGmVf5eVOWw8xXb78Xa9m6CwF71Huopf%2BaGHmOk0lzuJHD4to3dXP7wfATLe0xPfNuK4jMuEK0q9zb1qXQ%2BRPPQ9%2B2YqxrdemmhUnJg6S9BnQNJ9QM1n1wpBneM6fSN8C8SSmKJ5KqOaJlNnpFH9aDgPb4agFtRe7II9xbjW%2FDRvTP0eSKAnBnfSMLlpMni6BYEvZEvw7ePzYtqJcO0yg5o%2FGX3r6tivJg0fMYkbh%2F79WIoilcaYPyEKvQqVkMUwgsKm0FXaWpurt1QSpCzMN%2F%2F7Ns97nWaBTDmmrLIBjqkAYCsTN%2B1PQq47nhNAqedWXGirjaAhtGGxFWUOm1eZNL11C9ls641aEOYKmAlkOPts6y6%2FkfpYO%2BO4xI55YfRTDV4QF2vN3driXI1kHeVekoXOo5A8Rny8nAJhqqYlwiLgvI0uc8MkrKVTTw%2BoXKhJK7JzRLqaoO2ibJ3Q18ok6Am0b1NHnvtUnG78qMBAqSnDLz74TUKoQmIiKWSGvPAkcHlGARB&X-Amz-Signature=b6c30c3e607c3df2d9cd6a756a0973b8e7c64e551ae1224e8d1eac2c9266f33e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
