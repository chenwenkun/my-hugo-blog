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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664YWWJ7VG%2F20260304%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260304T010811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD1qJ3awtvkhBEY4nKzsFAwCm2opyVMtNKiHu7cXfzmHwIhAMwNtw2pGDjbCmuYjwzvygTdSl3BzdxFVp5RTPX2CtYGKogECKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgziBjk5gfjoII6OON8q3AN9H8xAJ3rmMNoHmclTcm5GlzF4im%2B1MD%2FKONCtkWbzF6jz%2B32fSLrDrI0VpIOlFVvEA5iMuJvmgI51aLLiLBEY5aG8f1GdHHs95KEpmPzAPcAvZnhRp3POJwddCnDLrk3%2FmJDZaMtKZNe8d2RdySma0zhXSlGGt25mIg0xRdmLqOVwMQRTcyXwRhr0kw%2BVUoDVZRadGDLfWzYQLhsBDd%2BM920bHOfe03YTFK%2B4MowO%2BossXAVYKJpgJ4EQGzvvjJGxX6s8r5mYzwsGWcHW1AxtmFite%2F3Rqbzenr3GRTvkf%2Fggx6aB0Mpy9imPRykM6OpZkecIUaJzb6TqdT9hzm3eRINSVLauLEjuTeIuecY95FV28ccEaDuCwjd9EOW8EPPeOlsx7VxECQ4rK2%2BCBK%2FwgRgrwh1NZMxRLfx7GLqrzeDuWwKtgOzuSDYpIznyKIbXFIa%2FuusureAqNFC%2FuWYgt6%2B%2B9482a1dc20WGJe13MWnjLNJ2dt0MgRUItPMTl0fr0mnmkIERuslTgPsZv8xZ1aoLVcfVB7jr2ing2xt%2Fnt1jFYisdZGSIdU5fQvfn0W4y5KrP%2F%2FQ3YpPcTmXtif78jCM76ZF%2BpgKQDJxDMK3dWaIu8UcdiBqVkqzfTDQ6p3NBjqkAZiRqJAonNcbW05oAROeQQJbzXuYj%2BjVQcu0h2ZeukMhCs0mwjvnqEBSHjP4lZbHvOV4SrVf8dQasKJxrMcmReuOHxfc5iuRTAflhYpyHfz1qoZHMpQY2wdXvMJlyLkibV0MWyLjh97O75XZ5CGXBJGtLmR5nO550g8MhvqwfSfg5OLoSrLsMpl7Up0diJBvamedQLYJE7zXfRcNhQvvkPozsLyM&X-Amz-Signature=b60c7df39535195088de0c4b7f354404e86a700c55f0a691f594acdec785b651&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664YWWJ7VG%2F20260304%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260304T010811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD1qJ3awtvkhBEY4nKzsFAwCm2opyVMtNKiHu7cXfzmHwIhAMwNtw2pGDjbCmuYjwzvygTdSl3BzdxFVp5RTPX2CtYGKogECKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgziBjk5gfjoII6OON8q3AN9H8xAJ3rmMNoHmclTcm5GlzF4im%2B1MD%2FKONCtkWbzF6jz%2B32fSLrDrI0VpIOlFVvEA5iMuJvmgI51aLLiLBEY5aG8f1GdHHs95KEpmPzAPcAvZnhRp3POJwddCnDLrk3%2FmJDZaMtKZNe8d2RdySma0zhXSlGGt25mIg0xRdmLqOVwMQRTcyXwRhr0kw%2BVUoDVZRadGDLfWzYQLhsBDd%2BM920bHOfe03YTFK%2B4MowO%2BossXAVYKJpgJ4EQGzvvjJGxX6s8r5mYzwsGWcHW1AxtmFite%2F3Rqbzenr3GRTvkf%2Fggx6aB0Mpy9imPRykM6OpZkecIUaJzb6TqdT9hzm3eRINSVLauLEjuTeIuecY95FV28ccEaDuCwjd9EOW8EPPeOlsx7VxECQ4rK2%2BCBK%2FwgRgrwh1NZMxRLfx7GLqrzeDuWwKtgOzuSDYpIznyKIbXFIa%2FuusureAqNFC%2FuWYgt6%2B%2B9482a1dc20WGJe13MWnjLNJ2dt0MgRUItPMTl0fr0mnmkIERuslTgPsZv8xZ1aoLVcfVB7jr2ing2xt%2Fnt1jFYisdZGSIdU5fQvfn0W4y5KrP%2F%2FQ3YpPcTmXtif78jCM76ZF%2BpgKQDJxDMK3dWaIu8UcdiBqVkqzfTDQ6p3NBjqkAZiRqJAonNcbW05oAROeQQJbzXuYj%2BjVQcu0h2ZeukMhCs0mwjvnqEBSHjP4lZbHvOV4SrVf8dQasKJxrMcmReuOHxfc5iuRTAflhYpyHfz1qoZHMpQY2wdXvMJlyLkibV0MWyLjh97O75XZ5CGXBJGtLmR5nO550g8MhvqwfSfg5OLoSrLsMpl7Up0diJBvamedQLYJE7zXfRcNhQvvkPozsLyM&X-Amz-Signature=2c2b7ea79ff84d5e995efd312f53cf627247dafba0077ef151f7c2f525084f83&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
