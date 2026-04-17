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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RDKM3HAR%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T071827Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJGMEQCIHW%2FezhYTUGw3AdYqEti3CNnG0NCcrqgGCy10iZAPjFPAiBOfqeKmErLyvLKhcTlRd%2FaG3RMC8ybzRSElRLPUo1TayqIBAjQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFkr6pyxgRDTGCdxWKtwDO3gDf8vrNMrPEGiMT4fcAC%2BnmmDbp%2Fnv4vTsNfTAJzRomfONXKLept9SnkbQgvL8pDCrViiTkpRmWYwZezBj%2BHRJZ2%2Fxjj50nM2BG5FRpYL%2FkrlGhAEF9PHHee5QTNuN6QCpz1hIkwRzTSI0VQKWIioM6DbeY8JKjswCy%2FqBh5Ki8gX%2Fm20pkCnHDZhq3XasmZ4tEm7D2ppQllSY%2F8wk36G9ZAUWuaiFJLdTBSmFKD2CPXmvcpyT76Y3GIpdoQIxvi3ocXb0x4corI3900lXBkZjfRH1k2TkK5SF2XPUfn3SLUq15J4MUNgmTGzjfbOqMOIixNOkzBRaDzR6JpNEqIcaO%2F5PQl%2BCtyCGlcEu9RXrDfeP4kytqdpPkiNp22KRhqbq%2BgfCXT35tbpKTIFuGcFVefPKd23dWecvzD340K8hgC3MUMpGc%2FYP3BK3bq7qSz7RZmjWoshouNpGOJaf8Zrj7ca%2B46Gc1jcNCqOPjshywoeYjZW1bT8rlAX8v%2BxZ2mtklI0M2WbxImdQh7n5qvgetn3pMFjl8ANcKIt5RYth%2FlslRqEZcGGkN41rzPlWBshNOnM8mOnjsV6HPzsKKlvWjUJeACWX9YIvOOEUzkhjndzBUS%2F3bi2bHIowobuHzwY6pgFTWel7HyWZ0ooxafXOMndkQVpkLVWlmcCzLziz6%2FwcUj4E36wc7aEmWZ%2BBo9VrsKMusEgs4b%2F%2FvWPtfLqML9VEAq33lbEYFywOJgnj7rKfyHmL3hJx2MDhHQYZU0nEocY7fsNJqXIkCbTgWecOGy88nP55XQH8sh%2BaVsOILnmHDaJyCrXme2DMQ4hl0ckzU%2BTcUu%2B4JLrbKaEp0mXvZndJ3aPThjz1&X-Amz-Signature=f4333e34596a6d4011a58daa595ad94686894637b867e39db5234aca051e8947&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RDKM3HAR%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T071827Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAcaCXVzLXdlc3QtMiJGMEQCIHW%2FezhYTUGw3AdYqEti3CNnG0NCcrqgGCy10iZAPjFPAiBOfqeKmErLyvLKhcTlRd%2FaG3RMC8ybzRSElRLPUo1TayqIBAjQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFkr6pyxgRDTGCdxWKtwDO3gDf8vrNMrPEGiMT4fcAC%2BnmmDbp%2Fnv4vTsNfTAJzRomfONXKLept9SnkbQgvL8pDCrViiTkpRmWYwZezBj%2BHRJZ2%2Fxjj50nM2BG5FRpYL%2FkrlGhAEF9PHHee5QTNuN6QCpz1hIkwRzTSI0VQKWIioM6DbeY8JKjswCy%2FqBh5Ki8gX%2Fm20pkCnHDZhq3XasmZ4tEm7D2ppQllSY%2F8wk36G9ZAUWuaiFJLdTBSmFKD2CPXmvcpyT76Y3GIpdoQIxvi3ocXb0x4corI3900lXBkZjfRH1k2TkK5SF2XPUfn3SLUq15J4MUNgmTGzjfbOqMOIixNOkzBRaDzR6JpNEqIcaO%2F5PQl%2BCtyCGlcEu9RXrDfeP4kytqdpPkiNp22KRhqbq%2BgfCXT35tbpKTIFuGcFVefPKd23dWecvzD340K8hgC3MUMpGc%2FYP3BK3bq7qSz7RZmjWoshouNpGOJaf8Zrj7ca%2B46Gc1jcNCqOPjshywoeYjZW1bT8rlAX8v%2BxZ2mtklI0M2WbxImdQh7n5qvgetn3pMFjl8ANcKIt5RYth%2FlslRqEZcGGkN41rzPlWBshNOnM8mOnjsV6HPzsKKlvWjUJeACWX9YIvOOEUzkhjndzBUS%2F3bi2bHIowobuHzwY6pgFTWel7HyWZ0ooxafXOMndkQVpkLVWlmcCzLziz6%2FwcUj4E36wc7aEmWZ%2BBo9VrsKMusEgs4b%2F%2FvWPtfLqML9VEAq33lbEYFywOJgnj7rKfyHmL3hJx2MDhHQYZU0nEocY7fsNJqXIkCbTgWecOGy88nP55XQH8sh%2BaVsOILnmHDaJyCrXme2DMQ4hl0ckzU%2BTcUu%2B4JLrbKaEp0mXvZndJ3aPThjz1&X-Amz-Signature=727aa0f97ad3947d39c293d82893524ca9d3ce9394d962b26808e7b9d60a3fb6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
