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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QCN7KDN5%2F20251122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251122T061508Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJIMEYCIQD%2BbI6EENDRB917y1IDLRP1SNTvV4nPGoZ%2FRMFiARePnQIhAKqLq4ubE9zkmBKvJRm6CQp4gK7S1dXMR3YIMUKsSwhOKv8DCB8QABoMNjM3NDIzMTgzODA1IgwsC%2FXwM992IhkmVCIq3AOU3UUDaAJLevvrqOpWQlN6oIUnlCjlOCEFjLdTIG56rqhZRgAtKByOtLu2S4YLuqMJ5labBM9gAgPr7tDii7v4TWx%2B2IRe5MjQvbAr6zVINW5QE5LNYdYz3Yk4CDSpyZJQjLN1VHAklPmspIrHsyNFXt2wLckkTGTwpNEpuE4pPzbh8hh1jocygLtq4Kq7yXFYRruSuOCYEIbX59EG4LWdrgS97rfDb4ca7yMonuHscPsiOiaPd59rxrO02St5dxuo3Ik9nNdo20pJO9p3V2cwVWX1qwNEHY8zCSSaKhAO76uRJioWXURNdmZx8qIIdcwTbfF64CeCvnPdG7eA30rKmC7AY3UGmVATTimijadSo%2FgsurQlnMddogr5wQ74Tdpf21qiqlnHQ65WfpUOLb2Kqimt5r7HefmXdvQ5GQcUyecq8cQXJgVqEuDHmMp%2F4ebaZTF%2FjX%2FRu08VXFtiJq3452TZACwZK2bC6uSUpuNPnzkRqoERk2YZ70G4IDNuXmmLpTwep0klmzr1ttEuQzBh8WRzwoaTr42%2BNCpSTh8pQnI4xMwvhB5ZSQcW6wrOqEPqocAmNUiFJLq11ycIcj6Ll4b1fshl13CpYXCXPOB5LSe4SdrP0obY%2BqcqhzCrmYXJBjqkAYtis4hi5LfAHJ89bTRG0xp7BSw4VPeABpn%2FxaKE0BuDMvx%2FdmmS5yJsHDX2b3rfAILE4YnAO0YJHwCqpYl%2BCKorWa9Qjkgn8rNMKcwvmaMAzEbzPAjsW%2BlOr7gY5ejnyga5PoCmYUVCCZtD%2BcCSsFuTwtAPXDnLiI%2BZsf53LleTPwl2Hpo8uu1YnD3xYEDs3jMw8Z6Afj0Kfdw8d9ZLnD83J%2FeO&X-Amz-Signature=04c2f4703a3b60549ae05e323fe093c24b82b3c58720b2d7b9c00f0f97256af7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QCN7KDN5%2F20251122%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251122T061507Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJIMEYCIQD%2BbI6EENDRB917y1IDLRP1SNTvV4nPGoZ%2FRMFiARePnQIhAKqLq4ubE9zkmBKvJRm6CQp4gK7S1dXMR3YIMUKsSwhOKv8DCB8QABoMNjM3NDIzMTgzODA1IgwsC%2FXwM992IhkmVCIq3AOU3UUDaAJLevvrqOpWQlN6oIUnlCjlOCEFjLdTIG56rqhZRgAtKByOtLu2S4YLuqMJ5labBM9gAgPr7tDii7v4TWx%2B2IRe5MjQvbAr6zVINW5QE5LNYdYz3Yk4CDSpyZJQjLN1VHAklPmspIrHsyNFXt2wLckkTGTwpNEpuE4pPzbh8hh1jocygLtq4Kq7yXFYRruSuOCYEIbX59EG4LWdrgS97rfDb4ca7yMonuHscPsiOiaPd59rxrO02St5dxuo3Ik9nNdo20pJO9p3V2cwVWX1qwNEHY8zCSSaKhAO76uRJioWXURNdmZx8qIIdcwTbfF64CeCvnPdG7eA30rKmC7AY3UGmVATTimijadSo%2FgsurQlnMddogr5wQ74Tdpf21qiqlnHQ65WfpUOLb2Kqimt5r7HefmXdvQ5GQcUyecq8cQXJgVqEuDHmMp%2F4ebaZTF%2FjX%2FRu08VXFtiJq3452TZACwZK2bC6uSUpuNPnzkRqoERk2YZ70G4IDNuXmmLpTwep0klmzr1ttEuQzBh8WRzwoaTr42%2BNCpSTh8pQnI4xMwvhB5ZSQcW6wrOqEPqocAmNUiFJLq11ycIcj6Ll4b1fshl13CpYXCXPOB5LSe4SdrP0obY%2BqcqhzCrmYXJBjqkAYtis4hi5LfAHJ89bTRG0xp7BSw4VPeABpn%2FxaKE0BuDMvx%2FdmmS5yJsHDX2b3rfAILE4YnAO0YJHwCqpYl%2BCKorWa9Qjkgn8rNMKcwvmaMAzEbzPAjsW%2BlOr7gY5ejnyga5PoCmYUVCCZtD%2BcCSsFuTwtAPXDnLiI%2BZsf53LleTPwl2Hpo8uu1YnD3xYEDs3jMw8Z6Afj0Kfdw8d9ZLnD83J%2FeO&X-Amz-Signature=f8e7db2f762e686461460352c09876cfdd9e1bf3277fd39da4d0c71911f04a5f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
