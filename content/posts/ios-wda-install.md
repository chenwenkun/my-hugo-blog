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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGPE5T2J%2F20260511%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260511T192615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFMaCXVzLXdlc3QtMiJIMEYCIQD62onlKnYE0tk3QTruc1v5V%2FTte4Cfp86ZUu8is%2Fmo2wIhAK%2BfAi6ScEMp2vGc9KuxmPLftXwahrujCTurrVDmC9V7Kv8DCBwQABoMNjM3NDIzMTgzODA1IgztYXKgPkrJn4et%2BSkq3AM7Pp5sknNfC5EmqIaqLk4IQcAROYtdpfxVOuCIKy%2Fbuq9%2ByWQOeDk25TmxDiH2n7RqBi12S44GBDhiukI58QdYpnHdGLdtYJuiKMRCf2OmCykuFJsJCiKb7S2%2FnOGXIn569Kx56MriiF8b5w%2Ff8JprDu3sQsQgPLkBozJIsfn08EQJhwDRXHeGbKAdWwrpCfI0E2sPHsT2tmq4f8HIglzFL0y32bMGc2ZKnfWXvtws5s23kr5t7mMIHp%2BCuadXOO5zWh7nqxgx9Yo1bH%2F0kqIVEDVlD7Ac8ecpZFv8T5kbydIX6fuEaUjRm%2FYW21Nq726Vc%2FR5rjMaGUe4F6eum2Xo19Fg41%2BVovbHLIryxzuGsA5eXrHFWspGYrntDHOFk%2BxVrE4XxgUyr1pKizEjXqQZ6F7gAuAxUNKV0KD5O8zkFl%2F%2B5vK6%2FWRa1jcyeEx0PUAJ7jQhauSgPxNVLRZsZGPYIAP4kb8pTbtU552HgspBbgpY8hMi85O4RCiQ8v3rdEMClyC7FDRi5gnR7srqVs1wqHKzuquDstW7drLEeWO44CcgwQHwKrDFgIiDlYIFdO3HzBkfndovSZcXNDurm8XmrZY3mK4bTxxovQKrkRH6iEAqW1Oetic%2FBgdi7TDQvojQBjqkAV0cqoDnQlmTjbaRb%2FuFJK8n%2FwVFAlqA8I27KOG1CSkv%2BQ7NWIWXrbfPHrotTRqPyJB9ZydDOYeYOeBn7SxFsNC39z%2BA%2BjWytq%2FyZ3dc3cM%2BBRncMcuWGTTphQMhzijfh2RcnhNFwgLUUxJJlyVzckdrkPzYFIDQmS%2Fc1SOhDGc851mloyVzuHpQPufvFslpwL5OA63A53fiZFZBraG088W2cAuP&X-Amz-Signature=5b09398936d3b1f7410156919f325bcdf7d92cde8dac42311f65b8db8874a769&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WGPE5T2J%2F20260511%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260511T192615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFMaCXVzLXdlc3QtMiJIMEYCIQD62onlKnYE0tk3QTruc1v5V%2FTte4Cfp86ZUu8is%2Fmo2wIhAK%2BfAi6ScEMp2vGc9KuxmPLftXwahrujCTurrVDmC9V7Kv8DCBwQABoMNjM3NDIzMTgzODA1IgztYXKgPkrJn4et%2BSkq3AM7Pp5sknNfC5EmqIaqLk4IQcAROYtdpfxVOuCIKy%2Fbuq9%2ByWQOeDk25TmxDiH2n7RqBi12S44GBDhiukI58QdYpnHdGLdtYJuiKMRCf2OmCykuFJsJCiKb7S2%2FnOGXIn569Kx56MriiF8b5w%2Ff8JprDu3sQsQgPLkBozJIsfn08EQJhwDRXHeGbKAdWwrpCfI0E2sPHsT2tmq4f8HIglzFL0y32bMGc2ZKnfWXvtws5s23kr5t7mMIHp%2BCuadXOO5zWh7nqxgx9Yo1bH%2F0kqIVEDVlD7Ac8ecpZFv8T5kbydIX6fuEaUjRm%2FYW21Nq726Vc%2FR5rjMaGUe4F6eum2Xo19Fg41%2BVovbHLIryxzuGsA5eXrHFWspGYrntDHOFk%2BxVrE4XxgUyr1pKizEjXqQZ6F7gAuAxUNKV0KD5O8zkFl%2F%2B5vK6%2FWRa1jcyeEx0PUAJ7jQhauSgPxNVLRZsZGPYIAP4kb8pTbtU552HgspBbgpY8hMi85O4RCiQ8v3rdEMClyC7FDRi5gnR7srqVs1wqHKzuquDstW7drLEeWO44CcgwQHwKrDFgIiDlYIFdO3HzBkfndovSZcXNDurm8XmrZY3mK4bTxxovQKrkRH6iEAqW1Oetic%2FBgdi7TDQvojQBjqkAV0cqoDnQlmTjbaRb%2FuFJK8n%2FwVFAlqA8I27KOG1CSkv%2BQ7NWIWXrbfPHrotTRqPyJB9ZydDOYeYOeBn7SxFsNC39z%2BA%2BjWytq%2FyZ3dc3cM%2BBRncMcuWGTTphQMhzijfh2RcnhNFwgLUUxJJlyVzckdrkPzYFIDQmS%2Fc1SOhDGc851mloyVzuHpQPufvFslpwL5OA63A53fiZFZBraG088W2cAuP&X-Amz-Signature=1e0c9905133f230b9c43070003077567cea984f56cf06499f7e8cc9c797f090b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
