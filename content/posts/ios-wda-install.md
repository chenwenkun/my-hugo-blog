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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646BVYSBH%2F20251126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251126T122329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHUhRM5D%2FT0ncqRPl1fCLAHcFLWyo3Qs%2BnEDpFSlkCrpAiBv389mTOpaKw3NCowb9%2FEzadlMO9roHMH79Q3UAYFQKiqIBAiF%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM7w24JtyLQy%2BX7%2FeUKtwDV5znedF7lIIVfAzgZOblXioQhOiDXlq%2BuuuPeQ6ozQaU%2FTs%2BbpThUxYeGLTeylNA0EAyzC34aoVIzmUoLHsNBZlrInKNloyzhuuj5PAf7hOc7ChzFy18f5B6h%2Bel%2F24hpkVcqdTRoRJb8x1sDxca4iNVcjxf%2FjF9Kr0GgKkcSc%2BJVsOHn3PYHf%2F5eNYOo5w8iLVb0Jc1T%2BDuVlauVH%2FIJTTbipITTSRz8yzdZyO5NKD7S8SjEFwcK04ozeN61WFHUeBxEa3bKfLln5PuDHJQBIx4f%2Fb5Q%2FHP5x4u7bggK2IYeTve1dZ8PhTI4WVmcJWwdr960m8hHpbcYycH%2Fctb%2FVo%2BsXITYgiVk4M2kg8kpBHo%2BirS31IpS7QKrv2VYgu5wupG9ddPKT0gQeqT3nHRhDdKjtTEzJFZft8sIyHUwPDAnJp0ukl4IJyTRnLim8BH1hrGxyjDwvlkng%2F5zSli3tVvy228IBXQsLVuqJpSLuYsjAv0wA593goACrXnrqXD4AZFYGBOaEgZ%2F5kLmRdn09kp4vJAx6ycKrBZ5hW7uDsPKBqvsDyNBzbjmBBZ%2BMh3sN5TfIJ4z15vzUUt6j3%2Ff3YKYLDinNUif%2FIexa1EQ8trO%2BrPKkabD2lqKrsw792byQY6pgFC%2Fa6pZF7FPudpjmMmbUB1Ic6Vgf4%2FbfTsjCEVwP0QxL8rCuqXLs%2FIzgjZ88nwG4c2pOww8mw4k2oZmNgQa4uRhBbpb5Mfm3uq17eVFSH6fT8PuImVhBr%2FZmTnAPLaxLShF11t9PZ3Bwlzg3Dj4Khc4O2ipXjDodKxouT3cxUY0GkrQXLyr9QDCQZQwSE8fmMedfObQFsDKJFO77D2HdOC4Ti6PKUK&X-Amz-Signature=300f558d38a03021972dee25dae771dbc711dea8b2c8031e15f0f31a67bf1cd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46646BVYSBH%2F20251126%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251126T122329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHUhRM5D%2FT0ncqRPl1fCLAHcFLWyo3Qs%2BnEDpFSlkCrpAiBv389mTOpaKw3NCowb9%2FEzadlMO9roHMH79Q3UAYFQKiqIBAiF%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM7w24JtyLQy%2BX7%2FeUKtwDV5znedF7lIIVfAzgZOblXioQhOiDXlq%2BuuuPeQ6ozQaU%2FTs%2BbpThUxYeGLTeylNA0EAyzC34aoVIzmUoLHsNBZlrInKNloyzhuuj5PAf7hOc7ChzFy18f5B6h%2Bel%2F24hpkVcqdTRoRJb8x1sDxca4iNVcjxf%2FjF9Kr0GgKkcSc%2BJVsOHn3PYHf%2F5eNYOo5w8iLVb0Jc1T%2BDuVlauVH%2FIJTTbipITTSRz8yzdZyO5NKD7S8SjEFwcK04ozeN61WFHUeBxEa3bKfLln5PuDHJQBIx4f%2Fb5Q%2FHP5x4u7bggK2IYeTve1dZ8PhTI4WVmcJWwdr960m8hHpbcYycH%2Fctb%2FVo%2BsXITYgiVk4M2kg8kpBHo%2BirS31IpS7QKrv2VYgu5wupG9ddPKT0gQeqT3nHRhDdKjtTEzJFZft8sIyHUwPDAnJp0ukl4IJyTRnLim8BH1hrGxyjDwvlkng%2F5zSli3tVvy228IBXQsLVuqJpSLuYsjAv0wA593goACrXnrqXD4AZFYGBOaEgZ%2F5kLmRdn09kp4vJAx6ycKrBZ5hW7uDsPKBqvsDyNBzbjmBBZ%2BMh3sN5TfIJ4z15vzUUt6j3%2Ff3YKYLDinNUif%2FIexa1EQ8trO%2BrPKkabD2lqKrsw792byQY6pgFC%2Fa6pZF7FPudpjmMmbUB1Ic6Vgf4%2FbfTsjCEVwP0QxL8rCuqXLs%2FIzgjZ88nwG4c2pOww8mw4k2oZmNgQa4uRhBbpb5Mfm3uq17eVFSH6fT8PuImVhBr%2FZmTnAPLaxLShF11t9PZ3Bwlzg3Dj4Khc4O2ipXjDodKxouT3cxUY0GkrQXLyr9QDCQZQwSE8fmMedfObQFsDKJFO77D2HdOC4Ti6PKUK&X-Amz-Signature=8525aa56c54c2875e0707d7d11b85ce4f50049205cb0d55028cbfade004d6a4c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
