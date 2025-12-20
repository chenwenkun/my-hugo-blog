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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UA7UCZ3W%2F20251220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251220T181456Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJHMEUCIGcIAi96fNHzfj4C6P%2B%2BmVdbaWdH9cfLMevfLdvgwPA9AiEAgJEc9Hlj5vAKhs9%2B5rWKvCXiJya%2Be7ehIhpqFT%2FmR3kqiAQIy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBgMuttS52n%2F8Mf3YircA%2Fb%2BjZ2njg%2BdMeMtJEcIWsiBdkepTirfmPIk2utATzVPR8q%2BClJ5SPhWKYuhUt0voBGr3ebciFd8vEdj%2FCe0purN4NEfB%2BRJsrc7ty0La7QhqrDoHFbbJSmHTS%2BMvgoKX8rKLV6YQ2maGzsRBg8Aogj7LElPLcqyMPq5K%2FpG%2FT8U7s60rovR0DVkWw5PlNk3mG30iZWISap9Lm%2BO15vxZFE%2Bh8Dc%2FofXdcr%2BV7WVGP6udhHB%2Fe0Z4zAbdRa6Rm2Oo3kwPZB5cE%2FRKpwV5c7IQWCcJOq8yYJtuVmhBjJuat54Wf6fNm6KwvHZBftrOTgvZRxiw4rqHUun2tksjC09kGh3OsYfd%2BenDIvAlXIbNVPe84V7WkJX88Nw0pxPMfbq73O5HxuKauxOkIXnN%2Bo%2FlpM3HyA%2F6lfq05EvGJCzwBoCtCUhmc%2BNaUZfOlesZkkNOXTTroWXsFjbB%2BIJ2i1lL6jc%2BIYaA%2BHgmoiyE0QLUp%2BgvjcL5A%2BTW1DwmVokOBdMX5SHzNU0EW1LeMTKxXU2AAS7W3XT%2FxcWALd1mvB%2BQOItYsWCoC6CkV4IyR7qItTLCLkIjx9exf%2Faovx0jZqvVDqrAmyKULC7tVCRx8P2z2CuF8EBu8yRnzRFNt%2BTMM%2FCm8oGOqUBGmBjfOT5MgWKBo%2Fd73pEPXHCtve5bEB8QTm0D4MUPjmdawAUl3AAeAFeAvrX0HvVo4MknUha3CM5O9mgJUWeS3mHvkxfMTRfaGL%2FtzaH%2FhnszSDYt%2B3OdqfMmAW%2FuZk%2BLH41z7GtPYVLGgX%2FHTCpDudXEo8H1v0BA9aC8ZJDc%2BcziCBJ8N1b9OKGjrfqAUqHrcp0SV3RvwDUuMy%2FPbWB4bLaXbdY&X-Amz-Signature=e538791e26453f64450720ac5b31a646171fe87068504ba23336a6f8206e2d0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UA7UCZ3W%2F20251220%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251220T181456Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAIaCXVzLXdlc3QtMiJHMEUCIGcIAi96fNHzfj4C6P%2B%2BmVdbaWdH9cfLMevfLdvgwPA9AiEAgJEc9Hlj5vAKhs9%2B5rWKvCXiJya%2Be7ehIhpqFT%2FmR3kqiAQIy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBgMuttS52n%2F8Mf3YircA%2Fb%2BjZ2njg%2BdMeMtJEcIWsiBdkepTirfmPIk2utATzVPR8q%2BClJ5SPhWKYuhUt0voBGr3ebciFd8vEdj%2FCe0purN4NEfB%2BRJsrc7ty0La7QhqrDoHFbbJSmHTS%2BMvgoKX8rKLV6YQ2maGzsRBg8Aogj7LElPLcqyMPq5K%2FpG%2FT8U7s60rovR0DVkWw5PlNk3mG30iZWISap9Lm%2BO15vxZFE%2Bh8Dc%2FofXdcr%2BV7WVGP6udhHB%2Fe0Z4zAbdRa6Rm2Oo3kwPZB5cE%2FRKpwV5c7IQWCcJOq8yYJtuVmhBjJuat54Wf6fNm6KwvHZBftrOTgvZRxiw4rqHUun2tksjC09kGh3OsYfd%2BenDIvAlXIbNVPe84V7WkJX88Nw0pxPMfbq73O5HxuKauxOkIXnN%2Bo%2FlpM3HyA%2F6lfq05EvGJCzwBoCtCUhmc%2BNaUZfOlesZkkNOXTTroWXsFjbB%2BIJ2i1lL6jc%2BIYaA%2BHgmoiyE0QLUp%2BgvjcL5A%2BTW1DwmVokOBdMX5SHzNU0EW1LeMTKxXU2AAS7W3XT%2FxcWALd1mvB%2BQOItYsWCoC6CkV4IyR7qItTLCLkIjx9exf%2Faovx0jZqvVDqrAmyKULC7tVCRx8P2z2CuF8EBu8yRnzRFNt%2BTMM%2FCm8oGOqUBGmBjfOT5MgWKBo%2Fd73pEPXHCtve5bEB8QTm0D4MUPjmdawAUl3AAeAFeAvrX0HvVo4MknUha3CM5O9mgJUWeS3mHvkxfMTRfaGL%2FtzaH%2FhnszSDYt%2B3OdqfMmAW%2FuZk%2BLH41z7GtPYVLGgX%2FHTCpDudXEo8H1v0BA9aC8ZJDc%2BcziCBJ8N1b9OKGjrfqAUqHrcp0SV3RvwDUuMy%2FPbWB4bLaXbdY&X-Amz-Signature=e42a15911c48ffb449f4697583d09ed9de153fc82e4e52df28e806204e1c355f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
