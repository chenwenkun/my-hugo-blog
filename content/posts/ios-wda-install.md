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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YVEFYOKS%2F20251021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251021T005226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJHMEUCIQDCt7xb9fos7wKf%2BZl7dKjILYOs4lP98pnCdlWaoKL6qgIgIE30tbUT8iU6YwXu14cSqkqJGhCug8kLAHhjX7%2BNnkwqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDOaCstH%2BKHHH5lO7CrcA2bNPE2nNA%2FJgbfi8hPc6O%2Ftu2gRPU7fgECC%2BNupx42ygw3VskBqeXbT3aS0pESH059oM%2FtnNKWW4d3tVrxqA2rIUJn7Vkc5kkrm2WYo%2BEoqS9uLFA9YJQs8EgXc%2B24FZUV23unILa1qR3p3U35%2FAwdNd7n38DZBEp5l%2BgtNjdEJ1bVTr%2FdXZHqJL0DCdUIzKe3G6lpU0cZy1lXuXp9jfK3D8zyuyPiwRyueoLJE%2Bo99MO6LB%2FMUZPNPzbnIyCzepqKLzCHvS4rwVxIx3f4hBWKKXFRHN0rdnXD%2BYpCc44%2BaCQ9RklJrFH9KlcPH1%2BmnrA78QKWTgzSMmTyh%2FYj9B9aozKWE6zlGiUrkrmNBTJhcFs3%2FRMSiKgcG9ljAUtPZXmkW%2FizNmo9EmGSLHO31rfbDPCE8GW0JUgXEWtZGodITpbkBHMLH%2FNJEHg1gljlGayXsWkKvQq7WxXKOrkOwnEGgTv0zSHvNPVza947NYRBW3SZf%2Br%2BTMUbww4ZnxwkQ%2BeLKQg2AedFics03rCb443Kqz6xtPaJC4JtkggD5%2B9RmFp4KnEXiNMhk5zGHaHTaJOk2F68BYvWYu%2FdWpXV4TbOMHV1dOAIn7%2BD2aqz%2FYkALYxLAZ4au071YtP9IMKGt28cGOqUBBQJmwnc9gsEMhdKVMxMUnBaJ6lToW%2BqpfhVPBtVMst9HBwOxr5zk%2Bg5X64x0YhVQSNtiLHBJe81k4KCEIlk3A%2BVIADgaLordCy3nnqDCUennUWRcqLP9Js7lm6SaQBYCB5nZoyyBOtA1SPNrmKXrCoZdx2Ed0TNaZ12hvHnXcQtNs40m75PswbzqmbD4nGmV73YSjrL%2BUzvWbrpm3RKXjuXYQ7X8&X-Amz-Signature=798e5e8cc9b7235e4fe9ee7df5816bf3361db85ca16a93e2850e0590142aaa61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YVEFYOKS%2F20251021%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251021T005226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLXdlc3QtMiJHMEUCIQDCt7xb9fos7wKf%2BZl7dKjILYOs4lP98pnCdlWaoKL6qgIgIE30tbUT8iU6YwXu14cSqkqJGhCug8kLAHhjX7%2BNnkwqiAQI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDOaCstH%2BKHHH5lO7CrcA2bNPE2nNA%2FJgbfi8hPc6O%2Ftu2gRPU7fgECC%2BNupx42ygw3VskBqeXbT3aS0pESH059oM%2FtnNKWW4d3tVrxqA2rIUJn7Vkc5kkrm2WYo%2BEoqS9uLFA9YJQs8EgXc%2B24FZUV23unILa1qR3p3U35%2FAwdNd7n38DZBEp5l%2BgtNjdEJ1bVTr%2FdXZHqJL0DCdUIzKe3G6lpU0cZy1lXuXp9jfK3D8zyuyPiwRyueoLJE%2Bo99MO6LB%2FMUZPNPzbnIyCzepqKLzCHvS4rwVxIx3f4hBWKKXFRHN0rdnXD%2BYpCc44%2BaCQ9RklJrFH9KlcPH1%2BmnrA78QKWTgzSMmTyh%2FYj9B9aozKWE6zlGiUrkrmNBTJhcFs3%2FRMSiKgcG9ljAUtPZXmkW%2FizNmo9EmGSLHO31rfbDPCE8GW0JUgXEWtZGodITpbkBHMLH%2FNJEHg1gljlGayXsWkKvQq7WxXKOrkOwnEGgTv0zSHvNPVza947NYRBW3SZf%2Br%2BTMUbww4ZnxwkQ%2BeLKQg2AedFics03rCb443Kqz6xtPaJC4JtkggD5%2B9RmFp4KnEXiNMhk5zGHaHTaJOk2F68BYvWYu%2FdWpXV4TbOMHV1dOAIn7%2BD2aqz%2FYkALYxLAZ4au071YtP9IMKGt28cGOqUBBQJmwnc9gsEMhdKVMxMUnBaJ6lToW%2BqpfhVPBtVMst9HBwOxr5zk%2Bg5X64x0YhVQSNtiLHBJe81k4KCEIlk3A%2BVIADgaLordCy3nnqDCUennUWRcqLP9Js7lm6SaQBYCB5nZoyyBOtA1SPNrmKXrCoZdx2Ed0TNaZ12hvHnXcQtNs40m75PswbzqmbD4nGmV73YSjrL%2BUzvWbrpm3RKXjuXYQ7X8&X-Amz-Signature=5bb816094744410f3550cd03b2d87b0945729f02091f4ba6d40a9544a310989e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
