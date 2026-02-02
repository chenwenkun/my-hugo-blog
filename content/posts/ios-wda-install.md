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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ROV3R4N7%2F20260202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260202T011055Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJGMEQCICJnDD%2BHGVpc79kKNEh3c6qI7szH8FfxO%2BfK%2FUP%2FOQXJAiB2T9JRJK5bGLPYUNVXrdTGLerKocsE7JQ%2Bwrcdv5TMdCqIBAja%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVrXjKYfMqUVhu%2FtKKtwDOZf0VTtJPrRD6AdLZiVlu2bEfyxlA158OTr8alRwH3AMcRYg%2BY2nBjimcuGPnKYwbxYQAgTxzDMrv8TICiLq3AluXslfE6KzZCHHJCi9j4kGztnuDBnXhU0XslMiChh5LOSGuW5b%2BExRzpBz5hB5zU7tZj3K0iqTQtyG%2Fgmk8hFiu%2B6Wzbg6%2FhITDHFZ0oTEjEnhfPyQ39oXWe63dHCFMqgAGXOQZsUYDDJz%2FLE9ooyFIM1%2Bm9vr%2BcFW1XVy8RN%2Fsbnx%2BPsaiW%2FmyP4qkiwBtbt0QOYCHLcDkxrjyV%2B65MKnxLeBCPPfAO3Y1pfh5k0%2BF3rAnzot6qROp3zxXzQMxqT8dIZ6uuX460uhXRMrbaT18jrnM7f6cAlyL6RGifPr%2BjICxTcba%2FkMzlSMPKQV7Fantvv2zMS5Zy7p91TCXk1Z6iyAkYizlbSpZvxxPyNydBrtVDxmdEeMLRqyBAi3Y4qZIRqRCHPqs5FUJK0wq%2B7mus2NxC6r4snblb%2BueMDnRjkrwqmBDdncaC2wI7MKDpFgU8nig1QF0Mlv%2Ba%2BYoiq9TQEWjqsgIcVfFWf7XJxXAR3ue6Rc9e52Jh2HdwnK4HsutHYDtvZ2jhuGxN9d0Diiv%2F%2Fq%2BiiGG5YBWH0woOr%2FywY6pgEAVecNQMk0DppBeolNwZuaE2hlpF13CceSb39HIvcV2YiPaDcEW6DIzfpSAUK4U3%2BD%2F5KyVmrM1W5MQ9gaOl3axFph77W08df34e3xtSNux9X7VBtJ%2FKuhkiOS8R%2BNbkMokD1uD592OyoviviaVUEnQYeAapJKbS%2BQQKDBNLDjmbCqUGxHEIn9rlUaKp3e9POnwTnMg27wL6FMrRBjfvDsrbrDtCx3&X-Amz-Signature=1334466fc087baa41a28a456e077af00ac75728468a6ba284b1042367e1c1853&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ROV3R4N7%2F20260202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260202T011055Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJGMEQCICJnDD%2BHGVpc79kKNEh3c6qI7szH8FfxO%2BfK%2FUP%2FOQXJAiB2T9JRJK5bGLPYUNVXrdTGLerKocsE7JQ%2Bwrcdv5TMdCqIBAja%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVrXjKYfMqUVhu%2FtKKtwDOZf0VTtJPrRD6AdLZiVlu2bEfyxlA158OTr8alRwH3AMcRYg%2BY2nBjimcuGPnKYwbxYQAgTxzDMrv8TICiLq3AluXslfE6KzZCHHJCi9j4kGztnuDBnXhU0XslMiChh5LOSGuW5b%2BExRzpBz5hB5zU7tZj3K0iqTQtyG%2Fgmk8hFiu%2B6Wzbg6%2FhITDHFZ0oTEjEnhfPyQ39oXWe63dHCFMqgAGXOQZsUYDDJz%2FLE9ooyFIM1%2Bm9vr%2BcFW1XVy8RN%2Fsbnx%2BPsaiW%2FmyP4qkiwBtbt0QOYCHLcDkxrjyV%2B65MKnxLeBCPPfAO3Y1pfh5k0%2BF3rAnzot6qROp3zxXzQMxqT8dIZ6uuX460uhXRMrbaT18jrnM7f6cAlyL6RGifPr%2BjICxTcba%2FkMzlSMPKQV7Fantvv2zMS5Zy7p91TCXk1Z6iyAkYizlbSpZvxxPyNydBrtVDxmdEeMLRqyBAi3Y4qZIRqRCHPqs5FUJK0wq%2B7mus2NxC6r4snblb%2BueMDnRjkrwqmBDdncaC2wI7MKDpFgU8nig1QF0Mlv%2Ba%2BYoiq9TQEWjqsgIcVfFWf7XJxXAR3ue6Rc9e52Jh2HdwnK4HsutHYDtvZ2jhuGxN9d0Diiv%2F%2Fq%2BiiGG5YBWH0woOr%2FywY6pgEAVecNQMk0DppBeolNwZuaE2hlpF13CceSb39HIvcV2YiPaDcEW6DIzfpSAUK4U3%2BD%2F5KyVmrM1W5MQ9gaOl3axFph77W08df34e3xtSNux9X7VBtJ%2FKuhkiOS8R%2BNbkMokD1uD592OyoviviaVUEnQYeAapJKbS%2BQQKDBNLDjmbCqUGxHEIn9rlUaKp3e9POnwTnMg27wL6FMrRBjfvDsrbrDtCx3&X-Amz-Signature=f6a37e447efa0c922ff0c68ad145b3f8be9ca9ed84d365fcbb5071602709181a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
