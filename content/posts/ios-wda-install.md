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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XN32ZOMH%2F20260706%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260706T194018Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCcp4Mh95Uk44S%2FvjA66pAzg8%2FBIGHr26m2MYe95FMzowIhAM%2F8JHfC68bPxztaf66meapXPN3Olc%2B03ydKkKH%2BPH9zKv8DCFwQABoMNjM3NDIzMTgzODA1IgzLI5TRJPQLOBRMbG0q3AMIhOmW2g3hka7s8OOvgAhp%2BJ28SEsMfLN6cEEv59EgfKbBjrqrYr0Js7N31Q3I0SShKQ0ZxzOhwTqWHsQU1l9E5KKPdzCyGlqgFFIYr%2BfT1GiKV4%2Bzt8HIfeuxPg8I1n0yi0gVN7sbf%2BTIliZzGKwwNiIe5TBDEsP3Ufxk1eB58zSJKzJK5wowcW8kn0T9Cdk77o4BslDjYATBiXmG9LgECyknCCi6V9suXT6Q0dPHN%2B5OyIWawSA2RUDpgy8VzM9FzwCYyWrtoDmjwjtmE55CTDh6QoXB9pcQtdrO4rIcSSERlZk%2FJkbD1qHFwJfQPLEoeUd7gczYS8PyBupP8UU9E0XTBrvFNWl9DMKogALX8sCjR6eJhNvzGuUQRltWLGohgQJfd33IMHk7paoKFCsaJ1uyIDZWaLRAbOsT9AXb9L9r7bqOBpvRJnmTzDRj3ZQpNpfUETJG7sM4w9HXxR%2BwhTvkltehz8VjeFbDCaUcyeOq0K8q4ys%2FWLAljWwCxu7Zp6M7hSfBdeYgeInvh%2FxfkzJI%2FoxnEHlTGkne60UCd5wKKXT%2Bp%2F%2FbquhB4Ar3SuwQCFoOXRVUSZfVSODYEl91gKcZ8E2O34Zi6NqnL5RIDwFua6oryysAEnLY2DDU86%2FSBjqkASil9jtEKK3ehtZgy3lGtc%2BwZcE49nPSiCJuaQpIGvL6zfvdGwj3pIg3rvTT%2B5miu2WUIkIL%2BrPOJgQ7ZmKZ4gELuUJmCHUdxkRPa9e1g6Wak09eQWsf1ygUVsvoNf3swcnqvR4cDglGX4LTGtFeRHS8YIPPrcpb0sjpfGWeDz%2FXxuQ6%2BU%2B%2Fe6KoPuGJaG47aB%2BXaVyzR8o32my9z%2Fy0eVottun0&X-Amz-Signature=6ce6e54ba978cbef50285f86512091419b6c698451df71f0cdbd7745f79dfa81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XN32ZOMH%2F20260706%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260706T194018Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCcp4Mh95Uk44S%2FvjA66pAzg8%2FBIGHr26m2MYe95FMzowIhAM%2F8JHfC68bPxztaf66meapXPN3Olc%2B03ydKkKH%2BPH9zKv8DCFwQABoMNjM3NDIzMTgzODA1IgzLI5TRJPQLOBRMbG0q3AMIhOmW2g3hka7s8OOvgAhp%2BJ28SEsMfLN6cEEv59EgfKbBjrqrYr0Js7N31Q3I0SShKQ0ZxzOhwTqWHsQU1l9E5KKPdzCyGlqgFFIYr%2BfT1GiKV4%2Bzt8HIfeuxPg8I1n0yi0gVN7sbf%2BTIliZzGKwwNiIe5TBDEsP3Ufxk1eB58zSJKzJK5wowcW8kn0T9Cdk77o4BslDjYATBiXmG9LgECyknCCi6V9suXT6Q0dPHN%2B5OyIWawSA2RUDpgy8VzM9FzwCYyWrtoDmjwjtmE55CTDh6QoXB9pcQtdrO4rIcSSERlZk%2FJkbD1qHFwJfQPLEoeUd7gczYS8PyBupP8UU9E0XTBrvFNWl9DMKogALX8sCjR6eJhNvzGuUQRltWLGohgQJfd33IMHk7paoKFCsaJ1uyIDZWaLRAbOsT9AXb9L9r7bqOBpvRJnmTzDRj3ZQpNpfUETJG7sM4w9HXxR%2BwhTvkltehz8VjeFbDCaUcyeOq0K8q4ys%2FWLAljWwCxu7Zp6M7hSfBdeYgeInvh%2FxfkzJI%2FoxnEHlTGkne60UCd5wKKXT%2Bp%2F%2FbquhB4Ar3SuwQCFoOXRVUSZfVSODYEl91gKcZ8E2O34Zi6NqnL5RIDwFua6oryysAEnLY2DDU86%2FSBjqkASil9jtEKK3ehtZgy3lGtc%2BwZcE49nPSiCJuaQpIGvL6zfvdGwj3pIg3rvTT%2B5miu2WUIkIL%2BrPOJgQ7ZmKZ4gELuUJmCHUdxkRPa9e1g6Wak09eQWsf1ygUVsvoNf3swcnqvR4cDglGX4LTGtFeRHS8YIPPrcpb0sjpfGWeDz%2FXxuQ6%2BU%2B%2Fe6KoPuGJaG47aB%2BXaVyzR8o32my9z%2Fy0eVottun0&X-Amz-Signature=356f16aed4662135de399f4a1e98d7c015e44142e4cfe23f5c1581bdbe179188&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
