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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z2EOHQR6%2F20260121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260121T122727Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGiSVm%2FcBZAjcN8cFcUFqI1DAOK%2FpV8IPj1O3aB0uk74AiEAkSWUU7z4JuFzV4By5GiP%2FRfTFSwSoLwugwiy7QV4F6oqiAQIxf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMk0wjbPToqQctn3jSrcAzTGm4HW85GVspQPqH3GIfQRIOnKEbHZVs0JPCwM3rVjTCoJ%2BPmPdMM8U8Co5xVXFVQcZ4FebI3abilkPVSoqGJUDfjJFAocpfjFXpegS6hb9xMg%2BK7%2BoO%2F%2BcxzOIleoJFEyZcr1DdMkQsDII%2B3PHamCvjCneVQ5jk3Rk8kt5DbUtiL%2FPX73XimWPi%2BvbZC3ccvHwTud3g1HVqo%2Bj3VLRAR8q6EAhOOHbs5TXcXgnhkLEXV4we4swbJTJke%2BhHUJe1ii428s0G2bpB5Xj33kSYV2R0uwEkOS2p03d6xw%2FBk1OPNqYutr6FSkgemdBbybRvcUIwOoe%2Bw3gqQ70EGGXs7Lw2K5UvWYIASNohIHDkB%2B77BEvB8unaMHoXWiZbXeIgSjtLJjBLFD5diUoOX80ZI96LhQJJJnJ2DPSCAvwHyC95Snjmog%2FYLS9DUmCbZo2LwZ4bm1EyKpilcKkmUQy1cfuU0YzF9bJUXDpCXPHjzpHbUjjB4Q2L9hwLBvlFhJo%2FguLH3a%2BTT1XIvctfRkBGWqE2YPdrg56YDr%2FphqrZSRCO4LbU9hWxIaZ5sQxbrvIqtxoHEaETrKFdGC3P%2BG6%2BKSByYnpaDKtXM7lRR%2FyQmnV8fGS4cAzkdp%2BwtbMKLzwssGOqUBpjyKnP68mdeAJImzTzG7xpLWan%2FAcwLi%2BpIoSKTjRH5T4E9UvLA0DgwfG5Izlp9UW5uuy1XI0zUHqiNuzjht4WIoEdwPyJOefhg2EKdSKWiT%2BoV2ZGTWPjzT4gjS9SeMtOIrdkvWRPudGtYdBPY65rjkJm0AFuooolsWgNG3TxdtvLfnoeraUAAytHnF1lVxo0kb2Z4uqaoYY2rgPn2A6mr13mLp&X-Amz-Signature=263e55c017f40d1fac663e0256e1f9e2bd8685695a8bd2514dcf746b623bfbbd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z2EOHQR6%2F20260121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260121T122727Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGiSVm%2FcBZAjcN8cFcUFqI1DAOK%2FpV8IPj1O3aB0uk74AiEAkSWUU7z4JuFzV4By5GiP%2FRfTFSwSoLwugwiy7QV4F6oqiAQIxf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMk0wjbPToqQctn3jSrcAzTGm4HW85GVspQPqH3GIfQRIOnKEbHZVs0JPCwM3rVjTCoJ%2BPmPdMM8U8Co5xVXFVQcZ4FebI3abilkPVSoqGJUDfjJFAocpfjFXpegS6hb9xMg%2BK7%2BoO%2F%2BcxzOIleoJFEyZcr1DdMkQsDII%2B3PHamCvjCneVQ5jk3Rk8kt5DbUtiL%2FPX73XimWPi%2BvbZC3ccvHwTud3g1HVqo%2Bj3VLRAR8q6EAhOOHbs5TXcXgnhkLEXV4we4swbJTJke%2BhHUJe1ii428s0G2bpB5Xj33kSYV2R0uwEkOS2p03d6xw%2FBk1OPNqYutr6FSkgemdBbybRvcUIwOoe%2Bw3gqQ70EGGXs7Lw2K5UvWYIASNohIHDkB%2B77BEvB8unaMHoXWiZbXeIgSjtLJjBLFD5diUoOX80ZI96LhQJJJnJ2DPSCAvwHyC95Snjmog%2FYLS9DUmCbZo2LwZ4bm1EyKpilcKkmUQy1cfuU0YzF9bJUXDpCXPHjzpHbUjjB4Q2L9hwLBvlFhJo%2FguLH3a%2BTT1XIvctfRkBGWqE2YPdrg56YDr%2FphqrZSRCO4LbU9hWxIaZ5sQxbrvIqtxoHEaETrKFdGC3P%2BG6%2BKSByYnpaDKtXM7lRR%2FyQmnV8fGS4cAzkdp%2BwtbMKLzwssGOqUBpjyKnP68mdeAJImzTzG7xpLWan%2FAcwLi%2BpIoSKTjRH5T4E9UvLA0DgwfG5Izlp9UW5uuy1XI0zUHqiNuzjht4WIoEdwPyJOefhg2EKdSKWiT%2BoV2ZGTWPjzT4gjS9SeMtOIrdkvWRPudGtYdBPY65rjkJm0AFuooolsWgNG3TxdtvLfnoeraUAAytHnF1lVxo0kb2Z4uqaoYY2rgPn2A6mr13mLp&X-Amz-Signature=7c82cdd517ece86e7843bd33956fe486a937a98658d82121a919cf3bf23ac775&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
