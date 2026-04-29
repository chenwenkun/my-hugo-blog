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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NQD7C3D%2F20260429%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260429T015746Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJHMEUCIQD2QzBjGVsgYN6Pmbd4uTVQgVFxV6kcY%2FUYD7KrrCETpAIgOcuoiZaxWdPRA6eFkgkS5GtDL%2BLJD58UzHVQUEVm1kAqiAQI6f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOGZiIDrQh1sMz0hbCrcA0Y6W7sgy0iuz1xXSJUWurXi6KfzE%2B6FKaP7SRHMH29eQ5mRxLDtYe9fzxHRmMAeIBzmmrn6BY8FMAwKYf9b%2B1xriYt7dyyV6v23BonnwY6E%2FNzY0s%2F1B%2FF2KV0qAPwSjaRrnPmnqH9DRoLOkgVKPe8%2Bc%2FIfANuivP0D%2BtdDnXoY1JA59L75ND9AtraJa%2FiPZl1HdRg%2BoFw6XUj05vtiTtHtcPXRlh22V2%2F0T78jKmE5R16Ti7ZZmm1AC9Tx7R2VY%2FPjk8TjYapqhjxo0BzAOuNey82PldJXFMJVvR%2BCjfvKeHHAx%2FjymjhpB2fdPcVjvNcbXyYHqtlRS5C34RxwF4lctJ%2FHDd7hkhW%2F9IRIUNyCy0DcdcrsC%2BhLywAHTEcJF9taaaqnEpkjh9srqZOPTfGoHFpGTRkq6TLb0N1WeJN3FyKl0B%2F651x5VWFuul7UjKhLLp7H%2FMTVpX2zfKdLRonpHnzcrj8jmjVvg%2F0k5UHdF7S74q1qwzpgRWETKEn0a06yQxxYwbgzwYrNE7aupfCdPnJ4PyJKibyZ3sk8eI507ZK37oUtfWWWMY3USlYa9lf3avNSd1hwSiDuQGhVt%2F8QHdIndKYUuhPpl2ojC4oKMKV47Zln%2FKiJvIo4MOOfxc8GOqUBPnx9MjeZNoh6d9gNiy4xbKzU2i6aVRy88a26CbdQtTZHuXV6ywPlYOXfDrbddN2eDI1dGi5JaxPeTMyaqvDWObwOFx%2BcwZrD5XWMCh2y0UedgnVNKFnC%2FFFhXRgbpEVLULcT7rP1PXg07hiUY%2FHiHLCFPi2Jce9eQCfswBJiwN4%2Bzo5pLQRKSj4%2F%2BsNf0U%2BmSma4akcHYrgMd8pqictQ8b%2FS6oq0&X-Amz-Signature=c86bd06b6bdbbf632c5fa87a44d08265c29b1f336cd193d1f8fc047f8613d3f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NQD7C3D%2F20260429%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260429T015746Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJHMEUCIQD2QzBjGVsgYN6Pmbd4uTVQgVFxV6kcY%2FUYD7KrrCETpAIgOcuoiZaxWdPRA6eFkgkS5GtDL%2BLJD58UzHVQUEVm1kAqiAQI6f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOGZiIDrQh1sMz0hbCrcA0Y6W7sgy0iuz1xXSJUWurXi6KfzE%2B6FKaP7SRHMH29eQ5mRxLDtYe9fzxHRmMAeIBzmmrn6BY8FMAwKYf9b%2B1xriYt7dyyV6v23BonnwY6E%2FNzY0s%2F1B%2FF2KV0qAPwSjaRrnPmnqH9DRoLOkgVKPe8%2Bc%2FIfANuivP0D%2BtdDnXoY1JA59L75ND9AtraJa%2FiPZl1HdRg%2BoFw6XUj05vtiTtHtcPXRlh22V2%2F0T78jKmE5R16Ti7ZZmm1AC9Tx7R2VY%2FPjk8TjYapqhjxo0BzAOuNey82PldJXFMJVvR%2BCjfvKeHHAx%2FjymjhpB2fdPcVjvNcbXyYHqtlRS5C34RxwF4lctJ%2FHDd7hkhW%2F9IRIUNyCy0DcdcrsC%2BhLywAHTEcJF9taaaqnEpkjh9srqZOPTfGoHFpGTRkq6TLb0N1WeJN3FyKl0B%2F651x5VWFuul7UjKhLLp7H%2FMTVpX2zfKdLRonpHnzcrj8jmjVvg%2F0k5UHdF7S74q1qwzpgRWETKEn0a06yQxxYwbgzwYrNE7aupfCdPnJ4PyJKibyZ3sk8eI507ZK37oUtfWWWMY3USlYa9lf3avNSd1hwSiDuQGhVt%2F8QHdIndKYUuhPpl2ojC4oKMKV47Zln%2FKiJvIo4MOOfxc8GOqUBPnx9MjeZNoh6d9gNiy4xbKzU2i6aVRy88a26CbdQtTZHuXV6ywPlYOXfDrbddN2eDI1dGi5JaxPeTMyaqvDWObwOFx%2BcwZrD5XWMCh2y0UedgnVNKFnC%2FFFhXRgbpEVLULcT7rP1PXg07hiUY%2FHiHLCFPi2Jce9eQCfswBJiwN4%2Bzo5pLQRKSj4%2F%2BsNf0U%2BmSma4akcHYrgMd8pqictQ8b%2FS6oq0&X-Amz-Signature=e6fc63ff21badc1d9bd4983ef161a99588943ac81bb79234ac7339fb5ae05965&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
