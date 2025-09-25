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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667DJF76BC%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T085606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDL1%2FTeS4l23AvFaZqd9CvzZr%2FyM4GUeo2Zx6i1K00UmAiEA41kba%2B1ji4tEO8ENtSBoi5PxeJxTJAbMnDowts0lT54q%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDJRdgCSjjQd7DVKeeSrcAySQvabXWtRB6afkPNrVHgi5zKlu2GJQUDj4mi0OWIZE6C3AqSK8NsPzHaaf9vM0j3OKLtiIhVTdGT%2FG1fHtnWmEwHGwi9s4Hwqqv0UhHmmNDTTc9jtpCuqlHcMCr2uO39ChWON1L7FHXB%2BzRjG1hW%2BR8I05zG9fag4nvGhLTBR4N3cUWqeYf9CgDNJGFaPeuhm%2F24uJ%2BD4UPn%2B%2FFE1B%2FPiyvStMeXJd65ylynfoN2%2BaltSSIHkFYI8Fr5pZof7DyimULwvfes52fgxiO1IZX3dAQVqFvui5rvNqgVQCN3E%2Br39gfom9WTXy%2B3zepK4Nt73xYBkp7K2bjq%2FhbfKg7%2Bp%2B%2ByT9uqFnT0n7a392GNeI17ytbOlF9ICfFpRSENh14E3Tv3NfNE33XZEi9CLsvdTvP4XlvWS3t3XuyqPPbGnUoMW2WokAlInhd9TQOTtkYos6Q5OnGKDBf8uAcM%2B%2FhbKNYg%2F01MMTQ890pQDf5OtVBho%2FefQJryjarsK41X1r1%2FsKMrWt1lkfv9gY%2BENyeuj9kemhviy02X285eac%2BjAEXK5pWaeYUSV5tXKOyWkLEbJLnk8YsFrWlXIymBRNdFA076jmwUmAOWOj4RNIwRNhOthr1zQ4jzSJ9tBbMLSE1MYGOqUBYyqlBdzS0EyLJV%2FGH6PZ%2F5vIVHUht%2FBTZmvtHWVwzdKUbSQYnvOEAOTCQyXXBmq4YuhEcPRDZQI9i0SFeFbmDqCTfes2AUqc02TQXMUo%2Bng0vuediCC%2BkI1FbVaUzDKc%2Bq9kfy0vJ081VBEdt0xlIFd01oUtops5zK5FTP%2Fa6O9nfwI4SVZvX8tEougCytVkZlp0goi0PLDxUNgv%2Bi1cPsHMEdqS&X-Amz-Signature=8999e4f387a66638de5c77db9d12dacd1b689e0ac4ed741395f82a1de247c071&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667DJF76BC%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T085606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDL1%2FTeS4l23AvFaZqd9CvzZr%2FyM4GUeo2Zx6i1K00UmAiEA41kba%2B1ji4tEO8ENtSBoi5PxeJxTJAbMnDowts0lT54q%2FwMIchAAGgw2Mzc0MjMxODM4MDUiDJRdgCSjjQd7DVKeeSrcAySQvabXWtRB6afkPNrVHgi5zKlu2GJQUDj4mi0OWIZE6C3AqSK8NsPzHaaf9vM0j3OKLtiIhVTdGT%2FG1fHtnWmEwHGwi9s4Hwqqv0UhHmmNDTTc9jtpCuqlHcMCr2uO39ChWON1L7FHXB%2BzRjG1hW%2BR8I05zG9fag4nvGhLTBR4N3cUWqeYf9CgDNJGFaPeuhm%2F24uJ%2BD4UPn%2B%2FFE1B%2FPiyvStMeXJd65ylynfoN2%2BaltSSIHkFYI8Fr5pZof7DyimULwvfes52fgxiO1IZX3dAQVqFvui5rvNqgVQCN3E%2Br39gfom9WTXy%2B3zepK4Nt73xYBkp7K2bjq%2FhbfKg7%2Bp%2B%2ByT9uqFnT0n7a392GNeI17ytbOlF9ICfFpRSENh14E3Tv3NfNE33XZEi9CLsvdTvP4XlvWS3t3XuyqPPbGnUoMW2WokAlInhd9TQOTtkYos6Q5OnGKDBf8uAcM%2B%2FhbKNYg%2F01MMTQ890pQDf5OtVBho%2FefQJryjarsK41X1r1%2FsKMrWt1lkfv9gY%2BENyeuj9kemhviy02X285eac%2BjAEXK5pWaeYUSV5tXKOyWkLEbJLnk8YsFrWlXIymBRNdFA076jmwUmAOWOj4RNIwRNhOthr1zQ4jzSJ9tBbMLSE1MYGOqUBYyqlBdzS0EyLJV%2FGH6PZ%2F5vIVHUht%2FBTZmvtHWVwzdKUbSQYnvOEAOTCQyXXBmq4YuhEcPRDZQI9i0SFeFbmDqCTfes2AUqc02TQXMUo%2Bng0vuediCC%2BkI1FbVaUzDKc%2Bq9kfy0vJ081VBEdt0xlIFd01oUtops5zK5FTP%2Fa6O9nfwI4SVZvX8tEougCytVkZlp0goi0PLDxUNgv%2Bi1cPsHMEdqS&X-Amz-Signature=02c0555fc3a0365b6d81d1b7d8e5e84ac5aa2911c3d5e9a9da30495ae1beed4e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
