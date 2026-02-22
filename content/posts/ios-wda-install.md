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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ZNPQVTV%2F20260222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260222T011204Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC3bZgmne6pfi8iEljlNpc3TcL8shG%2BbVlekgvXriWHYAiEAgF1R9AZ3JPzm5dsHkT75R7%2F9XizRLEco4%2FYMllQ2V%2BYqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPOi0dOmj1F5A%2Fi26yrcA18SwY8%2FyGD4j3I9g6tjxg9Z3Q50kogc7fmLjPnB3yeYA5PMgMBT%2BmZinVca%2B%2BQ6UVSD2i75RuD0LhHyil04Sev%2BeRydqUu7xCjAxQ6hJSuUQp9Ua38be6uXj2VVimr7nb2BW3NePcCJqqQzJgDcyRu59GV0fSbfU80cLXZQJyS6ry6Jc%2BVqThCcEvwUyFkEuFRAD9gk0w3xkzTeywvfGl0HRZ6bf4JaWp8JSoqFLsRtJGss6MbH9UOdJQDzDgVxbqbdLaR2ycOgOMfd%2BlmTixohg7UEpMOxcrbcQp5aXJ1NmpTwisjoss4chYy7x7Y1q8O%2B0ZELQjyZXGB4BfeEkJ6q2qYesW2hUiMifa5t2ItVRhoIQcR839WVBjuwwPQlXOVj5AmLIn0pyUP3lWd8uALdesug%2BAWw3ugkTLPaITlm%2FyfOUeX3BiCwo%2FVkjmhnZGJSn5zr9nAyGmHVCmsXd4a%2Fe9O7eYd1P2%2BQ8H4H%2F3RDlx9zmYoyap7saHovkrw2thYwznXq8tUMBJZh6kz8isT%2FTrZ3solfMT4vkazUXXsjBBa4KTxQLhMJ5%2FbmKAnrajl9FWfsqQFNnycN8P%2F2toInsWjEQbKN9RpYZt4nqePyv2%2BeaAiqS6EqQAw2ML2l6cwGOqUBIig1RcEwoJbt2QFN6S3NroirJFjZLMppGUr3F7LKOfRNM2SXNyb0%2FsGKa4g7mEoMNGTO9DQoUenOwgLJtBwo70okoUS5vsy4TTJwEf8jlS1wkJAMi2lc59sjlJK%2FEKqQtXSeuL1IUPF2Y0%2BKkSa9hYfUSbMhAG89c3CSOXYP9QfFskN9D%2BpeXxZ7kb6RQBpKf0kDUwRsiv7jov4TPyGsOi8%2FhFIg&X-Amz-Signature=ba2178548d3d244db8f0b61e731de530c8f32d547671a35f2a605142e0108279&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ZNPQVTV%2F20260222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260222T011204Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIC3bZgmne6pfi8iEljlNpc3TcL8shG%2BbVlekgvXriWHYAiEAgF1R9AZ3JPzm5dsHkT75R7%2F9XizRLEco4%2FYMllQ2V%2BYqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPOi0dOmj1F5A%2Fi26yrcA18SwY8%2FyGD4j3I9g6tjxg9Z3Q50kogc7fmLjPnB3yeYA5PMgMBT%2BmZinVca%2B%2BQ6UVSD2i75RuD0LhHyil04Sev%2BeRydqUu7xCjAxQ6hJSuUQp9Ua38be6uXj2VVimr7nb2BW3NePcCJqqQzJgDcyRu59GV0fSbfU80cLXZQJyS6ry6Jc%2BVqThCcEvwUyFkEuFRAD9gk0w3xkzTeywvfGl0HRZ6bf4JaWp8JSoqFLsRtJGss6MbH9UOdJQDzDgVxbqbdLaR2ycOgOMfd%2BlmTixohg7UEpMOxcrbcQp5aXJ1NmpTwisjoss4chYy7x7Y1q8O%2B0ZELQjyZXGB4BfeEkJ6q2qYesW2hUiMifa5t2ItVRhoIQcR839WVBjuwwPQlXOVj5AmLIn0pyUP3lWd8uALdesug%2BAWw3ugkTLPaITlm%2FyfOUeX3BiCwo%2FVkjmhnZGJSn5zr9nAyGmHVCmsXd4a%2Fe9O7eYd1P2%2BQ8H4H%2F3RDlx9zmYoyap7saHovkrw2thYwznXq8tUMBJZh6kz8isT%2FTrZ3solfMT4vkazUXXsjBBa4KTxQLhMJ5%2FbmKAnrajl9FWfsqQFNnycN8P%2F2toInsWjEQbKN9RpYZt4nqePyv2%2BeaAiqS6EqQAw2ML2l6cwGOqUBIig1RcEwoJbt2QFN6S3NroirJFjZLMppGUr3F7LKOfRNM2SXNyb0%2FsGKa4g7mEoMNGTO9DQoUenOwgLJtBwo70okoUS5vsy4TTJwEf8jlS1wkJAMi2lc59sjlJK%2FEKqQtXSeuL1IUPF2Y0%2BKkSa9hYfUSbMhAG89c3CSOXYP9QfFskN9D%2BpeXxZ7kb6RQBpKf0kDUwRsiv7jov4TPyGsOi8%2FhFIg&X-Amz-Signature=5b04997dd3e0a74eff623d6dbbd816dac02862a64a976ae958eda30833e658bd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
