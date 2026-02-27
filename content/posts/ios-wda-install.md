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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XUTY27A%2F20260227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260227T010752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQCWRmxWdy3lVqLnv6teiPj2sEzDztWO21HCxn7NyfW85AIgL%2Fyv5MlW%2F77VJY%2BFZAxERmTI9KRyLJLkNxZfcmVCV84q%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDFCzqJZEdM7C592flircA0N%2F%2B1i3UzLzz4tFvHnH3%2FgNbPI53tEymaS3Vwjc4wwcLI0BjnW1wdNNBMiBNCQ5zBnQ%2BTUDkL1vcfgYVWDFixIOJaz5g2ZrnJEVS%2BHpJZqP0rya0u6cmMCtOARE8ff4hto43YxWnwo6VxhHrPUjKUDrzlZQJxWLtRY0WAWH4QaF%2FInkgr7EcIGJ2nY%2B1gqmhYlVD5OCX3WP2usrzxHrRsTyo6vJrq8tgipaFxg1WM1RdTpcyi4h6glBJPLBU6VtqKnNjl0xRF5zG4N7RIE2bbYNSbBCU0AWTy2DrkAsE5n%2BNfc7d2DryyoolKwRDh91z4Pjsb5J%2Fl3s6E31OM%2BTfAnD71mczgMu%2FN7Db5V8ryRd%2B9V8AjMRuDHO41MIJaPHlxcFT%2Bc8pqhS4o4hZ5DLCbeRoGkEuX5D%2Fwy3kCFsvfHoxnSDv9KX1NF%2FGkV0pKHJPLHVquPfDX2d1KwrlX8rS9ziXsfVrrA8Riet4R8WgSzHMiPJqJtKe6tzubggVLpkqybygpxuSF8u%2FhwKIgw7zpDzQUWVtwCjlAxgFjW0qk5gJzoGrN8R1ju1WD6dzTu3Ufgc7mn4ZgwFEa20loby%2F%2FZhLv0UI%2BjTqh7sZoBvtJtxnd6Iei7XyYkjpWXwMOTag80GOqUBPIWm90Tw%2BWGuWhOzsFVHwYzMps85LJ%2BJnolh7Q20dSiCyi5kACqK1GDYM6DM2o37Zc0KH6WJLtWyx31XhzKpPFDC%2BDwqkrzLzV6hqIgDeGm7cO14Ex35hqggl2CHA2sLRgEmJA15I1NBwHESz%2FQ24%2BAfbUJfarHnclLeAhsuPT8Pf4igebkBNk7XBhXvB%2B1XI4Ge%2F%2BDNnI6wgDBNaQ8vjCQP5Sy7&X-Amz-Signature=1e18d48650ff25e614715a32f840f69b307d251e17f6bd50ba67aa0d2b05e38f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664XUTY27A%2F20260227%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260227T010752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQCWRmxWdy3lVqLnv6teiPj2sEzDztWO21HCxn7NyfW85AIgL%2Fyv5MlW%2F77VJY%2BFZAxERmTI9KRyLJLkNxZfcmVCV84q%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDFCzqJZEdM7C592flircA0N%2F%2B1i3UzLzz4tFvHnH3%2FgNbPI53tEymaS3Vwjc4wwcLI0BjnW1wdNNBMiBNCQ5zBnQ%2BTUDkL1vcfgYVWDFixIOJaz5g2ZrnJEVS%2BHpJZqP0rya0u6cmMCtOARE8ff4hto43YxWnwo6VxhHrPUjKUDrzlZQJxWLtRY0WAWH4QaF%2FInkgr7EcIGJ2nY%2B1gqmhYlVD5OCX3WP2usrzxHrRsTyo6vJrq8tgipaFxg1WM1RdTpcyi4h6glBJPLBU6VtqKnNjl0xRF5zG4N7RIE2bbYNSbBCU0AWTy2DrkAsE5n%2BNfc7d2DryyoolKwRDh91z4Pjsb5J%2Fl3s6E31OM%2BTfAnD71mczgMu%2FN7Db5V8ryRd%2B9V8AjMRuDHO41MIJaPHlxcFT%2Bc8pqhS4o4hZ5DLCbeRoGkEuX5D%2Fwy3kCFsvfHoxnSDv9KX1NF%2FGkV0pKHJPLHVquPfDX2d1KwrlX8rS9ziXsfVrrA8Riet4R8WgSzHMiPJqJtKe6tzubggVLpkqybygpxuSF8u%2FhwKIgw7zpDzQUWVtwCjlAxgFjW0qk5gJzoGrN8R1ju1WD6dzTu3Ufgc7mn4ZgwFEa20loby%2F%2FZhLv0UI%2BjTqh7sZoBvtJtxnd6Iei7XyYkjpWXwMOTag80GOqUBPIWm90Tw%2BWGuWhOzsFVHwYzMps85LJ%2BJnolh7Q20dSiCyi5kACqK1GDYM6DM2o37Zc0KH6WJLtWyx31XhzKpPFDC%2BDwqkrzLzV6hqIgDeGm7cO14Ex35hqggl2CHA2sLRgEmJA15I1NBwHESz%2FQ24%2BAfbUJfarHnclLeAhsuPT8Pf4igebkBNk7XBhXvB%2B1XI4Ge%2F%2BDNnI6wgDBNaQ8vjCQP5Sy7&X-Amz-Signature=f0bfa7731785892f0cf190e429eee9616a2aa1b3cf1f24a583df99fb4081efe2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
