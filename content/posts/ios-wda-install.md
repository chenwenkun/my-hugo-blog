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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662AOA25HA%2F20260302%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260302T010959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuSsPeCsi5gMgqVRhXs3HgpCt30Aos6ZKx0uI8%2F8qcDQIhALt0mOlITCUhwkEHLqU008YoIUPA5Dt2Gg%2BRiHBDl5dqKv8DCHoQABoMNjM3NDIzMTgzODA1Igx1S8BonB8PHgnHni0q3APTWA81uZohvNdWmfyGONTHMPUTaqeGNZUb70g4ajkbynaR8cSXTXKtjB%2F7y0EBcknR5heQ6gca2TjhxvrAZYI3Z2SVUI3ebjqjLEqUzHLeTDYcoOJEJ85bKWskhkiI3IeF3ZUM3qsV%2FZV51FuGw9%2BDFmtW0fkIHAXf9JlUPp%2FsWxtoI0MmWYkolXDUoPI7eIO%2FcFIRENnQoqHIgf6Y%2FJo2SoJz3pZfJNMcMEQsSQ8Imp82dYmKZodPElSyW4xdQ1cRUkfmLlvlowOeXYvtDnv26VjLqlpLiigtes2yd5esaReXzTTHhkogXsE2%2F%2F%2Bzn9m8fuklcRWcGjAJfIxN02mroyq6y6hB07giAcNwMXEby5q%2BVUIjqJb47xW%2BMDv4%2BVSnsiu5UCWmpNHQg76OImrl9ZLKfsoW1YYLcvv7dI0xG%2Bo4XBqEGisySPhB4cikU%2BstV4VmLJy7hAC5ntvaAWko7%2FetKTBbDLC9rstUl2fg8qcbEM%2F16%2BNqHY%2FYxa%2Bhn8NMtDUjFg2x%2B32Yr6ZZ8Kht7uz8YA0LpwVLaZowXIgiR7q4%2FWpv5Wf3iS2nawAeJX6sS%2FhilC8wCEcXk2iFl3GLh8AxJyX2p5hYSEiFwoNwKyE073kM6WXsCMZtOzD3vZPNBjqkAcrX%2BKHE0OFgCLxqjp9Hwp0K9v%2FGJQdyAVLaw0pPMN2ePnLPX%2FZ6WV3f%2BuULCtRSEQfGL646ab2LU2197DHeicO4%2FqYLznnRpw76oTZ8Q79abRFtJtrzpCjzym9YRFnHcx18F2M8D6fzutkZed2gm2wsjJ%2FZTOj0jMNDFfRrOuilRdYFuTl%2F2N8DXXRlqkBbf3dzfSA2uv8YmQBGkt7IFRbotq8L&X-Amz-Signature=4f839c2037f03f831402ff692a5f64c13897e7a729762112b75b380ba1f68d09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662AOA25HA%2F20260302%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260302T010959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuSsPeCsi5gMgqVRhXs3HgpCt30Aos6ZKx0uI8%2F8qcDQIhALt0mOlITCUhwkEHLqU008YoIUPA5Dt2Gg%2BRiHBDl5dqKv8DCHoQABoMNjM3NDIzMTgzODA1Igx1S8BonB8PHgnHni0q3APTWA81uZohvNdWmfyGONTHMPUTaqeGNZUb70g4ajkbynaR8cSXTXKtjB%2F7y0EBcknR5heQ6gca2TjhxvrAZYI3Z2SVUI3ebjqjLEqUzHLeTDYcoOJEJ85bKWskhkiI3IeF3ZUM3qsV%2FZV51FuGw9%2BDFmtW0fkIHAXf9JlUPp%2FsWxtoI0MmWYkolXDUoPI7eIO%2FcFIRENnQoqHIgf6Y%2FJo2SoJz3pZfJNMcMEQsSQ8Imp82dYmKZodPElSyW4xdQ1cRUkfmLlvlowOeXYvtDnv26VjLqlpLiigtes2yd5esaReXzTTHhkogXsE2%2F%2F%2Bzn9m8fuklcRWcGjAJfIxN02mroyq6y6hB07giAcNwMXEby5q%2BVUIjqJb47xW%2BMDv4%2BVSnsiu5UCWmpNHQg76OImrl9ZLKfsoW1YYLcvv7dI0xG%2Bo4XBqEGisySPhB4cikU%2BstV4VmLJy7hAC5ntvaAWko7%2FetKTBbDLC9rstUl2fg8qcbEM%2F16%2BNqHY%2FYxa%2Bhn8NMtDUjFg2x%2B32Yr6ZZ8Kht7uz8YA0LpwVLaZowXIgiR7q4%2FWpv5Wf3iS2nawAeJX6sS%2FhilC8wCEcXk2iFl3GLh8AxJyX2p5hYSEiFwoNwKyE073kM6WXsCMZtOzD3vZPNBjqkAcrX%2BKHE0OFgCLxqjp9Hwp0K9v%2FGJQdyAVLaw0pPMN2ePnLPX%2FZ6WV3f%2BuULCtRSEQfGL646ab2LU2197DHeicO4%2FqYLznnRpw76oTZ8Q79abRFtJtrzpCjzym9YRFnHcx18F2M8D6fzutkZed2gm2wsjJ%2FZTOj0jMNDFfRrOuilRdYFuTl%2F2N8DXXRlqkBbf3dzfSA2uv8YmQBGkt7IFRbotq8L&X-Amz-Signature=e3b0b7283a82d003a6ea5b76a028dcac8aeae9f2d230e6140336dc41f83e7eb7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
