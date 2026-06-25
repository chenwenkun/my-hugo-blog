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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGNSQBSG%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T084551Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFg8m8BmwdoC%2BELOuqDf2UOn11jY6jhPEJZ15z9545rSAiEAqHQpJwm1cLBY93YUo%2BbHVleXy1e8vhMXqI44YD9yF%2Foq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDKk6UZlG2yrC5iJBoCrcA0r4WThSES%2B6lSrEmfFbWyqylu4p7HT6Iy0tX2rhQC%2Bv%2FD7U%2BcdUdAUOWZhOlBhv0X2zzPxvk68nFZyOhZzKVU2MjNt94qN9u4Yk7ukvaZfGS70ppmiijB2MrSOF3kJKuidBnJgg6vnr84jPkkGQIMya2gr2gz9FpdvwiYYm7rsBx6CrJ52vqc6k%2BJp7WwyvTxoDzEEwcdWnMi%2FD%2FIbWZN%2BXk8SXPognk1710qlyV3By3Qa8PUxJcSUmaR3asoTH25nd2fzvOjo%2B4QWHbQZBm4PXqdf9G%2BucjrKj219oUT3fb0eQr%2Bjqr3Hb09sjIiLQRhSl%2BRg%2BAvFjjYmiQc%2FHPKmWMRLyJ%2FchkCLejNuwnCTYChFvuNs9AficwbiVLT92%2BmDFdUjKZQZnpZdWD2lydQQ3U9wOF%2FAMGTBmHYgPVtTHw%2B0vXAelzjyN0YoerHu%2BeW6CA3ZGK2%2BaynBZWssIVxxw%2BdfrBREjFFGillDyoSWZ0oinSBjYPwmD70%2Ff0KPZTUFrv8k7uNL9UfeBZ1rB0BfED%2FmVTilh%2BqXxASFA4TLeeukae%2BYoFdxCufvNWqhBKURg9YVe7VV9DETQR3Puo7PUPDUfdQ9AgkAUVx0aQhbJCcfOsbZxCzSEuczJMMTM89EGOqUBlwfXAleeXP0rKHEWMGkF4ydYoSlYXkm%2FoG4ANE08bRmO%2Bk9JDYKak4%2FnnDQqHU%2B%2B1sM39Jtp24JotcUhPzH%2F1N9ec1%2ByR%2Fu8SN44W2eCvCpfCSgPvcGPkQMAYrjNxHjoRNWLLJ5KPPlojYpIwpmfvvsXCrGInfDEExeQjHT5OIMnFykEr2kSSI%2B4BTsuVtUsyKSUmC2iL0aoZjNrN7xTdi%2FyqQkP&X-Amz-Signature=187dafae37b3b1b6a91d76f60995ee5bf99b1d7dcd6bfaa05fb7d2b4b901052f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SGNSQBSG%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T084551Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFg8m8BmwdoC%2BELOuqDf2UOn11jY6jhPEJZ15z9545rSAiEAqHQpJwm1cLBY93YUo%2BbHVleXy1e8vhMXqI44YD9yF%2Foq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDKk6UZlG2yrC5iJBoCrcA0r4WThSES%2B6lSrEmfFbWyqylu4p7HT6Iy0tX2rhQC%2Bv%2FD7U%2BcdUdAUOWZhOlBhv0X2zzPxvk68nFZyOhZzKVU2MjNt94qN9u4Yk7ukvaZfGS70ppmiijB2MrSOF3kJKuidBnJgg6vnr84jPkkGQIMya2gr2gz9FpdvwiYYm7rsBx6CrJ52vqc6k%2BJp7WwyvTxoDzEEwcdWnMi%2FD%2FIbWZN%2BXk8SXPognk1710qlyV3By3Qa8PUxJcSUmaR3asoTH25nd2fzvOjo%2B4QWHbQZBm4PXqdf9G%2BucjrKj219oUT3fb0eQr%2Bjqr3Hb09sjIiLQRhSl%2BRg%2BAvFjjYmiQc%2FHPKmWMRLyJ%2FchkCLejNuwnCTYChFvuNs9AficwbiVLT92%2BmDFdUjKZQZnpZdWD2lydQQ3U9wOF%2FAMGTBmHYgPVtTHw%2B0vXAelzjyN0YoerHu%2BeW6CA3ZGK2%2BaynBZWssIVxxw%2BdfrBREjFFGillDyoSWZ0oinSBjYPwmD70%2Ff0KPZTUFrv8k7uNL9UfeBZ1rB0BfED%2FmVTilh%2BqXxASFA4TLeeukae%2BYoFdxCufvNWqhBKURg9YVe7VV9DETQR3Puo7PUPDUfdQ9AgkAUVx0aQhbJCcfOsbZxCzSEuczJMMTM89EGOqUBlwfXAleeXP0rKHEWMGkF4ydYoSlYXkm%2FoG4ANE08bRmO%2Bk9JDYKak4%2FnnDQqHU%2B%2B1sM39Jtp24JotcUhPzH%2F1N9ec1%2ByR%2Fu8SN44W2eCvCpfCSgPvcGPkQMAYrjNxHjoRNWLLJ5KPPlojYpIwpmfvvsXCrGInfDEExeQjHT5OIMnFykEr2kSSI%2B4BTsuVtUsyKSUmC2iL0aoZjNrN7xTdi%2FyqQkP&X-Amz-Signature=c930d8f0d505f1e30d2461fc5886a3482b7c7e9d404f97377a3c13f59fdf5732&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
