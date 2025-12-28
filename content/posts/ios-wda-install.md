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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF6EC66P%2F20251228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251228T061755Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCFz65RyvOzqsm4r0nnGEOXWX6kh3RoTBbWV8OaPkJQEwIhAMEVMY15AREa88ZWXOokW9g%2FMUNyLa94MHDLxoUE8YpdKv8DCH8QABoMNjM3NDIzMTgzODA1Igwy1QGm6WMGsPCGFJ8q3AMV83p0f1NHT5XS7%2Fg9G8thH6EolsemsmS1luSF3M2D9xvF9DQwT7WhH4FqCq%2ByYiDtMrUsanQjXd6WGq%2B59rbLDzl12TGIatGAzxfRf412F5JVf3IGYAFI90IpPgyLkS7jJBXkDG7eNdSAoRzSoROR%2FHc2%2FfGJnWxUVlwcQB2p640jt8XLEgKbYG3x6lO7%2FGu6KmuEzriY0O2tcS1d8uEYlbs%2Bch%2BSSm39EeEEHrjcMffuQtDHxWobJcjo9ZB9%2FkSN1dIb2sXAbd0Ugv%2FahCaEQOB2fgqjr2WwEm4kPdKkNGmfHq5rmcPNtcAvervcSGQbSdL5pKjBdHTGco6LvgcJcGGGwNzhHiqdtCqDG6iCfzI4iYKK%2BguMTpFpllZj0Wol7s84czxiLTe%2B1rQcE%2BxH48pm21byrvMuiMPTqIvWgJzqu9mWLCA5WgsGBSlnfKNJKRPC%2BOQ0UWMlzKwI0frqA4ZO5ie%2F7VPFIaZfnce0yqj0%2B%2FfUx8YIZ0N0NlBwNcCH%2F0iGw7Ww5BBEa1jIieHjrjfd5H0igjafuWVKeBs8basyuXt1d9pbG3arMi4koygxjgsUnVceC1sFNFleY5EF1nif%2FsHfgAmEviX1eWMV5DIYWRDSLj6SHo3z0jDplMPKBjqkAUHKutiGcPvOhIEUV5lYMWmhUL1pp%2BAAAEx9Zfrs083TInQaAicVwI2QBl2j5NVWxnGW%2BoDd1tVqQ9Mt0Cs6QbDxWvxlGIl%2BPUSXSa%2FMlKGgy0NcOmIW3m3MQuMNq10wFYthM9NdHmP9F3aQ3%2BuLJkZHg%2Fzp9FUh8Z3e49D2hBhVxIB5mtPEFPex%2F545tij84tNdnmn94zv8BcNgI11gjgOeReY0&X-Amz-Signature=4c317f7462f3cffeda494b0de4c13d2de6e8e2a4578a2f413f287799dfed9dee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF6EC66P%2F20251228%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251228T061755Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCFz65RyvOzqsm4r0nnGEOXWX6kh3RoTBbWV8OaPkJQEwIhAMEVMY15AREa88ZWXOokW9g%2FMUNyLa94MHDLxoUE8YpdKv8DCH8QABoMNjM3NDIzMTgzODA1Igwy1QGm6WMGsPCGFJ8q3AMV83p0f1NHT5XS7%2Fg9G8thH6EolsemsmS1luSF3M2D9xvF9DQwT7WhH4FqCq%2ByYiDtMrUsanQjXd6WGq%2B59rbLDzl12TGIatGAzxfRf412F5JVf3IGYAFI90IpPgyLkS7jJBXkDG7eNdSAoRzSoROR%2FHc2%2FfGJnWxUVlwcQB2p640jt8XLEgKbYG3x6lO7%2FGu6KmuEzriY0O2tcS1d8uEYlbs%2Bch%2BSSm39EeEEHrjcMffuQtDHxWobJcjo9ZB9%2FkSN1dIb2sXAbd0Ugv%2FahCaEQOB2fgqjr2WwEm4kPdKkNGmfHq5rmcPNtcAvervcSGQbSdL5pKjBdHTGco6LvgcJcGGGwNzhHiqdtCqDG6iCfzI4iYKK%2BguMTpFpllZj0Wol7s84czxiLTe%2B1rQcE%2BxH48pm21byrvMuiMPTqIvWgJzqu9mWLCA5WgsGBSlnfKNJKRPC%2BOQ0UWMlzKwI0frqA4ZO5ie%2F7VPFIaZfnce0yqj0%2B%2FfUx8YIZ0N0NlBwNcCH%2F0iGw7Ww5BBEa1jIieHjrjfd5H0igjafuWVKeBs8basyuXt1d9pbG3arMi4koygxjgsUnVceC1sFNFleY5EF1nif%2FsHfgAmEviX1eWMV5DIYWRDSLj6SHo3z0jDplMPKBjqkAUHKutiGcPvOhIEUV5lYMWmhUL1pp%2BAAAEx9Zfrs083TInQaAicVwI2QBl2j5NVWxnGW%2BoDd1tVqQ9Mt0Cs6QbDxWvxlGIl%2BPUSXSa%2FMlKGgy0NcOmIW3m3MQuMNq10wFYthM9NdHmP9F3aQ3%2BuLJkZHg%2Fzp9FUh8Z3e49D2hBhVxIB5mtPEFPex%2F545tij84tNdnmn94zv8BcNgI11gjgOeReY0&X-Amz-Signature=f6a59baae1bb9005931aeed2ee49d996d8333fbf1acfc0a8ce9441e3dd76c0df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
