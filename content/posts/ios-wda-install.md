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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666PZK2FYW%2F20260201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260201T122626Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIGsyfYnM6nGJEY3GNGa1Lu2k0EWgFLDVybY70MOyqb9jAiBH4go2jIHdnMmLmED16J3YtlTXFizkI4FCRDWVElR4OiqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM6%2BoEbtnkbL%2FMMuQ%2BKtwDpEiDytX3WjRRjcvmCCBda%2F%2FDAthtbC%2Ft3VPBeIXmyZQ1aEimqdB7TSwiqBGKM1dAancYymO6fDtm8kWG2Z5Dxp2OloDTPEjieDTsDmuOLr2lhjDy9WnD5BbpVpqVHra7XBI%2FzoEdCy8swAxvAWcRGrbYpqpP79KoQN21TTRaA5ROONyKKBksspCjiCtBb%2Bz9Szo702z3CheOuSWozzEpD%2FP9tCApJsXNQoJTeWlvLKsQWKNby8rRnAuAQn0trZPNC5UeWI6VXoWhZWgmvEAJqUkZa8M%2BM0LwHgemy0bM%2BvU3Zd4NbYBPeOQldNkGKoYwMT2EapKkUlykbZs2GFSydAaoQkSQM%2FJ0%2BL1PEWMpVRn%2FTydfnTxldHwf6PtVx5DyT54%2FbnP2XWev3t1KfNW4SBovUdO05uJouiQJBa9DymOlU%2BWKTRacVz%2BBCecn084ux9IudNnAZNmI6hGkzk8hXjrI2Mme46Rgal6fZWST2%2FNP1nBHX53OczcVvvgtL%2BNx4bfLU0HZxv1vLP2ptp5n8l24ceJEpRqCH%2BK4QIe3MnLHNth3SL96O0IrrDcJRAjouZlEsHGAte6dePP7dUczaSw9%2BFP5TaKzfGtVa8ZqcWR%2FaWrq1jvsn6TeuLIwoen8ywY6pgHgxNyOtPPW7hG8QwZ0hUyr0rGKbkSFy2DNn06Ezn%2BMX%2BTfL82NfBDMNp9PwixHUam5rSXDe7R8e%2FnDNTI%2B0qAp0Fnl7QMa5548tXWqUiZHVE69oOJVP8RQ4Nno7s7x3JJHhMsRfIzjqXADuOIi4WQMKCHN26V%2BmxH3yyVIwg2Ep28pzHIMvL%2FIee9EBNlpo9%2FQfk%2FsX9JCHhziM%2FtYCMlq0e%2BIZAxT&X-Amz-Signature=f5117f16fa520d8e71e436a723ee9f69cd88353103c5b6233b8473611f64bdac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666PZK2FYW%2F20260201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260201T122626Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIGsyfYnM6nGJEY3GNGa1Lu2k0EWgFLDVybY70MOyqb9jAiBH4go2jIHdnMmLmED16J3YtlTXFizkI4FCRDWVElR4OiqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM6%2BoEbtnkbL%2FMMuQ%2BKtwDpEiDytX3WjRRjcvmCCBda%2F%2FDAthtbC%2Ft3VPBeIXmyZQ1aEimqdB7TSwiqBGKM1dAancYymO6fDtm8kWG2Z5Dxp2OloDTPEjieDTsDmuOLr2lhjDy9WnD5BbpVpqVHra7XBI%2FzoEdCy8swAxvAWcRGrbYpqpP79KoQN21TTRaA5ROONyKKBksspCjiCtBb%2Bz9Szo702z3CheOuSWozzEpD%2FP9tCApJsXNQoJTeWlvLKsQWKNby8rRnAuAQn0trZPNC5UeWI6VXoWhZWgmvEAJqUkZa8M%2BM0LwHgemy0bM%2BvU3Zd4NbYBPeOQldNkGKoYwMT2EapKkUlykbZs2GFSydAaoQkSQM%2FJ0%2BL1PEWMpVRn%2FTydfnTxldHwf6PtVx5DyT54%2FbnP2XWev3t1KfNW4SBovUdO05uJouiQJBa9DymOlU%2BWKTRacVz%2BBCecn084ux9IudNnAZNmI6hGkzk8hXjrI2Mme46Rgal6fZWST2%2FNP1nBHX53OczcVvvgtL%2BNx4bfLU0HZxv1vLP2ptp5n8l24ceJEpRqCH%2BK4QIe3MnLHNth3SL96O0IrrDcJRAjouZlEsHGAte6dePP7dUczaSw9%2BFP5TaKzfGtVa8ZqcWR%2FaWrq1jvsn6TeuLIwoen8ywY6pgHgxNyOtPPW7hG8QwZ0hUyr0rGKbkSFy2DNn06Ezn%2BMX%2BTfL82NfBDMNp9PwixHUam5rSXDe7R8e%2FnDNTI%2B0qAp0Fnl7QMa5548tXWqUiZHVE69oOJVP8RQ4Nno7s7x3JJHhMsRfIzjqXADuOIi4WQMKCHN26V%2BmxH3yyVIwg2Ep28pzHIMvL%2FIee9EBNlpo9%2FQfk%2FsX9JCHhziM%2FtYCMlq0e%2BIZAxT&X-Amz-Signature=eeb5b731a0a186812b5b81adc15759feda2766afdc93153d55892c3f89b90ee3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
