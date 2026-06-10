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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNMX4OOK%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T021418Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIC9D799chasIDVnGVcy6qY5%2BxrqApr1GzKqUigIja4ChAiBcJrBTtsXPwJwIQP%2F5wMQmBfSDZm%2FW0CpJL6brwrX5jCqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM%2B2WKNQzlhG8iffzNKtwDegaJQudLOzJ4V6ESCRg2LmQCJu0rM%2FJLQUIpuW%2B%2Bn977Brf3e4tI7j2mErUzwm2YtDdLMRameBbg2S5uRTOPap5q%2BQHlryq7qT1Kok1zQ3Pq32RkDSwmfPan9Vb%2BSBIXCoYCc%2F16dlFX1R3GAgWJbQgStENMxv%2F960gyc3%2B72dAV%2BdIA24gc9b%2F67%2F8Xea5qiramWJDwwoQajnCNnDsztYn5%2BtPrWZBZXwK%2Fbnulne%2BuQDxUG046g0rvRqhG5sadBR0a4F2RwAEJc9KA6sx%2B0kHrf44pqpSInvGjqXi0lH4HQepjjXKrFWYepD0f8OtVJq%2FSSlLkUgUjPG9EMJdpOYm2dyLfjA2MGFrqJiW2ZUDmAf%2FHRiOSI7tijrVns76U0%2FPVgncAZ7ptwUBG1HohR6GJe8NdcfXCpGWmzQUEc2fUSS%2BkI3zJIF9t4dGbFm0SP6yybIUEAN6mvzaJZyzVfi8cMb23Q9M19tDJSkykrHbCpQvNFiR10tv5SJzjiZyYTlX%2FOXIcZ9RJNHISAqpFE9NA7A4gIpI%2BmWoVojaGYdF6%2FdVymLOMxfUUUsLh4LdBZ0VwtDZf5Vl3SHe1bbkMyL%2BN7MTykPa0rlBHftIDz5W6Hp2cKIBsT3A60xcw3oqj0QY6pgFVueDGMEWL0D29c2FDCNg5%2FZfEbaUz8rkn3Ww4J7cfir6UcHimAoS5zqsBHvT82%2B%2FAZJ748r%2FG3znIaM2bMlkLEee9Ip5t%2BF2Wm2h0x8CrZDymQepG560bQYlzvJhGqo9%2B3j5vkewHcdQkWN4PKySplY0SQekY2hWl5NN02wd6KGj8KD0CTp%2BzffTgCuYyMGDDFWKUhoEdN%2FAYsf1%2FFBAZCOUeRvjb&X-Amz-Signature=198b72af2ec303b1a7c90df6436340bc8b025d8208bd913375e06808349fccd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZNMX4OOK%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T021418Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIC9D799chasIDVnGVcy6qY5%2BxrqApr1GzKqUigIja4ChAiBcJrBTtsXPwJwIQP%2F5wMQmBfSDZm%2FW0CpJL6brwrX5jCqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM%2B2WKNQzlhG8iffzNKtwDegaJQudLOzJ4V6ESCRg2LmQCJu0rM%2FJLQUIpuW%2B%2Bn977Brf3e4tI7j2mErUzwm2YtDdLMRameBbg2S5uRTOPap5q%2BQHlryq7qT1Kok1zQ3Pq32RkDSwmfPan9Vb%2BSBIXCoYCc%2F16dlFX1R3GAgWJbQgStENMxv%2F960gyc3%2B72dAV%2BdIA24gc9b%2F67%2F8Xea5qiramWJDwwoQajnCNnDsztYn5%2BtPrWZBZXwK%2Fbnulne%2BuQDxUG046g0rvRqhG5sadBR0a4F2RwAEJc9KA6sx%2B0kHrf44pqpSInvGjqXi0lH4HQepjjXKrFWYepD0f8OtVJq%2FSSlLkUgUjPG9EMJdpOYm2dyLfjA2MGFrqJiW2ZUDmAf%2FHRiOSI7tijrVns76U0%2FPVgncAZ7ptwUBG1HohR6GJe8NdcfXCpGWmzQUEc2fUSS%2BkI3zJIF9t4dGbFm0SP6yybIUEAN6mvzaJZyzVfi8cMb23Q9M19tDJSkykrHbCpQvNFiR10tv5SJzjiZyYTlX%2FOXIcZ9RJNHISAqpFE9NA7A4gIpI%2BmWoVojaGYdF6%2FdVymLOMxfUUUsLh4LdBZ0VwtDZf5Vl3SHe1bbkMyL%2BN7MTykPa0rlBHftIDz5W6Hp2cKIBsT3A60xcw3oqj0QY6pgFVueDGMEWL0D29c2FDCNg5%2FZfEbaUz8rkn3Ww4J7cfir6UcHimAoS5zqsBHvT82%2B%2FAZJ748r%2FG3znIaM2bMlkLEee9Ip5t%2BF2Wm2h0x8CrZDymQepG560bQYlzvJhGqo9%2B3j5vkewHcdQkWN4PKySplY0SQekY2hWl5NN02wd6KGj8KD0CTp%2BzffTgCuYyMGDDFWKUhoEdN%2FAYsf1%2FFBAZCOUeRvjb&X-Amz-Signature=10e1d26e4368fa622d8c76ec84f2ff14d4bc75d75257c39402beda9293fa6485&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
