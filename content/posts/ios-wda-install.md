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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R6SGEMAE%2F20260525%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260525T094641Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDVC7j1M5x31w5MxlfUKL%2BfaxS83OWlaDoxrAF4dc%2F5JAiEA9ev%2BstiP5mBgb%2BZV%2Bf22%2B6pyLaRxlsaxvnYHbWbxajoq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDBsrT46iOEo9MT5kHyrcAwMiL4xPkMUeWpAQFM2j%2F%2BpJvULtziCsQSB0H9xfvhjuI4qRYh56dtu%2FCKAF%2BOeDhZKoT80d9KVYkQFtT3fGAlDWgrvRZeXJUDuMHKbThWvS2ubGgnqO6mJwMhFC7ZnPHWPj0k21CXEXyhLGAF%2B5wc7MIeq6U23pXFQnXIuh9xnFzM5PCIH3Fsg6vC%2FMKjyjIwdjVVUIZujutiDGAWFCOcn4FONXu0jBuSlubijGpQxKV1Z0jFPOb9Xm0QaVwtOfpo6tbDTG%2B3qwCD4VzrtWPR04LayP2cVaClbhZYowPj59fHfdpffp1NNnvJwWGG2jQs6V5%2BNmIv3Fzk%2BKYjsjjD44Wx0DIL0kG4jjPjVWFk0LQj3i%2FoT%2Fv1eLtCcZEN0ywELm0MLR3knsTiUyNbVieTR6BhAUeMDkipglDH16kdBh3VB%2BXXJMMb3cotW4rPATB9clrLu1AQPP0jrs2DxwekZ5nbxJJ0NbvZCajOxc4GEnS87%2B0rk163xzzPFZTLhE1Ygx1q21Ga4cGnrEkTe9zXrWuTmS5%2FfMI%2B0bC5S7quBQxfogPPjSLEtRpVF1LVx8if3%2Fs%2FPqaDZOAqt8AHi4QWLQnFU924Opi9iFomJuzybYjaKL5pJ3qOnMWUP2MOyN0NAGOqUBVLnam%2BD5AHiUEJpK0AxC3aehSYT8bniT81i74QNLQhNsu0fC%2B0U%2BJnOw3k%2BlUdl%2F3dbsVqHcOep4zFnDPfQJqX2KXqyzm4Xo2X5HxE%2BcyQLoeqzJiJd3oF9PylncRUneXOuvGIS5GeMn3X3vfJbC2vuz4LDaDWEayfOZLaCdvhR8C4Qx%2B7BmG5i35pMLFiyFfNydHbLRL1gVxVtLAhuHLFJI6TAL&X-Amz-Signature=cc9f068702e816be02f989b9e2efaf3b778be50e95f2443b0955d88734857e74&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R6SGEMAE%2F20260525%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260525T094641Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDVC7j1M5x31w5MxlfUKL%2BfaxS83OWlaDoxrAF4dc%2F5JAiEA9ev%2BstiP5mBgb%2BZV%2Bf22%2B6pyLaRxlsaxvnYHbWbxajoq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDBsrT46iOEo9MT5kHyrcAwMiL4xPkMUeWpAQFM2j%2F%2BpJvULtziCsQSB0H9xfvhjuI4qRYh56dtu%2FCKAF%2BOeDhZKoT80d9KVYkQFtT3fGAlDWgrvRZeXJUDuMHKbThWvS2ubGgnqO6mJwMhFC7ZnPHWPj0k21CXEXyhLGAF%2B5wc7MIeq6U23pXFQnXIuh9xnFzM5PCIH3Fsg6vC%2FMKjyjIwdjVVUIZujutiDGAWFCOcn4FONXu0jBuSlubijGpQxKV1Z0jFPOb9Xm0QaVwtOfpo6tbDTG%2B3qwCD4VzrtWPR04LayP2cVaClbhZYowPj59fHfdpffp1NNnvJwWGG2jQs6V5%2BNmIv3Fzk%2BKYjsjjD44Wx0DIL0kG4jjPjVWFk0LQj3i%2FoT%2Fv1eLtCcZEN0ywELm0MLR3knsTiUyNbVieTR6BhAUeMDkipglDH16kdBh3VB%2BXXJMMb3cotW4rPATB9clrLu1AQPP0jrs2DxwekZ5nbxJJ0NbvZCajOxc4GEnS87%2B0rk163xzzPFZTLhE1Ygx1q21Ga4cGnrEkTe9zXrWuTmS5%2FfMI%2B0bC5S7quBQxfogPPjSLEtRpVF1LVx8if3%2Fs%2FPqaDZOAqt8AHi4QWLQnFU924Opi9iFomJuzybYjaKL5pJ3qOnMWUP2MOyN0NAGOqUBVLnam%2BD5AHiUEJpK0AxC3aehSYT8bniT81i74QNLQhNsu0fC%2B0U%2BJnOw3k%2BlUdl%2F3dbsVqHcOep4zFnDPfQJqX2KXqyzm4Xo2X5HxE%2BcyQLoeqzJiJd3oF9PylncRUneXOuvGIS5GeMn3X3vfJbC2vuz4LDaDWEayfOZLaCdvhR8C4Qx%2B7BmG5i35pMLFiyFfNydHbLRL1gVxVtLAhuHLFJI6TAL&X-Amz-Signature=ca35be8978f49c5aea0deafd11845c33f4900e2aa384ee1cd275db2ba0c25a87&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
