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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WAIRCAVQ%2F20260308%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260308T122629Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEwaCXVzLXdlc3QtMiJHMEUCIEfBL%2FimbX56%2B1gav1xeEN1%2BWce%2FlYXMyhq%2BpX2mNUWNAiEAqPcGsHgcGMpH%2FcA4Q9NEe6hcQvSY2jBN7Yi%2BoTibygkq%2FwMIFRAAGgw2Mzc0MjMxODM4MDUiDIRH4wdeKhCySnIjMyrcA0T4mvFD%2BWcZhHw6mZPgp3slyM6oNmMwiKegOTdmB1F1FNpDsiAUqv%2Fqv7Ssx1yAKUUzd1xUhsRI1dIS0CFMMy1GtekWUYV%2BIXUZ6kWPNXY3rE3qyx%2BPG76uOdp%2F0TF3ojD64eKGge5J62s50TYFDjNeBvzKzKNMlF7crEDvJn%2FP4q6lVZiWDPDj4hkGPKP6FO3PrwlmWPY502CI2BgTiZwKO6otL1ftUyyAduo608VlCrmFkAFXgCakCDejN3IJM5paNs7IJnr0Q2VtUCWDSiy%2Fskx2w1u2PSij7fl2P%2FMqTFSfqkiSfwvOhtRlMyyqcSeC2VaDYWLacSNxE7uO8XU0RB6s3rXcIx8uFjt2Zr6YkzzWW26e5BhjIrTEiVmuQXqo6WnJLPbYtnE9voIbBKRFLGCfXn1bskdqgz1xEaEXLmJEanimhlANcrtLyiav76K6G8ylbAjIqP5SNhjyRNKrzW4UK%2FxCO%2B6QnzwgmMzgcgJfWz3vszltvunK%2F%2F6%2FVK7R76XoJacD0GkF8R5ar0p6jrA4hHDpdv3nNKVmLTIzbCNOBipWdWl3joVUN9cxMAAB0asP8rpEPASnQNQAtO1auaukhXXtUNc%2F7Y5aRj9ezRyuxFDFv7%2ForwhDMMe7tc0GOqUBcxPKLES1gxzw7vPhs83c4x%2Fs3uiXhNT0x9G7%2FgTv8b3%2Bax5FYSI8xUElWQvJQu56nOr6tJRomjljTxhz%2BZY0iboGTE8na1cIJecY7k0%2BXiGsvDIyfuG12MoIuAJ87STngWcKcYVN8aexIZW4rb%2FKTLMTaSXqfXGcxGldIr%2BVBR5OusfTHr%2BPtdMm2xDP5Qpb5djaW16AK4F%2BA0W8beVX5LeTzrHV&X-Amz-Signature=88d83965e50ca87c3f4a50c22e8bc1fd7a831cdeaa907a9cff2582d9e7b44f62&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WAIRCAVQ%2F20260308%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260308T122629Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEwaCXVzLXdlc3QtMiJHMEUCIEfBL%2FimbX56%2B1gav1xeEN1%2BWce%2FlYXMyhq%2BpX2mNUWNAiEAqPcGsHgcGMpH%2FcA4Q9NEe6hcQvSY2jBN7Yi%2BoTibygkq%2FwMIFRAAGgw2Mzc0MjMxODM4MDUiDIRH4wdeKhCySnIjMyrcA0T4mvFD%2BWcZhHw6mZPgp3slyM6oNmMwiKegOTdmB1F1FNpDsiAUqv%2Fqv7Ssx1yAKUUzd1xUhsRI1dIS0CFMMy1GtekWUYV%2BIXUZ6kWPNXY3rE3qyx%2BPG76uOdp%2F0TF3ojD64eKGge5J62s50TYFDjNeBvzKzKNMlF7crEDvJn%2FP4q6lVZiWDPDj4hkGPKP6FO3PrwlmWPY502CI2BgTiZwKO6otL1ftUyyAduo608VlCrmFkAFXgCakCDejN3IJM5paNs7IJnr0Q2VtUCWDSiy%2Fskx2w1u2PSij7fl2P%2FMqTFSfqkiSfwvOhtRlMyyqcSeC2VaDYWLacSNxE7uO8XU0RB6s3rXcIx8uFjt2Zr6YkzzWW26e5BhjIrTEiVmuQXqo6WnJLPbYtnE9voIbBKRFLGCfXn1bskdqgz1xEaEXLmJEanimhlANcrtLyiav76K6G8ylbAjIqP5SNhjyRNKrzW4UK%2FxCO%2B6QnzwgmMzgcgJfWz3vszltvunK%2F%2F6%2FVK7R76XoJacD0GkF8R5ar0p6jrA4hHDpdv3nNKVmLTIzbCNOBipWdWl3joVUN9cxMAAB0asP8rpEPASnQNQAtO1auaukhXXtUNc%2F7Y5aRj9ezRyuxFDFv7%2ForwhDMMe7tc0GOqUBcxPKLES1gxzw7vPhs83c4x%2Fs3uiXhNT0x9G7%2FgTv8b3%2Bax5FYSI8xUElWQvJQu56nOr6tJRomjljTxhz%2BZY0iboGTE8na1cIJecY7k0%2BXiGsvDIyfuG12MoIuAJ87STngWcKcYVN8aexIZW4rb%2FKTLMTaSXqfXGcxGldIr%2BVBR5OusfTHr%2BPtdMm2xDP5Qpb5djaW16AK4F%2BA0W8beVX5LeTzrHV&X-Amz-Signature=2c60036b96c0f52d714a9d453e2b1a1a4de7f526df5d21a6779dc9b0090224db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
