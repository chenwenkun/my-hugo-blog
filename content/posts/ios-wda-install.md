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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UWNPTW4Q%2F20260512%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260512T135157Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGUaCXVzLXdlc3QtMiJHMEUCIARHpDACG8KuS2kpPFUjDNNTKevtXGrYxGM6SRg63IrgAiEAxu%2Fvk3zugHbXLP%2FmdGvcEPda9rH%2B0Zbpca67ZVXKcn0q%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDBZZHOAmW3ThykoWDircAw9Bb%2BU4VR1FVfNbXZ8%2FoxgvTlIkLe0cpQwLGSefap38Y4FSzWpW0Eu3JCkr9PZbY4V5xk45XzH5gZh7J9lAiBv7FUgZ1TPMVAWVnvfj8PW3a4X7i2jfMBqozp3%2B%2BplFcUXJjeOVTwNoymkfpHSdk%2Fao%2FJiVT7j05%2Fo%2FIIjvFqikwtQsWLrtBf8HD3Fopaxlr%2BDN3dHtA78LyPAT1PW0JYjQIE%2F6YBEV6W8t6p9yoSYRUqz09xEgEQHNZ4rIyGFWAgO%2B4xWwVRS93Zr6ZQm7GTLB9Uj0zOEpiJml52BoJWzKS110uLRF70J%2BB3EabH8FpAzoaPlnV0QZ%2BWWW53zhjCKqjRsTOXIirfqBYR6wC%2FnunLBUmFZdA%2Fw6NFj4tA%2BIbZHcelq8bPHiDsTTRPU1T6zbCIOZOvQNkG60LVZNCuFbLdIp6pnSaSvpsdrdLc2I2jNJ9KSI1AQPtZ06v7Vrawk9I%2Bw9zlHI8y%2Ff8rMgmoFO1PPO%2FBcmL6nGvYjKt4CAogUssX8MCJ%2F9JIGdNBg3RLhpR8Jn8osu%2FeGWSkXqQYIn72QjoSMrEuQH8%2FJLarw09pxY4veHzqcTsvaWcClbokwGZRXHJsZTY9iGKzIRk6tHgawbjpHEucL5bT8LMNvIjNAGOqUB27P1M23MxUPagUrAM8uTtYuiLlRqsyAXJilTl5GqYJPrJU96tb1PvhjiMQCkHibS0nzB9JZ6RW17G7rjtT0rfDl6dzbftR6OGKbz4lyjnV8rPwRgm1ARZHlYyCvXX7ZqQBu9dy%2By8GeASOxjUqwvxd5U83sCvjT9pDwSHX%2F%2FFAUbOwePIxxF7WNqNn8%2B2PeiladVkabAbXvS%2FwH1WzbvZ9gFjBrG&X-Amz-Signature=9f4fdd649c432acf4594c613ba7e18fe321b9305caeb4713cf532fa9a9f31159&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UWNPTW4Q%2F20260512%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260512T135157Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGUaCXVzLXdlc3QtMiJHMEUCIARHpDACG8KuS2kpPFUjDNNTKevtXGrYxGM6SRg63IrgAiEAxu%2Fvk3zugHbXLP%2FmdGvcEPda9rH%2B0Zbpca67ZVXKcn0q%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDBZZHOAmW3ThykoWDircAw9Bb%2BU4VR1FVfNbXZ8%2FoxgvTlIkLe0cpQwLGSefap38Y4FSzWpW0Eu3JCkr9PZbY4V5xk45XzH5gZh7J9lAiBv7FUgZ1TPMVAWVnvfj8PW3a4X7i2jfMBqozp3%2B%2BplFcUXJjeOVTwNoymkfpHSdk%2Fao%2FJiVT7j05%2Fo%2FIIjvFqikwtQsWLrtBf8HD3Fopaxlr%2BDN3dHtA78LyPAT1PW0JYjQIE%2F6YBEV6W8t6p9yoSYRUqz09xEgEQHNZ4rIyGFWAgO%2B4xWwVRS93Zr6ZQm7GTLB9Uj0zOEpiJml52BoJWzKS110uLRF70J%2BB3EabH8FpAzoaPlnV0QZ%2BWWW53zhjCKqjRsTOXIirfqBYR6wC%2FnunLBUmFZdA%2Fw6NFj4tA%2BIbZHcelq8bPHiDsTTRPU1T6zbCIOZOvQNkG60LVZNCuFbLdIp6pnSaSvpsdrdLc2I2jNJ9KSI1AQPtZ06v7Vrawk9I%2Bw9zlHI8y%2Ff8rMgmoFO1PPO%2FBcmL6nGvYjKt4CAogUssX8MCJ%2F9JIGdNBg3RLhpR8Jn8osu%2FeGWSkXqQYIn72QjoSMrEuQH8%2FJLarw09pxY4veHzqcTsvaWcClbokwGZRXHJsZTY9iGKzIRk6tHgawbjpHEucL5bT8LMNvIjNAGOqUB27P1M23MxUPagUrAM8uTtYuiLlRqsyAXJilTl5GqYJPrJU96tb1PvhjiMQCkHibS0nzB9JZ6RW17G7rjtT0rfDl6dzbftR6OGKbz4lyjnV8rPwRgm1ARZHlYyCvXX7ZqQBu9dy%2By8GeASOxjUqwvxd5U83sCvjT9pDwSHX%2F%2FFAUbOwePIxxF7WNqNn8%2B2PeiladVkabAbXvS%2FwH1WzbvZ9gFjBrG&X-Amz-Signature=79f1125312830563baf1ad53d309024a4deed6a9d2d9977491305107ca62e98e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
