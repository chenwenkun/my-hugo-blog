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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HOBIXB6%2F20260727%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260727T092813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDB2iEzVYhWEcQmq3C%2B52%2FKrVC3rgSlOrDxy%2BXV4xFy2AiB5SgrlHys06yB%2BIbbbfYja7QnPeFDMUdB0q003umaUZSr%2FAwhKEAAaDDYzNzQyMzE4MzgwNSIMP6z2Q5QmqJ1KUXh%2FKtwDu460m1i00qIenNB8%2FA5cDR5yd18Bt0URVUt28eAdYHCwxaInPkV4txHOR3ZM0BZGVMy2zErMbqYWBsV0IhxagQiqr0aGGkIDcNYkjJdj1MGDDeYaYulqbdAcIHGlXqeWSBgjELaoDu223kiZ1HX77%2Ffo2iPNB7W06HmELp9xgqCcZnZvfqe%2FPkzRcUcKGePMOmMwIdNnVghk56BlR8CyBmu84%2BwBDyBxiwBo13H8YXK5LuctUWsLHUVsQqQZKpjdQYZLYnTk%2BBllcckI7Je0l%2BayKkWfuGM9NyT3aKunk5eQO5jr3%2BEaZjR%2B%2BmsZRcivnyVzbRBQyRjqmdU5Gh%2BXStMBSWW1VTu3%2BZ44NhYTvKe3Xq2W3ZT7uEYDCUo9E7fSYzxd%2FYvyLglmcntXpzhgRrhDxFTgCTu0sRLggZLoEtUE1UdNPpDg2xED5fhmsCa2lKquFk8ah%2BP6quhdXNKiNMjWihDUmGKw2HSj1HoBeP2cR8pk%2F3VSado2kWdfhhvlrVoxvhqK3BkE0y7m%2FaRnCX%2BSAluNSKl8Emyfr6xzk7HwauB6VOialUpFDUZo8T5Mr%2BArjfgyS1Cu2rMPEuPwqeJSceWPbJdjlKOrFD734nnbb3XXwMEbRYCk4O0wwbWc0wY6pgEs%2FgpZ6Vr24b72awffpmSSgg9nClcL3Ta6zvQ4G264t1Evb%2BZlNb%2BDVeBh8vDzZT%2Bifl8F2WKN2OsTRPwmSOh5ZjXGxQEMHAXFOZYABt7dIubLqhGd6otcY3o74OM47TfMWZuqRFkRKe25%2FOfFMTxkaDuf02NZNkVLXz2ax%2BN7rV7EPNGrZ8VIox6r2mDdsjpzE9QbdVxKWkXWOhCYe2fh3Dd7NrNF&X-Amz-Signature=0888c29a250c60957f579fa078a8c512013c8f5e114d2d6d0d1f9edc56995672&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HOBIXB6%2F20260727%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260727T092813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDB2iEzVYhWEcQmq3C%2B52%2FKrVC3rgSlOrDxy%2BXV4xFy2AiB5SgrlHys06yB%2BIbbbfYja7QnPeFDMUdB0q003umaUZSr%2FAwhKEAAaDDYzNzQyMzE4MzgwNSIMP6z2Q5QmqJ1KUXh%2FKtwDu460m1i00qIenNB8%2FA5cDR5yd18Bt0URVUt28eAdYHCwxaInPkV4txHOR3ZM0BZGVMy2zErMbqYWBsV0IhxagQiqr0aGGkIDcNYkjJdj1MGDDeYaYulqbdAcIHGlXqeWSBgjELaoDu223kiZ1HX77%2Ffo2iPNB7W06HmELp9xgqCcZnZvfqe%2FPkzRcUcKGePMOmMwIdNnVghk56BlR8CyBmu84%2BwBDyBxiwBo13H8YXK5LuctUWsLHUVsQqQZKpjdQYZLYnTk%2BBllcckI7Je0l%2BayKkWfuGM9NyT3aKunk5eQO5jr3%2BEaZjR%2B%2BmsZRcivnyVzbRBQyRjqmdU5Gh%2BXStMBSWW1VTu3%2BZ44NhYTvKe3Xq2W3ZT7uEYDCUo9E7fSYzxd%2FYvyLglmcntXpzhgRrhDxFTgCTu0sRLggZLoEtUE1UdNPpDg2xED5fhmsCa2lKquFk8ah%2BP6quhdXNKiNMjWihDUmGKw2HSj1HoBeP2cR8pk%2F3VSado2kWdfhhvlrVoxvhqK3BkE0y7m%2FaRnCX%2BSAluNSKl8Emyfr6xzk7HwauB6VOialUpFDUZo8T5Mr%2BArjfgyS1Cu2rMPEuPwqeJSceWPbJdjlKOrFD734nnbb3XXwMEbRYCk4O0wwbWc0wY6pgEs%2FgpZ6Vr24b72awffpmSSgg9nClcL3Ta6zvQ4G264t1Evb%2BZlNb%2BDVeBh8vDzZT%2Bifl8F2WKN2OsTRPwmSOh5ZjXGxQEMHAXFOZYABt7dIubLqhGd6otcY3o74OM47TfMWZuqRFkRKe25%2FOfFMTxkaDuf02NZNkVLXz2ax%2BN7rV7EPNGrZ8VIox6r2mDdsjpzE9QbdVxKWkXWOhCYe2fh3Dd7NrNF&X-Amz-Signature=f2f006c2f7f984135d3dde53b68c0d9b83539dd1b4ba6fc430539c8cd47e5f81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
