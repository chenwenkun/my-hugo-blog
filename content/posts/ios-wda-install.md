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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RLXDLTMF%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T132632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJGMEQCIBGkMWsKy7zQn0r16bJS3oBK3IxGZiyycfsQ4btgbsHvAiB9%2FzA2jBZh962RTuLrq0LMLIadZQKOqQ6Ti2gq%2B%2FWEgyr%2FAwhBEAAaDDYzNzQyMzE4MzgwNSIMCwV7YM0S3ql6C5bqKtwDOoaCe7svwtq8jgb%2FIQvcsCMi%2Fa%2FE67SROCHZRijO89Q%2F69P4mWy9f%2FtGuBVRql%2FGJd5KgqJoIeitGUfg7EHelOz1basgW%2F%2FvHdViChrKgaucVm37nKu9i1XDJf1DzjvV7Yy%2FsQ5PgyaPD%2FBeLZAH3tZIh4oYvdzaRmX%2BesShm%2FUCWx6kH1W28i87PP0Oq5ezGZuRTErpZR3WO3FJF5zx%2FL3U%2BMyxlx1bl%2BkrgGdQ%2FbXpoKClmyciH3cTvPJG9AfCloDHBQnMkncVnnfNkZWhQNaW%2FXfXiRTJQO8uZTD7lrKQLu0XOMMzPUBNZGXgtACMpO%2FYabWTbI9v4xhu1Nair6iuTxwV64dhBegHgVmiwfj3hDHzcg3NXHMi8uHmH4OjnSr%2F2SsIdAf7FLC3jX0ILXqs9vzjWKpVwZ2khJ7Ahn%2BRyzo%2BJVSe9HlbNj85x8yavNQ%2B0m6%2FeZ%2FKyVOb2U2sd%2B%2BrAQGzMgmEShYirui3rQQmYWk9fHgNHmhdfyWSTzh%2FWwOzISsWTuvrOvq88s8qvB0jQxvWBFApqLNT3kNMt%2FteO3gkPbLZuGj4AUHHpW%2B0CD4jmjTGDVXLutLsy0DUalJ9Xa1bBTnkRO7D9x0bE%2FsC6sSrM%2B15M%2Be2dLsw4cW50QY6pgHYIDae9SOqwgWvDL1HBlkidSOxbw7jzx8uuwR9RtMOMQOaRAWDu0P28oicbB%2Bxcp9aNmKZhpDQDqxBEZHjUkSELZKUgK%2BGS7W4VO9bOZhu9rMvzeM9I74s6SyHR3v6rWTidP6%2B2p1u963EO30CW1uTaWCxdDQ2aG9JaQWN6XNhCiLTcp%2FSKZyRpnRsCx9I9%2FXYKe5IRLKNsZt%2FHKQgr9PrGNaOFDZe&X-Amz-Signature=e207810d798038d79989549ee1d78c1f809abcb2cfa40ca35fb545178f006c26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RLXDLTMF%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T132632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJGMEQCIBGkMWsKy7zQn0r16bJS3oBK3IxGZiyycfsQ4btgbsHvAiB9%2FzA2jBZh962RTuLrq0LMLIadZQKOqQ6Ti2gq%2B%2FWEgyr%2FAwhBEAAaDDYzNzQyMzE4MzgwNSIMCwV7YM0S3ql6C5bqKtwDOoaCe7svwtq8jgb%2FIQvcsCMi%2Fa%2FE67SROCHZRijO89Q%2F69P4mWy9f%2FtGuBVRql%2FGJd5KgqJoIeitGUfg7EHelOz1basgW%2F%2FvHdViChrKgaucVm37nKu9i1XDJf1DzjvV7Yy%2FsQ5PgyaPD%2FBeLZAH3tZIh4oYvdzaRmX%2BesShm%2FUCWx6kH1W28i87PP0Oq5ezGZuRTErpZR3WO3FJF5zx%2FL3U%2BMyxlx1bl%2BkrgGdQ%2FbXpoKClmyciH3cTvPJG9AfCloDHBQnMkncVnnfNkZWhQNaW%2FXfXiRTJQO8uZTD7lrKQLu0XOMMzPUBNZGXgtACMpO%2FYabWTbI9v4xhu1Nair6iuTxwV64dhBegHgVmiwfj3hDHzcg3NXHMi8uHmH4OjnSr%2F2SsIdAf7FLC3jX0ILXqs9vzjWKpVwZ2khJ7Ahn%2BRyzo%2BJVSe9HlbNj85x8yavNQ%2B0m6%2FeZ%2FKyVOb2U2sd%2B%2BrAQGzMgmEShYirui3rQQmYWk9fHgNHmhdfyWSTzh%2FWwOzISsWTuvrOvq88s8qvB0jQxvWBFApqLNT3kNMt%2FteO3gkPbLZuGj4AUHHpW%2B0CD4jmjTGDVXLutLsy0DUalJ9Xa1bBTnkRO7D9x0bE%2FsC6sSrM%2B15M%2Be2dLsw4cW50QY6pgHYIDae9SOqwgWvDL1HBlkidSOxbw7jzx8uuwR9RtMOMQOaRAWDu0P28oicbB%2Bxcp9aNmKZhpDQDqxBEZHjUkSELZKUgK%2BGS7W4VO9bOZhu9rMvzeM9I74s6SyHR3v6rWTidP6%2B2p1u963EO30CW1uTaWCxdDQ2aG9JaQWN6XNhCiLTcp%2FSKZyRpnRsCx9I9%2FXYKe5IRLKNsZt%2FHKQgr9PrGNaOFDZe&X-Amz-Signature=e509320c485f54e08d766637bf171a35de7b09381307f7d342016ea64eb20e7e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
