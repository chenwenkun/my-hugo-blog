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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SMUZ3M3I%2F20260731%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260731T190607Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDwzyfjjStkdw%2BjVgr0dILCtUmcIKKvX65TWF8nJf1rKAIgTGUf0jEThZxmaSb3QLGLnmkUn3rvN64eOVk%2BJtboZ34qiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBnWiAVUtm2Mhvi5eyrcA%2Bg%2BSHQKRLWb7ks%2FvyxGk%2FkLwgu8qRPCL2ZyuhchFlOY8DOoKPAvClDtTwYTeVmTfoaiUj0ourz1N50MebQ%2BcDWH6y65SWQ2%2B2aGD3McVOsbjoNGpwE5055kV0CxWXbRDu8lZrFp6%2FaICX0TcGeSRYNf8xH%2BneQwvFV%2F1svrO3%2BFHREmGkMfPv1seOSZabK%2B%2BxkEwU2aY%2B%2F6q92GPB04Z55xjN07WrCmt9F%2FllEx8mCWsued75RKvEprD%2FQd88KKDN7Y7XINIXFi9hXXAFpSSKNRx4g5aDDslhZaH6chGa5O9ST5lZTQRNSVGBFDNIOQtWwZs1cWbnrHGnNNwVQTykHukk6%2ByagFx5TPB1Rs0q1jFi8dkvXSeZCGvjcaw%2F%2FBLMERKk47hHnyLgvsWYuw9oM%2FvEc3T5HgF5gMrZ%2FZIeyiaRhnvOeQaMetjrJ9m2jV%2FD1omoTLwmyIePX%2Fya10aXhdEyLWUDjyCQzAQl%2B7E4WkwZq2UBb7EK4llsNxAD0OyqugJKpWF2aRccb2hKjU5riO3NvXUHyIOqRoK2r7FslgKK8BUfxgIH4oytjrXYftxlhb9MwoLcqcwJEw7Kmd2Q5rKBMrQ6vgwFwi88zB4ARxrWq2wATApkIB31RiMPWZs9MGOqUBwZM66ZwAjrgu5%2FtPsxMiNV6SlFbctpou4VCdpi0nixWGopAHVbLq9rTy4xbyyGLTx%2F%2BZXWDTzEhaYuhJs5ug%2FulttCfUW%2ByEPZ3Hsz3XZQm0uKR3Ha0oJwr%2BroWJMcyhSkewGQN6nmnfMWgTxOxBaD1wlqlOV%2Ba4dRdXhE3tHnRsircvhPMZK4nUafXKcrw7k8Xclp1463CgLw4IlPm3zaPDSOZt&X-Amz-Signature=1985dda2406933674b28058ee4220d5a6923f51b44d78ba71c84767121baa3e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SMUZ3M3I%2F20260731%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260731T190607Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDwzyfjjStkdw%2BjVgr0dILCtUmcIKKvX65TWF8nJf1rKAIgTGUf0jEThZxmaSb3QLGLnmkUn3rvN64eOVk%2BJtboZ34qiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBnWiAVUtm2Mhvi5eyrcA%2Bg%2BSHQKRLWb7ks%2FvyxGk%2FkLwgu8qRPCL2ZyuhchFlOY8DOoKPAvClDtTwYTeVmTfoaiUj0ourz1N50MebQ%2BcDWH6y65SWQ2%2B2aGD3McVOsbjoNGpwE5055kV0CxWXbRDu8lZrFp6%2FaICX0TcGeSRYNf8xH%2BneQwvFV%2F1svrO3%2BFHREmGkMfPv1seOSZabK%2B%2BxkEwU2aY%2B%2F6q92GPB04Z55xjN07WrCmt9F%2FllEx8mCWsued75RKvEprD%2FQd88KKDN7Y7XINIXFi9hXXAFpSSKNRx4g5aDDslhZaH6chGa5O9ST5lZTQRNSVGBFDNIOQtWwZs1cWbnrHGnNNwVQTykHukk6%2ByagFx5TPB1Rs0q1jFi8dkvXSeZCGvjcaw%2F%2FBLMERKk47hHnyLgvsWYuw9oM%2FvEc3T5HgF5gMrZ%2FZIeyiaRhnvOeQaMetjrJ9m2jV%2FD1omoTLwmyIePX%2Fya10aXhdEyLWUDjyCQzAQl%2B7E4WkwZq2UBb7EK4llsNxAD0OyqugJKpWF2aRccb2hKjU5riO3NvXUHyIOqRoK2r7FslgKK8BUfxgIH4oytjrXYftxlhb9MwoLcqcwJEw7Kmd2Q5rKBMrQ6vgwFwi88zB4ARxrWq2wATApkIB31RiMPWZs9MGOqUBwZM66ZwAjrgu5%2FtPsxMiNV6SlFbctpou4VCdpi0nixWGopAHVbLq9rTy4xbyyGLTx%2F%2BZXWDTzEhaYuhJs5ug%2FulttCfUW%2ByEPZ3Hsz3XZQm0uKR3Ha0oJwr%2BroWJMcyhSkewGQN6nmnfMWgTxOxBaD1wlqlOV%2Ba4dRdXhE3tHnRsircvhPMZK4nUafXKcrw7k8Xclp1463CgLw4IlPm3zaPDSOZt&X-Amz-Signature=2b9b759b40b2d9f2aee804f241b5cc876c9558f55764c49d63bec7e123d874c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
