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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UAN4OJSE%2F20260129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260129T123226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICDQw%2FOd0fghg8TTg2FNwLomOOZxERNzRgurGfWtXT23AiEAv5wyEYbZRx4kE4YOhMts7%2B8gDleOEBy70nPzMfa0oZoqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD0TvntMYkAC%2FftrEircA0JDNP%2Fp049KOXJs97wTohqSmtKbQBp%2FLsGyIznKdi9rKXI4YOdww1PUm%2Fu5Rh9%2FYuga4xzqwF3ECHu%2BtaJTUSRoP7ugVM0CGnnUjlIkvqKZQZU5XqbXbElQ3zJWjiTIa5N9eZQx5DqRWZmrbmpFbEEknT69al9bTnt3J2FM3gsUXdjSGW0r0ZQTFtnxH5lD6c36HgXRcMHZYE%2FNGlrQsYDKvV8iRiNWgQGYnZxnYXdpva1NULPGI47CHKmCzEMr9CmTO7VUhrOllY8xFdJ71jPtEo1kdOhHP1ceHp9iOxAQvl3%2FTgkvasA1U%2FrhG%2F9QPEz6TG3kQkuOyKOOgOozfsXJxCo3jZYYp2ps4TOKpNCmsxJnD%2B9I31NcaysiVhq6LrJgdOg5LumRse90GWXZIg%2FanzLgt4Q2kdEVBO3hj6fNAeDD92DzXkjzMHWuOx8YHeQZHkbrNxAgEBb3ZSAN2%2F7gDDVu%2BMDnxLRy%2BGcmw1aooDIMnMrGgLexMKbAJsiUqHj3WxbzmbkjB1V6AttxBgvUwXO9KOkZIJTyB%2BmF5AlX2cjEzlgM7Q19vxw16d2fqUaQpbCOOl9AqfYyuKjVcxdvfFHbiV4B%2FLd5IqFiB9nMAeZ8P2JyqI0EtM8xMKqU7csGOqUBX%2FVPyxFtcuvq3fzglLs3l%2F5CKhDr9jm4pKOoVoDqPd4Yfhas2jMQ%2BDk7qd%2FOLXXdL%2F9p190UN7Q63hrkgv4rm4qm1onY97YQ6eIwWw0He%2FUgWL5CHiqst5qgmTq%2FaiBiozmsm5vUIJJGVi%2BmM6WR2AJPgQSDO1HsSX1eB8ByovkbxX5gAZx%2BW90OY9boxcJBkfhKiJx2t3HixDumawcruTvLlG4T&X-Amz-Signature=2520b8c2a2294b5ed9236672ac905cc077c6e2c72d011243861818de1b18d5e8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UAN4OJSE%2F20260129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260129T123226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICDQw%2FOd0fghg8TTg2FNwLomOOZxERNzRgurGfWtXT23AiEAv5wyEYbZRx4kE4YOhMts7%2B8gDleOEBy70nPzMfa0oZoqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD0TvntMYkAC%2FftrEircA0JDNP%2Fp049KOXJs97wTohqSmtKbQBp%2FLsGyIznKdi9rKXI4YOdww1PUm%2Fu5Rh9%2FYuga4xzqwF3ECHu%2BtaJTUSRoP7ugVM0CGnnUjlIkvqKZQZU5XqbXbElQ3zJWjiTIa5N9eZQx5DqRWZmrbmpFbEEknT69al9bTnt3J2FM3gsUXdjSGW0r0ZQTFtnxH5lD6c36HgXRcMHZYE%2FNGlrQsYDKvV8iRiNWgQGYnZxnYXdpva1NULPGI47CHKmCzEMr9CmTO7VUhrOllY8xFdJ71jPtEo1kdOhHP1ceHp9iOxAQvl3%2FTgkvasA1U%2FrhG%2F9QPEz6TG3kQkuOyKOOgOozfsXJxCo3jZYYp2ps4TOKpNCmsxJnD%2B9I31NcaysiVhq6LrJgdOg5LumRse90GWXZIg%2FanzLgt4Q2kdEVBO3hj6fNAeDD92DzXkjzMHWuOx8YHeQZHkbrNxAgEBb3ZSAN2%2F7gDDVu%2BMDnxLRy%2BGcmw1aooDIMnMrGgLexMKbAJsiUqHj3WxbzmbkjB1V6AttxBgvUwXO9KOkZIJTyB%2BmF5AlX2cjEzlgM7Q19vxw16d2fqUaQpbCOOl9AqfYyuKjVcxdvfFHbiV4B%2FLd5IqFiB9nMAeZ8P2JyqI0EtM8xMKqU7csGOqUBX%2FVPyxFtcuvq3fzglLs3l%2F5CKhDr9jm4pKOoVoDqPd4Yfhas2jMQ%2BDk7qd%2FOLXXdL%2F9p190UN7Q63hrkgv4rm4qm1onY97YQ6eIwWw0He%2FUgWL5CHiqst5qgmTq%2FaiBiozmsm5vUIJJGVi%2BmM6WR2AJPgQSDO1HsSX1eB8ByovkbxX5gAZx%2BW90OY9boxcJBkfhKiJx2t3HixDumawcruTvLlG4T&X-Amz-Signature=1b19cbadb7fdea8fb7b56f76a5b5b9ce1eecdf810944ef0754fc24c521e250f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
