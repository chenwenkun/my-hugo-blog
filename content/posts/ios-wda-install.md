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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUAV57IY%2F20260709%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260709T091922Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn%2ByWdM8U7OdOW1s%2BZ9V6ui7jO9t88Uv3QpeORn2ZkSQIhAKUGctg0mMJ5zS5ardpLYAZUJ6FH4scwls7C05jegtTpKogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyHlbuJaSBCTxudLLUq3APf7XeHn0aqwQcg%2B%2BoyqJblI7Uz73O%2FfgDVGp2JgJoLfxeXaPZ4s65RXDVSPQGxtzt4rxGm%2Bois1jU8pOg6Ov39vafL71CTX54lMreHzlit308FzmhsakqpDoWHJNb1Zl%2FPjSe9ihNlLCAXZ9TnGpn1J7SGLOpE8Wi3qErld2voWPu2t7I50aT4YkYH%2BVFOuKcRl9epH%2FziDeLYKZ4R1Gu9DWbxmaqRX6hD5Dra34yiJFn%2FRcMdapiL45%2Fd04%2FOk5zqCq7XtoPe5XXO5jIOP6o2QDwnrDT6hs0JBfmI5ayg6cL10W5lpd34MFvQxvKMoyhXQLn%2ByJu5JG4pgqbnv7mDCkxHerZq6Zt6zJgOdwA%2FfBCihlTlvDSJRze%2FXjJI5RDEG9Lrkr9C2crnnmQZ5cUEC0i425WE4UuThh0y%2FzEuFrHfxPVdO%2FQP9YwJ8Np%2Fv9PNrTvkNzmP8XKR2G02PVmTM63OVN6Xt31Yjw9U3aGSvvmqe%2FFivpaiyNsAD2Y7bMr2ayIv0MfGppEiiCgCPajRk2X583rQGH5BEsP0SeBFBCpwt%2Bjvz9aV%2FBRtAXTzpDLdUpabNkgbQfF4p2S5tOkCX2ueDLhVcv3ZkBLsxi9ZVNF5lFhMSeoKsbNWzTDwoL3SBjqkAeDpu6Cbf9IUspRvL%2BryJ60utyVRX8STV6CQ%2Fz7UwVu1%2B%2FZqzGd06pEbXK9tx8Rr3NASoJx0VpG2SI53w8F7mmNXOUHFZHZWO2VuzA2l6MwJzMa0aIHcikyQE4KS%2B3v85N5q4R485Rzm%2Fg%2FMfmWbj%2Fc%2BHkOsl2Iwj0rV7xdszjfyLr8XYliLnnj0nEPJ0f1WhdMFiJj8APJXd2SnvN8368rS4ueg&X-Amz-Signature=4f48233c764b2293a79702a236c60fadf9b7d56e3f081e01f7e85afc95982fe1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUAV57IY%2F20260709%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260709T091922Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn%2ByWdM8U7OdOW1s%2BZ9V6ui7jO9t88Uv3QpeORn2ZkSQIhAKUGctg0mMJ5zS5ardpLYAZUJ6FH4scwls7C05jegtTpKogECJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyHlbuJaSBCTxudLLUq3APf7XeHn0aqwQcg%2B%2BoyqJblI7Uz73O%2FfgDVGp2JgJoLfxeXaPZ4s65RXDVSPQGxtzt4rxGm%2Bois1jU8pOg6Ov39vafL71CTX54lMreHzlit308FzmhsakqpDoWHJNb1Zl%2FPjSe9ihNlLCAXZ9TnGpn1J7SGLOpE8Wi3qErld2voWPu2t7I50aT4YkYH%2BVFOuKcRl9epH%2FziDeLYKZ4R1Gu9DWbxmaqRX6hD5Dra34yiJFn%2FRcMdapiL45%2Fd04%2FOk5zqCq7XtoPe5XXO5jIOP6o2QDwnrDT6hs0JBfmI5ayg6cL10W5lpd34MFvQxvKMoyhXQLn%2ByJu5JG4pgqbnv7mDCkxHerZq6Zt6zJgOdwA%2FfBCihlTlvDSJRze%2FXjJI5RDEG9Lrkr9C2crnnmQZ5cUEC0i425WE4UuThh0y%2FzEuFrHfxPVdO%2FQP9YwJ8Np%2Fv9PNrTvkNzmP8XKR2G02PVmTM63OVN6Xt31Yjw9U3aGSvvmqe%2FFivpaiyNsAD2Y7bMr2ayIv0MfGppEiiCgCPajRk2X583rQGH5BEsP0SeBFBCpwt%2Bjvz9aV%2FBRtAXTzpDLdUpabNkgbQfF4p2S5tOkCX2ueDLhVcv3ZkBLsxi9ZVNF5lFhMSeoKsbNWzTDwoL3SBjqkAeDpu6Cbf9IUspRvL%2BryJ60utyVRX8STV6CQ%2Fz7UwVu1%2B%2FZqzGd06pEbXK9tx8Rr3NASoJx0VpG2SI53w8F7mmNXOUHFZHZWO2VuzA2l6MwJzMa0aIHcikyQE4KS%2B3v85N5q4R485Rzm%2Fg%2FMfmWbj%2Fc%2BHkOsl2Iwj0rV7xdszjfyLr8XYliLnnj0nEPJ0f1WhdMFiJj8APJXd2SnvN8368rS4ueg&X-Amz-Signature=0ea42afb7f7b820a004d4bd30cc79ada77043d21215e50fd397dff6ee43cd5c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
