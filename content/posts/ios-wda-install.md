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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S22QPXBJ%2F20260214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260214T122511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJGMEQCIDnUtyZ4EgDbiZFf5rcHgWpogoK1SfZ7tXyGliw4LtMVAiArek0dNMEHu5hDqPrs%2B7b4C0OczZkPMh2ywN4DqToQNSr%2FAwgEEAAaDDYzNzQyMzE4MzgwNSIM04BVeo1TQBs7%2BVhKKtwDSPlldXrmkSByd%2BuhTdXYDhM7lVjCY43TvAAsZg22%2F6UN5tNWlgYed%2BrDOt5qm%2F0lFzYCGcEZ784fuUX9gEyUdr0kh0LuQqnO4uS1KE6kyYP74GtPi%2B7OKir8naYfo00D53EJpz61NtAYk37ssllqluXc1K2%2BOghJfu2NBiEZjVuA4HitrYjnjha5shh5TURe4CMMBa2dZNxkvEPtEad2et5faSu7D6WA%2FDhzF9F6WUbVMmKdIf%2FIq7OjzwaRJ7mmp%2Fi%2FrrQeLSF91YAIBDGkpmCVWihZD5Ogi7QZZ7KmoP2SnPBhLhYLcagZsGAvGxaTfSCRNwS1uMUP7ApJXFcKzdPK5T9OC0yKQtr1EGorJU6ZKBWoWUqpw5R7UkA7PUj4750Gufeb63HlJHOYMBkLFtApGKFP%2BbA0T1%2BAaRjlnIYoMXP%2FZM7e0FowhP6xQy3BbZcLp5%2B5L5sJJJ7w5tc1skwmpZabkUH3LB8Z9%2F6NTjVqfbLNFffSFhw3cFODek9%2Bwdo4M5hNS%2BX7Iz%2FCVpTm6KlFvusfPaL%2BGwhRGFIDa7X8ieLNNOz%2F75s4c6%2BxdVTNu0Oiwb03nitfSVEofgTj9brqazXT0dXxmABM9kWkzNFCXrJLLwgBUuD391UwurPBzAY6pgFFe1F2Hq4v4H%2Br1UrOGY1J%2F1NyFSfseNGuBYbIwkmAABAY0VgHe4hh9z5aAFhy2cA%2BgX7YOVcAnaRP02LEH6I%2BdA1Eban2c36PuBcxj7MdohY9j63Fho9wBqVjd66NR5F%2B4kKdCn6HVcGT%2FG5pX8fdhahha4%2BooVeiV9ePcT%2BlkXDEtd8L2uCt4rtbnhW2Eu%2FEYg9QLc0w1sbrtfvAM207zH%2BqIWPz&X-Amz-Signature=0aca4733750a4b0cb1423bbccc53dc3e5abde40156e8616d466a53ee15abc1ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S22QPXBJ%2F20260214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260214T122511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJGMEQCIDnUtyZ4EgDbiZFf5rcHgWpogoK1SfZ7tXyGliw4LtMVAiArek0dNMEHu5hDqPrs%2B7b4C0OczZkPMh2ywN4DqToQNSr%2FAwgEEAAaDDYzNzQyMzE4MzgwNSIM04BVeo1TQBs7%2BVhKKtwDSPlldXrmkSByd%2BuhTdXYDhM7lVjCY43TvAAsZg22%2F6UN5tNWlgYed%2BrDOt5qm%2F0lFzYCGcEZ784fuUX9gEyUdr0kh0LuQqnO4uS1KE6kyYP74GtPi%2B7OKir8naYfo00D53EJpz61NtAYk37ssllqluXc1K2%2BOghJfu2NBiEZjVuA4HitrYjnjha5shh5TURe4CMMBa2dZNxkvEPtEad2et5faSu7D6WA%2FDhzF9F6WUbVMmKdIf%2FIq7OjzwaRJ7mmp%2Fi%2FrrQeLSF91YAIBDGkpmCVWihZD5Ogi7QZZ7KmoP2SnPBhLhYLcagZsGAvGxaTfSCRNwS1uMUP7ApJXFcKzdPK5T9OC0yKQtr1EGorJU6ZKBWoWUqpw5R7UkA7PUj4750Gufeb63HlJHOYMBkLFtApGKFP%2BbA0T1%2BAaRjlnIYoMXP%2FZM7e0FowhP6xQy3BbZcLp5%2B5L5sJJJ7w5tc1skwmpZabkUH3LB8Z9%2F6NTjVqfbLNFffSFhw3cFODek9%2Bwdo4M5hNS%2BX7Iz%2FCVpTm6KlFvusfPaL%2BGwhRGFIDa7X8ieLNNOz%2F75s4c6%2BxdVTNu0Oiwb03nitfSVEofgTj9brqazXT0dXxmABM9kWkzNFCXrJLLwgBUuD391UwurPBzAY6pgFFe1F2Hq4v4H%2Br1UrOGY1J%2F1NyFSfseNGuBYbIwkmAABAY0VgHe4hh9z5aAFhy2cA%2BgX7YOVcAnaRP02LEH6I%2BdA1Eban2c36PuBcxj7MdohY9j63Fho9wBqVjd66NR5F%2B4kKdCn6HVcGT%2FG5pX8fdhahha4%2BooVeiV9ePcT%2BlkXDEtd8L2uCt4rtbnhW2Eu%2FEYg9QLc0w1sbrtfvAM207zH%2BqIWPz&X-Amz-Signature=3dcd9ec5dd75a9d74f7e620e99551767f387ecb2f0f3450ede411822a827d777&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
