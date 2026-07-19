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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ARQCWCO%2F20260719%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260719T014122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICABE5g6BpCULkQ5kw3TFt9v3phNVzvl%2F%2BYHt7Wl011lAiEAj%2BXgzAXJkGwc%2Bqhd8ZKky0GvfybSmAcxleW6z30QT6oqiAQIgf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKPJI%2BcN%2BGWOGkAnKircA9xq1cUCTIF8NGmpzOoqhXHwaH2yD91O%2BRZAPwVl6IPj04DsIwxstAf5wSeAdCujfXOyzrxHzMt36Ic0zG%2F%2BosyF5nbMl6bVeq72LE1Wli9S0St%2BhT5oTt0%2Fq%2BB9wImT0jUjXgpoV9fCXjW2zlHWle9LTgCBstXfS2Og%2Bq8AvxtNdOY6BQgfj3%2FKTYqwFLMA2JCU7vUfYJhZqziFBs4mkFHmPiNVclAFmcvX9ZXD0hchfKpsff0y7Bom29EHqZXe%2FzMzp0kN40AmQSeNUAUZr%2Bji0bXsJpTVYvBJ2GgLcHfzLiJ90WEIR8Jx6Qvi4C%2BAkKom%2FcVhJfxe8n1pDz9BERAX%2BcWhOjp6LuEkpkilMdqYQ1P4wUeIjaa%2BcPkDJlBLlPdl7%2FVfzddc7BRvHcyYKrglAS5fV8cxH7wia03gll%2FXXOW3Pmym4M0%2F4eM6Wfoai6Yyt5MNC2K52zCWB7YhqA%2FDgs6j%2Blg%2FEtajuPJYnWrq15qw3oa2C6HqF0b9QDmvNuCSqYktGb98gL9Y3WDlXbPVXVVLPm10DfnEKYzycxdqZ%2FS3ubJoHU1FHsKMCPs3nWxYv72rt2QK87jzV66kklk34iS8eE2190D%2FoUJ6S6ZV3ORyHOoYCvpm5K9FMPWp8NIGOqUBXliTpA86GJPw3dfBCyuLaJJaQ%2B8Ja63DJ0c5Nk%2B1WN6POjuNSuIj6dXtziR%2FdnnkAVqtmkoK%2F%2BN95Unp5mbYZStmbPDxZ7ynGtBFGWD%2F6BwIznC2%2F4sP6HUNfKyNxDW0sA0AnU6M7X3FG%2F1cU4pU%2B53J1vqilJZjY8%2B7YRFYm%2F64QkTRoGUQjoyENHdz6ptnC9z39qu%2BfWARF6T2E0zr7sqjeuU6&X-Amz-Signature=6913619869be9299e170186a43bc1e93ad4c393173db2fd2fa96aa0d0f5cecd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ARQCWCO%2F20260719%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260719T014122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICABE5g6BpCULkQ5kw3TFt9v3phNVzvl%2F%2BYHt7Wl011lAiEAj%2BXgzAXJkGwc%2Bqhd8ZKky0GvfybSmAcxleW6z30QT6oqiAQIgf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKPJI%2BcN%2BGWOGkAnKircA9xq1cUCTIF8NGmpzOoqhXHwaH2yD91O%2BRZAPwVl6IPj04DsIwxstAf5wSeAdCujfXOyzrxHzMt36Ic0zG%2F%2BosyF5nbMl6bVeq72LE1Wli9S0St%2BhT5oTt0%2Fq%2BB9wImT0jUjXgpoV9fCXjW2zlHWle9LTgCBstXfS2Og%2Bq8AvxtNdOY6BQgfj3%2FKTYqwFLMA2JCU7vUfYJhZqziFBs4mkFHmPiNVclAFmcvX9ZXD0hchfKpsff0y7Bom29EHqZXe%2FzMzp0kN40AmQSeNUAUZr%2Bji0bXsJpTVYvBJ2GgLcHfzLiJ90WEIR8Jx6Qvi4C%2BAkKom%2FcVhJfxe8n1pDz9BERAX%2BcWhOjp6LuEkpkilMdqYQ1P4wUeIjaa%2BcPkDJlBLlPdl7%2FVfzddc7BRvHcyYKrglAS5fV8cxH7wia03gll%2FXXOW3Pmym4M0%2F4eM6Wfoai6Yyt5MNC2K52zCWB7YhqA%2FDgs6j%2Blg%2FEtajuPJYnWrq15qw3oa2C6HqF0b9QDmvNuCSqYktGb98gL9Y3WDlXbPVXVVLPm10DfnEKYzycxdqZ%2FS3ubJoHU1FHsKMCPs3nWxYv72rt2QK87jzV66kklk34iS8eE2190D%2FoUJ6S6ZV3ORyHOoYCvpm5K9FMPWp8NIGOqUBXliTpA86GJPw3dfBCyuLaJJaQ%2B8Ja63DJ0c5Nk%2B1WN6POjuNSuIj6dXtziR%2FdnnkAVqtmkoK%2F%2BN95Unp5mbYZStmbPDxZ7ynGtBFGWD%2F6BwIznC2%2F4sP6HUNfKyNxDW0sA0AnU6M7X3FG%2F1cU4pU%2B53J1vqilJZjY8%2B7YRFYm%2F64QkTRoGUQjoyENHdz6ptnC9z39qu%2BfWARF6T2E0zr7sqjeuU6&X-Amz-Signature=7fa78cf33734086b18183aab89163b1e23cdb635dc0ec5f1b7370ab46e43d65b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
