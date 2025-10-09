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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQIEAZZY%2F20251009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251009T005015Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDAaCXVzLXdlc3QtMiJHMEUCIBBhFSzDP5O472Dqh%2BWouV%2FRyrlxXLdPJxmhwS9q0Q%2B8AiEAtrr%2FyhpnMMTLB97rzUz1JarORVN38hpTSaFG09DLxi0qiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFHZF6M%2BhEKkUPHCAircA8ts%2BZ%2BdTijGKtpgRhTgr8HtmHVEsMMlb0jUzoChTxSypXU3Hng1KKrT5lyc26AiHADsTEq38ZGObaCuN6GPq%2FAn37Aovq8kZXffc5NerH7yt%2BoCYuqx1T8f1ZJ7qXlas631Q1yXb5qRKnfBT0cQgMBUm9pOiK1bGnV332hCLzdhtG3NEoSLR%2F0YlI9BBZ%2B%2BrCQTHlg3nPZhJPLEQ1TNiXMaM49UZ5ELEVprmAcYrPz6bfTC0CUfcKtqwnbz%2FAOOPoN32N%2BC1HZQhy8U4b63Iw8VuW0d%2FvFE1smHy0HCPklcO9%2FHDX2TLxqJASLOqZrQj6wvXNGSiFWlC9DGsTmsY4TDdlXsobt7RUsANCxXBRsVvt1IIKVc0IbrgvaBvwSpqybpB73PP3z4Uf0RPqS237r7wI7p%2BQj5xWeW7bYicHZ8lG1iOMPJf2fKh2SetcPhbop1glKzuCY8ltgrTljPbR3K5%2B%2BWwlfMt4F%2FUu1%2FhGRqJ2yzcb7yhhAK%2B0ZkDjYt%2Ftm3kfy%2B7e6u37l9J4f650ZQaj9n7hpSqSWPiNnacaN1di6tMLkaeMHOLZlG0Dmr%2F1K702PvbYV3q6jUBe65y87syLgc45OdOGNp26%2BjqQ2aoX11ay7q2Ew5X%2FUNMIn7m8cGOqUBJri6YkJK8Dm6Afbk4XGcZ5ffZ5ayA6HUxhfhMdGTsAFTAcB9AuCwScuBiVi3lsLMdcUv5wUUJCDMySgRMiA5jKPfGDWnLBAyVYA%2BKkHU%2BpSa0lr%2BY9CXmJLmj9jQvH%2Fy5p7u6tFjhWXf9qwXdQsnB6zFURt2eut7fiY2YmsmZqu2IugcrQzuQiz3cTg0ex2xkXez9rs1q6v003THPJKJAHQYKuzV&X-Amz-Signature=b21550c682c8b2291aba24f4f6349121699d3e97c1ba85b9a5a91370f2d8a3b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQIEAZZY%2F20251009%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251009T005015Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDAaCXVzLXdlc3QtMiJHMEUCIBBhFSzDP5O472Dqh%2BWouV%2FRyrlxXLdPJxmhwS9q0Q%2B8AiEAtrr%2FyhpnMMTLB97rzUz1JarORVN38hpTSaFG09DLxi0qiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFHZF6M%2BhEKkUPHCAircA8ts%2BZ%2BdTijGKtpgRhTgr8HtmHVEsMMlb0jUzoChTxSypXU3Hng1KKrT5lyc26AiHADsTEq38ZGObaCuN6GPq%2FAn37Aovq8kZXffc5NerH7yt%2BoCYuqx1T8f1ZJ7qXlas631Q1yXb5qRKnfBT0cQgMBUm9pOiK1bGnV332hCLzdhtG3NEoSLR%2F0YlI9BBZ%2B%2BrCQTHlg3nPZhJPLEQ1TNiXMaM49UZ5ELEVprmAcYrPz6bfTC0CUfcKtqwnbz%2FAOOPoN32N%2BC1HZQhy8U4b63Iw8VuW0d%2FvFE1smHy0HCPklcO9%2FHDX2TLxqJASLOqZrQj6wvXNGSiFWlC9DGsTmsY4TDdlXsobt7RUsANCxXBRsVvt1IIKVc0IbrgvaBvwSpqybpB73PP3z4Uf0RPqS237r7wI7p%2BQj5xWeW7bYicHZ8lG1iOMPJf2fKh2SetcPhbop1glKzuCY8ltgrTljPbR3K5%2B%2BWwlfMt4F%2FUu1%2FhGRqJ2yzcb7yhhAK%2B0ZkDjYt%2Ftm3kfy%2B7e6u37l9J4f650ZQaj9n7hpSqSWPiNnacaN1di6tMLkaeMHOLZlG0Dmr%2F1K702PvbYV3q6jUBe65y87syLgc45OdOGNp26%2BjqQ2aoX11ay7q2Ew5X%2FUNMIn7m8cGOqUBJri6YkJK8Dm6Afbk4XGcZ5ffZ5ayA6HUxhfhMdGTsAFTAcB9AuCwScuBiVi3lsLMdcUv5wUUJCDMySgRMiA5jKPfGDWnLBAyVYA%2BKkHU%2BpSa0lr%2BY9CXmJLmj9jQvH%2Fy5p7u6tFjhWXf9qwXdQsnB6zFURt2eut7fiY2YmsmZqu2IugcrQzuQiz3cTg0ex2xkXez9rs1q6v003THPJKJAHQYKuzV&X-Amz-Signature=2f06bd543bf619c6d6f71af9d3e2584f2059d483200703be884019d3a2d33abc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
