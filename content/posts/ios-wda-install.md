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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YA3YNX7C%2F20251013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251013T122135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIG%2Fb3%2FXHG26ZyAe4vkYZfszOxVmxV2y5jkM8IM9yIvsqAiEA94uGzq%2FDmKSK2Lc3Q0tvQjNA%2BZ2iE0O4irpxR8%2BFFj0q%2FwMIRBAAGgw2Mzc0MjMxODM4MDUiDLv6ee84xa5bwwoEUircA7xSuVW9aSkSjwkmGvJXxV2G0tOMWC1ZmXecdle5E%2B7kVeRfoxPxMWe%2FiJ1ThHkT8UzF4Y%2Fc9UPvqZuNXLVQd5QqKveMMiUvpQwm9%2Fohcs3Q7RnhzfvXd1J%2B6CMBoB7E1bT1zvw29pUn6zaRCl8F%2BisqzkU%2BDpWhbXIUr9A7rmuCPv6c59fToWi8HH49tIjL1BvV7IPSPupnc6w84GC8W24aA2ByrPLUZOvnEZ35tfnlz9BbN8QZcSBYPb9raUqiRXaVh0DwTFT7%2BR2A7xlQx9XB8O9KKfCEKZ9JEljJDDewqCyLrmDFXzPAtMTecbQwZukKMZ58p1OPI5Mjw2bm%2By79YAPz%2BkrUmfFqItKfJazovNUhS6D0wrPpswjQyJ5vap9t1urKeFc%2BBpN37aDeh%2B7nacn5k11w6dH6mj%2FR1msyBW2XC8cwo4ZLNAqP9iessVOXz9Ovub5a6zKlWrupzN5AE8AwxdALq36VThKJnnj3aEwzomyuVKWkQ8GG6hOgb5QZ5XhwZ%2FEDKVqsCFqTPnAQgdW3fCw%2FtSvXX0x3Rkj6dd2J0cySoD4EPqa5GorO4OK8ML3p3tMETcFWF1bJGm3zaSgOkBz8ihBYUeHar%2F3OamlZzdm0Dk9vlMpMMPa7s8cGOqUBNBAU5tlLIIUxhzxrHMBgU8Fh0eaoRbjb4JuVoQOn0fpRJ8dFciXCCrQknZUvOr5iajhArS2iqrdZ3%2BIal6pcXWMunfcPWX%2BCCTkIUy1y936PqbT90qZ673DaoIVNvQmA7%2FQXPzqZdZAVlnCJSHFNoXTrGp425N2nFObCysln4raImfuq8ePKZ9Jycbr%2BflDxZeebQE3NYl5ikKL3mLlDRX%2FbAOAt&X-Amz-Signature=b521af06e22ba3712b6d9da3472780c07fc7283af924fc8625d809abf61d7068&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YA3YNX7C%2F20251013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251013T122135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIG%2Fb3%2FXHG26ZyAe4vkYZfszOxVmxV2y5jkM8IM9yIvsqAiEA94uGzq%2FDmKSK2Lc3Q0tvQjNA%2BZ2iE0O4irpxR8%2BFFj0q%2FwMIRBAAGgw2Mzc0MjMxODM4MDUiDLv6ee84xa5bwwoEUircA7xSuVW9aSkSjwkmGvJXxV2G0tOMWC1ZmXecdle5E%2B7kVeRfoxPxMWe%2FiJ1ThHkT8UzF4Y%2Fc9UPvqZuNXLVQd5QqKveMMiUvpQwm9%2Fohcs3Q7RnhzfvXd1J%2B6CMBoB7E1bT1zvw29pUn6zaRCl8F%2BisqzkU%2BDpWhbXIUr9A7rmuCPv6c59fToWi8HH49tIjL1BvV7IPSPupnc6w84GC8W24aA2ByrPLUZOvnEZ35tfnlz9BbN8QZcSBYPb9raUqiRXaVh0DwTFT7%2BR2A7xlQx9XB8O9KKfCEKZ9JEljJDDewqCyLrmDFXzPAtMTecbQwZukKMZ58p1OPI5Mjw2bm%2By79YAPz%2BkrUmfFqItKfJazovNUhS6D0wrPpswjQyJ5vap9t1urKeFc%2BBpN37aDeh%2B7nacn5k11w6dH6mj%2FR1msyBW2XC8cwo4ZLNAqP9iessVOXz9Ovub5a6zKlWrupzN5AE8AwxdALq36VThKJnnj3aEwzomyuVKWkQ8GG6hOgb5QZ5XhwZ%2FEDKVqsCFqTPnAQgdW3fCw%2FtSvXX0x3Rkj6dd2J0cySoD4EPqa5GorO4OK8ML3p3tMETcFWF1bJGm3zaSgOkBz8ihBYUeHar%2F3OamlZzdm0Dk9vlMpMMPa7s8cGOqUBNBAU5tlLIIUxhzxrHMBgU8Fh0eaoRbjb4JuVoQOn0fpRJ8dFciXCCrQknZUvOr5iajhArS2iqrdZ3%2BIal6pcXWMunfcPWX%2BCCTkIUy1y936PqbT90qZ673DaoIVNvQmA7%2FQXPzqZdZAVlnCJSHFNoXTrGp425N2nFObCysln4raImfuq8ePKZ9Jycbr%2BflDxZeebQE3NYl5ikKL3mLlDRX%2FbAOAt&X-Amz-Signature=6388818ebca5b51755846748bc91071ad08bb98d4ec2b3d8888a56534388a48e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
