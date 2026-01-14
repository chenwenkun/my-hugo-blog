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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663QGYFVAT%2F20260114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260114T062341Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE8aCXVzLXdlc3QtMiJIMEYCIQDDdTO6PmmqZ50mV88ZVX%2FtZaHeATLjipUcYCPqGSe%2BGQIhAPABRTvQvbPYfnetFobIyvk3XBWtR6ASIYYPqkRhL90qKv8DCBcQABoMNjM3NDIzMTgzODA1IgxjlTPxtXAo%2BVl1e%2BIq3ANy%2BI7SFJoXakHXNJLhywrT6n3S6p9%2BCfQuqYO%2B4ZZUw%2BHB0GKPJB%2BXUVGDxSz0F1vmFD19UB1cG8EICmaiaBsxJ726YVM23DKF7woL%2BMGpDdOfmsGBmueyG%2F7Gjfy6pKdLUB%2BIUYMeFrQR%2FNN5yTqKE6%2BrbZcperF8nSCT828rysy8fiMn6u%2FwvgqZbuTTWcenzwmEx3FmB%2B69tx2zygJasJwL4%2FqmvjsGcAsamxVQc7%2FjL3dYtaabAu7aNyNGywaxlcD5j802J40JH0MuYnuOe182HTxQmEs9S4nm95zRBDuS6ldbswoMw5CqMRshFZakToRyOHqY7P690%2Bhh5nqPHD8a2mqOXx8eXDfLmXMvYETY7HdRAQIhz%2FC1dbQd3HmZzmf1oLJOaTWLNw3kum6WzDnlxzfBhmxw24luDbIUZiprAKTQThwxiUECxrgLt%2FHRbeoRv2uJ0c0ZmsbA%2BILIhCdOoDJevPxV7BRSuaiHaOC0eico3zUXhRM%2FdDbs0Nd9Ojk2AfTCSwjnAEiOuEelY4S41v7CkGryh2rpnR4tn%2BzfZDN1%2F39gogtynWnGYKuKeQabArNhXEWj28KI459UVM0jwdhgyB%2F8XF8YGsT%2FRAkSHqx0ID9bH9l%2FJTDn65zLBjqkAY0vkvD0fLI2f5wl2GzKz78MPohvPeLWiSisaaxeB9cSl4QRcuug92nRboU5%2BszNhPwZmXs4F3YWsRkrnXaBs6MvNTYAfS4Ipub3egL5pPjn0tZbvtkFRBTpc5i2OpuhA0vlwGnHqzbnDeBNaiM9tNeE3r2OAjhcRfxBVR34wnsaipCzI8%2FVL%2Bsjesw3uPFV4pXuv0IKcPQQlXfFd3qrOE0gKlDc&X-Amz-Signature=899a36c653586f506331b6d2c585144f68423983a5093c4c353c073888666c17&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663QGYFVAT%2F20260114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260114T062341Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE8aCXVzLXdlc3QtMiJIMEYCIQDDdTO6PmmqZ50mV88ZVX%2FtZaHeATLjipUcYCPqGSe%2BGQIhAPABRTvQvbPYfnetFobIyvk3XBWtR6ASIYYPqkRhL90qKv8DCBcQABoMNjM3NDIzMTgzODA1IgxjlTPxtXAo%2BVl1e%2BIq3ANy%2BI7SFJoXakHXNJLhywrT6n3S6p9%2BCfQuqYO%2B4ZZUw%2BHB0GKPJB%2BXUVGDxSz0F1vmFD19UB1cG8EICmaiaBsxJ726YVM23DKF7woL%2BMGpDdOfmsGBmueyG%2F7Gjfy6pKdLUB%2BIUYMeFrQR%2FNN5yTqKE6%2BrbZcperF8nSCT828rysy8fiMn6u%2FwvgqZbuTTWcenzwmEx3FmB%2B69tx2zygJasJwL4%2FqmvjsGcAsamxVQc7%2FjL3dYtaabAu7aNyNGywaxlcD5j802J40JH0MuYnuOe182HTxQmEs9S4nm95zRBDuS6ldbswoMw5CqMRshFZakToRyOHqY7P690%2Bhh5nqPHD8a2mqOXx8eXDfLmXMvYETY7HdRAQIhz%2FC1dbQd3HmZzmf1oLJOaTWLNw3kum6WzDnlxzfBhmxw24luDbIUZiprAKTQThwxiUECxrgLt%2FHRbeoRv2uJ0c0ZmsbA%2BILIhCdOoDJevPxV7BRSuaiHaOC0eico3zUXhRM%2FdDbs0Nd9Ojk2AfTCSwjnAEiOuEelY4S41v7CkGryh2rpnR4tn%2BzfZDN1%2F39gogtynWnGYKuKeQabArNhXEWj28KI459UVM0jwdhgyB%2F8XF8YGsT%2FRAkSHqx0ID9bH9l%2FJTDn65zLBjqkAY0vkvD0fLI2f5wl2GzKz78MPohvPeLWiSisaaxeB9cSl4QRcuug92nRboU5%2BszNhPwZmXs4F3YWsRkrnXaBs6MvNTYAfS4Ipub3egL5pPjn0tZbvtkFRBTpc5i2OpuhA0vlwGnHqzbnDeBNaiM9tNeE3r2OAjhcRfxBVR34wnsaipCzI8%2FVL%2Bsjesw3uPFV4pXuv0IKcPQQlXfFd3qrOE0gKlDc&X-Amz-Signature=54e13e6b388217fd27c77fb07cdcf6c177467d156f91208319237d8185da45de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
