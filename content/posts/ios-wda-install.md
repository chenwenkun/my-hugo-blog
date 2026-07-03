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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466275J7NBC%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T084714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJGMEQCICWnLv11eaADhxbCTnB6a3cEjtMQdyYJ2TqvF5mVp0SAAiA6NyCl2uKPJirczbNJKpEuqs%2BDhCJIaX2bmHRRqjmf9Cr%2FAwgJEAAaDDYzNzQyMzE4MzgwNSIMAOQva18DU3EakEylKtwD09ADvIQxraP%2FNReNsgzIEFCm93NlJpUQSlmQO4G1qB0l1DK%2B8KRs1FBFim4NNCYs91fUGTYOXoXyR62TO0tZzgBjALqJ2NPXjVNhasmXYIKq%2BDzahDXSq7pLbaAKJgX7xctivruEP0omAnrKuR7qCIgapk8VINn6RcdTGy1T%2FEP8C8Hzr4kLxyNZKnK2fShmOuO9zlYBROvzpLG5%2FtMEGYBJu44zs10aU%2FdAO4iZbdEPuI01WK%2BzOlCDeJBRYF%2FRvxl%2BEPNb%2Bo1ss0ri1RDOvhR4vF0kV5K90T3fE%2FZm%2FUhXPc2DInMtTPSFcGBdQwJ7SweVa%2BLY5qUaZD%2FEabYEN%2BP0V9t4XKTkZTVq0DD89DLHXdZYnwmiCu1EbS%2BswrM2ew8zTBm949nynedg7MAitOCnCCqC09iTQetK%2BmmfYAZqqh9npOU7%2FjjBTC5cn5Bfi%2FE2xIXYMynVPtTbYlGEj8%2BCTIGO7L7olqq3s52eRhbFef8%2BNL2gHJ%2BOgie9sp0pIr4CvoHbN27%2FQHFOV1GEpefhgtTQJzD7CpZfWBz7V6eIsky5hMPu9Zbu8hiZGlHC4qL5q6PyaPrwWRMjPxIvVkPr17WLgTn8C94bc6KwndV3q3LvM42M1ogLdnsw8cud0gY6pgEGBnID6X2eqMI%2BJDSQWq4NYGAn8GGDTIPtwD9jMxkgaTUmfRUxZmmxFxz0zWohmkEppMJl4D69FilglpRUTTPmrhxY0QjsTJ55QMR2aAHy6SDAxsIQWWWoTELBWO6oma6%2BERPmHJMHAkVF91miGPg2pIBYPQLJVP821eEpaEWkPmpUMb0PMcVlVlWjXP3m%2BaFXeqK%2FzPs4yP%2F55pbCnnoXfxSepf%2BE&X-Amz-Signature=d7960f52391cd4d71edee4f2e9ac06ff3aa663014374ae346515a5de1bcc804b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466275J7NBC%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T084714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJGMEQCICWnLv11eaADhxbCTnB6a3cEjtMQdyYJ2TqvF5mVp0SAAiA6NyCl2uKPJirczbNJKpEuqs%2BDhCJIaX2bmHRRqjmf9Cr%2FAwgJEAAaDDYzNzQyMzE4MzgwNSIMAOQva18DU3EakEylKtwD09ADvIQxraP%2FNReNsgzIEFCm93NlJpUQSlmQO4G1qB0l1DK%2B8KRs1FBFim4NNCYs91fUGTYOXoXyR62TO0tZzgBjALqJ2NPXjVNhasmXYIKq%2BDzahDXSq7pLbaAKJgX7xctivruEP0omAnrKuR7qCIgapk8VINn6RcdTGy1T%2FEP8C8Hzr4kLxyNZKnK2fShmOuO9zlYBROvzpLG5%2FtMEGYBJu44zs10aU%2FdAO4iZbdEPuI01WK%2BzOlCDeJBRYF%2FRvxl%2BEPNb%2Bo1ss0ri1RDOvhR4vF0kV5K90T3fE%2FZm%2FUhXPc2DInMtTPSFcGBdQwJ7SweVa%2BLY5qUaZD%2FEabYEN%2BP0V9t4XKTkZTVq0DD89DLHXdZYnwmiCu1EbS%2BswrM2ew8zTBm949nynedg7MAitOCnCCqC09iTQetK%2BmmfYAZqqh9npOU7%2FjjBTC5cn5Bfi%2FE2xIXYMynVPtTbYlGEj8%2BCTIGO7L7olqq3s52eRhbFef8%2BNL2gHJ%2BOgie9sp0pIr4CvoHbN27%2FQHFOV1GEpefhgtTQJzD7CpZfWBz7V6eIsky5hMPu9Zbu8hiZGlHC4qL5q6PyaPrwWRMjPxIvVkPr17WLgTn8C94bc6KwndV3q3LvM42M1ogLdnsw8cud0gY6pgEGBnID6X2eqMI%2BJDSQWq4NYGAn8GGDTIPtwD9jMxkgaTUmfRUxZmmxFxz0zWohmkEppMJl4D69FilglpRUTTPmrhxY0QjsTJ55QMR2aAHy6SDAxsIQWWWoTELBWO6oma6%2BERPmHJMHAkVF91miGPg2pIBYPQLJVP821eEpaEWkPmpUMb0PMcVlVlWjXP3m%2BaFXeqK%2FzPs4yP%2F55pbCnnoXfxSepf%2BE&X-Amz-Signature=54b34347c56846553109fffcbeb636d750fafcf50cec4d04aafb53559a6e4894&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
