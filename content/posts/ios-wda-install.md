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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YR6QXDJZ%2F20260202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260202T065139Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIQCoSC0bOJriJTsBxRRNVCA%2BKvvRLYorp5uo1Oln6WqGAQIgVfjKUQqTE1Gznb47PecNwLOslgGY8yeFTg4ApAJ%2BheQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI1rD9ALM7DSYD4RzCrcA%2FpI54BNg2J%2B1rS4UdPtuThbjWrt9Si8MXcKMiJ1v3iVjrN1PBBgzOhcu%2FICLhAKeViLUQDKft0ztztFh1eKrCLpbjQjXzKO7%2FK%2BATEMDdQnDC2BiZqgQ3SCMz2zYcf%2F%2F2CFgOhd%2B2tKUUmY8gXOH2isRwVcPSmY31Etf3DqDst0vCYIoyHa8xN9bV5p3eQSw90uPODIBxZrVxUfzw3MjmYN4CMdBsARNuABHWr1m%2FjHwqBCTmDNW%2F%2BEN4Pp8IFeJQ%2FRTs1aJI3OrRd9LzNelnR9d5rMcasXQ0ADGpYQO8%2FstA%2FRYp%2F7w19%2Bp8R622fqFyWsru1tq9I2vqUri4TOcIU21Uf2v7xkfqKk7RpcIOJUZ4FRg%2FFmsPqi0PiqTGOcejLzMtY2rPZrqhdaxGiwmi2ve5%2FgtB%2FEZ3VrPLchtCy94OtjQBOYcItk2YDOYTh7zqIo1d%2BmOBXamsAgH4vRPVOR5WyuHxoTUcQ8rWRZ7R8InrL2DGVyZHU4AWeBX8r2j7ClGqscwnVCVbnIRSnLD7o481FcP8cO%2B6P%2BTbwU3xXGt3%2BhCXomAKEef2%2B%2FathXQ5pPDxAZu7RZnPrOtzSv9OptbBSK0LKSGKzV0YW0Z1%2FeqrVd54Q01m4lLz%2BJMJP8gMwGOqUBt%2BhY8mrsS8sJgolWcKbXqbA%2BnPNuZDbwjNvGmzBza94iO8sbbBKXCcjDSZ9yR29lwLsMB9s1weOv63vJRFTkkDRXC8xgBjoarTQLw9CgO%2Fh612Cp2BDctbnKnHEarvlbtjBgRfrxN6Pt%2FNnFT1%2BPncQEu4OY2lGsGS31%2BxQiWDEJjoDpMzKt8XZzUj1UW0RCr9hg1NmXCd7%2BpbedwbsmiK1HecAK&X-Amz-Signature=7b9f6cc95e925649ad2aa55c3702d65b869045d3704f5d8bf8b480ff6fd5668c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YR6QXDJZ%2F20260202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260202T065139Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJHMEUCIQCoSC0bOJriJTsBxRRNVCA%2BKvvRLYorp5uo1Oln6WqGAQIgVfjKUQqTE1Gznb47PecNwLOslgGY8yeFTg4ApAJ%2BheQqiAQI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI1rD9ALM7DSYD4RzCrcA%2FpI54BNg2J%2B1rS4UdPtuThbjWrt9Si8MXcKMiJ1v3iVjrN1PBBgzOhcu%2FICLhAKeViLUQDKft0ztztFh1eKrCLpbjQjXzKO7%2FK%2BATEMDdQnDC2BiZqgQ3SCMz2zYcf%2F%2F2CFgOhd%2B2tKUUmY8gXOH2isRwVcPSmY31Etf3DqDst0vCYIoyHa8xN9bV5p3eQSw90uPODIBxZrVxUfzw3MjmYN4CMdBsARNuABHWr1m%2FjHwqBCTmDNW%2F%2BEN4Pp8IFeJQ%2FRTs1aJI3OrRd9LzNelnR9d5rMcasXQ0ADGpYQO8%2FstA%2FRYp%2F7w19%2Bp8R622fqFyWsru1tq9I2vqUri4TOcIU21Uf2v7xkfqKk7RpcIOJUZ4FRg%2FFmsPqi0PiqTGOcejLzMtY2rPZrqhdaxGiwmi2ve5%2FgtB%2FEZ3VrPLchtCy94OtjQBOYcItk2YDOYTh7zqIo1d%2BmOBXamsAgH4vRPVOR5WyuHxoTUcQ8rWRZ7R8InrL2DGVyZHU4AWeBX8r2j7ClGqscwnVCVbnIRSnLD7o481FcP8cO%2B6P%2BTbwU3xXGt3%2BhCXomAKEef2%2B%2FathXQ5pPDxAZu7RZnPrOtzSv9OptbBSK0LKSGKzV0YW0Z1%2FeqrVd54Q01m4lLz%2BJMJP8gMwGOqUBt%2BhY8mrsS8sJgolWcKbXqbA%2BnPNuZDbwjNvGmzBza94iO8sbbBKXCcjDSZ9yR29lwLsMB9s1weOv63vJRFTkkDRXC8xgBjoarTQLw9CgO%2Fh612Cp2BDctbnKnHEarvlbtjBgRfrxN6Pt%2FNnFT1%2BPncQEu4OY2lGsGS31%2BxQiWDEJjoDpMzKt8XZzUj1UW0RCr9hg1NmXCd7%2BpbedwbsmiK1HecAK&X-Amz-Signature=9f35b053551f85ec2e6f4f7e2d295ea185dbb0e600337cbbdb338736c677401a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
