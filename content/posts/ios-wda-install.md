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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663TZQRQEO%2F20251001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251001T005617Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHAaCXVzLXdlc3QtMiJHMEUCIB99Z0cvdP6TP1vr6ULTA23qWsyYQagm7SiTiBBeM2gwAiEAq2AD0r14peY0AjAl5lQlW5hkQTwwiVtjjwoK%2FgAFvWsqiAQI%2Bf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDND685sUrs4tBIFh1SrcA%2FVtrxtY1QWUK4I7ec9UuxlhXix8mJVLx3MP0bu9KQYjiFlmI8i9Xely0EbGhT2G8O81%2B7LuZqM7VSRS9LOyTZkYuGyNnJ066BYoWZCkbREB6OWe5fH8GrtkXwKkhkI%2F8WMI1VLbvuMM9Eob%2BFsVXdIQ7nc%2B0RQZYIozOdGieRnCX7Hp75FOJXjL3EP8wqZ6%2F6uaG0HS%2FZZ5MkW%2BBLqyqE3vRwsA6OII5YpUhwpedo2lxj3IZ8fByQPvH3gUQt3Ti9YEiAszzD5UpifJp4znyoonzkL4g4mDqRg3JkMRyCp2JwwULH7oOEVWgO%2BXiTXYCBrnuDN5GIeuACgjd4eK2A2X%2FP6FMcwJ4dP9rgDtmo18WY4yLS7TpLhOONOaqcOtevDPExp3GgVjE6W%2BVHWsBkGpffcfRwJC8N03Hn25%2BC7GtcIQMAE6KA3vVzm9nK7EoPpByUCyK5JR4kFg9TDu4H2QkwAp4cmucC16zCGh9VutLsNv%2FC9jMaNLY%2Fz52qsBA8MxNB8XI%2F1u8dTUDrF1zB3cKb22TnZwQrf1uPKIAUQd7Mo0iik9hZEfl6lpbVpL6MneWAtThdGp3D9Lh0mZS1k1bJei%2FZlGyZkUBqclQY%2Bf2W3XDAHEIW0puHN0MILf8cYGOqUBJ77XcDfn5Uu4j%2Fon1QrFRaS02%2FMRE%2Bw4eHjFJd8c9Kk9RBvvGatz0v3g90nukt1J9nE61d64HsYRyONVMeWK6Hozv9w1p1Unuuuoh5aHZ2kVmJgJMeODAs779GDAkTwQmagic8zoD1aaqwzZqLuhi3lZito7kJPZt2cX0tODC6VEhLirdEBCI85lmB1JeQL5FROzINAjdaC19UtvkM3M9cMfzVYa&X-Amz-Signature=64d2a79af9ed966a46c1f1becb1f8d9f1f0f52e918cd8b06e5483abef02537de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663TZQRQEO%2F20251001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251001T005617Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHAaCXVzLXdlc3QtMiJHMEUCIB99Z0cvdP6TP1vr6ULTA23qWsyYQagm7SiTiBBeM2gwAiEAq2AD0r14peY0AjAl5lQlW5hkQTwwiVtjjwoK%2FgAFvWsqiAQI%2Bf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDND685sUrs4tBIFh1SrcA%2FVtrxtY1QWUK4I7ec9UuxlhXix8mJVLx3MP0bu9KQYjiFlmI8i9Xely0EbGhT2G8O81%2B7LuZqM7VSRS9LOyTZkYuGyNnJ066BYoWZCkbREB6OWe5fH8GrtkXwKkhkI%2F8WMI1VLbvuMM9Eob%2BFsVXdIQ7nc%2B0RQZYIozOdGieRnCX7Hp75FOJXjL3EP8wqZ6%2F6uaG0HS%2FZZ5MkW%2BBLqyqE3vRwsA6OII5YpUhwpedo2lxj3IZ8fByQPvH3gUQt3Ti9YEiAszzD5UpifJp4znyoonzkL4g4mDqRg3JkMRyCp2JwwULH7oOEVWgO%2BXiTXYCBrnuDN5GIeuACgjd4eK2A2X%2FP6FMcwJ4dP9rgDtmo18WY4yLS7TpLhOONOaqcOtevDPExp3GgVjE6W%2BVHWsBkGpffcfRwJC8N03Hn25%2BC7GtcIQMAE6KA3vVzm9nK7EoPpByUCyK5JR4kFg9TDu4H2QkwAp4cmucC16zCGh9VutLsNv%2FC9jMaNLY%2Fz52qsBA8MxNB8XI%2F1u8dTUDrF1zB3cKb22TnZwQrf1uPKIAUQd7Mo0iik9hZEfl6lpbVpL6MneWAtThdGp3D9Lh0mZS1k1bJei%2FZlGyZkUBqclQY%2Bf2W3XDAHEIW0puHN0MILf8cYGOqUBJ77XcDfn5Uu4j%2Fon1QrFRaS02%2FMRE%2Bw4eHjFJd8c9Kk9RBvvGatz0v3g90nukt1J9nE61d64HsYRyONVMeWK6Hozv9w1p1Unuuuoh5aHZ2kVmJgJMeODAs779GDAkTwQmagic8zoD1aaqwzZqLuhi3lZito7kJPZt2cX0tODC6VEhLirdEBCI85lmB1JeQL5FROzINAjdaC19UtvkM3M9cMfzVYa&X-Amz-Signature=de3b24c73097614bd0307c96db51db39a1556a6024b3fd56064c8a3b4e3dab36&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
