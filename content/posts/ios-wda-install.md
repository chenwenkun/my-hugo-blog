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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZIWYORNX%2F20260112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260112T010127Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCICSugoG0puxKKIeWK4LAnMriDYg1%2FdABO5KlBemVCrkdAiEAp88U4O%2FVUW0NHBgGGs8D2eJCimQoCs6qnwYxOB9G%2F1cqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHhObatXEoi3clDgGircA66l9mNN%2Bxj8mL7kBnunMx5XMqmRAFPSiAarihATJfGC5E8RgkUzprJmHvvy9yKf7YB2Rjd4zHUVNjDFgIJHEuGbnab6aEQu%2Fd1HEsi%2BnhdWrkLhB%2Bu6Eb6w6%2B3pNsczhXkbXmmwmemxhkmhUZeJQ0gk5WNvWrMsV8TMu7ZKnBiokrqBZipNSJ%2BQJIMBHWcoePrWjO8HkVPXGKOJeiSFF293Ry%2BHyOBYILJj9hr15zyDBEK6VnLmjTwromP4t65pqc54h3Y9vMaKzmHXKun59s0Z5C68CcO%2BfxKMvUb%2FGjOvziOv0bgM%2BG40RuBwOZ6n4HoBKv90Nwmh%2BCcCUFRlodJigkx8aQG67vIdFM%2BLRaKm8gXrFdQ2bpC1%2BQOBL7U5Mh9R7GvppMz3rpGnwBkRLkAtmw%2FI7tPx09ixowQ6NRPgxVVETNNy9D4IFgLilnADTV72WrkUwnNCi50gt0jSOcDhhO25mxnOyqmJndZUYbNw1krEhZfpk96uuQZrzCCpSwONfmPm3BPFmW31OSJStZWhSik972u9UPro0sK01jVvU0NC7fTDgaZlx7dXDAjWS0SYow%2Fdv0YHg2J6jRGbupdptN%2BRyrz8A%2FYPRW3FTk%2FJ71lW8uRyrkwxln8RMML3kMsGOqUBBudyEzKP8%2BvZt7mKsFk9usSqzqigoMu%2Fcbsru8%2FWr9iJSLIELNTCl4qGbyaJzdFwOX3vHEszUp6nF2MsbnoD6451y1Srb8QCzUqDLISu%2Fhl1i3UXqldu7rn782thgDlTbe6Pr7zy3%2BxsH3b6AaTPBtw5pSCAPJXFzym7T6W9wiEowqa%2F1PFLtRQ%2FFDQNKDQuDfZLFWz0sJmVmt1ytOFcdifrS3%2F%2B&X-Amz-Signature=97e791611ba8f0a5581bbddb037b2f404ee821c8a202ca2ebba45f177c1028aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZIWYORNX%2F20260112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260112T010127Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCICSugoG0puxKKIeWK4LAnMriDYg1%2FdABO5KlBemVCrkdAiEAp88U4O%2FVUW0NHBgGGs8D2eJCimQoCs6qnwYxOB9G%2F1cqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHhObatXEoi3clDgGircA66l9mNN%2Bxj8mL7kBnunMx5XMqmRAFPSiAarihATJfGC5E8RgkUzprJmHvvy9yKf7YB2Rjd4zHUVNjDFgIJHEuGbnab6aEQu%2Fd1HEsi%2BnhdWrkLhB%2Bu6Eb6w6%2B3pNsczhXkbXmmwmemxhkmhUZeJQ0gk5WNvWrMsV8TMu7ZKnBiokrqBZipNSJ%2BQJIMBHWcoePrWjO8HkVPXGKOJeiSFF293Ry%2BHyOBYILJj9hr15zyDBEK6VnLmjTwromP4t65pqc54h3Y9vMaKzmHXKun59s0Z5C68CcO%2BfxKMvUb%2FGjOvziOv0bgM%2BG40RuBwOZ6n4HoBKv90Nwmh%2BCcCUFRlodJigkx8aQG67vIdFM%2BLRaKm8gXrFdQ2bpC1%2BQOBL7U5Mh9R7GvppMz3rpGnwBkRLkAtmw%2FI7tPx09ixowQ6NRPgxVVETNNy9D4IFgLilnADTV72WrkUwnNCi50gt0jSOcDhhO25mxnOyqmJndZUYbNw1krEhZfpk96uuQZrzCCpSwONfmPm3BPFmW31OSJStZWhSik972u9UPro0sK01jVvU0NC7fTDgaZlx7dXDAjWS0SYow%2Fdv0YHg2J6jRGbupdptN%2BRyrz8A%2FYPRW3FTk%2FJ71lW8uRyrkwxln8RMML3kMsGOqUBBudyEzKP8%2BvZt7mKsFk9usSqzqigoMu%2Fcbsru8%2FWr9iJSLIELNTCl4qGbyaJzdFwOX3vHEszUp6nF2MsbnoD6451y1Srb8QCzUqDLISu%2Fhl1i3UXqldu7rn782thgDlTbe6Pr7zy3%2BxsH3b6AaTPBtw5pSCAPJXFzym7T6W9wiEowqa%2F1PFLtRQ%2FFDQNKDQuDfZLFWz0sJmVmt1ytOFcdifrS3%2F%2B&X-Amz-Signature=4683d2e814b3612797cb47712271e4eec61fbdede762cc66a1e54adc4eb26cd7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
