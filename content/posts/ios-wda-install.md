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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XBXRZ6P%2F20251204%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251204T122401Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJHMEUCIQDheEWiJs0%2FGDYsqsTj7hApXLnVVoZ%2BmMz%2BbAWJrhfC0QIgH44VD2NLjmLtvSUiq6iwzmRVotrw0O8nMt0rHASvF4Iq%2FwMIRRAAGgw2Mzc0MjMxODM4MDUiDN5YcdEO4u8tIQ4A%2FCrcA45VJrdc0n8mYXYuhDlxjSkccZowgC8J%2FQCMtM%2F2hKYk8XE8C2rRWpz3TdOZWL9yMtG3jMbDIAdXkPuub9%2B4tnvVKgPNIVf69Ees41v3GR20cj5leMNlNedmWG0CjNg1PEMp8EQ754Vi1lD%2BLR0Ql9Uofh%2BCXSJV2mBO%2Bfi%2BJnL2Kk%2B4h28sfijARdZuhlFYprTu4HDtPTFX0oQoDs3a%2Fd99ijcYykDRezc40VffJ0RH1KMyWURs9BdDEx96Wzell%2FrjQxGwz2YmHJz4FQCTmy5M2529Rnw1GSpOox%2FDieYJ6IyvtbMI8lZa8EfQeXghoT%2BMxdCTvzykWguAca6vGOlrNc070d5q0gdJDOt6kANUIn%2BNYr2%2B0F%2Fp0rKfMRPqMCFTexn%2Bd66scPYP6fAbQ0eR5ROqjaBZMKjo4iWxv4fR9OGzuCgwyVsaWmPa1vQKa2pLDJfqi56sHhm0QlY20FCmKkjwhnHzA9V4Htqw55bI8n2sxqjbypk2k5CoXBwItjM%2BGfEekjf8j6ApyZXnlaEuV1mzUgJ%2B%2BxwXvCwyJlF7nNNBUY7s52901BKGa3hNkTdHb6O4pvtjLoVw3ieTFY1hP8uUiyOezq5pmFm3X16hU6j5BdGBZfijtpagMLDnxckGOqUBjQZkWJtFWCZJiXQTTWJgW1TEaBgijAbaWgPAOkeo2nEJ7PazeXX6V2wiGUmBQaprEQXOGARBvcp1lUxHf%2BTmDWneHUqKpesUvJgsXpEDJ0FsVYpA7aTSYjvyjo20Z4cxOBOCnbBPoSQUz4QrMgSV93tgEM2k%2BuY5zNzxIM6T%2Fu2%2FCLpda2CblQsSRMr2O6MLENJVKab6UqiGnvgM9KXWiWneYJaj&X-Amz-Signature=63202382f8eecd95495cc7c0e1123bbdc2c29de22bd97d03dd58ae7a42598d23&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XBXRZ6P%2F20251204%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251204T122401Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHwaCXVzLXdlc3QtMiJHMEUCIQDheEWiJs0%2FGDYsqsTj7hApXLnVVoZ%2BmMz%2BbAWJrhfC0QIgH44VD2NLjmLtvSUiq6iwzmRVotrw0O8nMt0rHASvF4Iq%2FwMIRRAAGgw2Mzc0MjMxODM4MDUiDN5YcdEO4u8tIQ4A%2FCrcA45VJrdc0n8mYXYuhDlxjSkccZowgC8J%2FQCMtM%2F2hKYk8XE8C2rRWpz3TdOZWL9yMtG3jMbDIAdXkPuub9%2B4tnvVKgPNIVf69Ees41v3GR20cj5leMNlNedmWG0CjNg1PEMp8EQ754Vi1lD%2BLR0Ql9Uofh%2BCXSJV2mBO%2Bfi%2BJnL2Kk%2B4h28sfijARdZuhlFYprTu4HDtPTFX0oQoDs3a%2Fd99ijcYykDRezc40VffJ0RH1KMyWURs9BdDEx96Wzell%2FrjQxGwz2YmHJz4FQCTmy5M2529Rnw1GSpOox%2FDieYJ6IyvtbMI8lZa8EfQeXghoT%2BMxdCTvzykWguAca6vGOlrNc070d5q0gdJDOt6kANUIn%2BNYr2%2B0F%2Fp0rKfMRPqMCFTexn%2Bd66scPYP6fAbQ0eR5ROqjaBZMKjo4iWxv4fR9OGzuCgwyVsaWmPa1vQKa2pLDJfqi56sHhm0QlY20FCmKkjwhnHzA9V4Htqw55bI8n2sxqjbypk2k5CoXBwItjM%2BGfEekjf8j6ApyZXnlaEuV1mzUgJ%2B%2BxwXvCwyJlF7nNNBUY7s52901BKGa3hNkTdHb6O4pvtjLoVw3ieTFY1hP8uUiyOezq5pmFm3X16hU6j5BdGBZfijtpagMLDnxckGOqUBjQZkWJtFWCZJiXQTTWJgW1TEaBgijAbaWgPAOkeo2nEJ7PazeXX6V2wiGUmBQaprEQXOGARBvcp1lUxHf%2BTmDWneHUqKpesUvJgsXpEDJ0FsVYpA7aTSYjvyjo20Z4cxOBOCnbBPoSQUz4QrMgSV93tgEM2k%2BuY5zNzxIM6T%2Fu2%2FCLpda2CblQsSRMr2O6MLENJVKab6UqiGnvgM9KXWiWneYJaj&X-Amz-Signature=0bc6abeb2966b713b0adc1c9da59337a072b8594e117d3d5780f99d01f5510a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
