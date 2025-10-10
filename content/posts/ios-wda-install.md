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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBFNPJVG%2F20251010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251010T122135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJGMEQCIHvlIVQrPUblYD2llWOlOivwvf278Tequ%2BwQXYurujalAiABep0xmj8JkS9WDt74CmetKk5RRp%2F9wURwosNZfQcYByqIBAjt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMxjDgSLsB0Fq3X0gGKtwDXz4tnqWbh5oovOiHWiUU%2F87QOgcA9rgZdWDfQ%2F%2FT7KmV%2BGzGqP1C5GFuofIV4digqhDZE5z08ZrWguNtXGnfjBHUVu2uAw5auUdAMvByQFLysKlcxDgzbF5bpdAZxNKRguyE8atme0QXvvVHH8vO9rJORHooMRd7iJX%2FKDKjFX5hoBJxaq7cJeKSsPofTzRYfzcid5jJ00XUpziIeC9AvjWsNaeOhuEI%2Fmb5UyCGrJAUA8tTmhoMnqG0wErNbhN8D89Js%2FTgzQ8EW54oAznr6YxbaK9i2BxfO2%2BS%2FxHUj2Z%2B2BZC0EQptd1Zsm1SSbu2hfEAon5HUmmznZHE6mxM8LrZwc86alCfVp9u3lDtwJJu0jom9HM6Evslms9f18pQ5hGqeU21OTt%2FWZJ5udugawj7nSYjmvp%2BBDXibOaTTYC0uKsTHRNW2XI9Gb%2BQR1J9mz1ocjkonIDwwmkcZ9DLv6UWxIxrXQhp68FB9Ha2WUudebLLP2ewXp6KjqJGyeT3kSdCx708dGG1VqIzN%2BxEEaVdG9G4VPJVMmHg%2FWlMChtgQXGwgqou7qZkZgl8dt72wV3BJ5CllcscxaTSuqM6e2ByuZOmqZenaQjFDLpha9pYbdX3z4ouzIOUrd8w4NyjxwY6pgFDSWJ%2FmcGhnbCOMolUm7LpIGsD%2FA8znjy6KMnVO489%2BJ%2BYztznORNNXb5P%2FT3SOBmUtN%2B3h4YwEXVGBgGtx92NAxpc0ZhxvrsiPNGOJGQoK5ArcdDjsvw8ja9bVKjf%2B2ZHyivwEKiaCZZV3BVvZauZx0UUzJYpcFmxDncQ3%2FB5Wp88q4p%2BU5YjOb%2FUX1T3lKXoN60U0eFwe68wq81e1k%2BhNB2VMrbM&X-Amz-Signature=485d011f2756156bde1a85c5df61940bd35254cd79dbfd24615b7a6151b1efeb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBFNPJVG%2F20251010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251010T122135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJGMEQCIHvlIVQrPUblYD2llWOlOivwvf278Tequ%2BwQXYurujalAiABep0xmj8JkS9WDt74CmetKk5RRp%2F9wURwosNZfQcYByqIBAjt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMxjDgSLsB0Fq3X0gGKtwDXz4tnqWbh5oovOiHWiUU%2F87QOgcA9rgZdWDfQ%2F%2FT7KmV%2BGzGqP1C5GFuofIV4digqhDZE5z08ZrWguNtXGnfjBHUVu2uAw5auUdAMvByQFLysKlcxDgzbF5bpdAZxNKRguyE8atme0QXvvVHH8vO9rJORHooMRd7iJX%2FKDKjFX5hoBJxaq7cJeKSsPofTzRYfzcid5jJ00XUpziIeC9AvjWsNaeOhuEI%2Fmb5UyCGrJAUA8tTmhoMnqG0wErNbhN8D89Js%2FTgzQ8EW54oAznr6YxbaK9i2BxfO2%2BS%2FxHUj2Z%2B2BZC0EQptd1Zsm1SSbu2hfEAon5HUmmznZHE6mxM8LrZwc86alCfVp9u3lDtwJJu0jom9HM6Evslms9f18pQ5hGqeU21OTt%2FWZJ5udugawj7nSYjmvp%2BBDXibOaTTYC0uKsTHRNW2XI9Gb%2BQR1J9mz1ocjkonIDwwmkcZ9DLv6UWxIxrXQhp68FB9Ha2WUudebLLP2ewXp6KjqJGyeT3kSdCx708dGG1VqIzN%2BxEEaVdG9G4VPJVMmHg%2FWlMChtgQXGwgqou7qZkZgl8dt72wV3BJ5CllcscxaTSuqM6e2ByuZOmqZenaQjFDLpha9pYbdX3z4ouzIOUrd8w4NyjxwY6pgFDSWJ%2FmcGhnbCOMolUm7LpIGsD%2FA8znjy6KMnVO489%2BJ%2BYztznORNNXb5P%2FT3SOBmUtN%2B3h4YwEXVGBgGtx92NAxpc0ZhxvrsiPNGOJGQoK5ArcdDjsvw8ja9bVKjf%2B2ZHyivwEKiaCZZV3BVvZauZx0UUzJYpcFmxDncQ3%2FB5Wp88q4p%2BU5YjOb%2FUX1T3lKXoN60U0eFwe68wq81e1k%2BhNB2VMrbM&X-Amz-Signature=d1141d5c6fa162eebfb1cb139feb9ce5b7966c1cb0eb96652c923fd083c5cb63&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
