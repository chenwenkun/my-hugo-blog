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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SID7PG2R%2F20251120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251120T122213Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJGMEQCIGcPh5AG%2FMXCDauTZVDkI2715%2FOAiPmwYMJEat9sIOORAiBJdd5igWsPG4z%2Bl%2FvyhvSAa5%2BXBGqQQO48xnlVqQKCfCqIBAj1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuN3v%2BkFSC7%2Fqm%2F%2FcKtwD64xyIQMwFrXbR8GCaoM3yLE1G%2BOUWg7LauGDx1BAuMnS7DnN74bOguM8bCVakMnFuqidArHNJdCcANol13%2BlXZ1C5CVdjXzs3zOAtMZSDqzt1Rd3AjT4AMplpZLC9rTHlGDfWE%2BsSvWt9LmbWXq%2FQWC9ngKz%2BGmtqS%2Fy7oVtMs5E%2FPoXNEORyVrkig7JM%2FDlMIGRQLwjz2KUk8vH3YkpjapSjr43qTfp5TcoMVC1mHobD35Oh23JfsbEqcHSFMlXPG%2BNXdq3Xi2rfWj8KkouSWTa3qKpjta7uT1E%2FdqEtbP6FGHLg1mjJwtzLgJC8pue8%2Fz%2FedwdnfFOkVWNc4mAANusc%2BJALNv%2FEJuAmgB3daa9SrDEYT4yUBPNEcxe54GXprZKdV58A%2BgPyLVmz3yyYM3W4YITTYpythOWovKC%2FJx8WhFyGlijY5tybn6nKDXp5Ll5aY98qDe2AL5dup6goXWXkwXBuJLeSgRuQNNX5k4rp55CMc2lhi75FVl7mMRchtUp5td5BCRLSWlzsFvcFOrVDO3UphPef3FCxMtNtpkkvmdL4pGedT%2BcPKi9mO3af5TAaw9bnv9hsnYEcXGOEs3YqcTQwsT3SJ9drcs2KipdEKdz2HOG0cPQ5yUwmYD8yAY6pgHLlLX0j4gkLj5ER19aWIdzRdLNEpzTWBTESEQ6hCCFSXVz0S821AhN%2BJbZxC73TAnWj7m77GXzazQGvZtQt2NNv0s5bDKCHygHLnQmnodhL08t3deCZoTXymO6B7JTjccyNjEc%2BN0uYTZFOhQUMw2Y6eti7TG8RX1uthoKbq4WBlJQR2gE0ofsLA8%2BffwbhtS%2BBEwqrDAJXzwTUnwn%2Bj6W4G5LJLqJ&X-Amz-Signature=1a203e45a649bafb86f12568a92c7b0e8f7773cd58a5d69c9072ec9ee26a16c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SID7PG2R%2F20251120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251120T122213Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJGMEQCIGcPh5AG%2FMXCDauTZVDkI2715%2FOAiPmwYMJEat9sIOORAiBJdd5igWsPG4z%2Bl%2FvyhvSAa5%2BXBGqQQO48xnlVqQKCfCqIBAj1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuN3v%2BkFSC7%2Fqm%2F%2FcKtwD64xyIQMwFrXbR8GCaoM3yLE1G%2BOUWg7LauGDx1BAuMnS7DnN74bOguM8bCVakMnFuqidArHNJdCcANol13%2BlXZ1C5CVdjXzs3zOAtMZSDqzt1Rd3AjT4AMplpZLC9rTHlGDfWE%2BsSvWt9LmbWXq%2FQWC9ngKz%2BGmtqS%2Fy7oVtMs5E%2FPoXNEORyVrkig7JM%2FDlMIGRQLwjz2KUk8vH3YkpjapSjr43qTfp5TcoMVC1mHobD35Oh23JfsbEqcHSFMlXPG%2BNXdq3Xi2rfWj8KkouSWTa3qKpjta7uT1E%2FdqEtbP6FGHLg1mjJwtzLgJC8pue8%2Fz%2FedwdnfFOkVWNc4mAANusc%2BJALNv%2FEJuAmgB3daa9SrDEYT4yUBPNEcxe54GXprZKdV58A%2BgPyLVmz3yyYM3W4YITTYpythOWovKC%2FJx8WhFyGlijY5tybn6nKDXp5Ll5aY98qDe2AL5dup6goXWXkwXBuJLeSgRuQNNX5k4rp55CMc2lhi75FVl7mMRchtUp5td5BCRLSWlzsFvcFOrVDO3UphPef3FCxMtNtpkkvmdL4pGedT%2BcPKi9mO3af5TAaw9bnv9hsnYEcXGOEs3YqcTQwsT3SJ9drcs2KipdEKdz2HOG0cPQ5yUwmYD8yAY6pgHLlLX0j4gkLj5ER19aWIdzRdLNEpzTWBTESEQ6hCCFSXVz0S821AhN%2BJbZxC73TAnWj7m77GXzazQGvZtQt2NNv0s5bDKCHygHLnQmnodhL08t3deCZoTXymO6B7JTjccyNjEc%2BN0uYTZFOhQUMw2Y6eti7TG8RX1uthoKbq4WBlJQR2gE0ofsLA8%2BffwbhtS%2BBEwqrDAJXzwTUnwn%2Bj6W4G5LJLqJ&X-Amz-Signature=132ee06b2d6afa9fff9803955339299dc4811ffa3abf542f90ea875bf1c11d97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
