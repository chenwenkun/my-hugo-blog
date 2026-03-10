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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YAFMVNA%2F20260310%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260310T010530Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHAaCXVzLXdlc3QtMiJGMEQCIDAO3JZ6wMAVxcAH05v%2BBtAXD7hs%2BJRTXfZlC79PCt7ZAiB7CWVe3dgbgPpJW8ngagqB69CQJZ0WDujHVXFmOU%2BfDCr%2FAwg5EAAaDDYzNzQyMzE4MzgwNSIMCHBnVuRYufRXSHItKtwDJF5e%2FXwbPkJbl1NaKclvB6pYUeZlEDGDFNGS%2BpLChe%2FPuC3sjqkj4VjbwKYKuwoQPfmFNlx%2B6YC5SHN9ZnQ0G8MwkGEXC2ubdDHqUi%2B2GgMEcNc7vfAMi6A%2BzvEc8PKy1Vl7YW4GaSjcNBhjMxCY8FUnGvkCQ%2FRftpmqDxKTJ2H2cP%2BQiwD5aCEuaKELJfUAZJ92JFeF6iaNP4k2hRRTt2YMSNrTlRt2aDqXpJYM9IpM8KwjF3jVSRB%2BRR6Duc5r4vWEr7WDJvEDTlwrdjC4x14CUBTxtCyfZI6LBjbHUQpkmwWEfL3jA7uH1yCE%2BFCJnkElGGWLPYMoxtlaIw44iuV1G3J26d%2BYe5GJQ35dP5GgNkLOHExhS4hz%2FsZANA4PP6wTYIiCRNcgqAGs6R5ZxB8vaQtRASvefag7vTzjs66MNOnEfhrMb3SmqvpV2rA5ZjWmHVw13R0wdedf4ceAKMR4oK5qRVJarLHVHyKDNCTGjlXMRQjFIxAaTNuPhOTGPngXdT0SGxcI8pr7TE5E%2BBZNwKK%2FBACkTKihT2FbyYgOGhyqnQ%2FJfudQRGloV1HGIQ5%2B%2Fc0%2F0xIccVybjoPMD8ekPOYjEeo%2BAT%2BMk%2BESMtstSCW7NtaMHTz3Q04w%2FbS9zQY6pgFxhcEdik7zgiliG6nRB9uql2VKx8fKW5Qj%2F1UBM9qaWGYJK%2BhTbZexBypWp8cq9FwXYQqJPEIHIIGaZz41tu3BWlSnTD57XjjvS2XjLsnPbT7C2kHaYoL%2Bo9lbLdSDr1FG6%2Fw5I9DhTf%2F6AGDeoAEnKN5pKo36qpONygS7Unbkp28PRBf3AXWbbwAUkzIZHiqNMErbfPBbbJuGxWuhjPd4czfLr1V8&X-Amz-Signature=8e0129d38a1b9d27fb39b8c6b5afc731804a3c52337f917148abca3cb267cbe3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YAFMVNA%2F20260310%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260310T010530Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHAaCXVzLXdlc3QtMiJGMEQCIDAO3JZ6wMAVxcAH05v%2BBtAXD7hs%2BJRTXfZlC79PCt7ZAiB7CWVe3dgbgPpJW8ngagqB69CQJZ0WDujHVXFmOU%2BfDCr%2FAwg5EAAaDDYzNzQyMzE4MzgwNSIMCHBnVuRYufRXSHItKtwDJF5e%2FXwbPkJbl1NaKclvB6pYUeZlEDGDFNGS%2BpLChe%2FPuC3sjqkj4VjbwKYKuwoQPfmFNlx%2B6YC5SHN9ZnQ0G8MwkGEXC2ubdDHqUi%2B2GgMEcNc7vfAMi6A%2BzvEc8PKy1Vl7YW4GaSjcNBhjMxCY8FUnGvkCQ%2FRftpmqDxKTJ2H2cP%2BQiwD5aCEuaKELJfUAZJ92JFeF6iaNP4k2hRRTt2YMSNrTlRt2aDqXpJYM9IpM8KwjF3jVSRB%2BRR6Duc5r4vWEr7WDJvEDTlwrdjC4x14CUBTxtCyfZI6LBjbHUQpkmwWEfL3jA7uH1yCE%2BFCJnkElGGWLPYMoxtlaIw44iuV1G3J26d%2BYe5GJQ35dP5GgNkLOHExhS4hz%2FsZANA4PP6wTYIiCRNcgqAGs6R5ZxB8vaQtRASvefag7vTzjs66MNOnEfhrMb3SmqvpV2rA5ZjWmHVw13R0wdedf4ceAKMR4oK5qRVJarLHVHyKDNCTGjlXMRQjFIxAaTNuPhOTGPngXdT0SGxcI8pr7TE5E%2BBZNwKK%2FBACkTKihT2FbyYgOGhyqnQ%2FJfudQRGloV1HGIQ5%2B%2Fc0%2F0xIccVybjoPMD8ekPOYjEeo%2BAT%2BMk%2BESMtstSCW7NtaMHTz3Q04w%2FbS9zQY6pgFxhcEdik7zgiliG6nRB9uql2VKx8fKW5Qj%2F1UBM9qaWGYJK%2BhTbZexBypWp8cq9FwXYQqJPEIHIIGaZz41tu3BWlSnTD57XjjvS2XjLsnPbT7C2kHaYoL%2Bo9lbLdSDr1FG6%2Fw5I9DhTf%2F6AGDeoAEnKN5pKo36qpONygS7Unbkp28PRBf3AXWbbwAUkzIZHiqNMErbfPBbbJuGxWuhjPd4czfLr1V8&X-Amz-Signature=27b7f0bd9f2e9e40c41f40022ff771c6e85ec3b0ecb180f2ad721d220a442e4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
