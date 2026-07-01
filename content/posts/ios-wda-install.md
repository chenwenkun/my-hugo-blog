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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46667ONSXI7%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T092744Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJHMEUCIQDMW%2FdpzrbU5RUooxg03HYLaaqAPUZHOKpxQeImetiMYQIgZW5z5RFSlPg0XuhXtpZLAR1kFBvrxFIsKxyxDYRKta4qiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK598CAMJar2E5A7uircA2rOD6Rtx1pso4fWJv52kytOtHTLG8ifbWGcQlb7a33AgOyTILAm16HU0WDvIijDY1%2Fod5kBOWO%2F9jMR6UILjEI%2BbKhAljDuhxmlWzsV8dzda3rDyn54dUiGiKTCX9HWn3MdT2WRZv2HA5s%2FF7pm2VwcHvSzkLXwrX4FmRcBZKOvD%2BnL1%2F7ESs%2FQc5j3eXEYt5G%2FSrJ9PrxHVJWZ79SnyHqeTPyOrZDY0o%2Bko%2FbAxdJmKqdpcNrGXOwABmGYGRMgrTJS8HoRxCN4exVGik3%2FZYvPc2NdyAHkuqPCoWmngDX5%2BLngnCZA7Nx%2FAexxvT9TCu7mhXdkvWkfru25H4uA9bVc42m5eUEWuVgMCR%2F7aDrWmIu6cACp72TwHpZ08skMAT0VUziqFk0GMel%2FZG7Yw7YYwOBoaWPnbYL5%2BY%2Fh%2BukF6EVGqSZ2CaB0bvlh8X1dbnasKftMbFsJbX0YwjOxpPFVlXQSJFIbxXByQgptvFTRC3Byg9MsoFFIMRFoWPaFwx6vXHzprrnQeinzAQJxULRulAEQuqlDsh8tz%2BJYVE7K2cOT4%2BHF3kAZ3ha4IRZYr5JZheEEXcZE0IiV4gHTlh7QMA%2B75KK1cEfZcBTZW4HeZaQwsPUDIhjH3j5yMIeuk9IGOqUB%2FIQ9mLQIS80Q7gI47uBA0h6lCKKUgh4y0owC99j5d6hLoTW1WLlrrlRcVPEwfT9l%2BLbk4Yx7JKmbMZbmIO%2FMvm87Lc7EJHhoRLataRrx2cbbv3GEx2LSSx55QoE6maejiF2nPcW3owfLDV2i0ZW8jQlxRTIbU3XZmaA%2FUu%2B8XSYvHlWonAkYeVDKtkNtcnwUIqnIjyUcTU4nRtYl11gycMDKB72n&X-Amz-Signature=b3ecf54b81d58f98d61de35209cf820d327316e2792472bdc643772f8ad5f1e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46667ONSXI7%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T092744Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJHMEUCIQDMW%2FdpzrbU5RUooxg03HYLaaqAPUZHOKpxQeImetiMYQIgZW5z5RFSlPg0XuhXtpZLAR1kFBvrxFIsKxyxDYRKta4qiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK598CAMJar2E5A7uircA2rOD6Rtx1pso4fWJv52kytOtHTLG8ifbWGcQlb7a33AgOyTILAm16HU0WDvIijDY1%2Fod5kBOWO%2F9jMR6UILjEI%2BbKhAljDuhxmlWzsV8dzda3rDyn54dUiGiKTCX9HWn3MdT2WRZv2HA5s%2FF7pm2VwcHvSzkLXwrX4FmRcBZKOvD%2BnL1%2F7ESs%2FQc5j3eXEYt5G%2FSrJ9PrxHVJWZ79SnyHqeTPyOrZDY0o%2Bko%2FbAxdJmKqdpcNrGXOwABmGYGRMgrTJS8HoRxCN4exVGik3%2FZYvPc2NdyAHkuqPCoWmngDX5%2BLngnCZA7Nx%2FAexxvT9TCu7mhXdkvWkfru25H4uA9bVc42m5eUEWuVgMCR%2F7aDrWmIu6cACp72TwHpZ08skMAT0VUziqFk0GMel%2FZG7Yw7YYwOBoaWPnbYL5%2BY%2Fh%2BukF6EVGqSZ2CaB0bvlh8X1dbnasKftMbFsJbX0YwjOxpPFVlXQSJFIbxXByQgptvFTRC3Byg9MsoFFIMRFoWPaFwx6vXHzprrnQeinzAQJxULRulAEQuqlDsh8tz%2BJYVE7K2cOT4%2BHF3kAZ3ha4IRZYr5JZheEEXcZE0IiV4gHTlh7QMA%2B75KK1cEfZcBTZW4HeZaQwsPUDIhjH3j5yMIeuk9IGOqUB%2FIQ9mLQIS80Q7gI47uBA0h6lCKKUgh4y0owC99j5d6hLoTW1WLlrrlRcVPEwfT9l%2BLbk4Yx7JKmbMZbmIO%2FMvm87Lc7EJHhoRLataRrx2cbbv3GEx2LSSx55QoE6maejiF2nPcW3owfLDV2i0ZW8jQlxRTIbU3XZmaA%2FUu%2B8XSYvHlWonAkYeVDKtkNtcnwUIqnIjyUcTU4nRtYl11gycMDKB72n&X-Amz-Signature=6022f391700f535ff472f54cbc0b5a324030d88bd7cd39014bd9cc4d8305334e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
