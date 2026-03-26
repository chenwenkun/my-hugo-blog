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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HXBLKDB%2F20260326%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260326T185132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLXdlc3QtMiJGMEQCIHnjGFO3dSwa%2BYOiStnilWodvqhVbBPNxGD7zT5QZ8caAiB5G1GXqUfT4FRHQ0xoBF%2FWD5BInlCKJewgwWOAtv4kgyqIBAjK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMMiUEUejO0sGQL7vFKtwD%2B3QIjz28WphhxLxHpY%2FKtLsuOeU50Zn2nZwRTvC%2F36oNDmQPNKOTSm%2FGkDa3h3O4fYnhw3pjzGfvDReAFJ7osvZmaF3vJn3gu2jt2l%2BxRhEYNQMriKIb14j5ZfDdDVIP%2BfESRX2o1Eoz1jETkQY7Ib9BEJ8oxFf%2BMLTXpJbqwazm3z75IOT1OERV385cYO%2FTmKB%2F84gIg5YcQbOmB1tQGRsQVUnp5VPYbFMe3MECnX6LjlY4TUAbYqz8j3ZNMpLSCwuX7Hwyehvw1m0Jgr6wmtJz0RG3UZZvGqkWQZDunAczonuxTdFopOLRQ2wNX5Daq9VIHeevvMfooqSGinxTOzezm6aTxtDYaRPGasj%2F%2FrtcaFXDh7R7jePeC%2BLc6JBAPh7KvmlgUaxKrnSI3ik1DfWrBswWmFnJntlh0yBvZRBaYyq442O9o9PXPAmAOZSO73SC4jvEWQDxAaxC7bGwtsjQ88QeMRBp4soOloYkkPCEiuUWSpvKSJQH9cum723xW0cXQGS8N3qihSTCrjfYidFOKS%2FdTSx1z%2F%2By9fuaqa3Zt1sCbsF1ZO1JjODFMnZTPc7%2FX9qYe6GolVgtw4dBDvdClQ5eBqmuJ%2B6mKu2WcyCZryflXgNXG5K9sZ0w5syVzgY6pgETEtzKmgqovBngHu0SA8u9YRRPjFjyqi6kU3YGi271Coeg%2BxvM7a%2FxRXtUoRP1ynXmrqfnUkulzrZwcJD2UTjgHNPHv2B6pFUUrRHZXqk81HaFrTp1QNGD3kCRcev1xsuh7mw74tsfqMlZlfKZLyzAWs6igJv7rloPKgf9vyekt4IMcURcrU8GX8C8pnzOcZdyGoEczaKEJ3%2BOGkTQX%2FYNtcSeNQTS&X-Amz-Signature=f7124715ad561a1bebf0fafb98665fd380f5e0861fb1e8a508694f76e6d7555d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HXBLKDB%2F20260326%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260326T185132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLXdlc3QtMiJGMEQCIHnjGFO3dSwa%2BYOiStnilWodvqhVbBPNxGD7zT5QZ8caAiB5G1GXqUfT4FRHQ0xoBF%2FWD5BInlCKJewgwWOAtv4kgyqIBAjK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMMiUEUejO0sGQL7vFKtwD%2B3QIjz28WphhxLxHpY%2FKtLsuOeU50Zn2nZwRTvC%2F36oNDmQPNKOTSm%2FGkDa3h3O4fYnhw3pjzGfvDReAFJ7osvZmaF3vJn3gu2jt2l%2BxRhEYNQMriKIb14j5ZfDdDVIP%2BfESRX2o1Eoz1jETkQY7Ib9BEJ8oxFf%2BMLTXpJbqwazm3z75IOT1OERV385cYO%2FTmKB%2F84gIg5YcQbOmB1tQGRsQVUnp5VPYbFMe3MECnX6LjlY4TUAbYqz8j3ZNMpLSCwuX7Hwyehvw1m0Jgr6wmtJz0RG3UZZvGqkWQZDunAczonuxTdFopOLRQ2wNX5Daq9VIHeevvMfooqSGinxTOzezm6aTxtDYaRPGasj%2F%2FrtcaFXDh7R7jePeC%2BLc6JBAPh7KvmlgUaxKrnSI3ik1DfWrBswWmFnJntlh0yBvZRBaYyq442O9o9PXPAmAOZSO73SC4jvEWQDxAaxC7bGwtsjQ88QeMRBp4soOloYkkPCEiuUWSpvKSJQH9cum723xW0cXQGS8N3qihSTCrjfYidFOKS%2FdTSx1z%2F%2By9fuaqa3Zt1sCbsF1ZO1JjODFMnZTPc7%2FX9qYe6GolVgtw4dBDvdClQ5eBqmuJ%2B6mKu2WcyCZryflXgNXG5K9sZ0w5syVzgY6pgETEtzKmgqovBngHu0SA8u9YRRPjFjyqi6kU3YGi271Coeg%2BxvM7a%2FxRXtUoRP1ynXmrqfnUkulzrZwcJD2UTjgHNPHv2B6pFUUrRHZXqk81HaFrTp1QNGD3kCRcev1xsuh7mw74tsfqMlZlfKZLyzAWs6igJv7rloPKgf9vyekt4IMcURcrU8GX8C8pnzOcZdyGoEczaKEJ3%2BOGkTQX%2FYNtcSeNQTS&X-Amz-Signature=b5401ea2ddec10dbb7e0d1cbf65e05f04333eabf3eccdd4ae835ed174c6a6374&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
