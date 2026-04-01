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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXKOCHBV%2F20260401%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260401T070801Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCoRwpyRYiVQjulxpHDUJkrGcxS1x4upVXYqSI8d3zVdwIhALA%2Ba%2Be%2FFYrB2G%2BZwmKjSzeZ5L2JfWL%2B6SDhNCVHIWSlKv8DCFAQABoMNjM3NDIzMTgzODA1IgxhXpR0pwT5hQRe6NQq3AORVdPPgI1dcKUOJm%2BwFJiPSWHJu7cwLP8R8L8yHdqWTvGZeG0VTY%2FPh%2BZoGPu4rDa8Tn97vhx0XVF4yvsqNw6r7AaJO8YXreLl%2Bt1IqZTMgHHaHDYGhXIfLAvh4rOPbGNauWrwYmPYh7k0OekHbnt%2BhqYgZYvwDeaGCMDIMnbYqn1l23bd34hgXvhns%2FBVQtdKbiHyWK%2B9VYHuJQ0T491HaKS5CKbOnQyx60lQSzjrXmvQ89AkDOlkrll6ZehJPO%2BbAi2tL5gq9zDuZhhiYA2Opflx%2F0ChN3u%2BauIXArV2FhSfNxUPXWmCOSSu7zEV4f16NqQ1dV4BaUwjV70DApj7AdkTY5IwxDPYwsl9phuVJviTelGAjpem2NlzNaW9Z2BOmRQjihpU%2BQ83R5UHYiZuGejXivVTPFjkkjQbfblmwJiN%2FgCL8NudqPO6Fi%2BPm96ddy8du6%2BiObu3zy7UIvxR2Z7ce%2FKkmScCp53wPLBNFu%2Bywk43R87zJdhLtrxWprX9yE3o9QumbfSaU0OX8iJYxqOXtPyp1WADn9jBW1M2qnvr6B6iLoD1LCXY9hCd6EBrKaEvctbo3E64HhJJoLYe3GKwq5onZxkqYv1pzw%2F5MYa4KSQ4MJxyOhYZ1jC7g7POBjqkAUHDySnEFB%2F%2FsXaH4JCNwqO8LYTd%2F9dOnynrTurUhEeuKD3JTiduT3KEoEYAWxLpKVdl%2BwJ5jgadRr5QfTq1pkoYJ2NLlblCN3NBCxGVclRofBMeuG5RyYh1hIQrys5DIu5PnzcY0TgaWm7XQTeDwY9GvSBzpXsUcircUkTFIJrIwGWqUZ7KEDKVeYbXBg%2FjxnvXW9G2A53rjaoseQIBfdWLF985&X-Amz-Signature=ff75aeacec787d0c6f40c5eda2187d1c4af5be1f8d25d783e9db3e4c3e347c08&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZXKOCHBV%2F20260401%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260401T070801Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCoRwpyRYiVQjulxpHDUJkrGcxS1x4upVXYqSI8d3zVdwIhALA%2Ba%2Be%2FFYrB2G%2BZwmKjSzeZ5L2JfWL%2B6SDhNCVHIWSlKv8DCFAQABoMNjM3NDIzMTgzODA1IgxhXpR0pwT5hQRe6NQq3AORVdPPgI1dcKUOJm%2BwFJiPSWHJu7cwLP8R8L8yHdqWTvGZeG0VTY%2FPh%2BZoGPu4rDa8Tn97vhx0XVF4yvsqNw6r7AaJO8YXreLl%2Bt1IqZTMgHHaHDYGhXIfLAvh4rOPbGNauWrwYmPYh7k0OekHbnt%2BhqYgZYvwDeaGCMDIMnbYqn1l23bd34hgXvhns%2FBVQtdKbiHyWK%2B9VYHuJQ0T491HaKS5CKbOnQyx60lQSzjrXmvQ89AkDOlkrll6ZehJPO%2BbAi2tL5gq9zDuZhhiYA2Opflx%2F0ChN3u%2BauIXArV2FhSfNxUPXWmCOSSu7zEV4f16NqQ1dV4BaUwjV70DApj7AdkTY5IwxDPYwsl9phuVJviTelGAjpem2NlzNaW9Z2BOmRQjihpU%2BQ83R5UHYiZuGejXivVTPFjkkjQbfblmwJiN%2FgCL8NudqPO6Fi%2BPm96ddy8du6%2BiObu3zy7UIvxR2Z7ce%2FKkmScCp53wPLBNFu%2Bywk43R87zJdhLtrxWprX9yE3o9QumbfSaU0OX8iJYxqOXtPyp1WADn9jBW1M2qnvr6B6iLoD1LCXY9hCd6EBrKaEvctbo3E64HhJJoLYe3GKwq5onZxkqYv1pzw%2F5MYa4KSQ4MJxyOhYZ1jC7g7POBjqkAUHDySnEFB%2F%2FsXaH4JCNwqO8LYTd%2F9dOnynrTurUhEeuKD3JTiduT3KEoEYAWxLpKVdl%2BwJ5jgadRr5QfTq1pkoYJ2NLlblCN3NBCxGVclRofBMeuG5RyYh1hIQrys5DIu5PnzcY0TgaWm7XQTeDwY9GvSBzpXsUcircUkTFIJrIwGWqUZ7KEDKVeYbXBg%2FjxnvXW9G2A53rjaoseQIBfdWLF985&X-Amz-Signature=ff606d35ffc45872ea89b3636b01cbf652fcdedbb2434e527c43af1e040f7992&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
