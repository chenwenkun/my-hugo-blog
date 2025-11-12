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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664F7CKOLO%2F20251112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251112T181648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQCLFMqhMNNA84E%2FiNIHCuy6U1XfalRSr1OLf9QUA5K0kAIgPSvUkZ8%2FIGfuTJYZoRTdc8eaFj4R%2BAH7W57NfT%2BC5eoq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDG5e0Do4i52QHt5k9yrcA7Xh0RBAoA9uwOsxVHYVHrkd9%2BsKUQdttwvdO%2FZ%2FJH%2FT7gnZ9wc2DJbSUQ7I6xYc24g7aLic3LdOs59VbUjyPIF9qcZEBtWMBgUi5vkyS8jUCXHHSj06gNXR5jzCCwlsRg5infURD17FywjpTW75J2CyMN0WZqKWpC%2Bzu36rZrSESfHHOHvSWzq7mJ6Zk9Uu0L276fZeSpdMauV%2FO5GhdR7zAiIStX5gWq7GE2KKzyrqnNJUUIo7QV4GYGo2dxt2tYyZxJCcgRdxAVmcFzkm3Z7b%2Fx77x%2BhIlutW42e7wTpgZmpzWtSYPYYwkRivlpeCDG35CIfgHBXzLJeOic9YHZuwgWqkEOXqs9VUi%2Fsz2Azhrq7BA5AgyV5eyU1vSb7FYc1%2F0AFbVgVXfZ7KzfJAlrUla60j0HbdQFiRwbhQVVmtxbj8EuhjCb7RHDYVAjvO5VracYKVYvYMUPuGLCDpRtOIwdxw3CJaloK3NPBVlazYfwOt%2BnkUlHVKNHe7TZScO2OmyQsm1DvtHCcKU1neeypZOirF0clhrzF0C81eU%2F7M%2Fr3W7VVAKtmyDcFY5qf4pBgIC7GxBGfoZ3eAL057M%2B9TnJTc7C76Zb8ZOMX1h8jK3vJwt2HUoXI5SnzPMMSQ08gGOqUBhD%2BR5o4W15eX5FYfsL9wxDti8iI7onrknfihvJsRYnH4%2BOqEJb2vSgPxBT%2B1LY8tmwNrYbBzCWZcEbFCmnrTIV1nw1adwVaSAqjXabf5L13VfqExVTl6eYvLjLSScAXYVOO6cNZjjEPgsvJgfj4Xx69g1WqH79Q5%2BHPPxC0c0gQGkvLteTuJCTTjJHiOYv2knC5spKegjbvIALAT1QarxaqVLPEi&X-Amz-Signature=2a95889bc9a6451bd582e9e68278f0bc2d8cf885219a0cf963c5a9142a1a2957&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664F7CKOLO%2F20251112%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251112T181648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQCLFMqhMNNA84E%2FiNIHCuy6U1XfalRSr1OLf9QUA5K0kAIgPSvUkZ8%2FIGfuTJYZoRTdc8eaFj4R%2BAH7W57NfT%2BC5eoq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDG5e0Do4i52QHt5k9yrcA7Xh0RBAoA9uwOsxVHYVHrkd9%2BsKUQdttwvdO%2FZ%2FJH%2FT7gnZ9wc2DJbSUQ7I6xYc24g7aLic3LdOs59VbUjyPIF9qcZEBtWMBgUi5vkyS8jUCXHHSj06gNXR5jzCCwlsRg5infURD17FywjpTW75J2CyMN0WZqKWpC%2Bzu36rZrSESfHHOHvSWzq7mJ6Zk9Uu0L276fZeSpdMauV%2FO5GhdR7zAiIStX5gWq7GE2KKzyrqnNJUUIo7QV4GYGo2dxt2tYyZxJCcgRdxAVmcFzkm3Z7b%2Fx77x%2BhIlutW42e7wTpgZmpzWtSYPYYwkRivlpeCDG35CIfgHBXzLJeOic9YHZuwgWqkEOXqs9VUi%2Fsz2Azhrq7BA5AgyV5eyU1vSb7FYc1%2F0AFbVgVXfZ7KzfJAlrUla60j0HbdQFiRwbhQVVmtxbj8EuhjCb7RHDYVAjvO5VracYKVYvYMUPuGLCDpRtOIwdxw3CJaloK3NPBVlazYfwOt%2BnkUlHVKNHe7TZScO2OmyQsm1DvtHCcKU1neeypZOirF0clhrzF0C81eU%2F7M%2Fr3W7VVAKtmyDcFY5qf4pBgIC7GxBGfoZ3eAL057M%2B9TnJTc7C76Zb8ZOMX1h8jK3vJwt2HUoXI5SnzPMMSQ08gGOqUBhD%2BR5o4W15eX5FYfsL9wxDti8iI7onrknfihvJsRYnH4%2BOqEJb2vSgPxBT%2B1LY8tmwNrYbBzCWZcEbFCmnrTIV1nw1adwVaSAqjXabf5L13VfqExVTl6eYvLjLSScAXYVOO6cNZjjEPgsvJgfj4Xx69g1WqH79Q5%2BHPPxC0c0gQGkvLteTuJCTTjJHiOYv2knC5spKegjbvIALAT1QarxaqVLPEi&X-Amz-Signature=f1f683fba269342d2deb2f03cd1c05d624e41de793b8359fe6da100afe693cdf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
