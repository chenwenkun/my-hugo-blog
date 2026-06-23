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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZVOVTVGN%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T142531Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFUaCXVzLXdlc3QtMiJHMEUCIQCIZ9mUtVPjkRLD73adeXorMO87Q5Si1xbicIwjedc8ZAIgf3xFUjJAN0cH%2FKzoYS0D%2FeEFkewPvTBJPysRq54ISnwq%2FwMIHhAAGgw2Mzc0MjMxODM4MDUiDDQTYpNTSjt%2FiUQphyrcA69PEnRIDyZlZ6Xely9eqaO1GhJshaUZUF552EWnkqXoSLfxC9NUTNR1IlRc0gHGaFrPuXe3vi%2B6Fd%2Fm7i0nuSfRWJzXbDNc5cDCp%2BmPqS8NNA6ABCXqr%2BvxYJMeEIEQI6l8wgmxBniEon0NsSYTlse%2FSNwEEuOv8d%2F77o1cAJ1%2B34Es38QP3mMrOhCT9gcD%2FfuwUY57nEaM7RDQh99pvZyMwYEJSFih1Tl%2Fp4vigXNkoplplkYCdwPk4ECch1nGnfm2mlBkIVDWo45MBtHfdUMbvG41gzb4L4Rm9doRUOusYGp1ReSZZAaivijS36hnrOORzJlyMRxrlo5cLsa4cDxkd7DUYBmwsjhivVuniAf2oPb%2B79lanVSwHFYIFkUA3w6QWWIFVHVu8l5wJB1G%2FxkUAy39v6tiCGlQn4fv1lKWsyX0EEochGre24hx5%2FhGTxxfgrVujZypPn9vsamrVlhUfxDZwbb1U0Gz%2BGEmv%2BIkmHKyl0vJzjynmHaV8A6eWesJ2pj1NI%2BE2rRMpGm0eR2Ji9FZtM019LmDBpTAkK78NMC9o0YorcjGkpOBcxpK9GFvNkXuneJDYep%2B05k8dk0maFDRMoDtQDYyt4eGGSxGzRQxZZA%2F8NTsSKiZMPiG6tEGOqUB%2Bv1kz5Ow6KrhxwxNcJITdSMyQ3SsDn0oKX1eGT7233s6W4P6IT%2F0fUKaFKhotYptOagVJU4A%2BbOZvzqCyEAGoyoSBEll6TGnaJpQq%2BRHH6npLngGFgR5PUrJqpI3hZwKmPpG41AxePhhvAHMISh%2FMV8g1tYCmOH%2BJkUs%2BwKkQY8IXN8e9z4tmr9Y3XuaMdQLkh5iYvVLm%2B%2BJJ%2B9MCIyOCPr1Vu0c&X-Amz-Signature=d5d694a870d841593019b705f280aae9896beaca03487b204687f59d767f0950&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZVOVTVGN%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T142531Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFUaCXVzLXdlc3QtMiJHMEUCIQCIZ9mUtVPjkRLD73adeXorMO87Q5Si1xbicIwjedc8ZAIgf3xFUjJAN0cH%2FKzoYS0D%2FeEFkewPvTBJPysRq54ISnwq%2FwMIHhAAGgw2Mzc0MjMxODM4MDUiDDQTYpNTSjt%2FiUQphyrcA69PEnRIDyZlZ6Xely9eqaO1GhJshaUZUF552EWnkqXoSLfxC9NUTNR1IlRc0gHGaFrPuXe3vi%2B6Fd%2Fm7i0nuSfRWJzXbDNc5cDCp%2BmPqS8NNA6ABCXqr%2BvxYJMeEIEQI6l8wgmxBniEon0NsSYTlse%2FSNwEEuOv8d%2F77o1cAJ1%2B34Es38QP3mMrOhCT9gcD%2FfuwUY57nEaM7RDQh99pvZyMwYEJSFih1Tl%2Fp4vigXNkoplplkYCdwPk4ECch1nGnfm2mlBkIVDWo45MBtHfdUMbvG41gzb4L4Rm9doRUOusYGp1ReSZZAaivijS36hnrOORzJlyMRxrlo5cLsa4cDxkd7DUYBmwsjhivVuniAf2oPb%2B79lanVSwHFYIFkUA3w6QWWIFVHVu8l5wJB1G%2FxkUAy39v6tiCGlQn4fv1lKWsyX0EEochGre24hx5%2FhGTxxfgrVujZypPn9vsamrVlhUfxDZwbb1U0Gz%2BGEmv%2BIkmHKyl0vJzjynmHaV8A6eWesJ2pj1NI%2BE2rRMpGm0eR2Ji9FZtM019LmDBpTAkK78NMC9o0YorcjGkpOBcxpK9GFvNkXuneJDYep%2B05k8dk0maFDRMoDtQDYyt4eGGSxGzRQxZZA%2F8NTsSKiZMPiG6tEGOqUB%2Bv1kz5Ow6KrhxwxNcJITdSMyQ3SsDn0oKX1eGT7233s6W4P6IT%2F0fUKaFKhotYptOagVJU4A%2BbOZvzqCyEAGoyoSBEll6TGnaJpQq%2BRHH6npLngGFgR5PUrJqpI3hZwKmPpG41AxePhhvAHMISh%2FMV8g1tYCmOH%2BJkUs%2BwKkQY8IXN8e9z4tmr9Y3XuaMdQLkh5iYvVLm%2B%2BJJ%2B9MCIyOCPr1Vu0c&X-Amz-Signature=f0d24e17b6b71d201b7bd19ed6331ff22021d9bd17f1d21b4cc08df6cf4ba503&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
