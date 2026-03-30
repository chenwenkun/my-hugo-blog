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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T7M3O7ZD%2F20260330%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260330T125318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJHMEUCIG%2BmFpEzKrcECbvFcsOrpncjtzNeysAty3eE4gLWOEDfAiEA0Kp7L%2FZoAFpv0aXCc4dn16jLH3f5trkVUCQSrUmuD%2F8q%2FwMIJRAAGgw2Mzc0MjMxODM4MDUiDFzDkq357ck77AWIcSrcA2rGFS%2BdHq0CGMcvofUFsFfgzPAQXVAgGpp5QNZTqgezB4nxAu7CGvRzXWbJmbdl84pCkUkuxJo%2BcbVYJ%2FrV3J6sec%2F%2BOR3eE%2Fij4CjRy6HvE8BfejqyQKlYfXgwl8SyaCzEOFKto9OviGxlD6%2BPmQSHLiWhLnCrkuaWqRw6ItFgJlU%2F1RM2AqtnmMeMCiy%2Ft5DgW5eM0cCVve7MQ7uw5zeaotoaNCo4TKagMemZVakftQ2pMt4yPIg04%2FQkeib16K0F0Wx73pJNnsJWAqh8XpMZQkC8EOusZiV9RPCzSgZmtlAJSQXn2ma203QeQa5%2FS80slb5OCxnfTg24f%2FtkszhjK8cqp6llYtLvktpcC%2B56Na9wE99CrYTNhm%2FIMLPFZRqmj8ZKUouLqFe1WGFZdAjQf%2FzHB3f60mE0nOxXOIwGXdHZEIsF789wYGuAx0kogv7Cpbp9pS7PnOXxlQMgPVKJns22wOZhXkhX%2B5w3rxu8ey3kL7sxEwuNUAPkIVgumRQPWrcKfoMETz6mE8F1iWb3aZY4bmuaqN1LhUM0bOQPju%2BTFvFEetTUDRywQKrwaygETrq2fnlYmq7orn%2BAQ0vZjtMW4lBTrmKU9ZCWEoEUHgzIDGpBynWr%2Fp%2F2ML3Cqc4GOqUB%2B%2Fifdw4ygdYKlfw7B608kP09wHMzLDMp5icsIO5qdlUBdfCvpQ3SaowZQxdvrDkF6h%2B3Pdc1NKBudPIJRXIKdbeDbAjsMQawWiGi3P8LvG7kYoBGMlWjUdSfef6a47tD%2FPn5R0BudOxHqcglaW2cZHMRTHwrvM6PhBYLweOe3qeJY%2B%2Fs%2BFAGNUZ2Eom34NW9wqZ7a4oUbMZUVHzF%2FqdTTahwnr%2Bg&X-Amz-Signature=9d27c0351497c63bd17b62540de0b49b97648f1358e2a688e2bae43259ab7add&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T7M3O7ZD%2F20260330%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260330T125317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJHMEUCIG%2BmFpEzKrcECbvFcsOrpncjtzNeysAty3eE4gLWOEDfAiEA0Kp7L%2FZoAFpv0aXCc4dn16jLH3f5trkVUCQSrUmuD%2F8q%2FwMIJRAAGgw2Mzc0MjMxODM4MDUiDFzDkq357ck77AWIcSrcA2rGFS%2BdHq0CGMcvofUFsFfgzPAQXVAgGpp5QNZTqgezB4nxAu7CGvRzXWbJmbdl84pCkUkuxJo%2BcbVYJ%2FrV3J6sec%2F%2BOR3eE%2Fij4CjRy6HvE8BfejqyQKlYfXgwl8SyaCzEOFKto9OviGxlD6%2BPmQSHLiWhLnCrkuaWqRw6ItFgJlU%2F1RM2AqtnmMeMCiy%2Ft5DgW5eM0cCVve7MQ7uw5zeaotoaNCo4TKagMemZVakftQ2pMt4yPIg04%2FQkeib16K0F0Wx73pJNnsJWAqh8XpMZQkC8EOusZiV9RPCzSgZmtlAJSQXn2ma203QeQa5%2FS80slb5OCxnfTg24f%2FtkszhjK8cqp6llYtLvktpcC%2B56Na9wE99CrYTNhm%2FIMLPFZRqmj8ZKUouLqFe1WGFZdAjQf%2FzHB3f60mE0nOxXOIwGXdHZEIsF789wYGuAx0kogv7Cpbp9pS7PnOXxlQMgPVKJns22wOZhXkhX%2B5w3rxu8ey3kL7sxEwuNUAPkIVgumRQPWrcKfoMETz6mE8F1iWb3aZY4bmuaqN1LhUM0bOQPju%2BTFvFEetTUDRywQKrwaygETrq2fnlYmq7orn%2BAQ0vZjtMW4lBTrmKU9ZCWEoEUHgzIDGpBynWr%2Fp%2F2ML3Cqc4GOqUB%2B%2Fifdw4ygdYKlfw7B608kP09wHMzLDMp5icsIO5qdlUBdfCvpQ3SaowZQxdvrDkF6h%2B3Pdc1NKBudPIJRXIKdbeDbAjsMQawWiGi3P8LvG7kYoBGMlWjUdSfef6a47tD%2FPn5R0BudOxHqcglaW2cZHMRTHwrvM6PhBYLweOe3qeJY%2B%2Fs%2BFAGNUZ2Eom34NW9wqZ7a4oUbMZUVHzF%2FqdTTahwnr%2Bg&X-Amz-Signature=43f76b0065a25e41b9dde66ea2edd39e810f20a73c2d0c131dd0e302040be1e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
