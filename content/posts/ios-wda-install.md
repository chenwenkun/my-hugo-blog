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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662LLCLBXB%2F20260728%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260728T190517Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFm49up%2Bw6TfW1sCi8LDPrUG0y59YAWMISx9cN9eQ7wtAiEAyCppAlKnsq1UXGVpX673Fo39pIBZgGRmCh0n3xVQ1cIq%2FwMIbBAAGgw2Mzc0MjMxODM4MDUiDON0%2BTbZ36HUFAYd%2BircAxCXfZV3Z1njCIf2jNPdyxbdt6TVXyKO%2FlcLwRoAbHuWiQidQGb6DJLLAQoqTFUgeMmGO2VRqruJRhArcNv%2BTu1s4u24M3QO0eKI%2BCgcu9%2FvmrfjlNF3KiesIp4uT1%2BjOf64I0ID%2FjoAFmkAUsazP7rwGxMjj%2Bgq8zIbQSN2VOBVG1VAQjELP330mNPRiE%2BPA8IeNRIjJYeh8xLCTrQ2GnUS7FULoaRvv6hZKabCm4Z%2BV8DCfCSZ1CkO4EQCg8mPmMQRYe%2Fd2%2Fa%2BzKglC0c2loR%2BjQoXX3QikEks2Fh2Lhuo%2FC%2FE6BG0lmoS2jEznQB81HOt0Jt9coSFGWrNCsK2vzJ%2BRvqCTInVR4726VKXf8o0lQxJx1ywKi2L6LWUhu1PlwBPj8OFwI38E%2FX%2FRGNF4PI6R53Qj2ArCAbd02n3QpsxYJ2r781n%2B3I%2FqFgk%2Fny790A5BzLijmhGBc1PqzMAY7vM%2FNV5CbfpiF017mvyJr2FY53u8Hl5nGMF5BPHMz5dPlDKH6NWmKEaUpw6Hv1Y6UnJhPAgpxHV6C%2B%2BssU0kNmFMic6jMNo2qLAcq65ITAEGYp6C9tuyBR0Wg2Wx%2FvNRsIEx6llts5ivVvzerCJNkL5a7rN5HZeeQABMj7bMMj2o9MGOqUBywp8sf5rNfNUq6rBf79oh4lZDrMA1ynBGngc6FoYSPQI3bMG8PyoXz4q4AKqy7vNulacnX1T4mWCOLlVUnVedPflMCrhfK1cqKZin1ZD3HpLljvBGXbFu4nzzILHSufTIR4eC7kAZIsWIyuUnxFglJFSCwz7mNvyAIehNoij4GLoDJv4qbKhCxpGxsy9nHDhHgZfJyw%2FynUpCuirZ7GS6bfKqHsY&X-Amz-Signature=7991d77d17722fa46c44aa7369eeab3f448bb49d3792c1953c99fca2929f1c9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662LLCLBXB%2F20260728%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260728T190517Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFm49up%2Bw6TfW1sCi8LDPrUG0y59YAWMISx9cN9eQ7wtAiEAyCppAlKnsq1UXGVpX673Fo39pIBZgGRmCh0n3xVQ1cIq%2FwMIbBAAGgw2Mzc0MjMxODM4MDUiDON0%2BTbZ36HUFAYd%2BircAxCXfZV3Z1njCIf2jNPdyxbdt6TVXyKO%2FlcLwRoAbHuWiQidQGb6DJLLAQoqTFUgeMmGO2VRqruJRhArcNv%2BTu1s4u24M3QO0eKI%2BCgcu9%2FvmrfjlNF3KiesIp4uT1%2BjOf64I0ID%2FjoAFmkAUsazP7rwGxMjj%2Bgq8zIbQSN2VOBVG1VAQjELP330mNPRiE%2BPA8IeNRIjJYeh8xLCTrQ2GnUS7FULoaRvv6hZKabCm4Z%2BV8DCfCSZ1CkO4EQCg8mPmMQRYe%2Fd2%2Fa%2BzKglC0c2loR%2BjQoXX3QikEks2Fh2Lhuo%2FC%2FE6BG0lmoS2jEznQB81HOt0Jt9coSFGWrNCsK2vzJ%2BRvqCTInVR4726VKXf8o0lQxJx1ywKi2L6LWUhu1PlwBPj8OFwI38E%2FX%2FRGNF4PI6R53Qj2ArCAbd02n3QpsxYJ2r781n%2B3I%2FqFgk%2Fny790A5BzLijmhGBc1PqzMAY7vM%2FNV5CbfpiF017mvyJr2FY53u8Hl5nGMF5BPHMz5dPlDKH6NWmKEaUpw6Hv1Y6UnJhPAgpxHV6C%2B%2BssU0kNmFMic6jMNo2qLAcq65ITAEGYp6C9tuyBR0Wg2Wx%2FvNRsIEx6llts5ivVvzerCJNkL5a7rN5HZeeQABMj7bMMj2o9MGOqUBywp8sf5rNfNUq6rBf79oh4lZDrMA1ynBGngc6FoYSPQI3bMG8PyoXz4q4AKqy7vNulacnX1T4mWCOLlVUnVedPflMCrhfK1cqKZin1ZD3HpLljvBGXbFu4nzzILHSufTIR4eC7kAZIsWIyuUnxFglJFSCwz7mNvyAIehNoij4GLoDJv4qbKhCxpGxsy9nHDhHgZfJyw%2FynUpCuirZ7GS6bfKqHsY&X-Amz-Signature=3ea3a3a1cabb10b56c6ca53f493012c707478167fee44d9da63de93a3d529fbb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
