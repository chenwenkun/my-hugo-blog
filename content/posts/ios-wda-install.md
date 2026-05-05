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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYSBDWYO%2F20260505%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260505T075245Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDPHxNutU23HzziG3sUz%2FM5gIOeza%2BFmaLlkwqcGMlUZAIgbFGPtI4n88YewSMgWf261aMqIl3%2FB0%2F2gVgrvnSTfKYqiAQIgP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLkCDHiwCIQt%2BgMeiyrcAw3Ruj9vatVQ16nxnST70UQQ1bKZN4FoUxUzN8qZW4qjKxsFyu7U4p%2F%2FvJC5BWnxHxhQIMhbEc5brL%2BoigO7nCLSEG5012e%2FVi12JyTQfZeLdawCxBaNabtCLmyOo8fd7wkVnUE1n9JWVFuj%2Bi2fRLmSHU4N2Pe5oKBq2Uo4iFSx%2BHfBcmgGV0PQ4SNR4k8utl88F%2Bvnu3npH%2BbBp8pbDh3cucxYgIzR68RTiEtmwCtKrtefDZXFJO3yRZrnBgA0Jz1YJVXfijNlGsVh7RlD0aM3l%2FJ8Qotg%2Bjy06HOSIuZQ7a4LEE7vlmfn8SmMtsX9lRjyrAtYlJ%2FJKzYwzGxDfHv%2Bjr%2BY00RZivZBXbnPMzlQ47gAWotSKOHBqcMN%2FjT4ztFYXjDenAJQBxt%2BfwhTYdkBy48UG3i8Dk4jcolTqky3ku1jjEDlRiCEoHjTehehe7cJAMJMOha1nZqUrbv2ZtbiQK8G8LSX%2FKl%2BTtXbqpfFqNXJjSfjGnj%2FbRcL56kGQCWIm57HAqLKNnuVOyPhKkUVTymesX8nptUAH3sk%2B%2FCj6VAds9cnGu36rgQy750VTnP0ATuFUO%2F5McuSHeFxYfdeoxL5YkkFNQZkzoJ19buohyuIbt6eoIkAQ%2FAFMMCj5s8GOqUB5LpuXlFdCoQaSJFbHzR6AoIFn%2BJyTbnnfCKMLvxhLzy9BgfhoHJ0SArno9N717SgLstMbkixJvznJqQryhuOnqmUDbFKeouj8v1PeZql5QD5qAQIGLlM28knZG6ziy%2F8O16%2FtZONsWlcTaxcIEa1EK2vWIlN%2F0ERPvOvQxDThD4F%2BleLeha5rna4Qom4QaMv%2BsXXhVLa7t0K1gERrME%2F%2FPhBxHKe&X-Amz-Signature=17bf28b7092ab33e81efdaf7efdee6520827fcb32417f6e22df8be705de22221&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYSBDWYO%2F20260505%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260505T075245Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDPHxNutU23HzziG3sUz%2FM5gIOeza%2BFmaLlkwqcGMlUZAIgbFGPtI4n88YewSMgWf261aMqIl3%2FB0%2F2gVgrvnSTfKYqiAQIgP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLkCDHiwCIQt%2BgMeiyrcAw3Ruj9vatVQ16nxnST70UQQ1bKZN4FoUxUzN8qZW4qjKxsFyu7U4p%2F%2FvJC5BWnxHxhQIMhbEc5brL%2BoigO7nCLSEG5012e%2FVi12JyTQfZeLdawCxBaNabtCLmyOo8fd7wkVnUE1n9JWVFuj%2Bi2fRLmSHU4N2Pe5oKBq2Uo4iFSx%2BHfBcmgGV0PQ4SNR4k8utl88F%2Bvnu3npH%2BbBp8pbDh3cucxYgIzR68RTiEtmwCtKrtefDZXFJO3yRZrnBgA0Jz1YJVXfijNlGsVh7RlD0aM3l%2FJ8Qotg%2Bjy06HOSIuZQ7a4LEE7vlmfn8SmMtsX9lRjyrAtYlJ%2FJKzYwzGxDfHv%2Bjr%2BY00RZivZBXbnPMzlQ47gAWotSKOHBqcMN%2FjT4ztFYXjDenAJQBxt%2BfwhTYdkBy48UG3i8Dk4jcolTqky3ku1jjEDlRiCEoHjTehehe7cJAMJMOha1nZqUrbv2ZtbiQK8G8LSX%2FKl%2BTtXbqpfFqNXJjSfjGnj%2FbRcL56kGQCWIm57HAqLKNnuVOyPhKkUVTymesX8nptUAH3sk%2B%2FCj6VAds9cnGu36rgQy750VTnP0ATuFUO%2F5McuSHeFxYfdeoxL5YkkFNQZkzoJ19buohyuIbt6eoIkAQ%2FAFMMCj5s8GOqUB5LpuXlFdCoQaSJFbHzR6AoIFn%2BJyTbnnfCKMLvxhLzy9BgfhoHJ0SArno9N717SgLstMbkixJvznJqQryhuOnqmUDbFKeouj8v1PeZql5QD5qAQIGLlM28knZG6ziy%2F8O16%2FtZONsWlcTaxcIEa1EK2vWIlN%2F0ERPvOvQxDThD4F%2BleLeha5rna4Qom4QaMv%2BsXXhVLa7t0K1gERrME%2F%2FPhBxHKe&X-Amz-Signature=0262496ea4eb1f3451ce516a28b0a39f61337174e32c2a053ffcbc936ff96df1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
