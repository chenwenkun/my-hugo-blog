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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667EFHS53K%2F20251120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251120T061705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJGMEQCIBdLDaq9ehMuKNmGMIGkopb%2FtDcZ3pKqroB1thc1dbryAiB3DDezlLBVDZtfN3mX32ItNLpUwhEXYDTUVqklmKNF9SqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMecpHhT4d%2B8UEpLcMKtwD%2BhqxfoiGKlDSRleZtO%2FfiLihzNWXtdjHE1%2BJ82Fp1nxkZtSW2fmEz0VZmgS1N45qeLZNP5EGwQMw81nwEfA3u6Etfps7jp6d1rmN2xFHwJtE9w1rFOdi3Cq3OYEMFH0uOTX34xu8c2NabXV3rteaUxGIkImf3FaY9WPnqK5C%2FTtgk4yvs8rCIVScFBz0RkNq68RR6rf%2Ft6m5gAxmyX7lX032ftu7ijG%2FOirHYe87F1%2BA9Glk7fvnMpW30YqOoGbpBsltQbuyP4IUHi%2FTgyb1ItgeoVKUW%2BboOmMCkIetzU6kpo93hh6L%2BzqxTMGHGntnKes6pFnDfh%2F8DnZmY3VPzwZQ1S9lRfsYN2xcThaRYeTTRPKmEMf6g32smctAKmezEe8SL81L%2BWFAcZiF1WeQacDoIWMD%2FUlKf8z302R8jeTp%2FouwlCj4Fv5j3HGU6R1QSeDHZCqfOEdW%2Fsl%2BfRFrVP6ENTPtzs8p7G0s07BPN0X5G2Xhua3HL4%2B2UW6PIf9qeAJ6pegn%2BYreT%2F8fTu3DMWyS0%2BAKdLL8PN0rt1oGbFTCYuEfYjEw4DZx%2FE18r4XULoESMUiLHY3%2BJQcqxZ3zO4Xd2YflX1Zp6SZzZx9bzmrYmvI7ognqqX4HeVww5s%2F6yAY6pgGkSCcMYVuWWSEPQ0rjST0AbeQGU1lXjvUUcxxFT5cjC%2Fh%2BtUZ8wtx%2FZuEsvLRkFuu%2FPSvJ4QR7iJL3rtAuUi3jVs6pav9kuZ3xU9KiMMTusJ0BTkAvH2nEle%2FVV8wPNerIC7BcSkIYKzw9QDx9grnpjrvtowGQsoMYfcaS7zpIjbRSJizXIyT8RrNIkUabkQN3yhKWjQRReyFINCZUCuddLFbd06dE&X-Amz-Signature=b9198b8a817670ecc75520c95c295c5b8a61fa797474c8821e274447e95bfc64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667EFHS53K%2F20251120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251120T061705Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJGMEQCIBdLDaq9ehMuKNmGMIGkopb%2FtDcZ3pKqroB1thc1dbryAiB3DDezlLBVDZtfN3mX32ItNLpUwhEXYDTUVqklmKNF9SqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMecpHhT4d%2B8UEpLcMKtwD%2BhqxfoiGKlDSRleZtO%2FfiLihzNWXtdjHE1%2BJ82Fp1nxkZtSW2fmEz0VZmgS1N45qeLZNP5EGwQMw81nwEfA3u6Etfps7jp6d1rmN2xFHwJtE9w1rFOdi3Cq3OYEMFH0uOTX34xu8c2NabXV3rteaUxGIkImf3FaY9WPnqK5C%2FTtgk4yvs8rCIVScFBz0RkNq68RR6rf%2Ft6m5gAxmyX7lX032ftu7ijG%2FOirHYe87F1%2BA9Glk7fvnMpW30YqOoGbpBsltQbuyP4IUHi%2FTgyb1ItgeoVKUW%2BboOmMCkIetzU6kpo93hh6L%2BzqxTMGHGntnKes6pFnDfh%2F8DnZmY3VPzwZQ1S9lRfsYN2xcThaRYeTTRPKmEMf6g32smctAKmezEe8SL81L%2BWFAcZiF1WeQacDoIWMD%2FUlKf8z302R8jeTp%2FouwlCj4Fv5j3HGU6R1QSeDHZCqfOEdW%2Fsl%2BfRFrVP6ENTPtzs8p7G0s07BPN0X5G2Xhua3HL4%2B2UW6PIf9qeAJ6pegn%2BYreT%2F8fTu3DMWyS0%2BAKdLL8PN0rt1oGbFTCYuEfYjEw4DZx%2FE18r4XULoESMUiLHY3%2BJQcqxZ3zO4Xd2YflX1Zp6SZzZx9bzmrYmvI7ognqqX4HeVww5s%2F6yAY6pgGkSCcMYVuWWSEPQ0rjST0AbeQGU1lXjvUUcxxFT5cjC%2Fh%2BtUZ8wtx%2FZuEsvLRkFuu%2FPSvJ4QR7iJL3rtAuUi3jVs6pav9kuZ3xU9KiMMTusJ0BTkAvH2nEle%2FVV8wPNerIC7BcSkIYKzw9QDx9grnpjrvtowGQsoMYfcaS7zpIjbRSJizXIyT8RrNIkUabkQN3yhKWjQRReyFINCZUCuddLFbd06dE&X-Amz-Signature=df64d82da309a944f677c238dec53bf1ea423af5d09173b36f2184419d1aa7b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
