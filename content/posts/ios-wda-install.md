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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46656UWEGA5%2F20260521%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260521T194152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIF1lx6vvie%2FMCR10VVapPi3Ly7cxzgss1qeTuQWUwL%2BDAiEAgyhDT6VuEN8yv%2FtSxSrcYFzds4xmTv8BibYvLcfbazgq%2FwMIDBAAGgw2Mzc0MjMxODM4MDUiDF%2FHcEKx%2F7looXI1uCrcA9dQu4vIRM5mqezPNoBj7%2BUq5MTlzMplPJrFGgo3gZnplUcPi8BwQXyahexg1np0OSp8maAbz%2FpE067hKcwOrR3cMGJucSwFJMU%2FUu2xYZ36mX%2B%2FWyeU%2BgHMUMkye44kYZ6Kgjz9bDy95eb39jX3VXWU1xPktzZiqd5L%2FfWwNkuz%2FARphprcEKlgYVAn6MOQvYewKkC6MYcidpkCeeCTafF0uUVy9HAg4Ikt322pxsK2jSi1h32Uyqh4jcsiHtALWcRwGDFoE02%2FJSIoKzHJsCKWeMuW5Uv33aVzK9DN0lMRrBRVIdmTcUp%2FQPvCFrHaN3kyVLZEONUr2rERYI4PwkJ0gtIQesBGSKPbe2nEeRzyk%2B1986pDQoD7OuLuGITgY%2FlnlimcEa6m7YcmWX2RLyG0JKwb2RV7MupXO7NhqhKxr9U9Lkhc3Kwj5JouimiPus7d4aUNXv%2Bm031enyiyTBwc3F9GzVv9MdEtX99xZLcrt4Gh%2Bm%2FPcBCrsKjDid%2BpHKzAdtEaeRl0tF1OHv5D%2FxgMrkAV%2Flt0o0gspv9Xed%2BQijhqHgsLyHJl5PWGqpqU7GwqFlpyfRBHBV7omYRfFKnhaTfC4IHFeAJPk1BLwwiNgsCVbQy5u34b38ZdMKSjvdAGOqUBfVrxg4b5DA8cBzmMYxzl5dNACJKD9AbuVq1DH5%2BL3T9yX4N4cfn6sSpDrOx9a6nyChDgtJo4tj6LykpG7mq6JvjJl6aVl9s8byzJa62OCWOQKzj4VF%2BltG0AnRkJfPTXhVC3qOGT%2FmLGifaJ77AD8FMY4ulxCEX8AK3HlBhjkEbc2o7MY7khoZAMEayTyNO87VWG3sTwmzn4x3hAlSRJMX%2FUf9%2F9&X-Amz-Signature=21e9e2819e932489c42a217f575e882f41a1bfc53756151bdb6374ca76ad31de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46656UWEGA5%2F20260521%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260521T194152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIF1lx6vvie%2FMCR10VVapPi3Ly7cxzgss1qeTuQWUwL%2BDAiEAgyhDT6VuEN8yv%2FtSxSrcYFzds4xmTv8BibYvLcfbazgq%2FwMIDBAAGgw2Mzc0MjMxODM4MDUiDF%2FHcEKx%2F7looXI1uCrcA9dQu4vIRM5mqezPNoBj7%2BUq5MTlzMplPJrFGgo3gZnplUcPi8BwQXyahexg1np0OSp8maAbz%2FpE067hKcwOrR3cMGJucSwFJMU%2FUu2xYZ36mX%2B%2FWyeU%2BgHMUMkye44kYZ6Kgjz9bDy95eb39jX3VXWU1xPktzZiqd5L%2FfWwNkuz%2FARphprcEKlgYVAn6MOQvYewKkC6MYcidpkCeeCTafF0uUVy9HAg4Ikt322pxsK2jSi1h32Uyqh4jcsiHtALWcRwGDFoE02%2FJSIoKzHJsCKWeMuW5Uv33aVzK9DN0lMRrBRVIdmTcUp%2FQPvCFrHaN3kyVLZEONUr2rERYI4PwkJ0gtIQesBGSKPbe2nEeRzyk%2B1986pDQoD7OuLuGITgY%2FlnlimcEa6m7YcmWX2RLyG0JKwb2RV7MupXO7NhqhKxr9U9Lkhc3Kwj5JouimiPus7d4aUNXv%2Bm031enyiyTBwc3F9GzVv9MdEtX99xZLcrt4Gh%2Bm%2FPcBCrsKjDid%2BpHKzAdtEaeRl0tF1OHv5D%2FxgMrkAV%2Flt0o0gspv9Xed%2BQijhqHgsLyHJl5PWGqpqU7GwqFlpyfRBHBV7omYRfFKnhaTfC4IHFeAJPk1BLwwiNgsCVbQy5u34b38ZdMKSjvdAGOqUBfVrxg4b5DA8cBzmMYxzl5dNACJKD9AbuVq1DH5%2BL3T9yX4N4cfn6sSpDrOx9a6nyChDgtJo4tj6LykpG7mq6JvjJl6aVl9s8byzJa62OCWOQKzj4VF%2BltG0AnRkJfPTXhVC3qOGT%2FmLGifaJ77AD8FMY4ulxCEX8AK3HlBhjkEbc2o7MY7khoZAMEayTyNO87VWG3sTwmzn4x3hAlSRJMX%2FUf9%2F9&X-Amz-Signature=c96997d876cf6081c02bac08fa9e9929edc0a57b25b6e1c258c034480bbde817&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
