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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QSY7AJ2M%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T142329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDoL74PislMLAD6DtEZzq%2FQ50XrV9Prcn59rXuMwRG42AIhAKGVMTJR6Git3SPNCl6QdHzxaxd1tg6PH7uY7Q8ehVZVKv8DCG4QABoMNjM3NDIzMTgzODA1IgyUfXYPRrZMfUH6Ymgq3ANiqlav%2Bqs80N56v63Cm5Bwzi01HA%2BHWsL2dMsOhQraHVPoIXAzREY3KG51gpvkAGkxAJtkdS8LLujNfVOS1wUO72I9I7atkgPj4RJ66BQDb9c6ErH7OaCLCAj0yWRutNAXiecnxgoUKsBvky6A4E05lntegy2uUbirBSuvBtx9g9%2FQHkaUi8iqNmoE7CXMv7XR31ynTH06YjNyXJmgyYXUL9NG5cxwKGV4ZC7DeMEp25o%2B8bRHP5vD5P%2BuWjiEOFwoIAyTuS3iF1X3vgJBXoJ6rVuQLxtH77nZJGpH1ZKkVo72Ukoi40%2BG0cocy9a9L1GpxE9594bF6QjhjjLoiSJnT7iXKSr4kacnWwMG6Ppqk1%2Frk0%2F%2FhGTiKPwnTrWRv%2By3qrjCiXr4zblR3FATNAXFsWNwY7RrOsgYsVm5%2FAL8gB33l8mz7ZVywhcDKrJE%2BG6m83VthZj8tBvP1hRJezCQBgoUctNI9GMZLdLSim2gtS%2FUVImxrYRS1YZ2ccUbc4U8ZJYr36jkE6B4mFy1sFnu9pHCUWQHviB67v70GqEj1iBecWk7iufZl6EsMYGv9OQZpYNVTwApOtaMgIF9dfI9%2F%2BWiY73DsVO9mTAnwWdADMoeuk4ukxNNKMICzzCHk4vRBjqkAR6QSRqeEjYI5Q1xJGUC9aGdJ6foAjub%2BlNj1XYdKSXh5H2GjA46Nn83YTxmekxY0FpknmugPPjZV7tIDFv8C%2FlobRqsrG%2F%2FPhGyknBWux9GjNz2nrbvqA0xmx7nvi%2F28PZTjbb5yi8lBhtY90tzKOYsuCDPleLEiaYqBw3uDKdWhhgocmJb080WmLek4j0A5eokWKKQOQKp%2FG%2FC%2BDw%2BUGd1qUlv&X-Amz-Signature=e9d600b22ed884f01dc9aadddfd64b2d068ad0770649ffe0a4c31b0e505dd659&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QSY7AJ2M%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T142329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDoL74PislMLAD6DtEZzq%2FQ50XrV9Prcn59rXuMwRG42AIhAKGVMTJR6Git3SPNCl6QdHzxaxd1tg6PH7uY7Q8ehVZVKv8DCG4QABoMNjM3NDIzMTgzODA1IgyUfXYPRrZMfUH6Ymgq3ANiqlav%2Bqs80N56v63Cm5Bwzi01HA%2BHWsL2dMsOhQraHVPoIXAzREY3KG51gpvkAGkxAJtkdS8LLujNfVOS1wUO72I9I7atkgPj4RJ66BQDb9c6ErH7OaCLCAj0yWRutNAXiecnxgoUKsBvky6A4E05lntegy2uUbirBSuvBtx9g9%2FQHkaUi8iqNmoE7CXMv7XR31ynTH06YjNyXJmgyYXUL9NG5cxwKGV4ZC7DeMEp25o%2B8bRHP5vD5P%2BuWjiEOFwoIAyTuS3iF1X3vgJBXoJ6rVuQLxtH77nZJGpH1ZKkVo72Ukoi40%2BG0cocy9a9L1GpxE9594bF6QjhjjLoiSJnT7iXKSr4kacnWwMG6Ppqk1%2Frk0%2F%2FhGTiKPwnTrWRv%2By3qrjCiXr4zblR3FATNAXFsWNwY7RrOsgYsVm5%2FAL8gB33l8mz7ZVywhcDKrJE%2BG6m83VthZj8tBvP1hRJezCQBgoUctNI9GMZLdLSim2gtS%2FUVImxrYRS1YZ2ccUbc4U8ZJYr36jkE6B4mFy1sFnu9pHCUWQHviB67v70GqEj1iBecWk7iufZl6EsMYGv9OQZpYNVTwApOtaMgIF9dfI9%2F%2BWiY73DsVO9mTAnwWdADMoeuk4ukxNNKMICzzCHk4vRBjqkAR6QSRqeEjYI5Q1xJGUC9aGdJ6foAjub%2BlNj1XYdKSXh5H2GjA46Nn83YTxmekxY0FpknmugPPjZV7tIDFv8C%2FlobRqsrG%2F%2FPhGyknBWux9GjNz2nrbvqA0xmx7nvi%2F28PZTjbb5yi8lBhtY90tzKOYsuCDPleLEiaYqBw3uDKdWhhgocmJb080WmLek4j0A5eokWKKQOQKp%2FG%2FC%2BDw%2BUGd1qUlv&X-Amz-Signature=3e2a31b6123a96afb2c356cfad4d9a12d8fe48e9533ea7f0af0ec4cb6332fa7c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
