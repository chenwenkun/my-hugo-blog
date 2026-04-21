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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667HHV4IUM%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T185631Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIFQqCm02QwsxR4VtfEYPZ0qnC6Z7lslScKK0tQZZF5MaAiEA0WWzcCMAzOAFL6%2FlD5OF8tLY9FjI%2F55Wriwg1zbSHDcq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDFAdkbBeJPsqO1W0cSrcA35ZMLVVawnjFM%2F8b9quXSZ7D4v56OUNguAfDgTasC231jAPQ9p8QEatZnbHg4gio%2Fvdhhlugjp16fogDZ6xP42wcCNueCW6GlW5D6ZFNQNrmvUzPqHc0o3XTX3WSs6G%2BKFq72LwWlWIm4lPB4HlsDvENqRD%2BvPnARa%2FasRGbG6bhyahPY3AU27%2BIMdTOUz6W1U7F0DgKllDN7hWqVHS2xLIrTHlGS%2F6uTHwFSWS2%2FhFvdYp5%2BR%2FBKF8%2FLALeYsc1sERXS%2BWcOJ4c8Zxxf%2BAbIJVEooXn3%2Fohmaa%2B7ScNVBAx9ba8xC59ZTp0rPCgWfEXN3b6%2Bx4c7zDR020YefzwLDYF1HpVMeLXvkg8%2BaIY%2FipvKXsXgH0gprHTutgzu2slniBEWZUd%2F5KGgB%2FY9s9bp4U2hMJBTx8%2FH1JWpVMWWnaoYyrcfM41VKNI360uQhWPT1wbNyeuot%2BsEdp3pJMR%2BcmCfl5EPX9WgubOu%2FhkmDp%2B2xtG50i9K48Mwo6qNE9d46f6sV4rHvaldWT%2FtyFCLv41if%2F9dlZgj6fBYqWbP9TeBddGv%2B7Q6lGWDwBCtwQdJZHgS8Xk1bYLxus96H0SSay22j2eExhU%2BGNYRmRpPkm8OPxGFJ021k%2BweG7MJf2ns8GOqUBLk%2FphByTy0mfWEcwSJD3hkpHoppW1Gl8eplC3i4kpmrcS3yL0L%2BiLgIOY6AbCxVv9wVZ4o57NpQiJBvzAYL%2FAZX%2BJAX7SGVnUHGsNF%2BgNiA%2FVqdDggdnvpcofh0jj8AtUIuqYBkuRM4Ezu36BPzDVDIUeA1nQYzcG9Amf%2BCJdJeVt1Ek2GovVtjoDVKguM4eA7edowZwS%2B0aKhs0F6DBKx2RHz8r&X-Amz-Signature=3c2615693d6398e16dccd46468f85534a956de52518d495a74978ed2eded52c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667HHV4IUM%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T185631Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIFQqCm02QwsxR4VtfEYPZ0qnC6Z7lslScKK0tQZZF5MaAiEA0WWzcCMAzOAFL6%2FlD5OF8tLY9FjI%2F55Wriwg1zbSHDcq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDFAdkbBeJPsqO1W0cSrcA35ZMLVVawnjFM%2F8b9quXSZ7D4v56OUNguAfDgTasC231jAPQ9p8QEatZnbHg4gio%2Fvdhhlugjp16fogDZ6xP42wcCNueCW6GlW5D6ZFNQNrmvUzPqHc0o3XTX3WSs6G%2BKFq72LwWlWIm4lPB4HlsDvENqRD%2BvPnARa%2FasRGbG6bhyahPY3AU27%2BIMdTOUz6W1U7F0DgKllDN7hWqVHS2xLIrTHlGS%2F6uTHwFSWS2%2FhFvdYp5%2BR%2FBKF8%2FLALeYsc1sERXS%2BWcOJ4c8Zxxf%2BAbIJVEooXn3%2Fohmaa%2B7ScNVBAx9ba8xC59ZTp0rPCgWfEXN3b6%2Bx4c7zDR020YefzwLDYF1HpVMeLXvkg8%2BaIY%2FipvKXsXgH0gprHTutgzu2slniBEWZUd%2F5KGgB%2FY9s9bp4U2hMJBTx8%2FH1JWpVMWWnaoYyrcfM41VKNI360uQhWPT1wbNyeuot%2BsEdp3pJMR%2BcmCfl5EPX9WgubOu%2FhkmDp%2B2xtG50i9K48Mwo6qNE9d46f6sV4rHvaldWT%2FtyFCLv41if%2F9dlZgj6fBYqWbP9TeBddGv%2B7Q6lGWDwBCtwQdJZHgS8Xk1bYLxus96H0SSay22j2eExhU%2BGNYRmRpPkm8OPxGFJ021k%2BweG7MJf2ns8GOqUBLk%2FphByTy0mfWEcwSJD3hkpHoppW1Gl8eplC3i4kpmrcS3yL0L%2BiLgIOY6AbCxVv9wVZ4o57NpQiJBvzAYL%2FAZX%2BJAX7SGVnUHGsNF%2BgNiA%2FVqdDggdnvpcofh0jj8AtUIuqYBkuRM4Ezu36BPzDVDIUeA1nQYzcG9Amf%2BCJdJeVt1Ek2GovVtjoDVKguM4eA7edowZwS%2B0aKhs0F6DBKx2RHz8r&X-Amz-Signature=b5480edc5d6777611cd59727ad93bcd2190ca767044b9f6dc2d00d36f04120e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
