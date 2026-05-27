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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665BTH7GUQ%2F20260527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260527T085951Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCzcT4DLJzEXRp5AFzs%2Fh6%2B5KQjr6HAUEVpN4ijdc%2FBzAIgB6k1Ga58FBdHakvkcX5Ep56C2x8tjCvTCxQmX4gzTpsqiAQIkf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFjCa70JDJt7VLnnFSrcA676Kgiu6U2cwbLOj3VyKY5Jd9jV4VX56QRYX0YBX5t%2Fhues%2BQISVfSwzDIwOSouCHmzni68BvpXC1whV4Ac8oDVEmIZSIfh18Nmdn8YOfW6dl%2B43uqhZq68m0rqzpaj9NsDsCYu29A0R8SS53iJo0bYS9GAgEc1POd3tZ%2BCxM7WxwKLXK9NLTFLZKluYoxck5KF8x%2BSnmQQpVMy%2BDHZSBblZPlOPnEuWdWiDLcebS08sbVfkauAQ%2ForN6h6cMbTllIKKq333VeoKzNLuKu4ZKMvQtd26Xz9J340sThjEZw%2BRu5loF1lWwL%2BUKyP0uU4wTVeC4kqUPRh%2FQ10P4lgjsNDUSVSGbdxvsaYzIo5yNeafcp4nGWeUFS0ZMZj0sNLhEG1X81ks%2FaUKJmGkeTCV0uPNvQt%2BVB7AjGmqII%2FLUGozVXFw5Qt0GUq0nlkAcITAf8ddBwKw0JwtaIvJa5OsdYb7dkB2go87AUB7UcUKygtlOi8LJ1jmdr6zfZeBE0rd746yur%2FqZ9l0t2hLfJ%2FzovkJN6uEDoNtDzX4Ovt6yIp7orcNxV8CA0NIT%2BzGywD%2FI4buOFN%2B%2BEZxm5QxxEefYu%2F417S53P9TCFshsCtOEEiexdFBcai%2FITqfgM7MKi72tAGOqUB88chaL5JHNPYpn790nP2Zhz69QKuUrLsdzNLCEy1Um4%2BxrXXsVIADI5XSfvNonw9pHIYMK5F2JiLQ6sjeHj%2F60YdW4SwO7ZgqsjqZKZGLhr9B9fkr2F0PhRxNEwXM%2FKFW9choM%2F0oRGUBU88OTIjR76iXJIihsxojLDQNt1wTftIN7qqjTVAdUcWRWOspio4U8pPd0sQse0rHCcX%2FrPs5n8e%2Br0g&X-Amz-Signature=d00c9859b57047847728d81905cbb27798663fcda2049649879f90eb0dc7fa70&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665BTH7GUQ%2F20260527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260527T085951Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCzcT4DLJzEXRp5AFzs%2Fh6%2B5KQjr6HAUEVpN4ijdc%2FBzAIgB6k1Ga58FBdHakvkcX5Ep56C2x8tjCvTCxQmX4gzTpsqiAQIkf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFjCa70JDJt7VLnnFSrcA676Kgiu6U2cwbLOj3VyKY5Jd9jV4VX56QRYX0YBX5t%2Fhues%2BQISVfSwzDIwOSouCHmzni68BvpXC1whV4Ac8oDVEmIZSIfh18Nmdn8YOfW6dl%2B43uqhZq68m0rqzpaj9NsDsCYu29A0R8SS53iJo0bYS9GAgEc1POd3tZ%2BCxM7WxwKLXK9NLTFLZKluYoxck5KF8x%2BSnmQQpVMy%2BDHZSBblZPlOPnEuWdWiDLcebS08sbVfkauAQ%2ForN6h6cMbTllIKKq333VeoKzNLuKu4ZKMvQtd26Xz9J340sThjEZw%2BRu5loF1lWwL%2BUKyP0uU4wTVeC4kqUPRh%2FQ10P4lgjsNDUSVSGbdxvsaYzIo5yNeafcp4nGWeUFS0ZMZj0sNLhEG1X81ks%2FaUKJmGkeTCV0uPNvQt%2BVB7AjGmqII%2FLUGozVXFw5Qt0GUq0nlkAcITAf8ddBwKw0JwtaIvJa5OsdYb7dkB2go87AUB7UcUKygtlOi8LJ1jmdr6zfZeBE0rd746yur%2FqZ9l0t2hLfJ%2FzovkJN6uEDoNtDzX4Ovt6yIp7orcNxV8CA0NIT%2BzGywD%2FI4buOFN%2B%2BEZxm5QxxEefYu%2F417S53P9TCFshsCtOEEiexdFBcai%2FITqfgM7MKi72tAGOqUB88chaL5JHNPYpn790nP2Zhz69QKuUrLsdzNLCEy1Um4%2BxrXXsVIADI5XSfvNonw9pHIYMK5F2JiLQ6sjeHj%2F60YdW4SwO7ZgqsjqZKZGLhr9B9fkr2F0PhRxNEwXM%2FKFW9choM%2F0oRGUBU88OTIjR76iXJIihsxojLDQNt1wTftIN7qqjTVAdUcWRWOspio4U8pPd0sQse0rHCcX%2FrPs5n8e%2Br0g&X-Amz-Signature=b520d859d2878b58824315392890a28e79bf8cb121838b01d23d7d799d323937&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
