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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOUVOWOW%2F20251110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251110T005610Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJHMEUCIEaXed7kXJ7B%2BubbiWyYUuJeq53jJNnYydpPL5sFSiTFAiEAmFWWRrHCwTe31si7TsM%2FkS%2FIkoHNhSNHYY4K1wlykbgqiAQI%2BP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM6HRCsPYDSgm2r6mircAxr7Y%2FnNy9pm2yTRJtmP%2B80Rer0SV4TRkPUiulDJ7%2BT6pS%2FASoaDtx5DfTOVp8Qj1nueNI0CNmC4uRmIe3TWr6vb%2F6N60b13nDcO%2F%2Fq4fCvgfHcR4jV9jQEDpGbvDhhKDOWweQe8ugOzMVJ%2BA1Al7sAUHUraheyAcNx5q1oeBhjgZ53lkSyP%2Bo0s%2Bo%2B8VvFJ5irRj46KMpUbp6GYNgM3VI85tTqlhZu1xQmnl3ZPp7ngXgVc4mQ4KdH5feztpPhgWElKv49mkeXVkAANFrNmVu2GoMfWBDxPXnWa2RrheuK3AM%2FbIXg%2BQ3brvpXKii0QO623T1XAsSMW9JyQX5PLO8QDKRfyA8P%2Bwlt6qUbtUZnKLSsF5LJmS3XDR1DYWscxtOBNMwq0Na9I7nkIafoY0Y%2BObKRGymeZMEtlKLdBUZUpjSMqj6%2FkzEy1IH5bR6tF04ynQe5vL9u%2Bok9SXwdqep2c7AhVC%2Bo6NDiNpFA0dgvESulj9Oae1v2e9jMM2xtsdUylvaRMIkWZ9dhdDQByfILDuHmvPE7JMKMpPq0wRZnmbRE%2BKYHIXYzDyu%2BsqRaP1MmCfHr0jtvwqFnX3MRyN0pLWO941koMm7A8z9uZEPkR1SpWCkmZfTQuDuxmMNC2xMgGOqUBugSgQRiCemFQ8WXN2yqyYk1KcwE%2Bi5kHJojWq1a9NXdt79B%2FMh%2Fgmvg%2F2VPMn%2BWlyeXEeicGLPOjDjJMP3sebQ%2F2XIiMDx3smuRi7uq0tcKFDHIjYxyd3OXrC4jCrmF2NvTDNUkyxxgXWumkAppw%2B2GqB1DLmMZy79zPjU4YzNkUq62KlhNgoQ12ymQ4CqcDntFwsSb8v6u8iZolcMxu0NXcLiwV&X-Amz-Signature=cfd970f143908d21c4d6bbf713cea4f0cdbf10c23e8d7999531590db0316eba8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOUVOWOW%2F20251110%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251110T005610Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJHMEUCIEaXed7kXJ7B%2BubbiWyYUuJeq53jJNnYydpPL5sFSiTFAiEAmFWWRrHCwTe31si7TsM%2FkS%2FIkoHNhSNHYY4K1wlykbgqiAQI%2BP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM6HRCsPYDSgm2r6mircAxr7Y%2FnNy9pm2yTRJtmP%2B80Rer0SV4TRkPUiulDJ7%2BT6pS%2FASoaDtx5DfTOVp8Qj1nueNI0CNmC4uRmIe3TWr6vb%2F6N60b13nDcO%2F%2Fq4fCvgfHcR4jV9jQEDpGbvDhhKDOWweQe8ugOzMVJ%2BA1Al7sAUHUraheyAcNx5q1oeBhjgZ53lkSyP%2Bo0s%2Bo%2B8VvFJ5irRj46KMpUbp6GYNgM3VI85tTqlhZu1xQmnl3ZPp7ngXgVc4mQ4KdH5feztpPhgWElKv49mkeXVkAANFrNmVu2GoMfWBDxPXnWa2RrheuK3AM%2FbIXg%2BQ3brvpXKii0QO623T1XAsSMW9JyQX5PLO8QDKRfyA8P%2Bwlt6qUbtUZnKLSsF5LJmS3XDR1DYWscxtOBNMwq0Na9I7nkIafoY0Y%2BObKRGymeZMEtlKLdBUZUpjSMqj6%2FkzEy1IH5bR6tF04ynQe5vL9u%2Bok9SXwdqep2c7AhVC%2Bo6NDiNpFA0dgvESulj9Oae1v2e9jMM2xtsdUylvaRMIkWZ9dhdDQByfILDuHmvPE7JMKMpPq0wRZnmbRE%2BKYHIXYzDyu%2BsqRaP1MmCfHr0jtvwqFnX3MRyN0pLWO941koMm7A8z9uZEPkR1SpWCkmZfTQuDuxmMNC2xMgGOqUBugSgQRiCemFQ8WXN2yqyYk1KcwE%2Bi5kHJojWq1a9NXdt79B%2FMh%2Fgmvg%2F2VPMn%2BWlyeXEeicGLPOjDjJMP3sebQ%2F2XIiMDx3smuRi7uq0tcKFDHIjYxyd3OXrC4jCrmF2NvTDNUkyxxgXWumkAppw%2B2GqB1DLmMZy79zPjU4YzNkUq62KlhNgoQ12ymQ4CqcDntFwsSb8v6u8iZolcMxu0NXcLiwV&X-Amz-Signature=6ace1a64153bf4aa0437597c0fe622fa7a3409e9a05432dc8c0401e746569b10&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
