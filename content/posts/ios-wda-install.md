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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667VCOPQDP%2F20251031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251031T005222Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJHMEUCIQD2XQFNeAmpQBujs8MxuGvuxgemKrv8Mw8fuW8wOrP5aQIgWMJNUdrzUfm%2BCkV8qtoLytFFoeGVyJoQKPjRbTrgpUAqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOXAE2vMz%2FPOV89j%2FircA%2F78%2BwOczjiJ36OPxBWBZ3gMjyv5X2ulGL2IWzP0cUcwcya3gTRPc2k0lRJY7UNcS9F82e1ElHpyUWIrnXIKUD66I8Zzi4eO3hdXNdcnflW69nAnK8RR1OivO3Kwc79Z2nlUjz%2BVyDTTOpMs4cMo%2F04NKM2gxe8MgU2RDSCzZsqOc9rKYkYR%2FECGIFiEadNwILDNGihYk8d8Rv4M0A60iG%2BJblyCepVhP0ANteZquEswD3jgAKZTTL232cFM15s6S3%2Bcc9hJ5VEVfBuSScuMiFhcGG44QmaF0Z3kA1fLSyjuflvA4HJ2ptIyGzKgyrPKIscNjTmERoj6kxShXYFiJKqEKY%2FGiiJyJF7brwm%2FEe%2BwosYqq8LurdZGuswqLtiZstW7M93xHw7IRDJ4ohH1Kn%2FTDNaIh4GbS%2B7Ew9ZXt2La1lNq7pVCOBSQndln%2BbMeOfNfUbJiW8b%2BbDFq0W9%2Fzuw4hca4eqSDTUvYY0RbVNLe5PsvgSaiS9Yoc%2B7GkPHMaGaKiCEwJtx5BLnqn86YMoKMCOVO2u6%2F4tJOsmJwNlyLWN%2BrCHeMrCGG%2BNECysuzFk5IIMnklg4GqVwkEszds3xbSfWg%2B8ZhQLwdJMMeSUmxgw3VJh2dBU7FanB6MIKKkMgGOqUBLRoyQo73DsPyWkgYU5vx7jIe5laBIjePwqPOGIKhKPXLqLTT40THcO2CwHzAy3BHO3xN6RoVwejpt5uU%2FyMxN%2F8pytAUm7dlGc4P5x1fsAs7K3L1VST%2FlFC3yCP0OUpYy9VZQFWoeQ2z8I2WVj1pGHcivJbO0CWxRWtKrOcbekeRQbPZEik5GHbmKyhOzuXnbnF2wvP%2ByIeZUdD1wRmkjIZKyeBK&X-Amz-Signature=774f81894c8409a4ec528335dde4cbbad1fd4756e9995c10cb53a8104d924a27&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667VCOPQDP%2F20251031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251031T005222Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEEaCXVzLXdlc3QtMiJHMEUCIQD2XQFNeAmpQBujs8MxuGvuxgemKrv8Mw8fuW8wOrP5aQIgWMJNUdrzUfm%2BCkV8qtoLytFFoeGVyJoQKPjRbTrgpUAqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOXAE2vMz%2FPOV89j%2FircA%2F78%2BwOczjiJ36OPxBWBZ3gMjyv5X2ulGL2IWzP0cUcwcya3gTRPc2k0lRJY7UNcS9F82e1ElHpyUWIrnXIKUD66I8Zzi4eO3hdXNdcnflW69nAnK8RR1OivO3Kwc79Z2nlUjz%2BVyDTTOpMs4cMo%2F04NKM2gxe8MgU2RDSCzZsqOc9rKYkYR%2FECGIFiEadNwILDNGihYk8d8Rv4M0A60iG%2BJblyCepVhP0ANteZquEswD3jgAKZTTL232cFM15s6S3%2Bcc9hJ5VEVfBuSScuMiFhcGG44QmaF0Z3kA1fLSyjuflvA4HJ2ptIyGzKgyrPKIscNjTmERoj6kxShXYFiJKqEKY%2FGiiJyJF7brwm%2FEe%2BwosYqq8LurdZGuswqLtiZstW7M93xHw7IRDJ4ohH1Kn%2FTDNaIh4GbS%2B7Ew9ZXt2La1lNq7pVCOBSQndln%2BbMeOfNfUbJiW8b%2BbDFq0W9%2Fzuw4hca4eqSDTUvYY0RbVNLe5PsvgSaiS9Yoc%2B7GkPHMaGaKiCEwJtx5BLnqn86YMoKMCOVO2u6%2F4tJOsmJwNlyLWN%2BrCHeMrCGG%2BNECysuzFk5IIMnklg4GqVwkEszds3xbSfWg%2B8ZhQLwdJMMeSUmxgw3VJh2dBU7FanB6MIKKkMgGOqUBLRoyQo73DsPyWkgYU5vx7jIe5laBIjePwqPOGIKhKPXLqLTT40THcO2CwHzAy3BHO3xN6RoVwejpt5uU%2FyMxN%2F8pytAUm7dlGc4P5x1fsAs7K3L1VST%2FlFC3yCP0OUpYy9VZQFWoeQ2z8I2WVj1pGHcivJbO0CWxRWtKrOcbekeRQbPZEik5GHbmKyhOzuXnbnF2wvP%2ByIeZUdD1wRmkjIZKyeBK&X-Amz-Signature=31ad7ba46e1cf2b020eb7eef282f48b6ae5ca1bed5239547d98e55f11b390e4f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
