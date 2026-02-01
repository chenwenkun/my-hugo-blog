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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XVYC3FPK%2F20260201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260201T063708Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHfXXErSLGc8i3rJED3dWWdeoDmdduQK0dzHDp7aRDkGAiEA0R8DeCcLa0%2FwgVW%2BGk68eYi%2Fxy%2FG08SJI4NbgjNDhkcqiAQIxf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBfOxbKwUrBR7Kqe9SrcAyNSd2ZhOOxQbnupi%2F8%2FlKPj%2BbqQVRboq%2BQHOoaZOBDfdlJsLZL%2FmYFdmSH6iYpK3Z%2FIxigMpriRZ3%2Fa4F2s%2BbpLHNJrei03RWJGVcvLgkiYmjib54mGKDup6SSMGeWeXdTj90qluTbR2DOo6M0nguAvi1uDI%2FTVipQgGsh1JZp2%2FxtPyUU%2Btx5dlzoGZw%2Blss3JV8pTdaQUbY4jWvYEQYUs8oy4FoDKmzOAa2NiMwObNaqQIOzm%2BKm%2FNzvyzx3v43%2FxSn3vy4VodZHpBSHoJ7jEoAmetLosfupJVJ27tihqL4vQaS%2FTEGnlj2CbLL6LJuIbmNtDz8ZywVWl9W7c%2FVIUUk73lUK%2FGxGUbmniRiDR2EKD6xAMniBEY7EDe2V1cafzOr3tX9D6O%2B04qqKrduGgvFyIR4%2Bf51HGOpfiMcSA7GgD9OX6QjzkNE3hKBmP6mHgR4F1TEwSdw%2FXDudqwEawcJxNfT0XVUK2gPwxI5tknzERBJyuoOXIG65%2BakiIA7398V0DMhe6cpp9iaKxgy4N%2BbV8f40xbH2srdTtOquVFzY5qZwyZlSSSZC8owGsrvN1hXtIu52hNE8JVA3gNHQZF0StTWGDL3%2Fgmy8oWOT3Wp4cdORSwdHmsspZMKCU%2B8sGOqUBw%2FoiOwgP%2FhsLUaHOaPuh%2Fcn7MgC5hGmD2TAYdGckCc96moveh02iO8fBRUSJdv5iXJacgVa1v4vWVLSAztn%2FThd79%2B3TIqzUzUuxDk0lsQ2Eqjlp%2BQC1HKh166BkDbHjsKHHQHsUvqPuVPDlgSmICvCii8rLhjXpLmXK8clmSe1nu6Bbb33ftJ4GRXysicUaBcTfJsE9tCA4uPfslG%2BSF1cKPba1&X-Amz-Signature=58139378bfb48214a02fa79197a6fe5e40c0d16b36882957b4095b11c1747491&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XVYC3FPK%2F20260201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260201T063708Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHfXXErSLGc8i3rJED3dWWdeoDmdduQK0dzHDp7aRDkGAiEA0R8DeCcLa0%2FwgVW%2BGk68eYi%2Fxy%2FG08SJI4NbgjNDhkcqiAQIxf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBfOxbKwUrBR7Kqe9SrcAyNSd2ZhOOxQbnupi%2F8%2FlKPj%2BbqQVRboq%2BQHOoaZOBDfdlJsLZL%2FmYFdmSH6iYpK3Z%2FIxigMpriRZ3%2Fa4F2s%2BbpLHNJrei03RWJGVcvLgkiYmjib54mGKDup6SSMGeWeXdTj90qluTbR2DOo6M0nguAvi1uDI%2FTVipQgGsh1JZp2%2FxtPyUU%2Btx5dlzoGZw%2Blss3JV8pTdaQUbY4jWvYEQYUs8oy4FoDKmzOAa2NiMwObNaqQIOzm%2BKm%2FNzvyzx3v43%2FxSn3vy4VodZHpBSHoJ7jEoAmetLosfupJVJ27tihqL4vQaS%2FTEGnlj2CbLL6LJuIbmNtDz8ZywVWl9W7c%2FVIUUk73lUK%2FGxGUbmniRiDR2EKD6xAMniBEY7EDe2V1cafzOr3tX9D6O%2B04qqKrduGgvFyIR4%2Bf51HGOpfiMcSA7GgD9OX6QjzkNE3hKBmP6mHgR4F1TEwSdw%2FXDudqwEawcJxNfT0XVUK2gPwxI5tknzERBJyuoOXIG65%2BakiIA7398V0DMhe6cpp9iaKxgy4N%2BbV8f40xbH2srdTtOquVFzY5qZwyZlSSSZC8owGsrvN1hXtIu52hNE8JVA3gNHQZF0StTWGDL3%2Fgmy8oWOT3Wp4cdORSwdHmsspZMKCU%2B8sGOqUBw%2FoiOwgP%2FhsLUaHOaPuh%2Fcn7MgC5hGmD2TAYdGckCc96moveh02iO8fBRUSJdv5iXJacgVa1v4vWVLSAztn%2FThd79%2B3TIqzUzUuxDk0lsQ2Eqjlp%2BQC1HKh166BkDbHjsKHHQHsUvqPuVPDlgSmICvCii8rLhjXpLmXK8clmSe1nu6Bbb33ftJ4GRXysicUaBcTfJsE9tCA4uPfslG%2BSF1cKPba1&X-Amz-Signature=ae1fb98c350bb1b4d2d1c430557c0273bdb66580b7ab15a15b8e4b2d876ab5e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
