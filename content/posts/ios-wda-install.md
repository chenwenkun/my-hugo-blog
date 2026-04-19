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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662U2RLUWZ%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T183329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJHMEUCIDg9sOpBeFdaZSNG7wm%2B%2BFzxSKnkSYyX9XQpeYS9FmAaAiEA6eF4YGKDHb%2BtXAUz51eQtEJqq%2BdCiYF6yDF71nsOtS8q%2FwMICBAAGgw2Mzc0MjMxODM4MDUiDAOLKAV8mw1TeT4eQircA3Jo6%2FQ8OdjUP0bXAWa8ticMYh38BpNizFb876OMDeMuLloq%2Fp4iZ6lHS99%2FvxQOz7dZvSaMFYpEgHChKlqD6z2eXZxAooAoWGcVisM2bpu0Hd70K7kVz3NLNG%2FV2R5AXurQJOWGy%2BTNLNgRMaH78cxVcYjei8H9T547VTk3IDoH8WMugbHISs4%2BIdWQvKqxu9tEp9KSH5wA7O2ZQIf1SxGSoENj42wW1b7g0h5x0L4Y2LN%2F%2BY5Hx8co18DF0w8l90T0mDXDVHEoGvOWO4iHql3AyUvqF50m0VxopVAqm42ATFRLwn5TVxGFeOjN%2Be6Nodg9jZuh1oSTMrYNehh2n7%2BSdOdCZBCexaggVmV6fZv2%2BwP5hMloEQajGgJoTcWEEzR39lN1nebl9aIrw%2BqEur0hobjY0sIysnD6kk29nc4C7OJfOa38o7nxPFPkw9d3VlIkrQJAtucvxRCT%2FiMqz0i1qHixrKt%2BKVY5Oz%2BECjN5fGxZZ1YvJFDaknETWdlKmZqONaVVWUzXmRWicuaFh0QRS8BFeh3PSRNqkOOrI8ei60cNcpfcgycP%2FbqcZpV5BuZMD7wZ3OAZpg54rBM5bO2bz%2Fg6NW4meoAjqjCmxtKr1gI20AmwtL3zsMnMMJvPk88GOqUBb3ufFKjgLupkjQMD8xmjglqJ%2B%2BryFVE8wdQhX0nmReK4qyU6V9vgmBUdGtKjlcQSF0FrY28ej7Vd7vX0K%2BMBnq9lFErlSspND1%2B9%2BuGJynCwCuWshmK22cRUO%2F8EUzRlBFgvAz4vs8zba9u7OSpyrrmgikoj231N01HcYftuM%2FvS%2B4ERnh1snbxZ8OqtKfIgpbqZWcZTYg9hKbQCGxyotz9bCJwD&X-Amz-Signature=4db69c4498d16b06821e81d21d6f38cdcfec77258b1caad40fa969c6d4813b1a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662U2RLUWZ%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T183329Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJHMEUCIDg9sOpBeFdaZSNG7wm%2B%2BFzxSKnkSYyX9XQpeYS9FmAaAiEA6eF4YGKDHb%2BtXAUz51eQtEJqq%2BdCiYF6yDF71nsOtS8q%2FwMICBAAGgw2Mzc0MjMxODM4MDUiDAOLKAV8mw1TeT4eQircA3Jo6%2FQ8OdjUP0bXAWa8ticMYh38BpNizFb876OMDeMuLloq%2Fp4iZ6lHS99%2FvxQOz7dZvSaMFYpEgHChKlqD6z2eXZxAooAoWGcVisM2bpu0Hd70K7kVz3NLNG%2FV2R5AXurQJOWGy%2BTNLNgRMaH78cxVcYjei8H9T547VTk3IDoH8WMugbHISs4%2BIdWQvKqxu9tEp9KSH5wA7O2ZQIf1SxGSoENj42wW1b7g0h5x0L4Y2LN%2F%2BY5Hx8co18DF0w8l90T0mDXDVHEoGvOWO4iHql3AyUvqF50m0VxopVAqm42ATFRLwn5TVxGFeOjN%2Be6Nodg9jZuh1oSTMrYNehh2n7%2BSdOdCZBCexaggVmV6fZv2%2BwP5hMloEQajGgJoTcWEEzR39lN1nebl9aIrw%2BqEur0hobjY0sIysnD6kk29nc4C7OJfOa38o7nxPFPkw9d3VlIkrQJAtucvxRCT%2FiMqz0i1qHixrKt%2BKVY5Oz%2BECjN5fGxZZ1YvJFDaknETWdlKmZqONaVVWUzXmRWicuaFh0QRS8BFeh3PSRNqkOOrI8ei60cNcpfcgycP%2FbqcZpV5BuZMD7wZ3OAZpg54rBM5bO2bz%2Fg6NW4meoAjqjCmxtKr1gI20AmwtL3zsMnMMJvPk88GOqUBb3ufFKjgLupkjQMD8xmjglqJ%2B%2BryFVE8wdQhX0nmReK4qyU6V9vgmBUdGtKjlcQSF0FrY28ej7Vd7vX0K%2BMBnq9lFErlSspND1%2B9%2BuGJynCwCuWshmK22cRUO%2F8EUzRlBFgvAz4vs8zba9u7OSpyrrmgikoj231N01HcYftuM%2FvS%2B4ERnh1snbxZ8OqtKfIgpbqZWcZTYg9hKbQCGxyotz9bCJwD&X-Amz-Signature=cb0e138b1cc271f4666a3bf507f521b457f2fb851ad588c128b0bbffbf091d6f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
