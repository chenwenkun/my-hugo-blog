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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WHXWXE2B%2F20260705%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260705T185959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLXdlc3QtMiJHMEUCIBC2pTZS1RmMvxCAGTpxAMqSJKj5dn4Or50v5txnHVRqAiEA6xAK7v413dcRHr9dZZ0W3H%2Fc4N0ooyDkzw7e8Wh1aFIq%2FwMIRBAAGgw2Mzc0MjMxODM4MDUiDHaUnuAeL7GgGUE3OyrcA5R1Ctpbx4836iNpgsa%2Fu71CsC%2B2bNZRpbtC1AardacDdFGpe9%2FvpjQ63RJ7P6PDUWiFEvxV1P0muJonAWvZVHZ6beLWVZsNhg7CXqh1uKxpf8KleoD2ThUDHODuLzqcAg0qjJQXML%2BXqh%2BbtfXo9YUiaSShbeeX5lLxQHuwFp%2FLb41OzA7bm3BVpahtVcsG2tiautiKDOa1JeBLyN6JSpRXgM4XmMBCoKkH0RD1qTYiQOjrLiXSwdgTQougn4D7oQmjISV2u9X3v87hnRPmLPgfV3eFU%2BBYshXz7OptRE2MiHoVD%2FYIM4z2owZ42lgKJxifZJ6OulWBpfsIG%2BGksAIB%2Bu4kKHN5qpFYuGu8OzpapovFcBbfVhi9LeVy3rGoiNO8rZSPLSVGM3YqjMA%2BQ5gfY0ygqRppFNuhQU7cePnG4rma%2BeulTo5q961DMIGbjv9lEeVLahZl05KZH0hgjJ57xShrSvrhBs7kDShk%2BFj%2BfTynXzxnpPXqwi9Cmhng69m8h1QZsHxXbJ7jjFRr7WNFFm6AKJcDPCr5REBzhTJx9w7q5KqU5Wth1IWBO134wl71KFxsTa9H%2BO%2Fv84ox3kFoOiitEWGAYMObRNyDi69XjQBfzmwXCMiNCaS4MMzRqtIGOqUBFKLZaMgM9nnwvLmQ0boF%2B4Sbors0cfjmqnugXrOlqwh1TTFoyWAJw7YL63au5WM50orvFAG0%2Fi17U3qyLjTx1822Mu6bBAKuLLeIFrsF4PNPV4H0fT%2BXjXjOw1GfTl4siX8ulF515Hh8QPXzE8%2Bk8FwLULjEmhXQmbGL7GfaDeKu0trhR8GDGpzwURb5zbzP4sHaXYB8VRLi08fgiDRuB2z8tpIz&X-Amz-Signature=bde2e53cdb1aa535bd6f74c338bb64b821dfbcfae48a8610175c7cf7ac397b3a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WHXWXE2B%2F20260705%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260705T185959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLXdlc3QtMiJHMEUCIBC2pTZS1RmMvxCAGTpxAMqSJKj5dn4Or50v5txnHVRqAiEA6xAK7v413dcRHr9dZZ0W3H%2Fc4N0ooyDkzw7e8Wh1aFIq%2FwMIRBAAGgw2Mzc0MjMxODM4MDUiDHaUnuAeL7GgGUE3OyrcA5R1Ctpbx4836iNpgsa%2Fu71CsC%2B2bNZRpbtC1AardacDdFGpe9%2FvpjQ63RJ7P6PDUWiFEvxV1P0muJonAWvZVHZ6beLWVZsNhg7CXqh1uKxpf8KleoD2ThUDHODuLzqcAg0qjJQXML%2BXqh%2BbtfXo9YUiaSShbeeX5lLxQHuwFp%2FLb41OzA7bm3BVpahtVcsG2tiautiKDOa1JeBLyN6JSpRXgM4XmMBCoKkH0RD1qTYiQOjrLiXSwdgTQougn4D7oQmjISV2u9X3v87hnRPmLPgfV3eFU%2BBYshXz7OptRE2MiHoVD%2FYIM4z2owZ42lgKJxifZJ6OulWBpfsIG%2BGksAIB%2Bu4kKHN5qpFYuGu8OzpapovFcBbfVhi9LeVy3rGoiNO8rZSPLSVGM3YqjMA%2BQ5gfY0ygqRppFNuhQU7cePnG4rma%2BeulTo5q961DMIGbjv9lEeVLahZl05KZH0hgjJ57xShrSvrhBs7kDShk%2BFj%2BfTynXzxnpPXqwi9Cmhng69m8h1QZsHxXbJ7jjFRr7WNFFm6AKJcDPCr5REBzhTJx9w7q5KqU5Wth1IWBO134wl71KFxsTa9H%2BO%2Fv84ox3kFoOiitEWGAYMObRNyDi69XjQBfzmwXCMiNCaS4MMzRqtIGOqUBFKLZaMgM9nnwvLmQ0boF%2B4Sbors0cfjmqnugXrOlqwh1TTFoyWAJw7YL63au5WM50orvFAG0%2Fi17U3qyLjTx1822Mu6bBAKuLLeIFrsF4PNPV4H0fT%2BXjXjOw1GfTl4siX8ulF515Hh8QPXzE8%2Bk8FwLULjEmhXQmbGL7GfaDeKu0trhR8GDGpzwURb5zbzP4sHaXYB8VRLi08fgiDRuB2z8tpIz&X-Amz-Signature=78144e7b92a8a20302fd122eb3c4c17f72e36fa52574af1633cf3dbd8bad2dfa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
