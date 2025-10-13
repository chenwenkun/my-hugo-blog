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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WA5XFEE%2F20251013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251013T005416Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCoYiVYU6Y2PIrlk6yKJPVEDVkH%2BdRcOB89dYhd18ne%2FAIgY%2BFE5GJt766P0aD9yf%2F%2FHFF15EGkzm9jiYfS%2BDG6AxAq%2FwMIORAAGgw2Mzc0MjMxODM4MDUiDDVOUjqs147wGmnN3SrcA8aIIKPn7dcYt6gHoUX5l3DbKKocqCFy%2FEMIULPzwG9womI0hpQc3SHDr9rZPumYnbhTWb8%2BAu8oxkT%2FJTnj%2BLTQWDVgDQF6HIPPy4NLrL5xnr1Q2zRbwo8um%2Bydjaks6J%2BkWImwy4f1MHrIJ4HK9cuJAgzaLiBxtTlz2Znuu5QzNaDSnb7Jz46JliVYHtHibdpPQ4q8pWpWvLBJcpb%2BYvoG9tvLYDcZ72rT%2BqwoK62kziLMELHXKPgT6JNID4ciPBBiRDNUUetD2gpq%2F1iuwLiy4BzD1DwiJ4sOW1UP0ViiSIhceQ3XJRVLBbFGQihbl3jQAiWpUtx9%2F%2BjP0BaDMj81F%2FNr2Onz83gO2j2QqtkEg19rZwi3l4blHtXk8XPJos%2FfPOJ2VH6FXZ4K5qBbwGPlEK8W8irdISXwGhONxfc98LSHNFQ%2BD0hgvybrd8CbtY%2B9VOhXnSfOQjS6YUFDl%2BMOrYezkZGThceVxPBpWgA%2BEkaZfkjDBETMGsEf203A1nV8y%2Frdtlx%2FIVPlyaNg3TFoZclkuic6UAwYME81uaLP2J0SMAJolnNPqhIAiG%2BZO2WdkwMuWuaaSARfEaP%2BSbx40YXW39vc6QGpyWIwfizjSfMVzzzXy4mB7tdGMNj%2BsMcGOqUBMKlWr6OFkSWA4m6BU%2BsCWV3EKWTUWchGFBiEEzD1gdcrgEQUVlPOd6aBbI2CVU1hr4GbFfe9p6JpLpxUkyghBOfJgq9Ja1iWJlbSlte4d2IWk%2BxLld7yySNrD%2Fa0T1F9GBWnNQEtvdK23QN8Az%2BsOXuSpDdnwtqYkSs49oX6lf7Axx06Ize4CzUmjO%2FS9r%2F94Hfai0y%2BG8l0tybnjo0TBH1s%2FstK&X-Amz-Signature=8f51ea4d97cb13c359b11903674e29a4c0f39649fa3c89c9377d9f88499fe22f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664WA5XFEE%2F20251013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251013T005416Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCoYiVYU6Y2PIrlk6yKJPVEDVkH%2BdRcOB89dYhd18ne%2FAIgY%2BFE5GJt766P0aD9yf%2F%2FHFF15EGkzm9jiYfS%2BDG6AxAq%2FwMIORAAGgw2Mzc0MjMxODM4MDUiDDVOUjqs147wGmnN3SrcA8aIIKPn7dcYt6gHoUX5l3DbKKocqCFy%2FEMIULPzwG9womI0hpQc3SHDr9rZPumYnbhTWb8%2BAu8oxkT%2FJTnj%2BLTQWDVgDQF6HIPPy4NLrL5xnr1Q2zRbwo8um%2Bydjaks6J%2BkWImwy4f1MHrIJ4HK9cuJAgzaLiBxtTlz2Znuu5QzNaDSnb7Jz46JliVYHtHibdpPQ4q8pWpWvLBJcpb%2BYvoG9tvLYDcZ72rT%2BqwoK62kziLMELHXKPgT6JNID4ciPBBiRDNUUetD2gpq%2F1iuwLiy4BzD1DwiJ4sOW1UP0ViiSIhceQ3XJRVLBbFGQihbl3jQAiWpUtx9%2F%2BjP0BaDMj81F%2FNr2Onz83gO2j2QqtkEg19rZwi3l4blHtXk8XPJos%2FfPOJ2VH6FXZ4K5qBbwGPlEK8W8irdISXwGhONxfc98LSHNFQ%2BD0hgvybrd8CbtY%2B9VOhXnSfOQjS6YUFDl%2BMOrYezkZGThceVxPBpWgA%2BEkaZfkjDBETMGsEf203A1nV8y%2Frdtlx%2FIVPlyaNg3TFoZclkuic6UAwYME81uaLP2J0SMAJolnNPqhIAiG%2BZO2WdkwMuWuaaSARfEaP%2BSbx40YXW39vc6QGpyWIwfizjSfMVzzzXy4mB7tdGMNj%2BsMcGOqUBMKlWr6OFkSWA4m6BU%2BsCWV3EKWTUWchGFBiEEzD1gdcrgEQUVlPOd6aBbI2CVU1hr4GbFfe9p6JpLpxUkyghBOfJgq9Ja1iWJlbSlte4d2IWk%2BxLld7yySNrD%2Fa0T1F9GBWnNQEtvdK23QN8Az%2BsOXuSpDdnwtqYkSs49oX6lf7Axx06Ize4CzUmjO%2FS9r%2F94Hfai0y%2BG8l0tybnjo0TBH1s%2FstK&X-Amz-Signature=6e740c6eff8715c15bc60a40b53600df9437bf62e346737302fa68fc90e09939&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
