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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z6EEXWIZ%2F20260526%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260526T143917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDZiwn2o95oP6DRGvyCzHVOGoOAuBp7j%2BcS5p%2B1wcbCnQIhAMHap8ToAylg%2BEa9Gq1AnDv6Z54ZnLlFtRwGVLn%2FRygyKv8DCHsQABoMNjM3NDIzMTgzODA1IgzwliNlyitWfUaPjj0q3AMdE5OzsxKi%2BNjIGgeuVJnpIk2riFT8OvZl6mN5p400rpv03dFw61cNRXC3BGkA4E%2Fpgv%2BnC%2Bs9lvwGTZqAD5AafgcUD2aZbOXQNErnzJicDW2z21yOBmpnzC7kXHiRO%2F145L%2BcscERHNFZeT4M62MzdeCpPLWgbbFBnkm7J4KuKT3xpNgPXvB434n8vDEsobxAqRTBFwM8uTK8ub5BoY65FQS6985kedpCDud9cz8QxX3B9AdXXLjMV9kIAoJxo4B3JRFIsAfrPp2voiv%2Flq%2BBEalbBkN%2B1uDhrkygsr5AsKg0pG01qiRmRRVy4PGr6P5qQdQtwohRK4ONsK1%2BuO8x76QMwxSfVZYWBsLNKveVvUGxLrOm6Ol6mKAA071DN4dScWVDUvq2oZgK6tYMSXkwYhwEJyG1j9CYNg%2FGoMWoTxpSpyEdGIYE%2BhEcfGC3H2BjfkOX%2FKypAGBQZTS0%2BHnblJjxXumlbZ3eDosrbe%2BxaKGE%2BlTPI0AfY62G5c5zQtzgPnFg5d4qo%2ByYIDEaJz%2FpPkudqDpz0%2BO5J3%2Bh9Wjc%2BHXTwOOMLQfZdQZEaWUb2AoOEXmCqqkix%2BCvhoYZTPv%2B6sx58C6zNXuhPSGOO8rBI79Au7N2rFjZ34AgMjCq19XQBjqkAcwfdxrRJ5KS3pQuMYd6JK6%2FzrhN1bCAWbDgR5p8uWSR0NqZenrTQFhpn%2BX0LAdM65%2BNW1z4QfUmMtWLLPTszs0WdD27B8OjZuH8moAHHP7Lkf48bRwmbeXhcfgGnSYoIH%2BuCEC17oe7t04Y81q3NTO3%2Fc5YI0cKkZnclTB57mixDnsBSmcsx%2FmmJpa3BY2W85aN%2Fl7KZMxP%2BZSSrvgh78WXhZqT&X-Amz-Signature=0279464e7a24668bc87340491f23b73d9b5b3ed4c7635beaf0a85e5215ff070a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z6EEXWIZ%2F20260526%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260526T143917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDZiwn2o95oP6DRGvyCzHVOGoOAuBp7j%2BcS5p%2B1wcbCnQIhAMHap8ToAylg%2BEa9Gq1AnDv6Z54ZnLlFtRwGVLn%2FRygyKv8DCHsQABoMNjM3NDIzMTgzODA1IgzwliNlyitWfUaPjj0q3AMdE5OzsxKi%2BNjIGgeuVJnpIk2riFT8OvZl6mN5p400rpv03dFw61cNRXC3BGkA4E%2Fpgv%2BnC%2Bs9lvwGTZqAD5AafgcUD2aZbOXQNErnzJicDW2z21yOBmpnzC7kXHiRO%2F145L%2BcscERHNFZeT4M62MzdeCpPLWgbbFBnkm7J4KuKT3xpNgPXvB434n8vDEsobxAqRTBFwM8uTK8ub5BoY65FQS6985kedpCDud9cz8QxX3B9AdXXLjMV9kIAoJxo4B3JRFIsAfrPp2voiv%2Flq%2BBEalbBkN%2B1uDhrkygsr5AsKg0pG01qiRmRRVy4PGr6P5qQdQtwohRK4ONsK1%2BuO8x76QMwxSfVZYWBsLNKveVvUGxLrOm6Ol6mKAA071DN4dScWVDUvq2oZgK6tYMSXkwYhwEJyG1j9CYNg%2FGoMWoTxpSpyEdGIYE%2BhEcfGC3H2BjfkOX%2FKypAGBQZTS0%2BHnblJjxXumlbZ3eDosrbe%2BxaKGE%2BlTPI0AfY62G5c5zQtzgPnFg5d4qo%2ByYIDEaJz%2FpPkudqDpz0%2BO5J3%2Bh9Wjc%2BHXTwOOMLQfZdQZEaWUb2AoOEXmCqqkix%2BCvhoYZTPv%2B6sx58C6zNXuhPSGOO8rBI79Au7N2rFjZ34AgMjCq19XQBjqkAcwfdxrRJ5KS3pQuMYd6JK6%2FzrhN1bCAWbDgR5p8uWSR0NqZenrTQFhpn%2BX0LAdM65%2BNW1z4QfUmMtWLLPTszs0WdD27B8OjZuH8moAHHP7Lkf48bRwmbeXhcfgGnSYoIH%2BuCEC17oe7t04Y81q3NTO3%2Fc5YI0cKkZnclTB57mixDnsBSmcsx%2FmmJpa3BY2W85aN%2Fl7KZMxP%2BZSSrvgh78WXhZqT&X-Amz-Signature=4c002b49df8e741c63e0fcb262ee0def328e41944bfdba57d6bf2321aaf110e4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
