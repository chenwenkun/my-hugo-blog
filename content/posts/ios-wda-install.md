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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662UW5VHOU%2F20251226%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251226T122224Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICFNv8O8IjTdQg4JZxLdnDmC7j4XbUVPQ2ZgrKTsQYCIAiApDpp2DWtVjyodLaZ67b5tPd6H3D%2FI4KvXUiUnMgeDWCr%2FAwhQEAAaDDYzNzQyMzE4MzgwNSIM%2FimbmvlVUwWEAQyqKtwDigzAEEw53XgUKLgX9A8DaWBekRLAhRTgx8leksV6fDj1zv8QN53XV3ES%2BKauKBCBuW8oeEykCbAl87y2uqIKGELZpKRpT1YZjZkYVntt4aSkfemA%2BQcn4L0ITw3%2FaEqWHlGnekOOtgfavGTyXKVMRsCpT8Ocqky9k%2F5CLv7yBpcrC0rLka8nxgnc5CccN%2B5EAA2O0Y73183uVeraF%2FtKxijYv38LibDdeLJmvYG3tXmXJgTrv%2BvPB444074kvdLXZEvpgkzSETecATEl4YPZ5t21Kkq2TGrUiFi9RxgUfE66It6jveAxiYm%2FCBt0aasxKwG%2BOBISDQb1%2BWSHNJLD42%2BZgu%2BoIIuYud1qlmQANfwBgPW6wcRqxxWb3QSKjGm%2BhJt8JjxWmEzX6CpQ8Ihf2RAytkdu9%2B%2BDayZMzbeB9S6xAr%2FU5ctDj0y%2B%2BLH%2FzXB7hg5EpPyYDeAj0ZVzOLEgt1UIQ3gXxcxgVctWSAexViDaTt3Q0RbHSsP0xTxNaPpW0vFje9InA02a3NpEwDggtvZrH7%2BEXhzPvLQ43kQzA1GjJ7cqjF6%2FzUWYnW2T5EHekKAkbDplJgE12EkMi6AEshI0qE%2BlOmG9K%2FmDBb84GNInD8ICYuohrRPKF50w3Oy4ygY6pgE5ZQlpMRjynyFBURdC5WDShSJlviTBdL%2BcdhIFA2U%2BZZhzB9Jach5lB8FbY6WAWCKFwp50toEi0rzrz5QwwdcLdHhsHIS6yLgnvsscKIP%2Bwt1vAFLT%2B2loJsgmhN2LYEG0Tt5RCZowUVSzCApNGICWS1eirrA5Zlmsb9gYksKsFEQafQAnFRH8YjY%2Bp1PtZf3D%2BPfwRY98lMikmPjt2NYiFikfOjdP&X-Amz-Signature=acacaeca3b6d7c357bdf9e2bb15f3b20e2943ec23e93e1fc778d24ec9d2bff32&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662UW5VHOU%2F20251226%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251226T122224Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICFNv8O8IjTdQg4JZxLdnDmC7j4XbUVPQ2ZgrKTsQYCIAiApDpp2DWtVjyodLaZ67b5tPd6H3D%2FI4KvXUiUnMgeDWCr%2FAwhQEAAaDDYzNzQyMzE4MzgwNSIM%2FimbmvlVUwWEAQyqKtwDigzAEEw53XgUKLgX9A8DaWBekRLAhRTgx8leksV6fDj1zv8QN53XV3ES%2BKauKBCBuW8oeEykCbAl87y2uqIKGELZpKRpT1YZjZkYVntt4aSkfemA%2BQcn4L0ITw3%2FaEqWHlGnekOOtgfavGTyXKVMRsCpT8Ocqky9k%2F5CLv7yBpcrC0rLka8nxgnc5CccN%2B5EAA2O0Y73183uVeraF%2FtKxijYv38LibDdeLJmvYG3tXmXJgTrv%2BvPB444074kvdLXZEvpgkzSETecATEl4YPZ5t21Kkq2TGrUiFi9RxgUfE66It6jveAxiYm%2FCBt0aasxKwG%2BOBISDQb1%2BWSHNJLD42%2BZgu%2BoIIuYud1qlmQANfwBgPW6wcRqxxWb3QSKjGm%2BhJt8JjxWmEzX6CpQ8Ihf2RAytkdu9%2B%2BDayZMzbeB9S6xAr%2FU5ctDj0y%2B%2BLH%2FzXB7hg5EpPyYDeAj0ZVzOLEgt1UIQ3gXxcxgVctWSAexViDaTt3Q0RbHSsP0xTxNaPpW0vFje9InA02a3NpEwDggtvZrH7%2BEXhzPvLQ43kQzA1GjJ7cqjF6%2FzUWYnW2T5EHekKAkbDplJgE12EkMi6AEshI0qE%2BlOmG9K%2FmDBb84GNInD8ICYuohrRPKF50w3Oy4ygY6pgE5ZQlpMRjynyFBURdC5WDShSJlviTBdL%2BcdhIFA2U%2BZZhzB9Jach5lB8FbY6WAWCKFwp50toEi0rzrz5QwwdcLdHhsHIS6yLgnvsscKIP%2Bwt1vAFLT%2B2loJsgmhN2LYEG0Tt5RCZowUVSzCApNGICWS1eirrA5Zlmsb9gYksKsFEQafQAnFRH8YjY%2Bp1PtZf3D%2BPfwRY98lMikmPjt2NYiFikfOjdP&X-Amz-Signature=c2d6fc1795b311636d0d71681cab0953337db1e4abfe1ebc57f00c9585bc06df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
