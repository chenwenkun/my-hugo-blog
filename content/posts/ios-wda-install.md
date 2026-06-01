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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QD5C32CI%2F20260601%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260601T212021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE0aCXVzLXdlc3QtMiJHMEUCIHPdQNHbMIrgpNomZ3ImyR%2BEK703ILPPNGucyhtA8LdlAiEA%2B5GsiZjqbnhZ9bgLdaudTL1gw7JqLDXy1D32107%2FTHIq%2FwMIFhAAGgw2Mzc0MjMxODM4MDUiDOVGwAP8wLPkA%2FGsIircA3kOFenqePgA6tMLix4dIyXKiUoazXyBwSNuF59KiOUAV%2Fg6M8%2B7lf0slM1vbQ51BBZM%2FTKZg8N2hkGV26oamjnm4sWEKTczRgx8DLJMjyYyC0KCf%2Bma8H0hpiHnZ36gh3ICh6rHpihPmcf%2BJXJjYKsKfX%2B0%2Brbw92NOidtRKcs7h%2FPsmFIfpgMHcRbX16t4seebJycwxdmLM8V4DIeFfQTfL6vwxd3dAHamulLyH6HQZ3CkZlDnVqEzJWBrfHrGYikihiqE1xs5CB6ESy9LLHVemjC9KQvgG5KPQlXSSPBSVPpJ3x5OhZ3XXh9l7x1ZR4tgyfWHFrG9%2Bk41y3fQgQmf6kgOPB74QUDxLUWGeIGsqPxj4mznR4tHK5X%2BM1mX58QORkQRmkzcD1%2B6bkq0f5V7xf71i1T3xEpuizqz6XB6ijvu4CZKS%2Bhwjga7w263LaF%2FPDaBm3iiR%2Bmccw182mDXcmfjRChFJisrQqfrTULZruFJtrF089wv3mmLGa3b%2F4y5MjGEG2KfQIi2eDQZcYUK18tfH55wE%2F3Hi3dCpdbbCASxAL9ENx9Y5cnMvEQ8489rSf4VgYuSOLYSyLvIUPSj75fb47Ub4NYMzn6mo4lNnopG%2FzdfZmVplkOuMMDc99AGOqUBmA7gT%2FK57FJ9l2IXLPHN7LwdDxaZLEl8Qpu9E365c51y0uVVQGFwF10AOecgQ9FV3CI3Atzn5Vb1CAMGzY%2BEprp%2FzGxq6ysacZR9erO9dOC7KftDLLOGNQ8b6h2VLaUAhEt5ilSAy%2Btnn0x3PME2BOFgmUgjhjdpFu5FLqER4SbMHZ9vqdJaIOQAhF9OGL8aKuMPoLbspU0vBCotCF32k%2BNcjNxJ&X-Amz-Signature=f7becf2780632cab08d44fc8638ad23366f4e646137f4c7864bf807dfb3b34f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QD5C32CI%2F20260601%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260601T212020Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE0aCXVzLXdlc3QtMiJHMEUCIHPdQNHbMIrgpNomZ3ImyR%2BEK703ILPPNGucyhtA8LdlAiEA%2B5GsiZjqbnhZ9bgLdaudTL1gw7JqLDXy1D32107%2FTHIq%2FwMIFhAAGgw2Mzc0MjMxODM4MDUiDOVGwAP8wLPkA%2FGsIircA3kOFenqePgA6tMLix4dIyXKiUoazXyBwSNuF59KiOUAV%2Fg6M8%2B7lf0slM1vbQ51BBZM%2FTKZg8N2hkGV26oamjnm4sWEKTczRgx8DLJMjyYyC0KCf%2Bma8H0hpiHnZ36gh3ICh6rHpihPmcf%2BJXJjYKsKfX%2B0%2Brbw92NOidtRKcs7h%2FPsmFIfpgMHcRbX16t4seebJycwxdmLM8V4DIeFfQTfL6vwxd3dAHamulLyH6HQZ3CkZlDnVqEzJWBrfHrGYikihiqE1xs5CB6ESy9LLHVemjC9KQvgG5KPQlXSSPBSVPpJ3x5OhZ3XXh9l7x1ZR4tgyfWHFrG9%2Bk41y3fQgQmf6kgOPB74QUDxLUWGeIGsqPxj4mznR4tHK5X%2BM1mX58QORkQRmkzcD1%2B6bkq0f5V7xf71i1T3xEpuizqz6XB6ijvu4CZKS%2Bhwjga7w263LaF%2FPDaBm3iiR%2Bmccw182mDXcmfjRChFJisrQqfrTULZruFJtrF089wv3mmLGa3b%2F4y5MjGEG2KfQIi2eDQZcYUK18tfH55wE%2F3Hi3dCpdbbCASxAL9ENx9Y5cnMvEQ8489rSf4VgYuSOLYSyLvIUPSj75fb47Ub4NYMzn6mo4lNnopG%2FzdfZmVplkOuMMDc99AGOqUBmA7gT%2FK57FJ9l2IXLPHN7LwdDxaZLEl8Qpu9E365c51y0uVVQGFwF10AOecgQ9FV3CI3Atzn5Vb1CAMGzY%2BEprp%2FzGxq6ysacZR9erO9dOC7KftDLLOGNQ8b6h2VLaUAhEt5ilSAy%2Btnn0x3PME2BOFgmUgjhjdpFu5FLqER4SbMHZ9vqdJaIOQAhF9OGL8aKuMPoLbspU0vBCotCF32k%2BNcjNxJ&X-Amz-Signature=79b3aa835c5e2cadf705ab7e163b5e6576ee138e00ecfdb968137025079ae72e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
