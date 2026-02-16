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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYLYDK7E%2F20260216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260216T065210Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCAr3ciHJ2hO3C7X00PnJ11dQSAkmlvE1EC3nXqA0ALzAIhAPttcD%2BUY6NOlkDAouGdQJX5RQuXkfmKIaQ8J20DH5E4Kv8DCC8QABoMNjM3NDIzMTgzODA1IgzXTcWV1MrfX5hpvRkq3APEu9%2BPB%2FbAN7EwL5HRpDn%2BkM%2FSesUW49LMmWXXG1wUzgxdcH4Ye1CgIS%2B5VCeGB12UHiSfphURRYFosVcAndHfBo4M%2FLGWBxwVtckpIYQWGchd9GngsOpIXMLDd68f%2B0e9D5gcf6GDpSA29jP5f3y%2FjAThB6xaNP1CMFW%2FB3kwm0LEQfY5LWztaF7xqv57fyPcikMRhr1%2BA%2FlBrNebjj%2BNHUGJA76mAaiqPYu2%2F37sgSNfdbbebGFnyYwsPVZSw9kitKgTgOeycGugxblTQs9U0id8wFIFR2uBpFh%2FJCXk%2FOtB1QwJpCW5yUP%2BwWXTXRSBCiHimcSWXIEjSRcFmxcSJ8TTecTua23MXoq146eWZcTDZ4%2FphaZFyn12ZXWJBpxfpTx81Cm%2BtinJsvoB85K7TAUb%2FhYLYGAwP4UkB80hvQaVONbaS2FHWztKi0D4YsM3sDREK%2BUHzFRSugsXjKdYjJtQSRKfv7AMYHSVGleUlEn5HQHJrOrBO5UoZkemJlQpyHK13Kn6ZaDzmiXlUtZrF7SzFl0%2BXon%2FIv0iLwEa69z2L7%2BPStAdunSr1CBk%2B%2FamxJECSIRi%2BZekGN%2FvfYwENcG5gKW74H7EOYJIiaKdCwycAA3%2B862aKpi5DDCu2crMBjqkAauFeJ1s8jUTZioDvglF%2BePnQ3QrzeyuZJvLdrI38aJEQjKOzrwM8d%2FMOar20ltcLjQP4H012w9DKTp40fryA7NCgJjU8R873uBEj1P9Dw38u9DzOZAwSX4loSlZPzWbkfp%2F4XNJtMtGTJnNKhXPXzlI2yPr6FAEyeQU%2BpjSYH8GZ3595cFVULol4iUHhM6DunMcQhBbiZ6aYFg5%2FoPxq3mTCQ6P&X-Amz-Signature=1d59d438af3358fc5ac827d150d50ee6df6875a3bf05513d0df1620ba1d22659&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SYLYDK7E%2F20260216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260216T065210Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCAr3ciHJ2hO3C7X00PnJ11dQSAkmlvE1EC3nXqA0ALzAIhAPttcD%2BUY6NOlkDAouGdQJX5RQuXkfmKIaQ8J20DH5E4Kv8DCC8QABoMNjM3NDIzMTgzODA1IgzXTcWV1MrfX5hpvRkq3APEu9%2BPB%2FbAN7EwL5HRpDn%2BkM%2FSesUW49LMmWXXG1wUzgxdcH4Ye1CgIS%2B5VCeGB12UHiSfphURRYFosVcAndHfBo4M%2FLGWBxwVtckpIYQWGchd9GngsOpIXMLDd68f%2B0e9D5gcf6GDpSA29jP5f3y%2FjAThB6xaNP1CMFW%2FB3kwm0LEQfY5LWztaF7xqv57fyPcikMRhr1%2BA%2FlBrNebjj%2BNHUGJA76mAaiqPYu2%2F37sgSNfdbbebGFnyYwsPVZSw9kitKgTgOeycGugxblTQs9U0id8wFIFR2uBpFh%2FJCXk%2FOtB1QwJpCW5yUP%2BwWXTXRSBCiHimcSWXIEjSRcFmxcSJ8TTecTua23MXoq146eWZcTDZ4%2FphaZFyn12ZXWJBpxfpTx81Cm%2BtinJsvoB85K7TAUb%2FhYLYGAwP4UkB80hvQaVONbaS2FHWztKi0D4YsM3sDREK%2BUHzFRSugsXjKdYjJtQSRKfv7AMYHSVGleUlEn5HQHJrOrBO5UoZkemJlQpyHK13Kn6ZaDzmiXlUtZrF7SzFl0%2BXon%2FIv0iLwEa69z2L7%2BPStAdunSr1CBk%2B%2FamxJECSIRi%2BZekGN%2FvfYwENcG5gKW74H7EOYJIiaKdCwycAA3%2B862aKpi5DDCu2crMBjqkAauFeJ1s8jUTZioDvglF%2BePnQ3QrzeyuZJvLdrI38aJEQjKOzrwM8d%2FMOar20ltcLjQP4H012w9DKTp40fryA7NCgJjU8R873uBEj1P9Dw38u9DzOZAwSX4loSlZPzWbkfp%2F4XNJtMtGTJnNKhXPXzlI2yPr6FAEyeQU%2BpjSYH8GZ3595cFVULol4iUHhM6DunMcQhBbiZ6aYFg5%2FoPxq3mTCQ6P&X-Amz-Signature=60bb2cd3511e2a43f91608997a4e0895f5561166af729325aea9568082d670b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
