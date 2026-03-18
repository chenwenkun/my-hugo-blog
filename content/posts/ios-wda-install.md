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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z4MUJWPC%2F20260318%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260318T184344Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJGMEQCIHRBQI%2FW2oZDCVyH%2FZkWmbG865Yt5oFc70LJZjXDT8HIAiAMwRjCFYLNpPkZ8WrlH9vtl8cJkPnFg2tiODLl9ka9GCr%2FAwgLEAAaDDYzNzQyMzE4MzgwNSIMq%2BNyYSvv%2BPfZ6EBMKtwDs4eYfSqIM6bwaJSofPrT9zRkITjaKlX81az4zXjCNHlprLtT%2F%2Fv0VQ74IARMeCEoiiWWpxitgkbD5ZiybdnexP0T9djnNPw2QhJam3IHkacyTWJXdj7SW6CtFMCs7%2FzKj1h7js4xYENc7KQzbG1AugM6%2Bmwx70BlZdKzZBx14hi9oM%2FaIqeOcAh5Kx5i6ej8gZE%2F45AJckQshNWXinqqcSUZZTu1aFtPheiDsgS7eqrahZHuEcGWRfZPBu0nn4ZXMiWet0tY8CbWiAoR8Wl1vugc27Cbvs0%2F6ZOEJVmglRXW87gtiADNxFyG7ZZp2fOunug9u4PN0rJYUy0wGdsQaRPyy5c6KbL4SJ0dDxNmqyHk0b0NKUgC2WDoV2fkQp4nhJo%2BdouApB2uAtohGv0gUKGVo5txyN1so40j%2BCezHO2fS1TUbi5kJVFVTc9scP4esjYIDttQFrLwSbCcb4ImtOFHC0N85%2Bq0DW6kRameeO4bxb2BHAnS6aP5JQqCsLS1Gis5gFK38Vw8FtIQ2PtYi1R0dtnkpc2f83tirFVgwK9V%2FiCd%2F4zRuZZBYVuSElbUzWwg1MKesNpFCXE2AA%2BTVZzy3pxyjpVZka1HWeBE9KzdLVqa%2FB95kquBjAYw0cLrzQY6pgGQ4vbcPCa4stHq6ElZ7gH1fMV%2FeSxoEBjdVZFf8Cgds9Z5O7YY4GuRZbNDziDut7YBe0tsT3ORy5gGomE4aTWDA%2BlAyqopQub4BYZJnDhveI4A0VHrIbamvse6cCxl3gYbJXv7Ml7KXXDJsFHZKY8Mpp8cc9VnlN90Y%2BgMnQa6v3K6939mMKLFJ1cn92eK9aP9M37ZAq0R%2F6nX2zweJeEwIThzIuRh&X-Amz-Signature=f53d4b37f73b783b904c885cb31badc58b0ce674c2565a67e6d8dd682e55644a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z4MUJWPC%2F20260318%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260318T184344Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJGMEQCIHRBQI%2FW2oZDCVyH%2FZkWmbG865Yt5oFc70LJZjXDT8HIAiAMwRjCFYLNpPkZ8WrlH9vtl8cJkPnFg2tiODLl9ka9GCr%2FAwgLEAAaDDYzNzQyMzE4MzgwNSIMq%2BNyYSvv%2BPfZ6EBMKtwDs4eYfSqIM6bwaJSofPrT9zRkITjaKlX81az4zXjCNHlprLtT%2F%2Fv0VQ74IARMeCEoiiWWpxitgkbD5ZiybdnexP0T9djnNPw2QhJam3IHkacyTWJXdj7SW6CtFMCs7%2FzKj1h7js4xYENc7KQzbG1AugM6%2Bmwx70BlZdKzZBx14hi9oM%2FaIqeOcAh5Kx5i6ej8gZE%2F45AJckQshNWXinqqcSUZZTu1aFtPheiDsgS7eqrahZHuEcGWRfZPBu0nn4ZXMiWet0tY8CbWiAoR8Wl1vugc27Cbvs0%2F6ZOEJVmglRXW87gtiADNxFyG7ZZp2fOunug9u4PN0rJYUy0wGdsQaRPyy5c6KbL4SJ0dDxNmqyHk0b0NKUgC2WDoV2fkQp4nhJo%2BdouApB2uAtohGv0gUKGVo5txyN1so40j%2BCezHO2fS1TUbi5kJVFVTc9scP4esjYIDttQFrLwSbCcb4ImtOFHC0N85%2Bq0DW6kRameeO4bxb2BHAnS6aP5JQqCsLS1Gis5gFK38Vw8FtIQ2PtYi1R0dtnkpc2f83tirFVgwK9V%2FiCd%2F4zRuZZBYVuSElbUzWwg1MKesNpFCXE2AA%2BTVZzy3pxyjpVZka1HWeBE9KzdLVqa%2FB95kquBjAYw0cLrzQY6pgGQ4vbcPCa4stHq6ElZ7gH1fMV%2FeSxoEBjdVZFf8Cgds9Z5O7YY4GuRZbNDziDut7YBe0tsT3ORy5gGomE4aTWDA%2BlAyqopQub4BYZJnDhveI4A0VHrIbamvse6cCxl3gYbJXv7Ml7KXXDJsFHZKY8Mpp8cc9VnlN90Y%2BgMnQa6v3K6939mMKLFJ1cn92eK9aP9M37ZAq0R%2F6nX2zweJeEwIThzIuRh&X-Amz-Signature=f9fc19777a9ef809853c5cf1f6d57f2246b2947e4ac3ade72e10be8e10ee1912&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
