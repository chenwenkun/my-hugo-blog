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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHJQ52O5%2F20251208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251208T005531Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEV8qQWo9nBDEBLmGEgwNRpQhgZZ1fsIsL66vSKCQNcvAiBcQZamTJgpEwM8l53XVwCQqqi%2BHgvUc33blVGIgiE4qSqIBAiZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMpDV0njaWjOENrEmUKtwDQopJBMUdhU6Y%2FaEQETzEGmir5ZXeObWj84vl6BwrhkG4ze6SnebiP8vcIxoH81w66sSwkisG0ApFgWPpOBXY%2BVmwj8CR1GnZq5R2yiSWi978YX7u6L8J%2BaYME0SkaQnfp9KmRaKhDtV0JzeGwX%2FYetpLsb5cfECu7f5gnQKOq9jLgrCj9P5h7UKoS2I%2B6%2FRUkhAx6Mz9CHsVcAaOwTTUjBhfVNjQrO8TN7s9VA1k69Hy%2FpNU2iIxjLpPjCOYI813di%2BRYa91FZaiB0EbaBrjRWdlPKx2OT99K0PJChZ2NwXNTEdzF9ss0kSYw3IiXYoPTKNAj369hhglEjHqRrzl%2FiTX3SKTAcDVtK2P%2BZZb4ysQDEU38f8SM%2FKjPxLv93d2pTgXu5vjIWPVj9LF3gLUmaQaHQa1vBHMXRFEPv81w%2BLpUSiteo9WyT5IFI5m0IxvtnvMvhrk%2B%2Fp2pB1WcbgGeTXKoh%2FeTzaL3dcDtQK5pDXWUbtJtKRnuf8czQvpnx0r03mXFjFy3jGNFmMX6nirPB24sqNkacRfwE8xqCJI2%2BskQwW56F78UL0xf0weF4IpGR9QqCQNzY24FhRDxJK0necwpaWEfklIBb7basaMs2lRzP9PwCoZkbIztVUw66HYyQY6pgHmhn1r4V2WTbsmqC3uT8VUkuBlVgCXJvQBieRCUk7KIWwwwKzkDVhCilw7cNEHiDbaBx23rw5Ghc%2B7t8kgCrh8ulZ%2Fow3%2B2Ofsk%2B5P%2FC2QNJTdqXsPCFJ%2FcGGPNyggJV5N7t7pafcSAhtIPEs30j4bdjGJ0DNXFItyEiW3KU6nqwt%2Br%2FrigynAqkCL9tCnQ1mWk25IEQIwX%2FSyaN044LVyH8Nz%2BD7n&X-Amz-Signature=05967f8405945f4b5c35b67b362fe7154b7373b1ebde28ff2338fa30dec3e100&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHJQ52O5%2F20251208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251208T005531Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEV8qQWo9nBDEBLmGEgwNRpQhgZZ1fsIsL66vSKCQNcvAiBcQZamTJgpEwM8l53XVwCQqqi%2BHgvUc33blVGIgiE4qSqIBAiZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMpDV0njaWjOENrEmUKtwDQopJBMUdhU6Y%2FaEQETzEGmir5ZXeObWj84vl6BwrhkG4ze6SnebiP8vcIxoH81w66sSwkisG0ApFgWPpOBXY%2BVmwj8CR1GnZq5R2yiSWi978YX7u6L8J%2BaYME0SkaQnfp9KmRaKhDtV0JzeGwX%2FYetpLsb5cfECu7f5gnQKOq9jLgrCj9P5h7UKoS2I%2B6%2FRUkhAx6Mz9CHsVcAaOwTTUjBhfVNjQrO8TN7s9VA1k69Hy%2FpNU2iIxjLpPjCOYI813di%2BRYa91FZaiB0EbaBrjRWdlPKx2OT99K0PJChZ2NwXNTEdzF9ss0kSYw3IiXYoPTKNAj369hhglEjHqRrzl%2FiTX3SKTAcDVtK2P%2BZZb4ysQDEU38f8SM%2FKjPxLv93d2pTgXu5vjIWPVj9LF3gLUmaQaHQa1vBHMXRFEPv81w%2BLpUSiteo9WyT5IFI5m0IxvtnvMvhrk%2B%2Fp2pB1WcbgGeTXKoh%2FeTzaL3dcDtQK5pDXWUbtJtKRnuf8czQvpnx0r03mXFjFy3jGNFmMX6nirPB24sqNkacRfwE8xqCJI2%2BskQwW56F78UL0xf0weF4IpGR9QqCQNzY24FhRDxJK0necwpaWEfklIBb7basaMs2lRzP9PwCoZkbIztVUw66HYyQY6pgHmhn1r4V2WTbsmqC3uT8VUkuBlVgCXJvQBieRCUk7KIWwwwKzkDVhCilw7cNEHiDbaBx23rw5Ghc%2B7t8kgCrh8ulZ%2Fow3%2B2Ofsk%2B5P%2FC2QNJTdqXsPCFJ%2FcGGPNyggJV5N7t7pafcSAhtIPEs30j4bdjGJ0DNXFItyEiW3KU6nqwt%2Br%2FrigynAqkCL9tCnQ1mWk25IEQIwX%2FSyaN044LVyH8Nz%2BD7n&X-Amz-Signature=0d2b8149f63a29d841d21764686a695326752ced2ba5f3158e804aa15c2371d9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
