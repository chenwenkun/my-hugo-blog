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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665WWPETOV%2F20260708%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260708T190505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDn%2FqL7WJZCoMT7bnql9bfZW4qJAdUtXT7CgYRbz9zHpAiEA%2Bnb4%2FjEGCfa43xP%2FnPS6TfoipRr1FmM7p4nraRbwkugqiAQIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHewkW9aGksMvmZl8SrcA8HxCsJ8G5V3zQboFNbrC3Jk%2BIbCdClHnx3Ohhbf%2FKdIGjhHs0627%2BjNuDT0ISQ%2B35ESh8wg6Otxju1G7SUqPnki6c6DQzZPyfAdlWMe8tyW2bUD17sLgTlEy2HfwNKOrsQXei1ZD%2BJNsDEprb2MdYwsXvTEtiX2NDrQ68znpEDdmAoeEixGle6RKanQnzDyhRa%2FVbFS0MFZ3Rg0FTb8wRL0M0IVO3At%2FnuV1lXDlUosB08WkKXzGUkmnuS3kNLACpKTqp5L0HnB1Jl10dy0kuQYq1p39ZizQEGF9Jjd%2BVywzUewLzdKQxv9XrOYwEApYxtkoAgH05U0vFYRHIaJ5RsLr%2BIK9vlPnzpACZGDrtTDEj%2FYV4BfjxxgwotN7PU59s%2FHG21Z2FRuFr%2B1Nsyo6rpAcrDog%2B8JVckuAmBPpT%2FgrxJdFToLVY%2F61J60bbOKsF8h06k963nF002kBsoGGrbzF1EbrKkQfQRfsLRXVlVT8Sar73y5APk%2FOuu0BkH%2F%2BF9CxNjyQwZWKJjm7WT8fOrzXLUdsaYOOj0lBqD3wJHQ9tiOlU%2FD8Ko3jMwRGIU6jO6voS2XUL8ZX89XCShc7AG0KN9G8kHyNy%2Fdadt7cAcBjmQvArhBJuBYyaEdMNSQutIGOqUB794H6MiK4tVlkKR6Ke8lZqx3s9o%2BpN8st38X4Et5UWo%2F%2F4qGHDUiz%2FD5YiKUV2YFZ2Ga%2FyWhhkCtnpmTZ1UTpCpB4HGWYfa5qfJlpX%2FFDRwKq1XTEb8bUTbNcuLXFJ1Y3gAcz7uIpB%2Fp5hDURV7ht70mDw01AVIT7q0P7yMYGJxkSWXPrDYMQBizrFlOfyhq82IZWtYM5BeeiABzlnfwt99E0v1M&X-Amz-Signature=105d7870533e9cad9238cfc44682de541172ed3a3e35ae9f9c918fc2b639acb3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665WWPETOV%2F20260708%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260708T190505Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDn%2FqL7WJZCoMT7bnql9bfZW4qJAdUtXT7CgYRbz9zHpAiEA%2Bnb4%2FjEGCfa43xP%2FnPS6TfoipRr1FmM7p4nraRbwkugqiAQIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHewkW9aGksMvmZl8SrcA8HxCsJ8G5V3zQboFNbrC3Jk%2BIbCdClHnx3Ohhbf%2FKdIGjhHs0627%2BjNuDT0ISQ%2B35ESh8wg6Otxju1G7SUqPnki6c6DQzZPyfAdlWMe8tyW2bUD17sLgTlEy2HfwNKOrsQXei1ZD%2BJNsDEprb2MdYwsXvTEtiX2NDrQ68znpEDdmAoeEixGle6RKanQnzDyhRa%2FVbFS0MFZ3Rg0FTb8wRL0M0IVO3At%2FnuV1lXDlUosB08WkKXzGUkmnuS3kNLACpKTqp5L0HnB1Jl10dy0kuQYq1p39ZizQEGF9Jjd%2BVywzUewLzdKQxv9XrOYwEApYxtkoAgH05U0vFYRHIaJ5RsLr%2BIK9vlPnzpACZGDrtTDEj%2FYV4BfjxxgwotN7PU59s%2FHG21Z2FRuFr%2B1Nsyo6rpAcrDog%2B8JVckuAmBPpT%2FgrxJdFToLVY%2F61J60bbOKsF8h06k963nF002kBsoGGrbzF1EbrKkQfQRfsLRXVlVT8Sar73y5APk%2FOuu0BkH%2F%2BF9CxNjyQwZWKJjm7WT8fOrzXLUdsaYOOj0lBqD3wJHQ9tiOlU%2FD8Ko3jMwRGIU6jO6voS2XUL8ZX89XCShc7AG0KN9G8kHyNy%2Fdadt7cAcBjmQvArhBJuBYyaEdMNSQutIGOqUB794H6MiK4tVlkKR6Ke8lZqx3s9o%2BpN8st38X4Et5UWo%2F%2F4qGHDUiz%2FD5YiKUV2YFZ2Ga%2FyWhhkCtnpmTZ1UTpCpB4HGWYfa5qfJlpX%2FFDRwKq1XTEb8bUTbNcuLXFJ1Y3gAcz7uIpB%2Fp5hDURV7ht70mDw01AVIT7q0P7yMYGJxkSWXPrDYMQBizrFlOfyhq82IZWtYM5BeeiABzlnfwt99E0v1M&X-Amz-Signature=7055449a21c3a9c16cb6365fe56d0eabbc9b635ebafbeebb3893f704165d3392&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
