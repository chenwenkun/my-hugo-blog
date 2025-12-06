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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667TIHRIFO%2F20251206%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251206T181454Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD%2Bvb5pr2UGvKP%2F6x5Zl4Ckro5bAAe%2FdDXiVWv8W0%2FvxQIhAJegaAtNby%2By7%2BkQBq6KAoUzBWomamtd41V44igiI1buKv8DCHoQABoMNjM3NDIzMTgzODA1IgxVEnpY70GY3Ms0Mikq3ANs9xbBhPIVAFPTJpzW4SXc%2BEAUuo%2FZkTfdEQ67LZ%2B7UyayVmiwkBtwfe5AT1CSmLwBj4DCdgKQ6P%2FnL9VBKGfGuyBNqOarNFvDaXeHH3spirAVQxmeZkKy3rq1Jw4iqM5K9c%2B875C4KM5MtTlIiT64fn2toSmWSoP0OFg8jQfwpTTvqpKIiVGzFKSrSJlKUsL%2Bd9B7z9Ov8dbY3C5spKzwjr595o0isFebpMSmxSP%2FtleKkD2M8boQzSkuzq8IfkO4O%2BpAypg8Vt2hDZK8R681Hfxt4sPGS5Ryd9fsSyTPxEMtzZHtY3yQOWzTUI3wFn0t4CuEyL7HF2puZulmH4f%2B8BlI3gZLqgmUkVJzv%2F4z7YJySmi%2BRU3uZtt5NqPO%2Bc4VtYe8yNs0h31KWCtOWo6%2F%2F%2BMBWvXOdJEjNNp2jn%2BR7BXl6IfNi6gtm6Q5zUy9ZyGuNFyTn77U%2F0nemU7QVWaCvxbskQyLvmn3lAp%2Fcwxa38GdqAyJ%2BQoVBqVKPIi4gk%2Fo8piL%2FBc%2FdJRU61KKBRLlYL%2BkkdW7c3unS6MKfB7VshgPOuRh9h9%2BYZDfHcljvyMKDavqt0NewbHjjWqYrWgshKj0QFJeVRyIg5H7eEul1ZMsPVDPUOMWUi3oLTDVy9HJBjqkAZ%2Bjk9h45MA0snBDIvzhkjii5Q%2F4F5JfBBKLqPxOl%2F5PxP8OSPV3GJzbACir%2BYsEOaQBrTCd5mpL5Y46%2F4VrDpa4fbclnHWbEE88c55MCNR8wTKPDd9JLRZJpKAMzMudnStQov4LG0HnYBZbyhrAK9EFdfi34TIL8L%2FZ6Dp%2BCWb2HCbwQp1Rlb%2FvqmqoRwNmXPjlMBzEr64rCcPWiD9o3YPfmaoI&X-Amz-Signature=8268dd9ac4ccc96cf178b8b48d49ad71798bddbafe0e57c239a8dd92fb44cb69&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667TIHRIFO%2F20251206%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251206T181454Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD%2Bvb5pr2UGvKP%2F6x5Zl4Ckro5bAAe%2FdDXiVWv8W0%2FvxQIhAJegaAtNby%2By7%2BkQBq6KAoUzBWomamtd41V44igiI1buKv8DCHoQABoMNjM3NDIzMTgzODA1IgxVEnpY70GY3Ms0Mikq3ANs9xbBhPIVAFPTJpzW4SXc%2BEAUuo%2FZkTfdEQ67LZ%2B7UyayVmiwkBtwfe5AT1CSmLwBj4DCdgKQ6P%2FnL9VBKGfGuyBNqOarNFvDaXeHH3spirAVQxmeZkKy3rq1Jw4iqM5K9c%2B875C4KM5MtTlIiT64fn2toSmWSoP0OFg8jQfwpTTvqpKIiVGzFKSrSJlKUsL%2Bd9B7z9Ov8dbY3C5spKzwjr595o0isFebpMSmxSP%2FtleKkD2M8boQzSkuzq8IfkO4O%2BpAypg8Vt2hDZK8R681Hfxt4sPGS5Ryd9fsSyTPxEMtzZHtY3yQOWzTUI3wFn0t4CuEyL7HF2puZulmH4f%2B8BlI3gZLqgmUkVJzv%2F4z7YJySmi%2BRU3uZtt5NqPO%2Bc4VtYe8yNs0h31KWCtOWo6%2F%2F%2BMBWvXOdJEjNNp2jn%2BR7BXl6IfNi6gtm6Q5zUy9ZyGuNFyTn77U%2F0nemU7QVWaCvxbskQyLvmn3lAp%2Fcwxa38GdqAyJ%2BQoVBqVKPIi4gk%2Fo8piL%2FBc%2FdJRU61KKBRLlYL%2BkkdW7c3unS6MKfB7VshgPOuRh9h9%2BYZDfHcljvyMKDavqt0NewbHjjWqYrWgshKj0QFJeVRyIg5H7eEul1ZMsPVDPUOMWUi3oLTDVy9HJBjqkAZ%2Bjk9h45MA0snBDIvzhkjii5Q%2F4F5JfBBKLqPxOl%2F5PxP8OSPV3GJzbACir%2BYsEOaQBrTCd5mpL5Y46%2F4VrDpa4fbclnHWbEE88c55MCNR8wTKPDd9JLRZJpKAMzMudnStQov4LG0HnYBZbyhrAK9EFdfi34TIL8L%2FZ6Dp%2BCWb2HCbwQp1Rlb%2FvqmqoRwNmXPjlMBzEr64rCcPWiD9o3YPfmaoI&X-Amz-Signature=5a26d02bf451fb59d72ce6ba1cae3839883941ab567310e74c150dfef54d4eae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
