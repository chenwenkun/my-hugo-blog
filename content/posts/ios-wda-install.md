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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466US7O3ATX%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T101502Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCL%2FlFn5PLYkibEjw4qN3Wyn7u%2BoAad82d7RN2eejT1BQIgbAy9I0rTGid3%2FUqHM3hJhy7elXYrvQcMkNjP01h8JlcqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD948G13NaZ8XTQMXyrcA%2BJBwAUC3vOLxR4TImSOSCoSJd%2Ft%2FUIB%2BGvurSb3syw5iLgjf%2BcDwPjOk3cs7gIDHxH9UygUSGfevbyhCxYO%2FRzvkwCbjZAzTDBVUMR9zOjNJzRY7g2EtUkBOlrZHxpToMRh2Vrs%2BBnaklucT6SEo2DRyLherUzQy0INWoxPXnFiW6AcOiIa7TDRmL%2BahEo2q9tZs9kTPW%2BEl9X%2B8Jot8CxNO7tnsf5dH0IIDNujpYJ%2FUbrsM4%2BO0cIlmBZ5CtX1g%2FE3wkX5d1F5O1vio2lVOWUdzBHl%2BfDazrsr%2BnFbe4YqvRYDQVvrWZNK3tpu%2Fks5Gp18IJi9j%2B2QunZ6h8WqnE1gLSOCb9%2BhlatafDBtFuRbtFdS2vILUZUhvmPkF9Cct5yW3RLKAu0zdzdjrB2om7r%2FQR%2FK298fVjDhpeJMmguXtPH57heSamJYY4t9%2B3uHx2mMbnkwV17bRPSmeGa3c85zS0QRdA97gSAPFGw6SJ6vJax2b2eLhY50sXzmJyKiyKF2elWqyTPPJ6rZhurxUWNLYpo8TbdQcZmMAlSg7sIznz%2Fy4Zgz0o13HsfnwuWQmAZIMIe%2B6YYbylnmAPGbyUced2VOkoUB%2BWH26HHKJaLc1QPZPj9MR9TzxW7uMO2JmtEGOqUBsVVKwBoZ%2BG6sX6m2KIfA0%2Bsr4kQBx3mnluqe%2F1D%2Fmijum2%2FSLU9wYCwMnGUgeMC8xkHq9o4V4TZ%2FYB73W02IHuQ4R1V0MheQ%2BDsL2pXZ4MqeJzvdeHZSR1SQc3otlYyltL9hjV%2FiYuy%2FoPEp1PHQ2bRMA%2B%2BzVExrtB0swvcTru%2F4HXY454jTbCU7O9pfvpTtBoLnCNYV3%2BqG0cYP4Kz%2B54gewKmD&X-Amz-Signature=8eeac094438f3ed8ddfc8542bbc252ba70adee6554e35a6b04f5a9f02f1d1e59&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466US7O3ATX%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T101502Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCL%2FlFn5PLYkibEjw4qN3Wyn7u%2BoAad82d7RN2eejT1BQIgbAy9I0rTGid3%2FUqHM3hJhy7elXYrvQcMkNjP01h8JlcqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD948G13NaZ8XTQMXyrcA%2BJBwAUC3vOLxR4TImSOSCoSJd%2Ft%2FUIB%2BGvurSb3syw5iLgjf%2BcDwPjOk3cs7gIDHxH9UygUSGfevbyhCxYO%2FRzvkwCbjZAzTDBVUMR9zOjNJzRY7g2EtUkBOlrZHxpToMRh2Vrs%2BBnaklucT6SEo2DRyLherUzQy0INWoxPXnFiW6AcOiIa7TDRmL%2BahEo2q9tZs9kTPW%2BEl9X%2B8Jot8CxNO7tnsf5dH0IIDNujpYJ%2FUbrsM4%2BO0cIlmBZ5CtX1g%2FE3wkX5d1F5O1vio2lVOWUdzBHl%2BfDazrsr%2BnFbe4YqvRYDQVvrWZNK3tpu%2Fks5Gp18IJi9j%2B2QunZ6h8WqnE1gLSOCb9%2BhlatafDBtFuRbtFdS2vILUZUhvmPkF9Cct5yW3RLKAu0zdzdjrB2om7r%2FQR%2FK298fVjDhpeJMmguXtPH57heSamJYY4t9%2B3uHx2mMbnkwV17bRPSmeGa3c85zS0QRdA97gSAPFGw6SJ6vJax2b2eLhY50sXzmJyKiyKF2elWqyTPPJ6rZhurxUWNLYpo8TbdQcZmMAlSg7sIznz%2Fy4Zgz0o13HsfnwuWQmAZIMIe%2B6YYbylnmAPGbyUced2VOkoUB%2BWH26HHKJaLc1QPZPj9MR9TzxW7uMO2JmtEGOqUBsVVKwBoZ%2BG6sX6m2KIfA0%2Bsr4kQBx3mnluqe%2F1D%2Fmijum2%2FSLU9wYCwMnGUgeMC8xkHq9o4V4TZ%2FYB73W02IHuQ4R1V0MheQ%2BDsL2pXZ4MqeJzvdeHZSR1SQc3otlYyltL9hjV%2FiYuy%2FoPEp1PHQ2bRMA%2B%2BzVExrtB0swvcTru%2F4HXY454jTbCU7O9pfvpTtBoLnCNYV3%2BqG0cYP4Kz%2B54gewKmD&X-Amz-Signature=e0a02737157d128b8c64b10d014ea536163fbc6e9e83ed6435cdf7cf42d51a28&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
