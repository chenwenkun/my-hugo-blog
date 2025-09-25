---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
---
测试系统 16.6 运行闪退

18.3 18.4系统正常安装

代码地址：

本来是 facebook 的项目，目前由 appium 进行维护

代码下载

先在xcode 构建一次，修改Bundle Identifier，勾选自己的 appleid

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZKNDLZ4%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T061635Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDqQ1AC%2F2pSLpk9rH48vXwtYJk%2BzIsOvOPucEJZoBMWzAiEA365Zwni3ywMKr%2BhcGMx9x93w0dkfkuZ6%2Btrsud7ZyOwq%2FwMIbRAAGgw2Mzc0MjMxODM4MDUiDOzkaKVM8HzBLnMamyrcAySRsLzT6t00MMrUIAbPt%2Ft2Keeb6D9s0Yf5nVZOjoTfCk7EYRI99Q%2FODjJ6lClpZrRQx%2BmdbFAdccrKDJ%2FV%2BIgkY9tU5KGvXMjd78ODi9rn2LIq%2BQbMnC5cbWVZv6J7O6%2BWVlSXrKXivdgPwYhQz5PEr2RAiQjhEcyor7qZW0lX8PEwt273Kf8%2F9ea5uVazLsk9ZoN1FwfdXJnznFJnRKSqY6lQ9OJLzOORP6YZ2sPs1C5AnyVN36u7YK53bieEw7Ij%2B%2FrwHGNCR7qn%2FkFvf7kzVMYAuMooTAfV9rAq3nLYo2J%2FFdbPaF%2B5uYJ5hPw1S1u%2BAmLkKD0SK31HTg50mp28y1pefSc4kQHOO17TuWhvbyjsYRs2bzrvJd94d9EnjhUAZbJ9lpvWGZ78TvrWhT1zGwySbSwgPsV5qwgFZBGLaETAl9WF5G8KbTppw12BZzLxDk%2F495D6OB3OszHQ%2BgvoFPxw5jAv33S%2BUgdQcYQIle%2Fb5HNVmAj%2B%2FhTl7QDl6rPjUa%2FJN3E%2FJbM0g%2B1yIHUCSXYTJU3KqDfKOZmkfnqbgfH%2FeJaXj2VNpNkzC3eE6myh%2Fsw94AsUobx8Oj7nZ5I15rydVd2dEOE%2Bc%2Fo35mitJXFfFvt03vNleq0NMPz20sYGOqUBCqbbkBmV4Wl1DAd0AJdD7HiX06yv1oPhaa8Qo5e9n915hsvaaWpma0F4MAX2HlBDa7zN1vDlD%2BDTbzVravWIzfw6QEieEcVu6KZuXatrpFEEvRSnlmoG7qN%2FR4nh8v2OeNrwTxzeSgx9mGznMCuTu9aH2solGh9NvJQovyyp23JGd2gaJhzWbgYpJDBDFW6VupUqTFTI7rAEGEuSg8XzcD6DSP25&X-Amz-Signature=f00b777d091e673c9e95331fae52cd3d6c54d87efd2547a7693202817eaf3bf4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZKNDLZ4%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T061635Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDqQ1AC%2F2pSLpk9rH48vXwtYJk%2BzIsOvOPucEJZoBMWzAiEA365Zwni3ywMKr%2BhcGMx9x93w0dkfkuZ6%2Btrsud7ZyOwq%2FwMIbRAAGgw2Mzc0MjMxODM4MDUiDOzkaKVM8HzBLnMamyrcAySRsLzT6t00MMrUIAbPt%2Ft2Keeb6D9s0Yf5nVZOjoTfCk7EYRI99Q%2FODjJ6lClpZrRQx%2BmdbFAdccrKDJ%2FV%2BIgkY9tU5KGvXMjd78ODi9rn2LIq%2BQbMnC5cbWVZv6J7O6%2BWVlSXrKXivdgPwYhQz5PEr2RAiQjhEcyor7qZW0lX8PEwt273Kf8%2F9ea5uVazLsk9ZoN1FwfdXJnznFJnRKSqY6lQ9OJLzOORP6YZ2sPs1C5AnyVN36u7YK53bieEw7Ij%2B%2FrwHGNCR7qn%2FkFvf7kzVMYAuMooTAfV9rAq3nLYo2J%2FFdbPaF%2B5uYJ5hPw1S1u%2BAmLkKD0SK31HTg50mp28y1pefSc4kQHOO17TuWhvbyjsYRs2bzrvJd94d9EnjhUAZbJ9lpvWGZ78TvrWhT1zGwySbSwgPsV5qwgFZBGLaETAl9WF5G8KbTppw12BZzLxDk%2F495D6OB3OszHQ%2BgvoFPxw5jAv33S%2BUgdQcYQIle%2Fb5HNVmAj%2B%2FhTl7QDl6rPjUa%2FJN3E%2FJbM0g%2B1yIHUCSXYTJU3KqDfKOZmkfnqbgfH%2FeJaXj2VNpNkzC3eE6myh%2Fsw94AsUobx8Oj7nZ5I15rydVd2dEOE%2Bc%2Fo35mitJXFfFvt03vNleq0NMPz20sYGOqUBCqbbkBmV4Wl1DAd0AJdD7HiX06yv1oPhaa8Qo5e9n915hsvaaWpma0F4MAX2HlBDa7zN1vDlD%2BDTbzVravWIzfw6QEieEcVu6KZuXatrpFEEvRSnlmoG7qN%2FR4nh8v2OeNrwTxzeSgx9mGznMCuTu9aH2solGh9NvJQovyyp23JGd2gaJhzWbgYpJDBDFW6VupUqTFTI7rAEGEuSg8XzcD6DSP25&X-Amz-Signature=79bf478cb9db4c08105c9f44f8c14ebe763ccfc942bcb9cb48fad7358e6f869b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
