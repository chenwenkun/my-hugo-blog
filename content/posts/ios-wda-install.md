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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R3G337UH%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T123712Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAnwx9hwF8ENmiHmDcrMplKSWah4JVTtHM8tTXT92U3aAiAbyPkP1B1sRArLAxj9NXKvJf5qPPQ1KfgNYNxdp85MTir%2FAwhdEAAaDDYzNzQyMzE4MzgwNSIMDhIfRQTCjuuuRULaKtwDOlzvqaST2b6WTJt7ipwibKIa4jkh8ZgJWMgRXT2zBpBIR7l2XPg6xAgdVSS43fxr6pJJgxa7cRevwuLyPb7xHjlknWEF4Ntr8T7tvZxZnldNk2pbmdmp1ilFKn1Y3Be0I6EhDEHQyncd53Ov77CaY%2FupJ3CBOTL0%2BtWZFSl0Grz9drUWWq6QN3kTsCHli7voKGT4fo3XymQ7oSBoh78I7UaPXMV6oKkaTfG899RAhz9MMw%2FNsBa42JvqJDGUh1UbhMRtWSbfiAJvQAPb0Dejt8gLe3d%2BMP0uLNONAG38%2FAODsa%2Fnfk7Zhh5lUGE4srJsuMT4oSEu4lbv2wVrUIhf8FkBWVCGzzcC1BfFwvhQ90HMcGHuq%2B21YaVb%2FKKHsaXzExhJBRNYwkLXJFKtjP5K31WTNpnSMecz1wChrYQkMfOqg5UtFMQ%2ByetAPymD5Vmu5vqGj3AjkGQOYJIA4gAY7uCWqOItFh%2FB1NLCG%2FFdvuY7s4hrl6e70R7TtG5NFVqZzAgRkGYTE%2BYEI8kWetVL1F7YtJi5yOOsuXvd%2BcYnWj7oBhPwq1CLSJ2POHiYvJ7DtuC91%2BG9widiYicIOF%2FKPoH5ITJLFo1xkWka8%2F4qgMuDjZNGUeGwwou2nd0w0pDuzgY6pgH%2BnkQKVeAZMKRX%2FnQnqraCF0s%2Fw66YhC77NU%2FgMupb1kjqseThlcF2%2BYjv59x97O5EFjeh3ADdXxgDusAxfa4vr%2FRukD98kjguXhOXwjauKeZnAntEn9SdRdS0V6nvkP6sM2N3DvoUv5BjKf7x8%2BCN8E7zlXfCQxWgpia29Dylpg5G%2F8elJ7BYQd22ByR%2BKrDXZTOVnxQzJixdhww5F4l8ozS6MEzG&X-Amz-Signature=36b1750c7ec28ffb05e7814da2de037df37389cb8bdcbf83c7693cdae0ebf137&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R3G337UH%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T123712Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAnwx9hwF8ENmiHmDcrMplKSWah4JVTtHM8tTXT92U3aAiAbyPkP1B1sRArLAxj9NXKvJf5qPPQ1KfgNYNxdp85MTir%2FAwhdEAAaDDYzNzQyMzE4MzgwNSIMDhIfRQTCjuuuRULaKtwDOlzvqaST2b6WTJt7ipwibKIa4jkh8ZgJWMgRXT2zBpBIR7l2XPg6xAgdVSS43fxr6pJJgxa7cRevwuLyPb7xHjlknWEF4Ntr8T7tvZxZnldNk2pbmdmp1ilFKn1Y3Be0I6EhDEHQyncd53Ov77CaY%2FupJ3CBOTL0%2BtWZFSl0Grz9drUWWq6QN3kTsCHli7voKGT4fo3XymQ7oSBoh78I7UaPXMV6oKkaTfG899RAhz9MMw%2FNsBa42JvqJDGUh1UbhMRtWSbfiAJvQAPb0Dejt8gLe3d%2BMP0uLNONAG38%2FAODsa%2Fnfk7Zhh5lUGE4srJsuMT4oSEu4lbv2wVrUIhf8FkBWVCGzzcC1BfFwvhQ90HMcGHuq%2B21YaVb%2FKKHsaXzExhJBRNYwkLXJFKtjP5K31WTNpnSMecz1wChrYQkMfOqg5UtFMQ%2ByetAPymD5Vmu5vqGj3AjkGQOYJIA4gAY7uCWqOItFh%2FB1NLCG%2FFdvuY7s4hrl6e70R7TtG5NFVqZzAgRkGYTE%2BYEI8kWetVL1F7YtJi5yOOsuXvd%2BcYnWj7oBhPwq1CLSJ2POHiYvJ7DtuC91%2BG9widiYicIOF%2FKPoH5ITJLFo1xkWka8%2F4qgMuDjZNGUeGwwou2nd0w0pDuzgY6pgH%2BnkQKVeAZMKRX%2FnQnqraCF0s%2Fw66YhC77NU%2FgMupb1kjqseThlcF2%2BYjv59x97O5EFjeh3ADdXxgDusAxfa4vr%2FRukD98kjguXhOXwjauKeZnAntEn9SdRdS0V6nvkP6sM2N3DvoUv5BjKf7x8%2BCN8E7zlXfCQxWgpia29Dylpg5G%2F8elJ7BYQd22ByR%2BKrDXZTOVnxQzJixdhww5F4l8ozS6MEzG&X-Amz-Signature=68c54db994e0cc4220c3f8aa57720b8458535936fc9716c948b71d71d689092d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
