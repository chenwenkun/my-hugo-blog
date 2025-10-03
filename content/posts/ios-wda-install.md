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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVD7NZ6H%2F20251003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251003T122000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCC29L9E%2BTaugDYOBs5gxT3RDchH20PD6TMe4Uv0tzqcwIhAKO4C682ty9rHQF7DtHhY8Dy9iyDNLHGREOLs5Ym3syyKv8DCEQQABoMNjM3NDIzMTgzODA1IgxhEqTC5UXMhkdvL%2FIq3APWlxcbqTpIV%2B0Q054urk4DyAg8dUeqeZjhQ8K%2BpFRR5oM4r5zirZe%2B48%2FBA%2FXzYDsvi7ZMRsqydp5Q2YP9cJ9cZ6UNhU55hqk1eKOZVHmATkOS1O%2BquqSQOU929boWOgSTAUvJhaAtwNVgP0i1HSCahEePPXFeMCDyUzc%2BBdkVitXhFiG%2BLj6KSLoxMKxQgEIe0t%2B3yBlEGLA6S9vMKC305RCWsT1gvJcQR2ThKEe4qCR8sokwkqaXpbfsgYNeq5lrCRxEtuCqP1kw100lJdcKfVF9gW%2F70pEeCB%2BV77NhEEv%2BLVs5rJZSjCsI1ohao3nTG1mHsHyJsDvOwSWhy65S6Du8svqxJGagAY03AGeS6EydYvjkcwobHdlGK3NUo%2F2m2DL4agRN%2Fq4ZPvXJEM%2BZjp7Su6gqpqjYVEV6IZNsbziEaCoJqAbpzG38h%2B9aNbSlQ1qyF73fW6MZlOT%2FJk4R%2BCxCZIwJ5w2lUfAVP9UJ6Mbk8PpzmUAlqHYCkpszthJprrLc4AgeoDaYZerYp3mWSat7RlBN42prbuYk78AsyxiCpwHf8A6Jc8F58jrfQwhKgKGn4jB%2FKhmJ4EI7biCp4Mtv7oXqz4%2BexgU%2BjqvlGDKcaQuWJ9ejYtG6RzD55P7GBjqkAaLbStNhe8AxuCtnY5UuE%2FVbTNw%2BzyEI9N8EoUqon4M6IZb%2FJFAbGIfa8AInMXYfNvx82d6svT%2BG0yvpO7DJcdluPLspOMWY4EHnOuYWSkqhcmR%2BnyxYB%2F%2FR69rpeCO5VjtxfNNJx0njKojdUlWmXp%2BlqMSkB4KVnj%2BFPt4pr53Ouh8ii6y1zrORKEUvfiZDu3SaPla7X3PZpaUMr%2F0IkkQ5MwKF&X-Amz-Signature=d0a2a3361d849e9c165bd96490e46144a10e97f78fc254eefb25d733dec897e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVD7NZ6H%2F20251003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251003T122000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCC29L9E%2BTaugDYOBs5gxT3RDchH20PD6TMe4Uv0tzqcwIhAKO4C682ty9rHQF7DtHhY8Dy9iyDNLHGREOLs5Ym3syyKv8DCEQQABoMNjM3NDIzMTgzODA1IgxhEqTC5UXMhkdvL%2FIq3APWlxcbqTpIV%2B0Q054urk4DyAg8dUeqeZjhQ8K%2BpFRR5oM4r5zirZe%2B48%2FBA%2FXzYDsvi7ZMRsqydp5Q2YP9cJ9cZ6UNhU55hqk1eKOZVHmATkOS1O%2BquqSQOU929boWOgSTAUvJhaAtwNVgP0i1HSCahEePPXFeMCDyUzc%2BBdkVitXhFiG%2BLj6KSLoxMKxQgEIe0t%2B3yBlEGLA6S9vMKC305RCWsT1gvJcQR2ThKEe4qCR8sokwkqaXpbfsgYNeq5lrCRxEtuCqP1kw100lJdcKfVF9gW%2F70pEeCB%2BV77NhEEv%2BLVs5rJZSjCsI1ohao3nTG1mHsHyJsDvOwSWhy65S6Du8svqxJGagAY03AGeS6EydYvjkcwobHdlGK3NUo%2F2m2DL4agRN%2Fq4ZPvXJEM%2BZjp7Su6gqpqjYVEV6IZNsbziEaCoJqAbpzG38h%2B9aNbSlQ1qyF73fW6MZlOT%2FJk4R%2BCxCZIwJ5w2lUfAVP9UJ6Mbk8PpzmUAlqHYCkpszthJprrLc4AgeoDaYZerYp3mWSat7RlBN42prbuYk78AsyxiCpwHf8A6Jc8F58jrfQwhKgKGn4jB%2FKhmJ4EI7biCp4Mtv7oXqz4%2BexgU%2BjqvlGDKcaQuWJ9ejYtG6RzD55P7GBjqkAaLbStNhe8AxuCtnY5UuE%2FVbTNw%2BzyEI9N8EoUqon4M6IZb%2FJFAbGIfa8AInMXYfNvx82d6svT%2BG0yvpO7DJcdluPLspOMWY4EHnOuYWSkqhcmR%2BnyxYB%2F%2FR69rpeCO5VjtxfNNJx0njKojdUlWmXp%2BlqMSkB4KVnj%2BFPt4pr53Ouh8ii6y1zrORKEUvfiZDu3SaPla7X3PZpaUMr%2F0IkkQ5MwKF&X-Amz-Signature=4db8587cba2e4c54ad7e1c76ad8d637e2b7c56fcbaf5930398e5bf2860c3882e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
