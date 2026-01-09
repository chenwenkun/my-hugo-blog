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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663WYENTNZ%2F20260109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260109T061928Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDaP2vdcxeWwE3UpZHENGH8EcpLdN4zb7f7kCSB6fEGjwIhAIVNpOhXINLW4UhIBFfMSkmChikGg%2F6FJU3MBTia84O6KogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyrxy01FEcX9CEaqGYq3AObDAZzx%2FwCoizPtXoaAcia9LTRCsZcIXWO56sZVn8j%2BidgWs5Xga1HOZObRmLcNAkMdguAJBCO%2Bkedychq1I3GxtK00IOPABnURfXcfIuE0F%2Bs1HSumbOuClHxdk%2FCuw3BIJYinw7Mh8YS5FrdhfuHktUH5syK72UmzkaSAzP2NLACRDHRIZm5%2F1UutPWL56oeqMWYq1gh%2FiLq2l1hj%2Fdy5N3Yu74MQGTm9itgLolpl63LZRAHAyGyjtQfqtIFlMeYIsojl%2Bj3uHAlTSeCDnEX8FMr%2BCRO%2BT1qohdN%2FKpK4hV8%2B5K7CM8%2Fogr%2FMeNd5Gz%2B8c2YZe4OliJe1BS0UfeOh70qqWBFRWiOyWat4v1puP97o80QnR57Xk2x52dIX90jaaWbyZh2M3uidfR5PvgfrqKLUyWkIPodZbJYxws8%2BK8L3SC5EjLVkBW40EwXpZuB4dgoRd9frQ5TZwON7TGfMqlWHgtNKJXsBQbfV184O%2Bm8yqZ3TpHrUFI3%2FOjxiwR%2F6SGgp3NCHd%2BeObjY%2FbjfgqXOI7K2QMKKVcdZ06YD2cmsKVStpX5dVJza0kPl4X6i%2Bs%2BmNXgeVUaQQLbodYeGzN6mB2%2BF3NrEsSQ0d7DTwPeR%2FK3d4iOWAEsF0zCnuYLLBjqkAdXIc2yAZToISFEQOvukK%2F7DeFjDsRz6hS7IyGNQjk1jvaA2zmg9zqvfvMWsjzzRbjN4CO3VoSv0AtpJKdRDJoaBiGc8L3splE44bvKBHGgthKPHef1Or57OrRS%2BUD8Q4XViWOD6TOPq8TFP4M48L0SlY6%2BadIfariME5sVxuxFACBR4NrToxKTwywfpF58%2FfdKvxsAD3Ryu%2F6w1DLE2kjHy1oXL&X-Amz-Signature=3c4985e7f11dbe7e6ebe118d945f990ce9491bae67af2f4bbc3c5f68dc8c8ab2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663WYENTNZ%2F20260109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260109T061928Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDaP2vdcxeWwE3UpZHENGH8EcpLdN4zb7f7kCSB6fEGjwIhAIVNpOhXINLW4UhIBFfMSkmChikGg%2F6FJU3MBTia84O6KogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyrxy01FEcX9CEaqGYq3AObDAZzx%2FwCoizPtXoaAcia9LTRCsZcIXWO56sZVn8j%2BidgWs5Xga1HOZObRmLcNAkMdguAJBCO%2Bkedychq1I3GxtK00IOPABnURfXcfIuE0F%2Bs1HSumbOuClHxdk%2FCuw3BIJYinw7Mh8YS5FrdhfuHktUH5syK72UmzkaSAzP2NLACRDHRIZm5%2F1UutPWL56oeqMWYq1gh%2FiLq2l1hj%2Fdy5N3Yu74MQGTm9itgLolpl63LZRAHAyGyjtQfqtIFlMeYIsojl%2Bj3uHAlTSeCDnEX8FMr%2BCRO%2BT1qohdN%2FKpK4hV8%2B5K7CM8%2Fogr%2FMeNd5Gz%2B8c2YZe4OliJe1BS0UfeOh70qqWBFRWiOyWat4v1puP97o80QnR57Xk2x52dIX90jaaWbyZh2M3uidfR5PvgfrqKLUyWkIPodZbJYxws8%2BK8L3SC5EjLVkBW40EwXpZuB4dgoRd9frQ5TZwON7TGfMqlWHgtNKJXsBQbfV184O%2Bm8yqZ3TpHrUFI3%2FOjxiwR%2F6SGgp3NCHd%2BeObjY%2FbjfgqXOI7K2QMKKVcdZ06YD2cmsKVStpX5dVJza0kPl4X6i%2Bs%2BmNXgeVUaQQLbodYeGzN6mB2%2BF3NrEsSQ0d7DTwPeR%2FK3d4iOWAEsF0zCnuYLLBjqkAdXIc2yAZToISFEQOvukK%2F7DeFjDsRz6hS7IyGNQjk1jvaA2zmg9zqvfvMWsjzzRbjN4CO3VoSv0AtpJKdRDJoaBiGc8L3splE44bvKBHGgthKPHef1Or57OrRS%2BUD8Q4XViWOD6TOPq8TFP4M48L0SlY6%2BadIfariME5sVxuxFACBR4NrToxKTwywfpF58%2FfdKvxsAD3Ryu%2F6w1DLE2kjHy1oXL&X-Amz-Signature=9d966bb7fcc70793476b1e5dfd2f3cfb39d517f050aed9333cbf2534d099b731&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
