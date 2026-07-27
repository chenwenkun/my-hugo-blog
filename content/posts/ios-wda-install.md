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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NI2U42K%2F20260727%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260727T191033Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAurY2R1EUzuzDuJIv2WiCRQpOGT1AmAR5C6AaBbVbn9AiAaFpLY1bUlvrci18ALJaw1XL9TjAB14j0cjma9nuR%2BZyr%2FAwhUEAAaDDYzNzQyMzE4MzgwNSIMuleHG%2B83AEDdn5FRKtwDnVMcY%2BBQOwMqazd4%2BYri8V0%2FTo5fAq%2Bddz63lgxKrBDbnCPTwFRJeisDCRTexoiX0a2Cy5MZXNhZpRkeoM%2F9C%2BtOZlUYVrUNavD%2FqOIyakIcvYwRyPgsCMMuv5kaqbxEf2zjSetjsESWEFmDlWKwb2FIp%2FWSJFE2hYsixdPGmCNs4w962FAfqQWX4B%2Bd%2BKjKxx%2F0opxmLcZcBvifLB%2Bd9GYkBy9aVip0DZY3U9yiM8HyxazmUTqJPaLtb%2BKa2%2FIWPjsfjLF2Qnpg7agujO%2B2URZT4Xu1G9Q2mQgKrvbuoU2lNj2BsOUGlmnTNVvgGApcztH0DL9%2BAcQppoWq59SXjoOjY2bBhk6TRArHv9hSqXvT94w916c3GXrBIZhQDmFgDPpK%2BZPWy9ECVqPwjuXJwjbHYodu2PHy%2BPuz%2FXs3UuZlY%2BvPafLgJa6E%2BSuDlbVISajNbVhg048V9w0ArMZ90H7yZeH6oXOHb5%2BNqaJbCyMkMkWzG80UA%2F5H39gjQ8Ub9vx7uPdU6X1xU%2Fp02qPQQ6KCJmIpu6D34%2FxPkl8KQsK5uc09LR3v4XvPk%2FXc8ydx0cO5YTXG%2BiQpRJHfZ2YoPyS6lnQAJymozibFzt3XfwsF7IubZ0WkYRkh4Hwwisae0wY6pgFqrDMo3VhWi6A5ZBEy52hI7cPhteRRD8cqQr8Pe5JRJEzvaH%2BKNnOaB%2B3kGPXoC6t1cDkWZ155UopMmA%2BpicjSSG4zLec44UdaeexN%2FyJ7cO%2FR4sgu6ksS5C%2FJ%2B7Koh7fRo044j6ZgY3IvCyEBxuyBMNHxeD%2FujbdTyAxExepQay5hZNnnahPtu0EjqamQVVAv29PpmzdbysChKa1sM6Lk7MmnKQkv&X-Amz-Signature=24c02532da418e6ebea2ba1352d0f62c39263f71e25394d35aa5d02314076565&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NI2U42K%2F20260727%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260727T191033Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAurY2R1EUzuzDuJIv2WiCRQpOGT1AmAR5C6AaBbVbn9AiAaFpLY1bUlvrci18ALJaw1XL9TjAB14j0cjma9nuR%2BZyr%2FAwhUEAAaDDYzNzQyMzE4MzgwNSIMuleHG%2B83AEDdn5FRKtwDnVMcY%2BBQOwMqazd4%2BYri8V0%2FTo5fAq%2Bddz63lgxKrBDbnCPTwFRJeisDCRTexoiX0a2Cy5MZXNhZpRkeoM%2F9C%2BtOZlUYVrUNavD%2FqOIyakIcvYwRyPgsCMMuv5kaqbxEf2zjSetjsESWEFmDlWKwb2FIp%2FWSJFE2hYsixdPGmCNs4w962FAfqQWX4B%2Bd%2BKjKxx%2F0opxmLcZcBvifLB%2Bd9GYkBy9aVip0DZY3U9yiM8HyxazmUTqJPaLtb%2BKa2%2FIWPjsfjLF2Qnpg7agujO%2B2URZT4Xu1G9Q2mQgKrvbuoU2lNj2BsOUGlmnTNVvgGApcztH0DL9%2BAcQppoWq59SXjoOjY2bBhk6TRArHv9hSqXvT94w916c3GXrBIZhQDmFgDPpK%2BZPWy9ECVqPwjuXJwjbHYodu2PHy%2BPuz%2FXs3UuZlY%2BvPafLgJa6E%2BSuDlbVISajNbVhg048V9w0ArMZ90H7yZeH6oXOHb5%2BNqaJbCyMkMkWzG80UA%2F5H39gjQ8Ub9vx7uPdU6X1xU%2Fp02qPQQ6KCJmIpu6D34%2FxPkl8KQsK5uc09LR3v4XvPk%2FXc8ydx0cO5YTXG%2BiQpRJHfZ2YoPyS6lnQAJymozibFzt3XfwsF7IubZ0WkYRkh4Hwwisae0wY6pgFqrDMo3VhWi6A5ZBEy52hI7cPhteRRD8cqQr8Pe5JRJEzvaH%2BKNnOaB%2B3kGPXoC6t1cDkWZ155UopMmA%2BpicjSSG4zLec44UdaeexN%2FyJ7cO%2FR4sgu6ksS5C%2FJ%2B7Koh7fRo044j6ZgY3IvCyEBxuyBMNHxeD%2FujbdTyAxExepQay5hZNnnahPtu0EjqamQVVAv29PpmzdbysChKa1sM6Lk7MmnKQkv&X-Amz-Signature=6ec796325bc2a8616512f952298f786ad406fcdff33e6cc41eaafc773072d1fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
