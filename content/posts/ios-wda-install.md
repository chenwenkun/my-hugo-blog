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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662EM3AD2K%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T200944Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCykrZDpWheVrIZWiCPvH660qamn3QZ8sLhN5wijxIj6gIgU%2FLWLfOZBWwrDw8AIdaScRIM9oSgs%2Bl9Ez%2BzZzLHJK4qiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDLisEUqdABgjiB4NyrcA4KZhLEwbFrInctQpLqBd03OTS3vlg9Blz%2FpO8%2BlMavfjJSjbYYF3aneBQKLqMV3%2Fvit1n1cpPAV6Utmwu%2BLpxCJprTikaJF%2BFlrixyVb9gaj3XfhUEHdeGgAdvnQ4m7kpe2d9nZJIKxwujANkwNRSw%2FKr%2FS8142nPaD05Kk%2F05cWx4m3sED40i0kCm29H4l6%2FesNJK8nhbt1kfrDFubmAp30RDgQPaQuixUSOy2sEWOr2ROBZgCpBsayf4jU22j3E86nKehjTZwwfAT%2B7uGUCdR4uPqGyPoJqXuxavWbIo%2Fm%2BvRxCoqsGEnH1muuGwiILFZ%2FroUort2%2FbSWwk5AYMpK%2FCz%2BDPn7o%2FF7Ym7v%2B3qV0nBloVQ6FWtTztYdh1OOhVO1dxvPFDRXM5X09%2FtyHP1TvrYAhanY6gObSriDA3kHT%2Bn%2BheM4u53LQNBBDB1xcFDJmWVMDdZ%2FOd84%2FZrCGmdgvHjSkKzi8BoOuj0fG%2FfIKOa%2BI6Gvwj4fdD6BHyvqppvfDC56WfnCf28cGpMASmFddmbBNXC%2FXpgix7mku8MHmIxQxAAo43s%2BhFaMx8xNeDJ%2FUmeMz2%2BXb3ik0bwoE67tnCFwNhpOgu0z%2FlfQ7Q4ByrmS5tlm1kG2T%2BkuMMeD0dEGOqUBN6RNbhZMjwo%2BAJZZ0qmJvuVDFXgTjcHzO9OO1Q0vKb4lfCIUa0PrJ9LfYrb%2Fn06bp97DVmg1je515jbT0puyVraLrby0XjwQxre1DJtdRBYC7%2BCwQTXQFuaosbAJMzCUHKeChk%2BiZQX4XChBGRzRyINhc7bZQmJtlWvWiyr7l87Qni2SAFWDqCzVEEEel1j2iePWVZ6BEzYDHB77CE08HdUaz0y7&X-Amz-Signature=fb5070ace32a6db83cfe596f71360ddb51d30c06de208e28ca0487c3d66236ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662EM3AD2K%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T200944Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCykrZDpWheVrIZWiCPvH660qamn3QZ8sLhN5wijxIj6gIgU%2FLWLfOZBWwrDw8AIdaScRIM9oSgs%2Bl9Ez%2BzZzLHJK4qiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDLisEUqdABgjiB4NyrcA4KZhLEwbFrInctQpLqBd03OTS3vlg9Blz%2FpO8%2BlMavfjJSjbYYF3aneBQKLqMV3%2Fvit1n1cpPAV6Utmwu%2BLpxCJprTikaJF%2BFlrixyVb9gaj3XfhUEHdeGgAdvnQ4m7kpe2d9nZJIKxwujANkwNRSw%2FKr%2FS8142nPaD05Kk%2F05cWx4m3sED40i0kCm29H4l6%2FesNJK8nhbt1kfrDFubmAp30RDgQPaQuixUSOy2sEWOr2ROBZgCpBsayf4jU22j3E86nKehjTZwwfAT%2B7uGUCdR4uPqGyPoJqXuxavWbIo%2Fm%2BvRxCoqsGEnH1muuGwiILFZ%2FroUort2%2FbSWwk5AYMpK%2FCz%2BDPn7o%2FF7Ym7v%2B3qV0nBloVQ6FWtTztYdh1OOhVO1dxvPFDRXM5X09%2FtyHP1TvrYAhanY6gObSriDA3kHT%2Bn%2BheM4u53LQNBBDB1xcFDJmWVMDdZ%2FOd84%2FZrCGmdgvHjSkKzi8BoOuj0fG%2FfIKOa%2BI6Gvwj4fdD6BHyvqppvfDC56WfnCf28cGpMASmFddmbBNXC%2FXpgix7mku8MHmIxQxAAo43s%2BhFaMx8xNeDJ%2FUmeMz2%2BXb3ik0bwoE67tnCFwNhpOgu0z%2FlfQ7Q4ByrmS5tlm1kG2T%2BkuMMeD0dEGOqUBN6RNbhZMjwo%2BAJZZ0qmJvuVDFXgTjcHzO9OO1Q0vKb4lfCIUa0PrJ9LfYrb%2Fn06bp97DVmg1je515jbT0puyVraLrby0XjwQxre1DJtdRBYC7%2BCwQTXQFuaosbAJMzCUHKeChk%2BiZQX4XChBGRzRyINhc7bZQmJtlWvWiyr7l87Qni2SAFWDqCzVEEEel1j2iePWVZ6BEzYDHB77CE08HdUaz0y7&X-Amz-Signature=9f14e133877bae471e133bd223304460e9258ef6d14d2c54838ff02bb6b53dfb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
