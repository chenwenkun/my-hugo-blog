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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466USPG5CCW%2F20260512%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260512T082427Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJHMEUCIEP70liGWknG4eojmN1o2fv2hcEDKu4sXjhCMI3G5TqnAiEAsT50R%2FNszAln5Q%2B7ZaJIQWfUFtQA%2FJ9MWhh%2FooOEcQQq%2FwMIJRAAGgw2Mzc0MjMxODM4MDUiDOI3D34%2FGxDay4S0lSrcAyYodjfgjdLq7apgeVeWQKeza%2BouiODeeIqp8%2Bz9SWqqL5w%2F%2FHWAfkqhirgaQ6skIoddTpREi6PLMpwfKME4q2XWardnbRCUl8NLnA%2FPAVCBguCof%2F9A9nGJ4f%2Fh7mH2Obw65kz9srYX7UypDrrWLI2r2dp%2FFgyc9ygomNuUgSbgB80g8ebuCNVMFPXvUL3VH5ZjmovyZjgT%2FjzM1EDA0WKqTnLxUOVNtiH4vlBOknrRDoBY5%2B1DkaEbNaRkviynq97BLxMdUQelwx1fg6F6R8rZF72m8hqvYHhpXd6BaxEvXWpFSsZeJhVQt4eTSijqzLADedIBlQ0kH9Huy5su7d20QjBaxO6A3cfMikAbCdFMsjLmGLfhcOHaAtOye882YHjslAzrTaj%2FwzYib%2FmKcJTf%2BaMl4WKsuh%2FVm6P9I%2FPRithqI3UC0a7YPBSiaSqrM7kmzutEIuN4BdlBrws3nabrhDtrUUeMv5jqBEn6xJ%2FnmWE2wflNEHm0dLIIv6i9I%2B%2FGVCyCDOMBaklEr16y9thFqiujoxhX%2FNi7hYKkomXdY%2BLnLKqStunDkmtcHZOnji8CeY7ssOjsp7XmO3Wwo89%2BXFICv2eWP9iB33OVAcmqlj8hiSgOMnsnXYVqMNy%2FitAGOqUBLuTEPwgGyxC0hdiAnnU0%2FhHPAlDj1hqFUTo3ZAotoNIknsQjEX6H0Y1cW%2FgMaica8OUhgNOBzTi4TP8kG%2BeUYikG2KJ45JhUhILmnX%2FIl0Xkji2jeSJoxTH45ZXYn6NvD1RMMhiabecgegsbFxvQcgWGpU078xtvEFzZwoseorRxYzrvHTDiq8de%2BqqNiKtWzT7zxNdyiJVFOVtT30MTvYMPIhi5&X-Amz-Signature=ccc6d6e077ac47550badb588d32de76a961b0f3ec47c621f3a5061533cd54714&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466USPG5CCW%2F20260512%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260512T082427Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFwaCXVzLXdlc3QtMiJHMEUCIEP70liGWknG4eojmN1o2fv2hcEDKu4sXjhCMI3G5TqnAiEAsT50R%2FNszAln5Q%2B7ZaJIQWfUFtQA%2FJ9MWhh%2FooOEcQQq%2FwMIJRAAGgw2Mzc0MjMxODM4MDUiDOI3D34%2FGxDay4S0lSrcAyYodjfgjdLq7apgeVeWQKeza%2BouiODeeIqp8%2Bz9SWqqL5w%2F%2FHWAfkqhirgaQ6skIoddTpREi6PLMpwfKME4q2XWardnbRCUl8NLnA%2FPAVCBguCof%2F9A9nGJ4f%2Fh7mH2Obw65kz9srYX7UypDrrWLI2r2dp%2FFgyc9ygomNuUgSbgB80g8ebuCNVMFPXvUL3VH5ZjmovyZjgT%2FjzM1EDA0WKqTnLxUOVNtiH4vlBOknrRDoBY5%2B1DkaEbNaRkviynq97BLxMdUQelwx1fg6F6R8rZF72m8hqvYHhpXd6BaxEvXWpFSsZeJhVQt4eTSijqzLADedIBlQ0kH9Huy5su7d20QjBaxO6A3cfMikAbCdFMsjLmGLfhcOHaAtOye882YHjslAzrTaj%2FwzYib%2FmKcJTf%2BaMl4WKsuh%2FVm6P9I%2FPRithqI3UC0a7YPBSiaSqrM7kmzutEIuN4BdlBrws3nabrhDtrUUeMv5jqBEn6xJ%2FnmWE2wflNEHm0dLIIv6i9I%2B%2FGVCyCDOMBaklEr16y9thFqiujoxhX%2FNi7hYKkomXdY%2BLnLKqStunDkmtcHZOnji8CeY7ssOjsp7XmO3Wwo89%2BXFICv2eWP9iB33OVAcmqlj8hiSgOMnsnXYVqMNy%2FitAGOqUBLuTEPwgGyxC0hdiAnnU0%2FhHPAlDj1hqFUTo3ZAotoNIknsQjEX6H0Y1cW%2FgMaica8OUhgNOBzTi4TP8kG%2BeUYikG2KJ45JhUhILmnX%2FIl0Xkji2jeSJoxTH45ZXYn6NvD1RMMhiabecgegsbFxvQcgWGpU078xtvEFzZwoseorRxYzrvHTDiq8de%2BqqNiKtWzT7zxNdyiJVFOVtT30MTvYMPIhi5&X-Amz-Signature=42813c696ae6515f5442b62f6ca0f2481b201c4419ecf771b036354fc4d4b0b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
