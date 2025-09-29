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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YWSZCJMM%2F20250929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250929T181616Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJGMEQCIFFn7q5XDxVA%2FkIUzqTZuxD2not4h8RWkouVQlxfVb%2FYAiArEo8nlfci5I5f2XhkZPt8Cvw%2BoKU4wd0h9SQ0Mt%2BdXCqIBAja%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMEqBMIf%2BNSSoBluhGKtwD%2FyLPrH1qJ3gwgRPrZdIu%2FYXxBcPmqWIh6xiD2xVFgR9rI%2BYS4CWttH3KTSSxmwwpOmxvK%2BBlA7csx70TvZjXCueHhDPt8obQk079WwNkslH2jibwqm76u01ukjbXE01PPdjRBlELC73qPcav63cULhBIOL%2Bg5yjaG7jeK%2FS25aKOPxjHyeW165Is5wyVsY8qFuI%2BQiIhKJ%2B0gZ9Z4dhzl4wD0c0ao6pfA%2FBP76ZJsbqGw5O1WNXmmb3mgMH7JKyvEDkqxJqM2scksN%2Ft%2BUk9IxT%2BszUB86xQLQEIZY9o2Rg1JKIdj9YD%2Fw2gAQLnoSBr8gcdKBIX00e7XtkyEiolq6apP0jY%2FdtAMDelHnFpMWh9V0o5JA%2BWnDvFAMBYDln2Q9nOP5dtOcu6gBxYERBNIzDkujzWW60Sh3s%2FGQF40LA5nJtXwMFC3a2M%2FyiStUPHBpLTmF22%2BUXRjTFjwOCzf5EERYzdXc61AmcWQScpFe2ranVcgror9ORV0unCGIWKKZPG9wMKMtb6uXzLkC8F%2Fn2RIAT7iuLv60pfo1sk7amp4ILp86Uybxox6S0HA9Zqt0knRE7X9MCUf97ZwJlVHgxbQ27qir11Trgi2nhe0SxNdoMeNlhV9Bc41KYw5O3qxgY6pgFsVmWQFZSMpqdJWOskuKf6j%2FBAaaZO4wT%2BkNDqn47v4K%2F8lC7JfrUxOqj8VkDwFTNBnSkGVaTxRaE%2BogQzRXs1KNysfNc4XnSmDN90HGmG2r0xTFK1IJiA4p8zZY4ofNU5UwFWp3ovKlMJ%2B7Gx7o9nnZdo11IVfRLrlMyr36p95Uz%2B%2FmE%2B2E79%2FE51SQG9QjkP1FPJw0rKssjLgcuHAR5WNvClMi66&X-Amz-Signature=c7377ca7f9608afd7f1003134dd41076c38077e6a72b531bbacdd3ef13422570&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YWSZCJMM%2F20250929%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250929T181616Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJGMEQCIFFn7q5XDxVA%2FkIUzqTZuxD2not4h8RWkouVQlxfVb%2FYAiArEo8nlfci5I5f2XhkZPt8Cvw%2BoKU4wd0h9SQ0Mt%2BdXCqIBAja%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMEqBMIf%2BNSSoBluhGKtwD%2FyLPrH1qJ3gwgRPrZdIu%2FYXxBcPmqWIh6xiD2xVFgR9rI%2BYS4CWttH3KTSSxmwwpOmxvK%2BBlA7csx70TvZjXCueHhDPt8obQk079WwNkslH2jibwqm76u01ukjbXE01PPdjRBlELC73qPcav63cULhBIOL%2Bg5yjaG7jeK%2FS25aKOPxjHyeW165Is5wyVsY8qFuI%2BQiIhKJ%2B0gZ9Z4dhzl4wD0c0ao6pfA%2FBP76ZJsbqGw5O1WNXmmb3mgMH7JKyvEDkqxJqM2scksN%2Ft%2BUk9IxT%2BszUB86xQLQEIZY9o2Rg1JKIdj9YD%2Fw2gAQLnoSBr8gcdKBIX00e7XtkyEiolq6apP0jY%2FdtAMDelHnFpMWh9V0o5JA%2BWnDvFAMBYDln2Q9nOP5dtOcu6gBxYERBNIzDkujzWW60Sh3s%2FGQF40LA5nJtXwMFC3a2M%2FyiStUPHBpLTmF22%2BUXRjTFjwOCzf5EERYzdXc61AmcWQScpFe2ranVcgror9ORV0unCGIWKKZPG9wMKMtb6uXzLkC8F%2Fn2RIAT7iuLv60pfo1sk7amp4ILp86Uybxox6S0HA9Zqt0knRE7X9MCUf97ZwJlVHgxbQ27qir11Trgi2nhe0SxNdoMeNlhV9Bc41KYw5O3qxgY6pgFsVmWQFZSMpqdJWOskuKf6j%2FBAaaZO4wT%2BkNDqn47v4K%2F8lC7JfrUxOqj8VkDwFTNBnSkGVaTxRaE%2BogQzRXs1KNysfNc4XnSmDN90HGmG2r0xTFK1IJiA4p8zZY4ofNU5UwFWp3ovKlMJ%2B7Gx7o9nnZdo11IVfRLrlMyr36p95Uz%2B%2FmE%2B2E79%2FE51SQG9QjkP1FPJw0rKssjLgcuHAR5WNvClMi66&X-Amz-Signature=b09f6eac29c2757c54a0a331e38403c81dd4d7345f207dfc841d53e3c0706179&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
