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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VJ2QWFOJ%2F20260104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260104T061805Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFsaCXVzLXdlc3QtMiJHMEUCIHp3Zs%2Bw27ya4CxPwJzhieI8uhSN05I%2FSfQ%2Fm533dmQFAiEAt1LcLUTIqUOzQ%2FQ%2BGkSpAXWuQ6fi4FG7kQ9BPeWWCe4q%2FwMIJBAAGgw2Mzc0MjMxODM4MDUiDI1L2iiIxMXmJhZ6syrcA85mH7fTGdTQ4RGpV4z3n0dXbWU2NcoxoAQ0y%2BwHuu6cqBAiozFmFmYLw7qqRGw5e6AP1YyACunkqaHaGxEFBjxrXkfAol2AIMcuY7K3dB%2FX%2BDIt68lxpsL1B7BOLM8Bp3RVL8GsDt%2BEjakWbXh1RR7x7ZgOnORQHStys4WTYv%2FHS%2FfYbOw9cOPqe4xf9P1kyk2X%2FoNPXlTZC3aL8NxYJj5nwtUWw9Jqz6mMHzZ8nzIacdl74yqtcHOsJwLy1ZqLiPvcU29Vv8S8etGt37L6mkhqcXtSkDttwLWp9FfK%2FBrChdmAA9xDzwlrihtkp9QexTOG4B2Yj50UpI7JTGdF5L23%2FH8x0LuLQZ3dz8rF3W3KoEo4fu8toYLY2wFVv%2FdR7JlJJ5jCXUkqnHOPkwWckcd24aUodzJgAhnoGbK3hB%2FWDXDlHFNnS4U1jsX8uepPewz6mCUcGhID4XzavgiKJ44uKF495u36%2FaW2PxXzXc3p3g39upOTvdxYdFoYcMdArmodWashgQLIo2AA%2BP7Q0IkgOwPb2jAIT8VJEXh5fYfc9%2BOriPSrnyjAJXx8GsT5nzVM8LLGiLoECX6oX%2BSiF%2F1hkyRHyIZTHxn8gktcmZ%2BLi4nvFdVhA5ga3zl4MI6258oGOqUBADA1m8ba%2B3hKmP5Tg0WxzvpTi%2BhzPS1bUyBRj9DiAaaT9ZTDsFXCLBxuRPOQGHci4cmDXGnLQIdGz%2BC6u%2FCFrRDFT4vwLD1d1Wx9nxJT2jz8YHy9ZNOLm3H69V925MhpJX2pbGAtdF4%2FD1yanbvSleEXj%2FZTebP8GhHEG5sSBYx5bYYc3OV3X0VcMCMV%2F30Q3jODKDO6e9GcZrvA5CcaAN2t9nQJ&X-Amz-Signature=7534acdc1eec3868c243f4c799b8b10ccc91ce6b6fb68e85cde5c32f16dbfa65&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VJ2QWFOJ%2F20260104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260104T061805Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFsaCXVzLXdlc3QtMiJHMEUCIHp3Zs%2Bw27ya4CxPwJzhieI8uhSN05I%2FSfQ%2Fm533dmQFAiEAt1LcLUTIqUOzQ%2FQ%2BGkSpAXWuQ6fi4FG7kQ9BPeWWCe4q%2FwMIJBAAGgw2Mzc0MjMxODM4MDUiDI1L2iiIxMXmJhZ6syrcA85mH7fTGdTQ4RGpV4z3n0dXbWU2NcoxoAQ0y%2BwHuu6cqBAiozFmFmYLw7qqRGw5e6AP1YyACunkqaHaGxEFBjxrXkfAol2AIMcuY7K3dB%2FX%2BDIt68lxpsL1B7BOLM8Bp3RVL8GsDt%2BEjakWbXh1RR7x7ZgOnORQHStys4WTYv%2FHS%2FfYbOw9cOPqe4xf9P1kyk2X%2FoNPXlTZC3aL8NxYJj5nwtUWw9Jqz6mMHzZ8nzIacdl74yqtcHOsJwLy1ZqLiPvcU29Vv8S8etGt37L6mkhqcXtSkDttwLWp9FfK%2FBrChdmAA9xDzwlrihtkp9QexTOG4B2Yj50UpI7JTGdF5L23%2FH8x0LuLQZ3dz8rF3W3KoEo4fu8toYLY2wFVv%2FdR7JlJJ5jCXUkqnHOPkwWckcd24aUodzJgAhnoGbK3hB%2FWDXDlHFNnS4U1jsX8uepPewz6mCUcGhID4XzavgiKJ44uKF495u36%2FaW2PxXzXc3p3g39upOTvdxYdFoYcMdArmodWashgQLIo2AA%2BP7Q0IkgOwPb2jAIT8VJEXh5fYfc9%2BOriPSrnyjAJXx8GsT5nzVM8LLGiLoECX6oX%2BSiF%2F1hkyRHyIZTHxn8gktcmZ%2BLi4nvFdVhA5ga3zl4MI6258oGOqUBADA1m8ba%2B3hKmP5Tg0WxzvpTi%2BhzPS1bUyBRj9DiAaaT9ZTDsFXCLBxuRPOQGHci4cmDXGnLQIdGz%2BC6u%2FCFrRDFT4vwLD1d1Wx9nxJT2jz8YHy9ZNOLm3H69V925MhpJX2pbGAtdF4%2FD1yanbvSleEXj%2FZTebP8GhHEG5sSBYx5bYYc3OV3X0VcMCMV%2F30Q3jODKDO6e9GcZrvA5CcaAN2t9nQJ&X-Amz-Signature=f9ce7daf3a367f0bff45766c3bd90077530e1e9ee066f7be3f607384304ab33a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
