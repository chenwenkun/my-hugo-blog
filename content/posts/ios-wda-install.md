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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4CWAQ6S%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T190748Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBMaCXVzLXdlc3QtMiJIMEYCIQCLhRwLBrAhOyTQ1fwpO8iYUHfJxPvB%2FV6y5YKAMbYo1gIhAP3SN3EHnjy%2FgZrrdYyGWgwHntUtPkSj3g9kx2FgBq38KogECNz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxLuiXU2IbE6ohEaiMq3ANnV%2BHUgkwSZgVS%2B704emh7HNjB%2BH3vh27mOoWsQtyGjSmyFINSgLIcu4hJE0jHii%2BwMDvL3OXlkLZ151HAhYY8HkUk2D1LwjweZ6XSmXx6n%2BoHCl2yEy14bNX5vFxSiKoisAB19%2BUm2N0Ck48mILyUPRuQh7mJ44wee3yVaZylKT%2FN%2BtGQxaw5uA3dgSqPw%2BYeyFJDu8MPsf0WDB0Iw7Yhg6vt007DyVs3GjyTNJj9rfvi%2FVV4pBH15fCuopEYxWaOvnHvuT%2Fn5c9YE1Pkgq56JKcn3m6%2BrKaZZwBz%2BOQxVrB%2FaV0QY8kokUk%2BQ0Iw2kd2ri1TT7BNImhrU4WMsjPeUsPSQ10NUi%2B4ar6JR1EDdmSE1QX1zVr%2Bbvm6VGxCWsmFtlkL94YM6vRkjb6rj0yEOgdRzx1KNW7pJEkkd1x%2BiIF%2BZW0uldinmj24yzeNDwXg7h1%2FMjaLyivR9bSSw5PiONABsstge%2FQGIJ4WP%2FWargEcrutO%2FFbf6Sn5HAE0aBa86XP%2Bmd6mLM0bq00NETC4ib2NBzDjs%2BixoG4siO27Ro%2BDeS3aUMmIwgtLUvOIvadIfLX%2BRgGKNARku1AW3t%2FA%2FGMwWedyB%2FR1R8vj36v4wRTrU0Jd1%2BOJMbvbhzDuutvRBjqkAanzqceiOHxwgb1IGLv9r2xqWc0jXydP5T3QvDVvfMvgcH6fZluJnexQAUCHou60barpcRm2TdTGlYHsd%2BaJ8yumOvvwEmO19PFDOmHwIf1Et5b%2Bi6aceErhGd8j6mIRGcS6Ox5eBFLjJEdpd4TBYD9l6tSwuLAdt1cLFLtIyS9rIkcnLSVIrZZo0qcbSNXRXcsJi%2F6j0%2FgYvYuH7iA8CS1XNekL&X-Amz-Signature=9c980b12bbb848e2caf8e16ae65c84d3a1a332b1a8b7871a2f736b41f5dd0a7e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4CWAQ6S%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T190748Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBMaCXVzLXdlc3QtMiJIMEYCIQCLhRwLBrAhOyTQ1fwpO8iYUHfJxPvB%2FV6y5YKAMbYo1gIhAP3SN3EHnjy%2FgZrrdYyGWgwHntUtPkSj3g9kx2FgBq38KogECNz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxLuiXU2IbE6ohEaiMq3ANnV%2BHUgkwSZgVS%2B704emh7HNjB%2BH3vh27mOoWsQtyGjSmyFINSgLIcu4hJE0jHii%2BwMDvL3OXlkLZ151HAhYY8HkUk2D1LwjweZ6XSmXx6n%2BoHCl2yEy14bNX5vFxSiKoisAB19%2BUm2N0Ck48mILyUPRuQh7mJ44wee3yVaZylKT%2FN%2BtGQxaw5uA3dgSqPw%2BYeyFJDu8MPsf0WDB0Iw7Yhg6vt007DyVs3GjyTNJj9rfvi%2FVV4pBH15fCuopEYxWaOvnHvuT%2Fn5c9YE1Pkgq56JKcn3m6%2BrKaZZwBz%2BOQxVrB%2FaV0QY8kokUk%2BQ0Iw2kd2ri1TT7BNImhrU4WMsjPeUsPSQ10NUi%2B4ar6JR1EDdmSE1QX1zVr%2Bbvm6VGxCWsmFtlkL94YM6vRkjb6rj0yEOgdRzx1KNW7pJEkkd1x%2BiIF%2BZW0uldinmj24yzeNDwXg7h1%2FMjaLyivR9bSSw5PiONABsstge%2FQGIJ4WP%2FWargEcrutO%2FFbf6Sn5HAE0aBa86XP%2Bmd6mLM0bq00NETC4ib2NBzDjs%2BixoG4siO27Ro%2BDeS3aUMmIwgtLUvOIvadIfLX%2BRgGKNARku1AW3t%2FA%2FGMwWedyB%2FR1R8vj36v4wRTrU0Jd1%2BOJMbvbhzDuutvRBjqkAanzqceiOHxwgb1IGLv9r2xqWc0jXydP5T3QvDVvfMvgcH6fZluJnexQAUCHou60barpcRm2TdTGlYHsd%2BaJ8yumOvvwEmO19PFDOmHwIf1Et5b%2Bi6aceErhGd8j6mIRGcS6Ox5eBFLjJEdpd4TBYD9l6tSwuLAdt1cLFLtIyS9rIkcnLSVIrZZo0qcbSNXRXcsJi%2F6j0%2FgYvYuH7iA8CS1XNekL&X-Amz-Signature=fd9b73b59eba43f389f4d2ebc9387c68d70f1196da14f4b2fd64c942d84c9605&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
