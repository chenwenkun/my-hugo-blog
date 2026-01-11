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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662US4K6GV%2F20260111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260111T181655Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIAYfMwkg75FQ23anRKO5tam%2FcW6Bj5JrHZChy0oiZwAqAiAqrG%2FrdDMjgJINZL0QCylhsU3TcTNGA1wsdD2uZvYXHCqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZ8KGpQuj%2Fe0Z%2FSMBKtwD%2B6QauQeyCk3fPpcc36JyqsTcGafqf9PwDzUMlgB8kgE5acxi%2FVH49pJElFkvxthfUeIplZ%2FrIMbmbZ%2Fg9AhlEPfaHo04Lj0htbMSViWb%2BbIeoBOyL9EtET%2B88d3OU%2F0UicbVeGsiv0KIzWONRYLEwFLRyS8Vl0DWv551E%2BvXyBxabQ0%2FbWGJGR92m8bgOwItzQTuZCGw6eM0NY6CS1NGtoHSc7cLkQ7NYetnlqWK%2FXCVWW802tCzbyUhknJmIyGR%2F6iJRn1wVpHKmnumQNzlxDHp393wUA9KuYyItUBfwAaUHXj6qxTpEROB9KEP3T4L7bzEkoFbLylLkLRVPVki1vGlj%2BT4yslJxFgAdFfnVTf9slTmKq1Yq23EvPmWwJGsAQ%2BEaw3agJ9Vu533CUIK921EiuMM6OqUVEr5IWiTLqof7zNzMSmiDSazbkxcM21SnQo023B4l3lcfC%2BamXa8vocdK1ruqNJVF5w2GeWz7fZ4fGOtjISywxVl59tPOlL0UbdIvV3QaWd1ylTwzgPwmfpZSOP0jvObQOf7I4JTxpPaFbapnO5EvC2LZ0hu2BqZIGrx2IxZygfRRPd1qgOeIvTpA5kDuPtz1S3chCH3GJzbJbpHD%2FQdk7Vz8YUwtsyPywY6pgFlEvPHDgfsPHkg8mB0oab5wVBk%2B7p2zcLOehkxxC5MShlQ3jLAOJzn9SGVPQuKMqDQmfsgxzbX54vT4NKM9ZAVuj%2FZhW7G38jd9qkcyKgXrva%2B%2Bg7ytT7%2B2xELU9nX79avoM2ECkDGKQYMwaXzCKl4Sp6n8oq86qMdAQ5zO1%2F%2Bt2DfCHKh7qaGwJ%2BTECMSrZvB9%2FPDQUsCC6dJtYdhQj6tsIAkUSC6&X-Amz-Signature=c42df2563e94a596fc01006548c929192df8f83a042c639069c0bca9f0696bbb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662US4K6GV%2F20260111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260111T181655Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJGMEQCIAYfMwkg75FQ23anRKO5tam%2FcW6Bj5JrHZChy0oiZwAqAiAqrG%2FrdDMjgJINZL0QCylhsU3TcTNGA1wsdD2uZvYXHCqIBAjb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZ8KGpQuj%2Fe0Z%2FSMBKtwD%2B6QauQeyCk3fPpcc36JyqsTcGafqf9PwDzUMlgB8kgE5acxi%2FVH49pJElFkvxthfUeIplZ%2FrIMbmbZ%2Fg9AhlEPfaHo04Lj0htbMSViWb%2BbIeoBOyL9EtET%2B88d3OU%2F0UicbVeGsiv0KIzWONRYLEwFLRyS8Vl0DWv551E%2BvXyBxabQ0%2FbWGJGR92m8bgOwItzQTuZCGw6eM0NY6CS1NGtoHSc7cLkQ7NYetnlqWK%2FXCVWW802tCzbyUhknJmIyGR%2F6iJRn1wVpHKmnumQNzlxDHp393wUA9KuYyItUBfwAaUHXj6qxTpEROB9KEP3T4L7bzEkoFbLylLkLRVPVki1vGlj%2BT4yslJxFgAdFfnVTf9slTmKq1Yq23EvPmWwJGsAQ%2BEaw3agJ9Vu533CUIK921EiuMM6OqUVEr5IWiTLqof7zNzMSmiDSazbkxcM21SnQo023B4l3lcfC%2BamXa8vocdK1ruqNJVF5w2GeWz7fZ4fGOtjISywxVl59tPOlL0UbdIvV3QaWd1ylTwzgPwmfpZSOP0jvObQOf7I4JTxpPaFbapnO5EvC2LZ0hu2BqZIGrx2IxZygfRRPd1qgOeIvTpA5kDuPtz1S3chCH3GJzbJbpHD%2FQdk7Vz8YUwtsyPywY6pgFlEvPHDgfsPHkg8mB0oab5wVBk%2B7p2zcLOehkxxC5MShlQ3jLAOJzn9SGVPQuKMqDQmfsgxzbX54vT4NKM9ZAVuj%2FZhW7G38jd9qkcyKgXrva%2B%2Bg7ytT7%2B2xELU9nX79avoM2ECkDGKQYMwaXzCKl4Sp6n8oq86qMdAQ5zO1%2F%2Bt2DfCHKh7qaGwJ%2BTECMSrZvB9%2FPDQUsCC6dJtYdhQj6tsIAkUSC6&X-Amz-Signature=912e0ec00c034a63706d24a1c2d68768e1a2635182f9590d7867c3b058a2c6ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
