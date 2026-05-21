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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667FS4VSPM%2F20260521%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260521T143840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLXdlc3QtMiJHMEUCIQDujk0cPNjO4CRK0yGJP6Rlf%2FtJuRqUp4aimUzzxuyUpQIgUgN2v%2BepXYgsiakNMiYXGZilGNK5eq7wlyPUtD3Uqmwq%2FwMIBhAAGgw2Mzc0MjMxODM4MDUiDNMKFi%2FvVRB6shQxpCrcA5TH30aLcKQcMy4grLj5nbTXhuITRjbYMWMGdgf407zepebTKSPA%2BQFmMagXdHyA06jIiTP8bs8Qz%2FLXj2x%2Ba%2FK6GSBt3nUs0fyP1izvH4eZ2VtNZ7QY0xjpBghoFeekM%2FG8wW7MHHNLhVFf21Tz669ej4%2BqLMZkN5Cd1p7pFOV3CzfVTuXPKTekgkWIKlatONERzam4bu3mx%2BdQcq5TeK8uFiJKiCBvDEME1G6xef7Y9%2FHNzz22gtJupv1IA4g%2BmHollmKVKNFJaEIcPPLQPtyj2pt0ij3JOdeQG4mS3Er04twul5PR6R%2Ftv8%2BAsfNr3JUPyM6Mu5Xp5C8GBOU5kSy3W42C0%2FGzBpmwE52pfWlGxQ80kY%2BONqEw7IQpc65bomk8THNJz5HN0uGUpSF50aKWRR5TsUqKOU8oAu4tmIXUWM0yRpos7lfJRemZf8LRGJJtuulr964gRRJqGW0NTNdi9s9v86zRYd4Oi3fZj9h6%2BIDSwmKJ3vP9QucICCSqrld2DEeAQXMyt8eTRcpt1UQuy%2FoiscUS4%2Ftk2bExZe9wLYdDNZMj1RHgsG9niAAwkSsS1pVIvfGbHUIVhZBLdYevwMDO6%2BcyslywHulhs%2FlEypIGBHIrrMICdcaiMPD5u9AGOqUB1l2nTX%2BczmoP91dbt%2B%2FsDpLSxdGDeUYD9GUysnkUQXTY1aUzzztcmKeJAuMLPqJj9jrNKOau08axvYxEwpsGxXOkXt4LTbYhjEdDlaQszaCKyvF5blGzB7k4A9ONOB2ugHxmIyXjw%2FcwzTt5UyNufX6A8GNX7MXon4ATxe2VuaHYZ3op3ZLjJZPQvTjt11tQKnsyE121Q%2BwN8jm5QyZZbGrt%2BBty&X-Amz-Signature=b8d9ecc16bd39139f81ea9ead955898642943682ea6c8a97f0c4bbe47b57948a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667FS4VSPM%2F20260521%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260521T143840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aCXVzLXdlc3QtMiJHMEUCIQDujk0cPNjO4CRK0yGJP6Rlf%2FtJuRqUp4aimUzzxuyUpQIgUgN2v%2BepXYgsiakNMiYXGZilGNK5eq7wlyPUtD3Uqmwq%2FwMIBhAAGgw2Mzc0MjMxODM4MDUiDNMKFi%2FvVRB6shQxpCrcA5TH30aLcKQcMy4grLj5nbTXhuITRjbYMWMGdgf407zepebTKSPA%2BQFmMagXdHyA06jIiTP8bs8Qz%2FLXj2x%2Ba%2FK6GSBt3nUs0fyP1izvH4eZ2VtNZ7QY0xjpBghoFeekM%2FG8wW7MHHNLhVFf21Tz669ej4%2BqLMZkN5Cd1p7pFOV3CzfVTuXPKTekgkWIKlatONERzam4bu3mx%2BdQcq5TeK8uFiJKiCBvDEME1G6xef7Y9%2FHNzz22gtJupv1IA4g%2BmHollmKVKNFJaEIcPPLQPtyj2pt0ij3JOdeQG4mS3Er04twul5PR6R%2Ftv8%2BAsfNr3JUPyM6Mu5Xp5C8GBOU5kSy3W42C0%2FGzBpmwE52pfWlGxQ80kY%2BONqEw7IQpc65bomk8THNJz5HN0uGUpSF50aKWRR5TsUqKOU8oAu4tmIXUWM0yRpos7lfJRemZf8LRGJJtuulr964gRRJqGW0NTNdi9s9v86zRYd4Oi3fZj9h6%2BIDSwmKJ3vP9QucICCSqrld2DEeAQXMyt8eTRcpt1UQuy%2FoiscUS4%2Ftk2bExZe9wLYdDNZMj1RHgsG9niAAwkSsS1pVIvfGbHUIVhZBLdYevwMDO6%2BcyslywHulhs%2FlEypIGBHIrrMICdcaiMPD5u9AGOqUB1l2nTX%2BczmoP91dbt%2B%2FsDpLSxdGDeUYD9GUysnkUQXTY1aUzzztcmKeJAuMLPqJj9jrNKOau08axvYxEwpsGxXOkXt4LTbYhjEdDlaQszaCKyvF5blGzB7k4A9ONOB2ugHxmIyXjw%2FcwzTt5UyNufX6A8GNX7MXon4ATxe2VuaHYZ3op3ZLjJZPQvTjt11tQKnsyE121Q%2BwN8jm5QyZZbGrt%2BBty&X-Amz-Signature=665b7d5815abb40ea911dcb89784f79b6f7e8216e34e674b44dc1eb83f140ec1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
