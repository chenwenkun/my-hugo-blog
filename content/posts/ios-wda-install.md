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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WYEXET36%2F20251117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251117T181526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFO2oRwpagvgOrkvhoWWB2o5XbJciRYvGsB0nyFPbd7%2BAiEAx0q%2BfqSG%2F9gbm%2B8c%2FlRUljYdXo2ChX8lgjzSwiS5nD4qiAQIs%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM15kOxDeflOm3%2BVvCrcA54rR8HkqhPySthboDWp0GhdgcsrNVGFG0MMpc%2Fm3oZXbKj0X4DBprnIp3aB1UI7VYFhGXVw7BS26dWkX%2BepNe3Ag6%2B6q4JGQzVgNdbym%2BDua7ev4ZLnQSth%2BfXo04DdOI5dbN0C6O1TDjKTyK7Ru7SMtYXWz3Yg6lHRFtaPs6PyMaxsXTkakPvHnmb%2FUJDlmwYDFdxFdoZXCZyg1%2Fl5SBCmS1XMNu%2BVtpQ9WjX0Kpz9%2FKu1XbbvUiACSK78bu5Dhr8XirY1vgbaTEKJ%2FrEMU%2BP3gaxLsEwBnPg9EA3iF5oWq8Ugl75PgLJ%2BYObHJOMykZM0eI%2FmbLo8FvOIojA1Vaq5vSNcaRsgYMn1ixSH1pq%2BMRe07vy%2FKe1rQVWnhyv5qzpwsMnvNDOzrf6Dvn5swq2xpZaEWUKy0KjiUI7BwwrPIkLGAJVPKvO69Iw%2FpS3L56ynVXkYNU%2Fr414kuKM5ONElgH3X%2FIvZJx0NvxUIVJ209brIpCJrGyQ4du%2F2EPhFIinuGGokGzuUJJ2e47W2vMgxMEAyRR7S3Vey%2BB%2BZI3KUyow%2Fb0rvNA6UEAF%2BWAR1dQm8X3qo%2BIwUOqhPPTHnL%2BbnouKQvQ19dk%2FWuWYu1segyVDadgr7fjCVBDMvMMC57cgGOqUB%2BALBarlNN2umNIcoICaltRkV0bIceh7J8NuBuPn3BLQ3MZFfKmQKhESovbVvPXbR1YnGN3e5xEY4VCEwpB9%2BL%2ByRegbvZRTJz%2BvQem4H2CkNm96Zzx3ZeMque6OwE07xDI6Vnz1yWMmmj3wkw10k8x9s1fq2kf5NRt5R893OHkUqif0BSwhINewa6R3W2gBIhf9a7b0skuJPed72BpgtycOjIoPh&X-Amz-Signature=0ff1c4bec3a0b6be55c0e6a7aa9fa445950f2f083d8e8b0b233cef8aa76d702a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WYEXET36%2F20251117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251117T181526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFO2oRwpagvgOrkvhoWWB2o5XbJciRYvGsB0nyFPbd7%2BAiEAx0q%2BfqSG%2F9gbm%2B8c%2FlRUljYdXo2ChX8lgjzSwiS5nD4qiAQIs%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM15kOxDeflOm3%2BVvCrcA54rR8HkqhPySthboDWp0GhdgcsrNVGFG0MMpc%2Fm3oZXbKj0X4DBprnIp3aB1UI7VYFhGXVw7BS26dWkX%2BepNe3Ag6%2B6q4JGQzVgNdbym%2BDua7ev4ZLnQSth%2BfXo04DdOI5dbN0C6O1TDjKTyK7Ru7SMtYXWz3Yg6lHRFtaPs6PyMaxsXTkakPvHnmb%2FUJDlmwYDFdxFdoZXCZyg1%2Fl5SBCmS1XMNu%2BVtpQ9WjX0Kpz9%2FKu1XbbvUiACSK78bu5Dhr8XirY1vgbaTEKJ%2FrEMU%2BP3gaxLsEwBnPg9EA3iF5oWq8Ugl75PgLJ%2BYObHJOMykZM0eI%2FmbLo8FvOIojA1Vaq5vSNcaRsgYMn1ixSH1pq%2BMRe07vy%2FKe1rQVWnhyv5qzpwsMnvNDOzrf6Dvn5swq2xpZaEWUKy0KjiUI7BwwrPIkLGAJVPKvO69Iw%2FpS3L56ynVXkYNU%2Fr414kuKM5ONElgH3X%2FIvZJx0NvxUIVJ209brIpCJrGyQ4du%2F2EPhFIinuGGokGzuUJJ2e47W2vMgxMEAyRR7S3Vey%2BB%2BZI3KUyow%2Fb0rvNA6UEAF%2BWAR1dQm8X3qo%2BIwUOqhPPTHnL%2BbnouKQvQ19dk%2FWuWYu1segyVDadgr7fjCVBDMvMMC57cgGOqUB%2BALBarlNN2umNIcoICaltRkV0bIceh7J8NuBuPn3BLQ3MZFfKmQKhESovbVvPXbR1YnGN3e5xEY4VCEwpB9%2BL%2ByRegbvZRTJz%2BvQem4H2CkNm96Zzx3ZeMque6OwE07xDI6Vnz1yWMmmj3wkw10k8x9s1fq2kf5NRt5R893OHkUqif0BSwhINewa6R3W2gBIhf9a7b0skuJPed72BpgtycOjIoPh&X-Amz-Signature=3f720239031ea47230880ef103cd6924c991445e2c0e66eb2ae5f11780c280db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
