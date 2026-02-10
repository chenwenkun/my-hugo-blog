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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XJC3P7WT%2F20260210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260210T065352Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDVOXzyS%2FzGmZ9ZzBqA9Jqvb%2FxZNsXUX9pgG8qLmYFOEwIhAPrkz5Euz1Ea0j9XRrSPNBRn664Y7bx64q8wV%2FBQu4EiKogECKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwRlDUBz2uO0YWDJIUq3ANBcKN%2FqxW2%2FS5bJcsXlIF1ezG59ca0vAYhnIHxiCXVBJ9rI2ly2MsU75%2FKnMLthUCVt2j0kDDAstNv%2Fld4zO2kpX7CTpP8wmMTGNN%2FL%2Fd2WAWfSZ92mI7%2FRnyWTBkK5xltOreks%2FTifZcrNEDTTsVZqxJC3nQP8krwfqGF1h7firl6YZ0Dd1D2EQc6RMGNaJaH3G7kXsG27H1chgUjxSaqPD0aPMUK67vV%2F6UhFGgybmswiT2SWCTgTNQ3LdYwXlbTB0jFVRW4j9kvfK0ryKpQfAMNhphiTQtGQe%2FuJeV29HOf%2FPW4XY09vjYgTHE84RYo5mFjmd4xN0ObOEm%2F%2BU%2BaoSZ0TQsDbWsasTGQ01a0YyG6vvRTkyfja4L01MjtzH1CMaoBn4MFW21%2BljpBqljiG1tZQ6sFiT72jGyBofliiYHCG3FcGsCAME0Ks9YvvR0lpFoeqvT7JeDKX0n6KgXnwtgsFbFhzQ8bzX%2FhG1xYVCdq1AJ%2B0obP4MPRrJvxmeyT45gmBshANTIAjr8iwX9qmAQYt%2FjPohcMs1yQab48xmJA0spkP53Km%2BTv6eO%2FXFnMUgCL3OmMpdqBFtJoLp0bRpZ6YYCPAxjwE6fIclbauHFrptqzGqyRzKjDzTCQp6vMBjqkAcMw7ogJxkbbFFRfPjm208IRo%2BJJo9aWyWV2SpAFFTGRbz4a%2FTiXXbVmvPWfOh%2FZ7qZr2npTHTIb22ag%2BoJUDMxuZZW%2FLuuHFfhQV1%2BlKtE9rN2aJTVi4Ajo1MtCV7HMjqym7joaIHENIIUXoc4z46Lzb5WvyQH1tkV94mqsKz8Li4f%2Fr0hn1MKfzNe%2FtjzBYHBdVNdg9CtpzpS4k1fUDSlkwvuG&X-Amz-Signature=c6dd52108b33438871d2487d9e5d3a55afc19d46d291553a8050abdb37d3fe92&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XJC3P7WT%2F20260210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260210T065352Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDVOXzyS%2FzGmZ9ZzBqA9Jqvb%2FxZNsXUX9pgG8qLmYFOEwIhAPrkz5Euz1Ea0j9XRrSPNBRn664Y7bx64q8wV%2FBQu4EiKogECKD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwRlDUBz2uO0YWDJIUq3ANBcKN%2FqxW2%2FS5bJcsXlIF1ezG59ca0vAYhnIHxiCXVBJ9rI2ly2MsU75%2FKnMLthUCVt2j0kDDAstNv%2Fld4zO2kpX7CTpP8wmMTGNN%2FL%2Fd2WAWfSZ92mI7%2FRnyWTBkK5xltOreks%2FTifZcrNEDTTsVZqxJC3nQP8krwfqGF1h7firl6YZ0Dd1D2EQc6RMGNaJaH3G7kXsG27H1chgUjxSaqPD0aPMUK67vV%2F6UhFGgybmswiT2SWCTgTNQ3LdYwXlbTB0jFVRW4j9kvfK0ryKpQfAMNhphiTQtGQe%2FuJeV29HOf%2FPW4XY09vjYgTHE84RYo5mFjmd4xN0ObOEm%2F%2BU%2BaoSZ0TQsDbWsasTGQ01a0YyG6vvRTkyfja4L01MjtzH1CMaoBn4MFW21%2BljpBqljiG1tZQ6sFiT72jGyBofliiYHCG3FcGsCAME0Ks9YvvR0lpFoeqvT7JeDKX0n6KgXnwtgsFbFhzQ8bzX%2FhG1xYVCdq1AJ%2B0obP4MPRrJvxmeyT45gmBshANTIAjr8iwX9qmAQYt%2FjPohcMs1yQab48xmJA0spkP53Km%2BTv6eO%2FXFnMUgCL3OmMpdqBFtJoLp0bRpZ6YYCPAxjwE6fIclbauHFrptqzGqyRzKjDzTCQp6vMBjqkAcMw7ogJxkbbFFRfPjm208IRo%2BJJo9aWyWV2SpAFFTGRbz4a%2FTiXXbVmvPWfOh%2FZ7qZr2npTHTIb22ag%2BoJUDMxuZZW%2FLuuHFfhQV1%2BlKtE9rN2aJTVi4Ajo1MtCV7HMjqym7joaIHENIIUXoc4z46Lzb5WvyQH1tkV94mqsKz8Li4f%2Fr0hn1MKfzNe%2FtjzBYHBdVNdg9CtpzpS4k1fUDSlkwvuG&X-Amz-Signature=c2589eb047230037235e87612ba366b0fada7038b2e68d795818ba21acf5a511&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
