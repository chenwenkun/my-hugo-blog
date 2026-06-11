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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662RYDTD34%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T100335Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJIMEYCIQCoRdmWFnJaZbteEm0BncPF5cSF5Y70WHZW7J0hD2%2Bw5wIhAITkUOqr1GglUgb6p5EKaLpzjpYPUW%2F0l7dBKr%2Ff7jmuKogECPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwT2YFRb7%2BkBrzxytEq3APXCLnZ9AWhAyZRA5Pb7r4PckD1%2F9sYXXeOoIsqF43tg72htnquJWL8UUPilqH7d7wLPvvTM5d%2F5hhr4N05sCtsRjyRYgDuRwSlv2BhhLAgc%2F9sXuomjA26DkQpmGOXwrXO0IJUkCOTiTBdPtsYN6Ao2v7Z%2FtqNVCi0k8dpZ8WEaOriHtyIb8Eif7KN%2BOUfICl7kw16tfu0rxRdKFNv0tSLs2IUTdYPFdieoFdx69cxZR6ISmd39OXOQKw46HeghJIRWOTV4PH7a3V7PN18MWR9mF1BzsAy9Mf2CaUzVuoMyNqkkfAMVeLf0aU1CjJ7D35S4qtKyd8ZAbY1mlGD8xpsPxLtRJbQVBbPf%2FmLnHt1yxM0WGZjlCK%2FLUyF4OthlBNMrNsu0VhXhEE6rrOa%2F%2BBnUGjn8JJJz2nTjQ9uixgjXtDJkMKveNSiowN6Vj5J4%2FjDe2q7RiIkuWigLg9jVYJXTxh7AvLH%2B%2BHeIJVJl3AN48dww9XKe5iia0FmOxyz0U7d3BSUU0S4lxSrpbhxgYv2FPv5bZKdqs0c76pqlBjdOw4e4aZVtzXKKLtcN3%2FjQTvMeHGSVhiwudELtpVWH24jxcoT1sGNBQ%2FKRuVCEBUQDyiECqvBbDSOmjp6%2FzDW%2F6nRBjqkAYuaYtAz4%2BPQJGaLKX3qgqJzwU7HWQtjOsRAOYAoZTFSMRItFvdRe1Nb42TakeI7feDJq%2FHQLzz5EWQkNVYNyAqCJFyU43AOBVjkRmxVa7AsCsZbAryBaJwl7NBHf5ahW52amP6psqK7o5a4YHU3JFS%2BawerX6kWOhPS6dugst1jdA9k6RcJ5f580ut%2F9lhPUvYFyRDGzbjn1mRo1%2FhZtQKpwIfz&X-Amz-Signature=3f6b15f2457c2f3ad701f0d1608f7538765ba4a456bc266ebfa0b3a08f65aee4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662RYDTD34%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T100335Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJIMEYCIQCoRdmWFnJaZbteEm0BncPF5cSF5Y70WHZW7J0hD2%2Bw5wIhAITkUOqr1GglUgb6p5EKaLpzjpYPUW%2F0l7dBKr%2Ff7jmuKogECPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwT2YFRb7%2BkBrzxytEq3APXCLnZ9AWhAyZRA5Pb7r4PckD1%2F9sYXXeOoIsqF43tg72htnquJWL8UUPilqH7d7wLPvvTM5d%2F5hhr4N05sCtsRjyRYgDuRwSlv2BhhLAgc%2F9sXuomjA26DkQpmGOXwrXO0IJUkCOTiTBdPtsYN6Ao2v7Z%2FtqNVCi0k8dpZ8WEaOriHtyIb8Eif7KN%2BOUfICl7kw16tfu0rxRdKFNv0tSLs2IUTdYPFdieoFdx69cxZR6ISmd39OXOQKw46HeghJIRWOTV4PH7a3V7PN18MWR9mF1BzsAy9Mf2CaUzVuoMyNqkkfAMVeLf0aU1CjJ7D35S4qtKyd8ZAbY1mlGD8xpsPxLtRJbQVBbPf%2FmLnHt1yxM0WGZjlCK%2FLUyF4OthlBNMrNsu0VhXhEE6rrOa%2F%2BBnUGjn8JJJz2nTjQ9uixgjXtDJkMKveNSiowN6Vj5J4%2FjDe2q7RiIkuWigLg9jVYJXTxh7AvLH%2B%2BHeIJVJl3AN48dww9XKe5iia0FmOxyz0U7d3BSUU0S4lxSrpbhxgYv2FPv5bZKdqs0c76pqlBjdOw4e4aZVtzXKKLtcN3%2FjQTvMeHGSVhiwudELtpVWH24jxcoT1sGNBQ%2FKRuVCEBUQDyiECqvBbDSOmjp6%2FzDW%2F6nRBjqkAYuaYtAz4%2BPQJGaLKX3qgqJzwU7HWQtjOsRAOYAoZTFSMRItFvdRe1Nb42TakeI7feDJq%2FHQLzz5EWQkNVYNyAqCJFyU43AOBVjkRmxVa7AsCsZbAryBaJwl7NBHf5ahW52amP6psqK7o5a4YHU3JFS%2BawerX6kWOhPS6dugst1jdA9k6RcJ5f580ut%2F9lhPUvYFyRDGzbjn1mRo1%2FhZtQKpwIfz&X-Amz-Signature=ed87644a271c3610f4135bc54a42ee90c027f22de2640ade1bc7157135b39abd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
