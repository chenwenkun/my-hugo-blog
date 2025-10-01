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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QLC6N4D%2F20251001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251001T061658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQD%2B80AtzuKSl%2Bb0wfMK4oCW5OVQWB4oGMoAAlWgqK7OTQIhAL7XDFb1yOYOpAjyGYP52gAGfhkHRxGF8e07dZ0BPkG0KogECP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw2fG89Ebjya8LPpM4q3AMcbIb4Apqw4juMQOcrFCHRXYvToB%2Fh6sHDboiHOLkV5PfbZb%2BRIFqiY3hTHcsS%2FauHpuad0F%2F2TTYBbZnD21IYf65bCue0aX%2Bz1YezKMlXUmjYHlcVdXSrGsYWtTPm1RIki47x1LYSXG0vvUD%2FgcqhvlwLUMWrJDVTna5G40RJjEymVJA%2FmgVQh1tnw3CqYRLVcSrKHc9bW4F2kZY%2BGlrHV3wjsfe9t73hJ0KQjHe6jdlcdLGWmKSTVto4zIx27Y33w%2BlPB3t18WxXAyrJU5KC709FkK067JV4drzLPiNDCuwGqVXG%2B1hU%2FCXQDQaTIYWvcTrRvjjE4CJa8uw5Ulf30b%2Fc%2FMP9qHN2SfuPCEagqhC2eQvyPqx3b%2FH1%2BIeSTXxFp7Aot8%2Bq7tQMrZNaoq1ISXtM1bd81Bspj2Xz63kL3NP3vbqd9kGwPFbV213lHa61Yky9v6PCGe0AhfGr9ZfB363oeB4wTrmxXoVBANcTqx6%2FkIgjAqpgiAk8uakY9LJRY8xTKzeeSOsIXNE5Gyuo9sZMKIlytbfbP4SZ7ft3%2FRABsm5x4UWqk3FsNE1uYEWUoRHGxcE%2BykrFIjQBQ%2F02ZHI1X333BaR4rS1dnAGfX3Yyp0S6U%2Bk5Hy4B1TCOgfPGBjqkAaV3PENc36Vpj5ZVRldHupxEeqGh0R1uVpTox6VZbf%2FSGiuHfNRmviqhdFpr%2B%2BVWFnlrKCzIv9aOyYZTCj7YmaGa%2FjKWTZ9lo6CDBxjIsIs80rzuhFINAuWqTTaqlNqbDI8%2BYfmZ1pzwlMFCSY0ZtOsNRRjsQOEuuHHTMLya%2FCVtgDWRbdMlglY3aB75PmQpVuefozxqUemK4JBHodASa6J7NB6a&X-Amz-Signature=55754708ee0a91f78bcc37a30ced8445cefe5bfa32446be53043c37407157841&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QLC6N4D%2F20251001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251001T061658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQD%2B80AtzuKSl%2Bb0wfMK4oCW5OVQWB4oGMoAAlWgqK7OTQIhAL7XDFb1yOYOpAjyGYP52gAGfhkHRxGF8e07dZ0BPkG0KogECP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igw2fG89Ebjya8LPpM4q3AMcbIb4Apqw4juMQOcrFCHRXYvToB%2Fh6sHDboiHOLkV5PfbZb%2BRIFqiY3hTHcsS%2FauHpuad0F%2F2TTYBbZnD21IYf65bCue0aX%2Bz1YezKMlXUmjYHlcVdXSrGsYWtTPm1RIki47x1LYSXG0vvUD%2FgcqhvlwLUMWrJDVTna5G40RJjEymVJA%2FmgVQh1tnw3CqYRLVcSrKHc9bW4F2kZY%2BGlrHV3wjsfe9t73hJ0KQjHe6jdlcdLGWmKSTVto4zIx27Y33w%2BlPB3t18WxXAyrJU5KC709FkK067JV4drzLPiNDCuwGqVXG%2B1hU%2FCXQDQaTIYWvcTrRvjjE4CJa8uw5Ulf30b%2Fc%2FMP9qHN2SfuPCEagqhC2eQvyPqx3b%2FH1%2BIeSTXxFp7Aot8%2Bq7tQMrZNaoq1ISXtM1bd81Bspj2Xz63kL3NP3vbqd9kGwPFbV213lHa61Yky9v6PCGe0AhfGr9ZfB363oeB4wTrmxXoVBANcTqx6%2FkIgjAqpgiAk8uakY9LJRY8xTKzeeSOsIXNE5Gyuo9sZMKIlytbfbP4SZ7ft3%2FRABsm5x4UWqk3FsNE1uYEWUoRHGxcE%2BykrFIjQBQ%2F02ZHI1X333BaR4rS1dnAGfX3Yyp0S6U%2Bk5Hy4B1TCOgfPGBjqkAaV3PENc36Vpj5ZVRldHupxEeqGh0R1uVpTox6VZbf%2FSGiuHfNRmviqhdFpr%2B%2BVWFnlrKCzIv9aOyYZTCj7YmaGa%2FjKWTZ9lo6CDBxjIsIs80rzuhFINAuWqTTaqlNqbDI8%2BYfmZ1pzwlMFCSY0ZtOsNRRjsQOEuuHHTMLya%2FCVtgDWRbdMlglY3aB75PmQpVuefozxqUemK4JBHodASa6J7NB6a&X-Amz-Signature=2e6cefd2fed4e96f5c10173fde6c9b1868f5c2537d8d3e291d4f40048763c41c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
