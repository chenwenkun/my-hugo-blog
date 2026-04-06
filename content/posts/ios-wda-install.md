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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QD5CJZPU%2F20260406%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260406T071633Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAMIYcHD8sr1wRRv%2FzPbcE3BMfy06lNSX%2B7JnW0C9MMBAiBukoZl%2FB5nwHavmq%2FoLBGaTENHnObjssPjEvVvv9INwyqIBAjI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrY0Nfw75Z02QYLAeKtwDx7GUVij3fu7wx7yHv0Ky8XWvHcO6Ns6filZy3itnWG70teoBEABBZOvyoLBqgjLfrfepHS0SOxBNnNCMY654339oDYJHJQX4XxMe8zYXcXTH7e3cKOuvh8BFGVht%2FGMgsdgel4s3r7U5WgMOdXaeA8bjPvpAZinniZlZ0SG8bP0MN6E9qClhWbHB5oUTT4Jkh%2F2Jb1re4eS8Oi%2FjIccr3Mcavl0LRO03bTFNEDXwxB0WC7X7pkMtv7z3CDYsi8rI65fzHjzsqPJLiSRcWyn3p%2Bl9pxYGifpkRVE1THzsYndZC4%2FImrmQZwUN%2F%2BlJrT3G8PklV9HZAEPVucmIGP8%2Bt17X8NKhdN4jAMCqC5VgxFRv28fxyTPGknWhZSI9rZSxbMkehNKnV1sq0NRLuqeg1m4Ip9F23f%2B%2FJE%2FW0o06%2BhO6EoinCKuFwVo9ouDFskB83p7QD9ehwdj1DTFfpMuEvGDfYNuOUcZOwvHbO%2BxVS5D%2BWkUn7PimDKCyk6a5lFc%2BOW6z2xeOEP0p4cU%2Bm2ef4GdnypALJVlw0jpVWR3n5ocTg1Qk4e%2BCwQY4DojsL2LFfmNW%2Fch9S7LDLReHhcc8cvfspRk2YGafxI6f9JrhGRBeB1sceekTat7s%2BMcws7XNzgY6pgHx4KPRdF0NTBomVS4n4WcOMM0U%2BEcdFWIT9%2BhxpYztE1cmPcykhBdN9VCMaynRiZ8h%2FQbwWosfkwgC%2BRQHgfZ5Nvvnk07fFh54wu0dHMNqTOvB6asZ5JUB8yLhxnYEu76fcfGhjdtdXYLNNPTAZ487qYN4%2FubrJzeZZxrzvS0mdhm2ZFlkPYx298YVOGohpsQHHM%2FyWFb1LRfn1ejQo9cTs4kH5eEW&X-Amz-Signature=e879399ff42cc521731e07770c00022cc57fd0eda2fd6b73ac1d23137d4609f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QD5CJZPU%2F20260406%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260406T071633Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAMIYcHD8sr1wRRv%2FzPbcE3BMfy06lNSX%2B7JnW0C9MMBAiBukoZl%2FB5nwHavmq%2FoLBGaTENHnObjssPjEvVvv9INwyqIBAjI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrY0Nfw75Z02QYLAeKtwDx7GUVij3fu7wx7yHv0Ky8XWvHcO6Ns6filZy3itnWG70teoBEABBZOvyoLBqgjLfrfepHS0SOxBNnNCMY654339oDYJHJQX4XxMe8zYXcXTH7e3cKOuvh8BFGVht%2FGMgsdgel4s3r7U5WgMOdXaeA8bjPvpAZinniZlZ0SG8bP0MN6E9qClhWbHB5oUTT4Jkh%2F2Jb1re4eS8Oi%2FjIccr3Mcavl0LRO03bTFNEDXwxB0WC7X7pkMtv7z3CDYsi8rI65fzHjzsqPJLiSRcWyn3p%2Bl9pxYGifpkRVE1THzsYndZC4%2FImrmQZwUN%2F%2BlJrT3G8PklV9HZAEPVucmIGP8%2Bt17X8NKhdN4jAMCqC5VgxFRv28fxyTPGknWhZSI9rZSxbMkehNKnV1sq0NRLuqeg1m4Ip9F23f%2B%2FJE%2FW0o06%2BhO6EoinCKuFwVo9ouDFskB83p7QD9ehwdj1DTFfpMuEvGDfYNuOUcZOwvHbO%2BxVS5D%2BWkUn7PimDKCyk6a5lFc%2BOW6z2xeOEP0p4cU%2Bm2ef4GdnypALJVlw0jpVWR3n5ocTg1Qk4e%2BCwQY4DojsL2LFfmNW%2Fch9S7LDLReHhcc8cvfspRk2YGafxI6f9JrhGRBeB1sceekTat7s%2BMcws7XNzgY6pgHx4KPRdF0NTBomVS4n4WcOMM0U%2BEcdFWIT9%2BhxpYztE1cmPcykhBdN9VCMaynRiZ8h%2FQbwWosfkwgC%2BRQHgfZ5Nvvnk07fFh54wu0dHMNqTOvB6asZ5JUB8yLhxnYEu76fcfGhjdtdXYLNNPTAZ487qYN4%2FubrJzeZZxrzvS0mdhm2ZFlkPYx298YVOGohpsQHHM%2FyWFb1LRfn1ejQo9cTs4kH5eEW&X-Amz-Signature=b79c7be8c70191341e917a956f6aab6ff5f82403e0bf5492c76080c3fa3bf681&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
