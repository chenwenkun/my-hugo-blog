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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PVIGIJC%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T190135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJGMEQCIHS6jo57vu4UMO1oniV5lVv7fLGahlJKPsVviEuoRwvAAiAuUcosxmJtLZpfT1Frfk6i3aluDtoaSJ8CSoZU1%2F43pCr%2FAwgEEAAaDDYzNzQyMzE4MzgwNSIMUSlUPZJUo%2B682NV7KtwDxfahbeKw0QR04uIJ6Oa8JQWVk3mKZIo7jIO3%2Bm2NmdUb3jyD5Xlkltz4x%2F2H9Q9bNVe%2B9P2SdJQimV%2BfS1W9CiFnUTHpt4nCc%2BT1jme%2BCla%2BTy1Wl4poK2yefN%2ByC1k7TYCYDFr3Y6y4qBzDqesp7YIpBFV2LOY%2B4VWihGyb%2FaA48tyOmlXNutBSeQiLKgcZvIm0zweRTMTOc9FHzEMDjzFoIw1VCrdB7u2%2F%2BzXdmJ0tNjUK7Kj1sGtjIJyF7kMtQjl6VEygCG1yaRrCpEO9i1oiNuIDhqMy5MWJDq6GZ4%2B%2FbxxKYwfvQl7XWuGO9B2Z1KQker6CrPUp8iWdSMuPvFlgpFkwvdOHZb05Car9CBHMjgtAx0TUJsIOC7wYTxdZHyoY3DYHSaiC1vYwWHkUKgAD%2FejD9o8ou%2BfB76orNxcP2HgbwgD0xs9yotQX7Z82ZWs24GVsaT9KXz34Hl9UyXbrUbtoOSZrbn3XQaj3H36yMgnYOPea%2Bn%2FrqfKbHa9dCq6NfgCSsXMls8V0OgBDRFGvyOFtVl5o2NKYmZesazh1hy%2BXpjBl7mGSwzWg06U2E0JwlCdkWKpgpOBZqcNXUXkJ6qoniQDT5Ch2XEv%2FMhJTT6LncbM37xMBvKkwgMnazgY6pgGuMeI%2B4ai8EUeqIbTlWU2oCA2pKTcRA5FJNnFAmetqHhhqcdYMmR%2FNVQ5VHOLxswdX2qtTZE7VvrYKLDqGT3cNxHnOgiid8RliLrEnirUkgYnTPDtHlSRpA2LWsw0789xFry2DCwMklb3RPoZjGACDtlo%2BefjoBimlgIXJElFNbruOe%2Buw1CtShjqCLczI6VCulnOK9XT1YZgdWSmgRKzGOp1cjKW7&X-Amz-Signature=165902346eae81185d1e6feb15dc7144f90aa0b3e0ac071a931eb088d20bd37f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PVIGIJC%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T190135Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJGMEQCIHS6jo57vu4UMO1oniV5lVv7fLGahlJKPsVviEuoRwvAAiAuUcosxmJtLZpfT1Frfk6i3aluDtoaSJ8CSoZU1%2F43pCr%2FAwgEEAAaDDYzNzQyMzE4MzgwNSIMUSlUPZJUo%2B682NV7KtwDxfahbeKw0QR04uIJ6Oa8JQWVk3mKZIo7jIO3%2Bm2NmdUb3jyD5Xlkltz4x%2F2H9Q9bNVe%2B9P2SdJQimV%2BfS1W9CiFnUTHpt4nCc%2BT1jme%2BCla%2BTy1Wl4poK2yefN%2ByC1k7TYCYDFr3Y6y4qBzDqesp7YIpBFV2LOY%2B4VWihGyb%2FaA48tyOmlXNutBSeQiLKgcZvIm0zweRTMTOc9FHzEMDjzFoIw1VCrdB7u2%2F%2BzXdmJ0tNjUK7Kj1sGtjIJyF7kMtQjl6VEygCG1yaRrCpEO9i1oiNuIDhqMy5MWJDq6GZ4%2B%2FbxxKYwfvQl7XWuGO9B2Z1KQker6CrPUp8iWdSMuPvFlgpFkwvdOHZb05Car9CBHMjgtAx0TUJsIOC7wYTxdZHyoY3DYHSaiC1vYwWHkUKgAD%2FejD9o8ou%2BfB76orNxcP2HgbwgD0xs9yotQX7Z82ZWs24GVsaT9KXz34Hl9UyXbrUbtoOSZrbn3XQaj3H36yMgnYOPea%2Bn%2FrqfKbHa9dCq6NfgCSsXMls8V0OgBDRFGvyOFtVl5o2NKYmZesazh1hy%2BXpjBl7mGSwzWg06U2E0JwlCdkWKpgpOBZqcNXUXkJ6qoniQDT5Ch2XEv%2FMhJTT6LncbM37xMBvKkwgMnazgY6pgGuMeI%2B4ai8EUeqIbTlWU2oCA2pKTcRA5FJNnFAmetqHhhqcdYMmR%2FNVQ5VHOLxswdX2qtTZE7VvrYKLDqGT3cNxHnOgiid8RliLrEnirUkgYnTPDtHlSRpA2LWsw0789xFry2DCwMklb3RPoZjGACDtlo%2BefjoBimlgIXJElFNbruOe%2Buw1CtShjqCLczI6VCulnOK9XT1YZgdWSmgRKzGOp1cjKW7&X-Amz-Signature=fbd184c2f5e5e24d5ee2481c15c98b4ab30be236ffde1d462d4a21ff4a97126f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
