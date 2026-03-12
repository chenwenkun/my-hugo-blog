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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VKTQDLIU%2F20260312%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260312T010330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBmdgAZYMRsGHbYuEJidix0YxVefqvsuXikJruGb%2BkB%2FAiBLmJkUzCw4%2FScVm11zUNVQWtDjTGKRhfiT7ZtjuxjCsyr%2FAwhpEAAaDDYzNzQyMzE4MzgwNSIMGeLMIjebXfVX1nGJKtwDXQJQdkRo5wSyfrIOcMZVF6Qu3WQ7dQX4u6wSa4SShLI%2FI5yeDN5c3IGFrG6b30HVXSMihDQE98LHcsH6Ua433gfakHZFW5ws6P12I5MXMN%2Blg2UotPj%2F9Jf9RD59Sdxh68NXom%2BPUYClLjQhRg9SmVAYWz3s3xxPF5WJElDOWzqRGkiD8CcvNu09mE1UlguBaA6YZmHG%2BgzqrYf0DPgRkVFB1LNzfF3SEBG2usMfIxnr8kwG%2BGUU%2BOvlbmc%2BJoSfhEICnCDsYzcwBcrS5R1X2JpCWfvOLjpEHnuFcvYhbwlWFk75MAQf3FVwFi6yu2qnz8tnuc%2BYD7EafY2OSqSIN9%2BU1b5UzpDP8QFF4M1BZ7Dvw34CnvNLO0LO8e8%2F2Ioy2qqZcyrpK2Sdi3BlkIcRVOMKgcgtGKING8jEJQ9o2WZ64QLQr%2BZsYWG%2Bp1X42d%2FoKOXBuz2DDQ%2FWlQRZ01qFSQgUo8%2FirltIPMsQMAwQJFU5ZusWZdMBLWuCslipP%2B8YtLHVWxk7oXfyxR8WUH3747m9uRP0LE3RH8HAz0HBDVxZf24TFj97TORK6S2VPENOid%2BR1c32OUnmbit1mx%2Fly%2BApwOJLkATBnEN8Keirm9TSHW6E4pwLVKLJiQww8IPIzQY6pgFEUpgt8wvA8W1%2BSgGOs%2BCClhjhNlpMEXKJu5tor8BNOvovZ5s2saTp7qcYyM5sPXOBW0OYoXFVx0fMoBzeVHOjdfbHgRceA5YXmacWTsLZGFtSPqAOl6cZMZy67lXSGJHbOXdTXlDSVjxUA%2BI3lTr75BPwJCmr184VqNQytaqUsVjjqEj8qDwfNHTZAOWFYRE4RNYyT%2BB10CU%2FdhfNqmNIeigvpm%2Fw&X-Amz-Signature=18a5ec489f75b75b81697ec78c94f6adcbe1580e5c50fed8f65791855d0295ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VKTQDLIU%2F20260312%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260312T010330Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBmdgAZYMRsGHbYuEJidix0YxVefqvsuXikJruGb%2BkB%2FAiBLmJkUzCw4%2FScVm11zUNVQWtDjTGKRhfiT7ZtjuxjCsyr%2FAwhpEAAaDDYzNzQyMzE4MzgwNSIMGeLMIjebXfVX1nGJKtwDXQJQdkRo5wSyfrIOcMZVF6Qu3WQ7dQX4u6wSa4SShLI%2FI5yeDN5c3IGFrG6b30HVXSMihDQE98LHcsH6Ua433gfakHZFW5ws6P12I5MXMN%2Blg2UotPj%2F9Jf9RD59Sdxh68NXom%2BPUYClLjQhRg9SmVAYWz3s3xxPF5WJElDOWzqRGkiD8CcvNu09mE1UlguBaA6YZmHG%2BgzqrYf0DPgRkVFB1LNzfF3SEBG2usMfIxnr8kwG%2BGUU%2BOvlbmc%2BJoSfhEICnCDsYzcwBcrS5R1X2JpCWfvOLjpEHnuFcvYhbwlWFk75MAQf3FVwFi6yu2qnz8tnuc%2BYD7EafY2OSqSIN9%2BU1b5UzpDP8QFF4M1BZ7Dvw34CnvNLO0LO8e8%2F2Ioy2qqZcyrpK2Sdi3BlkIcRVOMKgcgtGKING8jEJQ9o2WZ64QLQr%2BZsYWG%2Bp1X42d%2FoKOXBuz2DDQ%2FWlQRZ01qFSQgUo8%2FirltIPMsQMAwQJFU5ZusWZdMBLWuCslipP%2B8YtLHVWxk7oXfyxR8WUH3747m9uRP0LE3RH8HAz0HBDVxZf24TFj97TORK6S2VPENOid%2BR1c32OUnmbit1mx%2Fly%2BApwOJLkATBnEN8Keirm9TSHW6E4pwLVKLJiQww8IPIzQY6pgFEUpgt8wvA8W1%2BSgGOs%2BCClhjhNlpMEXKJu5tor8BNOvovZ5s2saTp7qcYyM5sPXOBW0OYoXFVx0fMoBzeVHOjdfbHgRceA5YXmacWTsLZGFtSPqAOl6cZMZy67lXSGJHbOXdTXlDSVjxUA%2BI3lTr75BPwJCmr184VqNQytaqUsVjjqEj8qDwfNHTZAOWFYRE4RNYyT%2BB10CU%2FdhfNqmNIeigvpm%2Fw&X-Amz-Signature=66fa749c973cd8723b7c27c30470492ca002de08cc47d597f08eef9616d49ebd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
