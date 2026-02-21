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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665WTQ53CP%2F20260221%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260221T010709Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGCCTqMRtX34Y%2BMXTSKuYnKIP6is0s5Z2BrQSbrQjt0mAiBJMF%2BOKSSIZ%2FAyn4nHa9w3x7g9EXxHivsiJ5K6gu573iqIBAig%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTtygPEpHuSmRctSXKtwD2S%2FjfegrQXU2Y%2BbXykBKOxenfU%2FJF5bCpPTouj9g%2Fu54USe1Q4FsBFeTYidTTDnk2WG3FD0MqwGBk12fwMil2lN2lTbXwAZySPN9UIpdL8%2BNDmL0y%2FZ%2BX23pWZHzIBia5SCvB74BedDdHf6n8%2B6vgiN2FDHRhj%2B2W62e3fVknSWGdgKzLD4W5zPT3VUAZkspJGuLidZ%2FZElmMabEyLpBQK42o4p%2FO%2FUhTSmqLjvglwI4wpdpwI7Q091WKqAJTd0bs21wGerLRyxBLBWf5qnNOt0iTCPQqLgJj4%2FO%2BMa9haiOCxcCwA39psOVsRKiAYhDrP9NF1%2B%2FKStxelRKmLiww5RXXCX3NobG7sWzvbKiyMXmxyhn3N7NCzMiOAdAxQbd8W8lmEZ1ArjxVo04oi1yh4bxdbjhmuyLRpHkVtJIeQwNwdMPrOJXdSOAEGQmOxRhjYo1BjoHr2hLcAtOt21gXIy%2Ffun4Dlf%2BzJtEo8KyR1PRYr%2Bb0lyYO%2FCL5ixTLQ94ncLK7QV9EqhxFXs3su90e6WA05F69fifE6YLEipYS%2BYm36vwBvg2uk08F%2BfhVg0l9Ke3t2lBggVQCu8MQnNUDw9RdUSA8Md0bgD6KGOkU7ND3uWhqkJtlgiNsZcwvsLjzAY6pgFwDHkyXiNN9mcv9qYbEbIsblS6ddzBFUU%2BHmxZrwNZNGbQ936pPfAGfUazPNxyutVSPckGwqD5z8VzWMu2N0%2BJgaomxqVFUPU8rEwCrzXftyIYmN3iZcCRKb4M6vAFZtN7QBdYMfA3CjGBZL07SSfU5oWnmBFFwUWb%2FyjJ40SVX3HC7hV7m1kuWgLhmVz7TILlM7%2BX6AyvkIER3stovPvqoMr7IIkO&X-Amz-Signature=c7f5b777e4f1275b61f0cd2f5079a33f1105d4fa0c96bcc3e4ce82d5c6f9b949&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665WTQ53CP%2F20260221%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260221T010709Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGCCTqMRtX34Y%2BMXTSKuYnKIP6is0s5Z2BrQSbrQjt0mAiBJMF%2BOKSSIZ%2FAyn4nHa9w3x7g9EXxHivsiJ5K6gu573iqIBAig%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTtygPEpHuSmRctSXKtwD2S%2FjfegrQXU2Y%2BbXykBKOxenfU%2FJF5bCpPTouj9g%2Fu54USe1Q4FsBFeTYidTTDnk2WG3FD0MqwGBk12fwMil2lN2lTbXwAZySPN9UIpdL8%2BNDmL0y%2FZ%2BX23pWZHzIBia5SCvB74BedDdHf6n8%2B6vgiN2FDHRhj%2B2W62e3fVknSWGdgKzLD4W5zPT3VUAZkspJGuLidZ%2FZElmMabEyLpBQK42o4p%2FO%2FUhTSmqLjvglwI4wpdpwI7Q091WKqAJTd0bs21wGerLRyxBLBWf5qnNOt0iTCPQqLgJj4%2FO%2BMa9haiOCxcCwA39psOVsRKiAYhDrP9NF1%2B%2FKStxelRKmLiww5RXXCX3NobG7sWzvbKiyMXmxyhn3N7NCzMiOAdAxQbd8W8lmEZ1ArjxVo04oi1yh4bxdbjhmuyLRpHkVtJIeQwNwdMPrOJXdSOAEGQmOxRhjYo1BjoHr2hLcAtOt21gXIy%2Ffun4Dlf%2BzJtEo8KyR1PRYr%2Bb0lyYO%2FCL5ixTLQ94ncLK7QV9EqhxFXs3su90e6WA05F69fifE6YLEipYS%2BYm36vwBvg2uk08F%2BfhVg0l9Ke3t2lBggVQCu8MQnNUDw9RdUSA8Md0bgD6KGOkU7ND3uWhqkJtlgiNsZcwvsLjzAY6pgFwDHkyXiNN9mcv9qYbEbIsblS6ddzBFUU%2BHmxZrwNZNGbQ936pPfAGfUazPNxyutVSPckGwqD5z8VzWMu2N0%2BJgaomxqVFUPU8rEwCrzXftyIYmN3iZcCRKb4M6vAFZtN7QBdYMfA3CjGBZL07SSfU5oWnmBFFwUWb%2FyjJ40SVX3HC7hV7m1kuWgLhmVz7TILlM7%2BX6AyvkIER3stovPvqoMr7IIkO&X-Amz-Signature=ce8cc51f60ffa0d4f0262c18bc92bd4ad726df6a7da553ed12c665ef797dfe3e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
