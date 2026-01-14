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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XLCZSRKO%2F20260114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260114T010023Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJHMEUCID6BdhlwHaIhD4OmTaSKIaZyosPSthRlW6dkjSGWbJv5AiEAox8zGuLO8cWyU%2BWnxMmNAnpgR1PI%2Btey9RW4%2FaGFKBMq%2FwMIEhAAGgw2Mzc0MjMxODM4MDUiDHLKPiXIcs9UeAXgFSrcA8%2FJCpSUcKU86Hs%2FISgzd4l1DBySPui9bqgBWfk%2FjSMFl8pMDWaQG5Bm1HhKs61%2FhW4ij7ZQ1zpYW9MTGKlN2tARriWqb%2BENeGapqTAbXGqLFGrjYhOfv4wfYpnI4NFxLg6CH2Ca4FCREiL9Oq9DQOYQsL1C79Tr8ey6O71OdeKaApkImVWW3XU%2Fg%2BG6bQXRNyPOlioPaj4Fis15ZaDTYB9Qp9VpCLauXB5uGWFCIPPoao57TuZ167bYg0GOa7S7%2B%2BkHTJaJWSwyrY4%2BTbd7%2FXdB%2F929%2FxTif%2F8t7dhsOSbBVSFN9fFOP5UOOfLH3jUa%2BRr%2Fs%2BrMJJ7vYKbIJxxXQ4n9oUE6We2euEAK6xnvgbP20ImYEdF046%2BMKPKsYNL4P8YAWh39ygn8AQe5eBQ7pq7YPlOKj6NzGf9WMwehKBVUsUlxR6tcipIysMSlyIVxxOgx4%2BGkyam%2FQg0gqgEMR6mq7wy%2BAtKMG8%2F02AM3v0Tzj6HkEOvGZW3YZ3sGQcYPGDvGxAZmC90ZnnWRaDehr7ASlwS1Zxq%2BVs1HtwEMcJ9amgUkH3JdFUxWr%2BPQlD3tMf6OmtTyzxxIywjRGfmmS8GFGULLV8a9f6PIQkVYvtLGnznoaRxu%2BweOvHiYMLfNm8sGOqUBFgYtEhL34rGGWpalZV4hFx4qpa74Ys4bHoDMa9HQIJ3X9%2B%2BLOGieA88WD6UDnLilFotD5q%2BbINC1qUByo1Yt4jbji4r5ps5hmDt9ep93Y%2FR8QlAIbTN8COG7f0xN3r0YfTl5p48bsyn57qIXbPp0j83GfZjbNTCaC2ct56vMZPFiNmWTF95mcdwN%2Br%2FLupDN%2BBUDq9XRq0tA2hugeVwad%2FUVb0f2&X-Amz-Signature=2b58ae9ce2512da1b7bea7e4e32fa1d5bd2f33c2a61358d3358bea5e384dd1e8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XLCZSRKO%2F20260114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260114T010023Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEkaCXVzLXdlc3QtMiJHMEUCID6BdhlwHaIhD4OmTaSKIaZyosPSthRlW6dkjSGWbJv5AiEAox8zGuLO8cWyU%2BWnxMmNAnpgR1PI%2Btey9RW4%2FaGFKBMq%2FwMIEhAAGgw2Mzc0MjMxODM4MDUiDHLKPiXIcs9UeAXgFSrcA8%2FJCpSUcKU86Hs%2FISgzd4l1DBySPui9bqgBWfk%2FjSMFl8pMDWaQG5Bm1HhKs61%2FhW4ij7ZQ1zpYW9MTGKlN2tARriWqb%2BENeGapqTAbXGqLFGrjYhOfv4wfYpnI4NFxLg6CH2Ca4FCREiL9Oq9DQOYQsL1C79Tr8ey6O71OdeKaApkImVWW3XU%2Fg%2BG6bQXRNyPOlioPaj4Fis15ZaDTYB9Qp9VpCLauXB5uGWFCIPPoao57TuZ167bYg0GOa7S7%2B%2BkHTJaJWSwyrY4%2BTbd7%2FXdB%2F929%2FxTif%2F8t7dhsOSbBVSFN9fFOP5UOOfLH3jUa%2BRr%2Fs%2BrMJJ7vYKbIJxxXQ4n9oUE6We2euEAK6xnvgbP20ImYEdF046%2BMKPKsYNL4P8YAWh39ygn8AQe5eBQ7pq7YPlOKj6NzGf9WMwehKBVUsUlxR6tcipIysMSlyIVxxOgx4%2BGkyam%2FQg0gqgEMR6mq7wy%2BAtKMG8%2F02AM3v0Tzj6HkEOvGZW3YZ3sGQcYPGDvGxAZmC90ZnnWRaDehr7ASlwS1Zxq%2BVs1HtwEMcJ9amgUkH3JdFUxWr%2BPQlD3tMf6OmtTyzxxIywjRGfmmS8GFGULLV8a9f6PIQkVYvtLGnznoaRxu%2BweOvHiYMLfNm8sGOqUBFgYtEhL34rGGWpalZV4hFx4qpa74Ys4bHoDMa9HQIJ3X9%2B%2BLOGieA88WD6UDnLilFotD5q%2BbINC1qUByo1Yt4jbji4r5ps5hmDt9ep93Y%2FR8QlAIbTN8COG7f0xN3r0YfTl5p48bsyn57qIXbPp0j83GfZjbNTCaC2ct56vMZPFiNmWTF95mcdwN%2Br%2FLupDN%2BBUDq9XRq0tA2hugeVwad%2FUVb0f2&X-Amz-Signature=6eac6a9968db02cbe6a33ec949b076ad8f5cd047452d3977327fec016c1ea778&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
