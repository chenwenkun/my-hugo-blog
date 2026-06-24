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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R2WJUMGD%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T192501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJHMEUCIAcmX4YF5wZUFb48Uh1U9gmmMD1W4omY7LoalZ%2Bx%2FACtAiEAnuEZTvIbMjNmXRC2QbBy7rJrHw8go56ogFuUkRHSfuIq%2FwMIOhAAGgw2Mzc0MjMxODM4MDUiDHnwaV8%2BtN%2B8WapCQyrcAzWJotjTbtVZ2P79acz2DHVq2CYkNF6Xo5pHHdn65tD%2Fqm6miGECpMOaRwMPpg6OYwQKWJWbY0fXbtXjxyDXtS7A0c9IZe%2BVeO3LlqSW8foqy9QWstO2AmjzxF0u%2B8Mm6N2RQzhlz%2FJEmEan22EMpCl0sBRzPLSN3xvZO%2FTOoflU3LrN3g613K4SBOR4yrJXjRsSAN3V%2BNQUG%2FfDVWMaduuQ9vfUkHxlc%2F0WG2FykRcmJMKBJ2Ga%2Benn3rGvofU9YdQ%2BYHbiyWgBpue%2BPo%2Ftt6DL9GNyWJivnA3LKlWg361HH2Bm7Zv2cvCV%2BGB5Oic%2BndnM8MSoNvCNd5pkRAXDfJxUc4tsoLyW3tkLltSQciL0aR35cxeH8UtPs8YAhtmaGmdtEVe2QAk7%2FwiEx%2FOm8CvhqaXHCv2mS0ngdIcRyMBtfl0YblSru4IpPsNaiyyDPQJX%2BSiub2VJf%2BVbatE9tKtWTDHaUQOv5yxZh5mxhW%2BI8XoAmLJfWP3ziiChx063NAtYEwHlFupmPzQrHEpQCGWkCAqaP0LTchJ4R%2FiPdn60smJ9eTVLZ2DffttpzrA33TeicUPH7uxe1QkK%2Fb1nidjHkZ7S3hBXEuEJXJrvm12eJrxs1Ktvf%2BlYFWa%2FMPKU8NEGOqUB2yhd9m65QaUzZZx6NKyPHAKnlZL%2FHNAewhFgcKXpspGJYK5HvSID4hdLdYHwx3v0PFEggbMf6iao0gXFIeaJVpDnmSNpbjcgQnAxvOF67rJma95a4fhPCAFNGWNPWc8FMwA%2BSgYD4bz0dYiaS7kmjbZ7Xr13vWHM0naRvqbjr89CUd%2BD1O2cdiTg8maHdHqTxxTCmAniDkqwE1Ih7j%2FwwZbj%2BcHk&X-Amz-Signature=4d5d935a93359afd978f4252cce738f18486072501e0c95e9c2e1d3ae31d6633&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R2WJUMGD%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T192501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHEaCXVzLXdlc3QtMiJHMEUCIAcmX4YF5wZUFb48Uh1U9gmmMD1W4omY7LoalZ%2Bx%2FACtAiEAnuEZTvIbMjNmXRC2QbBy7rJrHw8go56ogFuUkRHSfuIq%2FwMIOhAAGgw2Mzc0MjMxODM4MDUiDHnwaV8%2BtN%2B8WapCQyrcAzWJotjTbtVZ2P79acz2DHVq2CYkNF6Xo5pHHdn65tD%2Fqm6miGECpMOaRwMPpg6OYwQKWJWbY0fXbtXjxyDXtS7A0c9IZe%2BVeO3LlqSW8foqy9QWstO2AmjzxF0u%2B8Mm6N2RQzhlz%2FJEmEan22EMpCl0sBRzPLSN3xvZO%2FTOoflU3LrN3g613K4SBOR4yrJXjRsSAN3V%2BNQUG%2FfDVWMaduuQ9vfUkHxlc%2F0WG2FykRcmJMKBJ2Ga%2Benn3rGvofU9YdQ%2BYHbiyWgBpue%2BPo%2Ftt6DL9GNyWJivnA3LKlWg361HH2Bm7Zv2cvCV%2BGB5Oic%2BndnM8MSoNvCNd5pkRAXDfJxUc4tsoLyW3tkLltSQciL0aR35cxeH8UtPs8YAhtmaGmdtEVe2QAk7%2FwiEx%2FOm8CvhqaXHCv2mS0ngdIcRyMBtfl0YblSru4IpPsNaiyyDPQJX%2BSiub2VJf%2BVbatE9tKtWTDHaUQOv5yxZh5mxhW%2BI8XoAmLJfWP3ziiChx063NAtYEwHlFupmPzQrHEpQCGWkCAqaP0LTchJ4R%2FiPdn60smJ9eTVLZ2DffttpzrA33TeicUPH7uxe1QkK%2Fb1nidjHkZ7S3hBXEuEJXJrvm12eJrxs1Ktvf%2BlYFWa%2FMPKU8NEGOqUB2yhd9m65QaUzZZx6NKyPHAKnlZL%2FHNAewhFgcKXpspGJYK5HvSID4hdLdYHwx3v0PFEggbMf6iao0gXFIeaJVpDnmSNpbjcgQnAxvOF67rJma95a4fhPCAFNGWNPWc8FMwA%2BSgYD4bz0dYiaS7kmjbZ7Xr13vWHM0naRvqbjr89CUd%2BD1O2cdiTg8maHdHqTxxTCmAniDkqwE1Ih7j%2FwwZbj%2BcHk&X-Amz-Signature=d0c1bb67a7d129170593d4ac8745c2acc6d062bb337de850fb7cea8d561cebef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
