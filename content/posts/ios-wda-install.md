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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664EMUKISZ%2F20260305%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260305T190736Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCIDYoyQktkxFSR8tplCyWVc0HXj6%2BsURq6QHBtf1oWIj0AiEAyxZgLey4S%2BQzBs9teLRD%2B27CYQJCbqUufJ9kWrh1a0IqiAQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH9PuNARkqFnsCYCfCrcA3mcYYVxmZUU0lSJkdpS%2FWXNP6j8tjy48ZpdO%2FSa1OK13UMftoPHuaEvFp2uiI4E8DuXA0oLvQIpDZYtIvWUwX%2BN95c4tmwsh0SVbBqXl9q1bZRyISHFWFEYA8XNOjGdXAh2jwMLa5yaDLRrp2ewLQMs8kfNp0OgMz9lJz9tmbChearh1k7e0PREhZEJLFWpuauuYbUn6UKGakkNPlCYC1hTlOn%2BJM2Vj8pr0CYaDMcqlVhPm%2Bwy5vjzQconKf5ipWHJWKk6qG%2BuIXvjrFHzssJ1x3C1QVy%2F3ES9%2FoQ3iPLxcmAmSdCfH57p2fLTxHp3Ogskbp7U1IdeS2PldoOr8g7%2BFRCkaRALgtVNlTNZSNXftEctvccEjaas2cf5nfWzd6ELU1%2BxGI%2F2DqHelbY79nGYsdv8zlNY6eZ26HlStmbuhq0ptP0ch%2BIN2nyXk9%2B3gn4yL1%2Bxxvl8wJZSEG3Hn%2FgH5ZOwFtw0Q9yTqHFBJJxpz%2BGXQkLLRzICTKHQ5MO%2Bw1Sqfgj3BlgKGYco%2B7g1Pdkg6jG6VOxgiryUm1gTWhP6Jpzz99Ers6jTIZDzRNBaM0AWHNbfV2iF9QdpEgBQDAmkLH66BtsZk2JskkFvVu9hq5TJX97nZkGznEVbMMrKps0GOqUBLVAvHLTBBfCLAH4NoDbn1FQWz1ryqYePDVjwA%2B8eNBO8mlCFo%2FTZSLxXJG4ltQTc7DPI1PNl0RZcify2mYGPT%2Bmkz6y0n0Z45LWLdI0MJxgXraqP8vIp%2BjDfAkeN9yWkD1I8Cd2qWB1n3rJyaVMSmWWMYBmLqyvbjngdsGjGDMUFZ1s4C9sZjmtJOekto%2FYyngdaF%2F2zf%2F2mK%2F11zO4XQXD3Edyj&X-Amz-Signature=395ca4f62f758c38f9dbb34129527a19c80bf9e862f8a7ce17de58b12282a6a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664EMUKISZ%2F20260305%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260305T190736Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAgaCXVzLXdlc3QtMiJHMEUCIDYoyQktkxFSR8tplCyWVc0HXj6%2BsURq6QHBtf1oWIj0AiEAyxZgLey4S%2BQzBs9teLRD%2B27CYQJCbqUufJ9kWrh1a0IqiAQI0f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH9PuNARkqFnsCYCfCrcA3mcYYVxmZUU0lSJkdpS%2FWXNP6j8tjy48ZpdO%2FSa1OK13UMftoPHuaEvFp2uiI4E8DuXA0oLvQIpDZYtIvWUwX%2BN95c4tmwsh0SVbBqXl9q1bZRyISHFWFEYA8XNOjGdXAh2jwMLa5yaDLRrp2ewLQMs8kfNp0OgMz9lJz9tmbChearh1k7e0PREhZEJLFWpuauuYbUn6UKGakkNPlCYC1hTlOn%2BJM2Vj8pr0CYaDMcqlVhPm%2Bwy5vjzQconKf5ipWHJWKk6qG%2BuIXvjrFHzssJ1x3C1QVy%2F3ES9%2FoQ3iPLxcmAmSdCfH57p2fLTxHp3Ogskbp7U1IdeS2PldoOr8g7%2BFRCkaRALgtVNlTNZSNXftEctvccEjaas2cf5nfWzd6ELU1%2BxGI%2F2DqHelbY79nGYsdv8zlNY6eZ26HlStmbuhq0ptP0ch%2BIN2nyXk9%2B3gn4yL1%2Bxxvl8wJZSEG3Hn%2FgH5ZOwFtw0Q9yTqHFBJJxpz%2BGXQkLLRzICTKHQ5MO%2Bw1Sqfgj3BlgKGYco%2B7g1Pdkg6jG6VOxgiryUm1gTWhP6Jpzz99Ers6jTIZDzRNBaM0AWHNbfV2iF9QdpEgBQDAmkLH66BtsZk2JskkFvVu9hq5TJX97nZkGznEVbMMrKps0GOqUBLVAvHLTBBfCLAH4NoDbn1FQWz1ryqYePDVjwA%2B8eNBO8mlCFo%2FTZSLxXJG4ltQTc7DPI1PNl0RZcify2mYGPT%2Bmkz6y0n0Z45LWLdI0MJxgXraqP8vIp%2BjDfAkeN9yWkD1I8Cd2qWB1n3rJyaVMSmWWMYBmLqyvbjngdsGjGDMUFZ1s4C9sZjmtJOekto%2FYyngdaF%2F2zf%2F2mK%2F11zO4XQXD3Edyj&X-Amz-Signature=f80aff39e7144fda8cad09f0f6b4c8e02803b878f338df368ae09a6d180f7835&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
