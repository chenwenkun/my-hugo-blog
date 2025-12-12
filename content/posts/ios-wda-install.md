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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CR2QZGP%2F20251212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251212T061921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCIHyPlo9wSoL6HurbPJblTUr6iMYaFAcbniUwwokp2dkqAiEA3jkvyG3YRvOeETFD7sQtgQ7bQYumQ%2FR1sWF4Gv8tF2UqiAQI%2Fv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJRmqokcY5ovHwkoDircA%2BDrwhsVSn9lQU06CVBeqmW3j0Bv1s2bFi46e%2Bz09UY1PrDpnsd%2B2JEsPyKcLVBUjOJaiqOC%2BoTXxC%2FX5G4LR3PQRaJUsu%2FPZM5MX%2Frxtj5%2BO86tghM%2Ffi%2FqWNgZ0ZyPYE5BnoNSGMTYPNHzqtoOf%2Fuqr%2BqOr5ROT5hWQSoZ5GfE%2Flm0bKz2eymlvyRvZCz45h2ziM75kieL38vepA%2FCS7InBb4AfZoRDGct0%2BNSuUwWGB0LoglGs7qOjHEsqcT2VUD3JyYGOWS2ygYadhFhxMyhmVE%2FbOMSLUNKdxckJFJdTqOTWAGFW9WT55Zy8YxMyN%2BIVpomkwg6YgwN3EhkXt%2BWknPIspvOFjFxTlFeT79xza4%2BTV%2F0aMtOqG6K7YCGienAxT%2F51eedmF4jDtSPPVIrYf4ZuqtegW28hN%2FewzA7G3qEWWkjdpyTEAjjrMWoaLWc%2BJqKraLmNLtXEWVcxbfReEoyxuItL8lhKONxfP7GaGrh1Q5tqmblrXSACP08kJLAw71bFxBUwzVZ9vTnHFOBJWRCsnl%2F4rlbjbFYszGrY2xKUxw5ISrWw%2BqQdih0XdYRJP%2BaitNEZaiEl3N9%2FTyhTEcjlHE2tVKPm6MCfmd75YOcrSricL1Q2I0kMO3L7skGOqUBgE7%2Bjyecszq8iCYnmEHARHDXbx0GJH2vcTEMzbl8fv0MyyH3Vo5lVz2L0VAC2ZOsr8KEizB07ujJeVoeQ5QKF5G8WMkz0ybZ%2BH2Jq1QkoZVCLM67eO1L95YlHn0f3BStJIRmlS5mI7%2BYXBtY0VlCDdX9vhAkkPobgSmAxOm2DLONT1q5Ao7lxSPDn4gctVplE0NUHOmCjAzvcpNSuSHrt3CzpxMd&X-Amz-Signature=09c2a025144bfb967cd50689cde43c86bb006a064da5ef5303b275fb780c66c9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663CR2QZGP%2F20251212%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251212T061921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCIHyPlo9wSoL6HurbPJblTUr6iMYaFAcbniUwwokp2dkqAiEA3jkvyG3YRvOeETFD7sQtgQ7bQYumQ%2FR1sWF4Gv8tF2UqiAQI%2Fv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJRmqokcY5ovHwkoDircA%2BDrwhsVSn9lQU06CVBeqmW3j0Bv1s2bFi46e%2Bz09UY1PrDpnsd%2B2JEsPyKcLVBUjOJaiqOC%2BoTXxC%2FX5G4LR3PQRaJUsu%2FPZM5MX%2Frxtj5%2BO86tghM%2Ffi%2FqWNgZ0ZyPYE5BnoNSGMTYPNHzqtoOf%2Fuqr%2BqOr5ROT5hWQSoZ5GfE%2Flm0bKz2eymlvyRvZCz45h2ziM75kieL38vepA%2FCS7InBb4AfZoRDGct0%2BNSuUwWGB0LoglGs7qOjHEsqcT2VUD3JyYGOWS2ygYadhFhxMyhmVE%2FbOMSLUNKdxckJFJdTqOTWAGFW9WT55Zy8YxMyN%2BIVpomkwg6YgwN3EhkXt%2BWknPIspvOFjFxTlFeT79xza4%2BTV%2F0aMtOqG6K7YCGienAxT%2F51eedmF4jDtSPPVIrYf4ZuqtegW28hN%2FewzA7G3qEWWkjdpyTEAjjrMWoaLWc%2BJqKraLmNLtXEWVcxbfReEoyxuItL8lhKONxfP7GaGrh1Q5tqmblrXSACP08kJLAw71bFxBUwzVZ9vTnHFOBJWRCsnl%2F4rlbjbFYszGrY2xKUxw5ISrWw%2BqQdih0XdYRJP%2BaitNEZaiEl3N9%2FTyhTEcjlHE2tVKPm6MCfmd75YOcrSricL1Q2I0kMO3L7skGOqUBgE7%2Bjyecszq8iCYnmEHARHDXbx0GJH2vcTEMzbl8fv0MyyH3Vo5lVz2L0VAC2ZOsr8KEizB07ujJeVoeQ5QKF5G8WMkz0ybZ%2BH2Jq1QkoZVCLM67eO1L95YlHn0f3BStJIRmlS5mI7%2BYXBtY0VlCDdX9vhAkkPobgSmAxOm2DLONT1q5Ao7lxSPDn4gctVplE0NUHOmCjAzvcpNSuSHrt3CzpxMd&X-Amz-Signature=c6a5e3fcd5abf01d5fd2597f8c5166f5318029341bf636efee84f9964bc3bb5b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
