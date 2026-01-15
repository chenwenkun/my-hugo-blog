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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WWUQH33Y%2F20260115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260115T061958Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIQCHj%2BA0ngWejcq2AHKuFZ9QHkTrm1hZHPihQXzmqBGnDgIgJWIm7QYPQ5KXK%2FnI9WV4IQ2WyBO4bHAEwa3aC7eobwgq%2FwMILxAAGgw2Mzc0MjMxODM4MDUiDNqaX7rL%2BFzy2z2iNCrcA3DOa%2Bg%2FUFSaVTybJkkW1%2FsjJVv2NXWGkVAlRKc2UXKArWNlbun61S%2BOK2f7FT4Vib%2BiK5VJiq6Sh8zxK1aQOLIpV1HwQ523hhbFZQfC96wKEBe7V%2FJDHKlsubhubLIWLQIFrANamaq6MYRD9fUnzb%2BG%2FFzv3grxY13uIslsbf54RE8DDIcg255%2F%2FGjlL1XCFmqknecw13%2BYcSYoHOXvJI%2F345Hj51qdRxVULB06sSUIJjEUMFJ8kCw12tpg06D6uMwoYpdfxhmWbY8XqxTUuMsKns0K9mPc4fUsqVP3qcwrISfC6n%2BWo7SHswlahfqCkiJTiaV2JpWOFK0%2BfYEtNoHZE%2FVv5Jh9Rw8WvBbv%2BENhh5qlIkvHNs5845t4ngPmZ2vsmpEEoPpiXb42CfBBqbJBC3ng2CBUTbmNhPl9rDThy69YSuqfrYaYjpgkF39L6JGpSaWZNntIry0NAtLW8%2BJii0BXYEhjDD2YJMluKKCzEhRvEAchGjFWPUQt9worFsl3A2rqLuTTrrUEF7JJqSQtDlrjIZMpMWYy8DYvWjqN2kfg1zqaJd5Y%2BklM2a%2FksHm3VqAD7en0edhPWyfQe%2FERKvwQw875JShDqOEbmZTrbW89HNX0E1rJp%2BWaMJH4ocsGOqUBxcAKY8z5GSrs2GTR1c4756Z1mwFtL%2FyPxLdgl4rhKQTnVCUjSMh%2FnJCaPze6dvhaKyd5VIUfoJBB46%2BcWFOsaeR5YTYCslw0Swo0EpjJ7yqyOGLD1T95GJN9oJLpk1Mem%2BAMcIBET16AEYsCNrmJaH7DGJiIA4tujjD4kxwXoMnan8a7Yf2X%2BjmFFivNjbAGVAsYqHs2aH1isCNRkSy7QnPJ6siY&X-Amz-Signature=678fa6345148778a2fcef24de97f07a2c1f11b955be0ac16224fe81f2402c5e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WWUQH33Y%2F20260115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260115T061958Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIQCHj%2BA0ngWejcq2AHKuFZ9QHkTrm1hZHPihQXzmqBGnDgIgJWIm7QYPQ5KXK%2FnI9WV4IQ2WyBO4bHAEwa3aC7eobwgq%2FwMILxAAGgw2Mzc0MjMxODM4MDUiDNqaX7rL%2BFzy2z2iNCrcA3DOa%2Bg%2FUFSaVTybJkkW1%2FsjJVv2NXWGkVAlRKc2UXKArWNlbun61S%2BOK2f7FT4Vib%2BiK5VJiq6Sh8zxK1aQOLIpV1HwQ523hhbFZQfC96wKEBe7V%2FJDHKlsubhubLIWLQIFrANamaq6MYRD9fUnzb%2BG%2FFzv3grxY13uIslsbf54RE8DDIcg255%2F%2FGjlL1XCFmqknecw13%2BYcSYoHOXvJI%2F345Hj51qdRxVULB06sSUIJjEUMFJ8kCw12tpg06D6uMwoYpdfxhmWbY8XqxTUuMsKns0K9mPc4fUsqVP3qcwrISfC6n%2BWo7SHswlahfqCkiJTiaV2JpWOFK0%2BfYEtNoHZE%2FVv5Jh9Rw8WvBbv%2BENhh5qlIkvHNs5845t4ngPmZ2vsmpEEoPpiXb42CfBBqbJBC3ng2CBUTbmNhPl9rDThy69YSuqfrYaYjpgkF39L6JGpSaWZNntIry0NAtLW8%2BJii0BXYEhjDD2YJMluKKCzEhRvEAchGjFWPUQt9worFsl3A2rqLuTTrrUEF7JJqSQtDlrjIZMpMWYy8DYvWjqN2kfg1zqaJd5Y%2BklM2a%2FksHm3VqAD7en0edhPWyfQe%2FERKvwQw875JShDqOEbmZTrbW89HNX0E1rJp%2BWaMJH4ocsGOqUBxcAKY8z5GSrs2GTR1c4756Z1mwFtL%2FyPxLdgl4rhKQTnVCUjSMh%2FnJCaPze6dvhaKyd5VIUfoJBB46%2BcWFOsaeR5YTYCslw0Swo0EpjJ7yqyOGLD1T95GJN9oJLpk1Mem%2BAMcIBET16AEYsCNrmJaH7DGJiIA4tujjD4kxwXoMnan8a7Yf2X%2BjmFFivNjbAGVAsYqHs2aH1isCNRkSy7QnPJ6siY&X-Amz-Signature=e6c8e202a746ba9f3b8c389d1e93806755353051eccd1cf46bd3e2c6897a4e7b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
