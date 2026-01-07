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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662ZXC5PP7%2F20260107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260107T005841Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDL%2FihOOAJK%2B7meIIEeYUt18rRCrxUZzBlt6rujcVBusgIgCXa%2BAIG42Uf0lZl7f2tNVbflyMMORJydcrmC4Z3EXCkq%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDCizWFKIMn6UGoiu6SrcA7m05TC70XeN%2Fij66Z640Nlf1c3vn2iXBGqrkPPva5%2BZdOb0aGsJFM06wn%2B4p7PKIpd7vL%2BM9BDIhbE89eBPxW8Sy5KjAf9KbBadfc8NMA37%2BDmiSlxIvXDO0hpGL%2BSMIHWoMfNI8F%2BfCb7pb8Ryu71mR7It6pAY4VCffsjftLMtc8pm%2FgXKoECe5BF7rU0%2FHUubSAa%2FYOZiMC7S2y2G%2BA3wXuNc5%2BMzXPSWWIsVBd6vfizNKraTt6iYjLpL08aOKM%2BboIfUW9mNIIr%2BB0nbfVp9OIFlRgSfT%2B%2Bzgdf4xIYOXiilfzOkKKZabQar%2FHWOpPPWIw55cVR%2FThr5QpZbz4VoWix95HCDpq3XNBmtOmLfm0H%2B8rTp8g09w7zqrtcHfZavrwG7e0DftFcdvR%2BiCXuKrPIzAakp%2FXCzyNi638tsrGZQj7aPemGOz718WKAI0DWTIIWyO7qrDncgQnP58jja5QAYbSG%2BACOA7Tpb4IYBcJm9oWiNsG%2BkSpWL%2B%2Ftd27qqcUrTYE6acCifXAw4wjFgykbe7n3grfJK37m6aF0cglIsytl3OxUSREmAte1hEb8bDwxCiOTdKWs1xQRrw1JUeOvqT8EkdwqcsJeLzSMlYxnTaewZqob7bfjOMI7W9soGOqUBHw3E5WA5tty07kBFmjcyU7xOxutWrLF7dwEDEwakv3TYr2bkZaLZs95TmXe02SQZXb3DZRfcV%2FP2B6vYGqJZDPO4Y%2FYFVeyXwTIQ1uSnlpcgs5lcn2spE07cT8bIw3lSppb7EJ0bGhl4VE%2B2SOD9qEjKhyuLWdPHNsBaDpD1SKX47mzp6NbV%2FIReWFMTScSJjeIg7IEk%2FFUUHXcdSF0y7zLAvAlz&X-Amz-Signature=401373ca9ef789d0137a17d00adadd06141a4fc67869e283f801468bbf7f5825&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662ZXC5PP7%2F20260107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260107T005841Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDL%2FihOOAJK%2B7meIIEeYUt18rRCrxUZzBlt6rujcVBusgIgCXa%2BAIG42Uf0lZl7f2tNVbflyMMORJydcrmC4Z3EXCkq%2FwMIahAAGgw2Mzc0MjMxODM4MDUiDCizWFKIMn6UGoiu6SrcA7m05TC70XeN%2Fij66Z640Nlf1c3vn2iXBGqrkPPva5%2BZdOb0aGsJFM06wn%2B4p7PKIpd7vL%2BM9BDIhbE89eBPxW8Sy5KjAf9KbBadfc8NMA37%2BDmiSlxIvXDO0hpGL%2BSMIHWoMfNI8F%2BfCb7pb8Ryu71mR7It6pAY4VCffsjftLMtc8pm%2FgXKoECe5BF7rU0%2FHUubSAa%2FYOZiMC7S2y2G%2BA3wXuNc5%2BMzXPSWWIsVBd6vfizNKraTt6iYjLpL08aOKM%2BboIfUW9mNIIr%2BB0nbfVp9OIFlRgSfT%2B%2Bzgdf4xIYOXiilfzOkKKZabQar%2FHWOpPPWIw55cVR%2FThr5QpZbz4VoWix95HCDpq3XNBmtOmLfm0H%2B8rTp8g09w7zqrtcHfZavrwG7e0DftFcdvR%2BiCXuKrPIzAakp%2FXCzyNi638tsrGZQj7aPemGOz718WKAI0DWTIIWyO7qrDncgQnP58jja5QAYbSG%2BACOA7Tpb4IYBcJm9oWiNsG%2BkSpWL%2B%2Ftd27qqcUrTYE6acCifXAw4wjFgykbe7n3grfJK37m6aF0cglIsytl3OxUSREmAte1hEb8bDwxCiOTdKWs1xQRrw1JUeOvqT8EkdwqcsJeLzSMlYxnTaewZqob7bfjOMI7W9soGOqUBHw3E5WA5tty07kBFmjcyU7xOxutWrLF7dwEDEwakv3TYr2bkZaLZs95TmXe02SQZXb3DZRfcV%2FP2B6vYGqJZDPO4Y%2FYFVeyXwTIQ1uSnlpcgs5lcn2spE07cT8bIw3lSppb7EJ0bGhl4VE%2B2SOD9qEjKhyuLWdPHNsBaDpD1SKX47mzp6NbV%2FIReWFMTScSJjeIg7IEk%2FFUUHXcdSF0y7zLAvAlz&X-Amz-Signature=1b1cd0ad096dfce68f0974e6d35877f357e5884d8c64465b58cf62b0f4f3c79c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
