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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VKNTEOVD%2F20260518%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260518T192309Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDq3AfN%2B4MJVnEWHsi%2BAIKv%2FG4HgRQx8I%2B3Ldo%2BJaUpOgIgM0oWTU69dSJEU5XLypdWOLJO2DZozEqB1X5iWJ1LoRAqiAQIxP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDCgP%2BlzsLc6zBo0gircA7OoN2Jy6wzKE3vFzPHVXg67TCXAho2kzEi9yB%2FzXI4tzwWPq8dNbNtRtIbTyoGRKuqU6%2Bs9qtnMTT51c%2FZae53hSVJ%2BQ39zvqDCUzZd9B6mJsdgIDURMUFa1t4p0IephtWR%2F7Izt%2FkBpXZMYDIz8U3BbbNr1hgtXms7olCAGGkFvQPTkcP3SUtcvWWHQNfKBNZe%2BlE6gZYZMxI5TIBcDhLnQpu6T463V%2FjWABzRO%2BGvQ9gUAONgrwjLwDZ5KNii6gF1%2B8HAM6s3Tejy3NG8gV0I4HgHUJ%2BjfhfBUKn%2B5EEPuEPV6hswVj6NoIQl3amvBPge7RzlnFf64Mhe9npMkknnZPvtlVdzDiT1Ghrq5lCBNmxXErW76so8SdJ0uH0t5RKk23%2F%2FHPdmK9ONv3Y82pfqvWxjZURLSg1B%2FrVqqyAelhoCHuvBTF6KaHORhc8v%2FzL7qKkNyy4p%2BTUr0%2Bvgj5aJa2BzF8uypQNDETJVFdC%2B7PjYwJO2N%2BUMm4psoSFSMcpYUMuXVZ4VIkX6roR7rjW98hcl6JoDFdbKEyXfsODNsZINAOyyFeq98y9Aydzl6pCLiLyIAP%2Ffi9GOO6%2BPPmJRnkKMccs3gEDiv93xEshMOjrsuiJ6IAQF%2BdKQMLa%2FrdAGOqUBlY3yA0cuctypf3mNHDW9QEP9LoOR3iRj6BKC2smJo1GanPs%2B7ob1jFjYoXxNGdK3yXfKG5pNdwjIUVq4Xcs%2BrYYJtdDZMFUnVc3wpP2zCdkkF2ya9gLskifr%2BTi75vdzndtJm9qfsbEybpQD8FRZvwnL6iTJyL4izjCG3GhTBkZYpuAmPG%2FaxiBaAckO6AiqK9dr10NSwo4inbhBbTBWYAPZMpWb&X-Amz-Signature=d5d676765dd3ab4176783c5edd7dc6d2a7ceaabda2b79e8a3dc47399b3b05afa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VKNTEOVD%2F20260518%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260518T192309Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDq3AfN%2B4MJVnEWHsi%2BAIKv%2FG4HgRQx8I%2B3Ldo%2BJaUpOgIgM0oWTU69dSJEU5XLypdWOLJO2DZozEqB1X5iWJ1LoRAqiAQIxP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDCgP%2BlzsLc6zBo0gircA7OoN2Jy6wzKE3vFzPHVXg67TCXAho2kzEi9yB%2FzXI4tzwWPq8dNbNtRtIbTyoGRKuqU6%2Bs9qtnMTT51c%2FZae53hSVJ%2BQ39zvqDCUzZd9B6mJsdgIDURMUFa1t4p0IephtWR%2F7Izt%2FkBpXZMYDIz8U3BbbNr1hgtXms7olCAGGkFvQPTkcP3SUtcvWWHQNfKBNZe%2BlE6gZYZMxI5TIBcDhLnQpu6T463V%2FjWABzRO%2BGvQ9gUAONgrwjLwDZ5KNii6gF1%2B8HAM6s3Tejy3NG8gV0I4HgHUJ%2BjfhfBUKn%2B5EEPuEPV6hswVj6NoIQl3amvBPge7RzlnFf64Mhe9npMkknnZPvtlVdzDiT1Ghrq5lCBNmxXErW76so8SdJ0uH0t5RKk23%2F%2FHPdmK9ONv3Y82pfqvWxjZURLSg1B%2FrVqqyAelhoCHuvBTF6KaHORhc8v%2FzL7qKkNyy4p%2BTUr0%2Bvgj5aJa2BzF8uypQNDETJVFdC%2B7PjYwJO2N%2BUMm4psoSFSMcpYUMuXVZ4VIkX6roR7rjW98hcl6JoDFdbKEyXfsODNsZINAOyyFeq98y9Aydzl6pCLiLyIAP%2Ffi9GOO6%2BPPmJRnkKMccs3gEDiv93xEshMOjrsuiJ6IAQF%2BdKQMLa%2FrdAGOqUBlY3yA0cuctypf3mNHDW9QEP9LoOR3iRj6BKC2smJo1GanPs%2B7ob1jFjYoXxNGdK3yXfKG5pNdwjIUVq4Xcs%2BrYYJtdDZMFUnVc3wpP2zCdkkF2ya9gLskifr%2BTi75vdzndtJm9qfsbEybpQD8FRZvwnL6iTJyL4izjCG3GhTBkZYpuAmPG%2FaxiBaAckO6AiqK9dr10NSwo4inbhBbTBWYAPZMpWb&X-Amz-Signature=27ef8872be1b160c66332d3943cda9027bc92d084aca7ac607f61e09b48d3100&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
