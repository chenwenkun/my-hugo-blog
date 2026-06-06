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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662GAWXVBJ%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T082236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICPGMEEsERdKiDcNWpbJ7u%2F61Kywzk7oTjiiaKJjj6tKAiBeQsroFS7n0irlNLxEbBdCxhSSXnVzUmvrmJ1XU8ZdjCqIBAiB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM%2BmjxrK6PP9xp60g7KtwDMJ4tnlevYIeFF%2FJHvmSTuRrUz5h6wHN%2FhWtBcjv8Ix1ygOzIEubB%2F52qZG46cU39kTsc37ayy9%2BYTPA8SVR4Bxy47KJu5rlDgSC%2Fc9mEvNqKSpx%2BRmIJimaMsld1NeDhDQzWPohITORvEZouLAPYBmOAWNPYcnAVNBvfB%2F2dUhhShdW6FDW%2FfbVVTYEnv2b%2BkuMPhEAhSzHcqRvOYDQ384owKv6U4Kkiw0hAnZzPnysmNtzxPnjwBNcFnnDCPP9SC3U4Edwa1nGOP%2FyjkvJwWnL2TTdRRQ5I35%2FwTx6Ls1yhuXQ%2FWQisYtN79TpMCfMiJGHwP4ryNTbXbT7yjppR%2BWvR5BL9NenUxX8FJcdJyWxV2rs%2BJ4u4C69ytQ3ncrj%2FfVXilcjXEd4bJxHsH2lzqaZosmNKqrYWlB8pmyCR%2F7nNaTipzI%2FIZEXO0rsKNVcijIAPDigDpEGWpllyVq6sZLcwkDwzUmkAGKlpzO83jnlTErMcKdBJxE8%2FH5y30N5IdJ9ObJ92Rn0vuu4%2BmHkjX25y0HnA4GwdSW%2FmkXt9qjbMGQILJKKlup8ury5d6dPsGAqjVBqpiWUyyRWxxaSs7XgSc07UJ3XxhGorR8UD5gVDtyILIwm3E6RNv5ow16yP0QY6pgGJwYRA3Cw7tI47powpOuJMGubRtYXHboXBnR6e2j4UYp%2B5EyB7NSYXF%2Bfsb4IliQgGGY3hG4z99dUl2asjAS4wwyk%2FX6vPX5wjj5vnz7x0IpB6Yhov2%2BTFiWZoE1mv6ySUunKPQklBqL8JKo37Lub1VleqcqgtKNRCn4ggw8OLMac%2F15J9b8zlp%2Flja2dKiCE4R%2FXTOeWdiV1ZHfyfUkPeWam0QaJ6&X-Amz-Signature=95b78e503107ef4bce47fb4ba51190dcfe30a8a8bab8ed710ae3cb1b77d8dfa5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662GAWXVBJ%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T082236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICPGMEEsERdKiDcNWpbJ7u%2F61Kywzk7oTjiiaKJjj6tKAiBeQsroFS7n0irlNLxEbBdCxhSSXnVzUmvrmJ1XU8ZdjCqIBAiB%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM%2BmjxrK6PP9xp60g7KtwDMJ4tnlevYIeFF%2FJHvmSTuRrUz5h6wHN%2FhWtBcjv8Ix1ygOzIEubB%2F52qZG46cU39kTsc37ayy9%2BYTPA8SVR4Bxy47KJu5rlDgSC%2Fc9mEvNqKSpx%2BRmIJimaMsld1NeDhDQzWPohITORvEZouLAPYBmOAWNPYcnAVNBvfB%2F2dUhhShdW6FDW%2FfbVVTYEnv2b%2BkuMPhEAhSzHcqRvOYDQ384owKv6U4Kkiw0hAnZzPnysmNtzxPnjwBNcFnnDCPP9SC3U4Edwa1nGOP%2FyjkvJwWnL2TTdRRQ5I35%2FwTx6Ls1yhuXQ%2FWQisYtN79TpMCfMiJGHwP4ryNTbXbT7yjppR%2BWvR5BL9NenUxX8FJcdJyWxV2rs%2BJ4u4C69ytQ3ncrj%2FfVXilcjXEd4bJxHsH2lzqaZosmNKqrYWlB8pmyCR%2F7nNaTipzI%2FIZEXO0rsKNVcijIAPDigDpEGWpllyVq6sZLcwkDwzUmkAGKlpzO83jnlTErMcKdBJxE8%2FH5y30N5IdJ9ObJ92Rn0vuu4%2BmHkjX25y0HnA4GwdSW%2FmkXt9qjbMGQILJKKlup8ury5d6dPsGAqjVBqpiWUyyRWxxaSs7XgSc07UJ3XxhGorR8UD5gVDtyILIwm3E6RNv5ow16yP0QY6pgGJwYRA3Cw7tI47powpOuJMGubRtYXHboXBnR6e2j4UYp%2B5EyB7NSYXF%2Bfsb4IliQgGGY3hG4z99dUl2asjAS4wwyk%2FX6vPX5wjj5vnz7x0IpB6Yhov2%2BTFiWZoE1mv6ySUunKPQklBqL8JKo37Lub1VleqcqgtKNRCn4ggw8OLMac%2F15J9b8zlp%2Flja2dKiCE4R%2FXTOeWdiV1ZHfyfUkPeWam0QaJ6&X-Amz-Signature=874632d16eb631c13e3ff938838485d9b92dea411c1a16663611967fb50b571f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
