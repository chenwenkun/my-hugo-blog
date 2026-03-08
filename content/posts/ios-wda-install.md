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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TAMDFDFA%2F20260308%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260308T011116Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCIA7ZP127GeswVbGf5AMwjx4NLlYJZNMRP97CIxjBkqV9AiEAt89BzcfItemDAdfQLF1xDtR49cGKnr6qVtSlwciqYhAq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDL%2FwzI2IpWKCmKGvhyrcAzmt%2BBrt0iyZ8DoRmkaWnJWoXcMjgZ1V0XWVpEckBBz1DCGP7shAgeBz7z2LYcaSszc1dNT9Uo%2F2IG2czp30S4bCX0Bz8aU32SRvQuXTRfaH1JIAgkFygO5%2B3YJOc%2FReaDgLdonyT%2BMe2sjb5JoqgWqiyNnEGBCapaJH4n2tenuk7h4NIZKiWt8IytgS%2FSFyWdv0UOFh7E0JzPgXdOEuRqKRzz7%2BTgAS4DX80ZExG%2FHi4Ej1DuBVANZmzwuUFmwpcNw9VncPhNVlCHEoenpDh4G9TT4cHyIO07OXnjpW074l4Bz4W29ePMmbzeWsb8AWeW6bLe2TgMuAjRMgjnOYQkTTIbeE3iDwV20WWuS5SSkJ1fvuvUqS6pzAG4Yrq%2BeiGu9C0HII%2BX6rztx9sWSzaQKMx93923Bv3Z9DB9gknqrkjyPsN1RYHVx%2BatbK78s5CAsZw21%2BpBO5GEON8AVqyiEmwLXXr8dxdU1NYoCfwnYGRAHzVcLJlF1qyVujEanRSmig%2BBbWMwq0f3tid9%2FapTv4nOgKtEJluv8VHqH%2FkMV%2BCAI7ZS%2FjrpfqMOGdl%2FNswU10FztFnVCviQQ5iDDQHRZ1HpbHHnZ9E4aTw3yhgzxWTD1hPmU07wvcRZN6MLH1ss0GOqUBXWyrK65UpNQbTnWaPQ3PFZ%2Bu%2BUeWrTADHDr41KTs5ZKso1dbw%2FBwIce2uLmICK5yt4QBcKhGTi4nB11wYta9IsM06KjgKnJv%2F1t4Q5SpILKTeni%2BDYaz3M9O8NSWj%2B6yKC%2FWRyieIzEtQNxmh4NFuuZ9Jo31ptKlbbhI5wO3dleBayuMMvJKrxGVNqWnjYVMWCN%2BDFZ%2FO2jtfYYBWlg3INrF598J&X-Amz-Signature=f346e0e92235c6e876e2456b5cc1d92fe50cfaea204577a1f1a5e1e3ac8936ff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TAMDFDFA%2F20260308%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260308T011116Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCIA7ZP127GeswVbGf5AMwjx4NLlYJZNMRP97CIxjBkqV9AiEAt89BzcfItemDAdfQLF1xDtR49cGKnr6qVtSlwciqYhAq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDL%2FwzI2IpWKCmKGvhyrcAzmt%2BBrt0iyZ8DoRmkaWnJWoXcMjgZ1V0XWVpEckBBz1DCGP7shAgeBz7z2LYcaSszc1dNT9Uo%2F2IG2czp30S4bCX0Bz8aU32SRvQuXTRfaH1JIAgkFygO5%2B3YJOc%2FReaDgLdonyT%2BMe2sjb5JoqgWqiyNnEGBCapaJH4n2tenuk7h4NIZKiWt8IytgS%2FSFyWdv0UOFh7E0JzPgXdOEuRqKRzz7%2BTgAS4DX80ZExG%2FHi4Ej1DuBVANZmzwuUFmwpcNw9VncPhNVlCHEoenpDh4G9TT4cHyIO07OXnjpW074l4Bz4W29ePMmbzeWsb8AWeW6bLe2TgMuAjRMgjnOYQkTTIbeE3iDwV20WWuS5SSkJ1fvuvUqS6pzAG4Yrq%2BeiGu9C0HII%2BX6rztx9sWSzaQKMx93923Bv3Z9DB9gknqrkjyPsN1RYHVx%2BatbK78s5CAsZw21%2BpBO5GEON8AVqyiEmwLXXr8dxdU1NYoCfwnYGRAHzVcLJlF1qyVujEanRSmig%2BBbWMwq0f3tid9%2FapTv4nOgKtEJluv8VHqH%2FkMV%2BCAI7ZS%2FjrpfqMOGdl%2FNswU10FztFnVCviQQ5iDDQHRZ1HpbHHnZ9E4aTw3yhgzxWTD1hPmU07wvcRZN6MLH1ss0GOqUBXWyrK65UpNQbTnWaPQ3PFZ%2Bu%2BUeWrTADHDr41KTs5ZKso1dbw%2FBwIce2uLmICK5yt4QBcKhGTi4nB11wYta9IsM06KjgKnJv%2F1t4Q5SpILKTeni%2BDYaz3M9O8NSWj%2B6yKC%2FWRyieIzEtQNxmh4NFuuZ9Jo31ptKlbbhI5wO3dleBayuMMvJKrxGVNqWnjYVMWCN%2BDFZ%2FO2jtfYYBWlg3INrF598J&X-Amz-Signature=6c3908a850fe163a33893a43cab95548301b69635e1c52858338d8c17276eb2f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
