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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662VUPPVYG%2F20260501%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260501T185604Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJHMEUCIQCEj8%2FSz80miUyjkn0YoiVNVOazZCfvNJTCxA90szv%2B3QIgKtA4crvta86xUIOtgAheLNzJvgsrt%2F03JBFf7YrvKosq%2FwMIKxAAGgw2Mzc0MjMxODM4MDUiDF3MTmi5nOKQ4MWDfyrcA5kTRZOhvQa1gx%2BFC9E%2F2ERd7VbmdicwnSkoFFIySAupHVyW7VpvBK4eo7kxlgvcHVDBcnFJjxYD0OSVxcjGZDEWtdFCV2e4%2BbMi9imhPDtG3h1uuFjJKc%2F1o1PvZFpPi1f4Q3xNJY7E4zfS1K%2BlKxUm%2BtXAg1JDAfre%2FGKMz%2FUqNbVuaJoRGFUVpUpoCkPy6nJ10ZXM%2BYUqND%2BMBy2%2FA3lfKE7R6XIFGxzmtY2C35r6IFq0dp7Y5mJ%2FFmi7XFfHaPR9Ct1XJmHZKRBoekZFr%2FWuFVtw94PborPiyWadvW5QJm60Lp%2Bo6WL5tQK1bX2gN5L8bPJXLFruqp%2Fn6kRb1n54PzyBywKFkePOFUbGIzgEP%2FjpRnmLyiIEpTiXDu5GNJpXgdisHgM%2B8rGnFu7LmYE2EkEIgpU1ZcPQ0ZfPSRe0BlfLDo8BIOiRkMau92J5I4xACCJaloCY6c77Duo3Pvb05f2R23MsP4syefqSXt4Ht8Kp%2Fdq1rkbkKMKEM2JSeoh%2BzD%2FidyTGFRSE4e%2BbO%2FxBq%2BOU0eMzoFGishnQmak5Sc8VOzFEePKTj6av7iCUi8bk3xDaQIOv762DhoMYWtSBUJjGQ31kXHiBd%2FuGLeOy5%2B3nmrsLiH%2FVChLeMLzS088GOqUBDuLHN7FP1Bdr7XqPDfwKhqgrlnP5q20Q%2F9barqeUvrGRxKqpMR9SgfvYgtY9yhx8YNveGB3%2BnrKjEHT6uvqMshabjo%2FRd%2BdM9k29TtBd4j9NeMjRSpdc57E93v%2BPJMHMhTO5fkXh1QWsk7oevelNAZTHSvlGuBaw95RtVrqmqdfDyPNmJoXxBANbH957ix7mMiUFR30BVVdomr3QQjnCXCaxlFMX&X-Amz-Signature=63f77982dac6dbaa388f5238a03c5b23efa45589253bca1b162d53439e4138eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662VUPPVYG%2F20260501%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260501T185604Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJHMEUCIQCEj8%2FSz80miUyjkn0YoiVNVOazZCfvNJTCxA90szv%2B3QIgKtA4crvta86xUIOtgAheLNzJvgsrt%2F03JBFf7YrvKosq%2FwMIKxAAGgw2Mzc0MjMxODM4MDUiDF3MTmi5nOKQ4MWDfyrcA5kTRZOhvQa1gx%2BFC9E%2F2ERd7VbmdicwnSkoFFIySAupHVyW7VpvBK4eo7kxlgvcHVDBcnFJjxYD0OSVxcjGZDEWtdFCV2e4%2BbMi9imhPDtG3h1uuFjJKc%2F1o1PvZFpPi1f4Q3xNJY7E4zfS1K%2BlKxUm%2BtXAg1JDAfre%2FGKMz%2FUqNbVuaJoRGFUVpUpoCkPy6nJ10ZXM%2BYUqND%2BMBy2%2FA3lfKE7R6XIFGxzmtY2C35r6IFq0dp7Y5mJ%2FFmi7XFfHaPR9Ct1XJmHZKRBoekZFr%2FWuFVtw94PborPiyWadvW5QJm60Lp%2Bo6WL5tQK1bX2gN5L8bPJXLFruqp%2Fn6kRb1n54PzyBywKFkePOFUbGIzgEP%2FjpRnmLyiIEpTiXDu5GNJpXgdisHgM%2B8rGnFu7LmYE2EkEIgpU1ZcPQ0ZfPSRe0BlfLDo8BIOiRkMau92J5I4xACCJaloCY6c77Duo3Pvb05f2R23MsP4syefqSXt4Ht8Kp%2Fdq1rkbkKMKEM2JSeoh%2BzD%2FidyTGFRSE4e%2BbO%2FxBq%2BOU0eMzoFGishnQmak5Sc8VOzFEePKTj6av7iCUi8bk3xDaQIOv762DhoMYWtSBUJjGQ31kXHiBd%2FuGLeOy5%2B3nmrsLiH%2FVChLeMLzS088GOqUBDuLHN7FP1Bdr7XqPDfwKhqgrlnP5q20Q%2F9barqeUvrGRxKqpMR9SgfvYgtY9yhx8YNveGB3%2BnrKjEHT6uvqMshabjo%2FRd%2BdM9k29TtBd4j9NeMjRSpdc57E93v%2BPJMHMhTO5fkXh1QWsk7oevelNAZTHSvlGuBaw95RtVrqmqdfDyPNmJoXxBANbH957ix7mMiUFR30BVVdomr3QQjnCXCaxlFMX&X-Amz-Signature=3dc06d3c7eebba06cba0b752bf493d3adcea21df56342a723abad7ed7676dfff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
