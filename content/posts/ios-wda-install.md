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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZU4CNOBB%2F20251012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251012T121836Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCID6tNYZTdYJnlmOwWYqRgFhmE9iNAH0bSN9EWgFtSabMAiEAnrYdRXDJjt9dKSa6MEVGdmpcHl9Jziwup15oGIYDR%2Bkq%2FwMILBAAGgw2Mzc0MjMxODM4MDUiDLlJONXzpGST5g6EISrcA2fk063o%2FTdYST4e7tky8VvIfJ0nLwaKS0ddRIDVtS2f8puexm35O17CvkyaW0MOdMdbonpoc7GsMFhbhYMCzffABg7pVcTl8gi5kSbnYhSZjxdZwnJR5XZP5uMPFGrSqjKR24zf10E%2B%2FzEesnkMREeHRFSDmf8Xa8NGYQKuLWFbmOT0t8pCLH3DBLppOgOhlXkFcgelbPVUF8FXNa9u8FyO3dAFJbwz%2FChPcpfwisRUGvkmkxXnPcSz5dOCQrs505USh6JyPvr6Kllymi0SP6Gv9YJbBfN7dAmjTT6P%2F%2FZSY5Vwm7%2FkWdJ2RvKgBr4zqaUgzJ9fbWtp5zGtaq3TJEUS0ZoziuVKCd0EsQc2SbWyA7L5zRZN3tHk9ebKIOFvwkpHCbxoUhGF%2BXJiheoCLiI8eG4UDgjaH761SNRTPEjNxKO5nyZhH9iKq9%2FSyUSbyf4b1MdgInMMCppJFoWFaNIbcf6NBS%2Bgosbft5cJjRMXF8XC1ROekMzxnNBtXWfaP2KGgsHKyW3yBcx6MgwGN6pmKvemAeT9ts9cLxUtcBPa2wzeAUmbjKkY36M3tZN9sThbOlSvlarL3bf3HXqoz7oczKoNKKBUcmLYjeVWUfClkw4vH%2FaeyDv7seBjMMqDrscGOqUBzfhWoDnLd1ptA1t3beMsu5HWxSoA7FZNThtFdpzPeAAH1jOEIAvv%2BfMrs6H%2F78DYxHBd3DBocdEwy3NYXo1Ite5GuqxxU4gkPyeHZ3q0zecqdKgFnyotPvWEwXe10gSjlIj6fDE6c0tClvjLNJ%2Bjp2h33%2B7cnyE160Y2G%2FqfvgAxuzVYTHLU1KIotG8I41u%2F9jarOzJrMV0kr84Vf5wXkO448wge&X-Amz-Signature=e73763c49394f91f3dddc223e2a75cdd3624af1435ff90af9678105f4492ad0e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZU4CNOBB%2F20251012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251012T121836Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCID6tNYZTdYJnlmOwWYqRgFhmE9iNAH0bSN9EWgFtSabMAiEAnrYdRXDJjt9dKSa6MEVGdmpcHl9Jziwup15oGIYDR%2Bkq%2FwMILBAAGgw2Mzc0MjMxODM4MDUiDLlJONXzpGST5g6EISrcA2fk063o%2FTdYST4e7tky8VvIfJ0nLwaKS0ddRIDVtS2f8puexm35O17CvkyaW0MOdMdbonpoc7GsMFhbhYMCzffABg7pVcTl8gi5kSbnYhSZjxdZwnJR5XZP5uMPFGrSqjKR24zf10E%2B%2FzEesnkMREeHRFSDmf8Xa8NGYQKuLWFbmOT0t8pCLH3DBLppOgOhlXkFcgelbPVUF8FXNa9u8FyO3dAFJbwz%2FChPcpfwisRUGvkmkxXnPcSz5dOCQrs505USh6JyPvr6Kllymi0SP6Gv9YJbBfN7dAmjTT6P%2F%2FZSY5Vwm7%2FkWdJ2RvKgBr4zqaUgzJ9fbWtp5zGtaq3TJEUS0ZoziuVKCd0EsQc2SbWyA7L5zRZN3tHk9ebKIOFvwkpHCbxoUhGF%2BXJiheoCLiI8eG4UDgjaH761SNRTPEjNxKO5nyZhH9iKq9%2FSyUSbyf4b1MdgInMMCppJFoWFaNIbcf6NBS%2Bgosbft5cJjRMXF8XC1ROekMzxnNBtXWfaP2KGgsHKyW3yBcx6MgwGN6pmKvemAeT9ts9cLxUtcBPa2wzeAUmbjKkY36M3tZN9sThbOlSvlarL3bf3HXqoz7oczKoNKKBUcmLYjeVWUfClkw4vH%2FaeyDv7seBjMMqDrscGOqUBzfhWoDnLd1ptA1t3beMsu5HWxSoA7FZNThtFdpzPeAAH1jOEIAvv%2BfMrs6H%2F78DYxHBd3DBocdEwy3NYXo1Ite5GuqxxU4gkPyeHZ3q0zecqdKgFnyotPvWEwXe10gSjlIj6fDE6c0tClvjLNJ%2Bjp2h33%2B7cnyE160Y2G%2FqfvgAxuzVYTHLU1KIotG8I41u%2F9jarOzJrMV0kr84Vf5wXkO448wge&X-Amz-Signature=4008ade503f1110e94bd570ff09416cfa86d92c0cd10b075c7c0223d62de0872&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
