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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S3K7Q4ND%2F20251107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251107T005302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsgnB6vZ2Ab7lRC86QVSyVZIKNg5AjQmbce8WDVtyuOAIgGlysKfUrhnCEDfmjgnvJLoI0aNcSE13hhP7ICbF%2FXr0qiAQIsf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFLhP2WCvDobQKfVLSrcAwY%2FyEOMtvdWhd3iF4XZcCVA69zSmHf4W%2FKDW9IvMas%2BrILItrsxltJjs2R8h5N9YJVPQ6RQl4om3jhk5DrllwOUxtE8Di7dhnF7EAkav0S98Oq8FtpQxeG8GsbS5rx0aVLju9bWG6bHICBtHPQToutJPKWPtG%2ByUQeud%2B8RRGzjg%2B1gGtR5IaHeJ%2FcKeOUW%2FcZweR27kRO4MArLxayXOAizpCYqgw%2BfPcTB%2FgeAdjF4ddCkX98wWOaP%2Fu47AwOTJD7z1Zry3lavcT5io%2FIBGa4ESIiUM%2FtBVVqLWXg58OTD8UBzR2oymV1wUidpe8jVpN9SiP3IFTHDdWxaan2nH9ZYAxW%2FZ67yTXgiQLyNxLvpkQUKAbJJN3pakcsyrlrG9oK%2FbKd36jQdTwczrfYXCG3t8%2FWos%2BA77wBiTQLsFIW9fxSNyzaBZz9zJi3t7zRyVc1mCItgrbHlcl38oY%2BexVgyDcQunMySZ7en3U5iHid%2F2byVNwlzJ3ZulnhPou0yC70qhZuu4cuqYbcwPjtOj9VnLueN0iqMDey1bvP%2FeY6sR2oeAl%2F5kIos7uHSK8HIYHLTRtR0%2FVp79%2FACs7EGfyJhFpYBTMGyTSXGMNvrz59Ada64mQeIbThZtVQLMOT2tMgGOqUBtFrS16aL5aVNpkOyiAC0QJziaY0TyLPYBE0Sx5tR2bGsN5dCPQeOwP7Ki6Lw2QleWt9x4xZqq%2BdA6bPomKDbGfpmJ6eQ8WiLBvhMfE4FWVxo5svl3by5iGSmtxbS3dLavn1ujicZwvLNMSQpV4r6U35sE3UHGZD24TlaON63EyEia14HNDXOy4EXzvDOvM95AXxzPXftUFsY%2Bx80UVVLSn3d2%2FHE&X-Amz-Signature=065371257297d5f41f1256b9a88a920ccf201ad7e73e18b840e29c68ba055794&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S3K7Q4ND%2F20251107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251107T005302Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsgnB6vZ2Ab7lRC86QVSyVZIKNg5AjQmbce8WDVtyuOAIgGlysKfUrhnCEDfmjgnvJLoI0aNcSE13hhP7ICbF%2FXr0qiAQIsf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFLhP2WCvDobQKfVLSrcAwY%2FyEOMtvdWhd3iF4XZcCVA69zSmHf4W%2FKDW9IvMas%2BrILItrsxltJjs2R8h5N9YJVPQ6RQl4om3jhk5DrllwOUxtE8Di7dhnF7EAkav0S98Oq8FtpQxeG8GsbS5rx0aVLju9bWG6bHICBtHPQToutJPKWPtG%2ByUQeud%2B8RRGzjg%2B1gGtR5IaHeJ%2FcKeOUW%2FcZweR27kRO4MArLxayXOAizpCYqgw%2BfPcTB%2FgeAdjF4ddCkX98wWOaP%2Fu47AwOTJD7z1Zry3lavcT5io%2FIBGa4ESIiUM%2FtBVVqLWXg58OTD8UBzR2oymV1wUidpe8jVpN9SiP3IFTHDdWxaan2nH9ZYAxW%2FZ67yTXgiQLyNxLvpkQUKAbJJN3pakcsyrlrG9oK%2FbKd36jQdTwczrfYXCG3t8%2FWos%2BA77wBiTQLsFIW9fxSNyzaBZz9zJi3t7zRyVc1mCItgrbHlcl38oY%2BexVgyDcQunMySZ7en3U5iHid%2F2byVNwlzJ3ZulnhPou0yC70qhZuu4cuqYbcwPjtOj9VnLueN0iqMDey1bvP%2FeY6sR2oeAl%2F5kIos7uHSK8HIYHLTRtR0%2FVp79%2FACs7EGfyJhFpYBTMGyTSXGMNvrz59Ada64mQeIbThZtVQLMOT2tMgGOqUBtFrS16aL5aVNpkOyiAC0QJziaY0TyLPYBE0Sx5tR2bGsN5dCPQeOwP7Ki6Lw2QleWt9x4xZqq%2BdA6bPomKDbGfpmJ6eQ8WiLBvhMfE4FWVxo5svl3by5iGSmtxbS3dLavn1ujicZwvLNMSQpV4r6U35sE3UHGZD24TlaON63EyEia14HNDXOy4EXzvDOvM95AXxzPXftUFsY%2Bx80UVVLSn3d2%2FHE&X-Amz-Signature=e6ec539f5b02a2622d52c82b9b8ecfc5a3e327f657e22a7263a692eb63f7afdf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
