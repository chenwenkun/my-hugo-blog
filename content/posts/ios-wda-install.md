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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R6FVEYBE%2F20251231%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251231T061922Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDYQSFxaVPG0quyukjd0C0BRlo6DIIBMuplbE5SiO8peAIhANQUDA8RmUGPlf%2FwVJzSaYLYmM%2FYu74VMC0QLxshXVbJKogECMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy4OgFgp955gybh26cq3AMe8LOqcgwlLYwuQsaW%2F2VyMGqABILHaQZsLxd2gLA%2B1j4lChiow%2FrRAt3%2Fbwn4mXZBtDqxWewHUUFGeg8Aa8ahLM2Cs%2Fn%2F22ccYS0VnABw9ursYwZdARyOuRAQk9x4i%2F2Bx36aYOXscHwIW8Esy6QOlh74CEwNxqhDd2XTQAJWlB54klQ7Vs9pjKpw4JyPkq%2B1GN%2BbxCaUpNRy7mqJcYUkbP2BUKA8YCm0ger6hqsfjQ7VGqRO9l81a0hWDr3AJuZqpDl9fWl06IlCB6Yeq75Nq1e5KEYOhI%2B%2Fx2n0fxTUxTl8Lgut2ci607O5Ub4nbf05pLROIlptUNJXAoHF5HCYPGQMj1ChY8aj7PtGwFcSnMZOj10qi7TKnXba5uVMybpHj10GSIvrEb3lK%2BbOY2kV%2BzAy6s7vJm%2BcfLLt3uCMiWPOVFWvBlqGtWgwR1zp2KOHYvSssW1%2F3UHuocF28jx%2BHfR5gHmQKwIXkuMmgfHe4%2FN7%2BXSGo4wHZngZTgfe9tvkQBfVXlfoC%2F4%2B3MPX6SHYwMDdk4vTV6jW5VZEtgW%2B1reeiAOn527M%2FsUpkThXU9alt4rS4vIqYkmKrTc1ZJ8M%2BQYQyw%2Fks%2Bgaw%2BWhZGGxpwgya1V%2BmE%2BJZwmBFDCx1NLKBjqkAZSo9GbKhqv6QX0tMiZsBrHCsIvwL%2FoEbUAkNcm4llvk7F1pJ7ud6L9zCeiVVUhZGo43AepTcWYD1LeQ3HcOSVAUkTRvYfl4X7jmgW5jZtqq%2FiSDSLmq2V%2BWrzPYf676G3%2B3SCgf7WhLanyIbfmfexju1ecDM8PMi1bbzWWGdTXJHp1xbc%2Ba%2B8Z0tbpjaNaLg8aSyMJF9v6hTzyTSntIW%2F72d3A7&X-Amz-Signature=4a1e6de5cdfb3d1b50ee58fa5a042c6c008a41bceae59d3b42753eb98941c8e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R6FVEYBE%2F20251231%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251231T061922Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDYQSFxaVPG0quyukjd0C0BRlo6DIIBMuplbE5SiO8peAIhANQUDA8RmUGPlf%2FwVJzSaYLYmM%2FYu74VMC0QLxshXVbJKogECMb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy4OgFgp955gybh26cq3AMe8LOqcgwlLYwuQsaW%2F2VyMGqABILHaQZsLxd2gLA%2B1j4lChiow%2FrRAt3%2Fbwn4mXZBtDqxWewHUUFGeg8Aa8ahLM2Cs%2Fn%2F22ccYS0VnABw9ursYwZdARyOuRAQk9x4i%2F2Bx36aYOXscHwIW8Esy6QOlh74CEwNxqhDd2XTQAJWlB54klQ7Vs9pjKpw4JyPkq%2B1GN%2BbxCaUpNRy7mqJcYUkbP2BUKA8YCm0ger6hqsfjQ7VGqRO9l81a0hWDr3AJuZqpDl9fWl06IlCB6Yeq75Nq1e5KEYOhI%2B%2Fx2n0fxTUxTl8Lgut2ci607O5Ub4nbf05pLROIlptUNJXAoHF5HCYPGQMj1ChY8aj7PtGwFcSnMZOj10qi7TKnXba5uVMybpHj10GSIvrEb3lK%2BbOY2kV%2BzAy6s7vJm%2BcfLLt3uCMiWPOVFWvBlqGtWgwR1zp2KOHYvSssW1%2F3UHuocF28jx%2BHfR5gHmQKwIXkuMmgfHe4%2FN7%2BXSGo4wHZngZTgfe9tvkQBfVXlfoC%2F4%2B3MPX6SHYwMDdk4vTV6jW5VZEtgW%2B1reeiAOn527M%2FsUpkThXU9alt4rS4vIqYkmKrTc1ZJ8M%2BQYQyw%2Fks%2Bgaw%2BWhZGGxpwgya1V%2BmE%2BJZwmBFDCx1NLKBjqkAZSo9GbKhqv6QX0tMiZsBrHCsIvwL%2FoEbUAkNcm4llvk7F1pJ7ud6L9zCeiVVUhZGo43AepTcWYD1LeQ3HcOSVAUkTRvYfl4X7jmgW5jZtqq%2FiSDSLmq2V%2BWrzPYf676G3%2B3SCgf7WhLanyIbfmfexju1ecDM8PMi1bbzWWGdTXJHp1xbc%2Ba%2B8Z0tbpjaNaLg8aSyMJF9v6hTzyTSntIW%2F72d3A7&X-Amz-Signature=df0ec4ee01c37299ba1b5eaedfd65f47cf2918183e0f6ee9f51034e031e72559&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
