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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666M3ADN3Z%2F20260710%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260710T015225Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHKHB5B6YgbBIZ%2FNpb%2F1OYhBsxz0QX6APl1pb6%2BGk%2FhlAiBr5b0%2F1tlHqKItwTsoI9LM1PQbceMp6DHn1SdVHZeiWiqIBAio%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTWCWdQQxvToLJYvFKtwDhyJrqf0xzn0ro4od60oRs0o71h5AKWTmSwfGgl0b0gWmTYM4%2B6GAq9siamf01TqM8gwnwSRcn1a6pt%2BR9kxsAKzEOxyE8gIM83aam%2BR0lQXCof0V0oRIylVCjoIcrV7ogXDy%2BuVvCazvUBeVvq%2BEOApYn%2BEwBPAJBLLK6BtqDuFbgLglqrOML73vCRWFieJWC5s0KubDKz6Ni2rUeIaQU9pV7NF%2BaYw1tuoXm5KRvqjEdBithL3m0mikPZEY4Db48ozYqxdJUiJU9lxGfRs5hgVqbpPAcQ2RpXXHho4drNyiyZRAN8O5MCo6ZCcBg0RuYbEs8ypv33onqN4ChQqsGzf%2BKjrwPPVCyvUS3TqSRWzzLmX%2F6SicD%2FmALyRgugKIwyvaMuQhCeMaDRmYKsWKxT%2BbT80OZzvsW68q5CmlM%2FrRonucqLYeYIIyqvTu%2FKnUbs3xMiD5fjYIpMnA5LPUqVqaL0qzB6VbO%2BSde3yhANbBK48Ffk0NIyK%2FgR%2FXh0OqD4WvL%2FVg4Lc8giGlbwePqa2E4hepZ32K6x5nBzCO0Lb%2B5rox29yJWOkWvmIDOgpU1jwXghg7ewVcVY24cmEXa1NcOPpVoSxSkkPRQ4JKNWOUxh%2FVLoymcNY7Ye0wocPA0gY6pgFhfoQR%2FkgsAuWwikk%2BPQHY4k5Dma7yy24XNH6a8ALu7jpgJ3v9LAL8IouxqUXHO9b2Ta6v0Qmh2WKoxitdtEWo6%2Bu%2FTyQeLSTsiCObqGF4%2FYHmYsZ782NEm%2BPkBx5%2FJ2KZ13z6nzjCV0uRQoFuo7E%2BSivSSuordAvBp%2BDWj7oRW6r2u6zf033s54rYn0FvYbrAZF3CXQqhq9fMhZw%2B7aeE7OjpSYP8&X-Amz-Signature=63833d4487949d2521a88dd68bf96ca9795b33af5821f87b8091670d9e54d589&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666M3ADN3Z%2F20260710%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260710T015225Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHKHB5B6YgbBIZ%2FNpb%2F1OYhBsxz0QX6APl1pb6%2BGk%2FhlAiBr5b0%2F1tlHqKItwTsoI9LM1PQbceMp6DHn1SdVHZeiWiqIBAio%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTWCWdQQxvToLJYvFKtwDhyJrqf0xzn0ro4od60oRs0o71h5AKWTmSwfGgl0b0gWmTYM4%2B6GAq9siamf01TqM8gwnwSRcn1a6pt%2BR9kxsAKzEOxyE8gIM83aam%2BR0lQXCof0V0oRIylVCjoIcrV7ogXDy%2BuVvCazvUBeVvq%2BEOApYn%2BEwBPAJBLLK6BtqDuFbgLglqrOML73vCRWFieJWC5s0KubDKz6Ni2rUeIaQU9pV7NF%2BaYw1tuoXm5KRvqjEdBithL3m0mikPZEY4Db48ozYqxdJUiJU9lxGfRs5hgVqbpPAcQ2RpXXHho4drNyiyZRAN8O5MCo6ZCcBg0RuYbEs8ypv33onqN4ChQqsGzf%2BKjrwPPVCyvUS3TqSRWzzLmX%2F6SicD%2FmALyRgugKIwyvaMuQhCeMaDRmYKsWKxT%2BbT80OZzvsW68q5CmlM%2FrRonucqLYeYIIyqvTu%2FKnUbs3xMiD5fjYIpMnA5LPUqVqaL0qzB6VbO%2BSde3yhANbBK48Ffk0NIyK%2FgR%2FXh0OqD4WvL%2FVg4Lc8giGlbwePqa2E4hepZ32K6x5nBzCO0Lb%2B5rox29yJWOkWvmIDOgpU1jwXghg7ewVcVY24cmEXa1NcOPpVoSxSkkPRQ4JKNWOUxh%2FVLoymcNY7Ye0wocPA0gY6pgFhfoQR%2FkgsAuWwikk%2BPQHY4k5Dma7yy24XNH6a8ALu7jpgJ3v9LAL8IouxqUXHO9b2Ta6v0Qmh2WKoxitdtEWo6%2Bu%2FTyQeLSTsiCObqGF4%2FYHmYsZ782NEm%2BPkBx5%2FJ2KZ13z6nzjCV0uRQoFuo7E%2BSivSSuordAvBp%2BDWj7oRW6r2u6zf033s54rYn0FvYbrAZF3CXQqhq9fMhZw%2B7aeE7OjpSYP8&X-Amz-Signature=930e200125867811def8a3413d8ddaba540738f7cc7e6c0e188eabfb85d25f4f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
