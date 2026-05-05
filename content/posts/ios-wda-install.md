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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q4VYGA7T%2F20260505%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260505T190402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGgz2Wc7PLQ1D%2BWiTh8maLqBn1j4ZSTXsppngfewdNGrAiBE5mx2N1DAlDIRtBpMv7uvdA9A7KEjeca85OOajdG75yqIBAiL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOD1GgpoiJFSvwg4zKtwDtcq8F0%2B7uwLYc8dAUVz%2BjBGuFlS6m3t1L2IG27vZf9kScwGQA87zEhhUv%2BkJ7AF7VTWf6eHHA5sZcwl2FZiE8mtKGzZ4tgjLwJIYpVZyDIiyfyDpQk5NmcIh%2F%2BTgmBu0b6xbrOtsA2sNvjjFBKUpMQXxYFT2j0U%2F3dRvdQmampRDxV%2B%2FPoZFL8oDp6vXimTkQj%2B7JhdGo9Y7uh19cUI2NFOITDDX%2Fm5SPOodpE0Mkmv9gvPtxrc0JflIMds1YLtSu2joMstBO5gIMsHMc8ee5mS%2FlsU%2B22OSnIgUHO%2Fs0wuJyOuLpjERRC7xe2nnR4ZTi6tEs6x2aQqaO2i%2FpYE6fYGSLS1xVl4kdEdD9OeNaeESu6pzuLEb7x8PWNkmnWZI4g8ydBLuLEJZWWGaxXajEGR5R%2BO5%2Bw7p3BYzB6dBhXecSdJ0NZQolslbIOLbMJVy4JkcU3%2FWKXcPCt4rQu59%2FO6AZZLerX2xoWgf%2BLf2l9b7U1BYsAf2PlBd03eUnavHaMm1s4LZ1rhUWKqEx3ohtYDJz%2FUvDw6WqFJ3RFSnW1DwYIMikzA9h69UikE%2BMknBIrrOZufzfmM1u36nzXwulQv%2FMjsQ7PTl9XuaxSIyirdRwxMpq3A1eETtwigw0%2BfozwY6pgEz%2FH%2F3vcS%2BqfenH%2BmPCVD1hzeGDN9wHfDuHPk2WIEGJw7uHaYbbKhZdIeiXlyKsMgv%2Bgiuqg8M8V9H0YkaNgW49yQoZ%2BXDqbAzCbA3fh6hjMSckXWkpLD8U%2FtZFFVXAqxbiiZh20SMN4eai3g6BLpGyroebsJw0sS1jnIIhobH6JsZCquCJVJKEl%2BvMDVvlkti%2Fo25hSd9%2BQsoneVDHmjO9Y9yHl%2F3&X-Amz-Signature=fe33e434c436292b72e5401b94ab5cf5e98c28cb77a1f3075fbca39dddd1a74e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q4VYGA7T%2F20260505%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260505T190402Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGgz2Wc7PLQ1D%2BWiTh8maLqBn1j4ZSTXsppngfewdNGrAiBE5mx2N1DAlDIRtBpMv7uvdA9A7KEjeca85OOajdG75yqIBAiL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOD1GgpoiJFSvwg4zKtwDtcq8F0%2B7uwLYc8dAUVz%2BjBGuFlS6m3t1L2IG27vZf9kScwGQA87zEhhUv%2BkJ7AF7VTWf6eHHA5sZcwl2FZiE8mtKGzZ4tgjLwJIYpVZyDIiyfyDpQk5NmcIh%2F%2BTgmBu0b6xbrOtsA2sNvjjFBKUpMQXxYFT2j0U%2F3dRvdQmampRDxV%2B%2FPoZFL8oDp6vXimTkQj%2B7JhdGo9Y7uh19cUI2NFOITDDX%2Fm5SPOodpE0Mkmv9gvPtxrc0JflIMds1YLtSu2joMstBO5gIMsHMc8ee5mS%2FlsU%2B22OSnIgUHO%2Fs0wuJyOuLpjERRC7xe2nnR4ZTi6tEs6x2aQqaO2i%2FpYE6fYGSLS1xVl4kdEdD9OeNaeESu6pzuLEb7x8PWNkmnWZI4g8ydBLuLEJZWWGaxXajEGR5R%2BO5%2Bw7p3BYzB6dBhXecSdJ0NZQolslbIOLbMJVy4JkcU3%2FWKXcPCt4rQu59%2FO6AZZLerX2xoWgf%2BLf2l9b7U1BYsAf2PlBd03eUnavHaMm1s4LZ1rhUWKqEx3ohtYDJz%2FUvDw6WqFJ3RFSnW1DwYIMikzA9h69UikE%2BMknBIrrOZufzfmM1u36nzXwulQv%2FMjsQ7PTl9XuaxSIyirdRwxMpq3A1eETtwigw0%2BfozwY6pgEz%2FH%2F3vcS%2BqfenH%2BmPCVD1hzeGDN9wHfDuHPk2WIEGJw7uHaYbbKhZdIeiXlyKsMgv%2Bgiuqg8M8V9H0YkaNgW49yQoZ%2BXDqbAzCbA3fh6hjMSckXWkpLD8U%2FtZFFVXAqxbiiZh20SMN4eai3g6BLpGyroebsJw0sS1jnIIhobH6JsZCquCJVJKEl%2BvMDVvlkti%2Fo25hSd9%2BQsoneVDHmjO9Y9yHl%2F3&X-Amz-Signature=7290cd229b66896088e043463eb2966ac846a319a080bba23c1a1ee571278c37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
