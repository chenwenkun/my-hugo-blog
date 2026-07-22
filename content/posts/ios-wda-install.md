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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOSGX6MW%2F20260722%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260722T131949Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJIMEYCIQC0MfDGYl4vKUoGZzkKiZxdfDFEqOpW7uPUYuSBGP76SAIhAOKyt96B4mcIv64%2BkwPESMhHxQiwyUldTemaQhGh%2FWemKogECNX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw4OcifqRKIH5yMCvMq3AMXKwgNQKnkpt0jvBXDdlu3XiADnQV2dMMGQUaCAvcu2ZY5sIv9CBnuW7K135hNPGDlNjRKzb75xPXWjFswDSipByrqKmk%2FSUAFVvhdrNemdxT6IYC3v%2BLwefCuG%2FnAtTMUcX9rx2cIELWaAksafqdTyiTafxyv6ZDkgWM5afIbNjEFTOlCU8OKai43DEejTFFNsUFcO85rCZw2kO5dI2wtAjm%2FC0Tgf2ef3fkqbpjKC966JQBSaiuit36AY6Hut%2F2dRrvhEtKCS0RALGy07Boh3D%2F9uauICUceWKhy78EwwkW06cjwDJrdreXqOXJW8o%2BEXEaStVRmrypPgQWE8wNiuqtyfvvcOZvyMQqHfRgJ8KQhcmAd7JTmmf4PMlxtPKFpNqcC002cA%2Fh0n0PmLdXUFnF57MHv1j6f4j%2FxCocichpW8Ptk9AIfqaSWOCqvievUJd0ikgMNoo6WRN4QMr7ur3p6T61w%2FmM48DXeQy%2FhP7MHSn7pWr1t%2FMlWtVSUkdkgaCbUxnFR2ebU%2FXVUmK2rqOapB8c3MRb2KL4uajBZAbSKCRvZJG6YGd0tIsqotwm3ubvhwbYB28CxEZWFSVTykLGF%2BhSJ%2BjasKocHSyzUW7RBGqbvrdXsgIMvkTDa54LTBjqkARIyJELlit4vuWOGX0UvQNxgsYw3YILNaIN%2FELn7cUCm0uzQV5WEoWzKcXVjKpl1HswNY5DZo8xaPtufXJmajYx7id1VWozVTLtwjttylqTNvq29SWQa%2B9ZPPtF%2FOgCwln9Kp4HyPAForS0kLsXZMNjSawbdy3sf6gjfnF6RyEfNsAhQzy2spi2UJ3398%2BngLt8ZhaZ0OwnOyR5eiOo3BbUuoUU9&X-Amz-Signature=73fd68e3bf22b502350be6d209556585b74d372bcef89e6cc4f7503c5008dfbe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOSGX6MW%2F20260722%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260722T131949Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAwaCXVzLXdlc3QtMiJIMEYCIQC0MfDGYl4vKUoGZzkKiZxdfDFEqOpW7uPUYuSBGP76SAIhAOKyt96B4mcIv64%2BkwPESMhHxQiwyUldTemaQhGh%2FWemKogECNX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw4OcifqRKIH5yMCvMq3AMXKwgNQKnkpt0jvBXDdlu3XiADnQV2dMMGQUaCAvcu2ZY5sIv9CBnuW7K135hNPGDlNjRKzb75xPXWjFswDSipByrqKmk%2FSUAFVvhdrNemdxT6IYC3v%2BLwefCuG%2FnAtTMUcX9rx2cIELWaAksafqdTyiTafxyv6ZDkgWM5afIbNjEFTOlCU8OKai43DEejTFFNsUFcO85rCZw2kO5dI2wtAjm%2FC0Tgf2ef3fkqbpjKC966JQBSaiuit36AY6Hut%2F2dRrvhEtKCS0RALGy07Boh3D%2F9uauICUceWKhy78EwwkW06cjwDJrdreXqOXJW8o%2BEXEaStVRmrypPgQWE8wNiuqtyfvvcOZvyMQqHfRgJ8KQhcmAd7JTmmf4PMlxtPKFpNqcC002cA%2Fh0n0PmLdXUFnF57MHv1j6f4j%2FxCocichpW8Ptk9AIfqaSWOCqvievUJd0ikgMNoo6WRN4QMr7ur3p6T61w%2FmM48DXeQy%2FhP7MHSn7pWr1t%2FMlWtVSUkdkgaCbUxnFR2ebU%2FXVUmK2rqOapB8c3MRb2KL4uajBZAbSKCRvZJG6YGd0tIsqotwm3ubvhwbYB28CxEZWFSVTykLGF%2BhSJ%2BjasKocHSyzUW7RBGqbvrdXsgIMvkTDa54LTBjqkARIyJELlit4vuWOGX0UvQNxgsYw3YILNaIN%2FELn7cUCm0uzQV5WEoWzKcXVjKpl1HswNY5DZo8xaPtufXJmajYx7id1VWozVTLtwjttylqTNvq29SWQa%2B9ZPPtF%2FOgCwln9Kp4HyPAForS0kLsXZMNjSawbdy3sf6gjfnF6RyEfNsAhQzy2spi2UJ3398%2BngLt8ZhaZ0OwnOyR5eiOo3BbUuoUU9&X-Amz-Signature=5650c36d2f40bd7da17997869723cecc42c73c879c10f9ee8c73613a34599628&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
