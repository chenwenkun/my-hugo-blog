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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E67TEIP%2F20260404%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260404T064647Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDd%2B0enMlggrYvqThcTSp%2FBVEOOqmIdUhjREFagqGpwpwIgGeZ%2FPgTPvhQtcRQzc11coIF5%2FmfjdEQjZvm3aSX83j8qiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOD9FrJCfwrTrCwy4CrcAyjH3cGeUUsV4LVbsoHCa3Vrre6bUfTGIMyxI%2BszYThn8TWU2rVMQu8nXjr%2BDHRSl2dCnjwnQalBHx5VKotaWWiR5R9dFfVPMr4raM12ZXkbMbg6poORMR1Y4UuLRPIswYjDwxlsMR055l0esgHq3BQP3txoJ5RUJv6ANPQ77lNZmqbXk%2BtAZnZUhgJFRyUulppUZQw%2B0DFY5tS%2B35ft9K4yCK5ZbiXqKRFdnJGgBIR8eOUEtDkbtX9%2FWjVjLue4cdNmRqhnOIqRMI6OFvI3aUr5SfrxnWPOrfJDKOLrmyZ%2BS5gSwqh4IY6U%2Fetzak0pS%2BWe2kzt68g613n26sirKu%2FtiF95OqZKwC0MFGwgbi3vPqZsEmouZvBDYZbuPtsW8BSnnw3azO3HVKIhtMCjMI1PngjR16RLLNyrDQdy6wO%2FjAkQpDWjBbmX2kQTOPMR6dD1Jy8XAljcSuUDRmuJnA5LsIhkH6e0XtB4NADQX%2FwYljpGHXynn%2F%2FLltfftYGQLWyc3lhz7cUw%2B8XBh08UmzqgRd00qBaQlWqEXrrLn%2FnACKvyF02%2FwcTnE%2FL4xZ56nPoQ2RLkM75%2BuShhLkfEYfTuc%2BwbjAVr4ZxV4mrIYuoEUZLOuFu6cP%2B0G9OaMN%2B5ws4GOqUBfr2h6XoJ3ocU8bX35uxKsxvIbjFrsy%2BjGHqpCnikLybD1RpsC4ftq0Ze43GkbjX1r%2BhlBOvmdapqElSAPi4hoZCkCY2zGhVjLFNsdLU91saX60etrHt9frVRMa%2FJ5khAT0Ed%2BmntuQFVQZntK8%2FoHZZHjh0REoUbNKlpANbJKAlWe3MUNFNajlkn0nqZ89mSrPSh%2BKtiflCjgG3REheJaopYYXMr&X-Amz-Signature=2a737ad837169b229ccbd470bc3063b04c78829acfbd46d4ab01478f8e04aa49&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E67TEIP%2F20260404%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260404T064647Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDd%2B0enMlggrYvqThcTSp%2FBVEOOqmIdUhjREFagqGpwpwIgGeZ%2FPgTPvhQtcRQzc11coIF5%2FmfjdEQjZvm3aSX83j8qiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOD9FrJCfwrTrCwy4CrcAyjH3cGeUUsV4LVbsoHCa3Vrre6bUfTGIMyxI%2BszYThn8TWU2rVMQu8nXjr%2BDHRSl2dCnjwnQalBHx5VKotaWWiR5R9dFfVPMr4raM12ZXkbMbg6poORMR1Y4UuLRPIswYjDwxlsMR055l0esgHq3BQP3txoJ5RUJv6ANPQ77lNZmqbXk%2BtAZnZUhgJFRyUulppUZQw%2B0DFY5tS%2B35ft9K4yCK5ZbiXqKRFdnJGgBIR8eOUEtDkbtX9%2FWjVjLue4cdNmRqhnOIqRMI6OFvI3aUr5SfrxnWPOrfJDKOLrmyZ%2BS5gSwqh4IY6U%2Fetzak0pS%2BWe2kzt68g613n26sirKu%2FtiF95OqZKwC0MFGwgbi3vPqZsEmouZvBDYZbuPtsW8BSnnw3azO3HVKIhtMCjMI1PngjR16RLLNyrDQdy6wO%2FjAkQpDWjBbmX2kQTOPMR6dD1Jy8XAljcSuUDRmuJnA5LsIhkH6e0XtB4NADQX%2FwYljpGHXynn%2F%2FLltfftYGQLWyc3lhz7cUw%2B8XBh08UmzqgRd00qBaQlWqEXrrLn%2FnACKvyF02%2FwcTnE%2FL4xZ56nPoQ2RLkM75%2BuShhLkfEYfTuc%2BwbjAVr4ZxV4mrIYuoEUZLOuFu6cP%2B0G9OaMN%2B5ws4GOqUBfr2h6XoJ3ocU8bX35uxKsxvIbjFrsy%2BjGHqpCnikLybD1RpsC4ftq0Ze43GkbjX1r%2BhlBOvmdapqElSAPi4hoZCkCY2zGhVjLFNsdLU91saX60etrHt9frVRMa%2FJ5khAT0Ed%2BmntuQFVQZntK8%2FoHZZHjh0REoUbNKlpANbJKAlWe3MUNFNajlkn0nqZ89mSrPSh%2BKtiflCjgG3REheJaopYYXMr&X-Amz-Signature=8e14a7d6fcccd14d70bd64e3ae3b08f31a5fb3e55d6431cffcc1305ecf0d1b0b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
