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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667YFTEJHS%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T144040Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGTJ%2Bpb%2B%2BbEdH%2BmroUM91m5Hn%2BgwpK7dzxgYiIAvbrKEAiB4P2mo2LNjHFt8e%2FHhlRwOcpO3q%2F%2FeMEb6yOOK1wVfQCqIBAi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMe2p2lIbGKvzWwZdmKtwDpS9igxpyPC07FZ1wBqe%2BVlgHAdXgOrYNEjG5q1dR2aiZ8rOJw7xKe5%2B0M8FlnpNeX8Z7oJHpulx41i3tc3nNTEWMo6hencfRkJTm56deOo%2BKTWAj2gchJfLuOuf%2F55gSO225OrJ9Eq6lyOvYEk7gfD%2FoHeVWI5%2B3pRZiJ9Upd72xNobSwJY5Pk%2FVxzelNJNSoBmdo4yKQiOuxMCbm6zeBTIkv%2BJSsd%2FXSpbUkojiWj%2Fq7WemkJ%2F25vAgGnsIXKZkvhtEk%2FOQC3Scje0J%2BigktTiajRDS%2FH9rm2jepcHGwdnglH8QQ3j%2BXc1Wh4nXpwXhjuhOtlWBxULb%2BZCm90MBJpsrTIaUDrNGuj4gZImhwcpefayYM2T1Wk9CvGec4ANbz4FDeo1qmztzT2FI1K4s5EmBGoLd%2B8tmlnO11dpff8R5BM4bspXSqqSgiZOfGrmRClS8SExno3l%2BgeOiVDrV0FY%2F%2FkpNy7x7b57%2FNt%2FHMymnl5BYU923jdsAp2KVdkdPqClOhsYER171deEZCFyK%2BWZC9XQ4jOw01nja%2FwOwn2ImyuFKOe08Tcd5HDbqtEbRt%2FFm1pIhKIiYGicpT102vwOEYSx9gV0LHqJAT9Y0gZMFStHN57I5AOvMUe8wyYvV0QY6pgFbMiwGH4nteJbMLFQOmVJ%2FYvPhby6%2F%2FTi6NFTka0EEMo8%2B%2F947PHsueKzQYuHcHiyMuuQ9iiYAhKccAjGy6QnA4mVpbWKxUleG5CNLuOihffrmJC%2BRm881ABZoR%2Fw3lKyzRtNso3SBd3NJwQomTmMCFMwviNYctpVHcrW04ok9bNYgrx5J5pfmsD%2BmIVW6QxECqpl23MF60%2FcmtZsRmNZ2LO9hNYE4&X-Amz-Signature=ecedcf177693c9df58de8a728bafc9e8c44ef713e8ebbc2494f8b5e0ed42c629&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667YFTEJHS%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T144040Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGTJ%2Bpb%2B%2BbEdH%2BmroUM91m5Hn%2BgwpK7dzxgYiIAvbrKEAiB4P2mo2LNjHFt8e%2FHhlRwOcpO3q%2F%2FeMEb6yOOK1wVfQCqIBAi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMe2p2lIbGKvzWwZdmKtwDpS9igxpyPC07FZ1wBqe%2BVlgHAdXgOrYNEjG5q1dR2aiZ8rOJw7xKe5%2B0M8FlnpNeX8Z7oJHpulx41i3tc3nNTEWMo6hencfRkJTm56deOo%2BKTWAj2gchJfLuOuf%2F55gSO225OrJ9Eq6lyOvYEk7gfD%2FoHeVWI5%2B3pRZiJ9Upd72xNobSwJY5Pk%2FVxzelNJNSoBmdo4yKQiOuxMCbm6zeBTIkv%2BJSsd%2FXSpbUkojiWj%2Fq7WemkJ%2F25vAgGnsIXKZkvhtEk%2FOQC3Scje0J%2BigktTiajRDS%2FH9rm2jepcHGwdnglH8QQ3j%2BXc1Wh4nXpwXhjuhOtlWBxULb%2BZCm90MBJpsrTIaUDrNGuj4gZImhwcpefayYM2T1Wk9CvGec4ANbz4FDeo1qmztzT2FI1K4s5EmBGoLd%2B8tmlnO11dpff8R5BM4bspXSqqSgiZOfGrmRClS8SExno3l%2BgeOiVDrV0FY%2F%2FkpNy7x7b57%2FNt%2FHMymnl5BYU923jdsAp2KVdkdPqClOhsYER171deEZCFyK%2BWZC9XQ4jOw01nja%2FwOwn2ImyuFKOe08Tcd5HDbqtEbRt%2FFm1pIhKIiYGicpT102vwOEYSx9gV0LHqJAT9Y0gZMFStHN57I5AOvMUe8wyYvV0QY6pgFbMiwGH4nteJbMLFQOmVJ%2FYvPhby6%2F%2FTi6NFTka0EEMo8%2B%2F947PHsueKzQYuHcHiyMuuQ9iiYAhKccAjGy6QnA4mVpbWKxUleG5CNLuOihffrmJC%2BRm881ABZoR%2Fw3lKyzRtNso3SBd3NJwQomTmMCFMwviNYctpVHcrW04ok9bNYgrx5J5pfmsD%2BmIVW6QxECqpl23MF60%2FcmtZsRmNZ2LO9hNYE4&X-Amz-Signature=a1ee6bb5482d35b8d59bb150b46fe3f938d3071e57c340273bbf266ae01e4db3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
