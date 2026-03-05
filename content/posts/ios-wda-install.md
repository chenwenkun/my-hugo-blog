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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQYR4KGT%2F20260305%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260305T011021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBJ6c%2FRBL7sKVlPRx4QEAd3MLjV%2B5exY11VFRH5BWsSCAiEAtO85e7nmm68W1DgTcuJmxQlxvsCqjU0mz3oeb5SoEy0qiAQIwP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLMTaN4yOzwr2jAdoCrcA201%2Fo2BscQUtcbFVbMEmRlyBaTbsm3ikys97b5cOPY95fkIfnXocO7rX7Ln08NjDH226A0iielPtlo5OZKIeuemHe7wZHm0qVktREK3R%2B56jv8hyM7yF6%2BiGm0Fu0DWH07G4iXzCB5bgkh%2FDuJr%2BZ7M9PKl7eNYw4odumJt%2BC0zaFuD3MRepleCVq09j%2FPDKotT98M15gEYbrcNyKJ2uSjRPEkMJH3w8opjQo7zHn8RIS4te7ut4llt9xwb17%2Bm3exCBNARaTK%2FD3OnG5%2FNI7W5ON%2BFYPbCfY128x8Ry15khSwXnc%2BF5hxw1LKmcawOxuOmxdCTzrKDa4p0Mu0KjAMRlW9OXOEUKeIozmc7IKEHGTB%2FkUbbcNbTo8OpVuE5HFuWBHJLT2b2CIuNBx8Xh2H%2FigatTWEU9V8XQ%2Fnt7BOkdMVvPsIsA1WhIWcY0qBgg%2BaxK%2FROra6nAl4wOxnPT5R9fjUcrCK33Bv2ywkb3Hi95oBcEKP5Bb8KKySWb%2BSZgMSZGIfPt8O3B7XiYHh6aix6AkFigQlJrJWeslb139TFdJUZJdoEucb0F%2Fu0Q2yGUe6YKTplwvSMdejJ%2BUzbMAU7JgEBOBTEwZBXD4u94aXPzN6xF1ftuzVgeZo6MNn9os0GOqUBcBaDWE3EPDZHyY1qZk9671K9d7M646VUnP2h51ATG8p%2FZ%2F7P8GAPyR51%2B2hrwaGDEeZJdzQob2lH%2B4QuWrKknz1Ndqem1xPn8ASkhF5DtKqV7c42fIQQClogWwAZeKH96RgBB07LR4FPOIJfVM2NKxnBebmYBGzAoldiaX3GMdVOPWa5QpzV%2BYfh7JFPhnKKvKpvfa4WYt8l4SYNiDuZFTVn806t&X-Amz-Signature=32ffe29ee4fa3c7a13b28d6271dc9cf2e8f5e5e63443fab92a549fef58f2e2fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQYR4KGT%2F20260305%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260305T011021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBJ6c%2FRBL7sKVlPRx4QEAd3MLjV%2B5exY11VFRH5BWsSCAiEAtO85e7nmm68W1DgTcuJmxQlxvsCqjU0mz3oeb5SoEy0qiAQIwP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLMTaN4yOzwr2jAdoCrcA201%2Fo2BscQUtcbFVbMEmRlyBaTbsm3ikys97b5cOPY95fkIfnXocO7rX7Ln08NjDH226A0iielPtlo5OZKIeuemHe7wZHm0qVktREK3R%2B56jv8hyM7yF6%2BiGm0Fu0DWH07G4iXzCB5bgkh%2FDuJr%2BZ7M9PKl7eNYw4odumJt%2BC0zaFuD3MRepleCVq09j%2FPDKotT98M15gEYbrcNyKJ2uSjRPEkMJH3w8opjQo7zHn8RIS4te7ut4llt9xwb17%2Bm3exCBNARaTK%2FD3OnG5%2FNI7W5ON%2BFYPbCfY128x8Ry15khSwXnc%2BF5hxw1LKmcawOxuOmxdCTzrKDa4p0Mu0KjAMRlW9OXOEUKeIozmc7IKEHGTB%2FkUbbcNbTo8OpVuE5HFuWBHJLT2b2CIuNBx8Xh2H%2FigatTWEU9V8XQ%2Fnt7BOkdMVvPsIsA1WhIWcY0qBgg%2BaxK%2FROra6nAl4wOxnPT5R9fjUcrCK33Bv2ywkb3Hi95oBcEKP5Bb8KKySWb%2BSZgMSZGIfPt8O3B7XiYHh6aix6AkFigQlJrJWeslb139TFdJUZJdoEucb0F%2Fu0Q2yGUe6YKTplwvSMdejJ%2BUzbMAU7JgEBOBTEwZBXD4u94aXPzN6xF1ftuzVgeZo6MNn9os0GOqUBcBaDWE3EPDZHyY1qZk9671K9d7M646VUnP2h51ATG8p%2FZ%2F7P8GAPyR51%2B2hrwaGDEeZJdzQob2lH%2B4QuWrKknz1Ndqem1xPn8ASkhF5DtKqV7c42fIQQClogWwAZeKH96RgBB07LR4FPOIJfVM2NKxnBebmYBGzAoldiaX3GMdVOPWa5QpzV%2BYfh7JFPhnKKvKpvfa4WYt8l4SYNiDuZFTVn806t&X-Amz-Signature=1ada60e5ebe457bd625b14fe093c38c431500b4b1e499715aaffb6b2f5af3e68&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
