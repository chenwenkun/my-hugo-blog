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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667QXR2NQB%2F20251025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251025T181345Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFKq2SskXZXV29eIU5q3amCnbiU8876zet%2FS%2FcGReyfnAiBgKNfYhJXNE%2BRMKw%2FfpB4vQh8cPQR5xbypUEWOab4q5ir%2FAwh7EAAaDDYzNzQyMzE4MzgwNSIM2uid6QRuJzZQChcKKtwDF%2FtqGxubQkMVuafmpJVJ8cZmv6Z8h41HVQWmVOurka7dbww7MQ9C0PS8%2F5xRzFJ3Od%2FRXiLVUMfqDI%2BpCQO4es5oTZmbrLY0kbEUkaCohumYTh4s1Gh0DPhvh9w4FCURPD3OmRb9OONxvaFjgtU4I1pjw%2FvBqObKVPNBzGSTblm2cBByKbpgWz367WHpbH0bMP60dQNJutpXubCEVn6Qt4p5UEwNpcI%2FGGeYM4yZDdAMAQgMihX1qYIsEUhu6KhXPa4f7JFrI3Y4IFltgrxvThNwE%2BQl1Ke2XiFAalGuIGnO9Nym9HphFxB1V6z9Kkk1HVFOhZ6cQAxADoRjVn17V68X7YOYTP09GmcKuY4mU21%2Fc0ThFfotYZOow8a1Y5Jym8c5BIBo2%2Fo9lX3KetV2udC40d1KHECqjumoVXGSzY%2FNs9rT46wOO%2F%2F9QfHVjomNkeB8x%2BoAYKToUxhO2SsPeHdVGNfko1uYaM7zJti72LFJGVRG2jffu%2BFSuU8Y46mVUkQ0MXZ5uiyFALR%2F9HDyfzuj5RGw3KZOWYPYLTqf6%2BJK6%2BiSPQUf1%2FsRJqRKg69EyP3xrOUrMB8ka%2F%2BJAWFeZZpCjiuvPO%2Bqw8TOTWlgt0n6WyaZRb5%2B8I1n3Ccw8Y%2F0xwY6pgEqLpL7bvGgWUOMJCqmAwLGXBzdSKkhfPV%2BCCK%2BhDUe%2BeEsIS8GVO6ULzFRaXZBeawGmYXK%2BUUj%2Bxl4%2FQRizq%2BNpdmFfKP38mv2SmPx%2B4OrghdN2COrRUsrXZs0WiZCl9bNKCavWJtz8BRMUXg7Pq6c%2Fv%2BLKDFYeZ%2FV44NiChdtEtD7%2BRu35Z1tVfcB8I1a4L%2FS6inxUag2%2BCTKFayQQVmb1XeEWfGs&X-Amz-Signature=308caa815484531e5f937f81fc3644a85f423428ac958a8b45ba78ba8949086c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667QXR2NQB%2F20251025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251025T181345Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFKq2SskXZXV29eIU5q3amCnbiU8876zet%2FS%2FcGReyfnAiBgKNfYhJXNE%2BRMKw%2FfpB4vQh8cPQR5xbypUEWOab4q5ir%2FAwh7EAAaDDYzNzQyMzE4MzgwNSIM2uid6QRuJzZQChcKKtwDF%2FtqGxubQkMVuafmpJVJ8cZmv6Z8h41HVQWmVOurka7dbww7MQ9C0PS8%2F5xRzFJ3Od%2FRXiLVUMfqDI%2BpCQO4es5oTZmbrLY0kbEUkaCohumYTh4s1Gh0DPhvh9w4FCURPD3OmRb9OONxvaFjgtU4I1pjw%2FvBqObKVPNBzGSTblm2cBByKbpgWz367WHpbH0bMP60dQNJutpXubCEVn6Qt4p5UEwNpcI%2FGGeYM4yZDdAMAQgMihX1qYIsEUhu6KhXPa4f7JFrI3Y4IFltgrxvThNwE%2BQl1Ke2XiFAalGuIGnO9Nym9HphFxB1V6z9Kkk1HVFOhZ6cQAxADoRjVn17V68X7YOYTP09GmcKuY4mU21%2Fc0ThFfotYZOow8a1Y5Jym8c5BIBo2%2Fo9lX3KetV2udC40d1KHECqjumoVXGSzY%2FNs9rT46wOO%2F%2F9QfHVjomNkeB8x%2BoAYKToUxhO2SsPeHdVGNfko1uYaM7zJti72LFJGVRG2jffu%2BFSuU8Y46mVUkQ0MXZ5uiyFALR%2F9HDyfzuj5RGw3KZOWYPYLTqf6%2BJK6%2BiSPQUf1%2FsRJqRKg69EyP3xrOUrMB8ka%2F%2BJAWFeZZpCjiuvPO%2Bqw8TOTWlgt0n6WyaZRb5%2B8I1n3Ccw8Y%2F0xwY6pgEqLpL7bvGgWUOMJCqmAwLGXBzdSKkhfPV%2BCCK%2BhDUe%2BeEsIS8GVO6ULzFRaXZBeawGmYXK%2BUUj%2Bxl4%2FQRizq%2BNpdmFfKP38mv2SmPx%2B4OrghdN2COrRUsrXZs0WiZCl9bNKCavWJtz8BRMUXg7Pq6c%2Fv%2BLKDFYeZ%2FV44NiChdtEtD7%2BRu35Z1tVfcB8I1a4L%2FS6inxUag2%2BCTKFayQQVmb1XeEWfGs&X-Amz-Signature=46eb35d224d16f761e00ec45996c383ccebe49dcdd2d8cb2629dd9e745e9d866&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
