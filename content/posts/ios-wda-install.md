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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TORUFXJY%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T153247Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJIMEYCIQDXEI5K59%2BUY3L%2FozZLbuAiYJ9jOgVbtYSjLI8P0NmVRQIhAM6JkB%2BfeYbmNr11nnD9ktm1gUrruToVt07n3qXLbGBMKogECP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxloxwtycH9AKTW7EMq3APH9wBUwf%2BI4EzkxLJW14sGZmn%2B8n%2FxwwZEil5jll1M2ajTWv0YTu5IHE4LrmwUUG3mWqDclqpiT7ufKtnu1tMHkVq29mFLNUlnGCqL9qN%2BObEjYkVHZBTNIcSnK2x8TCr0iMUuK3E4h5OOPkio1HGyq2Pj1cxHhWYr%2FZNFsnHkJmgWN9HevR5LTHh7PzBSZxFV%2BTUvb%2FY038UW%2FUSRC4tMjrD1RXDWbJlPwroaa9HYbQJ33mEkhqUXMuS095fSB7kGvuAEt1g%2B8uTVWSWdNCoNciSw%2B1nQ68Cg8p6dauGc2sBQJsf%2Bp%2BUnNA1yGOI%2Foh24KIVn7yf%2BQiJwMsxZWMdNBNW7mtBKaY1kEpad1MS91CwGbsjfxyvxE%2F32pi41Y9pdNkb%2FGMX2ClwCexzZATOnxU6V1dIa5k2FisGqwnYDD6SNzYzJ7GDRTRZSfOPfBJHc%2Fj6x8tsctAZa94QZKHQIZ6XQSag%2F6BQCWHD5i0iye2T7qN3BZwhNow%2Fj3zoeazV%2F0N9xX%2BV7SdGR5uHMQ5emg%2FjAx1ZGImlau68Z7DP0afVtsvkK1K83MdSH4vIyGsuIa1Nir%2FDRc9QzDBzmLJs668u7x5lQyv1%2BQrguJcgdL6vyaJnbDf%2FR1vbm8zD72KrRBjqkARxGB0PXsPY4lAkaHoLF1WjvuJS%2BV6I0DfALbSLO3%2BVCNjCv8w3cm9edT7IQ0jwlUtagBrNqhUClF0sqlL%2BhQTz8%2Fy1DULSyGnVUBrRUf8AARXs%2F43kZVqnMpjM21V8kdpJ2MT%2BG9vxY47LjzL1rDeQshlI3nH4accZUOf8nzvk8E5JmKPJZ3FCJB%2BHtllV3rpsWayt7ylcnjnADUF6Zg9b9bk3J&X-Amz-Signature=32824fda824e12fc3774a3cc60c557f010a8f63b42ea0b3f93104b6aa4ed4338&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TORUFXJY%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T153247Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJIMEYCIQDXEI5K59%2BUY3L%2FozZLbuAiYJ9jOgVbtYSjLI8P0NmVRQIhAM6JkB%2BfeYbmNr11nnD9ktm1gUrruToVt07n3qXLbGBMKogECP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxloxwtycH9AKTW7EMq3APH9wBUwf%2BI4EzkxLJW14sGZmn%2B8n%2FxwwZEil5jll1M2ajTWv0YTu5IHE4LrmwUUG3mWqDclqpiT7ufKtnu1tMHkVq29mFLNUlnGCqL9qN%2BObEjYkVHZBTNIcSnK2x8TCr0iMUuK3E4h5OOPkio1HGyq2Pj1cxHhWYr%2FZNFsnHkJmgWN9HevR5LTHh7PzBSZxFV%2BTUvb%2FY038UW%2FUSRC4tMjrD1RXDWbJlPwroaa9HYbQJ33mEkhqUXMuS095fSB7kGvuAEt1g%2B8uTVWSWdNCoNciSw%2B1nQ68Cg8p6dauGc2sBQJsf%2Bp%2BUnNA1yGOI%2Foh24KIVn7yf%2BQiJwMsxZWMdNBNW7mtBKaY1kEpad1MS91CwGbsjfxyvxE%2F32pi41Y9pdNkb%2FGMX2ClwCexzZATOnxU6V1dIa5k2FisGqwnYDD6SNzYzJ7GDRTRZSfOPfBJHc%2Fj6x8tsctAZa94QZKHQIZ6XQSag%2F6BQCWHD5i0iye2T7qN3BZwhNow%2Fj3zoeazV%2F0N9xX%2BV7SdGR5uHMQ5emg%2FjAx1ZGImlau68Z7DP0afVtsvkK1K83MdSH4vIyGsuIa1Nir%2FDRc9QzDBzmLJs668u7x5lQyv1%2BQrguJcgdL6vyaJnbDf%2FR1vbm8zD72KrRBjqkARxGB0PXsPY4lAkaHoLF1WjvuJS%2BV6I0DfALbSLO3%2BVCNjCv8w3cm9edT7IQ0jwlUtagBrNqhUClF0sqlL%2BhQTz8%2Fy1DULSyGnVUBrRUf8AARXs%2F43kZVqnMpjM21V8kdpJ2MT%2BG9vxY47LjzL1rDeQshlI3nH4accZUOf8nzvk8E5JmKPJZ3FCJB%2BHtllV3rpsWayt7ylcnjnADUF6Zg9b9bk3J&X-Amz-Signature=82596ba771f56f7686cfc2c1339127e1398972e362a4d3369bdf9e73f5421b32&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
