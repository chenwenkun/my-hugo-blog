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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QN3P5B6T%2F20251205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251205T061854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDl46jrPAgCpZ6dXi2F%2BDSHtO5YYGUu7zFuhE%2FjwBvzHAIgIz5V543Gj7WIg3jv4PknQ1zb8ldLb%2Bri%2FA9BJ8l7A%2FIq%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDE8Qi9qLe7N2WKy4MSrcA%2FjuL2w7lQrlYMCTPKpzqSGLQrcSsLIy%2B7mwA9ip3YjN2XDlmTs6peY05Wb4PgyXzvOgDMiJB9SAUz5lz7%2FWWrd7IsTub99oXwGd%2B%2BwHxT9onrrlK6G1tOZjZ7%2BsJ6X2HdxTry9XfM4s2PpK8s%2BUoi33DT8wn6iYmdofbAdX9AEg1M%2F%2FNhaEcD50TZm1bsu%2BY56d81MMJ%2F2sJZnZ0EDvq%2FV6icJOMPZzpVOy9i358leiasL9dVs7z9BpiMmc26ehgVjooTkWTqkID35ZW90c8u7I0js2FCXJtPHMbGefflBjM%2B97SY9wlzAPzYqrRbQ8igKslVTBwDQdJ%2FfuHRUyYcQvMBoMEkO%2BufqZbQNKcZStpFh7gbmwVbkiGPBWG0FEG6BUNTWutoUwbTLImP6utY3HvYwH6q3HbH74Tzerv2HDWaofXCyTQRBVFO4okuJm2tcCdMP92ve5nM3%2F2SGtezwz546Wd2Dki0DG%2BBWszMYdpupF40H4q3pLn8bVQk7Oq97B2bwTyUqAJ%2BVXm%2B3aL8KGdjLOD9lCoFTRRdRhIXWRFrFOEGuWtnUsbPPRHWGdHszMEJmr8zwGaxsJQULOkCrfXlM2Mxx9D6RDHKCPmbgxOfNn%2FNPAUUC%2Fp4DcMNOwyckGOqUBr4GKnl%2FxGXkCbV0KXfphQS5MX0vRPmXbKGA13wIO3TYJmLnmsH%2FXshOZ4oS2bgZPEgcUmShQOOjNlRkV1kwzGiHPd1Xi2zyBcFMBTN08opR2fToFWJgx276Vm1XIDm%2BYB7o3bpKtkV%2Bn8NAWFd%2FXo9bWIjARQDLh0l8VnOUT%2F1l4CFBo1GigCiz%2BR7WpYFcJPfQwRQf6K9WQrXi7mQDLBwC2sElK&X-Amz-Signature=3d2d1bc43567bb4efb8d54f8b49fe7b79383299e29f938edbd0b8344f408897c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QN3P5B6T%2F20251205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251205T061854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDl46jrPAgCpZ6dXi2F%2BDSHtO5YYGUu7zFuhE%2FjwBvzHAIgIz5V543Gj7WIg3jv4PknQ1zb8ldLb%2Bri%2FA9BJ8l7A%2FIq%2FwMIVRAAGgw2Mzc0MjMxODM4MDUiDE8Qi9qLe7N2WKy4MSrcA%2FjuL2w7lQrlYMCTPKpzqSGLQrcSsLIy%2B7mwA9ip3YjN2XDlmTs6peY05Wb4PgyXzvOgDMiJB9SAUz5lz7%2FWWrd7IsTub99oXwGd%2B%2BwHxT9onrrlK6G1tOZjZ7%2BsJ6X2HdxTry9XfM4s2PpK8s%2BUoi33DT8wn6iYmdofbAdX9AEg1M%2F%2FNhaEcD50TZm1bsu%2BY56d81MMJ%2F2sJZnZ0EDvq%2FV6icJOMPZzpVOy9i358leiasL9dVs7z9BpiMmc26ehgVjooTkWTqkID35ZW90c8u7I0js2FCXJtPHMbGefflBjM%2B97SY9wlzAPzYqrRbQ8igKslVTBwDQdJ%2FfuHRUyYcQvMBoMEkO%2BufqZbQNKcZStpFh7gbmwVbkiGPBWG0FEG6BUNTWutoUwbTLImP6utY3HvYwH6q3HbH74Tzerv2HDWaofXCyTQRBVFO4okuJm2tcCdMP92ve5nM3%2F2SGtezwz546Wd2Dki0DG%2BBWszMYdpupF40H4q3pLn8bVQk7Oq97B2bwTyUqAJ%2BVXm%2B3aL8KGdjLOD9lCoFTRRdRhIXWRFrFOEGuWtnUsbPPRHWGdHszMEJmr8zwGaxsJQULOkCrfXlM2Mxx9D6RDHKCPmbgxOfNn%2FNPAUUC%2Fp4DcMNOwyckGOqUBr4GKnl%2FxGXkCbV0KXfphQS5MX0vRPmXbKGA13wIO3TYJmLnmsH%2FXshOZ4oS2bgZPEgcUmShQOOjNlRkV1kwzGiHPd1Xi2zyBcFMBTN08opR2fToFWJgx276Vm1XIDm%2BYB7o3bpKtkV%2Bn8NAWFd%2FXo9bWIjARQDLh0l8VnOUT%2F1l4CFBo1GigCiz%2BR7WpYFcJPfQwRQf6K9WQrXi7mQDLBwC2sElK&X-Amz-Signature=517247d93ebd13265ea4185b1d88f1d7f8d083591781a38f462227c5cc3acd50&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
