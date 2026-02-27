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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QDHDUZDL%2F20260227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260227T123405Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIQCBkSnlVS22q9UNlbvPhQPJpKZXAYdGHtFav1FFfsVVOgIgETX3sbRB9og1H7P3v1vJlFRgLAv6rZPKHTMR8b5ZmIgq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDKHfunsY1l0EXvAh7SrcA82ta%2FeUVaQ68chYN%2Bg64Hr42zzCOuEO%2BtpDZHHvmtT3CtknO1q0XLjNU8wn%2BwC%2FDT9BcM5lURXz8IqI2xqRKSHnf2IBhrbtvLm3DQ99S6CyxRtbUx%2FZ7S4cZRz4VvR%2BgV%2FHWTK%2FwZZYg0bCvO5in4n4gUc5eSls58d3wlpYvMMRajTH7lOvqthwvoTcVCiB3EuFc9mRaQJB8RJfXKsv%2FNXaiakz%2BKIte12ec3Kal%2FS7hvxkF%2FxUAvBJneV1cNh%2BdgaQ2KlELFP43IqYtc0g0R1C5Ee5kdQoDn8gpB9Y6MdTNwL7E%2FpgiQKFskVfMHInmkduUZJRq0FbkaCNrh2C6OQn8RlyeyYpW5RCXwtONkcwu5wm7F9Hx5bWkP7QiNFSjxEeUOCu1L4%2FtClmd6S%2FRNZKg1EAVlj5uxjf%2BixzHHquB4eSz%2F%2FmqO%2BU37IUQp277QHiEmPzboZucUnLBTlouqRmCc2qbqsHxfjRhDbcJDVX6JhfWk95PCtVhVZnL3HFeSsu8Z8MKzyBYWTxI0MUH2jgXwMUfPS9RvRHuj3iwjT5eWUwG7Rff10dHGI25cBgEPof7LbHVaVJcba0c%2FxayrzT993grMNdk4d6hRvyMbW6i39bEkfYOef%2FUdvvMMGOhs0GOqUBiKjiDOxY2tvolnUnUPUqNu1PA3Qmj8bhgKLwuRrja%2BF34LKqMIlXoLyHLnzWVcUEQ3Htbj2yz1oeO5zv5YCoCOc6f%2F%2BQPdjCkqr3t45MWrSg5yC0IdBdsiJJWoj4hiyK3kYwWjRo830XxeYec1TbQUXS88q0CXs2OCdEGqZdl%2B7fXTIVDQ%2FA%2FfahFPLDBX%2BEPjX%2BusPz6si1uAXz%2BYKimcPj2VdM&X-Amz-Signature=d4f6ef21754b06dc3b95c2d7314a686ca8523d955d0bfcca47e3432dc1632ddf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QDHDUZDL%2F20260227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260227T123405Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIQCBkSnlVS22q9UNlbvPhQPJpKZXAYdGHtFav1FFfsVVOgIgETX3sbRB9og1H7P3v1vJlFRgLAv6rZPKHTMR8b5ZmIgq%2FwMIPRAAGgw2Mzc0MjMxODM4MDUiDKHfunsY1l0EXvAh7SrcA82ta%2FeUVaQ68chYN%2Bg64Hr42zzCOuEO%2BtpDZHHvmtT3CtknO1q0XLjNU8wn%2BwC%2FDT9BcM5lURXz8IqI2xqRKSHnf2IBhrbtvLm3DQ99S6CyxRtbUx%2FZ7S4cZRz4VvR%2BgV%2FHWTK%2FwZZYg0bCvO5in4n4gUc5eSls58d3wlpYvMMRajTH7lOvqthwvoTcVCiB3EuFc9mRaQJB8RJfXKsv%2FNXaiakz%2BKIte12ec3Kal%2FS7hvxkF%2FxUAvBJneV1cNh%2BdgaQ2KlELFP43IqYtc0g0R1C5Ee5kdQoDn8gpB9Y6MdTNwL7E%2FpgiQKFskVfMHInmkduUZJRq0FbkaCNrh2C6OQn8RlyeyYpW5RCXwtONkcwu5wm7F9Hx5bWkP7QiNFSjxEeUOCu1L4%2FtClmd6S%2FRNZKg1EAVlj5uxjf%2BixzHHquB4eSz%2F%2FmqO%2BU37IUQp277QHiEmPzboZucUnLBTlouqRmCc2qbqsHxfjRhDbcJDVX6JhfWk95PCtVhVZnL3HFeSsu8Z8MKzyBYWTxI0MUH2jgXwMUfPS9RvRHuj3iwjT5eWUwG7Rff10dHGI25cBgEPof7LbHVaVJcba0c%2FxayrzT993grMNdk4d6hRvyMbW6i39bEkfYOef%2FUdvvMMGOhs0GOqUBiKjiDOxY2tvolnUnUPUqNu1PA3Qmj8bhgKLwuRrja%2BF34LKqMIlXoLyHLnzWVcUEQ3Htbj2yz1oeO5zv5YCoCOc6f%2F%2BQPdjCkqr3t45MWrSg5yC0IdBdsiJJWoj4hiyK3kYwWjRo830XxeYec1TbQUXS88q0CXs2OCdEGqZdl%2B7fXTIVDQ%2FA%2FfahFPLDBX%2BEPjX%2BusPz6si1uAXz%2BYKimcPj2VdM&X-Amz-Signature=5d45a30a2a91ab6a2b1fa8bcc61f75024ced4420ce8fad9375e01d7497746cff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
