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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUEFCTJ7%2F20260209%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260209T184315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC9I7MKNQgdlIWq6wqKs7mIi9Z2761IduchEfuKNO01IAIgCoPXoqxMcJJhnZLiQRMrRPh0w4PK702BpgRnH%2BjIF9MqiAQIk%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLfenYL3fO%2FqTASWKyrcA%2BVAaWzc0hfoG8zUh2PwcquXKxqymUjAZkgLvBZKd6U%2BPGDNaTB5HIsG0TstY4F88gxBXI7b7WUEUYhwJqbczhvMhjEiPCxWdk7lvzAqyg7mSCWP4gAw07Ja52XtyODMmW04C8SbtRDaZwaBx7E%2F6KTwS4oJrhSgINRIUeYpO%2Bs2MvHrbp9nQ1LJQEXiwHU9YSB%2FvlBn7c9W2vNJz0dD7EfVrpsksAjq9L9QR3o81leT%2FGGrE%2FR2%2BoN0%2FfijptUZq1zZEnEmJSlpjMSQaaU%2Bexhij9MdvilFtvPyrfoi%2F9DrPBJka%2FwXHw0JhnV6FzIoTCpdHRSDx2oj%2BzzRfpnp03FXJs1%2FlHB87RNcCQ5eoaTnpEmwNMvEwWbwLH%2FTRWIdZK%2FX%2Ba9cx1x8ApSECX9QoK1DEGG533xxG4sj1mDdGao5oxWHIXcPghJlKduspHVauKzGWg9a4Kaym9qQEavpjEGi53hRujxQKBoKp6IKFvL6Qn%2FFPQJ5ZB8PPzS8gF3ARxipcGRR9BdM5sujITO8fdDTk423zWWVINYd2AlT8roPgG2J2D42qzbsm6zbCt8l%2B13EttZy3lvBtMcURAlRrqqt3IIchei6NmQSJLvkhgYHy2e5uRaQrei0s7TqMJO4qMwGOqUBuoQRfX3UQU%2FdAyB5ioXvfOOKGZow8xqeQoO9R3FRcuxSB8MQX1OOj0FGqgWu2y0pUQdcFbT7FFXPmPgUUZftZ14TRFWsEZqijTPlbv9%2FOCgUa8vA5J9fPiKF%2Bk6gDE0g%2FrryT%2BvtkU2GuqjbKZguP4uVPizKcKiUHTDl4HJyf4eTvOcZzDBI4mFBwGVozm0acJk1ZS%2FiDygB0IcvAV%2BIZMtDuP7g&X-Amz-Signature=9a5af87594e7650ef2be894274fc9aecd700f11961c92fcff9df0627872a5e4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SUEFCTJ7%2F20260209%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260209T184315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC9I7MKNQgdlIWq6wqKs7mIi9Z2761IduchEfuKNO01IAIgCoPXoqxMcJJhnZLiQRMrRPh0w4PK702BpgRnH%2BjIF9MqiAQIk%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLfenYL3fO%2FqTASWKyrcA%2BVAaWzc0hfoG8zUh2PwcquXKxqymUjAZkgLvBZKd6U%2BPGDNaTB5HIsG0TstY4F88gxBXI7b7WUEUYhwJqbczhvMhjEiPCxWdk7lvzAqyg7mSCWP4gAw07Ja52XtyODMmW04C8SbtRDaZwaBx7E%2F6KTwS4oJrhSgINRIUeYpO%2Bs2MvHrbp9nQ1LJQEXiwHU9YSB%2FvlBn7c9W2vNJz0dD7EfVrpsksAjq9L9QR3o81leT%2FGGrE%2FR2%2BoN0%2FfijptUZq1zZEnEmJSlpjMSQaaU%2Bexhij9MdvilFtvPyrfoi%2F9DrPBJka%2FwXHw0JhnV6FzIoTCpdHRSDx2oj%2BzzRfpnp03FXJs1%2FlHB87RNcCQ5eoaTnpEmwNMvEwWbwLH%2FTRWIdZK%2FX%2Ba9cx1x8ApSECX9QoK1DEGG533xxG4sj1mDdGao5oxWHIXcPghJlKduspHVauKzGWg9a4Kaym9qQEavpjEGi53hRujxQKBoKp6IKFvL6Qn%2FFPQJ5ZB8PPzS8gF3ARxipcGRR9BdM5sujITO8fdDTk423zWWVINYd2AlT8roPgG2J2D42qzbsm6zbCt8l%2B13EttZy3lvBtMcURAlRrqqt3IIchei6NmQSJLvkhgYHy2e5uRaQrei0s7TqMJO4qMwGOqUBuoQRfX3UQU%2FdAyB5ioXvfOOKGZow8xqeQoO9R3FRcuxSB8MQX1OOj0FGqgWu2y0pUQdcFbT7FFXPmPgUUZftZ14TRFWsEZqijTPlbv9%2FOCgUa8vA5J9fPiKF%2Bk6gDE0g%2FrryT%2BvtkU2GuqjbKZguP4uVPizKcKiUHTDl4HJyf4eTvOcZzDBI4mFBwGVozm0acJk1ZS%2FiDygB0IcvAV%2BIZMtDuP7g&X-Amz-Signature=94e6f1716c35c649dce3c0cba5f6056d35efacf98161341e486ec4b9a3ffbadc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
