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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667TZ2VNM6%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T162626Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCIQCc9wWMuxGGQ5s%2Bj11Ge00dZI406o5hNX4dHW%2BG1X7NawIgaOFQLve3FwR3qkNhw7p1PVoXH2RWWZae7uVa%2FpwM91sq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDHn%2FzmP2dJwSsyeL6ircA18BeO4Tj81Pu3XJRKKNYRRwCGB%2BV2OLyXROCPNkvxgsZUpcSmVamKXAjTVBmHpLvv03%2FNAngzJNA7tKGF%2FSkMJIXbfKqfDudg41AwQRozraXU%2FDIdGhoJ5SEt2IOEdfBx20s3a%2FE7aofylZwlljm8G24Mcd4XTAQN9h9552bzuIcnm0xEUslzehA9Uf4w7aiN8LfzC%2BFN9Jdlwct1llnNV7nZA%2FU9RYoHUo3u%2BzwIRa0RdIoQI1x7Qh7Zcc7DdP0U2MYW4KINkFh3MN512JwMTcfC7PfBzJiVzATLE7CjuW6BtpNx%2FdpQZfESJ57fJTUfpRMRSsbDzAH%2BY8DhMliG5e39qSTXEbP%2By91sTD4SNy0JPJzPtk2fHnPb2MZFJo3H14B35JW7cRv528o93LsausK2pOERSyAAUD%2BkGI4wDMK9Ewq7QYSqsViXYNkKPsyM7zYK%2BKI4vYVvlzEaZm18Hm%2FBmgAHs5iG7dYHfePQMZXN1%2Bp66Vz%2FZKK%2BSbpSGrZpUo2k2FlIOXrvAghH9gHfvtwz4mZlNhjU5jciRHgtmMH5pQSm803YI1Bw18qFco3aUMCQ%2FeP7Re0a62Hp4nEE6r88JXjCQ7sKfPG5USY%2B4%2FlbG2GrigV%2F%2BSx5kjMOS45dEGOqUBaztXpIF6mNVS0KIsjcj1H3Gj%2BC8K9c90uZqBTon6u9caXJTA1zlxcLvN7i8CaQswPr72rj2s6DHDML30r39Kvm1HLnptnaTud%2FYVpSjQ1Q6TLsOfC7h9vliLUHItyy%2BuHh2qgnwHls8pLwxwhE0vi5IC3b77uG5nbrxTzKTevR%2B1jDozhiOZyqm6rNujqpFKUO6uTM6yENRoXQvJom7bnpinp1cr&X-Amz-Signature=6483b81245767eb5d779558dc5d1662469cfc6b6fa9aab3d994963e11901c9fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667TZ2VNM6%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T162626Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJHMEUCIQCc9wWMuxGGQ5s%2Bj11Ge00dZI406o5hNX4dHW%2BG1X7NawIgaOFQLve3FwR3qkNhw7p1PVoXH2RWWZae7uVa%2FpwM91sq%2FwMICRAAGgw2Mzc0MjMxODM4MDUiDHn%2FzmP2dJwSsyeL6ircA18BeO4Tj81Pu3XJRKKNYRRwCGB%2BV2OLyXROCPNkvxgsZUpcSmVamKXAjTVBmHpLvv03%2FNAngzJNA7tKGF%2FSkMJIXbfKqfDudg41AwQRozraXU%2FDIdGhoJ5SEt2IOEdfBx20s3a%2FE7aofylZwlljm8G24Mcd4XTAQN9h9552bzuIcnm0xEUslzehA9Uf4w7aiN8LfzC%2BFN9Jdlwct1llnNV7nZA%2FU9RYoHUo3u%2BzwIRa0RdIoQI1x7Qh7Zcc7DdP0U2MYW4KINkFh3MN512JwMTcfC7PfBzJiVzATLE7CjuW6BtpNx%2FdpQZfESJ57fJTUfpRMRSsbDzAH%2BY8DhMliG5e39qSTXEbP%2By91sTD4SNy0JPJzPtk2fHnPb2MZFJo3H14B35JW7cRv528o93LsausK2pOERSyAAUD%2BkGI4wDMK9Ewq7QYSqsViXYNkKPsyM7zYK%2BKI4vYVvlzEaZm18Hm%2FBmgAHs5iG7dYHfePQMZXN1%2Bp66Vz%2FZKK%2BSbpSGrZpUo2k2FlIOXrvAghH9gHfvtwz4mZlNhjU5jciRHgtmMH5pQSm803YI1Bw18qFco3aUMCQ%2FeP7Re0a62Hp4nEE6r88JXjCQ7sKfPG5USY%2B4%2FlbG2GrigV%2F%2BSx5kjMOS45dEGOqUBaztXpIF6mNVS0KIsjcj1H3Gj%2BC8K9c90uZqBTon6u9caXJTA1zlxcLvN7i8CaQswPr72rj2s6DHDML30r39Kvm1HLnptnaTud%2FYVpSjQ1Q6TLsOfC7h9vliLUHItyy%2BuHh2qgnwHls8pLwxwhE0vi5IC3b77uG5nbrxTzKTevR%2B1jDozhiOZyqm6rNujqpFKUO6uTM6yENRoXQvJom7bnpinp1cr&X-Amz-Signature=cd50581992317d212e5ca07eef5b7df202c21c21478485ed7f56afd26dc6d9a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
