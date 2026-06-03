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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SP2WZFOY%2F20260603%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260603T024443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJIMEYCIQC%2Flwxtq3pH%2BmX2yPERIPz0Y%2FTKoGT86%2BO7zu%2BDyR4MMAIhANYabgIQyPF%2FClX2OdNRpo68Zck21NsY5KiFsbC2BXhgKv8DCDMQABoMNjM3NDIzMTgzODA1IgweaPlZsD4G22TET1wq3ANoiNQdwvZuFF7aqbAq8PBhzHaGhSBmK4dgri56sqCpa26oe5NhqZwOwpej72xYEahZ7RQqtgJr%2FitMF6Nvl1ZduQ%2FddhEJCcILoJ6ZzPVkHwOC7wRZ1FZLdcqXMcZqqY7THnuaYmtkuYTTuT7Knvtdlq%2FYdQWa6m%2BFpRyFBOYa5kG%2FGbTBDCoK3W2znbxZXMzVtEsnz%2BiCgSR6GXDreMKA%2FMJEIG9%2FNH5oT7xqo3TqZUNsmEvOHVNh3glq6IF%2FXk%2FhK1Oe9nhYjUCirNRdXOtI2JrfJ4vSA%2BYD5bsi98wdLs4ztUHoqlfNRqFn%2FHB4sSCfq%2Fi%2FK7c05ZPjiQXvSrF55kqBgSOtIk77Jsj3rjc7CodIeBl3LEGt8qlFCwBd2B5ln%2FtTRN0uW7rbHCSQM29iB61%2FtAleKxdCs6TgIJMIrWeW%2BNitoNyrvLY57RnL%2BgT3ul%2BC96fcPPUvgd%2BxAXbchNWkhalFE3HZ9B%2Bp7fGKassyxuNjuzorf8YhA8vKvlX2%2FFrk3m3VPG6L7rD6rt5ldMDKqwItFhjiwJKOgg19ndjEJsgTybCDTYjjqixgws%2B4W7L8ok%2FXuGz%2Fr7K4nb0D14ZjMactGvfN%2Fwr4%2FUPQF2GFhLcLuF%2B%2BFalTaTDxmf7QBjqkAfkBDnGS65D8xgAeZOZj8kCZTnAM0gZFpdeUOubx3ph3FUtlAg4X%2B1qGHCFw%2FyRK1NldEodaJbC%2FckEuR9BN%2FQgoah%2FGhhLsLAMHQvAapD0kfNbdp9WJpSWkEiR4Ir%2FjSTIhXEFGhpRe33FgpjlPb81f%2FEEbySljaLUVBeprympf3riD9whH3ntbPF%2FGel9CVXpbCH7Gra3Je9Y24BwRy79DjYkY&X-Amz-Signature=b737e944d74a2fe4d45029261f48b2599a3631990b4a94d9c31567a2b4af18ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SP2WZFOY%2F20260603%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260603T024443Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJIMEYCIQC%2Flwxtq3pH%2BmX2yPERIPz0Y%2FTKoGT86%2BO7zu%2BDyR4MMAIhANYabgIQyPF%2FClX2OdNRpo68Zck21NsY5KiFsbC2BXhgKv8DCDMQABoMNjM3NDIzMTgzODA1IgweaPlZsD4G22TET1wq3ANoiNQdwvZuFF7aqbAq8PBhzHaGhSBmK4dgri56sqCpa26oe5NhqZwOwpej72xYEahZ7RQqtgJr%2FitMF6Nvl1ZduQ%2FddhEJCcILoJ6ZzPVkHwOC7wRZ1FZLdcqXMcZqqY7THnuaYmtkuYTTuT7Knvtdlq%2FYdQWa6m%2BFpRyFBOYa5kG%2FGbTBDCoK3W2znbxZXMzVtEsnz%2BiCgSR6GXDreMKA%2FMJEIG9%2FNH5oT7xqo3TqZUNsmEvOHVNh3glq6IF%2FXk%2FhK1Oe9nhYjUCirNRdXOtI2JrfJ4vSA%2BYD5bsi98wdLs4ztUHoqlfNRqFn%2FHB4sSCfq%2Fi%2FK7c05ZPjiQXvSrF55kqBgSOtIk77Jsj3rjc7CodIeBl3LEGt8qlFCwBd2B5ln%2FtTRN0uW7rbHCSQM29iB61%2FtAleKxdCs6TgIJMIrWeW%2BNitoNyrvLY57RnL%2BgT3ul%2BC96fcPPUvgd%2BxAXbchNWkhalFE3HZ9B%2Bp7fGKassyxuNjuzorf8YhA8vKvlX2%2FFrk3m3VPG6L7rD6rt5ldMDKqwItFhjiwJKOgg19ndjEJsgTybCDTYjjqixgws%2B4W7L8ok%2FXuGz%2Fr7K4nb0D14ZjMactGvfN%2Fwr4%2FUPQF2GFhLcLuF%2B%2BFalTaTDxmf7QBjqkAfkBDnGS65D8xgAeZOZj8kCZTnAM0gZFpdeUOubx3ph3FUtlAg4X%2B1qGHCFw%2FyRK1NldEodaJbC%2FckEuR9BN%2FQgoah%2FGhhLsLAMHQvAapD0kfNbdp9WJpSWkEiR4Ir%2FjSTIhXEFGhpRe33FgpjlPb81f%2FEEbySljaLUVBeprympf3riD9whH3ntbPF%2FGel9CVXpbCH7Gra3Je9Y24BwRy79DjYkY&X-Amz-Signature=3290411c0d0fd838172de56ac9816195ec2a28be438caf4076639af27fec6733&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
