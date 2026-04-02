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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SK65PIKW%2F20260402%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260402T124729Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBxocV2Nk2dAN6j3qGIgn2D0K%2BL9lD92gZHFwX%2B3mYAYAiEAxxw1ItztoYRlfZc3ajZXPgs1uoGxrZdQMp77YUV5Pi8q%2FwMIbBAAGgw2Mzc0MjMxODM4MDUiDGi8xNeNU29NPa9GGircA%2BzsEnO46ZjhX57at%2B7%2FrEllad5%2FakohKhkEplunK4Jop2NJyJF5A28B1wkh5j1SA%2F8eJ%2BXrHwRE5ErwIB83yGvZ7A1JG2snZMFdZRTwv1OVEenTZ4ibe9vAJAfqHRmBmR29wFBGCVCE6%2BxPP%2F89wVLdGjRh5S6SqMgwouJ1IRPsPo5aWfO3XvNDpwC3ovWl5EnciEYwQB%2B9IJtLVtKxxNnBTChYq9QVvmT%2FuilK56sQEvwPY9lh7xYx32KfgJu5AvRtrHQC9lGuyNwnf0K9awR2YvuGRPbaMYm8v09TvpnjpawSyYfqqZpYPXBlM84km6cb9%2ByepzwRyPJJLyZZISi7fUxTtNcoh4uL4OhKgCULleVAQsQjs1xn8wdLwsgeQucUxzJoP8tP9V%2BZbU%2BlocrTP%2FupphdaxQ0xWf%2FsSpGOWlLCjgZYPaAYeU7r%2B7fPxHZT4FDYi7%2FLhDiLN2VdJo5jyrAF9M8NGkWzPutQrKrC%2FaOhtdutDGwtr1Q6nDCmH2tQPU%2F5qRzXGU%2FfUGL%2Fylem6q%2BRBY3bFyEMtmAFYPHV9MS1behswaAAUdrsFaKumfuaGXAYTRyBIpuBLKLRC1r8n5ljuHyOiC%2BWxH1T5o8rcF0%2FMQEEH%2BnRCWi4MKmfuc4GOqUBKzJXuZKOML832NPZMQafoYrUbfbt8vq5qEJALowTHdpoWW5nLG68ygywyiWKg7w7bEJPuhGhl55ASsWptU3XFv9dljMuy%2FQJ5t%2BGTCI5I3%2B%2FsmDHPoO%2F06GgIk8CcpgNALiY%2F8dE9DoxCRgQqa78duLtArGr93WdLwgBHUJjDvCYWn1SHQetKbmL5fro9YBb2DRER2NKXU68fCT%2FZLP9WaXyB%2Fsj&X-Amz-Signature=bc00d4e09c1cf9e8eb3a494c49c5c38959d6922a8c7aa71cfb02ed3e50e604d0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SK65PIKW%2F20260402%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260402T124729Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBxocV2Nk2dAN6j3qGIgn2D0K%2BL9lD92gZHFwX%2B3mYAYAiEAxxw1ItztoYRlfZc3ajZXPgs1uoGxrZdQMp77YUV5Pi8q%2FwMIbBAAGgw2Mzc0MjMxODM4MDUiDGi8xNeNU29NPa9GGircA%2BzsEnO46ZjhX57at%2B7%2FrEllad5%2FakohKhkEplunK4Jop2NJyJF5A28B1wkh5j1SA%2F8eJ%2BXrHwRE5ErwIB83yGvZ7A1JG2snZMFdZRTwv1OVEenTZ4ibe9vAJAfqHRmBmR29wFBGCVCE6%2BxPP%2F89wVLdGjRh5S6SqMgwouJ1IRPsPo5aWfO3XvNDpwC3ovWl5EnciEYwQB%2B9IJtLVtKxxNnBTChYq9QVvmT%2FuilK56sQEvwPY9lh7xYx32KfgJu5AvRtrHQC9lGuyNwnf0K9awR2YvuGRPbaMYm8v09TvpnjpawSyYfqqZpYPXBlM84km6cb9%2ByepzwRyPJJLyZZISi7fUxTtNcoh4uL4OhKgCULleVAQsQjs1xn8wdLwsgeQucUxzJoP8tP9V%2BZbU%2BlocrTP%2FupphdaxQ0xWf%2FsSpGOWlLCjgZYPaAYeU7r%2B7fPxHZT4FDYi7%2FLhDiLN2VdJo5jyrAF9M8NGkWzPutQrKrC%2FaOhtdutDGwtr1Q6nDCmH2tQPU%2F5qRzXGU%2FfUGL%2Fylem6q%2BRBY3bFyEMtmAFYPHV9MS1behswaAAUdrsFaKumfuaGXAYTRyBIpuBLKLRC1r8n5ljuHyOiC%2BWxH1T5o8rcF0%2FMQEEH%2BnRCWi4MKmfuc4GOqUBKzJXuZKOML832NPZMQafoYrUbfbt8vq5qEJALowTHdpoWW5nLG68ygywyiWKg7w7bEJPuhGhl55ASsWptU3XFv9dljMuy%2FQJ5t%2BGTCI5I3%2B%2FsmDHPoO%2F06GgIk8CcpgNALiY%2F8dE9DoxCRgQqa78duLtArGr93WdLwgBHUJjDvCYWn1SHQetKbmL5fro9YBb2DRER2NKXU68fCT%2FZLP9WaXyB%2Fsj&X-Amz-Signature=f98bbce6e3ef505e1093d62a516936c533993f6b77a6a41f109c4bbe00925023&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
