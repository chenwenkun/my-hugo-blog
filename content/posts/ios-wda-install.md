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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHBZJDNA%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T085643Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJIMEYCIQDDMeBmSmkhw042yIoAss1ouFgsxxHBLvTjIJR4ZnCMIgIhANVw7oCACERSsEKg%2BvAq7NSGQTcaFEj25r3yGZTRLy5wKv8DCBkQABoMNjM3NDIzMTgzODA1Igx%2BPxLVV1aXMMfvqYMq3AN43TdnXc5Zi5Ga5q%2BciWw8cR2EscTNn4fW61dSJw1mTTubNpslhU%2B4%2BA8IiGDcq579oVZsAmSIuRwWYfAsoJ%2FQFc9ZvrxtpF5wIbqEXJitto4t4LvLN2%2BDZom0D6C7M6r6P96Drm2XbvQICii%2BTJ6ZE1HzUOS91BAEJVVFs4o1sNWkCP8PguzDxaCv6a4Kwj4t2oHFIdjLSDEGdB%2BSu9WmXoiOrVp0muxL6bcPJszF8Ii7Mmu0wsc4a4pI4QkpKoDZl9srY2zYB9f3avicyJh%2BYskpyWpnEsGIMEtv%2Bm0l5AnnrqCUf7HM%2FLuobJt1dMN5urx9pGjioaakjvM2jRsDrzOdEzmJRT3NARPzoVGIw3z37sumJEzdJH6iCiVtvNFQMVFpb%2BwhTrKKhRfnr4HluiGkbHsJzMn9tsKl0GuohHhKrUL4lFfyerCKA%2Bp18zj0HM3Vll6GFFgJaEHYHdt7sohTJ0MTsaLVM1dDE6mQynxTP0tvTcvW6qMYTtnu085tfR5pLEm%2F9FFQ%2FjSdsXpFIp9yTGHWtDFDMUy4zgIwshPDyOHGBPITGTxZLiFziHxU%2BMTddxzT2kwSBLP3L0Zgt8s6QqGKOlpCHJO3F%2BSwTT56IDJcuHmX%2FEnUjzCL7ejRBjqkASbMkx5JdqBzIy%2Bc9Zwfk1JmWsz7gLC38ErRvc8SAoOpnb0utELP0oqDSQ7DN9UkdaZsmM4QveLr9%2FvtXZB4s3Dtka8ZRYEg4YAQ6SoPtN8ra%2BRNiQex0NVB4TiwPVU4xlCOudFE3mG1JBFFoH%2FhKhrW0ZyQ7ZQm1BlZuIqOmiyXG%2BO2NSz9g%2FpRc8Qj5kGmx2JzMdYOKU4izgzZiMjcU4AHU53r&X-Amz-Signature=339f02edbb6af06280b58f63604f4409b3d8b2f2eedace74fe4aec057e7fc949&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZHBZJDNA%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T085643Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJIMEYCIQDDMeBmSmkhw042yIoAss1ouFgsxxHBLvTjIJR4ZnCMIgIhANVw7oCACERSsEKg%2BvAq7NSGQTcaFEj25r3yGZTRLy5wKv8DCBkQABoMNjM3NDIzMTgzODA1Igx%2BPxLVV1aXMMfvqYMq3AN43TdnXc5Zi5Ga5q%2BciWw8cR2EscTNn4fW61dSJw1mTTubNpslhU%2B4%2BA8IiGDcq579oVZsAmSIuRwWYfAsoJ%2FQFc9ZvrxtpF5wIbqEXJitto4t4LvLN2%2BDZom0D6C7M6r6P96Drm2XbvQICii%2BTJ6ZE1HzUOS91BAEJVVFs4o1sNWkCP8PguzDxaCv6a4Kwj4t2oHFIdjLSDEGdB%2BSu9WmXoiOrVp0muxL6bcPJszF8Ii7Mmu0wsc4a4pI4QkpKoDZl9srY2zYB9f3avicyJh%2BYskpyWpnEsGIMEtv%2Bm0l5AnnrqCUf7HM%2FLuobJt1dMN5urx9pGjioaakjvM2jRsDrzOdEzmJRT3NARPzoVGIw3z37sumJEzdJH6iCiVtvNFQMVFpb%2BwhTrKKhRfnr4HluiGkbHsJzMn9tsKl0GuohHhKrUL4lFfyerCKA%2Bp18zj0HM3Vll6GFFgJaEHYHdt7sohTJ0MTsaLVM1dDE6mQynxTP0tvTcvW6qMYTtnu085tfR5pLEm%2F9FFQ%2FjSdsXpFIp9yTGHWtDFDMUy4zgIwshPDyOHGBPITGTxZLiFziHxU%2BMTddxzT2kwSBLP3L0Zgt8s6QqGKOlpCHJO3F%2BSwTT56IDJcuHmX%2FEnUjzCL7ejRBjqkASbMkx5JdqBzIy%2Bc9Zwfk1JmWsz7gLC38ErRvc8SAoOpnb0utELP0oqDSQ7DN9UkdaZsmM4QveLr9%2FvtXZB4s3Dtka8ZRYEg4YAQ6SoPtN8ra%2BRNiQex0NVB4TiwPVU4xlCOudFE3mG1JBFFoH%2FhKhrW0ZyQ7ZQm1BlZuIqOmiyXG%2BO2NSz9g%2FpRc8Qj5kGmx2JzMdYOKU4izgzZiMjcU4AHU53r&X-Amz-Signature=0a5b0dda69458ffbbf45efc4d45cf46014bbeff42e4b9b626056f51c016828cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
