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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46626XFQGKM%2F20251028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251028T181706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQCMJjNv6YOPBkAV%2Fc9xQARLwZSGz1d%2Bk5dwg6n1Aa%2FzBAIgUY7w1mMx1uQi4IXv%2BGGgtGdmzV6sTTCS%2BCWMQZC8M8EqiAQIw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGPF4Fk4yLWRAsn5PCrcA43PZnW%2FL4Num8fENTL%2BSYSK%2FH54gaflb5U9QsgbiwasqPXQm1swRN5MH1hYhIOaf6W1GiuEsHKkyajo6ZaJy7C49rBh%2B0bphqPTA4lNMJ9x%2Bgl3e%2FmAMJ1ivr7r%2FqJ2Q8aiebaZJw6msWIgyJ0Yel%2FENIuYHtEV%2FoiAyMTW5NgHXWBGLJzQWxfVjfGhLF%2BV4Ca6ZBw6Q5SxBpvffwhe2EpIPpj5OJEOa%2F7%2B8%2FRYGhwCQA0fsOiOR7J%2BZ5nM3BBN%2Btp6C5LyY51pOKvsfnStcQ%2B8MgeV4fFDzIkwaU7euix%2Fvqjc9ajoAlTVpzhEOO1HggsSEzd8PEQFigrrtCBANHaVb2oU95i%2Bqq2Ly1K%2Fz8icuLKPJwQharKFtcYduRU92Z6t2xBGtI71XEy9JTYc7bGEUGcd9uPDv0mGKFrCOQvSMqSPcx8ofm5btWt%2FKCgtmDdi3AonuFQuD5l9N708L9uqf4snDGX2DNZNaE7BUTB8yHe9dO3OydPZG2YhnGUDNn73vU9tEbOQdlPSuhZSxBy5sbLXoOOWLs1DXUtTUrIgC4qbkW1aIDXFpJUUnTazDcZgRXE8odYCQrSmGSu2KoOTGGGBAB3I4EvXlFbOdzV6PoL%2BtpaccghT%2BXSWMIqPhMgGOqUBmb5pCuik0oYKl%2FQx0NJKRneiZSB2sqBVqOEDegH%2BoCTiO%2B56k8JVYSwUDXkNhk9EqrEvlsd8Yc8BrBGDRzJoB%2FB39hdHd1ypmb%2FHKQEx53BAAXkxTPlvsDQzxY7NQ2q0U41acUyWfKd6%2FeaOXpebx6%2F1IyhISBY%2BALEptdNy4qVj4wrEbAHUUf60F4H9K3MTHKRck3Qv%2BTzCs4dmIf0nXxGBoXBv&X-Amz-Signature=a1ff05e6a1d102a6bf3b620fdd04e974edb6100522d0a7ba7d6c327f214f8cb7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46626XFQGKM%2F20251028%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251028T181706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQCMJjNv6YOPBkAV%2Fc9xQARLwZSGz1d%2Bk5dwg6n1Aa%2FzBAIgUY7w1mMx1uQi4IXv%2BGGgtGdmzV6sTTCS%2BCWMQZC8M8EqiAQIw%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGPF4Fk4yLWRAsn5PCrcA43PZnW%2FL4Num8fENTL%2BSYSK%2FH54gaflb5U9QsgbiwasqPXQm1swRN5MH1hYhIOaf6W1GiuEsHKkyajo6ZaJy7C49rBh%2B0bphqPTA4lNMJ9x%2Bgl3e%2FmAMJ1ivr7r%2FqJ2Q8aiebaZJw6msWIgyJ0Yel%2FENIuYHtEV%2FoiAyMTW5NgHXWBGLJzQWxfVjfGhLF%2BV4Ca6ZBw6Q5SxBpvffwhe2EpIPpj5OJEOa%2F7%2B8%2FRYGhwCQA0fsOiOR7J%2BZ5nM3BBN%2Btp6C5LyY51pOKvsfnStcQ%2B8MgeV4fFDzIkwaU7euix%2Fvqjc9ajoAlTVpzhEOO1HggsSEzd8PEQFigrrtCBANHaVb2oU95i%2Bqq2Ly1K%2Fz8icuLKPJwQharKFtcYduRU92Z6t2xBGtI71XEy9JTYc7bGEUGcd9uPDv0mGKFrCOQvSMqSPcx8ofm5btWt%2FKCgtmDdi3AonuFQuD5l9N708L9uqf4snDGX2DNZNaE7BUTB8yHe9dO3OydPZG2YhnGUDNn73vU9tEbOQdlPSuhZSxBy5sbLXoOOWLs1DXUtTUrIgC4qbkW1aIDXFpJUUnTazDcZgRXE8odYCQrSmGSu2KoOTGGGBAB3I4EvXlFbOdzV6PoL%2BtpaccghT%2BXSWMIqPhMgGOqUBmb5pCuik0oYKl%2FQx0NJKRneiZSB2sqBVqOEDegH%2BoCTiO%2B56k8JVYSwUDXkNhk9EqrEvlsd8Yc8BrBGDRzJoB%2FB39hdHd1ypmb%2FHKQEx53BAAXkxTPlvsDQzxY7NQ2q0U41acUyWfKd6%2FeaOXpebx6%2F1IyhISBY%2BALEptdNy4qVj4wrEbAHUUf60F4H9K3MTHKRck3Qv%2BTzCs4dmIf0nXxGBoXBv&X-Amz-Signature=4b13c11a483b068352dfe5207f1530a82068312240fc99b38a0bb73eb3601629&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
