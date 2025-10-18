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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QM7IWNLA%2F20251018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251018T061433Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIGOwoZAJFhywJSHEybDABi%2B9QLafoGDzlQ%2BD74drhNqJAiEAm09zTA9qHMvz%2Fw996%2B6EMe8LgJFF%2FtYDLWPaYTolZLEqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAtuC4g74eqoKDNETircA%2Fk9yUA4SlT76IQsCd1qNsATINlWcdYkgLAq%2F110HRvM1zr%2Bug4uV1Nk%2Fj7sBO%2FYhA9%2FsE%2FPWqSFYNljYgRSjJYe8t28J41lZmR3ggxJVDOWhnCmyuLcQ5Htru%2FlUAPOhzPJTP7NWKX%2BQEtRDTH3fYBB1gktwb3OWhh681zQSVyd6bzLeKX1ZOKnwzC78BYixtF%2B0Viyf7xtewDEzH5TDyjS0W8%2FdiAZSYeI7krwd0p14utDB7xOtCxkD%2BRD%2FBFQzWuoQyGhBTlx%2FkVE48RKJIl%2BLZgdlyBOA%2BmRSnlFJPXPbN0%2BGfqZ0GKDlk8BtemAH5YfiO043qo1E%2B4K96tXEoYAFIijLk5WSrg3n8HWv16Hb%2B%2FiPyWJuN8yfxJV9DKevOUWaDBngMmB6KkddZQSsNFQsL07hWXatG59zverVNFpowaYDGn8cwZiZgggtl93J5REvq3bbUM3CerRgCahKzSgQAj95K6Y2gJg24YsM%2BKn6Cpx6g635JR7UCB53Q7Aou%2B20FUVRbiuoT37X9be8BkKJijDO7LlUBV3kfhw%2BWtja8dNoFnyMVblixQ32jk3MZ3GnOkJT6lM%2Bh%2FZeG5axquYdmLZl2TZ07J4bEyCj%2BWtwYFehyB5%2BlyHqoByMPnWzMcGOqUBhyLpTKJAcaK07qciNFZxZdZCGuCVmx7oAkVDcOhTlkQHgr4l8bVRfbwGvN7DqzHkNOt2hA%2FD98tNpnWc0Yz2otmtiznbMBJ8dXYb%2FZh2ThATTkpy0uhbdqrNWZGiPgOEyurqiio3abf5hcAyFzla%2F%2FWSuuokujMvsUd2x3A%2FJGueuhWA3zv01I27TSzA4EXPLmZugYRbm5aznCZkTbgJPwYE8WdD&X-Amz-Signature=635a2a0a8af4d6e12f4d6bc52d5c5332a8f5a4fbe914498d8c72c298350d0aac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QM7IWNLA%2F20251018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251018T061433Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIGOwoZAJFhywJSHEybDABi%2B9QLafoGDzlQ%2BD74drhNqJAiEAm09zTA9qHMvz%2Fw996%2B6EMe8LgJFF%2FtYDLWPaYTolZLEqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAtuC4g74eqoKDNETircA%2Fk9yUA4SlT76IQsCd1qNsATINlWcdYkgLAq%2F110HRvM1zr%2Bug4uV1Nk%2Fj7sBO%2FYhA9%2FsE%2FPWqSFYNljYgRSjJYe8t28J41lZmR3ggxJVDOWhnCmyuLcQ5Htru%2FlUAPOhzPJTP7NWKX%2BQEtRDTH3fYBB1gktwb3OWhh681zQSVyd6bzLeKX1ZOKnwzC78BYixtF%2B0Viyf7xtewDEzH5TDyjS0W8%2FdiAZSYeI7krwd0p14utDB7xOtCxkD%2BRD%2FBFQzWuoQyGhBTlx%2FkVE48RKJIl%2BLZgdlyBOA%2BmRSnlFJPXPbN0%2BGfqZ0GKDlk8BtemAH5YfiO043qo1E%2B4K96tXEoYAFIijLk5WSrg3n8HWv16Hb%2B%2FiPyWJuN8yfxJV9DKevOUWaDBngMmB6KkddZQSsNFQsL07hWXatG59zverVNFpowaYDGn8cwZiZgggtl93J5REvq3bbUM3CerRgCahKzSgQAj95K6Y2gJg24YsM%2BKn6Cpx6g635JR7UCB53Q7Aou%2B20FUVRbiuoT37X9be8BkKJijDO7LlUBV3kfhw%2BWtja8dNoFnyMVblixQ32jk3MZ3GnOkJT6lM%2Bh%2FZeG5axquYdmLZl2TZ07J4bEyCj%2BWtwYFehyB5%2BlyHqoByMPnWzMcGOqUBhyLpTKJAcaK07qciNFZxZdZCGuCVmx7oAkVDcOhTlkQHgr4l8bVRfbwGvN7DqzHkNOt2hA%2FD98tNpnWc0Yz2otmtiznbMBJ8dXYb%2FZh2ThATTkpy0uhbdqrNWZGiPgOEyurqiio3abf5hcAyFzla%2F%2FWSuuokujMvsUd2x3A%2FJGueuhWA3zv01I27TSzA4EXPLmZugYRbm5aznCZkTbgJPwYE8WdD&X-Amz-Signature=aaa65214b13895bfd48982b32c4ff1cac1a860116e71574916695922a84322e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
