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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZE2Y3CYY%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T114339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIECbaXvtT9VL0ZGbPiKBuw7VSSehCQMgxcisPlLblKVHAiARZ5jKdTOTw0Oa3wgC3cu%2FbWWPKX2DP70YAZ97ZiaxeCr%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMNGXaJqYXk2sp4S5pKtwDIfCDETiPTVio6omGbJ0YDVAglnIbf9FJ2U26f6n5OUJyDu%2BRV3MymV2TiXFmLaibHGCbeV9QI3rhnT0%2F3rH%2Fq%2FsQB%2F2m9dlw9bBQVnhSuca9wiVBlt9ayKPz0%2FWPIOPshINdJ%2FLLrO%2BDEWBl5eJ9e7ToWX3yFHmQINiPWhLLVH0%2B%2FjWve%2FnqcD80VJhbyLSrGBhJBUu3guxC4R3OPFRjAhsTmHg2hOV8Lh5f3%2Fp9e4UGncKzct80Z6fzHw04y6NOoC2QYJEjqXTVPx6hsvecOIAiwQhZVH2XPdJ8D3F4VX8G4vJX31z6Dpur5%2FS0n81I%2BMOeTYPk28RMmnvuldDSxOqbGFfn9%2BIpUthj3h5bsI6xLjqPWyB9G5oTilI0E1HaL92YQ15GdBBtjrJUW6AZiyJ7LTjTV%2FCJS4gPohW4LyG2uNNSgFrMuvFGsit%2BuAXBXqIIkbXfBpZERIo8JlQEHDddlk1BLZkj0zCx6Ei91p1XIrxtlvItCithHWQ6uwIRi0%2B6FCHE3GPqe2pEWRaoN9FzIEX4tIcX3QvSt29YV6Dpdq7QxJJZwznhezVlko%2F8X5BaNFKqXagA7IgeOZmztTQ5ZEe6as%2BPqmYBH503z0iocqEysmMKrlFoYecwlbq%2F0QY6pgEZqT1TFAI3GkQqEF24YNBYe3KhaZz0MHYEX3nn%2FVF71%2BrhSux8ItjsE8qXnkVWDNhz3svsIgw9rd%2BJGGo7MBfJADwLd0s0K5K0ujUN27FBhusPY7raEGgW8tFnUNIyWb26kf9kkyYW9HRdjyZWE0q%2FMoH1Jyb%2FGfXZu%2FFGQ83FV9LGErdY705VPC1pEmnAQ89fklVAPwwMuSTe9xj42zeqzU9VuRBo&X-Amz-Signature=577f67d8038a806ce2a8dca64788b7fdf54bdc5c7444a4ef296d11bb4a31a980&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZE2Y3CYY%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T114339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIECbaXvtT9VL0ZGbPiKBuw7VSSehCQMgxcisPlLblKVHAiARZ5jKdTOTw0Oa3wgC3cu%2FbWWPKX2DP70YAZ97ZiaxeCr%2FAwhcEAAaDDYzNzQyMzE4MzgwNSIMNGXaJqYXk2sp4S5pKtwDIfCDETiPTVio6omGbJ0YDVAglnIbf9FJ2U26f6n5OUJyDu%2BRV3MymV2TiXFmLaibHGCbeV9QI3rhnT0%2F3rH%2Fq%2FsQB%2F2m9dlw9bBQVnhSuca9wiVBlt9ayKPz0%2FWPIOPshINdJ%2FLLrO%2BDEWBl5eJ9e7ToWX3yFHmQINiPWhLLVH0%2B%2FjWve%2FnqcD80VJhbyLSrGBhJBUu3guxC4R3OPFRjAhsTmHg2hOV8Lh5f3%2Fp9e4UGncKzct80Z6fzHw04y6NOoC2QYJEjqXTVPx6hsvecOIAiwQhZVH2XPdJ8D3F4VX8G4vJX31z6Dpur5%2FS0n81I%2BMOeTYPk28RMmnvuldDSxOqbGFfn9%2BIpUthj3h5bsI6xLjqPWyB9G5oTilI0E1HaL92YQ15GdBBtjrJUW6AZiyJ7LTjTV%2FCJS4gPohW4LyG2uNNSgFrMuvFGsit%2BuAXBXqIIkbXfBpZERIo8JlQEHDddlk1BLZkj0zCx6Ei91p1XIrxtlvItCithHWQ6uwIRi0%2B6FCHE3GPqe2pEWRaoN9FzIEX4tIcX3QvSt29YV6Dpdq7QxJJZwznhezVlko%2F8X5BaNFKqXagA7IgeOZmztTQ5ZEe6as%2BPqmYBH503z0iocqEysmMKrlFoYecwlbq%2F0QY6pgEZqT1TFAI3GkQqEF24YNBYe3KhaZz0MHYEX3nn%2FVF71%2BrhSux8ItjsE8qXnkVWDNhz3svsIgw9rd%2BJGGo7MBfJADwLd0s0K5K0ujUN27FBhusPY7raEGgW8tFnUNIyWb26kf9kkyYW9HRdjyZWE0q%2FMoH1Jyb%2FGfXZu%2FFGQ83FV9LGErdY705VPC1pEmnAQ89fklVAPwwMuSTe9xj42zeqzU9VuRBo&X-Amz-Signature=ca1594e587540faf3703cb0905b160a23edcd243e14f8bea6a0b3bbe70986606&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
