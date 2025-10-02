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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666S4KCNQE%2F20251002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251002T004759Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEOqWseTkRHS%2BiBr2cAyNu9B3GZh03zU%2FllEe2yq7aeCAiEAihmIF1XXIIQQoc%2Bs8%2BiBXidxdtQ9%2B9LWZu9cgVYzl18q%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDCuE%2Bxte%2FnPqhrluACrcA2QH2vdZSi%2BEU0L6dFDc4ccgPyYfJn2TksSlMvXOZdDzrIybysDSpBfwATa4aIxd6NDkx055I5s7Lu06bK%2BtO1Ea%2FlyoO1cN545UsZjJbHaIzduYvBwBfcM1BNCQY660BPg0ZrZRxhxogWE0xktJUvQD7OzYLoJStZ5rc94QVlFbLl24nbbNta6GAHvPW3HFbbjHzKGjBn4ps7h%2FAhOwzRXsFzWXqjUL8BZqTJJTPnyRAm2k2JWfxZIEGR2S0Xg%2FiNVpoHg6HMGO5%2FmgY8H7C4wewFlGKg7FGaZH7P8Ncu6DANeEN7JoniKMmqvLcdmA0YinZ1DWa77M9p7YsZ3aSbMJR0I7KzwBwUpep%2FBX46Ck%2BHt82XrhTI%2Bf%2Fi%2Fjsdzx8CeOqwKcFHB06Nd5O7k6uR9sfXXyR2W%2ByEoHXslmrZoPCIois4QJOHAtgFHkY2mBQzoisjYOonAEFR7ncAagRNNKOMyrlO7nA7Rzk0kz%2BdJCvRinr2So1idwQ5Ac8AENdU6rijEiAQU7BT90CKemkGd0QPfuI7MyJ6%2FxSabEC6%2BZx%2Bj0v7jxy0EuPf0M6yaJWwCXSnwz6qGfxUkOTaBdy%2BeIa8yXRsIOdUeR23ugA5Oz5d1U7Bryzgs9hvXsMLyQ98YGOqUBdCu%2FMQPAzfz72M8ZB6Y%2ByyTpbn8knWA56EJwi3nNYrFM%2Fn%2FrGOSHbMsbAdj8tPskwKXfwldnRHXJPViJgY0y%2FWNpqmlk3grG4DmRFAEZ2%2FvDbqp901Ve4Yqi76uYUBUN7uY82kbbn%2BnK%2FqPSQPizXvzNoiMLyXGbI9CQGS4bdiCH3CSfCen4joqtxn0%2FJIcaDlf0JDy7YbVWkKwjsPX4SxogQczC&X-Amz-Signature=cd544d49bab500feac31efb5475cdad0833e6d4918d8013333b312a989c9cc0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666S4KCNQE%2F20251002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251002T004759Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEOqWseTkRHS%2BiBr2cAyNu9B3GZh03zU%2FllEe2yq7aeCAiEAihmIF1XXIIQQoc%2Bs8%2BiBXidxdtQ9%2B9LWZu9cgVYzl18q%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDCuE%2Bxte%2FnPqhrluACrcA2QH2vdZSi%2BEU0L6dFDc4ccgPyYfJn2TksSlMvXOZdDzrIybysDSpBfwATa4aIxd6NDkx055I5s7Lu06bK%2BtO1Ea%2FlyoO1cN545UsZjJbHaIzduYvBwBfcM1BNCQY660BPg0ZrZRxhxogWE0xktJUvQD7OzYLoJStZ5rc94QVlFbLl24nbbNta6GAHvPW3HFbbjHzKGjBn4ps7h%2FAhOwzRXsFzWXqjUL8BZqTJJTPnyRAm2k2JWfxZIEGR2S0Xg%2FiNVpoHg6HMGO5%2FmgY8H7C4wewFlGKg7FGaZH7P8Ncu6DANeEN7JoniKMmqvLcdmA0YinZ1DWa77M9p7YsZ3aSbMJR0I7KzwBwUpep%2FBX46Ck%2BHt82XrhTI%2Bf%2Fi%2Fjsdzx8CeOqwKcFHB06Nd5O7k6uR9sfXXyR2W%2ByEoHXslmrZoPCIois4QJOHAtgFHkY2mBQzoisjYOonAEFR7ncAagRNNKOMyrlO7nA7Rzk0kz%2BdJCvRinr2So1idwQ5Ac8AENdU6rijEiAQU7BT90CKemkGd0QPfuI7MyJ6%2FxSabEC6%2BZx%2Bj0v7jxy0EuPf0M6yaJWwCXSnwz6qGfxUkOTaBdy%2BeIa8yXRsIOdUeR23ugA5Oz5d1U7Bryzgs9hvXsMLyQ98YGOqUBdCu%2FMQPAzfz72M8ZB6Y%2ByyTpbn8knWA56EJwi3nNYrFM%2Fn%2FrGOSHbMsbAdj8tPskwKXfwldnRHXJPViJgY0y%2FWNpqmlk3grG4DmRFAEZ2%2FvDbqp901Ve4Yqi76uYUBUN7uY82kbbn%2BnK%2FqPSQPizXvzNoiMLyXGbI9CQGS4bdiCH3CSfCen4joqtxn0%2FJIcaDlf0JDy7YbVWkKwjsPX4SxogQczC&X-Amz-Signature=6b4cc0bc8fc05aca4d5d35fa87373b438237b1689dc7fb2adffaf396cbc8164e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
