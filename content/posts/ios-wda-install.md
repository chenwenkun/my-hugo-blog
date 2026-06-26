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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XUGRLVP6%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T140115Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCrRDwNJ1v8VCxxqvbUG5FDtOl0tQYuTnAW4Ej9d3tbdQIhANwEx9h7PTmkKXnvxCgVipjaObev9q1jV7U1GXA0gr2AKv8DCGYQABoMNjM3NDIzMTgzODA1IgyShFQ3yY4P70buMXQq3AMyrZ1kgbugaCucxhzuppHXF0Hi5LhBRRvutV%2BvWxOn%2FrOkfVSewTE8yV%2Ba7DHN7bTV8aKYS%2FAvD391ffG7eN1AgZcGpAbj%2BcoCDu9D9%2B2sETgfO8nf6kolGVz99dN65A8GW%2BJK9%2BMP8HhYJrSnuipGcLmwmTc76jEkSqMjf53Tm71v%2FA2tQIOGWkT1%2BrYm3%2Fn2zqKDm%2FJ6OTD2d539BDWF0%2FLBYV7yaE6DHradgQGdpjldCqltjEm7uInKmhRM83WgXLG88ktwzKIpUesSdpg0h7Thw0Zq5jFlYzMCnfHIDAlDPAYkGkd2u%2BC5HHa16eXin0iIQyZEKGRiRpOay2bv67llRFidkr3Mkt%2Fi7ck7VVeoJRd2m7M2nhJe0R5sBTb3PPQvK8i3VwLGCmJ%2BvCgGc7z6jWe3035SCU4BPdawAqfHP%2F2N7crH386bA54fMOmmnVQePBBC%2FEOChLbldBRCb8kT4E2OWYwRw5AiUF64RXfaxGNgXgdPqdzHj0rC4Jt3ZsF0UO0w12nMj4cn%2BjocH580sP8GmcjOXjM3Keb0MrUf%2FfJply3HZTlLafR%2FOL99P7TnqQFWibeSWCB6MLXYqN%2FpPdlnnVUiW2LILdjBiNDwH8%2Bny2u4UYivRTDx5fnRBjqkAUrXlFDMtF3huOOFvMkNgWWIwBI%2Fr471MINa3%2FTd7mkpUYe%2FAGbp6a5PsRhxBjzQkHy%2F915PJohvl0Z4jRoWc1kV5v1tD1Mv3Vhxe5i%2BK%2Bl%2BUhzKn7I1%2BxNwYA8ClsVngpteGCefCMfKCUnJtrSShOdhE2ILYVf3Fd2JmU6vNBOVymrBaOFC0FuK8pgQHV%2BObk935hBs0ARhnXJPhNxq8428b9rE&X-Amz-Signature=788a685a9735ef1513962fc77b293532d0c7c0053fb0eedd43969814510b5601&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XUGRLVP6%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T140115Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCrRDwNJ1v8VCxxqvbUG5FDtOl0tQYuTnAW4Ej9d3tbdQIhANwEx9h7PTmkKXnvxCgVipjaObev9q1jV7U1GXA0gr2AKv8DCGYQABoMNjM3NDIzMTgzODA1IgyShFQ3yY4P70buMXQq3AMyrZ1kgbugaCucxhzuppHXF0Hi5LhBRRvutV%2BvWxOn%2FrOkfVSewTE8yV%2Ba7DHN7bTV8aKYS%2FAvD391ffG7eN1AgZcGpAbj%2BcoCDu9D9%2B2sETgfO8nf6kolGVz99dN65A8GW%2BJK9%2BMP8HhYJrSnuipGcLmwmTc76jEkSqMjf53Tm71v%2FA2tQIOGWkT1%2BrYm3%2Fn2zqKDm%2FJ6OTD2d539BDWF0%2FLBYV7yaE6DHradgQGdpjldCqltjEm7uInKmhRM83WgXLG88ktwzKIpUesSdpg0h7Thw0Zq5jFlYzMCnfHIDAlDPAYkGkd2u%2BC5HHa16eXin0iIQyZEKGRiRpOay2bv67llRFidkr3Mkt%2Fi7ck7VVeoJRd2m7M2nhJe0R5sBTb3PPQvK8i3VwLGCmJ%2BvCgGc7z6jWe3035SCU4BPdawAqfHP%2F2N7crH386bA54fMOmmnVQePBBC%2FEOChLbldBRCb8kT4E2OWYwRw5AiUF64RXfaxGNgXgdPqdzHj0rC4Jt3ZsF0UO0w12nMj4cn%2BjocH580sP8GmcjOXjM3Keb0MrUf%2FfJply3HZTlLafR%2FOL99P7TnqQFWibeSWCB6MLXYqN%2FpPdlnnVUiW2LILdjBiNDwH8%2Bny2u4UYivRTDx5fnRBjqkAUrXlFDMtF3huOOFvMkNgWWIwBI%2Fr471MINa3%2FTd7mkpUYe%2FAGbp6a5PsRhxBjzQkHy%2F915PJohvl0Z4jRoWc1kV5v1tD1Mv3Vhxe5i%2BK%2Bl%2BUhzKn7I1%2BxNwYA8ClsVngpteGCefCMfKCUnJtrSShOdhE2ILYVf3Fd2JmU6vNBOVymrBaOFC0FuK8pgQHV%2BObk935hBs0ARhnXJPhNxq8428b9rE&X-Amz-Signature=226cb462ba761b1db793da042fa84ad63a987afb721bd7590e9c9520db3e6ee5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
