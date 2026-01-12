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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X2OFU3JF%2F20260112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260112T062221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJGMEQCICyo7cXAzuxg1CfUQlLYVmh6EouV%2FUu%2FWGZvxTQTxn9UAiAMPYZClDeUg5j9itlBvz21cFdVgIZ1XE5cvcqpNAPCJyqIBAjm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMryvI4Hk5Y4vVTh6CKtwDWiWBHOmepYfp5p1hk71eN0fenBmL9iklbUvyf%2BFiyw1aw85enssHXSmd2bLGi%2FzhwNOKZryp6QXRY3%2Fqpdvm5d9zp%2F5j3%2FApNQVcYestR5wrDyyzMfO%2FsAgzlK8qxXhQvX7vHzqCsqAjVWTh8WyVXBCh9YW2BQo7f0ycscnzAHvrkoCVRHv6JLKVweRtFs%2Be%2BfpOrVdLDELmtWY%2BedM6prZAKuUofjQSFIs1%2FmM0JAuyYcMdCsGX6mklpKztRE2dE0mAm0HFvD%2BIvzz0HxSDoQLxsLFNJek3P7L6MTjQYcQ4I%2Fkqz2r%2FcEge4pCugbGkYsTHSEvUJhit%2B80I%2BZQ5acxKEPn5m0bMvigQ9YG5nqL1Mjum703Tc5D8B6roPui3NMb9fMyTuLNin89DrcQRuvNtSLK3ecI%2F%2Bp3Fvnuq3odyd8wOZqPalUFZfxv258RYpYR7%2FLJMG8qTNqZd%2Bm4SZcw8NwekwG6gTaBOtakdLOmicsqn%2FBSavkwT%2FGAS944Wub5JCtIBWveLykCgK%2B8ypTruzu3eu0RLrtg8nSOOhRJVSJtx%2B7%2BxSknrTJD3qTCRpvXtE0ZbDnv7R78LR1OZSlYgYiK%2FkA9Ua4%2FF7rqVg57PqYsIxtdNjFG3oVUwnf2RywY6pgHmX%2FI7alqNrjm%2BkGxNrdDpweIBo4Hkszf86jD9Y%2FBNVc9%2BPC9Bqc8GVM1%2Bl%2BPmkkQ4JDl5GmhBojAeUAOGhVVlWUQZJxlrQQoQhtpW6b7dxA3U%2F7nr80gSEMGGnVDQoLFkD4DjEad536DxT%2F3294blLcm9rlkpEkJMwW69l5oWMpOK%2FKNENgm1AK7JDGYr%2BtUHHdnl2J9mL%2F%2Fj1gai6%2BZ2bil7hOrS&X-Amz-Signature=daba5d18297f38c30ec36b3071ad5eb181305bbcd45d614601c417c9192a9645&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X2OFU3JF%2F20260112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260112T062221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJGMEQCICyo7cXAzuxg1CfUQlLYVmh6EouV%2FUu%2FWGZvxTQTxn9UAiAMPYZClDeUg5j9itlBvz21cFdVgIZ1XE5cvcqpNAPCJyqIBAjm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMryvI4Hk5Y4vVTh6CKtwDWiWBHOmepYfp5p1hk71eN0fenBmL9iklbUvyf%2BFiyw1aw85enssHXSmd2bLGi%2FzhwNOKZryp6QXRY3%2Fqpdvm5d9zp%2F5j3%2FApNQVcYestR5wrDyyzMfO%2FsAgzlK8qxXhQvX7vHzqCsqAjVWTh8WyVXBCh9YW2BQo7f0ycscnzAHvrkoCVRHv6JLKVweRtFs%2Be%2BfpOrVdLDELmtWY%2BedM6prZAKuUofjQSFIs1%2FmM0JAuyYcMdCsGX6mklpKztRE2dE0mAm0HFvD%2BIvzz0HxSDoQLxsLFNJek3P7L6MTjQYcQ4I%2Fkqz2r%2FcEge4pCugbGkYsTHSEvUJhit%2B80I%2BZQ5acxKEPn5m0bMvigQ9YG5nqL1Mjum703Tc5D8B6roPui3NMb9fMyTuLNin89DrcQRuvNtSLK3ecI%2F%2Bp3Fvnuq3odyd8wOZqPalUFZfxv258RYpYR7%2FLJMG8qTNqZd%2Bm4SZcw8NwekwG6gTaBOtakdLOmicsqn%2FBSavkwT%2FGAS944Wub5JCtIBWveLykCgK%2B8ypTruzu3eu0RLrtg8nSOOhRJVSJtx%2B7%2BxSknrTJD3qTCRpvXtE0ZbDnv7R78LR1OZSlYgYiK%2FkA9Ua4%2FF7rqVg57PqYsIxtdNjFG3oVUwnf2RywY6pgHmX%2FI7alqNrjm%2BkGxNrdDpweIBo4Hkszf86jD9Y%2FBNVc9%2BPC9Bqc8GVM1%2Bl%2BPmkkQ4JDl5GmhBojAeUAOGhVVlWUQZJxlrQQoQhtpW6b7dxA3U%2F7nr80gSEMGGnVDQoLFkD4DjEad536DxT%2F3294blLcm9rlkpEkJMwW69l5oWMpOK%2FKNENgm1AK7JDGYr%2BtUHHdnl2J9mL%2F%2Fj1gai6%2BZ2bil7hOrS&X-Amz-Signature=d1c589a3d68dbd4f4593092e0feec58a46bb0cf92faacfaebc74d97d459eb057&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
