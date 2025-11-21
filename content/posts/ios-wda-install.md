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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNAQLGYG%2F20251121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251121T061743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLXdlc3QtMiJGMEQCICLYcyyU%2FHByhN6Yrmy3PfYK3Zk1pUV5V%2BrO524PE6jeAiAffAckk9%2Bod88PEXrNiAJ4lVWsD0CNDinhmHwzUFOyAir%2FAwgGEAAaDDYzNzQyMzE4MzgwNSIMvpG1OM3YXGxT4YhgKtwDuJwiVYu4Jc9bCrHN6aCDrN%2Bnen0JXWlaZaRgJU1Ljo2%2BvYWbK8c7N5Aavehnds9kEHH45O7gACrc1ynLAGsRN52fEMEq54dhrSWKlML9yNa%2FyuXDvqcT%2FdPzOksNFI6ZRIQvAqIT1U9d9AYuPvLi%2Bt7XqljF4stliUg%2FfBx%2FeFYczUYn6we4usCj1%2Ff7PXig7V5BXZ8A9XjLrXTEr1BQQ1wHL%2FNPSKx2gUIeG8qEYG3QPlKO8Yhh9bampXhCiFqdrx6P80PYVHSR808J70h0g5evgnDQPIEv0%2FQuYDLKZ1jA%2B0aK%2F%2Fr3XyLupJ36JnUG0oKezjVJvJag%2BKrm2OAEBdYXtrhK4cDY%2FBiBm9n2JEaEEnZM%2B2jeOFalNWYI7Tk%2B0eeu3h9ySra6ddTKRF3Xx6uyttkX%2BjHUXgGSHJnAxxQUbj%2Bx%2BNgdm%2BiwsfAumhl6ha1EStmpQzqHL0F2IufrWmRpaZquQk1Xq6R6RS06GbPG%2FDCFvZ75uvB5W71vU7YB52Vh6zZvwLgiALb52%2FWWn3n6I0DYI%2FKtkZ24gWJ7sN7Io5I%2FSVtz%2BePtCKTEf6mzhMcyx191VhWYzJR4SdTVU0iJG0cWW490JmC6FmTneK%2FuuYbgDP7PENo6mgMwqub%2FyAY6pgErRTIeamOnwetxgLSAwiR8a%2FhjueC4nvfvQh66w80%2FoT4IFMP7OouQ69cItIDAgSd1267s%2BrdBv9qEN9%2BnT2jmFj2iW5Ts1rDyRTOkKP%2F7%2BuCLhSDgQElD9B8wbGVGN8pi9ZMfBuz9I2XbIhY4In2aMerQJmeUrS246Cnj3n8gZL5ZAgfTCARVwqpPOjivUEVJafxsWmltzOErrEcfpPQ0g1v%2Fg2Bq&X-Amz-Signature=4c89a39774217465d18e60d952e9cb4062137e5f5f71096787d114e629a49ba7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YNAQLGYG%2F20251121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251121T061743Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLXdlc3QtMiJGMEQCICLYcyyU%2FHByhN6Yrmy3PfYK3Zk1pUV5V%2BrO524PE6jeAiAffAckk9%2Bod88PEXrNiAJ4lVWsD0CNDinhmHwzUFOyAir%2FAwgGEAAaDDYzNzQyMzE4MzgwNSIMvpG1OM3YXGxT4YhgKtwDuJwiVYu4Jc9bCrHN6aCDrN%2Bnen0JXWlaZaRgJU1Ljo2%2BvYWbK8c7N5Aavehnds9kEHH45O7gACrc1ynLAGsRN52fEMEq54dhrSWKlML9yNa%2FyuXDvqcT%2FdPzOksNFI6ZRIQvAqIT1U9d9AYuPvLi%2Bt7XqljF4stliUg%2FfBx%2FeFYczUYn6we4usCj1%2Ff7PXig7V5BXZ8A9XjLrXTEr1BQQ1wHL%2FNPSKx2gUIeG8qEYG3QPlKO8Yhh9bampXhCiFqdrx6P80PYVHSR808J70h0g5evgnDQPIEv0%2FQuYDLKZ1jA%2B0aK%2F%2Fr3XyLupJ36JnUG0oKezjVJvJag%2BKrm2OAEBdYXtrhK4cDY%2FBiBm9n2JEaEEnZM%2B2jeOFalNWYI7Tk%2B0eeu3h9ySra6ddTKRF3Xx6uyttkX%2BjHUXgGSHJnAxxQUbj%2Bx%2BNgdm%2BiwsfAumhl6ha1EStmpQzqHL0F2IufrWmRpaZquQk1Xq6R6RS06GbPG%2FDCFvZ75uvB5W71vU7YB52Vh6zZvwLgiALb52%2FWWn3n6I0DYI%2FKtkZ24gWJ7sN7Io5I%2FSVtz%2BePtCKTEf6mzhMcyx191VhWYzJR4SdTVU0iJG0cWW490JmC6FmTneK%2FuuYbgDP7PENo6mgMwqub%2FyAY6pgErRTIeamOnwetxgLSAwiR8a%2FhjueC4nvfvQh66w80%2FoT4IFMP7OouQ69cItIDAgSd1267s%2BrdBv9qEN9%2BnT2jmFj2iW5Ts1rDyRTOkKP%2F7%2BuCLhSDgQElD9B8wbGVGN8pi9ZMfBuz9I2XbIhY4In2aMerQJmeUrS246Cnj3n8gZL5ZAgfTCARVwqpPOjivUEVJafxsWmltzOErrEcfpPQ0g1v%2Fg2Bq&X-Amz-Signature=f1d5dbafbbd1abb8335c48d4c5f5ca01333b06404c8a4f310316e4ea4f413289&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
