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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RVEHGOA2%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T113240Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJHMEUCIBHP7%2FWmxMUFqphmwB5HHXUzJHwlf%2Fi3FjR%2FfXc5WuzBAiEAu%2Fqu4Q3zqEAlrVmXQxsL3QorL%2BvedOV%2FHOuZASX5fDIq%2FwMIBBAAGgw2Mzc0MjMxODM4MDUiDOpO3LDWFhjcHJhpSircAxB8IbOCQkGgsHFtqnPGRAfab8xwgixCtUU8EyaNMQ2n0ElVdeNIY7pMPuO7pIwf0zA6PdKtKTzMk4vSQkTimLGC2AaPtuJ6Zr%2F%2Flls0G0VbWym4SjR361H5QQcf3SE9RYCFbtpA6jX5awhZlOX18Tz%2F1au7%2FKXTLzjwl3pgvfvcy3U8fDB20l%2B2Vy6olwxTJbVDZlfTKM9HcjvWV84lsD5ck5SO%2BwehwxOXGP38qb0%2FfeCeVyg5ZIbw%2BTPty8lzcEcHAXvzPVr5CCYTgTfe2cJHrch%2FZBJSzeOibGVY5bKZoiL5Rrrwy49MorQgKmnORV5nAn%2F4fJHMr2ntvCGzXsj%2Fs88qtRyILQbRsKDALPyAys%2BUF96P9ndw50jLS8hdTKUa5N0ihrrZuqBsgqtFJBm%2BzRbt6LKvhy%2FlwDIFiXIQQG0ThLihmuz2g6s0BP1vj7ED%2BZHpPnPbMCZ78wQG%2B9klqi0xVaLNtuwU2%2FkA4QcV3O7U4u%2BGElGEgJteUoFYMk%2BxVtWeVsq%2Bf6ZRx46ZaTD%2BFcKIbh03CnhbJBMyGr5JIkioWj0ydwUa7cwaMqXUsdX5HSR9vYFpqomJTMcq%2BKXrsoaxWYAax%2FVjN84zL6KZg3FfzzafW2gU%2BW%2FSMO6f5NEGOqUBP6alJH1EW%2FWWxyhan9czFHTy1nlzK7awIk3IibpK3Nv9hBiIBV6qmZWdCpSQ8Q1WLGa3YjDQExtXkRakUUoc2bdFxlu4MbfZbunn4pqcZEL3ni0kFlNahaQwQ71SC2OatMOGbsC%2BCKHHmFlj0dRGqvQkxms3Cb3mbLbAlGidA%2FCdVY46q0JyHF30mxRpa2Xn69P%2FI1lOiWiC9myQWhjra7DU147g&X-Amz-Signature=1dec7d2c961fc89988f1f331048884994e45fe86d5a6c1df6930bb2df19d6b11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RVEHGOA2%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T113240Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJHMEUCIBHP7%2FWmxMUFqphmwB5HHXUzJHwlf%2Fi3FjR%2FfXc5WuzBAiEAu%2Fqu4Q3zqEAlrVmXQxsL3QorL%2BvedOV%2FHOuZASX5fDIq%2FwMIBBAAGgw2Mzc0MjMxODM4MDUiDOpO3LDWFhjcHJhpSircAxB8IbOCQkGgsHFtqnPGRAfab8xwgixCtUU8EyaNMQ2n0ElVdeNIY7pMPuO7pIwf0zA6PdKtKTzMk4vSQkTimLGC2AaPtuJ6Zr%2F%2Flls0G0VbWym4SjR361H5QQcf3SE9RYCFbtpA6jX5awhZlOX18Tz%2F1au7%2FKXTLzjwl3pgvfvcy3U8fDB20l%2B2Vy6olwxTJbVDZlfTKM9HcjvWV84lsD5ck5SO%2BwehwxOXGP38qb0%2FfeCeVyg5ZIbw%2BTPty8lzcEcHAXvzPVr5CCYTgTfe2cJHrch%2FZBJSzeOibGVY5bKZoiL5Rrrwy49MorQgKmnORV5nAn%2F4fJHMr2ntvCGzXsj%2Fs88qtRyILQbRsKDALPyAys%2BUF96P9ndw50jLS8hdTKUa5N0ihrrZuqBsgqtFJBm%2BzRbt6LKvhy%2FlwDIFiXIQQG0ThLihmuz2g6s0BP1vj7ED%2BZHpPnPbMCZ78wQG%2B9klqi0xVaLNtuwU2%2FkA4QcV3O7U4u%2BGElGEgJteUoFYMk%2BxVtWeVsq%2Bf6ZRx46ZaTD%2BFcKIbh03CnhbJBMyGr5JIkioWj0ydwUa7cwaMqXUsdX5HSR9vYFpqomJTMcq%2BKXrsoaxWYAax%2FVjN84zL6KZg3FfzzafW2gU%2BW%2FSMO6f5NEGOqUBP6alJH1EW%2FWWxyhan9czFHTy1nlzK7awIk3IibpK3Nv9hBiIBV6qmZWdCpSQ8Q1WLGa3YjDQExtXkRakUUoc2bdFxlu4MbfZbunn4pqcZEL3ni0kFlNahaQwQ71SC2OatMOGbsC%2BCKHHmFlj0dRGqvQkxms3Cb3mbLbAlGidA%2FCdVY46q0JyHF30mxRpa2Xn69P%2FI1lOiWiC9myQWhjra7DU147g&X-Amz-Signature=a99c1dc07be8f82cac964e415d2818291714b59303eaa0141de6c647b85b59a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
