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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGOE6BQ4%2F20251111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251111T005423Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIDN46OlXMMdpZspglF6Yy4KfdzljkGRBdvMf7HyHSzReAiEApeTZyH8OyVAXw0JimZwMZ0RG1zBwRXDBYMpu%2BhUdhxcq%2FwMIERAAGgw2Mzc0MjMxODM4MDUiDBRkrYSRNGW13PQQTircAxI3qXdN5ImIx5iT8phxUyhJ%2BFrCHRgaaMCdlStTjOsI8Tl65j2r0fyNSe69lznfPiB7ylZZ7GpS0%2Ble6Q7fElaDwwUgCkS4mfUNO2Xc7crkZFtkJbRPzchFkPZLSoHKBSRoFW8p92es8YVj18YfHdDgEwXBAnb%2BpnvYgrcEAfDpewpUQfpxr3MXNXlwmGb%2BU5YBj0IrsdjuNnT2mnvjy5brCJeLBLbRl%2BB99wO64S5B%2BqJ%2BTxlsYRzJQqZ0Bjv3Fib4DRRueh95FzQ9Xr1mG0BaWeGYcxoj9sk6%2FEZ2Ay%2Bf3ZtvY4ifIIxH0OHAjy7vWafMcV7cw7B8reBxCrGqgOQ78MTCPjCs%2BtotBQCtd%2BCda5XlhQi38P%2FvCnpbrQoivgzTKmOv5oCFxVbOPa%2FpL0fAA4SWVyua1oNA6ohtJdf8Xidbm2T5Tsf7VvaQgSORGeVrHKbYZtMhm6Vv7IIiKsBAy62EzJdXaawJJ7JsPesJZxoQRsF07x9C0yr1pFXUO9Zu9se7MHfvmvvY5TTkZ%2FnD3ELBy%2Fg9xe46tM2GDPrhVonAO0pMHq2PNjUJghAmdlI%2FmSewDKwgVWSn8lFan8fekZvNN5YK2n%2Bz0yz48YQkOrHYGL2%2FBUPZ5P%2FPMOT8ycgGOqUBtr9G%2Be%2BMFefxbsrf7KqDlB1V0F82oUs1VBXE1vA5iaxsYVYoUoYX%2F7N%2Bj1mshkHLUD%2BmCEnxUTjczpNTKT9hJwXg4x2RslCz9AtEWVy5UeJdei3s54QxscnaMA1JeoIayHMHQs2r%2FTddrq3%2FjJFcsr%2BSKf622ync5oIzue2wtu%2FTykeAoxOOzvIJBYRt2%2FmEp30d2PnZQZtKm7YeIoJ1JeC0SPFk&X-Amz-Signature=c66f13c9c59d4e7f831cce2ea43bfcc89e60f413135d72e087a3f405dd78d393&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGOE6BQ4%2F20251111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251111T005423Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIDN46OlXMMdpZspglF6Yy4KfdzljkGRBdvMf7HyHSzReAiEApeTZyH8OyVAXw0JimZwMZ0RG1zBwRXDBYMpu%2BhUdhxcq%2FwMIERAAGgw2Mzc0MjMxODM4MDUiDBRkrYSRNGW13PQQTircAxI3qXdN5ImIx5iT8phxUyhJ%2BFrCHRgaaMCdlStTjOsI8Tl65j2r0fyNSe69lznfPiB7ylZZ7GpS0%2Ble6Q7fElaDwwUgCkS4mfUNO2Xc7crkZFtkJbRPzchFkPZLSoHKBSRoFW8p92es8YVj18YfHdDgEwXBAnb%2BpnvYgrcEAfDpewpUQfpxr3MXNXlwmGb%2BU5YBj0IrsdjuNnT2mnvjy5brCJeLBLbRl%2BB99wO64S5B%2BqJ%2BTxlsYRzJQqZ0Bjv3Fib4DRRueh95FzQ9Xr1mG0BaWeGYcxoj9sk6%2FEZ2Ay%2Bf3ZtvY4ifIIxH0OHAjy7vWafMcV7cw7B8reBxCrGqgOQ78MTCPjCs%2BtotBQCtd%2BCda5XlhQi38P%2FvCnpbrQoivgzTKmOv5oCFxVbOPa%2FpL0fAA4SWVyua1oNA6ohtJdf8Xidbm2T5Tsf7VvaQgSORGeVrHKbYZtMhm6Vv7IIiKsBAy62EzJdXaawJJ7JsPesJZxoQRsF07x9C0yr1pFXUO9Zu9se7MHfvmvvY5TTkZ%2FnD3ELBy%2Fg9xe46tM2GDPrhVonAO0pMHq2PNjUJghAmdlI%2FmSewDKwgVWSn8lFan8fekZvNN5YK2n%2Bz0yz48YQkOrHYGL2%2FBUPZ5P%2FPMOT8ycgGOqUBtr9G%2Be%2BMFefxbsrf7KqDlB1V0F82oUs1VBXE1vA5iaxsYVYoUoYX%2F7N%2Bj1mshkHLUD%2BmCEnxUTjczpNTKT9hJwXg4x2RslCz9AtEWVy5UeJdei3s54QxscnaMA1JeoIayHMHQs2r%2FTddrq3%2FjJFcsr%2BSKf622ync5oIzue2wtu%2FTykeAoxOOzvIJBYRt2%2FmEp30d2PnZQZtKm7YeIoJ1JeC0SPFk&X-Amz-Signature=6b3ac1058dc1fb8ac809523c9021252b9da2330142524f5ba6ea6e28c53649cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
