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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3DTWG7D%2F20251216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251216T122421Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDUbjFNU6p9osskFvT2uXUr4LwEwCoFbDLWN7Z8OTB6XAiEAzoVFVvWaMMBDzO%2FL5ADytsiXGJxKZ9ABro8C5WUfkRUq%2FwMIZRAAGgw2Mzc0MjMxODM4MDUiDP%2BUA0S5O6E9IaIaVircA9HGf7g15eZJ6Q1nFPWTVPpRy5UA%2Fkn41WF0FdbiaL5lbjZwWEJk5OxfuazuHjz4B7uEer7uFbymJSyyhwsrSxFycgbL5Hp5ofBR6Jz3lOw6%2BWtvRxkSgrloNK3Z6PL86s3R2jICNnsgyxQ9UHJlqgnBfjNZ8cYCAx2hTJgq6Mf3p3JD1sYkTuLiydcilHHYQDH2IGhtxQDUZWFNdA%2FqW%2F4RYCp5PaWOpHxKHKDp9eU5pRSnLpQxaztr0oOUtrGCzfxRiHZTNzpG5IdYRlBmj5o9lEjvbljrYZiSTkBAv9Nfpj2sdgerxP%2Fr%2FLGQ5h8DC6lwV8aU06W%2FhD0dpfsKtrLH8ntWvfsEEAgl%2F8Jep0jyho0bqJooNvJRJ3uWxG0Bp2Ggzqnqg8gizy4Mgl8BrUXeNJf41nA9s9Tb82osLQa6L20OnyzkNHCx6eWGnbB%2FKzHLBfMzEOcy444CWJaOCJeA43tGaCEryqZha1fyGyC2zpBRe0yJsE4qD2G75L5dn1kT8yva3QsvVVctlonfVYTZTTZv8tbFJIVa8doTtrLLlp0W4M0SbsNKfXQbUJ6H%2FKyigCufB1JaO%2FdNCW%2FxTs5UftFOs8bUZnape8wNk13PVZbsmFZ6eungq07uMJ%2BZhcoGOqUBIMC4jf105oG%2FPYPNHmcRmFrdwdMgk8fvAjJlGFvSmZtR1MWV9ZIxOpe1Bk0w3bZCRXB7vJXHa0q7Q0Tl1vauz5b5c7W2X2th3GZXPeElxQxdiaFm%2FxaI1jVfdoYCKhMgbs5uVPDsGVWsvPe0bTc99%2F58iWfncoT9Fn5%2BXBf2goy5Vmx73O%2BGL9P%2BEAGDNta19kGVjku5sveSn6JTHLdzuAWh3kLb&X-Amz-Signature=57b59ae5d6d8c2fd401d0383d87e938c76750d07a0b7193281ede8f85f569227&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3DTWG7D%2F20251216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251216T122421Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDUbjFNU6p9osskFvT2uXUr4LwEwCoFbDLWN7Z8OTB6XAiEAzoVFVvWaMMBDzO%2FL5ADytsiXGJxKZ9ABro8C5WUfkRUq%2FwMIZRAAGgw2Mzc0MjMxODM4MDUiDP%2BUA0S5O6E9IaIaVircA9HGf7g15eZJ6Q1nFPWTVPpRy5UA%2Fkn41WF0FdbiaL5lbjZwWEJk5OxfuazuHjz4B7uEer7uFbymJSyyhwsrSxFycgbL5Hp5ofBR6Jz3lOw6%2BWtvRxkSgrloNK3Z6PL86s3R2jICNnsgyxQ9UHJlqgnBfjNZ8cYCAx2hTJgq6Mf3p3JD1sYkTuLiydcilHHYQDH2IGhtxQDUZWFNdA%2FqW%2F4RYCp5PaWOpHxKHKDp9eU5pRSnLpQxaztr0oOUtrGCzfxRiHZTNzpG5IdYRlBmj5o9lEjvbljrYZiSTkBAv9Nfpj2sdgerxP%2Fr%2FLGQ5h8DC6lwV8aU06W%2FhD0dpfsKtrLH8ntWvfsEEAgl%2F8Jep0jyho0bqJooNvJRJ3uWxG0Bp2Ggzqnqg8gizy4Mgl8BrUXeNJf41nA9s9Tb82osLQa6L20OnyzkNHCx6eWGnbB%2FKzHLBfMzEOcy444CWJaOCJeA43tGaCEryqZha1fyGyC2zpBRe0yJsE4qD2G75L5dn1kT8yva3QsvVVctlonfVYTZTTZv8tbFJIVa8doTtrLLlp0W4M0SbsNKfXQbUJ6H%2FKyigCufB1JaO%2FdNCW%2FxTs5UftFOs8bUZnape8wNk13PVZbsmFZ6eungq07uMJ%2BZhcoGOqUBIMC4jf105oG%2FPYPNHmcRmFrdwdMgk8fvAjJlGFvSmZtR1MWV9ZIxOpe1Bk0w3bZCRXB7vJXHa0q7Q0Tl1vauz5b5c7W2X2th3GZXPeElxQxdiaFm%2FxaI1jVfdoYCKhMgbs5uVPDsGVWsvPe0bTc99%2F58iWfncoT9Fn5%2BXBf2goy5Vmx73O%2BGL9P%2BEAGDNta19kGVjku5sveSn6JTHLdzuAWh3kLb&X-Amz-Signature=d002087fc2a623f0d3f1677d2f389466c783bcf5a7e610b65c29b46149cab09f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
