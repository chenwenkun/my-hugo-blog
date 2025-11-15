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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TD7PFYCQ%2F20251115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251115T005223Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIG7bt93PMHsfkRAy6oyVieIrocsRP5bsDfGc8HuUHb%2FyAiEAk6UbO24uOGOaycFVCqYBqN8ujgKKGe7CJA3vhOfneK8q%2FwMIcRAAGgw2Mzc0MjMxODM4MDUiDIM8yRNt6oAelSyhKircA6U6PM04Vc9Aj0v%2F6uFbkHijQdJ1bJ6xW%2Bp0O4XjVk2Qfqx024I54mA3XpMHa0sjPZrVMOTJ71zBDwkQ3QleZe%2FsC6u7AUBgeq56Q%2Fd1Ks7F00cf9NsIVKPunOyH8PlnvWMzlybjZcX%2Fi7dWOoS86mSv7YtCrXwgWUdQIpq2wIQRr5pE2%2BRBsGfOtUyMycpqDJF76X%2Bq7btyMZmMACwzcA80QkCY%2FvIsr1GG3V4jPYcubIu8O%2F3%2FfkIvy9KD0KejIUZI89cMxN23TGGt0k53gZWjhNGMrLS73UzD7j0rrvOy6H6y%2B1mp0p34%2Blm5F4aq3gc1P0UQHgfbBMwq5F3rqWfQCvRrsa5ir%2FvFvvQo2VFvLxPdh%2FCbHHiOecfWAICPNBAhb4WoKjh6e6%2Bsk09z03hSyi4ohVUMghgx%2BoELevm0ma4Dp8atPhTwTM%2FOon9ZnIzwr22hIaNe%2F5WALfP%2BCMtNQ2aGdic50KBslfutaYHhvLCoEeCFOlvcDGntWFfIUITZD7uWULVvd4Bt3cC3wsZjQEs%2Ba94OyFl5L3sg8VHcGXCrMo35j%2BlIfC%2F%2FFHBnHe5PwmJsa7DVTZWvvT3VffLP88Yf1wvxn6zGqKIVAD0AZPI6ZToThLEG5UPLMLGH38gGOqUBloEg2yGwM50ILP8GeGI%2FclmPcgkjpBEmCWlQycouUJYkGhT7Q5ept5gg9h9xj8Gjm3GNVObk1gcXlKHW6py%2FPDAuEXrxzUUaRATeRegQba0mI6fLO3P177MQfGzWOZdVQl2bIOEpO5ZbafHLw%2BU7z9f1B0q8OSyCFsCEF7aeYHWj0ji3Po0%2FpwGXZACWiSlq6aajOl8w%2BMOSeVpPoSYYjS3JH3B5&X-Amz-Signature=84ca85c598abbf05addf0bffea8e06ea65a772b24901a7df34ab31ca4564e493&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TD7PFYCQ%2F20251115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251115T005223Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIG7bt93PMHsfkRAy6oyVieIrocsRP5bsDfGc8HuUHb%2FyAiEAk6UbO24uOGOaycFVCqYBqN8ujgKKGe7CJA3vhOfneK8q%2FwMIcRAAGgw2Mzc0MjMxODM4MDUiDIM8yRNt6oAelSyhKircA6U6PM04Vc9Aj0v%2F6uFbkHijQdJ1bJ6xW%2Bp0O4XjVk2Qfqx024I54mA3XpMHa0sjPZrVMOTJ71zBDwkQ3QleZe%2FsC6u7AUBgeq56Q%2Fd1Ks7F00cf9NsIVKPunOyH8PlnvWMzlybjZcX%2Fi7dWOoS86mSv7YtCrXwgWUdQIpq2wIQRr5pE2%2BRBsGfOtUyMycpqDJF76X%2Bq7btyMZmMACwzcA80QkCY%2FvIsr1GG3V4jPYcubIu8O%2F3%2FfkIvy9KD0KejIUZI89cMxN23TGGt0k53gZWjhNGMrLS73UzD7j0rrvOy6H6y%2B1mp0p34%2Blm5F4aq3gc1P0UQHgfbBMwq5F3rqWfQCvRrsa5ir%2FvFvvQo2VFvLxPdh%2FCbHHiOecfWAICPNBAhb4WoKjh6e6%2Bsk09z03hSyi4ohVUMghgx%2BoELevm0ma4Dp8atPhTwTM%2FOon9ZnIzwr22hIaNe%2F5WALfP%2BCMtNQ2aGdic50KBslfutaYHhvLCoEeCFOlvcDGntWFfIUITZD7uWULVvd4Bt3cC3wsZjQEs%2Ba94OyFl5L3sg8VHcGXCrMo35j%2BlIfC%2F%2FFHBnHe5PwmJsa7DVTZWvvT3VffLP88Yf1wvxn6zGqKIVAD0AZPI6ZToThLEG5UPLMLGH38gGOqUBloEg2yGwM50ILP8GeGI%2FclmPcgkjpBEmCWlQycouUJYkGhT7Q5ept5gg9h9xj8Gjm3GNVObk1gcXlKHW6py%2FPDAuEXrxzUUaRATeRegQba0mI6fLO3P177MQfGzWOZdVQl2bIOEpO5ZbafHLw%2BU7z9f1B0q8OSyCFsCEF7aeYHWj0ji3Po0%2FpwGXZACWiSlq6aajOl8w%2BMOSeVpPoSYYjS3JH3B5&X-Amz-Signature=a9b4dabe47532d4debf11f997de3c9a1459bcce0986d5fdade90b6a2c85437c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
