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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665EMJA472%2F20251006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251006T181545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA7uPFqyyUeyo08ixU%2BFXBtDmgkiq5PGyf37M3eIYFYRAiBE5JcYPhTB9cLjEkAGnNDzIpwnbOnubT6DKRbWmGH27CqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5kxooq09qkfxoUlgKtwDsU6ErwWWpo%2FH6PikrMUs9dkAyxpgyE0x%2BwquD5qLtjAHjRRSy%2FlHH61QgdM2JR8gAgQY2dQCYz6F%2F8XpEe4mAihj9Aqc1W2bwu4Zo727ZUynLXLlwRFMVbVZMZZr9YcopDTk3VLmuKBhwkSad5k%2FJ4Bmrf5rJIuFMNFmduPUuSYlxL77mGpsxk56pYAuasgpc7tR7WszpehIuz6UYmBGmCHXUB7Lzch2Ef5EVdF248XBCVykSOemsPFJPXeErK%2F23ZLnbZIinNVKOavAHT2a7AzlfkEXD5iPjb9Yl3I052xS4Lxr1VLfr89Vp2B0lf3CPYuGy5qLqwBJMXUVSTHmEVvCbYp46LYukqRzc4SM936beIWAg0lGrOF%2BzkglfjahnkHkln1WVCB32SvTHsWykx1lz6vQtJ%2BU7h7kgH%2FsmTlgShQuqQQIZUnDOcbRvJ4hubiPmNsUQ6JBX6NU7Z2CzGwQ6N3Jlz4c1pShlVHOM8PAp1%2FDrkKz62zZcGwS9ZJMd8n6IJKNA6ZCB4h8WP9M4Bf%2FANCcJ03fOX%2FO%2Bb76slKxcUpJeRGhIwT9GOPhDCr0VLz6BiX23fVGjUdW2n11Go6TdO5AdxNdjbCVSTdJmQjL%2BWiEA0m2N9OYKMYwpd6PxwY6pgE%2Fg1%2FcKJI4wM33FzBBFRdtXAA6I0ZwUuF%2Fym5bQfZjTtLIcO%2FzWPCa8NneTi9K6n9iPtjRHRuEu2PZeFuv12FnBXI0yeDM8V1av6snPBtFR0ea4LdxlNYDoUU3b2ux49wt08Nw4lCusD2bSZ33g6VjHobvEIu0nBL%2FBo%2FHZu5KwV7qi4xs6uzuFQnLFw6ZPKfnyI1UnSeMkP%2BlX2aP4q%2FRIulqxiQ3&X-Amz-Signature=0d65692416e4f14f5d7dde464c1a4b3f61df75d414290c1c3618c05e912b41cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665EMJA472%2F20251006%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251006T181545Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA7uPFqyyUeyo08ixU%2BFXBtDmgkiq5PGyf37M3eIYFYRAiBE5JcYPhTB9cLjEkAGnNDzIpwnbOnubT6DKRbWmGH27CqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM5kxooq09qkfxoUlgKtwDsU6ErwWWpo%2FH6PikrMUs9dkAyxpgyE0x%2BwquD5qLtjAHjRRSy%2FlHH61QgdM2JR8gAgQY2dQCYz6F%2F8XpEe4mAihj9Aqc1W2bwu4Zo727ZUynLXLlwRFMVbVZMZZr9YcopDTk3VLmuKBhwkSad5k%2FJ4Bmrf5rJIuFMNFmduPUuSYlxL77mGpsxk56pYAuasgpc7tR7WszpehIuz6UYmBGmCHXUB7Lzch2Ef5EVdF248XBCVykSOemsPFJPXeErK%2F23ZLnbZIinNVKOavAHT2a7AzlfkEXD5iPjb9Yl3I052xS4Lxr1VLfr89Vp2B0lf3CPYuGy5qLqwBJMXUVSTHmEVvCbYp46LYukqRzc4SM936beIWAg0lGrOF%2BzkglfjahnkHkln1WVCB32SvTHsWykx1lz6vQtJ%2BU7h7kgH%2FsmTlgShQuqQQIZUnDOcbRvJ4hubiPmNsUQ6JBX6NU7Z2CzGwQ6N3Jlz4c1pShlVHOM8PAp1%2FDrkKz62zZcGwS9ZJMd8n6IJKNA6ZCB4h8WP9M4Bf%2FANCcJ03fOX%2FO%2Bb76slKxcUpJeRGhIwT9GOPhDCr0VLz6BiX23fVGjUdW2n11Go6TdO5AdxNdjbCVSTdJmQjL%2BWiEA0m2N9OYKMYwpd6PxwY6pgE%2Fg1%2FcKJI4wM33FzBBFRdtXAA6I0ZwUuF%2Fym5bQfZjTtLIcO%2FzWPCa8NneTi9K6n9iPtjRHRuEu2PZeFuv12FnBXI0yeDM8V1av6snPBtFR0ea4LdxlNYDoUU3b2ux49wt08Nw4lCusD2bSZ33g6VjHobvEIu0nBL%2FBo%2FHZu5KwV7qi4xs6uzuFQnLFw6ZPKfnyI1UnSeMkP%2BlX2aP4q%2FRIulqxiQ3&X-Amz-Signature=eeca42339cb922e393b1adeafd741a1600ecc9f5a4b4986a671a93759687dfec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
