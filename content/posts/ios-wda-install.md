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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TOBYVKWX%2F20260411%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260411T064854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHcaCXVzLXdlc3QtMiJIMEYCIQCwNWPwiBpTM5iPysCmlb%2BatGQ5RLDqbbwprZEoNOJcIAIhAJiJ5z2TNzlSbpOJeI783qYBeyHA%2FGH3lRbc0o82xY7%2BKv8DCEAQABoMNjM3NDIzMTgzODA1IgyZzpQyT5ZG497jHC8q3AMxiZKCa8iw5GLh84IKB0FdnpUgVvI69drbiImOLV1GgvxfSXP8AXIaaqr8YQVvVAmjdDI3tlLyz3C7VSippmGalzwpqQZk0kywaPre%2B0n2kXd%2BqCak6tT%2FNqQ%2BAxYAAvCw%2BYVdk3%2B8s0r4feUTCGwzAEtmc5C9auVgWyFR54rc7LVEYQ9iF47PSC5a2iYqglq1vC7TuOuUjNZb4KAnAE14tSDJPLBFtdoBFfo%2Bjs9Y8jQHmdh2FY9wtCHVQQMQs4d9lB%2Fj0a3cKvKhf9FIq9neNihl%2BFU6pbpdZUHiHQFpqcPpWFOBM3M9CwuzPIB3WDbWVwQJMZ9GmoxMg0Gz7GgsGon7A3BHdmwdFMuwcocU7MHSkkGp3cr7MOxV%2FfY%2FeEcq%2B9O%2FOuNsJIz%2BT31dYhO2d6EL3uJXZiRUp2h33vcrbOwf061WVwUPSze86pb1H6%2FwtDV6t8Xv%2FMcregIP8Q4HXUw2ecVQ5aKBo8cwb%2BrdJp9vIRAGqXuTN%2FSlP%2FfodX41AXlpgVXaaDjx90pHVEuYbmx4AS737ZS%2FaEba8OLk5E95%2FvmshyCjRQHVkQ81oHSa1pRVA%2FzgpOaDVvyTW%2BZtaBs9lgN2t1ogmOPoJC7gWpPKHx%2FWzRuT9%2F%2FOPDCr2ufOBjqkAZA1OIamNjYaA6gY1vewNUcBZmWBZUvoxNVj2Ha%2F6wr9mEwVUS7yeXUiMTTgb0vk5uYFlKK54xHeGuMORQBsGGGUb46wLd%2BsCsR09iwfCVjtuC%2FEW6%2FCBBM5iRoYdNpDfQHCMktERyMUWQWBPx58%2FI6H%2F7k6EPhD4mzMNeMAbpEfvOcTjnERH5iRB2fjpDfUwSO3ojs8Ge4GXFz2tAZJDjOivfuv&X-Amz-Signature=df54f83fe2df5b09c1b90483195db27ed55ef0cb947fce768d3946fbc7e423e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TOBYVKWX%2F20260411%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260411T064854Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHcaCXVzLXdlc3QtMiJIMEYCIQCwNWPwiBpTM5iPysCmlb%2BatGQ5RLDqbbwprZEoNOJcIAIhAJiJ5z2TNzlSbpOJeI783qYBeyHA%2FGH3lRbc0o82xY7%2BKv8DCEAQABoMNjM3NDIzMTgzODA1IgyZzpQyT5ZG497jHC8q3AMxiZKCa8iw5GLh84IKB0FdnpUgVvI69drbiImOLV1GgvxfSXP8AXIaaqr8YQVvVAmjdDI3tlLyz3C7VSippmGalzwpqQZk0kywaPre%2B0n2kXd%2BqCak6tT%2FNqQ%2BAxYAAvCw%2BYVdk3%2B8s0r4feUTCGwzAEtmc5C9auVgWyFR54rc7LVEYQ9iF47PSC5a2iYqglq1vC7TuOuUjNZb4KAnAE14tSDJPLBFtdoBFfo%2Bjs9Y8jQHmdh2FY9wtCHVQQMQs4d9lB%2Fj0a3cKvKhf9FIq9neNihl%2BFU6pbpdZUHiHQFpqcPpWFOBM3M9CwuzPIB3WDbWVwQJMZ9GmoxMg0Gz7GgsGon7A3BHdmwdFMuwcocU7MHSkkGp3cr7MOxV%2FfY%2FeEcq%2B9O%2FOuNsJIz%2BT31dYhO2d6EL3uJXZiRUp2h33vcrbOwf061WVwUPSze86pb1H6%2FwtDV6t8Xv%2FMcregIP8Q4HXUw2ecVQ5aKBo8cwb%2BrdJp9vIRAGqXuTN%2FSlP%2FfodX41AXlpgVXaaDjx90pHVEuYbmx4AS737ZS%2FaEba8OLk5E95%2FvmshyCjRQHVkQ81oHSa1pRVA%2FzgpOaDVvyTW%2BZtaBs9lgN2t1ogmOPoJC7gWpPKHx%2FWzRuT9%2F%2FOPDCr2ufOBjqkAZA1OIamNjYaA6gY1vewNUcBZmWBZUvoxNVj2Ha%2F6wr9mEwVUS7yeXUiMTTgb0vk5uYFlKK54xHeGuMORQBsGGGUb46wLd%2BsCsR09iwfCVjtuC%2FEW6%2FCBBM5iRoYdNpDfQHCMktERyMUWQWBPx58%2FI6H%2F7k6EPhD4mzMNeMAbpEfvOcTjnERH5iRB2fjpDfUwSO3ojs8Ge4GXFz2tAZJDjOivfuv&X-Amz-Signature=63accf4e422ead31ca7ba125cc3fa2e8b3122b201e53d6e8437ba401cf6c7407&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
