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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667B4OCCSS%2F20251019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251019T181408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJIMEYCIQDgb2EoarJrmCQsYR9d4xSyZRtxLrPpjycdOPvzNIyokgIhAMfn%2Fg7QWTXePjcIxH%2BMlon%2FDtQFf8848ZX4gTpPK7D4KogECNv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgykMuWQarBANg3t%2FXQq3ANOzgAkF%2By4VvGuqPq0ovP14dvGrlYwNmFJhIqcWpc1zyy4TU%2BXfj6mqMNBLVva9a8HvQprBssUuhBnLd%2B9HohM0oRx6pM%2Bf6qVKUNqOSMkaNxSF2tOznvcyaRTqwfzuJ0%2BNqLfCAx0iRkFUVCQu7hRsspaFWuYfL3fcMRjh7iR5JE8lnEQ0w85bAMSVEluh4CW9KN7o20FJVjtac9jg3XiFhfYY9kG0vAnZXz2lGKxw95FazsSUvNO9F47lKFyCTRNxFPgOi5Xk75%2BA8nzE4a%2BKrPsBfFjUqk2Jvq5ObpxRsmsqdxD2fphcLEKtFyQTUaE2whFeIjROwe0s5UGkNaHqUX%2BT86qBXbly0eYFHiheU4VWMLsQ1F09lkM%2Fia%2FrMJF6x2cZqbGtDbi8ruwE7v4pe3YJnV%2BdEVTHBPotWMN6iVXCkBxRbL1gXwCWrV9Hx%2BG%2F93fVqhrZ29EYYt6TC8Rf%2Bsqrxu7D53v4knwQXGI7KuZFkki9dPCMbdmfz7x6BeM86OsAC1KubDssl%2BFC4p1yw%2BHkBRhlgCjRORl1wGjh%2BiPCpTdN9FcELhffgV1MWV%2FYPACLGyfgSpSuhQkH7a5L3qwCJYkV2NoBE2rRh8T5mCbYQfCpLIw7W%2FbtjD5zNTHBjqkAWbyaGE3vjkgCpFtardJ%2BaRn8HpudKxzmU64FtUM6Suho%2B2HcnPGRdHZ4veOF0xrDnDC5xLeyMrPecFEhQpIx8QAnTvos5JQBplTtdjO%2BGi3lHEmIAcN9dlj1%2FEg0mZUevd%2F3Iyz2faVVWRzv%2BpNnEG7t2kOAti0ZR606PZj9IJXSrv%2FXhpnlxpQVo2bz%2F5LqDCAGFPveRH%2BWv8NDHinh8jDqoTY&X-Amz-Signature=d2550702235c131d958c98455044d727b5710dd388550a0775686cad2b197630&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667B4OCCSS%2F20251019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251019T181408Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJIMEYCIQDgb2EoarJrmCQsYR9d4xSyZRtxLrPpjycdOPvzNIyokgIhAMfn%2Fg7QWTXePjcIxH%2BMlon%2FDtQFf8848ZX4gTpPK7D4KogECNv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgykMuWQarBANg3t%2FXQq3ANOzgAkF%2By4VvGuqPq0ovP14dvGrlYwNmFJhIqcWpc1zyy4TU%2BXfj6mqMNBLVva9a8HvQprBssUuhBnLd%2B9HohM0oRx6pM%2Bf6qVKUNqOSMkaNxSF2tOznvcyaRTqwfzuJ0%2BNqLfCAx0iRkFUVCQu7hRsspaFWuYfL3fcMRjh7iR5JE8lnEQ0w85bAMSVEluh4CW9KN7o20FJVjtac9jg3XiFhfYY9kG0vAnZXz2lGKxw95FazsSUvNO9F47lKFyCTRNxFPgOi5Xk75%2BA8nzE4a%2BKrPsBfFjUqk2Jvq5ObpxRsmsqdxD2fphcLEKtFyQTUaE2whFeIjROwe0s5UGkNaHqUX%2BT86qBXbly0eYFHiheU4VWMLsQ1F09lkM%2Fia%2FrMJF6x2cZqbGtDbi8ruwE7v4pe3YJnV%2BdEVTHBPotWMN6iVXCkBxRbL1gXwCWrV9Hx%2BG%2F93fVqhrZ29EYYt6TC8Rf%2Bsqrxu7D53v4knwQXGI7KuZFkki9dPCMbdmfz7x6BeM86OsAC1KubDssl%2BFC4p1yw%2BHkBRhlgCjRORl1wGjh%2BiPCpTdN9FcELhffgV1MWV%2FYPACLGyfgSpSuhQkH7a5L3qwCJYkV2NoBE2rRh8T5mCbYQfCpLIw7W%2FbtjD5zNTHBjqkAWbyaGE3vjkgCpFtardJ%2BaRn8HpudKxzmU64FtUM6Suho%2B2HcnPGRdHZ4veOF0xrDnDC5xLeyMrPecFEhQpIx8QAnTvos5JQBplTtdjO%2BGi3lHEmIAcN9dlj1%2FEg0mZUevd%2F3Iyz2faVVWRzv%2BpNnEG7t2kOAti0ZR606PZj9IJXSrv%2FXhpnlxpQVo2bz%2F5LqDCAGFPveRH%2BWv8NDHinh8jDqoTY&X-Amz-Signature=73b81e25b017620e2e1f33162d8111d7c58e57d3176ea0fd35f51d8b061c3446&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
