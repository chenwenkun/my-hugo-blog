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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667OGU3PVX%2F20260129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260129T183017Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGCTJDhMvt5hefxr9%2FVj6ilJfYrDYueEEj20S6K0ssYlAiBIfq9sI5Lhf6kojhRR3K%2BX16TpF4pJwG9xlQhxZqTxnSqIBAiL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZH2RdtPL0nz5ZVo4KtwDPUxkN8vhkn3h8wrAJnzKEDuNJP8b4t8shOtU4mQi7jH3b8nNpIDBuRVYPJTSVBVSTph7sbsXCuipSSL8%2BEok59Auz6IxEGaDy6il2HM%2B6VJuEtN1l6uJNHk0ooxhXsIqcxdBMihPN7HU%2FAmi14uUn%2Bk%2Bdr%2Bkli11DD%2B4QUfjEWIHNtU4sb33AQEXrfKgBnsvJqNAYKUWASV80JQsdlYs%2FXzdTmLNVT2ddWDez5ieZNkXrt7CWOWeHGj9S3fq7EtiyRD%2BxfWRXxRDDnwih0jMNzENeSZR3lcRHO%2FVz7YgR8wQaa9AKPWKw6O9ufPSJsuuvpcviSex5On7CiMyHEq1VUF4yOAHXUdhcfmpBflxBzoame0lEIhSPljUJ3bo%2BKHRnF7B5JGUUyrgwHp9dJgKQJHqRPdn%2FsI1Fsbqvyd6FkLaiozqjKt%2FItK9izWRZxR%2F8q%2BWdFpbTOY3I96v3SpsB3nOFOQ%2FCPzTjBpMHMMvjVD1aHN8tOkw89KC3MzkcpIF4WwirIEtbNNA1hG0y5Iwr7XUin6dWv6k4HY70fTXdOYQ4E21a3EDTeMVlwBnvW3kXe2I1khVrkWDiqHjejvRMBTHF95xdR%2BE2zEMh%2BAvjcThTDXvYDHeP3wd9sIw78TuywY6pgHQyWzXWi4hxlE7c%2F5Uj3OLvWIuG4CUnqTdI13GV0Vxhn7P2EOKCFS8dg6E8nhJ9m232h6chGWigUMftetoocVD9%2FYpbwxHszqdm2pexcoCMDocVBLr9qQpxilGc9i9b3xxdCCXWrKggnON7TLRdLJsPgSbDPOIGyAVRyKkk9VtOz8W0f2esR5dX1Tkbx5z9w4o%2FakU7TCFmLVMY78XrDsEyQJnMVhS&X-Amz-Signature=620d7cd106bfd1e6d18ae2fe664bd8d043b0d3868686405767d0df24e3e00efa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667OGU3PVX%2F20260129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260129T183017Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGCTJDhMvt5hefxr9%2FVj6ilJfYrDYueEEj20S6K0ssYlAiBIfq9sI5Lhf6kojhRR3K%2BX16TpF4pJwG9xlQhxZqTxnSqIBAiL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMZH2RdtPL0nz5ZVo4KtwDPUxkN8vhkn3h8wrAJnzKEDuNJP8b4t8shOtU4mQi7jH3b8nNpIDBuRVYPJTSVBVSTph7sbsXCuipSSL8%2BEok59Auz6IxEGaDy6il2HM%2B6VJuEtN1l6uJNHk0ooxhXsIqcxdBMihPN7HU%2FAmi14uUn%2Bk%2Bdr%2Bkli11DD%2B4QUfjEWIHNtU4sb33AQEXrfKgBnsvJqNAYKUWASV80JQsdlYs%2FXzdTmLNVT2ddWDez5ieZNkXrt7CWOWeHGj9S3fq7EtiyRD%2BxfWRXxRDDnwih0jMNzENeSZR3lcRHO%2FVz7YgR8wQaa9AKPWKw6O9ufPSJsuuvpcviSex5On7CiMyHEq1VUF4yOAHXUdhcfmpBflxBzoame0lEIhSPljUJ3bo%2BKHRnF7B5JGUUyrgwHp9dJgKQJHqRPdn%2FsI1Fsbqvyd6FkLaiozqjKt%2FItK9izWRZxR%2F8q%2BWdFpbTOY3I96v3SpsB3nOFOQ%2FCPzTjBpMHMMvjVD1aHN8tOkw89KC3MzkcpIF4WwirIEtbNNA1hG0y5Iwr7XUin6dWv6k4HY70fTXdOYQ4E21a3EDTeMVlwBnvW3kXe2I1khVrkWDiqHjejvRMBTHF95xdR%2BE2zEMh%2BAvjcThTDXvYDHeP3wd9sIw78TuywY6pgHQyWzXWi4hxlE7c%2F5Uj3OLvWIuG4CUnqTdI13GV0Vxhn7P2EOKCFS8dg6E8nhJ9m232h6chGWigUMftetoocVD9%2FYpbwxHszqdm2pexcoCMDocVBLr9qQpxilGc9i9b3xxdCCXWrKggnON7TLRdLJsPgSbDPOIGyAVRyKkk9VtOz8W0f2esR5dX1Tkbx5z9w4o%2FakU7TCFmLVMY78XrDsEyQJnMVhS&X-Amz-Signature=bd06f398af22d6e423231c8ca3f3886fa3519f588224cb79fafe0c6ff5726bcb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
