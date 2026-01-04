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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TQOVOQUB%2F20260104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260104T181614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIQCLE4DUE3crQ4En5wCaMO6YWjET1yhNgaoR2hkKZitJ%2BQIgWRuw97vlbdM3DiSNFUF12IqNmkJHfNnSxfH2jRwwUU4q%2FwMILxAAGgw2Mzc0MjMxODM4MDUiDDrh2y97kOAKD0jYaSrcA6aKLf3bWYhis9h6r2sUwBeBLvzzGYS422i0KOgN8vYthOyrJP6VYKnYET1mTs7MTvK%2BvqXlsPH8IiWB6a9GP%2FLTA3oA1eQ5qbyq7ztCha66f13UT5as%2BWdz4i0ZLIZei%2FI%2B%2FGW1QJYYinPQ%2BKeE3OUpkZBSfy%2BiKXCg6Xu3AaqlSBUNY3JYt3xxui1OIBvvOZ25yCe9ZYi0JoNPxQjIS9DyjRlwMasJYJ6VfxqqamR5y63Pwuqi6JTvxXdpa%2Bzao1lJdW7DuBD0dSp7AkCXk154gytK3nX3Kl9aN8RE9fZzlFLyKE56AJMWm0tQy140U8cvOgY4Q5792XPECKOs50iOFvQN%2Fh3bI%2F%2FYbitixvASwRylIzNnKL6PwbF6aMFWQEXzFqI4b5ZCsCJhJiqcPbbi0ao%2FHi8F%2FjosE6x6BB%2F7KMhu6dYKKeWvB3oQEXOHK8Xj2rNrQYPI0WAfSdnPmha%2BhRGGtgFlMXksReqEYKNRGGKb4wxHzCvCiRxn%2FVZ8Y3iF6YufisSiAJgrit%2FwN4FI6woEa4HzpcVFXUXO5dtPCla6h%2Fxy9LrGw2AuQi%2BuX2%2B1ngHB%2BuklpmYDb4tBsSs%2BWmw07yCg5N%2Fe9fOywFTgsLm1itO%2F%2FoCjzpf7MOfb6coGOqUBkDwSlVaqB1W1ZtUqmOMhdSrqhdmPB%2FWKLlNT5wJ%2BcVRwoYqDSg%2BStGA57VoBUrstTBXrnfLdopGhwcrHpl6Q24DJVjSaHgdt68d56aIZ%2B8IrPxOUiY4Q4gi1NxwdmYE5NwubPP7%2FlVeQRt%2BApqfz46bZx1hp%2BHIqAD0MKkibKpQZwo29mzwPXn88%2FiGNGsTsHvXWN41L%2F%2Bqbhhc4mW8ocVSppVr7&X-Amz-Signature=73735293f7c4b10cfe0d8d0b46edfe18db09cdb8c687c57954231af693fe7ea7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TQOVOQUB%2F20260104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260104T181614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIQCLE4DUE3crQ4En5wCaMO6YWjET1yhNgaoR2hkKZitJ%2BQIgWRuw97vlbdM3DiSNFUF12IqNmkJHfNnSxfH2jRwwUU4q%2FwMILxAAGgw2Mzc0MjMxODM4MDUiDDrh2y97kOAKD0jYaSrcA6aKLf3bWYhis9h6r2sUwBeBLvzzGYS422i0KOgN8vYthOyrJP6VYKnYET1mTs7MTvK%2BvqXlsPH8IiWB6a9GP%2FLTA3oA1eQ5qbyq7ztCha66f13UT5as%2BWdz4i0ZLIZei%2FI%2B%2FGW1QJYYinPQ%2BKeE3OUpkZBSfy%2BiKXCg6Xu3AaqlSBUNY3JYt3xxui1OIBvvOZ25yCe9ZYi0JoNPxQjIS9DyjRlwMasJYJ6VfxqqamR5y63Pwuqi6JTvxXdpa%2Bzao1lJdW7DuBD0dSp7AkCXk154gytK3nX3Kl9aN8RE9fZzlFLyKE56AJMWm0tQy140U8cvOgY4Q5792XPECKOs50iOFvQN%2Fh3bI%2F%2FYbitixvASwRylIzNnKL6PwbF6aMFWQEXzFqI4b5ZCsCJhJiqcPbbi0ao%2FHi8F%2FjosE6x6BB%2F7KMhu6dYKKeWvB3oQEXOHK8Xj2rNrQYPI0WAfSdnPmha%2BhRGGtgFlMXksReqEYKNRGGKb4wxHzCvCiRxn%2FVZ8Y3iF6YufisSiAJgrit%2FwN4FI6woEa4HzpcVFXUXO5dtPCla6h%2Fxy9LrGw2AuQi%2BuX2%2B1ngHB%2BuklpmYDb4tBsSs%2BWmw07yCg5N%2Fe9fOywFTgsLm1itO%2F%2FoCjzpf7MOfb6coGOqUBkDwSlVaqB1W1ZtUqmOMhdSrqhdmPB%2FWKLlNT5wJ%2BcVRwoYqDSg%2BStGA57VoBUrstTBXrnfLdopGhwcrHpl6Q24DJVjSaHgdt68d56aIZ%2B8IrPxOUiY4Q4gi1NxwdmYE5NwubPP7%2FlVeQRt%2BApqfz46bZx1hp%2BHIqAD0MKkibKpQZwo29mzwPXn88%2FiGNGsTsHvXWN41L%2F%2Bqbhhc4mW8ocVSppVr7&X-Amz-Signature=053c0866a6d4c6277d6523af08baab18313b850017bfd503441bbe9c736c0501&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
