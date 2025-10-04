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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TD7BEJOT%2F20251004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251004T061439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBbdUsFWJl%2Fr0FJyn%2F6fJe1mZylhQOlYUXk%2Fz8CknxzcAiEAkzWqUmHRuzqyfau5sdA5nNuJJVUTjxdHdU5gI3GgTLoq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDF%2B4Q5UtgO9%2FVnlyUCrcA5RTCH3S6PgpzAdDsqlC3dbZMWxozaSjibtXXUAXOrcq00towxiCQCNa9GtsYPdtDE2YgnEBBEZ3M1xe0uDtIadl9L4PkTCXbMCDKO2se7IxN8TAVwwxXD9hU56Sg1rPO5svTypyh%2FpSkrLSCIIbyd2eYZshRJMf9nSOC0mHI2wgFkJXFb84Qs5luUw2CZobTzIFBIv83q3NBso2bCHhb%2F6Db2zcRWbB6nxM%2FzAwqwT2DG0afRlegCVa5d1YiEs9WgEb7fxCGbgpdUTcGdp%2BrAkF9BDFVgSQAHmNPkav2bmwWJQ5kFv1xdpVqA8orlmf%2BosRDIpRGX5Vo6801bUZChhz2rcvkMmdVDf9iPhQ9rfatErhE11MVBlwL138IXTId0%2BHUIfJnRl38Z0ONxiT%2FcKSw0j%2BfBO852fQ5T18FVBStQVOmvd8qzVZQ5OuGKwl8bFd%2FNG0FoshRXDOxFpUeSL7VgHeCf7vb8jswUOJNnCtjK9P71awqnMWdRbAKdVr5pfsx6Oz14mFwAW1uT1Rq7huUnQAV61hs4Bwjlz1RDBL6R7%2B95zudiQL9ovQmhspcnL9U2Ip%2FuzKmgMFZy5gWnTUFUemFQ%2FvciPZBHqkDifGd6FmTPUfsy%2FWsnUbMN%2FygscGOqUBwcFrXLrbZty%2FoSlJIKRaSANB4e9hcq%2BXcUE9iXhBQ36CntBeT1gHZuEum1fXesTz5mAgXPuTUCxfWo0d20LGDjfIt6%2BqjMtN9krsVFrlCa4En%2B%2BlT6ir4mJIVt8efi3sjRGVvxYV9F%2By2O4mvqqbolpkMwbJUpwdRrrY2slNtaj4mbBR9ujaKH2tM1gJZz66C8vHMyb0cVqrUOsloBBFVUL0GQic&X-Amz-Signature=4efb14a2be9a33792fc12cabc65ebc28b3e692fc17fcc7c6fa7f9074b49336a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TD7BEJOT%2F20251004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251004T061439Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBbdUsFWJl%2Fr0FJyn%2F6fJe1mZylhQOlYUXk%2Fz8CknxzcAiEAkzWqUmHRuzqyfau5sdA5nNuJJVUTjxdHdU5gI3GgTLoq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDF%2B4Q5UtgO9%2FVnlyUCrcA5RTCH3S6PgpzAdDsqlC3dbZMWxozaSjibtXXUAXOrcq00towxiCQCNa9GtsYPdtDE2YgnEBBEZ3M1xe0uDtIadl9L4PkTCXbMCDKO2se7IxN8TAVwwxXD9hU56Sg1rPO5svTypyh%2FpSkrLSCIIbyd2eYZshRJMf9nSOC0mHI2wgFkJXFb84Qs5luUw2CZobTzIFBIv83q3NBso2bCHhb%2F6Db2zcRWbB6nxM%2FzAwqwT2DG0afRlegCVa5d1YiEs9WgEb7fxCGbgpdUTcGdp%2BrAkF9BDFVgSQAHmNPkav2bmwWJQ5kFv1xdpVqA8orlmf%2BosRDIpRGX5Vo6801bUZChhz2rcvkMmdVDf9iPhQ9rfatErhE11MVBlwL138IXTId0%2BHUIfJnRl38Z0ONxiT%2FcKSw0j%2BfBO852fQ5T18FVBStQVOmvd8qzVZQ5OuGKwl8bFd%2FNG0FoshRXDOxFpUeSL7VgHeCf7vb8jswUOJNnCtjK9P71awqnMWdRbAKdVr5pfsx6Oz14mFwAW1uT1Rq7huUnQAV61hs4Bwjlz1RDBL6R7%2B95zudiQL9ovQmhspcnL9U2Ip%2FuzKmgMFZy5gWnTUFUemFQ%2FvciPZBHqkDifGd6FmTPUfsy%2FWsnUbMN%2FygscGOqUBwcFrXLrbZty%2FoSlJIKRaSANB4e9hcq%2BXcUE9iXhBQ36CntBeT1gHZuEum1fXesTz5mAgXPuTUCxfWo0d20LGDjfIt6%2BqjMtN9krsVFrlCa4En%2B%2BlT6ir4mJIVt8efi3sjRGVvxYV9F%2By2O4mvqqbolpkMwbJUpwdRrrY2slNtaj4mbBR9ujaKH2tM1gJZz66C8vHMyb0cVqrUOsloBBFVUL0GQic&X-Amz-Signature=d54b30eea0976f127b99ac6ddd802055b21770fcd28f9b38089940b90ce48294&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
