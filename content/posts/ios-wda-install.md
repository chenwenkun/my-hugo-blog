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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XJRKVNBV%2F20260506%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260506T015109Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEMgJ0jRrH9o%2BP1jpwgeHaE8nX2yZyvCKyXgCbiqTLaZAiAbWUyfYYdoYO52fcrA79k4%2FM8y9jw2lS6FGcUK%2BWO9ASqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMV9C2dfVkDpc2CfSkKtwDLn5rkmpbNh7H3CnhuZ%2BlqBMW5VRJ%2FTuuZneGNAVXtZFuU9oHqm426bKWmOXxetFuhDziYrazgCK%2BQlJWLJTzEBeIJNQBhAtG%2Fod82ubPNHV6X9ng1Xrb46LfGdVKekmVvsgcA0%2BKkF5TsqLN4HcgdbGycreGub9TyTqwBstzNX4IgFVQIIsAR3T5tgFIs%2BAtp5z5SURUSo2Q6XjJt4ezvh63VPoWYf9oDzEtZfYcjOGCgnrEoKMHwUBYZvhYPDHQ6rY1xcxJYwinXh%2F9bMBC6FrUbABPDhZpqZsgIkdWsNCFF%2BqJFz9K9o%2BG8u6ahftVnNVmkfJhX8hDZd9kCmo%2FsJrj1Hq8%2BVd4K11GFiMRVDMrgFIO4xrDeIsUnAVBB8eLKo5MZPWWrenoqoeENO2RPLtbhxhtFgQbgFu%2B%2BOJj02hATWRcxeOugHGMvM5Ug5nG5jT6ME0DZqyRqrLWndXy1%2Bte7cxosK2N1DCt7WrdiI2LBMkzz49gdPMt23EPDWRhAsZuOmZk5JIIoWDosHx4QmM4VVURKWxHAbVne2gKjqrME4KmQgalhfFXWqmdF7JIuQVIC0BV0JQx7oX8b%2BDEtaK3QVE7s10EDViBmGTxkMyAjP60e%2FXLsIDkRUcw36%2FqzwY6pgFBdsryR1gEH3HSa%2BbOsiGJrLUeEQiNpAG25CuIGzv5jHXWqznP87xAr26TGnjGjEp21ieNda6jbStPCrrFkdxOPcx4GrQTAGlKZS256KroVvCuzUsC79aKLZWFxuZjq6BClfHz%2FjZ4nr8WjQoV8dZUSasPn%2FvLvA3gcPXsz3FW2GmhqKwrlnE1L8Fp5edofS1C%2FaBvciLy3Hfo8raor7SvlLOxydvM&X-Amz-Signature=a9989adf45dae2d04cdf1e58ee047773827ac0744329c87af553bf4bac330a04&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XJRKVNBV%2F20260506%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260506T015109Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEMgJ0jRrH9o%2BP1jpwgeHaE8nX2yZyvCKyXgCbiqTLaZAiAbWUyfYYdoYO52fcrA79k4%2FM8y9jw2lS6FGcUK%2BWO9ASqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMV9C2dfVkDpc2CfSkKtwDLn5rkmpbNh7H3CnhuZ%2BlqBMW5VRJ%2FTuuZneGNAVXtZFuU9oHqm426bKWmOXxetFuhDziYrazgCK%2BQlJWLJTzEBeIJNQBhAtG%2Fod82ubPNHV6X9ng1Xrb46LfGdVKekmVvsgcA0%2BKkF5TsqLN4HcgdbGycreGub9TyTqwBstzNX4IgFVQIIsAR3T5tgFIs%2BAtp5z5SURUSo2Q6XjJt4ezvh63VPoWYf9oDzEtZfYcjOGCgnrEoKMHwUBYZvhYPDHQ6rY1xcxJYwinXh%2F9bMBC6FrUbABPDhZpqZsgIkdWsNCFF%2BqJFz9K9o%2BG8u6ahftVnNVmkfJhX8hDZd9kCmo%2FsJrj1Hq8%2BVd4K11GFiMRVDMrgFIO4xrDeIsUnAVBB8eLKo5MZPWWrenoqoeENO2RPLtbhxhtFgQbgFu%2B%2BOJj02hATWRcxeOugHGMvM5Ug5nG5jT6ME0DZqyRqrLWndXy1%2Bte7cxosK2N1DCt7WrdiI2LBMkzz49gdPMt23EPDWRhAsZuOmZk5JIIoWDosHx4QmM4VVURKWxHAbVne2gKjqrME4KmQgalhfFXWqmdF7JIuQVIC0BV0JQx7oX8b%2BDEtaK3QVE7s10EDViBmGTxkMyAjP60e%2FXLsIDkRUcw36%2FqzwY6pgFBdsryR1gEH3HSa%2BbOsiGJrLUeEQiNpAG25CuIGzv5jHXWqznP87xAr26TGnjGjEp21ieNda6jbStPCrrFkdxOPcx4GrQTAGlKZS256KroVvCuzUsC79aKLZWFxuZjq6BClfHz%2FjZ4nr8WjQoV8dZUSasPn%2FvLvA3gcPXsz3FW2GmhqKwrlnE1L8Fp5edofS1C%2FaBvciLy3Hfo8raor7SvlLOxydvM&X-Amz-Signature=8807711105ebde90a3c16bfb351bca7d853afada14d0fc3088163d584276e8a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
