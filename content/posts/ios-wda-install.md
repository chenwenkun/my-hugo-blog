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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YQ3QNNLC%2F20260506%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260506T192046Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEsZwCaOg2c4Hl0dQ9Rj9bjWH1VxBzhMQ2lVb2T1NiJPAiEA2uWIwoteFxIcfkmjlwoI7XoafmtRjhuiZsLGozcEUTkqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOQE%2FwCrgEIBiWxt6yrcA2QYmoKjPgxGWCUAfzqEnUFdACRSTGfgTA0HfcB9PkEFrI%2FHl7AWt%2FJdWzwZyAr7FgAd1khIf8g0Ps1t7lq%2FBaMUNu%2FF%2FGJee5d551BwE9agSaLDYBuL17M4QG3dsV1JQXQXQhxcVxSeeS69oNwqPYmbYiWfhoMVBsMkmDajBMlxpdOODKb%2Bvrgn%2BBY0qLgIWRS22HAJxetRxyYb%2BG8SyM5pdSJFm46TbJHi1Kga5F4hIM1sbaXTEPPBTjH6AZ48APOvU2wxIRbFljVpA5hEApDH9YoAlHneWyXkyNFsnWUMj%2FhHmBI3hqBAH1PEFQrgcU4XPPaR9tGTk%2FH0i%2BlGb2Nf8vJ6iWdKh40FEWLpsGFbnpZp8dcuZfQUJ4CK8PtLrht6cEGQfmO06lltxxSzbzcgJAzODg9g3IIeMv7wReMcHPxxNVcKL5B5ZtfuHdO4CPxkV2hfRpD0KlC2IURtxbuxeWcJ4J0p%2FQ7AlDW9Uh8AOVGvI9CyAgplZ6t27OVr6aBGSIlySKnqs4gHwQtp3wje2v%2BwksRNX%2FOPNonaJN89A1Vj6un0O2iu8FX9b3QPTFHwZCIOIUyRB14L%2FfrJWH1L5gLGbUElnjjYVcjhZGmXNUsqmAckxBhMexKEMI2e7s8GOqUBbMSJ8hfxHA7Eo4L5asusaZX0w965Hel9xDAW6FrlYH2qOZU0%2FPzDBh4AM7BwNVm3jexwiZ%2F%2BvMDqmw%2Fk80%2FIZL%2FyRFwzQvV4Di525Hb%2BL3340iftsjYi8H%2FNfLFHyb9W86cORF3mcLsfgLxg4dIA2KdKKZUDjpygiJwzJ3bRJrPKIFy94KV%2FHmnJJlP2vLIad7vL4guU1%2F6c8HpsSHAZxus%2FB84p&X-Amz-Signature=de203949a440080a517ef16f8b8769101cf34a6dfba6c7a6c9a15bce794e56c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YQ3QNNLC%2F20260506%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260506T192046Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEsZwCaOg2c4Hl0dQ9Rj9bjWH1VxBzhMQ2lVb2T1NiJPAiEA2uWIwoteFxIcfkmjlwoI7XoafmtRjhuiZsLGozcEUTkqiAQIpP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOQE%2FwCrgEIBiWxt6yrcA2QYmoKjPgxGWCUAfzqEnUFdACRSTGfgTA0HfcB9PkEFrI%2FHl7AWt%2FJdWzwZyAr7FgAd1khIf8g0Ps1t7lq%2FBaMUNu%2FF%2FGJee5d551BwE9agSaLDYBuL17M4QG3dsV1JQXQXQhxcVxSeeS69oNwqPYmbYiWfhoMVBsMkmDajBMlxpdOODKb%2Bvrgn%2BBY0qLgIWRS22HAJxetRxyYb%2BG8SyM5pdSJFm46TbJHi1Kga5F4hIM1sbaXTEPPBTjH6AZ48APOvU2wxIRbFljVpA5hEApDH9YoAlHneWyXkyNFsnWUMj%2FhHmBI3hqBAH1PEFQrgcU4XPPaR9tGTk%2FH0i%2BlGb2Nf8vJ6iWdKh40FEWLpsGFbnpZp8dcuZfQUJ4CK8PtLrht6cEGQfmO06lltxxSzbzcgJAzODg9g3IIeMv7wReMcHPxxNVcKL5B5ZtfuHdO4CPxkV2hfRpD0KlC2IURtxbuxeWcJ4J0p%2FQ7AlDW9Uh8AOVGvI9CyAgplZ6t27OVr6aBGSIlySKnqs4gHwQtp3wje2v%2BwksRNX%2FOPNonaJN89A1Vj6un0O2iu8FX9b3QPTFHwZCIOIUyRB14L%2FfrJWH1L5gLGbUElnjjYVcjhZGmXNUsqmAckxBhMexKEMI2e7s8GOqUBbMSJ8hfxHA7Eo4L5asusaZX0w965Hel9xDAW6FrlYH2qOZU0%2FPzDBh4AM7BwNVm3jexwiZ%2F%2BvMDqmw%2Fk80%2FIZL%2FyRFwzQvV4Di525Hb%2BL3340iftsjYi8H%2FNfLFHyb9W86cORF3mcLsfgLxg4dIA2KdKKZUDjpygiJwzJ3bRJrPKIFy94KV%2FHmnJJlP2vLIad7vL4guU1%2F6c8HpsSHAZxus%2FB84p&X-Amz-Signature=17d09f829b3ed0782e9e2e7b7b04dca444c6f8546978ab10f78a184e890039d0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
