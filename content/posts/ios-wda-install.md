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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YCYJEPYF%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T083913Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCC5XY95M%2BOXSnCTZBMXoLTu5LlgIxfyl%2FrdCFStfRA6gIhAKnRCMBGCBzP%2BER5OVsU%2FHvANTzB5u07kVJYBtYQXh%2BeKogECI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxIEGJl91ERC%2B6cGHcq3ANSeIKlzJYxhglZnZVFFIgLoY50I0wapTh%2B7WOZCRsAUCAhUVn%2FHysiOvr3btFW67vtbBbXA8k96t3iG4Rvec%2BoUbI%2FXyAdpUjMTbn%2BB7NT6XDRHUuUnN7FxbwKFjpU%2FauiwYnLCKGfkJlVZnqn9Ve%2FSMxXpacjZIMLaoVkkpshVaTQwVYu7gmpjUn5%2BW2%2BWy%2BuvIV7RQAbsV%2BjVgtnr4TN0%2FVeHS8T4ruBEdNGk4qoScvWV9tWf7HbL23S%2FyHYBDBDfCIgL5ZTHZMWnXnXScSs%2BKAApsiOioeuID7O5rlMimGwUZzjNr7vP%2FtqvGIAizSEsa0y1xkHhV17%2FyWFhurgr7xFdI7SMnDbu4Lun3w2gp8OqZGbjz%2ByKgce6QrBu7mSo25X9rBoX%2BcScwzcBlU84%2FnJTwx%2FvOT%2B2UYPU%2FswCn6Sb5ZnsKz5fAzeqeUXP5wtqCBE9dMWIndiUXBlYoA2GyTu8Iy5r3C0KcPwRE8REDxk5A2U2Lb0OxY8AnQ%2F3JerbudBSOPYjy6BDoU2Md%2BgmvCyZCipLLZ5tra7It%2FlQPK47vYpWccMzADINkq3vhNhzHzWxKLgluhJG5865h533bWOpczmpaRM8s5KECPvT8DStRbk8dCJNODsGTDL7oLSBjqkAfc0cIjI3b1x4BOIaVE6jfZBypAndT5EjUmo7d60PQXXcAbbgXsc4sS5%2FSK2hfAC1D4uTDYjCHF9VHGAJhg323acB3K2bL6fCAxxiJ107K9xHOYhS%2FgM5fpM3eqtkwcpMB5EC526AGeyzQGan%2BQ%2B2lDRWwzdH49BJY%2F1XJYLQIBT766CQt4XEisNalitEfvY6eGDiWxMmECBtExYwLk9WZgPLq22&X-Amz-Signature=aed5f06fb9b638aa5f97ce64cb2bb62ce0c16ac6fa449aeb6cf61793d3cb3ea9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YCYJEPYF%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T083912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCC5XY95M%2BOXSnCTZBMXoLTu5LlgIxfyl%2FrdCFStfRA6gIhAKnRCMBGCBzP%2BER5OVsU%2FHvANTzB5u07kVJYBtYQXh%2BeKogECI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxIEGJl91ERC%2B6cGHcq3ANSeIKlzJYxhglZnZVFFIgLoY50I0wapTh%2B7WOZCRsAUCAhUVn%2FHysiOvr3btFW67vtbBbXA8k96t3iG4Rvec%2BoUbI%2FXyAdpUjMTbn%2BB7NT6XDRHUuUnN7FxbwKFjpU%2FauiwYnLCKGfkJlVZnqn9Ve%2FSMxXpacjZIMLaoVkkpshVaTQwVYu7gmpjUn5%2BW2%2BWy%2BuvIV7RQAbsV%2BjVgtnr4TN0%2FVeHS8T4ruBEdNGk4qoScvWV9tWf7HbL23S%2FyHYBDBDfCIgL5ZTHZMWnXnXScSs%2BKAApsiOioeuID7O5rlMimGwUZzjNr7vP%2FtqvGIAizSEsa0y1xkHhV17%2FyWFhurgr7xFdI7SMnDbu4Lun3w2gp8OqZGbjz%2ByKgce6QrBu7mSo25X9rBoX%2BcScwzcBlU84%2FnJTwx%2FvOT%2B2UYPU%2FswCn6Sb5ZnsKz5fAzeqeUXP5wtqCBE9dMWIndiUXBlYoA2GyTu8Iy5r3C0KcPwRE8REDxk5A2U2Lb0OxY8AnQ%2F3JerbudBSOPYjy6BDoU2Md%2BgmvCyZCipLLZ5tra7It%2FlQPK47vYpWccMzADINkq3vhNhzHzWxKLgluhJG5865h533bWOpczmpaRM8s5KECPvT8DStRbk8dCJNODsGTDL7oLSBjqkAfc0cIjI3b1x4BOIaVE6jfZBypAndT5EjUmo7d60PQXXcAbbgXsc4sS5%2FSK2hfAC1D4uTDYjCHF9VHGAJhg323acB3K2bL6fCAxxiJ107K9xHOYhS%2FgM5fpM3eqtkwcpMB5EC526AGeyzQGan%2BQ%2B2lDRWwzdH49BJY%2F1XJYLQIBT766CQt4XEisNalitEfvY6eGDiWxMmECBtExYwLk9WZgPLq22&X-Amz-Signature=cef2837f0684dee3e5fdfd600954437a2a26bca9fa5accb11a586288c0b1aa31&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
