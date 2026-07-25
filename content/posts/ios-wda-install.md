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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRB67ATW%2F20260725%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260725T014412Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCICFBXJCpdy7pebKM0HWb6QG3%2FH0vFl2KJ8C5ud0v88tAAiEAtOL%2FdqIxuBWn7gsQT8oTgi7kAqECq4%2F0t3FOcjc7oM8q%2FwMIEBAAGgw2Mzc0MjMxODM4MDUiDNAL8mP3ZtHyHw%2F8JyrcA6UpKlErCFymMi1hbDiFrmaCMuEp3QNJceye3c%2FazUDeLgFecEUSgLs9MRVcU%2FXc6jMfr9TcGWpj8ws6u%2FofJgGpD0XsQyEANEOJD8kv18GH%2B832QTvYg2lwN6IRRBkzN%2FQg5pBEpvavM5qJZ2X2AGgyqUw2LToKkvYQM4yy1mFZnH4y6AYjaZNoqAC2N1VsbzhpzvkT80%2FEtQtw4PdG4pOJeXIMW%2BoaCkjCktmYFZ%2FRom67B8ScI8rVcgXI783PGPWsFkU8uI7hGdtWVulRYQRqfm2%2F%2FweLyMljeBnVPrYwNOb91xNCazbGTMJYIcGY44kexhGJc20gER7XgvXlLDB9Tj7m5n9blCw9IfRWgzUovO908nYYae7bxd4BZ5xe8Dca3NeAIwh5PDcrVKutrHoeFFrx3s%2BAVLXCKiwiIp0Ylv%2Fnc2JwD9v7hzyp13s4n%2BE9SBmyteGgmqitzSHlyHLsKmG%2B5G9aJotxRyapHKVc12eBfOD9WUqjgQzBMG8%2FJdD9Txfi%2BbH7c6YJ3nDI5Jv7AZU4pzYeNAf9Pdhjw2qutFrjH6GKT%2FcYHJXLo4Vml32sEO5cA%2BLC562O%2BfJ2OuOxNWMOQMLLHoP7uSxagB7h3%2Bg02TnajpJ8dN2%2FMPjoj9MGOqUBXKwsiTiolQsNLcyn4%2BQrTP7b2a0BKAm0yDR94PZYr%2F%2Byu3CjxE%2FUJp%2B5Bo2i2SIdrtRVsiyWfBd9bqO0R%2FgXkIB903IMKc9Z65r7giI7sakw4C%2FG41dCcLP5MZO%2FX9QG7A17GRILiD8KaRyh%2F8qdzRiErueIom%2FalUkn6Y%2BIrP%2Bcu%2BMh5Y6QyhmTVLoGUqeu3a%2BKQHfCmQINZNXwPgd86e05kCBw&X-Amz-Signature=f74279ed97988f410ee67733153b4e14152446b06a21c1eb8cbe51e4d2e22c80&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRB67ATW%2F20260725%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260725T014412Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCICFBXJCpdy7pebKM0HWb6QG3%2FH0vFl2KJ8C5ud0v88tAAiEAtOL%2FdqIxuBWn7gsQT8oTgi7kAqECq4%2F0t3FOcjc7oM8q%2FwMIEBAAGgw2Mzc0MjMxODM4MDUiDNAL8mP3ZtHyHw%2F8JyrcA6UpKlErCFymMi1hbDiFrmaCMuEp3QNJceye3c%2FazUDeLgFecEUSgLs9MRVcU%2FXc6jMfr9TcGWpj8ws6u%2FofJgGpD0XsQyEANEOJD8kv18GH%2B832QTvYg2lwN6IRRBkzN%2FQg5pBEpvavM5qJZ2X2AGgyqUw2LToKkvYQM4yy1mFZnH4y6AYjaZNoqAC2N1VsbzhpzvkT80%2FEtQtw4PdG4pOJeXIMW%2BoaCkjCktmYFZ%2FRom67B8ScI8rVcgXI783PGPWsFkU8uI7hGdtWVulRYQRqfm2%2F%2FweLyMljeBnVPrYwNOb91xNCazbGTMJYIcGY44kexhGJc20gER7XgvXlLDB9Tj7m5n9blCw9IfRWgzUovO908nYYae7bxd4BZ5xe8Dca3NeAIwh5PDcrVKutrHoeFFrx3s%2BAVLXCKiwiIp0Ylv%2Fnc2JwD9v7hzyp13s4n%2BE9SBmyteGgmqitzSHlyHLsKmG%2B5G9aJotxRyapHKVc12eBfOD9WUqjgQzBMG8%2FJdD9Txfi%2BbH7c6YJ3nDI5Jv7AZU4pzYeNAf9Pdhjw2qutFrjH6GKT%2FcYHJXLo4Vml32sEO5cA%2BLC562O%2BfJ2OuOxNWMOQMLLHoP7uSxagB7h3%2Bg02TnajpJ8dN2%2FMPjoj9MGOqUBXKwsiTiolQsNLcyn4%2BQrTP7b2a0BKAm0yDR94PZYr%2F%2Byu3CjxE%2FUJp%2B5Bo2i2SIdrtRVsiyWfBd9bqO0R%2FgXkIB903IMKc9Z65r7giI7sakw4C%2FG41dCcLP5MZO%2FX9QG7A17GRILiD8KaRyh%2F8qdzRiErueIom%2FalUkn6Y%2BIrP%2Bcu%2BMh5Y6QyhmTVLoGUqeu3a%2BKQHfCmQINZNXwPgd86e05kCBw&X-Amz-Signature=47a5543eba36d81fad290ee9912ef838d33a34317ae1aa3828e5b89d6edd7bb5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
