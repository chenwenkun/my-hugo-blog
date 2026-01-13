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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RKUCXL2U%2F20260113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260113T005439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJIMEYCIQDdTk3TV5rKsyrS%2FJRYdtvGj7fBvuxAOvbiNxrTSr9LMgIhAIPD4I9BwOgDXnQX0mlTIEbRa0b3PPhmEAkYVq%2BJUB5LKogECPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy%2BNKAXymt14oPrVBsq3AMKcGaqux3oO7a72O5oUI%2F4qo1Hf40xoO8SohYnU%2BUfCbLGL2VtHMp0asWx2TODjMfRp%2FYHajB1sdaOwpHmdEfrgStEnEn6AAkk2d2Elz4sI8dXNCd2%2FSBbPDuv6ZshIrABUuPzYsdjWTlH1dGdGHZ%2BrMzciCqKoxAYhl3s6mVEcjwikJjy83b1zLyQEWOZTGZpE7mgg1qO%2F7XrIa4wexVGzDOiMZ1WRo8VRdH4IdDQ2jV6D9GgAEffNbuJve%2BQDzFd7DyhLhUyx28XpEw8tgRoJo5SsLE2Ynp5LmhygBAPD5qECIpWET%2BHAc4%2FtOexKeruPXq4EnJmS3oCyukRqEkiMWB41D74bRzsgE2Q%2BMDPpHwjwTMUCYtH%2FRmLPLFSgCu9GhhxElMyb2ROVRA76jdBZd2VH0S6FKwMIWhMPLVzHLUVT6FMcmJ07ZjAf4cCgWcCTT3LZngaYhMOk9i59uMfMhMZnijCR6hPlGMmlAqLDsdqJ2vNwDuGfdxO07lyx0I9MPRaMCFeKT6yjubdnbwQ3imMhqf0%2Fdpl0H71ZkwbXOJsuFZg70v%2FtSXWPYM1M6XpFQODKeeGY%2F%2FqPxod2tgjCnl%2BJYaqQeYdBIdLZOpKjo44MFZ8Nbtsx2ip4TDTqZbLBjqkAWGq4GwR%2BREMZ9uQnb0rHV3egFlNxV4ydZ1G8AqhHujS0U8TC3Q2kF2XvurfajLwc%2BmCfGLkjZ%2F9cPKgg29hjOCUx5qM15szh8xrEg08Jly0%2Be1xgokbwX5ZxjYXVzpD%2BOqS9keTt9wIf4foNurIkIVEnKoajokes3eDArHkBXZz3R4r%2FlUb2RGCO4tDjvXAXRlbmbdXeXmGY6n2biwCj0yMUlqH&X-Amz-Signature=c608ddb7b6be5693a227ac0bb3f56ed5eb0efab7edcbfec8fdc97a10fcdb6e62&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RKUCXL2U%2F20260113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260113T005439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDEaCXVzLXdlc3QtMiJIMEYCIQDdTk3TV5rKsyrS%2FJRYdtvGj7fBvuxAOvbiNxrTSr9LMgIhAIPD4I9BwOgDXnQX0mlTIEbRa0b3PPhmEAkYVq%2BJUB5LKogECPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy%2BNKAXymt14oPrVBsq3AMKcGaqux3oO7a72O5oUI%2F4qo1Hf40xoO8SohYnU%2BUfCbLGL2VtHMp0asWx2TODjMfRp%2FYHajB1sdaOwpHmdEfrgStEnEn6AAkk2d2Elz4sI8dXNCd2%2FSBbPDuv6ZshIrABUuPzYsdjWTlH1dGdGHZ%2BrMzciCqKoxAYhl3s6mVEcjwikJjy83b1zLyQEWOZTGZpE7mgg1qO%2F7XrIa4wexVGzDOiMZ1WRo8VRdH4IdDQ2jV6D9GgAEffNbuJve%2BQDzFd7DyhLhUyx28XpEw8tgRoJo5SsLE2Ynp5LmhygBAPD5qECIpWET%2BHAc4%2FtOexKeruPXq4EnJmS3oCyukRqEkiMWB41D74bRzsgE2Q%2BMDPpHwjwTMUCYtH%2FRmLPLFSgCu9GhhxElMyb2ROVRA76jdBZd2VH0S6FKwMIWhMPLVzHLUVT6FMcmJ07ZjAf4cCgWcCTT3LZngaYhMOk9i59uMfMhMZnijCR6hPlGMmlAqLDsdqJ2vNwDuGfdxO07lyx0I9MPRaMCFeKT6yjubdnbwQ3imMhqf0%2Fdpl0H71ZkwbXOJsuFZg70v%2FtSXWPYM1M6XpFQODKeeGY%2F%2FqPxod2tgjCnl%2BJYaqQeYdBIdLZOpKjo44MFZ8Nbtsx2ip4TDTqZbLBjqkAWGq4GwR%2BREMZ9uQnb0rHV3egFlNxV4ydZ1G8AqhHujS0U8TC3Q2kF2XvurfajLwc%2BmCfGLkjZ%2F9cPKgg29hjOCUx5qM15szh8xrEg08Jly0%2Be1xgokbwX5ZxjYXVzpD%2BOqS9keTt9wIf4foNurIkIVEnKoajokes3eDArHkBXZz3R4r%2FlUb2RGCO4tDjvXAXRlbmbdXeXmGY6n2biwCj0yMUlqH&X-Amz-Signature=517a902ad453e3ff9e3c425c3aec2cda33b4150bb6adb9151aa935b14887571c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
