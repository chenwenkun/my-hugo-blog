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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YY2FVSBW%2F20251022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251022T061711Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQDJ0Y3ZpPGfiLx8d5dPddmqe98vu9Y2%2FwIT1ax3rXpc0gIgIGujtOtpT074wqc2tvz5vmSGblGjEE8WH7DsFf2L1jsq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDOJ3nM2lETS7FVpo8ircA%2BRMiij8p%2Bcorc9a6Kyajr%2BSmVeSo%2BvxD16%2FPzRYl9FuknNyhzBwC7SeixqCqEi03kjyU7Pqb6qF%2FCadcWiAe5M1fs%2BktwwSIm%2Fcd2714r3iOOWCB8loFqFBBTza3NmTJCNTPjRi8gsGJfIErTvF75HNQYVqGyi5MnAslqqUR%2BBm7lOQH03foGLURYXEyVGCmorncRWOeE%2FkirB58bnPmPE%2BdqaTBl37M1XWa1GoQOCclmpd6kOc3HkFHvLHDt5pcRPuP3dqGZR64fN3suOnlE33sj7A%2FE3DKyZMMb4pWtaitMWVyI26Vdsq5gpsKjhycdRhNlEJQQWYHCZLk5QPF%2BnPM5gWFQavITEIqh4R6qvcZJP4aKrnTdk6566e4yfnkSHXFON%2FFKMZSNFxZ5IaTDEii%2F6yEOdF4uaFeUx7WN1P7ApigmOPQHQEbzb5bbonKTQ2nH3gTx6dIpudYdYisJvztGKAV0xyRsTlWshJxwDJ6jlN9SvBPlwjaIdG96QGhWe92fk0zo5vA2studccttSO2q5j%2FBJkKYMtqb9NQssgRsPNdUBT7Vbg%2Fj5FR9mmmxHRY%2FEeoptPeUJD%2FjSrS5lc3clNs29OMb%2FJ2VBYwa3uaMf4NZLVBZKD2PaeMILN4McGOqUBKAt3vBgEwQ9FtKg9Uq9VsUtBDRS7nGYThztDgP4fa9%2FwJJo6b2CPFPGV7bk5Zmu76YwC7AYi9GQPRptPmoCbmQqq93kLt85dQ7bZf8hLPyLsemrAerEub8CSh1KniLK2cwEPchRs18MyiQ2qXi7RoTnWEwG2ite7N4kE3FiX60eRkOVFuw84ZlXpNm%2B9qXt4FWFqAoTvzV%2BXDrPjiVq8BHxfEHTE&X-Amz-Signature=6c15fdc39da6b1a5404d239b81c96077fdfed8efaac920cb693ce284815b344e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YY2FVSBW%2F20251022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251022T061711Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQDJ0Y3ZpPGfiLx8d5dPddmqe98vu9Y2%2FwIT1ax3rXpc0gIgIGujtOtpT074wqc2tvz5vmSGblGjEE8WH7DsFf2L1jsq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDOJ3nM2lETS7FVpo8ircA%2BRMiij8p%2Bcorc9a6Kyajr%2BSmVeSo%2BvxD16%2FPzRYl9FuknNyhzBwC7SeixqCqEi03kjyU7Pqb6qF%2FCadcWiAe5M1fs%2BktwwSIm%2Fcd2714r3iOOWCB8loFqFBBTza3NmTJCNTPjRi8gsGJfIErTvF75HNQYVqGyi5MnAslqqUR%2BBm7lOQH03foGLURYXEyVGCmorncRWOeE%2FkirB58bnPmPE%2BdqaTBl37M1XWa1GoQOCclmpd6kOc3HkFHvLHDt5pcRPuP3dqGZR64fN3suOnlE33sj7A%2FE3DKyZMMb4pWtaitMWVyI26Vdsq5gpsKjhycdRhNlEJQQWYHCZLk5QPF%2BnPM5gWFQavITEIqh4R6qvcZJP4aKrnTdk6566e4yfnkSHXFON%2FFKMZSNFxZ5IaTDEii%2F6yEOdF4uaFeUx7WN1P7ApigmOPQHQEbzb5bbonKTQ2nH3gTx6dIpudYdYisJvztGKAV0xyRsTlWshJxwDJ6jlN9SvBPlwjaIdG96QGhWe92fk0zo5vA2studccttSO2q5j%2FBJkKYMtqb9NQssgRsPNdUBT7Vbg%2Fj5FR9mmmxHRY%2FEeoptPeUJD%2FjSrS5lc3clNs29OMb%2FJ2VBYwa3uaMf4NZLVBZKD2PaeMILN4McGOqUBKAt3vBgEwQ9FtKg9Uq9VsUtBDRS7nGYThztDgP4fa9%2FwJJo6b2CPFPGV7bk5Zmu76YwC7AYi9GQPRptPmoCbmQqq93kLt85dQ7bZf8hLPyLsemrAerEub8CSh1KniLK2cwEPchRs18MyiQ2qXi7RoTnWEwG2ite7N4kE3FiX60eRkOVFuw84ZlXpNm%2B9qXt4FWFqAoTvzV%2BXDrPjiVq8BHxfEHTE&X-Amz-Signature=02fe1bc919a8c78fab2af43cadee95b3d372cf0e714144aa346b75bc9a3faf35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
