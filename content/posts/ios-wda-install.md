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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQ3E6A3G%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T023952Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBcaCXVzLXdlc3QtMiJHMEUCICfde8k%2F5k62rwXXXyDcDqUAe%2B7e4v7JZjLzC04wcNOnAiEAzEQodURFs0YAFRN7vs%2FlgfXsw3MgwDj7adPPRQr%2BpIwqiAQI4P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEvGp1%2BIQcfo4Kpv9CrcAxKn2C%2Fppr8tpN9zbeJ%2B5LTdKmZ5ANKuHqry7sXqC61HYFY47UOVg0ZiKnvFjtGOjDEPa6UvtSbtg83MnuKieHrG1sseMlYhl%2BTVF2tIR5hWfhZARKF2x%2BIMSlkrMwe%2Fi1QtPsJQA1Wd4VwqGXgCo9dLuZKSyEVmR6LILz9Vorp%2FOfkr0d2S4mml3qdHXCi%2BYM7%2B7w60%2FWF79%2F2%2BjyRbRkQ4SnXN%2FF3KEU%2BqlC%2ByokPHFq29nxiAAyYgvGlyuaJ%2FV3ozAGSHG2mP%2Bud%2BzkywtHdYn75%2BIZjGyBCDqxPv87%2FPxc%2BQX05UhAbszuB2HbCBdqibVHYJq2iNakoNkEwD0qutsSUe1pHLCyEow7PS352fU2QDsxAkjd%2BO4eTTel30VGM6AtynaWpstfZxa9hmzdfXxj1AYeRdAnL72MAEHD2og4XbFzsuWB1Eb1h5Chxk0FVf4QMjnjCus1cumtGsijF1hVs5IU5qCmkhNaQ94Wi4SCvjbWKO%2FpoAHSGnD5Y%2Boy1XKKuG%2BjAoEZLf7fSHPrXQsaLbq1x9XceaWeE8wLAShcssZ6g%2FmErAlQm3sWw2V%2Bp2FSuRmlffivzTpInfb%2B7yTgABj89TAUpNN0RLSynzIt1IseOpRVdOqMobMNev3NEGOqUBJJwWO7wgqBYqjRUA4bBodj%2Bn3DarC0roboQ0b%2FqIEcraAwzFpcnOTg7UqncuMOOZWgj3aNfS85ALJTcHXvGrNpx1cRuXK97v3J2m0I715nJDnXtcuhNKvaDmoC%2BTljtvXX83U6ySKfSEW9a%2BrPPS3lm4IcrTnXhvFJGrlg5EZqRnm%2BpwLFU%2FuyYqmrSBtfn7m8yswa3s9AfxLwk6i1o6DUbLeJgN&X-Amz-Signature=5cadd9029cba0b31e08d61341141bcc386bb25e3799d8599eda8c6dc2c79327e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQ3E6A3G%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T023952Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBcaCXVzLXdlc3QtMiJHMEUCICfde8k%2F5k62rwXXXyDcDqUAe%2B7e4v7JZjLzC04wcNOnAiEAzEQodURFs0YAFRN7vs%2FlgfXsw3MgwDj7adPPRQr%2BpIwqiAQI4P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEvGp1%2BIQcfo4Kpv9CrcAxKn2C%2Fppr8tpN9zbeJ%2B5LTdKmZ5ANKuHqry7sXqC61HYFY47UOVg0ZiKnvFjtGOjDEPa6UvtSbtg83MnuKieHrG1sseMlYhl%2BTVF2tIR5hWfhZARKF2x%2BIMSlkrMwe%2Fi1QtPsJQA1Wd4VwqGXgCo9dLuZKSyEVmR6LILz9Vorp%2FOfkr0d2S4mml3qdHXCi%2BYM7%2B7w60%2FWF79%2F2%2BjyRbRkQ4SnXN%2FF3KEU%2BqlC%2ByokPHFq29nxiAAyYgvGlyuaJ%2FV3ozAGSHG2mP%2Bud%2BzkywtHdYn75%2BIZjGyBCDqxPv87%2FPxc%2BQX05UhAbszuB2HbCBdqibVHYJq2iNakoNkEwD0qutsSUe1pHLCyEow7PS352fU2QDsxAkjd%2BO4eTTel30VGM6AtynaWpstfZxa9hmzdfXxj1AYeRdAnL72MAEHD2og4XbFzsuWB1Eb1h5Chxk0FVf4QMjnjCus1cumtGsijF1hVs5IU5qCmkhNaQ94Wi4SCvjbWKO%2FpoAHSGnD5Y%2Boy1XKKuG%2BjAoEZLf7fSHPrXQsaLbq1x9XceaWeE8wLAShcssZ6g%2FmErAlQm3sWw2V%2Bp2FSuRmlffivzTpInfb%2B7yTgABj89TAUpNN0RLSynzIt1IseOpRVdOqMobMNev3NEGOqUBJJwWO7wgqBYqjRUA4bBodj%2Bn3DarC0roboQ0b%2FqIEcraAwzFpcnOTg7UqncuMOOZWgj3aNfS85ALJTcHXvGrNpx1cRuXK97v3J2m0I715nJDnXtcuhNKvaDmoC%2BTljtvXX83U6ySKfSEW9a%2BrPPS3lm4IcrTnXhvFJGrlg5EZqRnm%2BpwLFU%2FuyYqmrSBtfn7m8yswa3s9AfxLwk6i1o6DUbLeJgN&X-Amz-Signature=7f248ed7cae9f94932c0af0e8283250a6bcd8a335b56b61f6a303250a45e75f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
