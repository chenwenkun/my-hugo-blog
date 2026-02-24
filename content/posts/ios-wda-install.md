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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SS27YDM2%2F20260224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260224T011019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECAaCXVzLXdlc3QtMiJHMEUCIQDiCVo2qhhp%2FISn5ChHVRblXR%2Fd%2FGRdGEJGSv4rFwBDvQIgVgVtu5EVwIqeYe2zi3js5FRc1pSyYPnPFye8y8uwLWoqiAQI6f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAQUwIAONvxKPbortircAxf9UiDidk5Gz621mfOK3AYEN0YZi%2FAIq55bjq%2FR0fLUA%2Bzfrach25uSSw9k3l%2Fz2yGYNfYapJQYDpaVfux%2BRrfgTXanORMf72pieZufVdp4e9RTR5XCGtJeJyUFrkE1Ol3cX0BVYJPKJKLUXs0S03PtLo04nWP9hK6%2FHDPHdqZFK5lFsI7feGPVV6pvITMMSjxM3%2Fd3IRuL1zqR%2FbROBXXS%2FtEzRA%2B313q%2BIvlVzi%2BjFa2NyLluBJf41eXZRjv03CTzEVyn3S2e3hIQnj8%2FzNmYf6GCMi8MKFBUBYN4nh0F9%2BYzZhmVdwp8tUvaWdYITRc7z2ktw9BCilzwNFswGNUTCwqh3YGjHXBhOonZP96X1DjtFJwqFT1Ghk3RBNOklC535PgCiYWpVNWMWL1Pn42YmoteeUEpbIsUCEYZjiUfYnb0%2FyozEkAJl0lRujlnCEI9FVe12KA7Td4tPmHf03utYTJdrxabyXn9TdXwkPeR%2BZYeicJGlAylYvpsuY9M6fobjXfFq4JLwFJ26qjBzLe0MAXQrEA0L%2F%2Fa26qnuk1BYBolIY1sTBk2mRPfVgtQOGpAeswjunzcZ2mqKZwHww%2Ffo4wklt2sdMZExo5VXf9P%2F3asXAo%2FEIhgE4CcMMLL88wGOqUBgh7ADxUpCcpcCIzE%2FhzNdv5c09EKxFKx00XBHsJKgq0A4mPA4lLtbVGLvpHJBsOAzlLZSEhZjuuUXVcMUsi4qFv8j%2Biwea1VFmVePcCIeJEmXz5UbzRfpBlxs2rUK7puGmAI6jWowd0VIeIvEiqh5I0VSoXcEWyjNIwrk3uAg4Ackn6Q0esqBjHErNqIyhE6tNHwLDh7vYcGtBicfIsRYwTsLgDj&X-Amz-Signature=68c06a91f250c6e2555e79578fcaab71d4987fe600d26561b7a6d94d0cc9653c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SS27YDM2%2F20260224%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260224T011019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECAaCXVzLXdlc3QtMiJHMEUCIQDiCVo2qhhp%2FISn5ChHVRblXR%2Fd%2FGRdGEJGSv4rFwBDvQIgVgVtu5EVwIqeYe2zi3js5FRc1pSyYPnPFye8y8uwLWoqiAQI6f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAQUwIAONvxKPbortircAxf9UiDidk5Gz621mfOK3AYEN0YZi%2FAIq55bjq%2FR0fLUA%2Bzfrach25uSSw9k3l%2Fz2yGYNfYapJQYDpaVfux%2BRrfgTXanORMf72pieZufVdp4e9RTR5XCGtJeJyUFrkE1Ol3cX0BVYJPKJKLUXs0S03PtLo04nWP9hK6%2FHDPHdqZFK5lFsI7feGPVV6pvITMMSjxM3%2Fd3IRuL1zqR%2FbROBXXS%2FtEzRA%2B313q%2BIvlVzi%2BjFa2NyLluBJf41eXZRjv03CTzEVyn3S2e3hIQnj8%2FzNmYf6GCMi8MKFBUBYN4nh0F9%2BYzZhmVdwp8tUvaWdYITRc7z2ktw9BCilzwNFswGNUTCwqh3YGjHXBhOonZP96X1DjtFJwqFT1Ghk3RBNOklC535PgCiYWpVNWMWL1Pn42YmoteeUEpbIsUCEYZjiUfYnb0%2FyozEkAJl0lRujlnCEI9FVe12KA7Td4tPmHf03utYTJdrxabyXn9TdXwkPeR%2BZYeicJGlAylYvpsuY9M6fobjXfFq4JLwFJ26qjBzLe0MAXQrEA0L%2F%2Fa26qnuk1BYBolIY1sTBk2mRPfVgtQOGpAeswjunzcZ2mqKZwHww%2Ffo4wklt2sdMZExo5VXf9P%2F3asXAo%2FEIhgE4CcMMLL88wGOqUBgh7ADxUpCcpcCIzE%2FhzNdv5c09EKxFKx00XBHsJKgq0A4mPA4lLtbVGLvpHJBsOAzlLZSEhZjuuUXVcMUsi4qFv8j%2Biwea1VFmVePcCIeJEmXz5UbzRfpBlxs2rUK7puGmAI6jWowd0VIeIvEiqh5I0VSoXcEWyjNIwrk3uAg4Ackn6Q0esqBjHErNqIyhE6tNHwLDh7vYcGtBicfIsRYwTsLgDj&X-Amz-Signature=ce5b5faeb9ffea7a58c836a27156f5e8123d17353ebaef76bbec8b1779943719&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
