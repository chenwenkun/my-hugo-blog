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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662QEK2D35%2F20260428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260428T080539Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIA6HiKHN8FbS%2FXUQyQl9UVwu0rqoRb1rTWoi0yHZvLHLAiEAtAGqfNpEkNPpIQwgB1BTz5IdYib5Soy4uH8a5q%2BKMYAqiAQI2P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM1P7bXTgUXsKFXXayrcAwI%2F1%2Fq8S8MYOMj46sAusAaMBSickeUHisjdBOlOqtV79k2Ea77bjuSUx6nxnopQsWZUKmbZGGCEdvBOdZBakD0kLKjyGhV3Qqp4A2Wt3cR1nm8lEKzSRrZryU9aFlSNQ%2FG42FJvAfPTwdz8v%2BftB7%2FvjPijbSHH3Dcw%2Fq7%2Fjg5A56Gje04q361B4S8hW%2B7ZFlE3hRvoveFvbrygQxVCPu8GIntrjgNV1fC5%2BHaDX6bnvzfGFxixreiUARn%2FAMprjbFJWc5dHOQy7jm5TUQzy%2FKamELBlIoA8QveiAHn%2BvBJCSTGYa9evaD2G8gi4eie84bOfo%2FHMWmzmESvmHeIivOqQqeFACxb4t18ZIIw4SlWGolQoIq1YOx%2Fm7H9Y450SOOQjeCXC%2FvTLKmN52gV6NB%2FaOVUHV%2Fwe1ybF4mWMBjxmB7bKlsJShRGud8e%2FW%2FYOqhWOWP%2BpBkhVBRSL%2FvFcemxVBBaL3duH8khWcqdsy5p3U2gWVxwz2CnBN%2FNgZ6CveW84qASxlY0O3NtlIXvj6zaZDO8%2BLGGNvl7VMZ8wINXjYsy0FkEjZg%2FQr2U2X23rzowqqAvLSk5%2Begr0V6kihcZBtJjPDRgfSDqJnfPuG2NS3RlhJRnA6WP8juRMLiwwc8GOqUBjPsF1vU4qrweDj%2BJIZlv4%2BU2sMY3jLp1RdtqhRKPY7XMBNYJkxmzN1vEXl4Rpk2Q69gw%2FA5WtzSPu25LAdC%2BunnTp0%2BUP60ZDxC1U1JhCyXEcgHqlO4l7uWsLbx%2FNqq9SBeYm4R1t4rlVX5BOa%2FwpZsLYos7JSJJO1VGaUXHkbGvOoJyhP06k8sY9u8U9ETpKdXIM%2BOAxTpBlEAKM3j5kjkiulUZ&X-Amz-Signature=6f024f36011dc697d2d662f8027d6ff5547583bc6bcee338c0bcf523362d318e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662QEK2D35%2F20260428%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260428T080539Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIA6HiKHN8FbS%2FXUQyQl9UVwu0rqoRb1rTWoi0yHZvLHLAiEAtAGqfNpEkNPpIQwgB1BTz5IdYib5Soy4uH8a5q%2BKMYAqiAQI2P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM1P7bXTgUXsKFXXayrcAwI%2F1%2Fq8S8MYOMj46sAusAaMBSickeUHisjdBOlOqtV79k2Ea77bjuSUx6nxnopQsWZUKmbZGGCEdvBOdZBakD0kLKjyGhV3Qqp4A2Wt3cR1nm8lEKzSRrZryU9aFlSNQ%2FG42FJvAfPTwdz8v%2BftB7%2FvjPijbSHH3Dcw%2Fq7%2Fjg5A56Gje04q361B4S8hW%2B7ZFlE3hRvoveFvbrygQxVCPu8GIntrjgNV1fC5%2BHaDX6bnvzfGFxixreiUARn%2FAMprjbFJWc5dHOQy7jm5TUQzy%2FKamELBlIoA8QveiAHn%2BvBJCSTGYa9evaD2G8gi4eie84bOfo%2FHMWmzmESvmHeIivOqQqeFACxb4t18ZIIw4SlWGolQoIq1YOx%2Fm7H9Y450SOOQjeCXC%2FvTLKmN52gV6NB%2FaOVUHV%2Fwe1ybF4mWMBjxmB7bKlsJShRGud8e%2FW%2FYOqhWOWP%2BpBkhVBRSL%2FvFcemxVBBaL3duH8khWcqdsy5p3U2gWVxwz2CnBN%2FNgZ6CveW84qASxlY0O3NtlIXvj6zaZDO8%2BLGGNvl7VMZ8wINXjYsy0FkEjZg%2FQr2U2X23rzowqqAvLSk5%2Begr0V6kihcZBtJjPDRgfSDqJnfPuG2NS3RlhJRnA6WP8juRMLiwwc8GOqUBjPsF1vU4qrweDj%2BJIZlv4%2BU2sMY3jLp1RdtqhRKPY7XMBNYJkxmzN1vEXl4Rpk2Q69gw%2FA5WtzSPu25LAdC%2BunnTp0%2BUP60ZDxC1U1JhCyXEcgHqlO4l7uWsLbx%2FNqq9SBeYm4R1t4rlVX5BOa%2FwpZsLYos7JSJJO1VGaUXHkbGvOoJyhP06k8sY9u8U9ETpKdXIM%2BOAxTpBlEAKM3j5kjkiulUZ&X-Amz-Signature=e0048ca9acb92ab75dab8c22a3afa09220da53668a267d91af2ee795f987bd5b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
