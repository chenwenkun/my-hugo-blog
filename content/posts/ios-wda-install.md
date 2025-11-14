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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SGTRTOI%2F20251114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251114T122215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDSyIUOSTnkKMd6LnCxmhSyr28LTv%2FS9R1jnbB2uR12JwIhAKI90pu%2F1ZH5mo4Nfy0sbd46p8s5pAbYwqpX5ueYwhZEKv8DCGUQABoMNjM3NDIzMTgzODA1IgyOfLOwmCK94saaY7Uq3AOw54FdI%2Fn2Plz5btiQUEGIfAxO1rsrAUVkPB3EsI3NWyq1CxGa5LHoj9wjwNgVPYg8TblzrH%2BQ6uCa0%2FoM85CHZ0iqcShkS5v07NkFNJqLPep0CNZirFCQCxgeEe1mUj6EGOJbbMITqweqWi1gGqSn6nwmlcpKh1A6Tn5z4D33s3YP4IvtqHc2RTI%2FzaaidM3Fg64eL%2Fzu%2FzTqx8Qla%2FESvd%2FgEc%2BV0QO8qMqTn0cF9%2Fq7rqNuxyk3FhC2Uwr7iLHFT8AOgBpzhjwfSYAcbIC0IfnduN0l%2FiaaNMeAIYvFQG7yD9LeqWWPXlCyr2mm1b1Jc%2B7oEtQod9bQ9znTQo4hlHyQiTetKDkIFbtfOoVp%2Ba%2FKWCrfZywOkqOATSX0Psikxpl%2FLKm5knkrDOnwFfhDs8pjMmcl23%2BYXi3r0Vd7bfCJo5h1%2F7JcoByoMPUXs%2Bz8jRk2vtimB7%2FQrnMIi4aumE2zh5DciAW4x5u145RUjdcG8qDutOs%2BtkjG6zseJEer7gETrA8dRVOmFvm6aoyu0mGuH63hFGScjQlQgPi%2FtCTgNFOrq%2BDUBqjgBEscxdZX6qPvjFT6xfoKhrhE%2BDViiNmsJ2DxKj11gYsS98y1%2FnJlNx%2FkGVTUso%2FojzD8stzIBjqkAc4rphJ%2Fy7LeXrmmldWAgWQqQgKYskmDWbyMe7vfi91K%2FQwRvEgPT5bFtSqdEYWZxL2Crtm54MmwbDvP583mrIEAjVMaK%2BtTyZi30qRUPCQIvlrLKq8Y0PdTpPTDlXUPMRrRLzpQl5YMfiXgwp1vXddm7oNPHEpWVfZZfwFvRSAoFSHAEIPhnDfhJWLOSMeNkM5s7Nq0bhTKwqzAu%2FnhQmyjbwTj&X-Amz-Signature=5d0bd70d61b2d3f96e6481d829171bdd48f5bfd6b6daa30e5d3b0bdabb0eaeb9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SGTRTOI%2F20251114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251114T122215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDSyIUOSTnkKMd6LnCxmhSyr28LTv%2FS9R1jnbB2uR12JwIhAKI90pu%2F1ZH5mo4Nfy0sbd46p8s5pAbYwqpX5ueYwhZEKv8DCGUQABoMNjM3NDIzMTgzODA1IgyOfLOwmCK94saaY7Uq3AOw54FdI%2Fn2Plz5btiQUEGIfAxO1rsrAUVkPB3EsI3NWyq1CxGa5LHoj9wjwNgVPYg8TblzrH%2BQ6uCa0%2FoM85CHZ0iqcShkS5v07NkFNJqLPep0CNZirFCQCxgeEe1mUj6EGOJbbMITqweqWi1gGqSn6nwmlcpKh1A6Tn5z4D33s3YP4IvtqHc2RTI%2FzaaidM3Fg64eL%2Fzu%2FzTqx8Qla%2FESvd%2FgEc%2BV0QO8qMqTn0cF9%2Fq7rqNuxyk3FhC2Uwr7iLHFT8AOgBpzhjwfSYAcbIC0IfnduN0l%2FiaaNMeAIYvFQG7yD9LeqWWPXlCyr2mm1b1Jc%2B7oEtQod9bQ9znTQo4hlHyQiTetKDkIFbtfOoVp%2Ba%2FKWCrfZywOkqOATSX0Psikxpl%2FLKm5knkrDOnwFfhDs8pjMmcl23%2BYXi3r0Vd7bfCJo5h1%2F7JcoByoMPUXs%2Bz8jRk2vtimB7%2FQrnMIi4aumE2zh5DciAW4x5u145RUjdcG8qDutOs%2BtkjG6zseJEer7gETrA8dRVOmFvm6aoyu0mGuH63hFGScjQlQgPi%2FtCTgNFOrq%2BDUBqjgBEscxdZX6qPvjFT6xfoKhrhE%2BDViiNmsJ2DxKj11gYsS98y1%2FnJlNx%2FkGVTUso%2FojzD8stzIBjqkAc4rphJ%2Fy7LeXrmmldWAgWQqQgKYskmDWbyMe7vfi91K%2FQwRvEgPT5bFtSqdEYWZxL2Crtm54MmwbDvP583mrIEAjVMaK%2BtTyZi30qRUPCQIvlrLKq8Y0PdTpPTDlXUPMRrRLzpQl5YMfiXgwp1vXddm7oNPHEpWVfZZfwFvRSAoFSHAEIPhnDfhJWLOSMeNkM5s7Nq0bhTKwqzAu%2FnhQmyjbwTj&X-Amz-Signature=5c3858ac93045ba991f415edfa2de51c407ec4321f537ddb973a08269dbbc54e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
