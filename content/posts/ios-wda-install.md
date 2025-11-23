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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XWIP2ZP%2F20251123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251123T181500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJHMEUCIQDKRyEoW1mzr7N%2FozY1H7lJHbP7aZgOmM1bxfTi6LB3vwIgXs1n7kNKHxumy%2Fj1eaX%2FU4WgWKlVPDSE4IUmRx8eAOMq%2FwMIQBAAGgw2Mzc0MjMxODM4MDUiDOvV7RvWVAS8oMs58ircA3pkjIMAS8CFk6mnmU91YCGF3Vp%2FAsX%2BZHxE4O5r9ip7Dsf1cGK%2FIy3iK6qh5p5DLh3LMC5p1bRLxQKNfbl2Ff5oXcd1B%2BSKjFIQ1dNIIty5DVKBipP4WFfQ3Gg7soig42WJhTBXgxXX255%2FUaXT7rt9BmwvJuztby4h6CND2Pt4hjB3hjIdVnSe%2Fedb9iTfb39LF3%2Byn9%2BskYZfDNDOI%2FpxquN8F%2Bud9yK%2FekY%2BdrOt49%2FlDdj4zcsWgKAHRO7y4GS410QJonlztmHwamrIGjr%2Btnq2b4JxSIkJrH0HKp9mjEPxWTyBCuwYPBT3fbX8c1IEIKsLIeNcXTYB1cVWiplAacX%2BlLnDBGUFOBvVPV1k%2FAwBEEvZB%2Fma8vNX9up%2FKj%2FsEOvSLkOGiPf0dIuTxowyYuL6wtSxRUmttzTrsHZM72DyqESwaa4vDTi9u5q9cwvKxnj76G%2FsnpGFtGCsxsvDcB3G860ql637NgsS9P8VBg39BS%2FIDbkZBr5Z0o%2BeYSs3AwNRz20Ury3uOO0gZFFn85ArexBgFUUoMMG3RkswmNA5o%2FB4r1tYyP8xkYuBzURw7%2FQbjX4Xy%2F4vTH5oPzyd4%2FU1iMpc8Yc4JgmyhPkX8ylSbJrgieM9QpGZMKDNjMkGOqUBF%2BKwLB6WZmo1fmGyhcQrSBYM9pSPbKyGxyPk%2BBBGZMfQ50zC3BZ64Eud3VLHZxaVLyx8liG11Qc0uwSgiFpIbFAWucEsZlvcWZqIChABR7aQ9V1PA8M%2Ba%2BPtM1%2FVrwZ5mJMbvpYyj8Hve8yJCW5r45%2BVw9544M4kHDxOy1kqRp988ILbkRLVoHc0RNzL80h4a%2BPAmXsMqCN469pLSqeOqxd74Niw&X-Amz-Signature=7e57e7e9df51cbdec66e0cebd52394a473beaf6c990adffb2ceff13b884b8ee7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XWIP2ZP%2F20251123%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251123T181500Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLXdlc3QtMiJHMEUCIQDKRyEoW1mzr7N%2FozY1H7lJHbP7aZgOmM1bxfTi6LB3vwIgXs1n7kNKHxumy%2Fj1eaX%2FU4WgWKlVPDSE4IUmRx8eAOMq%2FwMIQBAAGgw2Mzc0MjMxODM4MDUiDOvV7RvWVAS8oMs58ircA3pkjIMAS8CFk6mnmU91YCGF3Vp%2FAsX%2BZHxE4O5r9ip7Dsf1cGK%2FIy3iK6qh5p5DLh3LMC5p1bRLxQKNfbl2Ff5oXcd1B%2BSKjFIQ1dNIIty5DVKBipP4WFfQ3Gg7soig42WJhTBXgxXX255%2FUaXT7rt9BmwvJuztby4h6CND2Pt4hjB3hjIdVnSe%2Fedb9iTfb39LF3%2Byn9%2BskYZfDNDOI%2FpxquN8F%2Bud9yK%2FekY%2BdrOt49%2FlDdj4zcsWgKAHRO7y4GS410QJonlztmHwamrIGjr%2Btnq2b4JxSIkJrH0HKp9mjEPxWTyBCuwYPBT3fbX8c1IEIKsLIeNcXTYB1cVWiplAacX%2BlLnDBGUFOBvVPV1k%2FAwBEEvZB%2Fma8vNX9up%2FKj%2FsEOvSLkOGiPf0dIuTxowyYuL6wtSxRUmttzTrsHZM72DyqESwaa4vDTi9u5q9cwvKxnj76G%2FsnpGFtGCsxsvDcB3G860ql637NgsS9P8VBg39BS%2FIDbkZBr5Z0o%2BeYSs3AwNRz20Ury3uOO0gZFFn85ArexBgFUUoMMG3RkswmNA5o%2FB4r1tYyP8xkYuBzURw7%2FQbjX4Xy%2F4vTH5oPzyd4%2FU1iMpc8Yc4JgmyhPkX8ylSbJrgieM9QpGZMKDNjMkGOqUBF%2BKwLB6WZmo1fmGyhcQrSBYM9pSPbKyGxyPk%2BBBGZMfQ50zC3BZ64Eud3VLHZxaVLyx8liG11Qc0uwSgiFpIbFAWucEsZlvcWZqIChABR7aQ9V1PA8M%2Ba%2BPtM1%2FVrwZ5mJMbvpYyj8Hve8yJCW5r45%2BVw9544M4kHDxOy1kqRp988ILbkRLVoHc0RNzL80h4a%2BPAmXsMqCN469pLSqeOqxd74Niw&X-Amz-Signature=8d7001fca3c03b95a96d91e24eda92166171db135d658c21b666bf90994acff6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
