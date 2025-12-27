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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MIBI7XU%2F20251227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251227T061739Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGdg9yQSU1giXINZG%2FuwKoclHkOAfxbgkSWjDMas64YzAiBNM65FYd1ks%2BZbtsGehun2WaUxXM6PoYBpmHLFc8JrHir%2FAwhiEAAaDDYzNzQyMzE4MzgwNSIMhpKxu9VI6c1s1bXTKtwDDSj5SJRdFCN%2BxiUbxCPf2zXQ%2F072u%2B%2F6PJV08wJnNSGl7ktZx8g8WLW3q%2BDcMfewT9m%2BaX9HVMO1DB7ceoTuGG5qkx9nL%2BKDYpieWqibtyUZmSiPOJ9L8tECUfEu798%2FDxF29LfCsLtSmX2vs6gzzj2TC5pc6F8pcTcJeKNyX3k2MBy2G7PEGDO0mpMFgOD%2FtCHRPbbnwpwdjS2Rblluef8FNR5Dq%2F5%2FWLGHCcnqedk01%2FCNeD3j%2F1UKsGRG3avY9ZZzXXzEEWj78RpTnPTINXinZMLq9XqAS5eH3P7b9r344pavtahWYEWsfht8bN9hW%2BwEV%2B%2BAj%2Bm9gtRsGCcBLbA%2FOP34HYMNF%2FD2uQUcAxqeWt5k5dB4IsqpaYSjprMldEXfuoU%2B0N5JA4zGEZBgtp%2BxDRFcsYT8OSSVAWdvfWmsNAAx%2B5USvNrmrSjfAAQKWDwYG3y5yerI3z3IQN2CExs49CnwNWgyCckgX%2F9X5%2FyYNxMtQdrslMDHIAgVaNdS1X4sh7nxB1RzTXQcNp9yIlEMd5cMuKEmcZebeco98yKzAsubChjDOjnZAtQB2dTKsme74bY1oWxaIU8hD%2Fw0SfAPN0V%2FyFORru0sVkSDeN8z%2BUGeRj8vAB%2BJlGkwquK8ygY6pgHFxKJToZoSyY5jy8vZPDDoHDVZ%2Boq%2BYkqFHO0AE86uIvjnbOoYcS1IS%2BkcFj0aN1BwNHDelwteRQRUdY0iOaHb6Pct6ghW%2B5D6MY%2BI%2BDB6ad%2B78kzWSko8D6pMux5HxT7KKWZXZQO8zApGFU04qsUGcT0wzWZ%2BuiHXWxN%2F9%2FbBW2m66icJsciugl6TIEZHdR%2B%2Bsvmyh7qYD5d3K4iBcyaJVQTS6N8u&X-Amz-Signature=dd3e6f20c30b5831cd70be45dd5a12cade8d3dd5854543eac1b86c2a69f3a7a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MIBI7XU%2F20251227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251227T061739Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGdg9yQSU1giXINZG%2FuwKoclHkOAfxbgkSWjDMas64YzAiBNM65FYd1ks%2BZbtsGehun2WaUxXM6PoYBpmHLFc8JrHir%2FAwhiEAAaDDYzNzQyMzE4MzgwNSIMhpKxu9VI6c1s1bXTKtwDDSj5SJRdFCN%2BxiUbxCPf2zXQ%2F072u%2B%2F6PJV08wJnNSGl7ktZx8g8WLW3q%2BDcMfewT9m%2BaX9HVMO1DB7ceoTuGG5qkx9nL%2BKDYpieWqibtyUZmSiPOJ9L8tECUfEu798%2FDxF29LfCsLtSmX2vs6gzzj2TC5pc6F8pcTcJeKNyX3k2MBy2G7PEGDO0mpMFgOD%2FtCHRPbbnwpwdjS2Rblluef8FNR5Dq%2F5%2FWLGHCcnqedk01%2FCNeD3j%2F1UKsGRG3avY9ZZzXXzEEWj78RpTnPTINXinZMLq9XqAS5eH3P7b9r344pavtahWYEWsfht8bN9hW%2BwEV%2B%2BAj%2Bm9gtRsGCcBLbA%2FOP34HYMNF%2FD2uQUcAxqeWt5k5dB4IsqpaYSjprMldEXfuoU%2B0N5JA4zGEZBgtp%2BxDRFcsYT8OSSVAWdvfWmsNAAx%2B5USvNrmrSjfAAQKWDwYG3y5yerI3z3IQN2CExs49CnwNWgyCckgX%2F9X5%2FyYNxMtQdrslMDHIAgVaNdS1X4sh7nxB1RzTXQcNp9yIlEMd5cMuKEmcZebeco98yKzAsubChjDOjnZAtQB2dTKsme74bY1oWxaIU8hD%2Fw0SfAPN0V%2FyFORru0sVkSDeN8z%2BUGeRj8vAB%2BJlGkwquK8ygY6pgHFxKJToZoSyY5jy8vZPDDoHDVZ%2Boq%2BYkqFHO0AE86uIvjnbOoYcS1IS%2BkcFj0aN1BwNHDelwteRQRUdY0iOaHb6Pct6ghW%2B5D6MY%2BI%2BDB6ad%2B78kzWSko8D6pMux5HxT7KKWZXZQO8zApGFU04qsUGcT0wzWZ%2BuiHXWxN%2F9%2FbBW2m66icJsciugl6TIEZHdR%2B%2Bsvmyh7qYD5d3K4iBcyaJVQTS6N8u&X-Amz-Signature=f67132a64b1a86af505cabba084f218809ad5d1c064d9f8ed3ad1943245ff5c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
