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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQGMUXNI%2F20251011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251011T061414Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIQDUPXMjC1j%2Fj1aGOd3d3ogUUpTirgzkf3Eu0XfDUj8PKwIgUYfhi6tQ6xSYWUBJVvmfaji5DoziLXb%2Bx%2BJUYze8mWoqiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDhDbCPF94Z5XpPu4ircA5VL4bNhvSqckph3LPqlfEZl0eQPUNgt4P%2FFowqpe9nyEIEFcsqiCcsxG72%2BGfNUbs73uljSY8d8%2Bhlharql4F5cPU%2FpDltyOrUuJWvwr%2FoSFS%2B6CsNrxPq%2FK26MZ02hNkVQ8T0%2Fx7qeUahvKJthyfC1sLJOqpyYL%2B8RQ2DWa0vQHVoKi3PlSMynJG90bHiKrnaI%2F8b4msMFlKd6dFVb7pN4P%2FQ2zyqq7xB2lnY0wpQZn%2F9gHQ3YmIw%2BuOBVHsvDm4xYysNGNdmU4uL72BSeaITRDjXBPOx7ym03FqFKO2lLcK1NqdC8ysQnly1w6kc1xk4e2gGs%2FfcCroSgajsyMWeZJMa8fANPoS6UthLLiYgfCFu8beD%2BOkIPn5n57iBFI3sdtNUAnU8gDwwhRim8nIwYy%2FIOFT%2Fllb1y%2FDsnYagonEjMgUXyWxAp3q9jDYZmwN0EGSNV3bMTWsOGmlTlg8dK2bLSRTBnrlohx7xWeh4OoAlgOvTPjaSLuNje0M5EzF0XoyoYZuWzTf%2BjMJ1%2BIEqmp05m%2FQU34mG364Zli190vV51jOy8LRm9tk4aVR4VnZpXxH0iteTBpt46LzlhkiMSLBZy%2BAzhjvyY0y%2B52pIzJOlXY0pHdoUaIYOEMOPZp8cGOqUB5dB%2FOu9c8qVtfC1sSRLuI7LLpQkh7FyX35DT91pxGOBxlFdW0OjBiHhjy2fj46%2BFkoyYIPBsRVrTlaWLSmb4DBw5x5EBSpzyMRHBEngGYMr%2BZaTrQqGAOYd%2BISgqUD4YbCH6Z0ZUPwdYQoe3jteevgy1P%2Bkk95Qw12UQzesgZYMfD0EMILRj8e8CtjR1zKJrFv0TM39Tqs4CBWtlOcJE%2FIYWnxIf&X-Amz-Signature=0e4bfaa9f45fcbe924db9950c0408b7ee5c8ba20d77bf303db14d90b2abf1580&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UQGMUXNI%2F20251011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251011T061414Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIQDUPXMjC1j%2Fj1aGOd3d3ogUUpTirgzkf3Eu0XfDUj8PKwIgUYfhi6tQ6xSYWUBJVvmfaji5DoziLXb%2Bx%2BJUYze8mWoqiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDhDbCPF94Z5XpPu4ircA5VL4bNhvSqckph3LPqlfEZl0eQPUNgt4P%2FFowqpe9nyEIEFcsqiCcsxG72%2BGfNUbs73uljSY8d8%2Bhlharql4F5cPU%2FpDltyOrUuJWvwr%2FoSFS%2B6CsNrxPq%2FK26MZ02hNkVQ8T0%2Fx7qeUahvKJthyfC1sLJOqpyYL%2B8RQ2DWa0vQHVoKi3PlSMynJG90bHiKrnaI%2F8b4msMFlKd6dFVb7pN4P%2FQ2zyqq7xB2lnY0wpQZn%2F9gHQ3YmIw%2BuOBVHsvDm4xYysNGNdmU4uL72BSeaITRDjXBPOx7ym03FqFKO2lLcK1NqdC8ysQnly1w6kc1xk4e2gGs%2FfcCroSgajsyMWeZJMa8fANPoS6UthLLiYgfCFu8beD%2BOkIPn5n57iBFI3sdtNUAnU8gDwwhRim8nIwYy%2FIOFT%2Fllb1y%2FDsnYagonEjMgUXyWxAp3q9jDYZmwN0EGSNV3bMTWsOGmlTlg8dK2bLSRTBnrlohx7xWeh4OoAlgOvTPjaSLuNje0M5EzF0XoyoYZuWzTf%2BjMJ1%2BIEqmp05m%2FQU34mG364Zli190vV51jOy8LRm9tk4aVR4VnZpXxH0iteTBpt46LzlhkiMSLBZy%2BAzhjvyY0y%2B52pIzJOlXY0pHdoUaIYOEMOPZp8cGOqUB5dB%2FOu9c8qVtfC1sSRLuI7LLpQkh7FyX35DT91pxGOBxlFdW0OjBiHhjy2fj46%2BFkoyYIPBsRVrTlaWLSmb4DBw5x5EBSpzyMRHBEngGYMr%2BZaTrQqGAOYd%2BISgqUD4YbCH6Z0ZUPwdYQoe3jteevgy1P%2Bkk95Qw12UQzesgZYMfD0EMILRj8e8CtjR1zKJrFv0TM39Tqs4CBWtlOcJE%2FIYWnxIf&X-Amz-Signature=407f38f10d7e66eb35cca7b0aff043242bc501d9a46a0f902c7522cc707d8168&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
