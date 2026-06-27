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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XNGYYAG3%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T082457Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCyzAYCEVc3ehHIjdS7lau6SjiXCSNxFegRg3%2F1ayF5UAIgBPYwiy46E3hNW29d%2FQN11tDdFLLbaBSUVDqnioXmHAgq%2FwMIeRAAGgw2Mzc0MjMxODM4MDUiDOPvTjVapNLynu%2BBcircA2SS1XTKpzcdX7fRxg3fTOcM3hLb1JY3fPebfY%2BpjLN%2BXt7LAlxUCiUXXGXKDRd4DLrpTY%2FU9Zpg0NYXVzPkM9PbagxTeb3b4HGJroY7OFf6Xi5ITdrjH6MKX7bNj2pihItXkr%2BYQPCyW8rfxTW3CYvsb0%2BV26Orq7I4433hhqW7MnLZvU7p3nKu%2BejlaD0X7K8BP9HEBqYP16of6EPhBV7cl1yEqh6C%2BYOJZTMUuqVwd1vvk%2FeZf%2F5bjlFma%2BA5dsY%2Bh05WOty9fy7vwhiApxjM%2B%2FBQ9lHXDSarXOMdqOkfqzS2%2FPWKk63ITH7oNCazuYVhvz5dTK9FSK8V5TFmAQ3OiD%2Bc9eKd%2Boi5DjyKRLeYEZYxl%2B6Vxf1eQzqm2h6zbjc%2BtqpWwzw8aR9BTZiI9Yc15OyhT3o%2BONEYUsxy0LzJXXyr9V0isebPVevN8jaBh5yciEhZ7Dzi23lsVycsGah23Gz73301FtquLmzc%2BItsduyXQXv53mqNyceLhEB5%2BT4KhplENhLFPxY5Xxi0qAhqJ3MCvIT1%2FjJqgdnlL0Oia4jKtu2TVO50uZnutStjSkgCYT%2Fjj1wzFrgoNR2NC%2B21UKg5116FbBTzF9yzzzsAHPDLyQx%2FWVfFLWifMPP7%2FdEGOqUBvtvc8IKgRcyIqw3LeoBDhVuG%2FR33erjGM45ObQ73HMvoJrlrEwTKF2IFU6x5bSdmdCwWSXErBYnsNLG326VNTgnEEkLoL16S3FIPtOjMNH3WW%2BItRZ%2B1srt%2F%2BQA38ST20l32MkduqB8HvAhmOqMCWOtgoOhKyZkQuN9wvIzZUfX7bkZFwwnqwicDkwN71yhtkC4QjvcA9GeZcUBJtfeSflnHZnmT&X-Amz-Signature=00ea3b8fa68b000d2abf6b23ad322d79b8b286457a4fad6b6ad88622f962cd9f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XNGYYAG3%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T082457Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCyzAYCEVc3ehHIjdS7lau6SjiXCSNxFegRg3%2F1ayF5UAIgBPYwiy46E3hNW29d%2FQN11tDdFLLbaBSUVDqnioXmHAgq%2FwMIeRAAGgw2Mzc0MjMxODM4MDUiDOPvTjVapNLynu%2BBcircA2SS1XTKpzcdX7fRxg3fTOcM3hLb1JY3fPebfY%2BpjLN%2BXt7LAlxUCiUXXGXKDRd4DLrpTY%2FU9Zpg0NYXVzPkM9PbagxTeb3b4HGJroY7OFf6Xi5ITdrjH6MKX7bNj2pihItXkr%2BYQPCyW8rfxTW3CYvsb0%2BV26Orq7I4433hhqW7MnLZvU7p3nKu%2BejlaD0X7K8BP9HEBqYP16of6EPhBV7cl1yEqh6C%2BYOJZTMUuqVwd1vvk%2FeZf%2F5bjlFma%2BA5dsY%2Bh05WOty9fy7vwhiApxjM%2B%2FBQ9lHXDSarXOMdqOkfqzS2%2FPWKk63ITH7oNCazuYVhvz5dTK9FSK8V5TFmAQ3OiD%2Bc9eKd%2Boi5DjyKRLeYEZYxl%2B6Vxf1eQzqm2h6zbjc%2BtqpWwzw8aR9BTZiI9Yc15OyhT3o%2BONEYUsxy0LzJXXyr9V0isebPVevN8jaBh5yciEhZ7Dzi23lsVycsGah23Gz73301FtquLmzc%2BItsduyXQXv53mqNyceLhEB5%2BT4KhplENhLFPxY5Xxi0qAhqJ3MCvIT1%2FjJqgdnlL0Oia4jKtu2TVO50uZnutStjSkgCYT%2Fjj1wzFrgoNR2NC%2B21UKg5116FbBTzF9yzzzsAHPDLyQx%2FWVfFLWifMPP7%2FdEGOqUBvtvc8IKgRcyIqw3LeoBDhVuG%2FR33erjGM45ObQ73HMvoJrlrEwTKF2IFU6x5bSdmdCwWSXErBYnsNLG326VNTgnEEkLoL16S3FIPtOjMNH3WW%2BItRZ%2B1srt%2F%2BQA38ST20l32MkduqB8HvAhmOqMCWOtgoOhKyZkQuN9wvIzZUfX7bkZFwwnqwicDkwN71yhtkC4QjvcA9GeZcUBJtfeSflnHZnmT&X-Amz-Signature=99ca38d8e6032f254942bbcaf33922104a2d3bdb678e909fad9641b382b984e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
