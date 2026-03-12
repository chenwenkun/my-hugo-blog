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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667BF77I3F%2F20260312%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260312T064028Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD00B3Rgb9MCwqpUzJ6HToVs2vIZpuWsdo5ReYAdOw%2FggIgbhYsBMFeoLEL%2FKbwobAsRcAgfnG0M6YsdN6k%2F1njkIkq%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDJDpKrHQR5PrQBI0vyrcAw3zg0gJGNFW%2B2Kl0gstW%2FDekwBxMdbvE1HlL438AYk5qYmDiCl10daLSf6Vddgue8WDjkPp5nmhaZwryC2oe4oo4TKZk0TaWUsT%2B207u13UJaOmIsyQEeqowhYVXPVuO1b13mxXV%2F%2BLkFvlLlPgb39MzCCq2F%2FTaGIRcU6OnltldPdBXXbob5CX5SSNUF%2FFnZb6RQrEX0DhmRECBhCLXhb21Bs9BS0e3dZpMDC4XcqOOObLV8nleRvDtovn8jiEGD5BONxmjjRbwHn8NL4oOGdJsJBYIiR6sPiFTD2LJHqb6ZQ6%2FlTpRe5MquYM8i9zPA5cy9X9%2F5XLTQAznbzrK8jAV%2BQL8O0Gp25cE%2B1bgh5EUjPrvsMf%2FnI3Ot0fQeHr4dNZo178D7362j66lU%2FmU7n3QcihlS1JZJ6aTA2urmPQwL4PNy0AYYtFxzsQ6e8pICdjOx1UTWuRcHDT8ec3BWV%2Fno2GHex43Co2mPSX54C3vZJgnIMPBht4nS2%2FIwMuro8%2BBop5zmaG59bwFyLK2ITe6t%2FMCqGLkSET0ajEIZSO49yEahgST70OzOulFQxrfwn0zEbi7jbY6rNLrIAzESe9SIe7IoJGr6ZhsFIN5SVxCeFWhOIBIWW3QDwtMOKeyc0GOqUBddgsA8N6ehCqdoWuWXQr70u8oWamXtmpPGA3RpwqRx%2FV0T0IAzmE7tNL3WXwbLSE00m1gsf3IF56d5MnjyFqYiB6EI5VUoD8VX5qwMnZC%2BvvF%2BCQUbSncyVYk%2FqC7sa26BXgjudkabdfi1N5zZyjAEFA4oJmsDjnWEidbGN%2FHQQaWpEJjfMAMjIlu3rQVAJV6Gj6TajQHSH2aIAETGp%2Bqw%2BB%2B7lk&X-Amz-Signature=6d100ef8cf2311c3539b0022f277d56665d213af68721b792ef9ff812e9c0146&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667BF77I3F%2F20260312%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260312T064028Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD00B3Rgb9MCwqpUzJ6HToVs2vIZpuWsdo5ReYAdOw%2FggIgbhYsBMFeoLEL%2FKbwobAsRcAgfnG0M6YsdN6k%2F1njkIkq%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDJDpKrHQR5PrQBI0vyrcAw3zg0gJGNFW%2B2Kl0gstW%2FDekwBxMdbvE1HlL438AYk5qYmDiCl10daLSf6Vddgue8WDjkPp5nmhaZwryC2oe4oo4TKZk0TaWUsT%2B207u13UJaOmIsyQEeqowhYVXPVuO1b13mxXV%2F%2BLkFvlLlPgb39MzCCq2F%2FTaGIRcU6OnltldPdBXXbob5CX5SSNUF%2FFnZb6RQrEX0DhmRECBhCLXhb21Bs9BS0e3dZpMDC4XcqOOObLV8nleRvDtovn8jiEGD5BONxmjjRbwHn8NL4oOGdJsJBYIiR6sPiFTD2LJHqb6ZQ6%2FlTpRe5MquYM8i9zPA5cy9X9%2F5XLTQAznbzrK8jAV%2BQL8O0Gp25cE%2B1bgh5EUjPrvsMf%2FnI3Ot0fQeHr4dNZo178D7362j66lU%2FmU7n3QcihlS1JZJ6aTA2urmPQwL4PNy0AYYtFxzsQ6e8pICdjOx1UTWuRcHDT8ec3BWV%2Fno2GHex43Co2mPSX54C3vZJgnIMPBht4nS2%2FIwMuro8%2BBop5zmaG59bwFyLK2ITe6t%2FMCqGLkSET0ajEIZSO49yEahgST70OzOulFQxrfwn0zEbi7jbY6rNLrIAzESe9SIe7IoJGr6ZhsFIN5SVxCeFWhOIBIWW3QDwtMOKeyc0GOqUBddgsA8N6ehCqdoWuWXQr70u8oWamXtmpPGA3RpwqRx%2FV0T0IAzmE7tNL3WXwbLSE00m1gsf3IF56d5MnjyFqYiB6EI5VUoD8VX5qwMnZC%2BvvF%2BCQUbSncyVYk%2FqC7sa26BXgjudkabdfi1N5zZyjAEFA4oJmsDjnWEidbGN%2FHQQaWpEJjfMAMjIlu3rQVAJV6Gj6TajQHSH2aIAETGp%2Bqw%2BB%2B7lk&X-Amz-Signature=4e210c4905c87b540351f7a8b6a6e54d15076f189f93621203c87659f6bc773b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
