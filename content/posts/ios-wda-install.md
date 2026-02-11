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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666BJWEMP7%2F20260211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260211T184904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHSaUj2QREebVvuGOZUmfRGkH09uyNwxWt4gY95uW7MpAiEAluWcYFI6qyQd84aECLyztcX3bCr92LyRd2xsRskD3MQqiAQIw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH0pXTnUIj8zQdy1eSrcA83Ec2laWnS%2Bdi%2BqI3HgEr14Ya8Sw5tcrF%2FivEtJTLecpzPq%2BOyInB8M4EUfVfSfdp2awALcUg%2FA0IGgcGnsNse2uszKm%2BupN9Q7nADfz4%2Bv93dWQ0klEpKPMXfJfewMEjYgHypbVa6KBW2YlJiQBn1MJaQ%2FzBMgBibp7w9mDd1pGr61SdmE704goMxPS0YROGlET8xl%2BMeHeUTlfitfTZLZK2d8lJX4U54KjanggkqItV%2BIu6C5AaqzpeVYDH12E3Xmo0qGJju%2FnSVIdlPXQFiPhHw%2F%2FhwbLzMVwfyBiaGdxx3fRST2MdHjcw6c86mlcBuk9qvv2A5buajdJIc1ixen%2BFvAddkpdxyIK%2BHQt2lJE85Wp7YhhhzrmKfXLayoASUvkZCwvxSfGi7seR6RdMo24IMWr5jPE9O5j9APv41YNTnMtYKsZXePXPtCbGUaVUScaoUeV7s%2BNFGezbQ01y5LP5%2Bz8IdjHANX1AUVK2hyeYfXvHb260ygkMwCbz4GndrAKzHZL8dzTDXmyC%2FB3i%2F2KSC%2Bynomtf2U%2BoxaNdC8mmpZjunk1kgw1Dw21qlinx5pH4asvFoTKwPz%2F8UiwEldItAq%2FvZSP2F8MZA6r8zc0wd8tShnIN62B6xsMPyFs8wGOqUBfj9NjlrEqsouy02aDvh2kk8tASF7aN3%2FPBHBPDp9v%2FAIE0DqIUfeBrXZPAdanJiLYznUC%2BLF%2FCFdUhPBJs97KbbC9U28g8jE5n83VFtw0szxIN522HDhuoVqXfr20eEvnSij4l2tfhUhk6CaDH2VD7fWLfp5oJuK%2FAl4kbxer0GaSEgFxQ7qyEcRyt7Y8RbwP4Z9cfqktrIpXNZRibqs35Ii3Qzs&X-Amz-Signature=37fcdcf89c1c9f19db073a22b6efe5c0833d8a782d75b5c736d172214e4490a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666BJWEMP7%2F20260211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260211T184904Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHSaUj2QREebVvuGOZUmfRGkH09uyNwxWt4gY95uW7MpAiEAluWcYFI6qyQd84aECLyztcX3bCr92LyRd2xsRskD3MQqiAQIw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH0pXTnUIj8zQdy1eSrcA83Ec2laWnS%2Bdi%2BqI3HgEr14Ya8Sw5tcrF%2FivEtJTLecpzPq%2BOyInB8M4EUfVfSfdp2awALcUg%2FA0IGgcGnsNse2uszKm%2BupN9Q7nADfz4%2Bv93dWQ0klEpKPMXfJfewMEjYgHypbVa6KBW2YlJiQBn1MJaQ%2FzBMgBibp7w9mDd1pGr61SdmE704goMxPS0YROGlET8xl%2BMeHeUTlfitfTZLZK2d8lJX4U54KjanggkqItV%2BIu6C5AaqzpeVYDH12E3Xmo0qGJju%2FnSVIdlPXQFiPhHw%2F%2FhwbLzMVwfyBiaGdxx3fRST2MdHjcw6c86mlcBuk9qvv2A5buajdJIc1ixen%2BFvAddkpdxyIK%2BHQt2lJE85Wp7YhhhzrmKfXLayoASUvkZCwvxSfGi7seR6RdMo24IMWr5jPE9O5j9APv41YNTnMtYKsZXePXPtCbGUaVUScaoUeV7s%2BNFGezbQ01y5LP5%2Bz8IdjHANX1AUVK2hyeYfXvHb260ygkMwCbz4GndrAKzHZL8dzTDXmyC%2FB3i%2F2KSC%2Bynomtf2U%2BoxaNdC8mmpZjunk1kgw1Dw21qlinx5pH4asvFoTKwPz%2F8UiwEldItAq%2FvZSP2F8MZA6r8zc0wd8tShnIN62B6xsMPyFs8wGOqUBfj9NjlrEqsouy02aDvh2kk8tASF7aN3%2FPBHBPDp9v%2FAIE0DqIUfeBrXZPAdanJiLYznUC%2BLF%2FCFdUhPBJs97KbbC9U28g8jE5n83VFtw0szxIN522HDhuoVqXfr20eEvnSij4l2tfhUhk6CaDH2VD7fWLfp5oJuK%2FAl4kbxer0GaSEgFxQ7qyEcRyt7Y8RbwP4Z9cfqktrIpXNZRibqs35Ii3Qzs&X-Amz-Signature=db08caaf2c3c9d71d6d77665ab59b89d7a0be8e6440f64bc28df8b856bb60a82&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
