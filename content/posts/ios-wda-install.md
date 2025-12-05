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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJ2ANNDF%2F20251205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251205T181508Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIH6Nfx%2Bz1ciTGVeLCjMbr%2F5VHIkivfkoj1pNftzDMuvXAiBbrfgIsJqyR2dkiZRFPH86%2BFqCLHNQGrWHp9X9vc6syyr%2FAwhhEAAaDDYzNzQyMzE4MzgwNSIMl1BJ%2BD%2FaYfeFpKvDKtwDvEdua81K9vG%2Fm3cPa5smqZywr1PcyEOk1OnPt8K0MERQ0WxHaZJo9iLax35PuB%2Fy9i%2BQQHDUzCytrfyN5iFZf0uU8VtpOkxkixK9%2FINd1BsPTDef4O%2Fn82IyXjBPOnsNtP7qnciuBZ3NCfnnIYff3SFYsjCxPUz08kjkZWPpYTyIiZxumnn6tOcvx3VjE8BejA97O9TU26geOCWcikDHQUzcxedInxfMW5b4Ki%2BNH9FNTAAdp6incfm8tBdBy4xX3aFtlVwBX%2FUE5W7rOJP5GTdoA7ZD%2FjenpF1b1JBcJFiNdQeuzFSCmpGDKpr8ieQDn9j2pJ8We6YcAt3V1%2B4vh7cm0WSKchSskwaB5oVAllgtyMo8CsuK70E7MDnRbp37XKGXp%2B2PmuYJZRaTxkra93NStXKmcuKGzSyR9u0avep%2Fnm6e1wg3%2Fp5Fjay%2BTWt%2BbKGVrk8y1ryKGqMJ3zKTPGcCKhK89yjzJTtOH4x9jvdIdn3gMvEdRXOyi%2FqoUKeRDAxkaI%2Fh7QaKzDPAMkjLjldM5q9q4kZcIkBUUZYO8n4akDA%2FgpTRn60x9naOOeP%2FAd8h0rvM3vk3CK8yMl7qcnlzErXC5Uxk5eB1S%2BkDhJdz1Z7mzJnuIzTDRQcw5PTLyQY6pgEH02Ri1FY4RX6oItVjWqZI49xadGhO7uJEpxOOT1wdy9y8vQTdeXDZlauNm9E9aqI7auS42%2BaocaVhqHXe4iztvZkQjrONR6%2Fh8SjunM9UmN528jdlTnRV3yqt%2FgygEAp4SsdCeqh%2BkrHIILoXy2EbXWx67d8uJlFPfCgxS%2BNpZ%2BnmkcPVWIJHSTQZlUXv8Q8lxoMgt5dHgGO2LSXyh5fLudDOKK2W&X-Amz-Signature=0990be746f12a214e304b189f39fa0d2126e7ef186575ed99d0493c6bef2349a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJ2ANNDF%2F20251205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251205T181508Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIH6Nfx%2Bz1ciTGVeLCjMbr%2F5VHIkivfkoj1pNftzDMuvXAiBbrfgIsJqyR2dkiZRFPH86%2BFqCLHNQGrWHp9X9vc6syyr%2FAwhhEAAaDDYzNzQyMzE4MzgwNSIMl1BJ%2BD%2FaYfeFpKvDKtwDvEdua81K9vG%2Fm3cPa5smqZywr1PcyEOk1OnPt8K0MERQ0WxHaZJo9iLax35PuB%2Fy9i%2BQQHDUzCytrfyN5iFZf0uU8VtpOkxkixK9%2FINd1BsPTDef4O%2Fn82IyXjBPOnsNtP7qnciuBZ3NCfnnIYff3SFYsjCxPUz08kjkZWPpYTyIiZxumnn6tOcvx3VjE8BejA97O9TU26geOCWcikDHQUzcxedInxfMW5b4Ki%2BNH9FNTAAdp6incfm8tBdBy4xX3aFtlVwBX%2FUE5W7rOJP5GTdoA7ZD%2FjenpF1b1JBcJFiNdQeuzFSCmpGDKpr8ieQDn9j2pJ8We6YcAt3V1%2B4vh7cm0WSKchSskwaB5oVAllgtyMo8CsuK70E7MDnRbp37XKGXp%2B2PmuYJZRaTxkra93NStXKmcuKGzSyR9u0avep%2Fnm6e1wg3%2Fp5Fjay%2BTWt%2BbKGVrk8y1ryKGqMJ3zKTPGcCKhK89yjzJTtOH4x9jvdIdn3gMvEdRXOyi%2FqoUKeRDAxkaI%2Fh7QaKzDPAMkjLjldM5q9q4kZcIkBUUZYO8n4akDA%2FgpTRn60x9naOOeP%2FAd8h0rvM3vk3CK8yMl7qcnlzErXC5Uxk5eB1S%2BkDhJdz1Z7mzJnuIzTDRQcw5PTLyQY6pgEH02Ri1FY4RX6oItVjWqZI49xadGhO7uJEpxOOT1wdy9y8vQTdeXDZlauNm9E9aqI7auS42%2BaocaVhqHXe4iztvZkQjrONR6%2Fh8SjunM9UmN528jdlTnRV3yqt%2FgygEAp4SsdCeqh%2BkrHIILoXy2EbXWx67d8uJlFPfCgxS%2BNpZ%2BnmkcPVWIJHSTQZlUXv8Q8lxoMgt5dHgGO2LSXyh5fLudDOKK2W&X-Amz-Signature=10a5860c9d8c7325dde8801ea82858a720b80249e5da08e39c57d265d3b753cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
