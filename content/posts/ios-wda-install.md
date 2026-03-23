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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662DYBOY34%2F20260323%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260323T011545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDPFkAhxHT0F665P8RPgOV3f49l1waOSgpDKea90VG%2F4wIgKo1HO%2Fy3fB2qBL1lClF9Z9OQXDQiFRs4qLlSoskd9QUq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDNM54FGkuUGRcug70CrcA6jdXaG3YbC1GazSj6m2SnHS1HDz63q6emxGHD2V%2Bg%2BSkAU591gj4gDQ0p7mu38xRGEvaTyoNkwz1Dw9nOlD5cnpg6kZFrgXchM4W1YCm7toQW1cWBWCKtjKo5RRz5EpnoNKiJAtthp5lmS6vbjWR4o1JHD3wEH5UwWUbGICZq8u0flku%2FG%2BmbY42k3PF9IXGPorNtQNLSE5kHwtwVULRMDnWjriBO95Bx8A%2FQzUsCoOd5blFXnLAjgPeUU0IS9JuhMSYPaeuW67qTA7GZTzbvHPtc43TfF3q4QeMnSNU557fhoYzqsco6RYaH4sHncXplFV1OrIkXL01Cskkp4GUXjgRn6h0CsGN5fS57673k8YtHYqFABWF8uJ5Gl2em391U8NxVFtQjPH4Gdv055mgzxbBHLEHTqg6DpEj1BABT5PeP%2BQkpTFaoggc6WuVR755mH2Y1uFA3NXHjeXiF97rRmhwFaBukzJmm9sx4ErStplatrk3GrAv6Vs7epTnUMzq4Iqib7y0R9070e9Y530DbYEwJZXwv7gAZ%2BsED5rvSsv7LBoQPLQuNTpWj0NgzCMoBSiG0zUGKsNqviDyTwFRHtOLvAZBhnwBihFaxVKfCGnIuf8QCkqhbGINaMlMJeSgs4GOqUBaho9wI5mdrL54hS6DRRU0ae9n6g1aaYsFPYoa8DInZ2HegL%2BOwj%2Fs8E5SsWr%2BHkm%2B7Xfg27C%2B4sDoh5Iu8EmYTkKJKhPvPDaBP1L%2FEp0GPWjmrWB1meNLyE08wfWadsrEtiukO22%2BJRolZSZnB%2FU06wfaAcHBdmEgoaLiAnF8h%2FAP4YqFdpiOLpuQ5GMqT%2BU%2F8lvHNr%2B5SAdW9U70aGF6yb22qYZ&X-Amz-Signature=7b0bc8c6ff6d23f5aadf08bb7fda810ea6a524102c483e5f57059ae23b9ffbbf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662DYBOY34%2F20260323%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260323T011545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDPFkAhxHT0F665P8RPgOV3f49l1waOSgpDKea90VG%2F4wIgKo1HO%2Fy3fB2qBL1lClF9Z9OQXDQiFRs4qLlSoskd9QUq%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDNM54FGkuUGRcug70CrcA6jdXaG3YbC1GazSj6m2SnHS1HDz63q6emxGHD2V%2Bg%2BSkAU591gj4gDQ0p7mu38xRGEvaTyoNkwz1Dw9nOlD5cnpg6kZFrgXchM4W1YCm7toQW1cWBWCKtjKo5RRz5EpnoNKiJAtthp5lmS6vbjWR4o1JHD3wEH5UwWUbGICZq8u0flku%2FG%2BmbY42k3PF9IXGPorNtQNLSE5kHwtwVULRMDnWjriBO95Bx8A%2FQzUsCoOd5blFXnLAjgPeUU0IS9JuhMSYPaeuW67qTA7GZTzbvHPtc43TfF3q4QeMnSNU557fhoYzqsco6RYaH4sHncXplFV1OrIkXL01Cskkp4GUXjgRn6h0CsGN5fS57673k8YtHYqFABWF8uJ5Gl2em391U8NxVFtQjPH4Gdv055mgzxbBHLEHTqg6DpEj1BABT5PeP%2BQkpTFaoggc6WuVR755mH2Y1uFA3NXHjeXiF97rRmhwFaBukzJmm9sx4ErStplatrk3GrAv6Vs7epTnUMzq4Iqib7y0R9070e9Y530DbYEwJZXwv7gAZ%2BsED5rvSsv7LBoQPLQuNTpWj0NgzCMoBSiG0zUGKsNqviDyTwFRHtOLvAZBhnwBihFaxVKfCGnIuf8QCkqhbGINaMlMJeSgs4GOqUBaho9wI5mdrL54hS6DRRU0ae9n6g1aaYsFPYoa8DInZ2HegL%2BOwj%2Fs8E5SsWr%2BHkm%2B7Xfg27C%2B4sDoh5Iu8EmYTkKJKhPvPDaBP1L%2FEp0GPWjmrWB1meNLyE08wfWadsrEtiukO22%2BJRolZSZnB%2FU06wfaAcHBdmEgoaLiAnF8h%2FAP4YqFdpiOLpuQ5GMqT%2BU%2F8lvHNr%2B5SAdW9U70aGF6yb22qYZ&X-Amz-Signature=a7ca2df3c8efa0b6cacaecd223897abd43c0c51dd244ee07976043f6f1384a17&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
