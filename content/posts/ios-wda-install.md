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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YEPFYQDZ%2F20260319%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260319T184115Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJGMEQCIFiZXcD1eZIY4EZpMCBYzQDsTekMN6xFAefhcUxPp7AKAiAQwelNlM7Z5aayE8yxlObhVENrhtgGz2ca8%2B6zDAiWMyr%2FAwgjEAAaDDYzNzQyMzE4MzgwNSIMLUB3JB9wXd%2FktBtPKtwDvzyzGu%2FqKUnIKdIVL%2F64Eu5zYviWJVMeKlinlC6IJp7Ffj36rXai8Aw%2B1BHH%2BfRO0VwdAyjL4czcw5vwoX8bPr%2BmMFqoHum00yNRXT5DcMaWYxXIUwSio%2F%2F%2F3TFIBTv0d0%2F0TQtAIWb4H7YOxb2KWpv28zxY7%2B%2Bw6TxGLJM1p4B7EScjPEoZlOZiQb4670Be6525w4P3%2BhfW8OZRpjrt8Rlk2M8fLG4BzyIwtipDHCARok0br8V2jEKG7S56CYxL5HnQMRtFVqayqWBZq032fT%2B4JxWnFS2kHL4J48%2FaEc5idZ7unQzgwaYRZT4Q6kB0h60bqgBt6%2BVlsTIFZ56JGs3Qi2auLzbkg66MmzPLIq8Bl2o2qf5W5wLvdetb3NwkRFIPGXAo2pqGTugaM9lAREXM975swPwQDXnV3xV0cff4%2B69wTQgDCP%2B%2FcugrlPIXVXIrf5431EmGHwj%2B66%2BUq3pT1tJJprToxFnJL0pPIHhlnhNzPoitwtTOl7%2FhCgSu7qgOSDlOaAPZQ%2B2P2BwgBxLe6YrRYOjci69%2BTEHl1zcr3cP5KDgdVQjD8Sck1SDGi8etvD1E4NmI%2FU6VSx1xwcpI5i%2FDp61J5KAwpGc789SP1MzqTpWOpNEg850wnvjwzQY6pgFNZcRVdxJDrxfKxhszgEg46WjEEsK8xipiTl3Py6fXbqTrihorfvB%2FkcAUTP7qa0puVAoq0C%2BI4pIovcLUJ4Vs3iryEUAPyCG%2BakPLR1js7QO7Od0zoP7dNPljh2Q8cLCv0BItKNEXGQX5v5HmS%2FRH31HKcIqKH9IgpTznA7A1PvFJsZmkoJZ%2BLyM2YG7RMsEJ%2B4Zuws5c3Kj9MrCQXVEV%2Bd4pOT71&X-Amz-Signature=68588b40fdd7df2b1b5a27e6f1c12f17e7d986e262e61a7c59dc2f7bf4fc9f66&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YEPFYQDZ%2F20260319%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260319T184115Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJGMEQCIFiZXcD1eZIY4EZpMCBYzQDsTekMN6xFAefhcUxPp7AKAiAQwelNlM7Z5aayE8yxlObhVENrhtgGz2ca8%2B6zDAiWMyr%2FAwgjEAAaDDYzNzQyMzE4MzgwNSIMLUB3JB9wXd%2FktBtPKtwDvzyzGu%2FqKUnIKdIVL%2F64Eu5zYviWJVMeKlinlC6IJp7Ffj36rXai8Aw%2B1BHH%2BfRO0VwdAyjL4czcw5vwoX8bPr%2BmMFqoHum00yNRXT5DcMaWYxXIUwSio%2F%2F%2F3TFIBTv0d0%2F0TQtAIWb4H7YOxb2KWpv28zxY7%2B%2Bw6TxGLJM1p4B7EScjPEoZlOZiQb4670Be6525w4P3%2BhfW8OZRpjrt8Rlk2M8fLG4BzyIwtipDHCARok0br8V2jEKG7S56CYxL5HnQMRtFVqayqWBZq032fT%2B4JxWnFS2kHL4J48%2FaEc5idZ7unQzgwaYRZT4Q6kB0h60bqgBt6%2BVlsTIFZ56JGs3Qi2auLzbkg66MmzPLIq8Bl2o2qf5W5wLvdetb3NwkRFIPGXAo2pqGTugaM9lAREXM975swPwQDXnV3xV0cff4%2B69wTQgDCP%2B%2FcugrlPIXVXIrf5431EmGHwj%2B66%2BUq3pT1tJJprToxFnJL0pPIHhlnhNzPoitwtTOl7%2FhCgSu7qgOSDlOaAPZQ%2B2P2BwgBxLe6YrRYOjci69%2BTEHl1zcr3cP5KDgdVQjD8Sck1SDGi8etvD1E4NmI%2FU6VSx1xwcpI5i%2FDp61J5KAwpGc789SP1MzqTpWOpNEg850wnvjwzQY6pgFNZcRVdxJDrxfKxhszgEg46WjEEsK8xipiTl3Py6fXbqTrihorfvB%2FkcAUTP7qa0puVAoq0C%2BI4pIovcLUJ4Vs3iryEUAPyCG%2BakPLR1js7QO7Od0zoP7dNPljh2Q8cLCv0BItKNEXGQX5v5HmS%2FRH31HKcIqKH9IgpTznA7A1PvFJsZmkoJZ%2BLyM2YG7RMsEJ%2B4Zuws5c3Kj9MrCQXVEV%2Bd4pOT71&X-Amz-Signature=1ab3cd315bdc275cf2bc034f75e9d9006c53a3024ba9852e25f482fc039e2ed9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
