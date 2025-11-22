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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YE3NCZLK%2F20251122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251122T181435Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJGMEQCIGnNbdsMITEzPVfzMoaj8VvcglrggP0XJRbHfrDpoBbWAiA%2B6BKjJSxFPL5GndwBM0V3ynqL8e6LrqdntaKkDl3hyir%2FAwgrEAAaDDYzNzQyMzE4MzgwNSIMOaK7l86lXiSytASgKtwDZgINkDCfMBGlPKM%2B3zEZNtE%2F9L3kCa72nPdg4ljqbGOT22jW1XVlWOKA%2FKkvDU7U2zixokwTeGckibRUsBcbd1%2FxNDVEjj0Pt68hqhO0YQeh%2BxC7NUjuW5xCyB%2BAAvCWHqxy95eWdojlZKZvLbyRTuj560xICMvj%2FDqovNCVbtdNAenCmYC62Uu0I69%2FEbQz1w8FMm%2FJBP05488TXensid%2FEHrFLhX5q%2F6c13MnsQdxOFWR4qE2gm9mih%2FYknc54ilACHOJKHAxi07S6GCw5LHPvF0fGjnIQ8vrew3IMnd8aF4OYMCEHdGnkQdsDzDi0XszZeruuRM9cW15Ny4qgbtYbgZ71lx4Xp5MK0UsQ0FgfUE03LtW%2F7GuD2yrJXGHFnOozTrCjMAr%2FU5b16kg9kx4dk1FCgPLxluLtTGN1V48wsCeNJ%2BLAXmiKx7vhQUUeZORNZ8e5Q8QCJ3qwJ3G2ZZaOitFF379ds64k%2FG%2BzKlRqxOq5pIJci2N9zRWIQPQLfSOmbsHewDv9obxb%2BwnoEaU158Q5wxSwhVWv6Xr2PgjSGkaIEWc1kRq9AKqsjxqz8ezCFy2cAvEt44WmMBUJHeElyawxqpadrhYZPR0x8YYz4YviaYbkDwtRwkIwlfaHyQY6pgHEnMMU1kQDAsfK1qo%2FPCOxVow7LkklXZlWyn0Qx4G3WMr7P8WLG4tww6poCvlLtNkD%2FX1MdIwAditK6rar4W%2F7x%2BZDuS681b1wRDd0ZvXuuw2SvbkKJjV2rQl%2BNipyOmRmHhXIFFC%2B4%2B1TmKXMgx7YWDyGqO6qIRuKeWOTH%2BTktb5oabt0sLoCA4DHBcKgKHUFEYwaOuWs7K2H90rKCcT1OQcA%2BiUr&X-Amz-Signature=2c28fc312c31b0f508a86509efed75edc1ad0e81d8affa64b99e5d4b26771c71&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YE3NCZLK%2F20251122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251122T181435Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJGMEQCIGnNbdsMITEzPVfzMoaj8VvcglrggP0XJRbHfrDpoBbWAiA%2B6BKjJSxFPL5GndwBM0V3ynqL8e6LrqdntaKkDl3hyir%2FAwgrEAAaDDYzNzQyMzE4MzgwNSIMOaK7l86lXiSytASgKtwDZgINkDCfMBGlPKM%2B3zEZNtE%2F9L3kCa72nPdg4ljqbGOT22jW1XVlWOKA%2FKkvDU7U2zixokwTeGckibRUsBcbd1%2FxNDVEjj0Pt68hqhO0YQeh%2BxC7NUjuW5xCyB%2BAAvCWHqxy95eWdojlZKZvLbyRTuj560xICMvj%2FDqovNCVbtdNAenCmYC62Uu0I69%2FEbQz1w8FMm%2FJBP05488TXensid%2FEHrFLhX5q%2F6c13MnsQdxOFWR4qE2gm9mih%2FYknc54ilACHOJKHAxi07S6GCw5LHPvF0fGjnIQ8vrew3IMnd8aF4OYMCEHdGnkQdsDzDi0XszZeruuRM9cW15Ny4qgbtYbgZ71lx4Xp5MK0UsQ0FgfUE03LtW%2F7GuD2yrJXGHFnOozTrCjMAr%2FU5b16kg9kx4dk1FCgPLxluLtTGN1V48wsCeNJ%2BLAXmiKx7vhQUUeZORNZ8e5Q8QCJ3qwJ3G2ZZaOitFF379ds64k%2FG%2BzKlRqxOq5pIJci2N9zRWIQPQLfSOmbsHewDv9obxb%2BwnoEaU158Q5wxSwhVWv6Xr2PgjSGkaIEWc1kRq9AKqsjxqz8ezCFy2cAvEt44WmMBUJHeElyawxqpadrhYZPR0x8YYz4YviaYbkDwtRwkIwlfaHyQY6pgHEnMMU1kQDAsfK1qo%2FPCOxVow7LkklXZlWyn0Qx4G3WMr7P8WLG4tww6poCvlLtNkD%2FX1MdIwAditK6rar4W%2F7x%2BZDuS681b1wRDd0ZvXuuw2SvbkKJjV2rQl%2BNipyOmRmHhXIFFC%2B4%2B1TmKXMgx7YWDyGqO6qIRuKeWOTH%2BTktb5oabt0sLoCA4DHBcKgKHUFEYwaOuWs7K2H90rKCcT1OQcA%2BiUr&X-Amz-Signature=1a56e1618e27a9bb4bd9249c83fb350585c92b9e88fd86fd970e5cafdc792730&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
