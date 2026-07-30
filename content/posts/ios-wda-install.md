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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666E74FLL4%2F20260730%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260730T190727Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCF0Ui32gK01ziKSUPOGNK342bREslWFa6c1WqVoq8QOAIgOzVgHjSHkn1V%2Bk1RxaPyThOYc%2F%2BwC6F8PVjiIx%2BXQ%2FsqiAQInP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8joFlwxtxyJhYngircA6rvMZ%2Bm8FPlSKdsAm1ejLfgDkhKEJbi0G9qE%2Btox%2FCfSry66sXc1ucVhx9Ly00Grxyxz0efUID1bZX4jlb%2Fd16ZdjnFZjqVitQsqTB2g1R0IQQF1iObEr13N3sAZHZquuPSHlsp5qykGD0zj3U7oget72WgRdsZOAlENQEh7PF2PPj86BR198vUJjOGGxDityTFCvh7EOIRqD9tpTpvmvf058%2FjCzTJbd4VRfwOi%2BpHwcg5yBXEIcnxG9ARphtaX%2FgqOwKQmnT87gMAqiTuEgcgJvpKpEK1oevDg%2BNW%2F55FMR9Zr4uUz1O5kJGvFGq2MPx4eCU5EGlaNC%2BaCMjuWicAnQzAqE%2BiD11TfkN3arTJelxxZnMbm0eAGzPAjQrDx40B7K7xxEC0CG%2B0b0LEt76d9ZOdpAugY5jmWsTsfh1y%2BNMTCfYmst4pIZW1TToEfTkGek6fUyj1GcZpvrq2SX56a%2BsuERbrqIrTS49FP3TU6tmi9MfZREKCKvnNgqvtoT6Ys5KQGxTJZCvX%2FTxRwNCRG%2FEH8eBKrNEArN1cM%2FCnT4PPgQPX0w86pcQTlxkHlkYAbAB4JUCCjQDVKtR1mwT1o1GZDFX%2BIbrBQaoD6SsKBNtPWDfCgY3tooRUMK2xrtMGOqUBl9F9FM%2F7bq1ZmGvobsM6FOcFTzNChWCSiP%2F6P6jzLwZ4RDzB4FPewfalwQ35I9%2B43rEtW5Oa%2FKxdnDt1PqjFp35a8sC08gBJMy8N5ifSzbJ%2Fb%2BD8AsNz2avMxqjHmrIgm1DnmGql7D%2BbSsMrDTO5gBCExFZBJAr0z5%2BnT%2F72o%2FyoTgWXH0eSZinKASa6Lh%2BFjMY19qWeIkVoT2iiLggWT21qHLu%2B&X-Amz-Signature=ff447827510d0f9f9ddd0046c6044e59073f6c15da45bc29f9dc3b2583c21c74&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666E74FLL4%2F20260730%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260730T190727Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCF0Ui32gK01ziKSUPOGNK342bREslWFa6c1WqVoq8QOAIgOzVgHjSHkn1V%2Bk1RxaPyThOYc%2F%2BwC6F8PVjiIx%2BXQ%2FsqiAQInP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8joFlwxtxyJhYngircA6rvMZ%2Bm8FPlSKdsAm1ejLfgDkhKEJbi0G9qE%2Btox%2FCfSry66sXc1ucVhx9Ly00Grxyxz0efUID1bZX4jlb%2Fd16ZdjnFZjqVitQsqTB2g1R0IQQF1iObEr13N3sAZHZquuPSHlsp5qykGD0zj3U7oget72WgRdsZOAlENQEh7PF2PPj86BR198vUJjOGGxDityTFCvh7EOIRqD9tpTpvmvf058%2FjCzTJbd4VRfwOi%2BpHwcg5yBXEIcnxG9ARphtaX%2FgqOwKQmnT87gMAqiTuEgcgJvpKpEK1oevDg%2BNW%2F55FMR9Zr4uUz1O5kJGvFGq2MPx4eCU5EGlaNC%2BaCMjuWicAnQzAqE%2BiD11TfkN3arTJelxxZnMbm0eAGzPAjQrDx40B7K7xxEC0CG%2B0b0LEt76d9ZOdpAugY5jmWsTsfh1y%2BNMTCfYmst4pIZW1TToEfTkGek6fUyj1GcZpvrq2SX56a%2BsuERbrqIrTS49FP3TU6tmi9MfZREKCKvnNgqvtoT6Ys5KQGxTJZCvX%2FTxRwNCRG%2FEH8eBKrNEArN1cM%2FCnT4PPgQPX0w86pcQTlxkHlkYAbAB4JUCCjQDVKtR1mwT1o1GZDFX%2BIbrBQaoD6SsKBNtPWDfCgY3tooRUMK2xrtMGOqUBl9F9FM%2F7bq1ZmGvobsM6FOcFTzNChWCSiP%2F6P6jzLwZ4RDzB4FPewfalwQ35I9%2B43rEtW5Oa%2FKxdnDt1PqjFp35a8sC08gBJMy8N5ifSzbJ%2Fb%2BD8AsNz2avMxqjHmrIgm1DnmGql7D%2BbSsMrDTO5gBCExFZBJAr0z5%2BnT%2F72o%2FyoTgWXH0eSZinKASa6Lh%2BFjMY19qWeIkVoT2iiLggWT21qHLu%2B&X-Amz-Signature=ddec679cc7e5ba833a38533443c91f443c5549d18f5c6f78d6840c26397f311f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
