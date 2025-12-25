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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665HOCU5VF%2F20251225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251225T061905Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJHMEUCIHRqLaYBiUnMsaogdTrxUST5zoz8uV0C%2FNhZE61CubToAiEAqCmbq50b8HZPbQbm09A0dSmQ1pHqamP1A71K0mHIMgAq%2FwMINhAAGgw2Mzc0MjMxODM4MDUiDB8Rbt0Xz6pADPXlJircAx3TS4VJOI03t%2F1YoJqtvd3WIFggyJqx271IBeLMZgsgoLfjtjp9ZeOecwF7vWXSosgeF97ZPct3vuQLucRLW4FxC%2BZQnBrTsyN2khng8ye8wp%2Bf8uz3ELgmDUH5pLrwX3HVRQZCMViO7KL0VZgswUwikTZBNVtwzGcaHDbPHq9SOabQwPcrQK8qrXrjdSB4af7yu0kTtNwqXmKECg2WpxFOMM6YqG2TkmMyYZAB%2BlBub9206l%2BRoDvnLb9EBT4eczOtGA2QIim7hM%2BimZ1fa3NQyRajx5FE27pny%2Fp7FrWx%2F1piLYBDOKaFM1IAwHQhOkJT9rzQBskuiXv01W8aVtpOc%2Fg5%2FcjiEM00xDymqfenmx6tRMgH6X6%2B2CrOkXUdmQ7tBN0yK2bP2hlZzWw7v3bhR0suklw%2ByJ%2FfB2%2FRRZFCkQrPqQT3gVkcKYgeU80Z%2BziIwf7xWlOmscyJ%2BpK6RQtn9TnTum%2BV%2B59P8ugxgwzsUPiB9RdAGyBx6GxpM9ZQoPSQjXY6vAVmsUR4HmSBBY7QRHcQIwtVznk2cx%2FvOgjKpDts07SXn4rABl7BNkiHDUi5ypETxmhEnjpQ4vWOeREFWYY80jfqkU%2FBzZuHcjh6PfJXB23TILstqp27MM7%2FssoGOqUBlyWsHBXbwMmtuT6JMkPTacvKtoITpKp1v571S61OrcNPDBQkdptkdo3qKrnxTPk5TPYHw778CgOsQggQXKcL%2Brj5QfARPJt6vX1UXdRCyQKwjZP1M%2BlNwlfCU1iAq3b04kJTUgfjb175BoTTkkAgm3p6Iifbrxnlxd9aBIOt41ouJr%2BxyBAei%2B4uPFHOfczBCTxhrFEigscdmtZzB8Wu58Eys8fc&X-Amz-Signature=92a9ae7a76afecdd3035779aa433f43caed5aa7263ed89b82c6f791397d84ac3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665HOCU5VF%2F20251225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251225T061905Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJHMEUCIHRqLaYBiUnMsaogdTrxUST5zoz8uV0C%2FNhZE61CubToAiEAqCmbq50b8HZPbQbm09A0dSmQ1pHqamP1A71K0mHIMgAq%2FwMINhAAGgw2Mzc0MjMxODM4MDUiDB8Rbt0Xz6pADPXlJircAx3TS4VJOI03t%2F1YoJqtvd3WIFggyJqx271IBeLMZgsgoLfjtjp9ZeOecwF7vWXSosgeF97ZPct3vuQLucRLW4FxC%2BZQnBrTsyN2khng8ye8wp%2Bf8uz3ELgmDUH5pLrwX3HVRQZCMViO7KL0VZgswUwikTZBNVtwzGcaHDbPHq9SOabQwPcrQK8qrXrjdSB4af7yu0kTtNwqXmKECg2WpxFOMM6YqG2TkmMyYZAB%2BlBub9206l%2BRoDvnLb9EBT4eczOtGA2QIim7hM%2BimZ1fa3NQyRajx5FE27pny%2Fp7FrWx%2F1piLYBDOKaFM1IAwHQhOkJT9rzQBskuiXv01W8aVtpOc%2Fg5%2FcjiEM00xDymqfenmx6tRMgH6X6%2B2CrOkXUdmQ7tBN0yK2bP2hlZzWw7v3bhR0suklw%2ByJ%2FfB2%2FRRZFCkQrPqQT3gVkcKYgeU80Z%2BziIwf7xWlOmscyJ%2BpK6RQtn9TnTum%2BV%2B59P8ugxgwzsUPiB9RdAGyBx6GxpM9ZQoPSQjXY6vAVmsUR4HmSBBY7QRHcQIwtVznk2cx%2FvOgjKpDts07SXn4rABl7BNkiHDUi5ypETxmhEnjpQ4vWOeREFWYY80jfqkU%2FBzZuHcjh6PfJXB23TILstqp27MM7%2FssoGOqUBlyWsHBXbwMmtuT6JMkPTacvKtoITpKp1v571S61OrcNPDBQkdptkdo3qKrnxTPk5TPYHw778CgOsQggQXKcL%2Brj5QfARPJt6vX1UXdRCyQKwjZP1M%2BlNwlfCU1iAq3b04kJTUgfjb175BoTTkkAgm3p6Iifbrxnlxd9aBIOt41ouJr%2BxyBAei%2B4uPFHOfczBCTxhrFEigscdmtZzB8Wu58Eys8fc&X-Amz-Signature=12ad2bf4dd810efb632583aac12b78b350eb96bee3f877b179ac975f39ac0b7c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
