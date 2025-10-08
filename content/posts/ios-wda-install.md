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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46632CTD6R7%2F20251008%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251008T122152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJIMEYCIQDsaPteca5xIQ9rn5pyMU2GOdT3FfLDclWRV98WgC2xfwIhAMM5nOqSgl%2BeUqLuF7t%2FxkaJJOCe5fcAV6Y2DxCBS5JEKogECL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx%2FEREn%2B9gW%2FF1LDRAq3AOZw7GbywFPzVRuVL1WIb4fFqmI09YeTHoCQRJOwjCTh0Vkz0xIqRCxRM9XfCvr1nEWngvVENZ1rjDWHHb8%2FU6UZe1uzGWzDfUmHEZ1Pd%2BSNa%2BZdrW1QHCWtjUyLX6ZbkXzMSSEozjYEw6QcVUd5boXnjUHtMuY4H21RdeBia4%2BBVcOY3N16wWO%2BOkQM%2B%2BWd97kQhc2sDJJQcl7whW85qyUh0IpR%2BE64LvtBMhgRcySuEjYkOnapieBy7yUq%2F%2BiwlyyaJ5RMIuwcLUdgpZX61N%2FGMJrnYKL%2Be3Uzfvtc8RefpTZmV59V8QaVC84yMYfK3RsNtM0hJNWoRBOwAkkHUZBa1BiS94f82VF1mvz7Hg0WmmjkY5PFGz2jflDqwfVJtlhCM60vRhqjL5F5KSVE9uBrnQaNmw0kAIuO7%2FNKOPi15D0MlsYrTnbPb76smHuCJtQ0i2wbq3O8O3MbW73l4XoJGGCWAYlRVFvEoV0XOfzQcyYGBx%2Bdm25G8ceDTCmV6WYaT8qwoaU%2FR6pmxNFUa8%2B6I2X5s1SaM78MIX%2BVmGUk5S5R2OB776detNI%2BYWsDlqNnT4UzacFmGBwpbjTcIHu9hGX6md7%2BR1P7yWi566Cz33S%2FEGnqxj9tZk3uzCGopnHBjqkAc8IlakRBKtF1mXgD1I77FmntCzuQ4Uz1qoU6hczQxZy0NTdqeGD%2Bi%2FTZlPNVPgemiFZ0r8zZQGcFPE7b8WTYPhsUY0FROL%2B4YbV0FDQeJ7yiD0HlX7BUYV5FEjYSX2BmbwcsxGfEScOmTLPM%2BpPXkQRyGOJE2oIYQJ3FokfNvnI%2BxBxQF82YtZ726x4WT1c0yqLy0pQyiDcyf4Z%2FDANvdOZdbmy&X-Amz-Signature=c42dc157ce1e42bef925651ed297c28ad99b0cb3cb996325a472e2579c5f608e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46632CTD6R7%2F20251008%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251008T122152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLXdlc3QtMiJIMEYCIQDsaPteca5xIQ9rn5pyMU2GOdT3FfLDclWRV98WgC2xfwIhAMM5nOqSgl%2BeUqLuF7t%2FxkaJJOCe5fcAV6Y2DxCBS5JEKogECL3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igx%2FEREn%2B9gW%2FF1LDRAq3AOZw7GbywFPzVRuVL1WIb4fFqmI09YeTHoCQRJOwjCTh0Vkz0xIqRCxRM9XfCvr1nEWngvVENZ1rjDWHHb8%2FU6UZe1uzGWzDfUmHEZ1Pd%2BSNa%2BZdrW1QHCWtjUyLX6ZbkXzMSSEozjYEw6QcVUd5boXnjUHtMuY4H21RdeBia4%2BBVcOY3N16wWO%2BOkQM%2B%2BWd97kQhc2sDJJQcl7whW85qyUh0IpR%2BE64LvtBMhgRcySuEjYkOnapieBy7yUq%2F%2BiwlyyaJ5RMIuwcLUdgpZX61N%2FGMJrnYKL%2Be3Uzfvtc8RefpTZmV59V8QaVC84yMYfK3RsNtM0hJNWoRBOwAkkHUZBa1BiS94f82VF1mvz7Hg0WmmjkY5PFGz2jflDqwfVJtlhCM60vRhqjL5F5KSVE9uBrnQaNmw0kAIuO7%2FNKOPi15D0MlsYrTnbPb76smHuCJtQ0i2wbq3O8O3MbW73l4XoJGGCWAYlRVFvEoV0XOfzQcyYGBx%2Bdm25G8ceDTCmV6WYaT8qwoaU%2FR6pmxNFUa8%2B6I2X5s1SaM78MIX%2BVmGUk5S5R2OB776detNI%2BYWsDlqNnT4UzacFmGBwpbjTcIHu9hGX6md7%2BR1P7yWi566Cz33S%2FEGnqxj9tZk3uzCGopnHBjqkAc8IlakRBKtF1mXgD1I77FmntCzuQ4Uz1qoU6hczQxZy0NTdqeGD%2Bi%2FTZlPNVPgemiFZ0r8zZQGcFPE7b8WTYPhsUY0FROL%2B4YbV0FDQeJ7yiD0HlX7BUYV5FEjYSX2BmbwcsxGfEScOmTLPM%2BpPXkQRyGOJE2oIYQJ3FokfNvnI%2BxBxQF82YtZ726x4WT1c0yqLy0pQyiDcyf4Z%2FDANvdOZdbmy&X-Amz-Signature=95b877d1bab0a13fe0014b5bc43c495c1b4d0fbd6e8d33454702e20e17350738&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
