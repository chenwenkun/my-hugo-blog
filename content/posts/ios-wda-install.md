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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667YRL2MMG%2F20251115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251115T121847Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICvUkDF959S9mxUIqnlEjNNjoXK%2B%2FieV55Kx8axCrrgOAiEA1J3dA3%2BipUq6n56ko0lZVFDQNDVSox6ea8skujEC1%2BUq%2FwMIexAAGgw2Mzc0MjMxODM4MDUiDNzb4iznI3taDYxhqSrcAyLxcWWF4Cbe03X96tK5WoT%2Fy4vAIFxisZQW2hXi0Zf50qo2u01xMQzrVMKcZF4G%2BR2iAuxK1hRnt1En2hXWWY5Lzt6%2BoF7In38PBh26Wb%2BXmVtFzQIWIZux8a2DzGX%2F3ODs%2FpiQM2mwgk0JUoiUQ7fb1CoJWAtmDUNTACgQx9wcpd5KToK6EyZDoGU3VKa4X1EWufR9gLLyJBzdJhL6r5XzZEIkJcDCYiypdSnaJciDf0nE67InvgO%2FOx16fWPL%2B%2BaS%2FyBdezIoRZPWjO2NfS6di3cdh40El5BNCj7dVzsnOokYDX1bjwoxR0xyB%2BMsC%2BqCjAiyjhj4CvieADtA13sacwR3VHJCd1iyRTl0EcuFRAOomiBWpITICC59v19arqD4m7G7RRAaE8zC4ySzmT3TGlFoJYhn4h%2FjChRI%2FFkUfdWi4PCq1M8ErVw331QR7uJJnvwkG5aa6U8d2smmeMsyBr3S%2FHhDJW2F2cP7%2Bwp7HzIy33bh20Jh6JfRvS4%2BaX4dor%2BIY6K8ed5RI9r739VBxgZgylqBhzVZ78XBV6COfDiupB2b9HpbMx17zOA11Eb5wkbjTZmGqCfvp3vROcTbCLeEQ4VnPTzFSfb3Mjx%2FPVFvi4ZkEJjIaFOfMOKV4cgGOqUBkuX%2FWLcItKA8kpWZAF2txOLfiXeZegG1htt6liTUQx8O9jEwIerWbLirnDyJ2yjpxholisvKzodXgDAbTqcQrGTtEq0O8HfO2HvoipIFykwyDJx1rneEIVMAGKApDUIxk0DI5nZxSWRIpMqDG5yTsFP18CfwIBPY1y4zQeiY2mgsA20S9WendV5w8bid9e7x0ZYvoH6KP7BtbkjdNXBOewVJ4Vxi&X-Amz-Signature=55c0e6ff4a9375770851dc83f2533b83484036783f75c82b40d352262320c84a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667YRL2MMG%2F20251115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251115T121847Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICvUkDF959S9mxUIqnlEjNNjoXK%2B%2FieV55Kx8axCrrgOAiEA1J3dA3%2BipUq6n56ko0lZVFDQNDVSox6ea8skujEC1%2BUq%2FwMIexAAGgw2Mzc0MjMxODM4MDUiDNzb4iznI3taDYxhqSrcAyLxcWWF4Cbe03X96tK5WoT%2Fy4vAIFxisZQW2hXi0Zf50qo2u01xMQzrVMKcZF4G%2BR2iAuxK1hRnt1En2hXWWY5Lzt6%2BoF7In38PBh26Wb%2BXmVtFzQIWIZux8a2DzGX%2F3ODs%2FpiQM2mwgk0JUoiUQ7fb1CoJWAtmDUNTACgQx9wcpd5KToK6EyZDoGU3VKa4X1EWufR9gLLyJBzdJhL6r5XzZEIkJcDCYiypdSnaJciDf0nE67InvgO%2FOx16fWPL%2B%2BaS%2FyBdezIoRZPWjO2NfS6di3cdh40El5BNCj7dVzsnOokYDX1bjwoxR0xyB%2BMsC%2BqCjAiyjhj4CvieADtA13sacwR3VHJCd1iyRTl0EcuFRAOomiBWpITICC59v19arqD4m7G7RRAaE8zC4ySzmT3TGlFoJYhn4h%2FjChRI%2FFkUfdWi4PCq1M8ErVw331QR7uJJnvwkG5aa6U8d2smmeMsyBr3S%2FHhDJW2F2cP7%2Bwp7HzIy33bh20Jh6JfRvS4%2BaX4dor%2BIY6K8ed5RI9r739VBxgZgylqBhzVZ78XBV6COfDiupB2b9HpbMx17zOA11Eb5wkbjTZmGqCfvp3vROcTbCLeEQ4VnPTzFSfb3Mjx%2FPVFvi4ZkEJjIaFOfMOKV4cgGOqUBkuX%2FWLcItKA8kpWZAF2txOLfiXeZegG1htt6liTUQx8O9jEwIerWbLirnDyJ2yjpxholisvKzodXgDAbTqcQrGTtEq0O8HfO2HvoipIFykwyDJx1rneEIVMAGKApDUIxk0DI5nZxSWRIpMqDG5yTsFP18CfwIBPY1y4zQeiY2mgsA20S9WendV5w8bid9e7x0ZYvoH6KP7BtbkjdNXBOewVJ4Vxi&X-Amz-Signature=b649d6743e74da37d9d4e61ccc738eae58000428bb804f2b1edb265f152d6e63&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
