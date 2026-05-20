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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VU5MYG5S%2F20260520%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260520T200029Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJGMEQCIA3ENW9pA8Kr6xU4hbsQjYfbM8Lc7Ypv6Ejk3qJGlYVvAiBuo%2FlfJe1VSK2oh1MEPTdaixwHxdcKfZpmVkN%2BiB5%2B4SqIBAj0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMam%2B6d0Jjm9qSAZO1KtwDc0CLJ5Em1Y6PGK8dUsLILFWunY9EUZ9pZmvDrrWr3tTrb42DYNbp7aiWTshm62m%2FxkhBFUU3a%2FT5OZMVvOXBpDzOFxGqeLGefG3fwmZ2V8KzzVMJasFuJazR6a%2FeatJfJ5Z6RI%2FL77T9YWHwMcguNiMyCowgs80GVuVjGYpuEZelRiDePyPKNkTco7%2BL%2BaqoyXNqWLgaD2pnudkl0iR8fVypXp4B72grD17tsbELXLjCPuTMGeahslMQVvyayhZdcANfG1cQSKmuHHa5T9Ljdh7%2Bvg0Kv3gPOYD7pPI1g8E7pw4x3UzazFU6RF%2Fk47xXYB0WCv2NpH9KsGqQ6stMmfBbjcK5lGmmhJhXApOuvYqzqHp3qnI%2FojsFIyOtzlskHjlWQnOGl4PK%2FkJulm%2FSb3c%2FH0n7RVCcdo1poo1a3seLoG4rWI9Jf0Rp3yc8b2hef1IAYy%2FAh%2BWFanySAg2mXa2w4d%2FHX1J4eS%2BhxamvBgBPT4llzqS7FHAs8wYuCzFxxXIA6PbrqO1MNcZga4iUpA7UfWhNTcWiHUhsvizP3IqQTo7sa1rPd%2FENtXNhDuFG8BA%2FNmEberzTDv%2Fh5ldJm0p4IuZWS%2BUI57gFOr%2BTcmStFPtsrufg%2BQ0dEcQw8ZO40AY6pgFFlP2zwkJtwCumCsI7XcCnz%2B6Z%2BSEjZKN%2BL5woWTEA7OivgOZjZNf00QlPNZn%2BXBfsQh75WM2S44%2FvIBeXxavFhbhQMpqJM5O1WUe5uXNevsztdAt3YNjuYIVWz%2FTilyx0VfwyZw5pp0USjtjfvzIuzOq36YFV1%2BHY5cKtMJ5ygtshelB%2BgTO0DwlpnwMsZGAAz%2BM2f%2BHYZiANEsnyDwM31Ni93yqB&X-Amz-Signature=e99741bab70238d3ed98ac9d782d942c8871c1443ea53a6db9cc0c795a1a9c34&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VU5MYG5S%2F20260520%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260520T200029Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJGMEQCIA3ENW9pA8Kr6xU4hbsQjYfbM8Lc7Ypv6Ejk3qJGlYVvAiBuo%2FlfJe1VSK2oh1MEPTdaixwHxdcKfZpmVkN%2BiB5%2B4SqIBAj0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMam%2B6d0Jjm9qSAZO1KtwDc0CLJ5Em1Y6PGK8dUsLILFWunY9EUZ9pZmvDrrWr3tTrb42DYNbp7aiWTshm62m%2FxkhBFUU3a%2FT5OZMVvOXBpDzOFxGqeLGefG3fwmZ2V8KzzVMJasFuJazR6a%2FeatJfJ5Z6RI%2FL77T9YWHwMcguNiMyCowgs80GVuVjGYpuEZelRiDePyPKNkTco7%2BL%2BaqoyXNqWLgaD2pnudkl0iR8fVypXp4B72grD17tsbELXLjCPuTMGeahslMQVvyayhZdcANfG1cQSKmuHHa5T9Ljdh7%2Bvg0Kv3gPOYD7pPI1g8E7pw4x3UzazFU6RF%2Fk47xXYB0WCv2NpH9KsGqQ6stMmfBbjcK5lGmmhJhXApOuvYqzqHp3qnI%2FojsFIyOtzlskHjlWQnOGl4PK%2FkJulm%2FSb3c%2FH0n7RVCcdo1poo1a3seLoG4rWI9Jf0Rp3yc8b2hef1IAYy%2FAh%2BWFanySAg2mXa2w4d%2FHX1J4eS%2BhxamvBgBPT4llzqS7FHAs8wYuCzFxxXIA6PbrqO1MNcZga4iUpA7UfWhNTcWiHUhsvizP3IqQTo7sa1rPd%2FENtXNhDuFG8BA%2FNmEberzTDv%2Fh5ldJm0p4IuZWS%2BUI57gFOr%2BTcmStFPtsrufg%2BQ0dEcQw8ZO40AY6pgFFlP2zwkJtwCumCsI7XcCnz%2B6Z%2BSEjZKN%2BL5woWTEA7OivgOZjZNf00QlPNZn%2BXBfsQh75WM2S44%2FvIBeXxavFhbhQMpqJM5O1WUe5uXNevsztdAt3YNjuYIVWz%2FTilyx0VfwyZw5pp0USjtjfvzIuzOq36YFV1%2BHY5cKtMJ5ygtshelB%2BgTO0DwlpnwMsZGAAz%2BM2f%2BHYZiANEsnyDwM31Ni93yqB&X-Amz-Signature=e33426353cba0c906a7f9175a7bab2f6d4633ee5b9392a673379e676b7a971f1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
