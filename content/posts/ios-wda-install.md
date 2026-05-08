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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZKIUYIN%2F20260508%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260508T190222Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJGMEQCIC53OCWiTwunEvG0tTANpS5P2HPt5WsbMRVVaJs42SUrAiBlJ0vbJ%2BLcG6BIghav4VHkENzTSN6PxPSMFyzfguEPASqIBAjT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMd4%2FctFx2GjnF5WwRKtwD%2FSkXp%2FKC0yxfu%2FwUFolZtNewaWNU5oIzpAhf4Ep87hJELhRGZ5fiIHjpAFApgxF9fZA4Gq6SEs%2BBPZKvckr29H6TofuLuG7hsj08lYHif%2FVzf75Um%2FOH0wcayavIdGbElgJyo9kNyQc%2F%2BeBjRMC51989zlolduPNUw4W53Ms35HZ5J%2BzBNK15YM16u%2BKV05FOlu7UppcMOpkFyjt9eTzqKZZ%2FV2GqSxZp%2FvEyTNWIJuExQCFN2tG%2FmaJByJdBM%2BSR68pqTMFhtO%2B%2BcsKfFicRRrzA065UbFDG1TD3asKYTuixS8p%2BMFoaBE31lIDYGJwUvtEwB1rZuyokqXMdWoRNxb403O8VXZGazf3zlImmJA8Lrr2LKHRPwgdc2Z0Ehfqb6Yz%2FOb2j0j%2BahVD7pvl4MA6s17WIz1aCIe8B7r469KM3TIuRwWkCzsmazTdWRk%2BEIs4fbl4m66tFClSLa51qiq6KO4FX9yj4uqyvbnTtHnH9LGRlaEablkzSwmoonpBZpSSZrEbdaeOqX43hCfCZUzpA6hM%2FCh0rpsIctW8836iFoMt%2F3nSJr4nIE4EgHy29gMamVbqG10V6Ee0iWhhPJSXnjrdtrOAGCiieRz3KRxUiLs9lgBfXbyLFbow2sD4zwY6pgHgXoxPyG1KQSJ3sn7k7emW1yPFcavmMsSoTiBpj6i9LPuAbXMsEnei1%2FIfGf3NzyKADg0OWFWReC1EbABFWqIex9GiKQQ1vtMjPgIXI%2BiUsLkg1lcBEhRjj0oLTl56uus3K9kgSxYLQmJ2bFHfAWXwDS90533OH8F8kjYAFT1xh9%2BEnpx4VzFFHuZ0G2E0M6Z3K6kgU6Pj2L3YRamIANDO%2BSTJJHYB&X-Amz-Signature=1e9b46f5139cc768379904cb4a7f7d4d14c62f6adda817682c9cf379e5bf7515&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZKIUYIN%2F20260508%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260508T190222Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJGMEQCIC53OCWiTwunEvG0tTANpS5P2HPt5WsbMRVVaJs42SUrAiBlJ0vbJ%2BLcG6BIghav4VHkENzTSN6PxPSMFyzfguEPASqIBAjT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMd4%2FctFx2GjnF5WwRKtwD%2FSkXp%2FKC0yxfu%2FwUFolZtNewaWNU5oIzpAhf4Ep87hJELhRGZ5fiIHjpAFApgxF9fZA4Gq6SEs%2BBPZKvckr29H6TofuLuG7hsj08lYHif%2FVzf75Um%2FOH0wcayavIdGbElgJyo9kNyQc%2F%2BeBjRMC51989zlolduPNUw4W53Ms35HZ5J%2BzBNK15YM16u%2BKV05FOlu7UppcMOpkFyjt9eTzqKZZ%2FV2GqSxZp%2FvEyTNWIJuExQCFN2tG%2FmaJByJdBM%2BSR68pqTMFhtO%2B%2BcsKfFicRRrzA065UbFDG1TD3asKYTuixS8p%2BMFoaBE31lIDYGJwUvtEwB1rZuyokqXMdWoRNxb403O8VXZGazf3zlImmJA8Lrr2LKHRPwgdc2Z0Ehfqb6Yz%2FOb2j0j%2BahVD7pvl4MA6s17WIz1aCIe8B7r469KM3TIuRwWkCzsmazTdWRk%2BEIs4fbl4m66tFClSLa51qiq6KO4FX9yj4uqyvbnTtHnH9LGRlaEablkzSwmoonpBZpSSZrEbdaeOqX43hCfCZUzpA6hM%2FCh0rpsIctW8836iFoMt%2F3nSJr4nIE4EgHy29gMamVbqG10V6Ee0iWhhPJSXnjrdtrOAGCiieRz3KRxUiLs9lgBfXbyLFbow2sD4zwY6pgHgXoxPyG1KQSJ3sn7k7emW1yPFcavmMsSoTiBpj6i9LPuAbXMsEnei1%2FIfGf3NzyKADg0OWFWReC1EbABFWqIex9GiKQQ1vtMjPgIXI%2BiUsLkg1lcBEhRjj0oLTl56uus3K9kgSxYLQmJ2bFHfAWXwDS90533OH8F8kjYAFT1xh9%2BEnpx4VzFFHuZ0G2E0M6Z3K6kgU6Pj2L3YRamIANDO%2BSTJJHYB&X-Amz-Signature=3f0b525f46cf51d8857ba55699068a844be6999987c04f9193f81441f252c292&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
