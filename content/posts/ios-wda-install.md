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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MCJVCLR%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T071914Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJGMEQCIFyzQuNS%2FpQW9U0khY6CN3znSqRlCYeGA94AKqE%2Bzk39AiABgBMQv%2BmYOLahcJ5PYHbo9x%2FcvZTEeVB4JTJDOnt8hir%2FAwhHEAAaDDYzNzQyMzE4MzgwNSIMr%2F8zaJWXUW%2BlZ3YOKtwDjn5urbCJWE5U2RdZCcH0TxjTAWCkO4s8Pe%2BGPpju1ltWeFHA9%2FdGMOPkOMqM6iLmoWudS2JC3w4zbk0H4dFmBbFRe0ko%2BAw14%2BgKKa%2BWi7CaYl25QLd%2B%2F95fB562VUrW%2FL4EWCDICbqYd6Xzt8CqECsEH3GsFzqD%2BPzz0tIuBAikRtCBG1zJk583ixPS4Kw63HWRSRedYBAwcOiGrsAKwLVVUIrwpzxuE%2BqQbhTrBtBbSs0L9BJJfc3zzuECtzL%2Fu1U2PGEXzVvOE95aI7UrA2gNstebPDawyLxce0u4PJBw%2Ftj58NuqT%2F80WvN%2BzzlVHVSxwwDh9o%2FqZKa4UtuZ2TSuj%2FfeE8FIaVRV28F31xcV9dR3Wu%2B84i8xPsOiU0R%2FIT0zNKk55DtrnP5Aiq2PwuNXSEDQHe%2FT9x33SWvpn5yAs6uNTiorUTjB9smxDH%2B%2F6kGS08U0HpT%2BHXASPE6eJhu7mmPynqS4ZyfX0ada5lEiznPCwQ8ouR4KybB2zhcCuhOI6XfopmUz1WYlE2hub22bfDcTgEpLLJP6ZpIGmaw8jRc9hJFof9msLWd7jBGKBJEKBGyeu5ccD3Y5hwnYnE0lim4OOblAYIvwth9AOUNvYid%2FkF8X%2BdA1LzEwwb6hzwY6pgEq93XnOQGHLi0xLPO0%2BHJWvlp%2FoUuoJNwqwwhLmKzgNEeELh%2BkiUjl8aHj7v%2FSLL1u3Pp%2B0kDbkeci9oCiKx3U6jPH5hEzTIiVXj9SAtkfRCobX6gay00iP4gWyIvP6C78tm%2BdozUaHNPaX5DY88ntZAPAZVNt8dmkHfbjwtAaw%2Fhl%2Fd424NqRLPVbVu22CWY%2BHm1Ncnc4%2FU9wukJsNOo326z3y4YO&X-Amz-Signature=b5fa2e6edcab85885555abb3bbb8c97bd18ba91b4b8d14c59a4d4a4bbf1da068&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663MCJVCLR%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T071914Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLXdlc3QtMiJGMEQCIFyzQuNS%2FpQW9U0khY6CN3znSqRlCYeGA94AKqE%2Bzk39AiABgBMQv%2BmYOLahcJ5PYHbo9x%2FcvZTEeVB4JTJDOnt8hir%2FAwhHEAAaDDYzNzQyMzE4MzgwNSIMr%2F8zaJWXUW%2BlZ3YOKtwDjn5urbCJWE5U2RdZCcH0TxjTAWCkO4s8Pe%2BGPpju1ltWeFHA9%2FdGMOPkOMqM6iLmoWudS2JC3w4zbk0H4dFmBbFRe0ko%2BAw14%2BgKKa%2BWi7CaYl25QLd%2B%2F95fB562VUrW%2FL4EWCDICbqYd6Xzt8CqECsEH3GsFzqD%2BPzz0tIuBAikRtCBG1zJk583ixPS4Kw63HWRSRedYBAwcOiGrsAKwLVVUIrwpzxuE%2BqQbhTrBtBbSs0L9BJJfc3zzuECtzL%2Fu1U2PGEXzVvOE95aI7UrA2gNstebPDawyLxce0u4PJBw%2Ftj58NuqT%2F80WvN%2BzzlVHVSxwwDh9o%2FqZKa4UtuZ2TSuj%2FfeE8FIaVRV28F31xcV9dR3Wu%2B84i8xPsOiU0R%2FIT0zNKk55DtrnP5Aiq2PwuNXSEDQHe%2FT9x33SWvpn5yAs6uNTiorUTjB9smxDH%2B%2F6kGS08U0HpT%2BHXASPE6eJhu7mmPynqS4ZyfX0ada5lEiznPCwQ8ouR4KybB2zhcCuhOI6XfopmUz1WYlE2hub22bfDcTgEpLLJP6ZpIGmaw8jRc9hJFof9msLWd7jBGKBJEKBGyeu5ccD3Y5hwnYnE0lim4OOblAYIvwth9AOUNvYid%2FkF8X%2BdA1LzEwwb6hzwY6pgEq93XnOQGHLi0xLPO0%2BHJWvlp%2FoUuoJNwqwwhLmKzgNEeELh%2BkiUjl8aHj7v%2FSLL1u3Pp%2B0kDbkeci9oCiKx3U6jPH5hEzTIiVXj9SAtkfRCobX6gay00iP4gWyIvP6C78tm%2BdozUaHNPaX5DY88ntZAPAZVNt8dmkHfbjwtAaw%2Fhl%2Fd424NqRLPVbVu22CWY%2BHm1Ncnc4%2FU9wukJsNOo326z3y4YO&X-Amz-Signature=64a1b97f2c9b6440f87d6b61f010b6db732930c6c53cab3bfd748d10e81e5127&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
