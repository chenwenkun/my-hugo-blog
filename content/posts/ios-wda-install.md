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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46663FYAMXZ%2F20251212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251212T181750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJHMEUCIAgRCgBubXnWRsA1uLULPQ06WRGsu6eSI4BAxhsDuEvjAiEAm4FGcmJFuITXknnFCVCsCgaKpDpfIcZBB1ilE5XPPdwq%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDMixjNW1En92h2Yh%2ByrcA2en28X0OvVaL4qtFWokP94XjkCBem9NXfVOu7mTxpuMp2uFrZyY4QNTTZ0lVLt%2Bo8Avf3KDq2dNNx8s%2FLI1jcN%2B7DDA9AyhuCAnCh%2BEtfuIBP1yEuE69OHM2dlqqCSGDesFO79pBjO211oEYec73Ht%2FvfqLPhxrakv6FtfQ8Lq9khwldKT68cGtwDJbaJFzihXVSKTAq809DtWco2t41O%2FWul7GrLuMPbHvw%2BtO0%2B5PzxJwBBrt917XNM%2BZHpaCL0i4JSk9erVwmoxVKY9DIAvSOIV47eaSWcP%2Bam7OlxXsNw5BQRwFDCBf565Y9yien4gVgsmJpkKpcS%2BadlKMPEfrWE6uX3Kz%2Ba076HXTykqvFYQm9ssU8Va8vBZGXf7ylTYtZ4TXbVJzMAt%2FPDUsTzpr0WRJSwuY9exzVcCsHZ7NZbQCEyqGlJfIP5Vy7KEHxisRz60W9GnIWdnRLuTw7tayUEGnBAKB2mVkFUSkua47pSfwGyL3Xmx16e8J%2BFQTzlUkxeMissezVBJCsLe4ww1qhimHcKNw1vOb47a3gx3VCsDyOuipnAid7zKa4BjpwNTFNYz%2B%2FawTE3POKo1b%2FLbKL%2FMhmDCWDEI6w41GKrX3oYW8X9dlrs1VIzKCMLip8ckGOqUBj8MzVhCZ76aFTklhiCGnpAAQ439w%2BU9Pj28PNNzhBltzj7C%2BduVPbz%2FK%2FLsVVG5EMo5ElIlBgyOgKADctIw1CxwELyhtYG%2B0e6doaLSt0FOyHZDvFZ%2FTJgP1wyrR3lqcrPTlI0quyCsS2SmD8OYrJRryrynAtQWo34O4Cppqk8zXDCoamcM7ctREltgtvMtvhW9esxVlQFDD8VBSdqZqCpMaoR5c&X-Amz-Signature=2e7e4fcd3ae4e7a19cf253b1282ef15835cfeab4b19e877f7e9bca0aae5bb694&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46663FYAMXZ%2F20251212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251212T181750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJHMEUCIAgRCgBubXnWRsA1uLULPQ06WRGsu6eSI4BAxhsDuEvjAiEAm4FGcmJFuITXknnFCVCsCgaKpDpfIcZBB1ilE5XPPdwq%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDMixjNW1En92h2Yh%2ByrcA2en28X0OvVaL4qtFWokP94XjkCBem9NXfVOu7mTxpuMp2uFrZyY4QNTTZ0lVLt%2Bo8Avf3KDq2dNNx8s%2FLI1jcN%2B7DDA9AyhuCAnCh%2BEtfuIBP1yEuE69OHM2dlqqCSGDesFO79pBjO211oEYec73Ht%2FvfqLPhxrakv6FtfQ8Lq9khwldKT68cGtwDJbaJFzihXVSKTAq809DtWco2t41O%2FWul7GrLuMPbHvw%2BtO0%2B5PzxJwBBrt917XNM%2BZHpaCL0i4JSk9erVwmoxVKY9DIAvSOIV47eaSWcP%2Bam7OlxXsNw5BQRwFDCBf565Y9yien4gVgsmJpkKpcS%2BadlKMPEfrWE6uX3Kz%2Ba076HXTykqvFYQm9ssU8Va8vBZGXf7ylTYtZ4TXbVJzMAt%2FPDUsTzpr0WRJSwuY9exzVcCsHZ7NZbQCEyqGlJfIP5Vy7KEHxisRz60W9GnIWdnRLuTw7tayUEGnBAKB2mVkFUSkua47pSfwGyL3Xmx16e8J%2BFQTzlUkxeMissezVBJCsLe4ww1qhimHcKNw1vOb47a3gx3VCsDyOuipnAid7zKa4BjpwNTFNYz%2B%2FawTE3POKo1b%2FLbKL%2FMhmDCWDEI6w41GKrX3oYW8X9dlrs1VIzKCMLip8ckGOqUBj8MzVhCZ76aFTklhiCGnpAAQ439w%2BU9Pj28PNNzhBltzj7C%2BduVPbz%2FK%2FLsVVG5EMo5ElIlBgyOgKADctIw1CxwELyhtYG%2B0e6doaLSt0FOyHZDvFZ%2FTJgP1wyrR3lqcrPTlI0quyCsS2SmD8OYrJRryrynAtQWo34O4Cppqk8zXDCoamcM7ctREltgtvMtvhW9esxVlQFDD8VBSdqZqCpMaoR5c&X-Amz-Signature=f902e9434bf57fb05ea8a612a0c551ceb9c270356ebfce0916502a0b6977361a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
