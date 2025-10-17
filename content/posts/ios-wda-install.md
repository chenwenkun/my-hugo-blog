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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AAL3CZR%2F20251017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251017T122104Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAPzhG12o3Vfv1NTbmT9lVs1V10NFCPcqjB4SdXGTmmzAiBTtoQFDO2Xe1UEGdAvVAC3dU2Rq7QqJWtlXfSRUIMduSqIBAig%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM3V3zPDEoi8P7jbjFKtwD%2F6w9mxHpD3SjTh8hN49yn4tMA9wvJ4KmQopk4eWrpO7YN9NfHHNVpufe0Ox3veeWkmFB7pAShxTVjktwJtIMKfDiovqFertxk1OyxEsDGxN9ofir4KnjN4f3OJakBh4EHJNcNcVRY%2FVIWMjLQxmAnxU%2BsyHEisqiid5ds2w%2FCSYZscMs597un69cq4c8BXAQRryTD1OI%2FZz7ATQptThtQLoFNvhUxzT7CdrY5gmA5EA9NNSubjbhtQOq0p%2B2pG5ZgCeEy1ggKS%2BqAKfSgf6hRna%2FJ5liVJTaGLjQZzuIkbUhzudL7FTzMftgkWE2go%2BV8jJqgE4OEvWMsbkgTDBqpEDOqtjBK9wnVwieqFS%2BqCzl8l6Su0Brbl3yVV2tygIk4PINefB2MFYgJ3gyxqGeMpulDXOWXxSoB9X0z8V%2F4vrTdKSyaNp5vTnebZiDmrjsLXNH16HiQ%2BganeRSOJ%2FtgTjQ80KcNJb%2BB%2BvEWU1pw90FcoMQ7HNHFOc6qWVpR5CJNHbK4yVYR4pZt%2FlqLYGOoKWVL8vYOqVN14SQxhoDH25R4r6kYuOAPPoQ3ukEOE%2Bhk%2FgRpcMwsV5XdoILHdf401YieKt00rZk%2BG8Fe5p5dLqQV2Z1sR8%2B1w21omIwjtbHxwY6pgFtia7%2BAaqAhYHoZ2axRlBF95GszwiPq98kU%2FluyJatDSoTlRM78Qmhnmovr%2FtwzjKMB6nDJgTSd%2Fb%2FadrZqCO9bhDZ6JSfOKLAsqcJyIY%2FEe7xwvs%2FVDB88kI47UUY2lrGQ831Jee7OGxutZz%2FSmWy4nluQC1wZWFtGTmDFO%2FVi8Pao0xNtMi1qOnZ9H8cn%2BQIclVFWzdG0u%2FPBudT44R%2BN8NOGyoj&X-Amz-Signature=0d8f89884849ee64823926e1dccc3d883c74e1916cd7f9110a6f3324e16d3b58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AAL3CZR%2F20251017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251017T122104Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAPzhG12o3Vfv1NTbmT9lVs1V10NFCPcqjB4SdXGTmmzAiBTtoQFDO2Xe1UEGdAvVAC3dU2Rq7QqJWtlXfSRUIMduSqIBAig%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM3V3zPDEoi8P7jbjFKtwD%2F6w9mxHpD3SjTh8hN49yn4tMA9wvJ4KmQopk4eWrpO7YN9NfHHNVpufe0Ox3veeWkmFB7pAShxTVjktwJtIMKfDiovqFertxk1OyxEsDGxN9ofir4KnjN4f3OJakBh4EHJNcNcVRY%2FVIWMjLQxmAnxU%2BsyHEisqiid5ds2w%2FCSYZscMs597un69cq4c8BXAQRryTD1OI%2FZz7ATQptThtQLoFNvhUxzT7CdrY5gmA5EA9NNSubjbhtQOq0p%2B2pG5ZgCeEy1ggKS%2BqAKfSgf6hRna%2FJ5liVJTaGLjQZzuIkbUhzudL7FTzMftgkWE2go%2BV8jJqgE4OEvWMsbkgTDBqpEDOqtjBK9wnVwieqFS%2BqCzl8l6Su0Brbl3yVV2tygIk4PINefB2MFYgJ3gyxqGeMpulDXOWXxSoB9X0z8V%2F4vrTdKSyaNp5vTnebZiDmrjsLXNH16HiQ%2BganeRSOJ%2FtgTjQ80KcNJb%2BB%2BvEWU1pw90FcoMQ7HNHFOc6qWVpR5CJNHbK4yVYR4pZt%2FlqLYGOoKWVL8vYOqVN14SQxhoDH25R4r6kYuOAPPoQ3ukEOE%2Bhk%2FgRpcMwsV5XdoILHdf401YieKt00rZk%2BG8Fe5p5dLqQV2Z1sR8%2B1w21omIwjtbHxwY6pgFtia7%2BAaqAhYHoZ2axRlBF95GszwiPq98kU%2FluyJatDSoTlRM78Qmhnmovr%2FtwzjKMB6nDJgTSd%2Fb%2FadrZqCO9bhDZ6JSfOKLAsqcJyIY%2FEe7xwvs%2FVDB88kI47UUY2lrGQ831Jee7OGxutZz%2FSmWy4nluQC1wZWFtGTmDFO%2FVi8Pao0xNtMi1qOnZ9H8cn%2BQIclVFWzdG0u%2FPBudT44R%2BN8NOGyoj&X-Amz-Signature=8ee48a9ab85ec0a735502bbedf5b131505932e77cfa3f197269252311db4f2cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
