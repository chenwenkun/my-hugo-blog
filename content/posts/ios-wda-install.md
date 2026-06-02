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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466752ZEPO4%2F20260602%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260602T203350Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJHMEUCIQDzoKwIBdNn2gYnM5dNt2qhCGxzdQVwmBRAN1qRoThCgQIgBgzdeQmr40UYGZDwjuGzI5yxbvUNLXhuykH8kuA7%2F6Mq%2FwMILBAAGgw2Mzc0MjMxODM4MDUiDLi1C6A7REAU%2FpX7sCrcA0wNzQWs3olhvQ424qPZhNxm1wJPp6FTwDmUoNnzIHAHbFaXN6eUOMMgGt7z0NzQeabfKVerckcyj2roBoX1kJ3WexN1lu1EjUZ8A9M1XmKKpPu9ebTIqyy%2FCDgFdN2O3SN67VA5kIK3fZyFN7AaGhlaggZQ4RUovhul3VyqJ851l1YsdUd7f8SKG6vF%2FQSaOY%2Ft%2BY2Ne5tGCU69jGelNcfCe%2FWzZlbhz1Z3%2FEfk0bzEW8urvLib8TM9LgxRhBXEhA3ZxAmjcAxkVwgetaOrrCsV8af1fdKxk05v6Ed3zU%2Fk%2BBxhUP7U%2BsSltGBdwT50rhtAwI%2FDoMtHl%2FRDUQT86p1NiVr86HIGvFXIHbjoOWqLtnTAnG772c97dOiTle09fE5oy8JeJuJt0soojVoH3euM8wxMlgXJ2kutvBdwWuEH7RyCIEOj7jqUrh4ZrTe1zjt3p%2F9Mihen8%2B5J%2FdlsndDAFLZYYeTBxf69C%2BYa%2Bf7t34aaF1U8rfDPaKvKL%2BNZjxQycqPF%2BnmNEppmGX%2BtigtaiTrCHRyfl9XQt4PYrKAR3TPQHuzqJoE02vjiVajd78THXnufrS7FBB4PMG8PiuzrsuTD75krbYxG%2F0sFlzcPSX240CMB%2F6LZpBKPMKHO%2FNAGOqUB%2FL1JkDIMt0ewKHrFCORhDX2FOl6Xbp93eCbmi0r5Za6xvb1KJEv6HWGYj2p2WKtdnzx%2BiAxk68kP%2B3FPuCsQvDD2qfd20ddnd6LbRZ54W9ai7Ljq6yN8PlSZZxufFyqgNsLrOqPQNVRNiPcCvBJ3xZ3ERjhDL1dwQzuZzBy6SQsBNmrky6tj%2FHt4dwnYCacDUGM7mFbSX1yz%2F4w%2BptsLFWYh8sor&X-Amz-Signature=41429206680a8d97a21f0cdf0346c1183ea273878c96ccc8118fce6d9aba2a19&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466752ZEPO4%2F20260602%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260602T203350Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJHMEUCIQDzoKwIBdNn2gYnM5dNt2qhCGxzdQVwmBRAN1qRoThCgQIgBgzdeQmr40UYGZDwjuGzI5yxbvUNLXhuykH8kuA7%2F6Mq%2FwMILBAAGgw2Mzc0MjMxODM4MDUiDLi1C6A7REAU%2FpX7sCrcA0wNzQWs3olhvQ424qPZhNxm1wJPp6FTwDmUoNnzIHAHbFaXN6eUOMMgGt7z0NzQeabfKVerckcyj2roBoX1kJ3WexN1lu1EjUZ8A9M1XmKKpPu9ebTIqyy%2FCDgFdN2O3SN67VA5kIK3fZyFN7AaGhlaggZQ4RUovhul3VyqJ851l1YsdUd7f8SKG6vF%2FQSaOY%2Ft%2BY2Ne5tGCU69jGelNcfCe%2FWzZlbhz1Z3%2FEfk0bzEW8urvLib8TM9LgxRhBXEhA3ZxAmjcAxkVwgetaOrrCsV8af1fdKxk05v6Ed3zU%2Fk%2BBxhUP7U%2BsSltGBdwT50rhtAwI%2FDoMtHl%2FRDUQT86p1NiVr86HIGvFXIHbjoOWqLtnTAnG772c97dOiTle09fE5oy8JeJuJt0soojVoH3euM8wxMlgXJ2kutvBdwWuEH7RyCIEOj7jqUrh4ZrTe1zjt3p%2F9Mihen8%2B5J%2FdlsndDAFLZYYeTBxf69C%2BYa%2Bf7t34aaF1U8rfDPaKvKL%2BNZjxQycqPF%2BnmNEppmGX%2BtigtaiTrCHRyfl9XQt4PYrKAR3TPQHuzqJoE02vjiVajd78THXnufrS7FBB4PMG8PiuzrsuTD75krbYxG%2F0sFlzcPSX240CMB%2F6LZpBKPMKHO%2FNAGOqUB%2FL1JkDIMt0ewKHrFCORhDX2FOl6Xbp93eCbmi0r5Za6xvb1KJEv6HWGYj2p2WKtdnzx%2BiAxk68kP%2B3FPuCsQvDD2qfd20ddnd6LbRZ54W9ai7Ljq6yN8PlSZZxufFyqgNsLrOqPQNVRNiPcCvBJ3xZ3ERjhDL1dwQzuZzBy6SQsBNmrky6tj%2FHt4dwnYCacDUGM7mFbSX1yz%2F4w%2BptsLFWYh8sor&X-Amz-Signature=9399c2c711168fbd2c9a3731bc663a29b5345c4c3310558eade62f631a4ae138&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
