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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QRVGJENG%2F20260801%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260801T185252Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJHMEUCIDvDHcHZ7G1iuvdzSan%2Fvc5ySuDUVLhm%2FDmkEf%2Bq%2B38cAiEAkLQ3%2FPbZ1V8bjuUZf0gRH2TMpcLbPY%2F4kDujVSlyuAcqiAQIzP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDF%2BG6INdTvVGwaZtgSrcA7anwt%2BsA4xQcHX7FzlouQWCnSSmdWOy4ch3WNYuFvJDpkG%2BLJ%2Fp09fYazV3j8boDHamfiUSM%2BYM1o9ey%2BLxIm%2FI7wkfv7M8UPKBJRS2Ej9G8UGGi79QaOY5zCUcopBd2C1%2FsbiVHTw5ctXdcXZZ27mUa3kNszGkvWj3aaj6tdbXNueVmkShK5HOI6aMEfcs7qeD3jBO4eRKibjG0Qnfzari3Xe%2Frw4LbIJE%2F7TSFwZtTvDOfhvhcQH8WKGP03G%2BNYIdYGGcV7wl4pJ3NS8171yCUhmPNSaKFsMlUEa%2FFT2NWLyOerI8RnFRUxIlWlkwe3xC%2Fpiufjnoc%2F%2FPWEd7z4BgtJrOly87t7C9yJPFTeApgtwCahp0ij7I6925HcmKOujiYNniRMV74xFyUeISYhW243BYR1UX6J1CNy76d8ZAhGVvDVnXML1SxxrQqh04Poi191eMZySsR6F3azBzJEV5TmtqgSJBIknfzWHsk373gQIiuVf3%2F1qt1ohDFIr0jPF1HyBcIqsx9RN0zT%2FK5MPdat9WlZW5d4LYmGqo%2FSTIxeFW5K61eNe2d%2F%2F4JVzQ3sAC5dTNUA7sAnQjTeHCpdl%2FAtVyuohlMjiheU6A9tv3Yh%2Bu0XOIC13CV8voMOf2uNMGOqUBkuQ%2B0W63bgFs8EzCekCsvYU%2Fs3CFMBtK8W%2FKDZhX7mxGK86V6uoGBoz4MHW%2BDZI4Ao14vSEkTj7WsGbIwozdGac5%2B40fAM7E1nW0KNkRkMB%2FUXjo7qZlC9AszS6WvIKLWiVv3gH6wqtfGfT%2BXln5mbrOPGz0wuYv3rgpZdcA6NGUSL6Fu1e0PoLL50WTALvIrP53nboYEeJs40bbgX%2FIrhmj%2B8xR&X-Amz-Signature=b75b2a427b4f91fc5155d19cbc9f5f2cfc7c9ba78a0b8bc08466e21fc010e22c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QRVGJENG%2F20260801%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260801T185252Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJHMEUCIDvDHcHZ7G1iuvdzSan%2Fvc5ySuDUVLhm%2FDmkEf%2Bq%2B38cAiEAkLQ3%2FPbZ1V8bjuUZf0gRH2TMpcLbPY%2F4kDujVSlyuAcqiAQIzP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDF%2BG6INdTvVGwaZtgSrcA7anwt%2BsA4xQcHX7FzlouQWCnSSmdWOy4ch3WNYuFvJDpkG%2BLJ%2Fp09fYazV3j8boDHamfiUSM%2BYM1o9ey%2BLxIm%2FI7wkfv7M8UPKBJRS2Ej9G8UGGi79QaOY5zCUcopBd2C1%2FsbiVHTw5ctXdcXZZ27mUa3kNszGkvWj3aaj6tdbXNueVmkShK5HOI6aMEfcs7qeD3jBO4eRKibjG0Qnfzari3Xe%2Frw4LbIJE%2F7TSFwZtTvDOfhvhcQH8WKGP03G%2BNYIdYGGcV7wl4pJ3NS8171yCUhmPNSaKFsMlUEa%2FFT2NWLyOerI8RnFRUxIlWlkwe3xC%2Fpiufjnoc%2F%2FPWEd7z4BgtJrOly87t7C9yJPFTeApgtwCahp0ij7I6925HcmKOujiYNniRMV74xFyUeISYhW243BYR1UX6J1CNy76d8ZAhGVvDVnXML1SxxrQqh04Poi191eMZySsR6F3azBzJEV5TmtqgSJBIknfzWHsk373gQIiuVf3%2F1qt1ohDFIr0jPF1HyBcIqsx9RN0zT%2FK5MPdat9WlZW5d4LYmGqo%2FSTIxeFW5K61eNe2d%2F%2F4JVzQ3sAC5dTNUA7sAnQjTeHCpdl%2FAtVyuohlMjiheU6A9tv3Yh%2Bu0XOIC13CV8voMOf2uNMGOqUBkuQ%2B0W63bgFs8EzCekCsvYU%2Fs3CFMBtK8W%2FKDZhX7mxGK86V6uoGBoz4MHW%2BDZI4Ao14vSEkTj7WsGbIwozdGac5%2B40fAM7E1nW0KNkRkMB%2FUXjo7qZlC9AszS6WvIKLWiVv3gH6wqtfGfT%2BXln5mbrOPGz0wuYv3rgpZdcA6NGUSL6Fu1e0PoLL50WTALvIrP53nboYEeJs40bbgX%2FIrhmj%2B8xR&X-Amz-Signature=192e5d879966c250009fd3c5bf0040f3a19614555fe00314cbacb17d1f8855f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
