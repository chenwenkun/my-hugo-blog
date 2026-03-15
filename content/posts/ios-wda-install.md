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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666O3MVDHZ%2F20260315%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260315T122941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGOrMeHu1kzs8alDWvrnVKQNy0XwbafyCwmOLpa%2FHyA3AiEAhjST6PuJkwAiMGYUwYDt%2FKbZ85Z7TDl3hbna6TIlO%2FsqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEuMAY%2Bp5qG3I5v%2FJCrcA%2F8i3FzSREt9PVOMV8bh1DP9vHSYgjlUWC2P6EJhb0TVe0shezicOT2pBflmvKR1SGkTwAPCQHtBPdMiQn3uthJB8h1Usyav3%2FdZ5K0eLO1FI16fEsAOmpr%2FU%2FJ4gVomCor0S475KWqrY1CUIGi7asd6Q6hYqpSiHIursw%2Fl5jVCvAW%2BiUr3cmN6pwZyb825PMVla213qKUz8lW2MCs6zdE1y4C2ADyP%2FJwUSIWS9m0P85A9JaHTe5Dhns3DchxV2uUw0ZTRRCZ8Ev265YSt%2Bv45IWYVK9y7yQpSOjdQFMiFaDYDFkj7HV3PXJMMOgVSpAW%2Fvbs7yYdFpmWRy88i8doSXOBuu%2FyZ%2FYJrEaG6j28LGAITUIL39A2pTflSmmWlG%2BQZnj4tXjHLgEn9WNj3cRe0drdsYvBA0CubIimF3CCyWimECvAx3Lv8E9zpS6TkfGbtff6EJxidQgUWhFOi%2BGZ2QC7L1YyKavWc%2BSxlMcjyDKxzq%2FxgAfyxH7jCy%2FF5qG4mj0MyC9ClMlIopjA9UGnWilfo9SJTAMPkd%2BbY2y2eqJPWZi0R1%2BmD55E5bVxUVv33H5a40xi%2FlwrCQFuWC0on%2BuA0z0XXqbd0HFYPDRzVL5QW1CSWs7Og5rHoMPHe2c0GOqUBAhYJuGJO22RiGJ1EeDAc6dYGjZXq3j3bmgVzpt%2B3%2FLQ8DmcAYRJ2ppgFXJjtAr%2FWq6puLRugx1PMKyNf3RoJ4VekEXPz5m5jE1DxS%2FceymQZPjflWI0Oe%2F2zLgywDNSXElZ0idIj%2FDOLQYpkCsonHcCsrji1SFsU3n5Xf8qMPG0asnMxZUVrU9x1SmDbwrnk2NXGJwyiJgBFLqdwQLd1SF10PrNk&X-Amz-Signature=33043e161e5f96ab354113643b1eebf9517ade484a7155276192810ba97dc674&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666O3MVDHZ%2F20260315%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260315T122941Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGOrMeHu1kzs8alDWvrnVKQNy0XwbafyCwmOLpa%2FHyA3AiEAhjST6PuJkwAiMGYUwYDt%2FKbZ85Z7TDl3hbna6TIlO%2FsqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEuMAY%2Bp5qG3I5v%2FJCrcA%2F8i3FzSREt9PVOMV8bh1DP9vHSYgjlUWC2P6EJhb0TVe0shezicOT2pBflmvKR1SGkTwAPCQHtBPdMiQn3uthJB8h1Usyav3%2FdZ5K0eLO1FI16fEsAOmpr%2FU%2FJ4gVomCor0S475KWqrY1CUIGi7asd6Q6hYqpSiHIursw%2Fl5jVCvAW%2BiUr3cmN6pwZyb825PMVla213qKUz8lW2MCs6zdE1y4C2ADyP%2FJwUSIWS9m0P85A9JaHTe5Dhns3DchxV2uUw0ZTRRCZ8Ev265YSt%2Bv45IWYVK9y7yQpSOjdQFMiFaDYDFkj7HV3PXJMMOgVSpAW%2Fvbs7yYdFpmWRy88i8doSXOBuu%2FyZ%2FYJrEaG6j28LGAITUIL39A2pTflSmmWlG%2BQZnj4tXjHLgEn9WNj3cRe0drdsYvBA0CubIimF3CCyWimECvAx3Lv8E9zpS6TkfGbtff6EJxidQgUWhFOi%2BGZ2QC7L1YyKavWc%2BSxlMcjyDKxzq%2FxgAfyxH7jCy%2FF5qG4mj0MyC9ClMlIopjA9UGnWilfo9SJTAMPkd%2BbY2y2eqJPWZi0R1%2BmD55E5bVxUVv33H5a40xi%2FlwrCQFuWC0on%2BuA0z0XXqbd0HFYPDRzVL5QW1CSWs7Og5rHoMPHe2c0GOqUBAhYJuGJO22RiGJ1EeDAc6dYGjZXq3j3bmgVzpt%2B3%2FLQ8DmcAYRJ2ppgFXJjtAr%2FWq6puLRugx1PMKyNf3RoJ4VekEXPz5m5jE1DxS%2FceymQZPjflWI0Oe%2F2zLgywDNSXElZ0idIj%2FDOLQYpkCsonHcCsrji1SFsU3n5Xf8qMPG0asnMxZUVrU9x1SmDbwrnk2NXGJwyiJgBFLqdwQLd1SF10PrNk&X-Amz-Signature=ab414ed2af341fc7b5b33263c33967500f38872244f7fd0c7cb294ffda8c7b14&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
