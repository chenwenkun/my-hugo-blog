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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667UJXJAEW%2F20260430%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260430T080235Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCIQCDl2i2D3%2F2dltixTHgY37ckTQZoFDWa%2F27rPbhC9lkvgIgMwNmDam8xdZnX9NFk%2Fln8oGXpda%2F5pU%2BvG6fhwSrFloq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDOyPevH224AponA08SrcAwoj6HzINPOHfK6PrnoYceNAqed%2FR3YWvv5mlUzvB2dl5KNDAOzBZw%2BOgDYqBqCNFBu91wet3gLahvBc5QmieeIjMMynM%2BLvWCxZeFu03Wo56vsm57fN0v1unjo2FVgBe28%2BMqu7aWRkWEDJWaUJSvQg3Y6SikQd1Od19nVL8iU3%2FMHWH8wY7bCBs0h0l%2F9460PIrg4MxZgtq7J4UO%2FAPBUBoCgQ8Rp63Dhs7mS0nyI96SVc5lEq%2F2vkAxPUmh1yikT3mFvm2H66fbNYbgVOUolTabpNMxWf1%2Bmp6BJ5gGMSCaCTC6r4FNAPaP52QffA2LoGbgIoJqVtYcejzgL%2BzoN7SyuM%2Fs011Kj5wi8ORt8%2BI4J95w9cLTq9Uncv6zTM4QYMtT%2FlR1YgRdxi7jlnaqxf2mqGVY6jTf0fqd6t1rmTSqDJo5uKqGDWgR73XfBpNTif5CTYPE12tGVOdA2%2ByGl%2FIUWUjDRhhFdMuIoDdnj8skd74hKxlpnrLBK3tFQUaYNTNQSi039Zy2Ku2BEXS0cw%2BHa6jpuscCTc9S994sfjs%2FMx3laFfSux8Ebz1TQ4DIKuoFNPAVdReBU%2FXnEbFUo4SKzMZul7lF%2B%2Bgfg1szyfNpwlAbyfHzHM9E%2FNMKOKzM8GOqUBBD6MuUM%2BOsw14TyRvyxeW8g3E0FXgOIoAoqOYI98CT5AOi%2BItxdXLvZLiigOUFLWwv9VFKE4sMc4YdD%2F5tjCZFOhXOVdSE%2FeO1pSDxjPtQFU4bhHLRUtXhPhVQ59AQuw%2Ffu2KrcJVbb6zBULq%2Bjn4tKIyHpVCkPvAvmplmw%2BTzzOhFcph1j4Im3MDB6gj4%2B%2Fu3JOb6BpACbzn%2BupmFHivh2%2FOrGa&X-Amz-Signature=dd8f0fa3fa3362fd774f6fc700459b3d5cd44a200d73cb264b96c4e1ac4eddcf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667UJXJAEW%2F20260430%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260430T080235Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCIQCDl2i2D3%2F2dltixTHgY37ckTQZoFDWa%2F27rPbhC9lkvgIgMwNmDam8xdZnX9NFk%2Fln8oGXpda%2F5pU%2BvG6fhwSrFloq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDOyPevH224AponA08SrcAwoj6HzINPOHfK6PrnoYceNAqed%2FR3YWvv5mlUzvB2dl5KNDAOzBZw%2BOgDYqBqCNFBu91wet3gLahvBc5QmieeIjMMynM%2BLvWCxZeFu03Wo56vsm57fN0v1unjo2FVgBe28%2BMqu7aWRkWEDJWaUJSvQg3Y6SikQd1Od19nVL8iU3%2FMHWH8wY7bCBs0h0l%2F9460PIrg4MxZgtq7J4UO%2FAPBUBoCgQ8Rp63Dhs7mS0nyI96SVc5lEq%2F2vkAxPUmh1yikT3mFvm2H66fbNYbgVOUolTabpNMxWf1%2Bmp6BJ5gGMSCaCTC6r4FNAPaP52QffA2LoGbgIoJqVtYcejzgL%2BzoN7SyuM%2Fs011Kj5wi8ORt8%2BI4J95w9cLTq9Uncv6zTM4QYMtT%2FlR1YgRdxi7jlnaqxf2mqGVY6jTf0fqd6t1rmTSqDJo5uKqGDWgR73XfBpNTif5CTYPE12tGVOdA2%2ByGl%2FIUWUjDRhhFdMuIoDdnj8skd74hKxlpnrLBK3tFQUaYNTNQSi039Zy2Ku2BEXS0cw%2BHa6jpuscCTc9S994sfjs%2FMx3laFfSux8Ebz1TQ4DIKuoFNPAVdReBU%2FXnEbFUo4SKzMZul7lF%2B%2Bgfg1szyfNpwlAbyfHzHM9E%2FNMKOKzM8GOqUBBD6MuUM%2BOsw14TyRvyxeW8g3E0FXgOIoAoqOYI98CT5AOi%2BItxdXLvZLiigOUFLWwv9VFKE4sMc4YdD%2F5tjCZFOhXOVdSE%2FeO1pSDxjPtQFU4bhHLRUtXhPhVQ59AQuw%2Ffu2KrcJVbb6zBULq%2Bjn4tKIyHpVCkPvAvmplmw%2BTzzOhFcph1j4Im3MDB6gj4%2B%2Fu3JOb6BpACbzn%2BupmFHivh2%2FOrGa&X-Amz-Signature=1f68c1cc791847c37d6eef667428c6ede928e6867f07a2fc312a1f3d34e772d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
