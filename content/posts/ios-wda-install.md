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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46674B4QUKV%2F20260107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260107T061935Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDs6XSRBS8k5Ht8Y88MC%2FsX99ta21QlS2%2BlLIrbt7RK0QIgWnbM4%2FrHKvDIUQg%2FpDZtauUiXD1dLM91OrphVOYQ5bIq%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDPNXQmJDro6Y1JTKUCrcA3smAHA2%2BQm8Riwl0t7G26a4mb%2FX2WYvKp5vbNebB4l%2FviGn5j5JSuiLe%2BRDGmhga6eo5DNICA2AYqxGEZf5ctc2QgFUj%2FrEN8j1PpN%2BqqoxAKMciW4vb8rqQ07fk5VIQn4HbrkvLCAd8i9S9HrCNCHMkhO5xjI7hZdIODlVqI9HYuSQsrikjp5EwDoZMb14zRuPhv71wjzKMlv%2Bz8%2FEZkHm2URF4ZXfwkVTcD0qSgWYiHceGWB4XS2khzx7McDjNV3UmM%2FSaOJv7BJnTklm3GOmdVzuDnhNkV9fzebGNqa4XoMTp%2BiYYpCL7uGcgVWaagZmv8wHXe3y1psIpKzotWKij3YZ1mh1P4IbJ55m9%2BE8XFlLdP3f91WWp9o%2FJyiYchfCpvd%2FphHv6cp2mF1acXIxnQk%2FuHv88rK%2BTNfUGFR4UQLgXIRhGeZsDQpi0GbLBH7IirO3MBi%2F5g53oEHa0JHi9nrVqdnWjEOg2Blsp4J3B%2BWo2I2j8iGI58TKKjmvLTPGlFs6INxfxC0Wlc3S3V1vOL%2F4pPLfSkh90EflQ4QVRwvQR8gOQt9BBL6R%2Bvg2X5x2eVn58IrzQNjwz1%2BfU3r2UeG4AVAhu9rqKVk%2BEPcRri6%2BAguO%2B8S3ru%2F8MNzb98oGOqUBvTuMdT6w8uUiHfzKVxlOz4oQWypVI7mEml8VdPcGgwjKr7mHsjgtQ3J1hdEz0%2BnMMQocHWBWMAPRKhDL2EQ094A8WcH9sDYwf567seNDpoCYlKxciP84GpbH7HIPIL%2BxLq4LOFRspBQCwu%2BlAbz27aKA3fOe9u0BkUGcJzAgiyklZC%2FDuWYmMShAJwwISzR3%2Fxp9Cn1l8yvh4DAxGBGBIQCYNwwx&X-Amz-Signature=ea4334a30a13262a99b25a9e86d4090f446e173a8270db8d1ea36df5a0078e06&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46674B4QUKV%2F20260107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260107T061935Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDs6XSRBS8k5Ht8Y88MC%2FsX99ta21QlS2%2BlLIrbt7RK0QIgWnbM4%2FrHKvDIUQg%2FpDZtauUiXD1dLM91OrphVOYQ5bIq%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDPNXQmJDro6Y1JTKUCrcA3smAHA2%2BQm8Riwl0t7G26a4mb%2FX2WYvKp5vbNebB4l%2FviGn5j5JSuiLe%2BRDGmhga6eo5DNICA2AYqxGEZf5ctc2QgFUj%2FrEN8j1PpN%2BqqoxAKMciW4vb8rqQ07fk5VIQn4HbrkvLCAd8i9S9HrCNCHMkhO5xjI7hZdIODlVqI9HYuSQsrikjp5EwDoZMb14zRuPhv71wjzKMlv%2Bz8%2FEZkHm2URF4ZXfwkVTcD0qSgWYiHceGWB4XS2khzx7McDjNV3UmM%2FSaOJv7BJnTklm3GOmdVzuDnhNkV9fzebGNqa4XoMTp%2BiYYpCL7uGcgVWaagZmv8wHXe3y1psIpKzotWKij3YZ1mh1P4IbJ55m9%2BE8XFlLdP3f91WWp9o%2FJyiYchfCpvd%2FphHv6cp2mF1acXIxnQk%2FuHv88rK%2BTNfUGFR4UQLgXIRhGeZsDQpi0GbLBH7IirO3MBi%2F5g53oEHa0JHi9nrVqdnWjEOg2Blsp4J3B%2BWo2I2j8iGI58TKKjmvLTPGlFs6INxfxC0Wlc3S3V1vOL%2F4pPLfSkh90EflQ4QVRwvQR8gOQt9BBL6R%2Bvg2X5x2eVn58IrzQNjwz1%2BfU3r2UeG4AVAhu9rqKVk%2BEPcRri6%2BAguO%2B8S3ru%2F8MNzb98oGOqUBvTuMdT6w8uUiHfzKVxlOz4oQWypVI7mEml8VdPcGgwjKr7mHsjgtQ3J1hdEz0%2BnMMQocHWBWMAPRKhDL2EQ094A8WcH9sDYwf567seNDpoCYlKxciP84GpbH7HIPIL%2BxLq4LOFRspBQCwu%2BlAbz27aKA3fOe9u0BkUGcJzAgiyklZC%2FDuWYmMShAJwwISzR3%2Fxp9Cn1l8yvh4DAxGBGBIQCYNwwx&X-Amz-Signature=d7bdbc9a8e2dc496736f37c68bdc4e97b7e5e3da433dd76a28c9a79048cecf49&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
