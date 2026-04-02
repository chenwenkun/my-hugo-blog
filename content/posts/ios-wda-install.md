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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662INYZ7LB%2F20260402%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260402T011726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDsJPzN4s7htEsHDJ2rX5CWMNvLHBcMngm6748ek3vL7AIhAM8Uze7sxDDNAs%2FZtY9%2FNt8wVUP%2BMjczx%2FnsNapmXRotKv8DCGEQABoMNjM3NDIzMTgzODA1Igxs2Vp0uHgcWqCKvVgq3APEmMQMgrsJflIt%2BtCZ6d61MUNqF4IObCsAXHYj8wRSA4Cs52BF347el9wpSDeUydFuOZIqQw81FFsDu2nKvoUQYOyozO%2B%2BGoBJ3%2BhmYsQhuaF8SoCmze6AGjE0ewrhbqnUZlDxvTtGKZr4kbWMcb%2BxOxMcFmu4mnxiu%2B2kqzZfApapyBTvataQfwfRkNAGmpngzLCOX%2FL0lEepgNDcwSm9K%2FWM0tzSenXlUHiSGFuHv%2B1Ej%2Ffj8l8q5v%2FJW382krrMqn3%2BPsPcsya135Jwlx53eh5V0733HMGLn0yAB4FRwuwTmDbM8ZuAmgpPMTZvIJYbYcaCu%2B85uzuqmVRa8BJDlipfYo1jjcm%2F0cDZCiy1laxAy0UxL1EqZy7wW2CS4DEMSdurCG8lH6nGsLcv9WprnCe9VOOoyzVvV8tFN4Ib9eJNJMnQvU1HDJdwGxD9YSTRcAZuUCjVvUVJbkvB4%2Fj49UYS%2FFF7fLZ%2Bx8FUDblR2uXp1bZGxD9krt3hWlDFg%2FAS9Ur12dpW1A9LQfGBuoZuLCKUdA057%2FuXazP7bfYUT9drtAk4t%2B0BKfCGc19MxfX8FoicByb8EyuBZsloOcBhYNY3EAWi9Jv3wCTJrpfq3dOoBgZopix3gQ1FHDCr5rbOBjqkAcw%2FGKPrNwAt%2B%2FZMhN351MrqCrhPGDYx7u38kqRcGyhD3zku6PjqZ19tX85vK4iPNKVJ9%2Bs0nbqgKJETCQSi3%2FEDyAKz0Z7nvO7Vehy7g%2F1LdkNPyBOzBpd%2F9n9e0qygf5jLJ1%2FZCZ5urKpYqwYTASzdDUnliOqNCPHR9aFNMoeDeUI8xG8dfNsXzDBveJ3s7%2FpnHJrC1rMxZGwu2V9yK9NMSFVF&X-Amz-Signature=e9153e234166801105425892ac703106d2e3c913ef0f1241cfbd603cea4e7be0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662INYZ7LB%2F20260402%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260402T011726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDsJPzN4s7htEsHDJ2rX5CWMNvLHBcMngm6748ek3vL7AIhAM8Uze7sxDDNAs%2FZtY9%2FNt8wVUP%2BMjczx%2FnsNapmXRotKv8DCGEQABoMNjM3NDIzMTgzODA1Igxs2Vp0uHgcWqCKvVgq3APEmMQMgrsJflIt%2BtCZ6d61MUNqF4IObCsAXHYj8wRSA4Cs52BF347el9wpSDeUydFuOZIqQw81FFsDu2nKvoUQYOyozO%2B%2BGoBJ3%2BhmYsQhuaF8SoCmze6AGjE0ewrhbqnUZlDxvTtGKZr4kbWMcb%2BxOxMcFmu4mnxiu%2B2kqzZfApapyBTvataQfwfRkNAGmpngzLCOX%2FL0lEepgNDcwSm9K%2FWM0tzSenXlUHiSGFuHv%2B1Ej%2Ffj8l8q5v%2FJW382krrMqn3%2BPsPcsya135Jwlx53eh5V0733HMGLn0yAB4FRwuwTmDbM8ZuAmgpPMTZvIJYbYcaCu%2B85uzuqmVRa8BJDlipfYo1jjcm%2F0cDZCiy1laxAy0UxL1EqZy7wW2CS4DEMSdurCG8lH6nGsLcv9WprnCe9VOOoyzVvV8tFN4Ib9eJNJMnQvU1HDJdwGxD9YSTRcAZuUCjVvUVJbkvB4%2Fj49UYS%2FFF7fLZ%2Bx8FUDblR2uXp1bZGxD9krt3hWlDFg%2FAS9Ur12dpW1A9LQfGBuoZuLCKUdA057%2FuXazP7bfYUT9drtAk4t%2B0BKfCGc19MxfX8FoicByb8EyuBZsloOcBhYNY3EAWi9Jv3wCTJrpfq3dOoBgZopix3gQ1FHDCr5rbOBjqkAcw%2FGKPrNwAt%2B%2FZMhN351MrqCrhPGDYx7u38kqRcGyhD3zku6PjqZ19tX85vK4iPNKVJ9%2Bs0nbqgKJETCQSi3%2FEDyAKz0Z7nvO7Vehy7g%2F1LdkNPyBOzBpd%2F9n9e0qygf5jLJ1%2FZCZ5urKpYqwYTASzdDUnliOqNCPHR9aFNMoeDeUI8xG8dfNsXzDBveJ3s7%2FpnHJrC1rMxZGwu2V9yK9NMSFVF&X-Amz-Signature=abd570f60e34f0978a2251e27207aab8b63eb7dd553e9e095fe08ea6d5faa44e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
