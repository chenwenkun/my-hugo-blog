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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ZCO2IWG%2F20251130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251130T181503Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJGMEQCIB%2BzHOTSGRe8A8nHsQabI7ba8fpv34yW2Js5q8yHj%2BjfAiB0xK19sI3w5DdP%2FeW%2BK7%2F%2FabdKCJw83jtCM1IBbULQCCqIBAjq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMKZkMmkIMu1uv3ygMKtwDN%2FzBti5I4kTw3KjUX8Xgh2kxk0Ckv6ekWppw5xhIw3hvyEVYYiwsJFlDba%2B4gyF7dTUtCLtNubUswKeFYKsTJnPuXp8liVjsr1kIT9VbfufFgM81aCw42x%2FprNROs%2FKTDU54YfL23h6nLvzmzo3LvoOur8JHOaq9LGjsVa%2BoX9lH8no%2FmL2G5TB6%2BxjYzS2G0SDnkeSt6jMR73JLtcqJWH237Lm24gWwXOBCtIhHdgfeSzQHd9OMmmYm9oH6QvVqi58wLj9yC0DeK30%2FizvCdofwfuWrs8ohkiIBI4E%2F8%2Ff7k0XLHOPavGEq97MMYXILhAK7MA7%2FKH6GbjrfVrWKTJgUxJYMS9iDTEVPztgM%2Ft4PbRdjot0FOBR2dC1wpzfR7h%2BVZIEod6lZ8%2BvoqpFNVkjApAxXqi2ttc2Vk3XushxqZY2L8G6hhouHQYri2ILaQqAiMAYjwVG9S%2FFOQSGkk3m7MwCR0Af%2BA1Wk6V8sywTKgVxjZQGuQdGR1tmqpF2cjzYx%2FjezxILshV5rec%2BAo19UwR95DRxHZdlfCCSVkB4s5Ac1uvdyJtKg3iNJHqbjpRXEEjpBCT9FldcHzcGO8zzut1fumgrDt88xnzueCCq9%2FOLMGahY5kWFyJgwwt%2BxyQY6pgHR%2BFWN7yMjH0IxM58Q7iRhgM%2BMxI22bFPl6no28RpnyW7Az2zxdqTJuMR2TU%2ByA1hCuFYSB%2B5DRQ21TCD7lZDLa1Tn9DXKiiTy0w5KrqaTZiZG4CPIDdui%2B96T6uK8rY6HRtLKOOxtn5c6r2BOPR14PskeThk7O2VurVYBmgR5E0sVcZP3AsAyYmgxWGbZAphmDSxc0qKamM9FNvVD4I%2BJHo8r1I%2Bh&X-Amz-Signature=bb9122f47336d66cc728da2737177a76dbf94fea2d0a825260f3fd7d4429873b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ZCO2IWG%2F20251130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251130T181503Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJGMEQCIB%2BzHOTSGRe8A8nHsQabI7ba8fpv34yW2Js5q8yHj%2BjfAiB0xK19sI3w5DdP%2FeW%2BK7%2F%2FabdKCJw83jtCM1IBbULQCCqIBAjq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMKZkMmkIMu1uv3ygMKtwDN%2FzBti5I4kTw3KjUX8Xgh2kxk0Ckv6ekWppw5xhIw3hvyEVYYiwsJFlDba%2B4gyF7dTUtCLtNubUswKeFYKsTJnPuXp8liVjsr1kIT9VbfufFgM81aCw42x%2FprNROs%2FKTDU54YfL23h6nLvzmzo3LvoOur8JHOaq9LGjsVa%2BoX9lH8no%2FmL2G5TB6%2BxjYzS2G0SDnkeSt6jMR73JLtcqJWH237Lm24gWwXOBCtIhHdgfeSzQHd9OMmmYm9oH6QvVqi58wLj9yC0DeK30%2FizvCdofwfuWrs8ohkiIBI4E%2F8%2Ff7k0XLHOPavGEq97MMYXILhAK7MA7%2FKH6GbjrfVrWKTJgUxJYMS9iDTEVPztgM%2Ft4PbRdjot0FOBR2dC1wpzfR7h%2BVZIEod6lZ8%2BvoqpFNVkjApAxXqi2ttc2Vk3XushxqZY2L8G6hhouHQYri2ILaQqAiMAYjwVG9S%2FFOQSGkk3m7MwCR0Af%2BA1Wk6V8sywTKgVxjZQGuQdGR1tmqpF2cjzYx%2FjezxILshV5rec%2BAo19UwR95DRxHZdlfCCSVkB4s5Ac1uvdyJtKg3iNJHqbjpRXEEjpBCT9FldcHzcGO8zzut1fumgrDt88xnzueCCq9%2FOLMGahY5kWFyJgwwt%2BxyQY6pgHR%2BFWN7yMjH0IxM58Q7iRhgM%2BMxI22bFPl6no28RpnyW7Az2zxdqTJuMR2TU%2ByA1hCuFYSB%2B5DRQ21TCD7lZDLa1Tn9DXKiiTy0w5KrqaTZiZG4CPIDdui%2B96T6uK8rY6HRtLKOOxtn5c6r2BOPR14PskeThk7O2VurVYBmgR5E0sVcZP3AsAyYmgxWGbZAphmDSxc0qKamM9FNvVD4I%2BJHo8r1I%2Bh&X-Amz-Signature=bf42b7d0ed0b7f61965356f21db18f9ba32d2b2005d6338257469516b70f091d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
