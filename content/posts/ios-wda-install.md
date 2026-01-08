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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V7NSVAIB%2F20260108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260108T181703Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDQ0lnhOpOZONIiUTilfypaTE30XmkvKdoO26GHuGwybAiBdB%2Ff%2BSxayU8wIrvWQ3%2FsStc%2FA73J8NH56vh7gMlFS5SqIBAiT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM6azx2PoynBsJnDL3KtwDbvFJxmOibFdXmZZn3IU8x2uyvMYsPouWI5%2Fl2RVR%2Fhr7OqwKkUot9CV5Ssk%2B78D0QMR2sJXiCeLhWSVFraCHq610rmsexpLSCucAVjY8xTj%2BuWMrXX3PXOMvP6R3ejq2s0ANAVB0Mi%2BjRcCi54knqcByJVIcUPwTmI6bsSNCp8SNs7xXva9pbVPA5UzpWCjTNtlghImK6dmC%2BhvGZLvvqcG101fDPcwasEEAqqkwsGuwHajuK5oN5goaOofmXEEVhcsGBHuS8iO0JYDOXcb%2BMqVRfPBL1RMvE%2FtgXy97SRzI7X0u2fxXougyXQON%2BgaA%2BuO11wsiGpaaLybjQgTh1yrZcS0T5XE%2FYfEF2vmWZfh1dWgLXZQ4oWJaU3HnJ1uSmQLAY6wrzbJopzSVC5tfS94AZmuNV3d9qa9hVz4lG8zs%2BBjCHRV4fDzDMIuDKIYwdZ7PWyyU8nz0g2ViY9697izExg8ZHw5IRCFzTQunDc8Usd1l7O4CxU1drMQVFxVRObtcIIs4KxWqPlp1vQHm0NjAv7NqjjT%2B2CINTE7ytBmCCJXkZNr7vVRHfRQWtsRjjAILpOkdMC%2Fnff9R52V6f6nTbT9iPVnZuGR0AGtsEBpB00XgCQPCFXlZ90sw99H%2FygY6pgEyk8KTv9U143kQJ4Q4WgIwkG%2BMWU8tw0Aoodm%2Bue722KekMsMiNmfQmuy3ytt1upWS28pdSeerTvgVh4pU0PSWvHuqR8l%2FCQeRQLZQlbUw0BpMbRViszi13Ehky8GlK7Qx0diZmwgOtEfkVd8Xa0XXEMFKDpCxo9CJPzjL4yIMaOm0e%2BaDfAlApGDu80p9UBzT%2BWviXp5bJkj%2BJHpaz57wp0%2F7P71c&X-Amz-Signature=7129fde507619df0ab620c87361f597ce1d497dd6bd25a9e9907b4d67e873cb8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V7NSVAIB%2F20260108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260108T181703Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDQ0lnhOpOZONIiUTilfypaTE30XmkvKdoO26GHuGwybAiBdB%2Ff%2BSxayU8wIrvWQ3%2FsStc%2FA73J8NH56vh7gMlFS5SqIBAiT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM6azx2PoynBsJnDL3KtwDbvFJxmOibFdXmZZn3IU8x2uyvMYsPouWI5%2Fl2RVR%2Fhr7OqwKkUot9CV5Ssk%2B78D0QMR2sJXiCeLhWSVFraCHq610rmsexpLSCucAVjY8xTj%2BuWMrXX3PXOMvP6R3ejq2s0ANAVB0Mi%2BjRcCi54knqcByJVIcUPwTmI6bsSNCp8SNs7xXva9pbVPA5UzpWCjTNtlghImK6dmC%2BhvGZLvvqcG101fDPcwasEEAqqkwsGuwHajuK5oN5goaOofmXEEVhcsGBHuS8iO0JYDOXcb%2BMqVRfPBL1RMvE%2FtgXy97SRzI7X0u2fxXougyXQON%2BgaA%2BuO11wsiGpaaLybjQgTh1yrZcS0T5XE%2FYfEF2vmWZfh1dWgLXZQ4oWJaU3HnJ1uSmQLAY6wrzbJopzSVC5tfS94AZmuNV3d9qa9hVz4lG8zs%2BBjCHRV4fDzDMIuDKIYwdZ7PWyyU8nz0g2ViY9697izExg8ZHw5IRCFzTQunDc8Usd1l7O4CxU1drMQVFxVRObtcIIs4KxWqPlp1vQHm0NjAv7NqjjT%2B2CINTE7ytBmCCJXkZNr7vVRHfRQWtsRjjAILpOkdMC%2Fnff9R52V6f6nTbT9iPVnZuGR0AGtsEBpB00XgCQPCFXlZ90sw99H%2FygY6pgEyk8KTv9U143kQJ4Q4WgIwkG%2BMWU8tw0Aoodm%2Bue722KekMsMiNmfQmuy3ytt1upWS28pdSeerTvgVh4pU0PSWvHuqR8l%2FCQeRQLZQlbUw0BpMbRViszi13Ehky8GlK7Qx0diZmwgOtEfkVd8Xa0XXEMFKDpCxo9CJPzjL4yIMaOm0e%2BaDfAlApGDu80p9UBzT%2BWviXp5bJkj%2BJHpaz57wp0%2F7P71c&X-Amz-Signature=e6a0cc6291f203c08e36eb333859badbbea09e0c073092d46491e6e54848773a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
