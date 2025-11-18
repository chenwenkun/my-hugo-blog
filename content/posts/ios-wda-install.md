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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S5VGVK6F%2F20251118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251118T005322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDfVpv5OBwkdhPA362z56upIhxd%2Fu5CLwU6AUZXg3XA0QIgXDPWpz9C6CAAQvqA4kpnY33RwWG9%2BJNaYbOrjjmwFasqiAQIuf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMxxrW%2FkCWqKw3xcfircA6tlO67RRh%2FlkXidlrfJilnP9%2Fk0wV60nqOnsPfLwaPJTAvbuaQWROYA15FUY0nWVkNzQHfrj%2BxCyTRm%2FKDp2%2Fb3NeF4fAKuLTSAGXNTp6BcjOiKdGkwpTtH6gG%2FQtcUQn5XgvZx9gBA8flISQ5BCB1ylucClxRjJKP%2FpFrmHTgTWRS4YmOXHT1pnqorCWZIHGoqGMVjI8zxJgVdqzF60N1Tco85%2BHqxKM%2FgGuralrH2zV057Kpw9TnNpuNPmtrMSpUITIAlA9skw8v%2FHJ9Y%2BzdASWC88pdCu5A2p57sX%2FoUMIthlgrH0WriqUynIYVHBds%2Fyc%2BqIMcApo8mSi95F%2FGK8%2BB9Ik74BhMsuaPz%2B4QsFobkIhgDm9F4Qaq68svUhyaXqN5MkvhxPCUU5%2BnicpuPlZ2G4cz6o5mzkvrvlrNG05J7f5KgPXosSn7Z4CuglQl%2B7ISYuahwnpqNeGaLZhFXGIN2Zwcu%2Fq62%2BmOOLoiJbxW2faJ6ngtl0xC2BWYVhmpanqNymYn%2B4jJigv620FQ0rQwDzDyK16UsqXVzajII8d%2FSke%2BqDsjWFXx6HTceGfHsxeiOBzpWKMnhMNHqcCflMfI8xKWY8BQ36T55OT4XxnThsYwEBeVBOIBGMKfy7sgGOqUBjqNMNmN%2BcO%2B5gbr7Ffjg3xKcIoRdbRuzTk7Nnq1ooNWvs208I6NzzkD17e15QHr2zp%2BYlUDW61%2BQ7u%2BX6KFIPctwQ%2BMB35aAY7lyIXKAmdAZbAf0AQ2BofDXnF7%2BRSEy3pDnR1dMJyuENdebs9lJ09d8AxPf07DguHTiA2%2FeFbohnbNeiSOlUu6X7q0LYsClofl0LclZAbtM3Uud1Tzxj1MAhaHP&X-Amz-Signature=ed77f530f3d1206e1a33421b7eca7ed4e6634387150b9def292a3172b23f27e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S5VGVK6F%2F20251118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251118T005322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDfVpv5OBwkdhPA362z56upIhxd%2Fu5CLwU6AUZXg3XA0QIgXDPWpz9C6CAAQvqA4kpnY33RwWG9%2BJNaYbOrjjmwFasqiAQIuf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMxxrW%2FkCWqKw3xcfircA6tlO67RRh%2FlkXidlrfJilnP9%2Fk0wV60nqOnsPfLwaPJTAvbuaQWROYA15FUY0nWVkNzQHfrj%2BxCyTRm%2FKDp2%2Fb3NeF4fAKuLTSAGXNTp6BcjOiKdGkwpTtH6gG%2FQtcUQn5XgvZx9gBA8flISQ5BCB1ylucClxRjJKP%2FpFrmHTgTWRS4YmOXHT1pnqorCWZIHGoqGMVjI8zxJgVdqzF60N1Tco85%2BHqxKM%2FgGuralrH2zV057Kpw9TnNpuNPmtrMSpUITIAlA9skw8v%2FHJ9Y%2BzdASWC88pdCu5A2p57sX%2FoUMIthlgrH0WriqUynIYVHBds%2Fyc%2BqIMcApo8mSi95F%2FGK8%2BB9Ik74BhMsuaPz%2B4QsFobkIhgDm9F4Qaq68svUhyaXqN5MkvhxPCUU5%2BnicpuPlZ2G4cz6o5mzkvrvlrNG05J7f5KgPXosSn7Z4CuglQl%2B7ISYuahwnpqNeGaLZhFXGIN2Zwcu%2Fq62%2BmOOLoiJbxW2faJ6ngtl0xC2BWYVhmpanqNymYn%2B4jJigv620FQ0rQwDzDyK16UsqXVzajII8d%2FSke%2BqDsjWFXx6HTceGfHsxeiOBzpWKMnhMNHqcCflMfI8xKWY8BQ36T55OT4XxnThsYwEBeVBOIBGMKfy7sgGOqUBjqNMNmN%2BcO%2B5gbr7Ffjg3xKcIoRdbRuzTk7Nnq1ooNWvs208I6NzzkD17e15QHr2zp%2BYlUDW61%2BQ7u%2BX6KFIPctwQ%2BMB35aAY7lyIXKAmdAZbAf0AQ2BofDXnF7%2BRSEy3pDnR1dMJyuENdebs9lJ09d8AxPf07DguHTiA2%2FeFbohnbNeiSOlUu6X7q0LYsClofl0LclZAbtM3Uud1Tzxj1MAhaHP&X-Amz-Signature=02e514514aba3a0d11567f9b80757a493cc3271c36cdcb490532ab8bb8159207&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
