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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667Q4P54UD%2F20260604%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260604T094149Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD8xf96Z49Qcb57Y%2FW6Nbp7yofevbfSsTBkzDaGCnZgxgIhAKJBBJChTEYVNc4VjuS%2BOliNGowZq7py6UgnZSymicJIKv8DCFIQABoMNjM3NDIzMTgzODA1IgzwX09FLSwG6UpLWWIq3APuuV2WwKOAFShe7yGT03mRYNuI4r0DV4%2BGM0jvnLSS84at65YRv3FfWNC%2F0z1IHpT1pUG%2FTx2iX6mxvTxV5zr7M0KxWZWfeEEKuoPxsBSXGsxVLUxW%2BNCpJ5brQ57WR%2BhEcmVxPPaJB7BYdDuoaojaCEB5SQVwlu0iQ70xup4SA32hRhSEwKZjX%2BvMCmKezYCm7X6900LWg1OLw%2BhM6PUpcVYUe%2FrvpjvPtnBeXfu8zarSwwm%2FnBmmL%2Ff67DrthqtIkpq%2FuBIseXH7WCzkWp18iIRwhgSMA84m5sLCIuLJqforoeeV9IBOvJ26TSP9dH03jM5%2BBgvPgILYq42tAWW4yTv1pRdvqQ2YCU%2Fgs%2FsMDuG3Bm6AjxKaB9C1n6yb7Lvf14MDgVVEXUibzJ3QHVje4wHP8Cx20fYJL6%2FM5XBhwo3A8ucPAHkMwtIvS9DJVCROR%2BpSmaYpUhW7Il%2B6uQe8XYflPkw%2BG8LAklF4zzd%2BjP4Cd9G1QulL%2BLT3XlzfwTB2ayOICxbx7eH6vb3V6ersxo1xDDgTu%2BjIGr2nCA%2BkM7tVl1HhPdqHcZg3M6Lx%2FYGJD44JF%2BWJ%2BfCVZFK%2Bz4IIHBiVSk%2F0qbs9Lr%2BlmDox29aCY1KRC8n39YkpmDDg74TRBjqkAe%2FhBHwft%2Fq7LN5%2BbwMhPfR%2BZYAaWBygPqvh6j0iMtj8bf1ePbcIE%2BORxaW6KEMkG7jlfce4sSys4WFW0BX5zqD8e4coC9pSriiGKyH5v6iehOtiC%2F6hzewLRgnpHvDnGpMTarG6SogI%2F0MyOBh5aMp1L0NMhBSajyA2Klypbvn%2F1Gl%2FV%2BdqWc58HZHwvU0eld96hdG%2BzfWNFXNG8yYic%2BjbusR2&X-Amz-Signature=c8a57bc76784febda10e3612574a46ee3ff5d13c656749c7ad29602035f0b663&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667Q4P54UD%2F20260604%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260604T094149Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD8xf96Z49Qcb57Y%2FW6Nbp7yofevbfSsTBkzDaGCnZgxgIhAKJBBJChTEYVNc4VjuS%2BOliNGowZq7py6UgnZSymicJIKv8DCFIQABoMNjM3NDIzMTgzODA1IgzwX09FLSwG6UpLWWIq3APuuV2WwKOAFShe7yGT03mRYNuI4r0DV4%2BGM0jvnLSS84at65YRv3FfWNC%2F0z1IHpT1pUG%2FTx2iX6mxvTxV5zr7M0KxWZWfeEEKuoPxsBSXGsxVLUxW%2BNCpJ5brQ57WR%2BhEcmVxPPaJB7BYdDuoaojaCEB5SQVwlu0iQ70xup4SA32hRhSEwKZjX%2BvMCmKezYCm7X6900LWg1OLw%2BhM6PUpcVYUe%2FrvpjvPtnBeXfu8zarSwwm%2FnBmmL%2Ff67DrthqtIkpq%2FuBIseXH7WCzkWp18iIRwhgSMA84m5sLCIuLJqforoeeV9IBOvJ26TSP9dH03jM5%2BBgvPgILYq42tAWW4yTv1pRdvqQ2YCU%2Fgs%2FsMDuG3Bm6AjxKaB9C1n6yb7Lvf14MDgVVEXUibzJ3QHVje4wHP8Cx20fYJL6%2FM5XBhwo3A8ucPAHkMwtIvS9DJVCROR%2BpSmaYpUhW7Il%2B6uQe8XYflPkw%2BG8LAklF4zzd%2BjP4Cd9G1QulL%2BLT3XlzfwTB2ayOICxbx7eH6vb3V6ersxo1xDDgTu%2BjIGr2nCA%2BkM7tVl1HhPdqHcZg3M6Lx%2FYGJD44JF%2BWJ%2BfCVZFK%2Bz4IIHBiVSk%2F0qbs9Lr%2BlmDox29aCY1KRC8n39YkpmDDg74TRBjqkAe%2FhBHwft%2Fq7LN5%2BbwMhPfR%2BZYAaWBygPqvh6j0iMtj8bf1ePbcIE%2BORxaW6KEMkG7jlfce4sSys4WFW0BX5zqD8e4coC9pSriiGKyH5v6iehOtiC%2F6hzewLRgnpHvDnGpMTarG6SogI%2F0MyOBh5aMp1L0NMhBSajyA2Klypbvn%2F1Gl%2FV%2BdqWc58HZHwvU0eld96hdG%2BzfWNFXNG8yYic%2BjbusR2&X-Amz-Signature=1344b982fa89105a1eb0febdae7205b4fa9d1d2ea19654682bc8d27c86d53256&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
