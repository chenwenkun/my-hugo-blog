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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622SP6XJ3%2F20260108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260108T061955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDg4Sps6RoSrwHdUnL9kxaG4JO4VDqeYcEod8i52QflWgIgZKfv%2FiYa8gKIoktPl8gpZo%2FtzEWisBlRF%2BeLtaOp5e0qiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDhSUZRsJUzmcaPWfCrcA1WGXRyaPV%2BfoYUN4glTYEXbYIogn2czN8UDsMcGMwnRXVbjsX1%2BU%2B%2Ff%2FblFkPWqTaCbMcuY992s73pE7DRnwUomZfelTS1Ovp%2FM%2FTSTq%2FqetdLApGOxhGVTcS2BiocAbqUh4aF%2BQRSTRZw7ng53JLRTytVEqF4Gexe78Dfl%2BF1btJyXtDTsevk8IP7gtloudi0ZU%2BQMASPQ%2BZt75gN%2FmhSNHDTnSZ49%2F%2BICOUV3Sn6PMJxVXNs3V2%2BuqSB2U9o4AQ4SNhpgG1FUzYgogtFaD1qK8wjqXUrhCsehFjh6lddUygjgov1vrviVfkCmi%2B%2Fby6PCtXxGtWzpKG7FKybPn1CLrpgtWls%2BQIUxzbTAW9rYNKsRZGYZPlqpjheBLNK%2F%2FM5w3dtymn77LztfvFIRk5Pyow9H5M56rRMzvegN05ppf%2BlBm7d18hKJzb%2BlIYp6j1w7tUkoDQ7EzioYOTlYx7%2BlWvrrmfHsBUYhdcV6l2Vn4%2FD7rJ6wf%2Fg3Bi0YPjHae14WHerxvn5PdZFeNP3%2Bv1UZuvXxSpPPlPEMciw2cefwfv0yiePF20%2FZhJPoXpCNPUs0D8CRb6M1u3Qd0qbEoHnJxAnwrfBdCpgbTgsxj3uqnYpdQseinSRFabJHMIGX%2FcoGOqUBQX3c%2BdzeGpp5vFdnuntRMsYwxzt0P9zAKWuWC2AQRI5sqwPiHLwCkdqXZAiml%2Fdh1fO3J8WT4QBQhZLVvP1ZoEEEVa72Tu8HxdwKtvpNr%2Fe6klYKWLT0sVYud%2FZ9fybIUqUS9MMatJP96RCcnabU2IWT2ijKYnqloppuERVCXQkf8XX6kTS%2B%2Fuuq%2FcaSJNjLx3GMI4TV8Yq9F1wz6FMuw6%2BRLrZE&X-Amz-Signature=e0c31847818290e68a9ed37d2b5a8319fcafc4472f73116d76feffd979319af0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622SP6XJ3%2F20260108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260108T061955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDg4Sps6RoSrwHdUnL9kxaG4JO4VDqeYcEod8i52QflWgIgZKfv%2FiYa8gKIoktPl8gpZo%2FtzEWisBlRF%2BeLtaOp5e0qiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDhSUZRsJUzmcaPWfCrcA1WGXRyaPV%2BfoYUN4glTYEXbYIogn2czN8UDsMcGMwnRXVbjsX1%2BU%2B%2Ff%2FblFkPWqTaCbMcuY992s73pE7DRnwUomZfelTS1Ovp%2FM%2FTSTq%2FqetdLApGOxhGVTcS2BiocAbqUh4aF%2BQRSTRZw7ng53JLRTytVEqF4Gexe78Dfl%2BF1btJyXtDTsevk8IP7gtloudi0ZU%2BQMASPQ%2BZt75gN%2FmhSNHDTnSZ49%2F%2BICOUV3Sn6PMJxVXNs3V2%2BuqSB2U9o4AQ4SNhpgG1FUzYgogtFaD1qK8wjqXUrhCsehFjh6lddUygjgov1vrviVfkCmi%2B%2Fby6PCtXxGtWzpKG7FKybPn1CLrpgtWls%2BQIUxzbTAW9rYNKsRZGYZPlqpjheBLNK%2F%2FM5w3dtymn77LztfvFIRk5Pyow9H5M56rRMzvegN05ppf%2BlBm7d18hKJzb%2BlIYp6j1w7tUkoDQ7EzioYOTlYx7%2BlWvrrmfHsBUYhdcV6l2Vn4%2FD7rJ6wf%2Fg3Bi0YPjHae14WHerxvn5PdZFeNP3%2Bv1UZuvXxSpPPlPEMciw2cefwfv0yiePF20%2FZhJPoXpCNPUs0D8CRb6M1u3Qd0qbEoHnJxAnwrfBdCpgbTgsxj3uqnYpdQseinSRFabJHMIGX%2FcoGOqUBQX3c%2BdzeGpp5vFdnuntRMsYwxzt0P9zAKWuWC2AQRI5sqwPiHLwCkdqXZAiml%2Fdh1fO3J8WT4QBQhZLVvP1ZoEEEVa72Tu8HxdwKtvpNr%2Fe6klYKWLT0sVYud%2FZ9fybIUqUS9MMatJP96RCcnabU2IWT2ijKYnqloppuERVCXQkf8XX6kTS%2B%2Fuuq%2FcaSJNjLx3GMI4TV8Yq9F1wz6FMuw6%2BRLrZE&X-Amz-Signature=c425d437ea8876098be8b2af054850bc6e213949d15eb196cf72fd4b454c3e78&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
