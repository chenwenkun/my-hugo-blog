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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46633YJIWQM%2F20260104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260104T122118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJIMEYCIQDDOoJn%2BJWLkc4HFHwSGdXDpNqvYF%2B4ay2VDC7lGd1qBQIhAMZi4gXggWQ52jd4%2BGGkncKz2GzGX42C3LOwzpRdMd9fKv8DCCoQABoMNjM3NDIzMTgzODA1IgwhCNMS8uwEIrN36hwq3ANwg7wm%2BKmhbAAIXpmppvpfqgTAsBb2x1xPj5N1Q9eM3zpppbtE3DNKZ%2FzW%2FjSUY52ESiRWLOG8%2FVcy8Hh5wx8KvezrKZaKwNZe%2Fwa9QDUr9GAlbkyNSHEGO%2BF1wXlVov%2FLunVGi9GY9XZo04SJUfUDBoG%2BN%2Bwvq7Jbh1HbmH8mZeXD4Lz4jgRHzwLAMb7hu75aRSFdNxm0uUyV2OUwXep417zBHolpDy2jwnQr8Ht7nrP1tos4HkFPJo4ICX8H%2FbiZUUhgevTlcTiaCtzHs1QPcs0YqdOk%2FjT9K8SLh5sSR87YtQVrLnAy1ogCWcFdXZcj9HYIgLJfQrnKI5OtuW72VnQfGB1XgYiq3LlfPEDM4NIMyl39jynJDoyudc96BSLsH2kX%2B7BwZV7ImIPF7JHkp9f8BckdctJKXCcEA5URVSEcy7%2FG0DtEO%2B5teSwQ3p6Mi75NtdKhzT3UaogB2%2BgBokOH%2FjIf8DWnxv62Gx1TzDozUgkIfM1o2S7vs8RkWIl8bm4sC2XfXfIgSScBRWy1zeNNFCibdWXVu%2FTVWsHRiRwdrIqavhjD4M%2FKubiUWc6Sq2Tub9Yy06CBK%2BS9zFLyrZq%2FaVNcnQNUKZ0UvpjfMkmUFmxGgKsXJ7OUmTDL2ujKBjqkAdiq5yZBKviDdZsqwaskkPRbHUpC5jKqEO8dBg0NgtJ%2BF%2FSatXt94q0KmgZR3F41ybitr3LJQ6IM%2BzmJl0Kc7PF4iNFxWBf2WiDSojmFvtqb03ce8VZyEojWiXyuw%2BYD12lVTGfwSLmkHZKLbqp4c8Fx%2BGh%2Ba2uTv2m8xS3UwgqNnzSFbAjqM8vLBjIe%2BRypKjzINGd4vhGaKtb6FQIwYNvHUXex&X-Amz-Signature=04af732a3ec64486085603a98121d8fc1333ad6903b6e0d4cd2b5b2a0c6062b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46633YJIWQM%2F20260104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260104T122118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGEaCXVzLXdlc3QtMiJIMEYCIQDDOoJn%2BJWLkc4HFHwSGdXDpNqvYF%2B4ay2VDC7lGd1qBQIhAMZi4gXggWQ52jd4%2BGGkncKz2GzGX42C3LOwzpRdMd9fKv8DCCoQABoMNjM3NDIzMTgzODA1IgwhCNMS8uwEIrN36hwq3ANwg7wm%2BKmhbAAIXpmppvpfqgTAsBb2x1xPj5N1Q9eM3zpppbtE3DNKZ%2FzW%2FjSUY52ESiRWLOG8%2FVcy8Hh5wx8KvezrKZaKwNZe%2Fwa9QDUr9GAlbkyNSHEGO%2BF1wXlVov%2FLunVGi9GY9XZo04SJUfUDBoG%2BN%2Bwvq7Jbh1HbmH8mZeXD4Lz4jgRHzwLAMb7hu75aRSFdNxm0uUyV2OUwXep417zBHolpDy2jwnQr8Ht7nrP1tos4HkFPJo4ICX8H%2FbiZUUhgevTlcTiaCtzHs1QPcs0YqdOk%2FjT9K8SLh5sSR87YtQVrLnAy1ogCWcFdXZcj9HYIgLJfQrnKI5OtuW72VnQfGB1XgYiq3LlfPEDM4NIMyl39jynJDoyudc96BSLsH2kX%2B7BwZV7ImIPF7JHkp9f8BckdctJKXCcEA5URVSEcy7%2FG0DtEO%2B5teSwQ3p6Mi75NtdKhzT3UaogB2%2BgBokOH%2FjIf8DWnxv62Gx1TzDozUgkIfM1o2S7vs8RkWIl8bm4sC2XfXfIgSScBRWy1zeNNFCibdWXVu%2FTVWsHRiRwdrIqavhjD4M%2FKubiUWc6Sq2Tub9Yy06CBK%2BS9zFLyrZq%2FaVNcnQNUKZ0UvpjfMkmUFmxGgKsXJ7OUmTDL2ujKBjqkAdiq5yZBKviDdZsqwaskkPRbHUpC5jKqEO8dBg0NgtJ%2BF%2FSatXt94q0KmgZR3F41ybitr3LJQ6IM%2BzmJl0Kc7PF4iNFxWBf2WiDSojmFvtqb03ce8VZyEojWiXyuw%2BYD12lVTGfwSLmkHZKLbqp4c8Fx%2BGh%2Ba2uTv2m8xS3UwgqNnzSFbAjqM8vLBjIe%2BRypKjzINGd4vhGaKtb6FQIwYNvHUXex&X-Amz-Signature=623cbd5f9caf82382b7ccfb6652ee42bb32bc046e5238d534e3d4a33d1880abd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
