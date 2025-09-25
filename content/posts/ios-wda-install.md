---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
---
测试系统 16.6 运行闪退

18.3 18.4系统正常安装

代码地址：

本来是 facebook 的项目，目前由 appium 进行维护

代码下载

先在xcode 构建一次，修改Bundle Identifier，勾选自己的 appleid

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TMS5RQ2U%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T074547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBgR7QcehSFASVGbj6BMlPK6cLQVQT7RQHFcxjnXjhuXAiAvzA63K3NXuHePmB754TIr%2BgQgYpLLfVM3Yh9irsN0vCr%2FAwhtEAAaDDYzNzQyMzE4MzgwNSIMMYtnv0wSY8IgE6fFKtwDpeFxRqIkM19TH4xdCoRpfrdwDSAt7O5olVKmTLL3bUR7o4EP9g17qGRZq23yeLBLVFEfiUzk%2F9caTpo%2FnywUtp%2Bm3sedIs6Y2zELe9pS9%2BiqTp3zXD7Y%2BiUDo9JkRNW3%2FSfTO9wZKDiHT%2BAcn3Dde6eDyNIjs720vOwNKu6rGLdkW4uxeDUkrbmpc9pgn6yQH0RRKEPl12ztxqd62n0lilv5C2QVCDBa7ofEOWddfmKvClUvOrzL%2B4g8MuPSYIEIaxcMQLp%2Btq6TXsT9tTB6dyUaCVEC4yTWSu%2FBxLMsb2HqaaKPG7EfhZgd6rpc8eX%2Bo3Sd61JzIWmkc7HV3ccxDR4v1Sl%2BzvQ6BVlDY%2FekCFAFfCa243MjSMtF1xcKq1OQfiMwkeiFS9ffGz6flv9AfLxhqYLN2P3MGuDN0gkna1mq7%2BoJFDiJqxaQjDLH7idXVkFxsJWwCb9skMN%2F6eULd2N96kFd1qQ7F8XF2YQazMFmK%2B6BEQNrIPH%2BobKBe1jdzKeLGGU73stzAY6wQ45%2BroweaEuwuzh3CI47TNyf42MeSvm0y8WMOPB7H6JyjKgnSn8y%2FqSAac%2BZhGwITZkOKug93A3DhjuXCANRi3nYz2rEhQVJNa1CvysqMbowx4HTxgY6pgEqtoZnDxbmM0SOzZRojc4E3Vp5s8Coxu6rrGCTxBLp%2FWah8KM4eKhdpYy3vlkIhx3NOmnnJofgHsPFWZCwn%2FLbWD%2FyS2qkIiu1gLhAjaWJ4xdGyIXWMNcewqqe0%2Bxt%2FZDC23wPuIqtp2sb2QGVm5d5chnab7%2B47%2BeUaSg8QI3O1myovZ9zhYoKS%2BL8%2FbUVnELkQoePWrKeFZQFxPYGYKR9FKFwrv%2Bx&X-Amz-Signature=169866720fdb524105a73b1839456a972dc93c7e4f42c3645dbac5713b213f8b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TMS5RQ2U%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T074546Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBgR7QcehSFASVGbj6BMlPK6cLQVQT7RQHFcxjnXjhuXAiAvzA63K3NXuHePmB754TIr%2BgQgYpLLfVM3Yh9irsN0vCr%2FAwhtEAAaDDYzNzQyMzE4MzgwNSIMMYtnv0wSY8IgE6fFKtwDpeFxRqIkM19TH4xdCoRpfrdwDSAt7O5olVKmTLL3bUR7o4EP9g17qGRZq23yeLBLVFEfiUzk%2F9caTpo%2FnywUtp%2Bm3sedIs6Y2zELe9pS9%2BiqTp3zXD7Y%2BiUDo9JkRNW3%2FSfTO9wZKDiHT%2BAcn3Dde6eDyNIjs720vOwNKu6rGLdkW4uxeDUkrbmpc9pgn6yQH0RRKEPl12ztxqd62n0lilv5C2QVCDBa7ofEOWddfmKvClUvOrzL%2B4g8MuPSYIEIaxcMQLp%2Btq6TXsT9tTB6dyUaCVEC4yTWSu%2FBxLMsb2HqaaKPG7EfhZgd6rpc8eX%2Bo3Sd61JzIWmkc7HV3ccxDR4v1Sl%2BzvQ6BVlDY%2FekCFAFfCa243MjSMtF1xcKq1OQfiMwkeiFS9ffGz6flv9AfLxhqYLN2P3MGuDN0gkna1mq7%2BoJFDiJqxaQjDLH7idXVkFxsJWwCb9skMN%2F6eULd2N96kFd1qQ7F8XF2YQazMFmK%2B6BEQNrIPH%2BobKBe1jdzKeLGGU73stzAY6wQ45%2BroweaEuwuzh3CI47TNyf42MeSvm0y8WMOPB7H6JyjKgnSn8y%2FqSAac%2BZhGwITZkOKug93A3DhjuXCANRi3nYz2rEhQVJNa1CvysqMbowx4HTxgY6pgEqtoZnDxbmM0SOzZRojc4E3Vp5s8Coxu6rrGCTxBLp%2FWah8KM4eKhdpYy3vlkIhx3NOmnnJofgHsPFWZCwn%2FLbWD%2FyS2qkIiu1gLhAjaWJ4xdGyIXWMNcewqqe0%2Bxt%2FZDC23wPuIqtp2sb2QGVm5d5chnab7%2B47%2BeUaSg8QI3O1myovZ9zhYoKS%2BL8%2FbUVnELkQoePWrKeFZQFxPYGYKR9FKFwrv%2Bx&X-Amz-Signature=cd8c9b12580c4f91190848c2ff47016c03e315cd27e39352197c7686e6b6ec6e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
