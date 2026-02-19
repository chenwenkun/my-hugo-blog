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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WHECU5GX%2F20260219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260219T123821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCfsWsODHAv3NrqPVgO3WbEDG7tGgIL0TbBELV%2F58y4%2BAIhALz4FhlDeclXbVn1N9vmAkH77O%2Bk5YVhE9UX1xWTEU%2FSKv8DCHwQABoMNjM3NDIzMTgzODA1Igy8sN%2BrZiyD1jipOHIq3AMax2vVx2cLo81CSMRLgIizi1vM%2FYm2iEPUc7925wQRHzR%2Bi3ICjyJ9d97sf9llZUAJ0zdZwfa3WXdcy0Fw5jxJ30BGRIYd5EWx9QAb3MG1CWIZuUySk81v%2BNG9hWD9h0mOPjQm%2BWxiKzpoV2H%2BYNqXntKtxgBzyW0LTxIXLiUu7fAoUZEkinha0KtmkcjBqSSBKbDWDrRhU8QMlusI5BCyXPtnZK9PA7GmGEr8iVj96V0odNtytpwzhrfKqCr9Ar%2BAVphE3whQHYH8rARZLPOpug4dtRjiNaRr0FwxwFzNOxi6%2BFrR5iSnjwgyUbrzHlw1eTBvw%2FqHrUqMdgjar934e4PjFc4WwoETvBu167sg40%2Flud6cNZeN6rtwJe1ExQsJWovrzOBIwhkVEWji0pEA8IPa2avyONEqEqk%2Beue6LD%2ByjR2bw1QqQUgQKvOQck3o8Em2KMd3BV%2BJf6deNxm70jfvuMf4X2EjcummOFl7%2BqgdUkSffWNy84AeNGcmxJIqMPrcK1mWSlC4XPz4YEVC8dVx%2FM7P9c%2B9GdEKWQ4KCaVsiMuB0LdsX8%2B0%2BkABHUchmnOumKAxh3lNLgQodw1yUQtFZUOm7b5ht0bsJyBBA9fh1EFJld0wFkJ35jDa4dvMBjqkAeuEHq%2F55v%2BldkqKS2v6xpvL4VihdELWfsPNNWhLihJQ9yXoh%2FEdbMN34qK0KT%2F%2Fffsgs2QcjavrhcKNNYSc9%2BDqPkV5UDDImKika1onut9v7D5RE6QIPm%2FiQIV%2BM7FCOmHOwrkHynN9NIhPzgqKRi6%2ByQXdaW10lQIjhy%2F0XVOEpd5rC2ii8JMNC1Kyi0%2BmYoQRoXOEn4LSTXmvJtcvvILezv68&X-Amz-Signature=e0f26e6f5de5621b3322f7d898fd64053c18ba184b2fab757ea4b9fad244845c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WHECU5GX%2F20260219%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260219T123821Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCfsWsODHAv3NrqPVgO3WbEDG7tGgIL0TbBELV%2F58y4%2BAIhALz4FhlDeclXbVn1N9vmAkH77O%2Bk5YVhE9UX1xWTEU%2FSKv8DCHwQABoMNjM3NDIzMTgzODA1Igy8sN%2BrZiyD1jipOHIq3AMax2vVx2cLo81CSMRLgIizi1vM%2FYm2iEPUc7925wQRHzR%2Bi3ICjyJ9d97sf9llZUAJ0zdZwfa3WXdcy0Fw5jxJ30BGRIYd5EWx9QAb3MG1CWIZuUySk81v%2BNG9hWD9h0mOPjQm%2BWxiKzpoV2H%2BYNqXntKtxgBzyW0LTxIXLiUu7fAoUZEkinha0KtmkcjBqSSBKbDWDrRhU8QMlusI5BCyXPtnZK9PA7GmGEr8iVj96V0odNtytpwzhrfKqCr9Ar%2BAVphE3whQHYH8rARZLPOpug4dtRjiNaRr0FwxwFzNOxi6%2BFrR5iSnjwgyUbrzHlw1eTBvw%2FqHrUqMdgjar934e4PjFc4WwoETvBu167sg40%2Flud6cNZeN6rtwJe1ExQsJWovrzOBIwhkVEWji0pEA8IPa2avyONEqEqk%2Beue6LD%2ByjR2bw1QqQUgQKvOQck3o8Em2KMd3BV%2BJf6deNxm70jfvuMf4X2EjcummOFl7%2BqgdUkSffWNy84AeNGcmxJIqMPrcK1mWSlC4XPz4YEVC8dVx%2FM7P9c%2B9GdEKWQ4KCaVsiMuB0LdsX8%2B0%2BkABHUchmnOumKAxh3lNLgQodw1yUQtFZUOm7b5ht0bsJyBBA9fh1EFJld0wFkJ35jDa4dvMBjqkAeuEHq%2F55v%2BldkqKS2v6xpvL4VihdELWfsPNNWhLihJQ9yXoh%2FEdbMN34qK0KT%2F%2Fffsgs2QcjavrhcKNNYSc9%2BDqPkV5UDDImKika1onut9v7D5RE6QIPm%2FiQIV%2BM7FCOmHOwrkHynN9NIhPzgqKRi6%2ByQXdaW10lQIjhy%2F0XVOEpd5rC2ii8JMNC1Kyi0%2BmYoQRoXOEn4LSTXmvJtcvvILezv68&X-Amz-Signature=89f9c82af63d719c60061af894a794b918c8b7ff5db5e744e258a4468a3560c9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
