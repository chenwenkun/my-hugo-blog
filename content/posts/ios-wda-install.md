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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEH6EGVR%2F20260510%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260510T125324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJIMEYCIQCffUCIG0t0LUmISfhmEiqCX4dPvfLE3Me2Q3B5NfprvQIhAIh%2Fupz4T1FFAZPtT3QXTgMp%2B%2B7bTei3pNfrnvOx%2FJ0lKogECPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyfDxPWOOaZt%2Fex47Iq3APaFIX0uFpqPlbR7WIVL%2BomhZJPHpvNCZv8BV7jir1y6ez%2FfqRLhLj5I1wC%2BLL1HgXPH0yfoSghoHptAan5f1XQJwJGzLkvlOI7NeA8Jc0kT7JBPLVzaXycUrKFrTAv8pL%2FLPWp078ZJ2jkOVbzWiER7zW0J3zV8nSxR%2Bb40lcx0QVDPIH3lb7R6hpwJRuxUBlLbogIOR3juCvj6m2qNJh6Mu7ZA1jr4coy%2BV3DE1X7GF0avP3IisRpDH%2FDj68EhWqiyteyYJGEiUP%2BFeUdcc3d6z%2FvlDMRJVA3IhEc8ENoD1VQxokY871y7wscREgk8q23pZeoaXjGvGKCdooP0ery3QxmyuT3ZVoQO2Ri3bdXk%2B4NVo37LpCZua%2FoeaLq4jjcfcwQVn1TIftnhh79RRhUK3HDx4cCdxxEjhDuPdxyhZiOeON2COSKC0xU1TS3TFVMS6iFK64WPh1O0zZ58552j1W871FIuWbDFTnXOu7EO1RoFsdHN8J69AS37IMwQ1ec0Dn2envrqeSiiK988qYBhKHOszjhjPGkMSdWcI0OXvFKyuhjSJZkfg8Fa866smn5EVeVqFNy0IpmB%2F7zja2Y3g%2BuPptNDKf5d%2BvhXpZvyT%2FqDi84YeXFp3cKcTCwsYHQBjqkAZEgtP1Q7VjzoIebXy6Urln1tY%2FpPK%2FEZ5UmWslkaCb4RV9wAItMUDNjskwlh%2Fb66fcHLkOtbHiKclBB9CoLWnjQYgOKnG6ckYwk9RcvKcXHanpH7azkwcmjLv6Fi0vMpU0tfSsZqribwbEU1jYHwMstzcFyF4TTHh62LLDLiU1zsa2cHKPMuAkUAPpJRiD4q7A98WUFCu5W8%2BfNWyLqIfFSPych&X-Amz-Signature=01b9c0df0ed823b23cba4d1aaf5f858ade02884f6837fbd38479e64550f1f787&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEH6EGVR%2F20260510%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260510T125324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDIaCXVzLXdlc3QtMiJIMEYCIQCffUCIG0t0LUmISfhmEiqCX4dPvfLE3Me2Q3B5NfprvQIhAIh%2Fupz4T1FFAZPtT3QXTgMp%2B%2B7bTei3pNfrnvOx%2FJ0lKogECPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyfDxPWOOaZt%2Fex47Iq3APaFIX0uFpqPlbR7WIVL%2BomhZJPHpvNCZv8BV7jir1y6ez%2FfqRLhLj5I1wC%2BLL1HgXPH0yfoSghoHptAan5f1XQJwJGzLkvlOI7NeA8Jc0kT7JBPLVzaXycUrKFrTAv8pL%2FLPWp078ZJ2jkOVbzWiER7zW0J3zV8nSxR%2Bb40lcx0QVDPIH3lb7R6hpwJRuxUBlLbogIOR3juCvj6m2qNJh6Mu7ZA1jr4coy%2BV3DE1X7GF0avP3IisRpDH%2FDj68EhWqiyteyYJGEiUP%2BFeUdcc3d6z%2FvlDMRJVA3IhEc8ENoD1VQxokY871y7wscREgk8q23pZeoaXjGvGKCdooP0ery3QxmyuT3ZVoQO2Ri3bdXk%2B4NVo37LpCZua%2FoeaLq4jjcfcwQVn1TIftnhh79RRhUK3HDx4cCdxxEjhDuPdxyhZiOeON2COSKC0xU1TS3TFVMS6iFK64WPh1O0zZ58552j1W871FIuWbDFTnXOu7EO1RoFsdHN8J69AS37IMwQ1ec0Dn2envrqeSiiK988qYBhKHOszjhjPGkMSdWcI0OXvFKyuhjSJZkfg8Fa866smn5EVeVqFNy0IpmB%2F7zja2Y3g%2BuPptNDKf5d%2BvhXpZvyT%2FqDi84YeXFp3cKcTCwsYHQBjqkAZEgtP1Q7VjzoIebXy6Urln1tY%2FpPK%2FEZ5UmWslkaCb4RV9wAItMUDNjskwlh%2Fb66fcHLkOtbHiKclBB9CoLWnjQYgOKnG6ckYwk9RcvKcXHanpH7azkwcmjLv6Fi0vMpU0tfSsZqribwbEU1jYHwMstzcFyF4TTHh62LLDLiU1zsa2cHKPMuAkUAPpJRiD4q7A98WUFCu5W8%2BfNWyLqIfFSPych&X-Amz-Signature=70a36b6d9e205edd89acc03d257324faabf1515d2abfe34ae253ae6de22e120a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
