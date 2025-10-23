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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663KU5XI43%2F20251023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251023T122204Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDEKclmv3yS5xiGBDacLwwRRmQQDUyB9kLTc45N5ld4eQIgKe9XPwJvQTsSF7N4nTZFdFVe48ZBl1lYw3YuCcFx3uIq%2FwMIRRAAGgw2Mzc0MjMxODM4MDUiDIz5FhlA40Y5xM3P1SrcA24P5Vs0qn%2B4bomFlMc6m92ia7EtjNNkzanxIP0RZJzahWO8jedwVrEtrA2oztYm0CXZRpMHwclXMHWJHHBVRdEbSMUZez7b0Zu3gsx8RqewO9bfB6%2BDNEP7zdIHbwgNONpwCqmgB6qZGqmO4ltPWMHNXjyxHnLYn8cif6pN4i0qkby%2Fqhdbc3UxhsFoERhqQp%2BKDP0oJF8mnFFOkWarlJcNTmAHktPvGExruEW3rRIqXFLjscB5GsKaWXaSFnJPA%2Bl0DeLGmAbnMW5Oz6%2BHBFphlg76pAR8mGcS%2BNJF3FMiRZAABActzK9TBSGAdRRVTokCzaCOGCpz8xFkNSh9OP2hNzWSn3PmVSx%2FyHebWJ6G8AVlxcZMZpVmJFBAKAxJ7R%2Fd7oD0tEXP8ApMuD%2FiyCnOMlEZ9ETeWv%2BOcZl18V88dCo2g%2BByfl%2BS6PKzmFfhrggFUdXXztXO9M%2BAFXvqy7paT97tYmhNW37SFaTLRBhMN6YaOfzVrM6P3c6icpM%2FxDiSjoZ6DRRshisUvIuYmcgvsyKTdkX6gSJv5AC9qJXFwemoJ6aZ3PihHGBuEtOqQpMcHDUTkhypHIkp8Q5VHM%2BFMeZm3GMP%2F14nbmGyGDY3qKY4kG9AkdUYzOHaMNKr6McGOqUB7w4RG4yCTlH0HIIUQVlj0ntCkLq9E13ad9jbXchTO38MmgtW8G608yaxlFjMUMXwHdS8Ijj3U53DS1cHNqVcVyoltZ72%2BopeKu5ZvNzrGeHd%2BQjWZHRrN6072Y2zY2wV2Fz2yCU5jETtT1QGGYZxHHS4OaKR0LaCU2O8HjBL29kNVw2BfvlMgtaHPeIFwUg2DJshDihQg%2BLwx7lm2tHw3GwF5FX0&X-Amz-Signature=e449b939c133152b311f66870b07276da7e5dd513d5fafb308a4f7d58e191f20&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663KU5XI43%2F20251023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251023T122204Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDEKclmv3yS5xiGBDacLwwRRmQQDUyB9kLTc45N5ld4eQIgKe9XPwJvQTsSF7N4nTZFdFVe48ZBl1lYw3YuCcFx3uIq%2FwMIRRAAGgw2Mzc0MjMxODM4MDUiDIz5FhlA40Y5xM3P1SrcA24P5Vs0qn%2B4bomFlMc6m92ia7EtjNNkzanxIP0RZJzahWO8jedwVrEtrA2oztYm0CXZRpMHwclXMHWJHHBVRdEbSMUZez7b0Zu3gsx8RqewO9bfB6%2BDNEP7zdIHbwgNONpwCqmgB6qZGqmO4ltPWMHNXjyxHnLYn8cif6pN4i0qkby%2Fqhdbc3UxhsFoERhqQp%2BKDP0oJF8mnFFOkWarlJcNTmAHktPvGExruEW3rRIqXFLjscB5GsKaWXaSFnJPA%2Bl0DeLGmAbnMW5Oz6%2BHBFphlg76pAR8mGcS%2BNJF3FMiRZAABActzK9TBSGAdRRVTokCzaCOGCpz8xFkNSh9OP2hNzWSn3PmVSx%2FyHebWJ6G8AVlxcZMZpVmJFBAKAxJ7R%2Fd7oD0tEXP8ApMuD%2FiyCnOMlEZ9ETeWv%2BOcZl18V88dCo2g%2BByfl%2BS6PKzmFfhrggFUdXXztXO9M%2BAFXvqy7paT97tYmhNW37SFaTLRBhMN6YaOfzVrM6P3c6icpM%2FxDiSjoZ6DRRshisUvIuYmcgvsyKTdkX6gSJv5AC9qJXFwemoJ6aZ3PihHGBuEtOqQpMcHDUTkhypHIkp8Q5VHM%2BFMeZm3GMP%2F14nbmGyGDY3qKY4kG9AkdUYzOHaMNKr6McGOqUB7w4RG4yCTlH0HIIUQVlj0ntCkLq9E13ad9jbXchTO38MmgtW8G608yaxlFjMUMXwHdS8Ijj3U53DS1cHNqVcVyoltZ72%2BopeKu5ZvNzrGeHd%2BQjWZHRrN6072Y2zY2wV2Fz2yCU5jETtT1QGGYZxHHS4OaKR0LaCU2O8HjBL29kNVw2BfvlMgtaHPeIFwUg2DJshDihQg%2BLwx7lm2tHw3GwF5FX0&X-Amz-Signature=403ccf07edbda796035103b0a75668791abcf88c0d9fb4d7fa3358d30d6fe992&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
