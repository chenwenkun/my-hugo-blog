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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667Y4NGC4K%2F20260207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260207T182048Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBe9cBIGbPcqQ4UVO16JCQHddO%2FN%2FMugEw8cYoqC3rdoAiEA6x%2BnY2tiyrNogQCuywkdHCqKYoreSUCRAQ7yCOaGcGIq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDNmjOLwS0ANvX1fclircA4JSSlux8dt97Uvg8nJkPbNrihSfW7WnEmCIQOHU8%2BFEEO4y1tUxvpwQGA%2Bn7bjJ8UuamZIXlQJDW5PKD8%2BrUiC6SLG2X5rEa5sMUa9MJofyRd4N%2B%2BLX0vbPSKKsSvGzENgLiRuAZoZYPssg%2BwOIvWzqvqVr0KNlx3PAwUWyYRzh%2FMlo0rf8GNUcbKYPGivYuS%2FiQV4AgemAaL%2F%2FpYZbqfNyV809jcoVQsMcS6EiVhluLq5bKzeoujZLAcZNLNU6kGD%2FEn8vI1gHdPgtQGxmiXYWmeS%2BRiC3yKNHVbIG9cHddZfEdFE19C7jOkh2yHFXsxoNpfrDPoGetyurfx6m7dvU4DbVzEZ%2F6oVwB43VKjRJEhfj0ukeD3dOqbQMjR5HJM5tw2DiMkRdkpC9SQ077UHwL%2FHREQaYiN%2BMsJZffpjFd3C1TZ%2BUFfX7Ngu70HQ%2BYQv4Ks7fGGQbP4YQvUJHiuJonYzwhX%2FGwVlvMnxr6f%2Fzdt6M5yth5%2BEEJCW6UUfFOTqqX%2FqUWuUElZL3k8XJMZIp39DAeF%2F70edcc00eN4Ebkn%2BmpkSjX8Iu16GGfQtB3ov7fX3SBxqiFzSbfBWVG6uA1%2F2gme2rDctaYamQyB55s8VBGR8cn1EZVTJ4MIjjnMwGOqUBZinixDubPOaOxziL6vetA5qjVxbWfWU%2BYU4n%2FB6FEVRnX7zPTdIUIok2vVgT3VtstPhLw2tgEtk6WDbDziqCcTRZkWxtfUhVG8GEyQI1nk0LPIT4J32lVdlU2nYkWRVR5O1s1w4nKFwfIdBKURRbUxOHZlkwizWGioySAH90uEzQtGLfHmY4lQfGk2Wn5Hmm3WSeanrg5brnFAcJFE%2BnqRCkjrD%2F&X-Amz-Signature=cbef1399a80f10570443c2ce79a0039b5df85f3c36a79e1a000c0967f1ea4911&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667Y4NGC4K%2F20260207%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260207T182048Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBe9cBIGbPcqQ4UVO16JCQHddO%2FN%2FMugEw8cYoqC3rdoAiEA6x%2BnY2tiyrNogQCuywkdHCqKYoreSUCRAQ7yCOaGcGIq%2FwMIXhAAGgw2Mzc0MjMxODM4MDUiDNmjOLwS0ANvX1fclircA4JSSlux8dt97Uvg8nJkPbNrihSfW7WnEmCIQOHU8%2BFEEO4y1tUxvpwQGA%2Bn7bjJ8UuamZIXlQJDW5PKD8%2BrUiC6SLG2X5rEa5sMUa9MJofyRd4N%2B%2BLX0vbPSKKsSvGzENgLiRuAZoZYPssg%2BwOIvWzqvqVr0KNlx3PAwUWyYRzh%2FMlo0rf8GNUcbKYPGivYuS%2FiQV4AgemAaL%2F%2FpYZbqfNyV809jcoVQsMcS6EiVhluLq5bKzeoujZLAcZNLNU6kGD%2FEn8vI1gHdPgtQGxmiXYWmeS%2BRiC3yKNHVbIG9cHddZfEdFE19C7jOkh2yHFXsxoNpfrDPoGetyurfx6m7dvU4DbVzEZ%2F6oVwB43VKjRJEhfj0ukeD3dOqbQMjR5HJM5tw2DiMkRdkpC9SQ077UHwL%2FHREQaYiN%2BMsJZffpjFd3C1TZ%2BUFfX7Ngu70HQ%2BYQv4Ks7fGGQbP4YQvUJHiuJonYzwhX%2FGwVlvMnxr6f%2Fzdt6M5yth5%2BEEJCW6UUfFOTqqX%2FqUWuUElZL3k8XJMZIp39DAeF%2F70edcc00eN4Ebkn%2BmpkSjX8Iu16GGfQtB3ov7fX3SBxqiFzSbfBWVG6uA1%2F2gme2rDctaYamQyB55s8VBGR8cn1EZVTJ4MIjjnMwGOqUBZinixDubPOaOxziL6vetA5qjVxbWfWU%2BYU4n%2FB6FEVRnX7zPTdIUIok2vVgT3VtstPhLw2tgEtk6WDbDziqCcTRZkWxtfUhVG8GEyQI1nk0LPIT4J32lVdlU2nYkWRVR5O1s1w4nKFwfIdBKURRbUxOHZlkwizWGioySAH90uEzQtGLfHmY4lQfGk2Wn5Hmm3WSeanrg5brnFAcJFE%2BnqRCkjrD%2F&X-Amz-Signature=ceaa29c2947c66216ed9c193712c9f9d2cf5a1cccdc3c342b3a3a4811be46ae2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
