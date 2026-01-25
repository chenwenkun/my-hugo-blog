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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TXE2MLQ2%2F20260125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260125T061839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJGMEQCIBwHm6kcNNOjVmUwBjlyNDtQiNnJjlap4elP43O7UmdwAiA50AiOevTMAsKCxvGRJGMYkRlGHLLL%2FSWFSIAdTXwdzSr%2FAwgfEAAaDDYzNzQyMzE4MzgwNSIM%2FUMKs0R0x6s%2FUvSXKtwDo%2FLm3WEnk07OZ09rOmNdymw5hBdd7fPVZAb1J7xFw8GHgbvyyGLpV%2BlacTqCAgfEN6Rw%2Fy2m8h8n6ZDNySxCghr%2FgarGcGbsZdJQ6PFSINuWuw%2BHBekS29Q5QueXJbcVEeijeRWVUA3g%2F2Cv4OTtp6qPoC9wqqE6LiIor7S39kXetMajKwqgTeZlyhi0%2F5KpU3Yg%2FZYHReV6woavmqhPNIjkCPH7ysJaVmTqZs1DBSmSjrDE18KZP5ELN9qLq7kw33x0%2Bd8jyzGKle%2B9%2BFo6h%2Fu2sUkLSIcGrV7rS6KnOXhfT7DOlKNfp4jV094x3Z2mZnaeSwYvd3KNy0vkTvckhDAJjlBZuc4QiEgg6l6YI6QgpSwRPHVIgNepYfTCcsvYrvNlBRp7LWRCZj6lTdazOPH%2BhYyGk6bDyoFzkGGo81NG93S%2FZPb7PGgG546CPOJAi%2BMNcjdNHVwF38xHFwC8lXN1wRRTy5cX1drqlglaVP%2BRVf%2FsEcnxDOxMuFynTIO%2Fxkx6oTaJ6kZSgfPbIZrm3xOMVhPTSFSOcwAf9hFwTK7KaLB1%2Bh9pHLfH16wr9OL6Gta2WTib0g82OMkqpxJP3qx6OieOudhs4XqqyYAp5EeieDmSUSWwsysny%2BcwreDWywY6pgGqv9WP5YCY0JXShwFxgJNeLsA4t72V2L3hm0%2BWiWZVO6B8zuOcjhXvqWJSYy8GwUGjHBoB03atLM78jFIIb757qic1ihaMfcQcTy%2FlorS%2Fbo0bFI33ho7HGZpATmSjNSPnHyp0vep1kEinZACkhZTEh7Agab%2F%2FWKHYmOMc7aFC3uhkNkmPKHsAGzHLOzaKV7jScwPF7HP8HJsj6%2B4cdTsfzytETnOZ&X-Amz-Signature=85145cb440c6c7e58978c03c5cc8e35230478c804f403ed13e165939f143b668&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TXE2MLQ2%2F20260125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260125T061839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJGMEQCIBwHm6kcNNOjVmUwBjlyNDtQiNnJjlap4elP43O7UmdwAiA50AiOevTMAsKCxvGRJGMYkRlGHLLL%2FSWFSIAdTXwdzSr%2FAwgfEAAaDDYzNzQyMzE4MzgwNSIM%2FUMKs0R0x6s%2FUvSXKtwDo%2FLm3WEnk07OZ09rOmNdymw5hBdd7fPVZAb1J7xFw8GHgbvyyGLpV%2BlacTqCAgfEN6Rw%2Fy2m8h8n6ZDNySxCghr%2FgarGcGbsZdJQ6PFSINuWuw%2BHBekS29Q5QueXJbcVEeijeRWVUA3g%2F2Cv4OTtp6qPoC9wqqE6LiIor7S39kXetMajKwqgTeZlyhi0%2F5KpU3Yg%2FZYHReV6woavmqhPNIjkCPH7ysJaVmTqZs1DBSmSjrDE18KZP5ELN9qLq7kw33x0%2Bd8jyzGKle%2B9%2BFo6h%2Fu2sUkLSIcGrV7rS6KnOXhfT7DOlKNfp4jV094x3Z2mZnaeSwYvd3KNy0vkTvckhDAJjlBZuc4QiEgg6l6YI6QgpSwRPHVIgNepYfTCcsvYrvNlBRp7LWRCZj6lTdazOPH%2BhYyGk6bDyoFzkGGo81NG93S%2FZPb7PGgG546CPOJAi%2BMNcjdNHVwF38xHFwC8lXN1wRRTy5cX1drqlglaVP%2BRVf%2FsEcnxDOxMuFynTIO%2Fxkx6oTaJ6kZSgfPbIZrm3xOMVhPTSFSOcwAf9hFwTK7KaLB1%2Bh9pHLfH16wr9OL6Gta2WTib0g82OMkqpxJP3qx6OieOudhs4XqqyYAp5EeieDmSUSWwsysny%2BcwreDWywY6pgGqv9WP5YCY0JXShwFxgJNeLsA4t72V2L3hm0%2BWiWZVO6B8zuOcjhXvqWJSYy8GwUGjHBoB03atLM78jFIIb757qic1ihaMfcQcTy%2FlorS%2Fbo0bFI33ho7HGZpATmSjNSPnHyp0vep1kEinZACkhZTEh7Agab%2F%2FWKHYmOMc7aFC3uhkNkmPKHsAGzHLOzaKV7jScwPF7HP8HJsj6%2B4cdTsfzytETnOZ&X-Amz-Signature=83133d4726cb0f2c4e079cb5d89d829a5f9873e084e9ebf8fa66ff3ce8eed048&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
