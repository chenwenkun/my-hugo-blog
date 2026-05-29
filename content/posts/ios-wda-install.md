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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R3SKZQXX%2F20260529%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260529T093311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFSwZoZ4zb9me6fxGkcVAYVJXQpaQahr6KSOeamAR0oLAiEAhKHSvDlBNV6QPf%2FMNGZPQCC9b1pYITekYkJ9CGPgxHMqiAQIwv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCx3QZpOB60fwNadXircA0ZFkVWFAvNMJH27VGmQIJWyveqeWqVpHrVPdRn2g2RBQUnxtyyHqf0O5fRkdwp21JriSE61f%2BYDFvDs0afOSd%2FmfuEEgWci%2FtQkSd1ro29U8fCOeIe45%2FAVzkdVXVxNHvB2rR9a5e9fxcfq5umrnGyn6vnE5veDlRwZ71rz7zjmNnd2Ck9Et%2FYtiitfOLe5OKhvujDZyYUsde%2Fn54cMRnFwSX7rtRi5QqbD8mwfRqs4PzfYA0GwCkdMQfoWcEccwqFS4aMfqKZ2LQW8T9gzpYDOEE2M0dsC0bIDC%2B0xtiKHFg9Y9tcANoiRl9Jz8WKFPIjsrv5aNTTbUQnrPwH4C0T6bdsUBB1EbFTXAmSiWYBqdAs7k2t5%2BVAPGby6l72RYpSGcv5gUQXLTJtYCxFWf05fD3%2FpItvA1JlkroTH%2BlveVgn4DoQsAWOZsbEC%2BUCwp%2BzFNo24ZCwzwff7%2BX%2FJeiK6pD2svGguYtk0U2PZwY9m1DRelm%2BirfZE28RBW9oIKg9V8bCObvtNrgp7i4garzKVmKqsBX7iVHhg68jc%2B%2FzKigWPLmQwD3OtUnsHWWfG6JrtululZba04VVw%2F5QYfbC%2BhMlVRKNM4f9NmMnrgm%2FCRiTIli6kG%2FvFvX9UMN6x5dAGOqUBQjT0VIJ54z5z21k2w6vTTrW1hyTGV37EsR%2BZ6J9rfnCB9e1kdM72OYrjip6RCjsS7usKpfREEhQqoMkGoQTftco9hXd5ka4nWpObXeKNmtrDSnsVRCUX1b45nrcAeyHKo1yPBXLlXmm8IiMP6VVXUlG2HsNKwlekcOY06niMse5VWx9HsprhGB1tK%2B2C4R5WArzn%2Fi7TQLQg%2F%2BfngSPMZzTUHN1f&X-Amz-Signature=ebd2cad9a4d921ef9d9792292c6c350f50872f0d5d2c7436045fe40f43e31101&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R3SKZQXX%2F20260529%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260529T093311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFSwZoZ4zb9me6fxGkcVAYVJXQpaQahr6KSOeamAR0oLAiEAhKHSvDlBNV6QPf%2FMNGZPQCC9b1pYITekYkJ9CGPgxHMqiAQIwv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCx3QZpOB60fwNadXircA0ZFkVWFAvNMJH27VGmQIJWyveqeWqVpHrVPdRn2g2RBQUnxtyyHqf0O5fRkdwp21JriSE61f%2BYDFvDs0afOSd%2FmfuEEgWci%2FtQkSd1ro29U8fCOeIe45%2FAVzkdVXVxNHvB2rR9a5e9fxcfq5umrnGyn6vnE5veDlRwZ71rz7zjmNnd2Ck9Et%2FYtiitfOLe5OKhvujDZyYUsde%2Fn54cMRnFwSX7rtRi5QqbD8mwfRqs4PzfYA0GwCkdMQfoWcEccwqFS4aMfqKZ2LQW8T9gzpYDOEE2M0dsC0bIDC%2B0xtiKHFg9Y9tcANoiRl9Jz8WKFPIjsrv5aNTTbUQnrPwH4C0T6bdsUBB1EbFTXAmSiWYBqdAs7k2t5%2BVAPGby6l72RYpSGcv5gUQXLTJtYCxFWf05fD3%2FpItvA1JlkroTH%2BlveVgn4DoQsAWOZsbEC%2BUCwp%2BzFNo24ZCwzwff7%2BX%2FJeiK6pD2svGguYtk0U2PZwY9m1DRelm%2BirfZE28RBW9oIKg9V8bCObvtNrgp7i4garzKVmKqsBX7iVHhg68jc%2B%2FzKigWPLmQwD3OtUnsHWWfG6JrtululZba04VVw%2F5QYfbC%2BhMlVRKNM4f9NmMnrgm%2FCRiTIli6kG%2FvFvX9UMN6x5dAGOqUBQjT0VIJ54z5z21k2w6vTTrW1hyTGV37EsR%2BZ6J9rfnCB9e1kdM72OYrjip6RCjsS7usKpfREEhQqoMkGoQTftco9hXd5ka4nWpObXeKNmtrDSnsVRCUX1b45nrcAeyHKo1yPBXLlXmm8IiMP6VVXUlG2HsNKwlekcOY06niMse5VWx9HsprhGB1tK%2B2C4R5WArzn%2Fi7TQLQg%2F%2BfngSPMZzTUHN1f&X-Amz-Signature=71b9e1060684fdb8763cd03ad1a5d3f8092a0bc2df941fba6e1760fdba90df85&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
