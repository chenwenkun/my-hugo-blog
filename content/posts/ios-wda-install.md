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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V743FHT7%2F20260522%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260522T084714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJGMEQCICcZdigulzNOfvkB9a9dAz%2FLxcgZihbATdcNrlaSqtWvAiBgFQUpIoGw6nySaSQWa0VjYGTR8FEU%2BM017lBGU31JZir%2FAwgZEAAaDDYzNzQyMzE4MzgwNSIM3rOY4IbQ1an5jn62KtwDPt%2Fa38zZ%2BWMLmmQOdJxQd32RSbt5sHHNc0NUIN2VVv%2BK5NVW797CP4PwKbF%2BdV0FNjIIZFyaFYxXHfLmMKPE9uVltB9WAULZh2xixjrRtFaTiB%2FKJRy6f4bpQ37ei9lNt3QtPAH65gnuiXqqql6SI%2BNJ8oiEq8qxWFes6shXqPGq4b6evTL7G2%2FTwsIQotx%2B34l2wGCf0thIuDd%2FWxu7zZIF%2F9sL3F3DNEX7tA1YTSzBVxmWM8PnyEQLsgZNXey84FwQs%2BYp7pk5v1p8Aj%2BXrxw3rh7CRGe6f9ZnytemwdUm13YzFXU60lNwVwis6RfdsLWcQ7m37O2zutMgVfc5OzoBAR%2B2dGl84Y98700rrPeInG7Ufgl8sfEPwkkBeRuqB89ZlVtmOPN3vHe1ENHA1Lb4VHije53KckoHSlst7%2F9gfKzEVtASkMC%2BEx2nrC%2Brs2F4B9WrQ6jwUqkm10xfTzHw4HtvftF8jyQn%2FulBgTGRzrNP0LU2vCFxatrlAI3dRNA%2Bzug7eNaQ67miS9it%2F%2B5eNxzMhHgXXWeV%2Fr5nOdEjHlAK0MXitzZqQSpThLGOBT1dtsUfVFAdRb6rOHT99MglVk%2F7zixU58xGAPsF6Ui2rOdAdOy%2FAlpAFIowvJ7A0AY6pgHu7w1peGW%2BKeWmO5WU8FmoPHVS6PAhM0US6HU1LxUWU46exp2mqursg%2FhCFpYFSIu27tWD%2FaISEvIw6KyZS7WmKIkjFnmoEIr%2BHglAenBejFQCT50FU8WzNmHUlm%2FrWcH7NeZosrPI5R7V%2BuhF7Ie8XfjmVqzyLcbcaFn%2B6aXtNvlHnQUw9eGH4oIaSQSxxs7U3oQ%2BCfqGA1%2F1k0MpxyFenluDQFBd&X-Amz-Signature=695b66dab7f291a04bbf2c16f7533522d7171b0a12ea021eb155121108ccf4e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V743FHT7%2F20260522%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260522T084714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFAaCXVzLXdlc3QtMiJGMEQCICcZdigulzNOfvkB9a9dAz%2FLxcgZihbATdcNrlaSqtWvAiBgFQUpIoGw6nySaSQWa0VjYGTR8FEU%2BM017lBGU31JZir%2FAwgZEAAaDDYzNzQyMzE4MzgwNSIM3rOY4IbQ1an5jn62KtwDPt%2Fa38zZ%2BWMLmmQOdJxQd32RSbt5sHHNc0NUIN2VVv%2BK5NVW797CP4PwKbF%2BdV0FNjIIZFyaFYxXHfLmMKPE9uVltB9WAULZh2xixjrRtFaTiB%2FKJRy6f4bpQ37ei9lNt3QtPAH65gnuiXqqql6SI%2BNJ8oiEq8qxWFes6shXqPGq4b6evTL7G2%2FTwsIQotx%2B34l2wGCf0thIuDd%2FWxu7zZIF%2F9sL3F3DNEX7tA1YTSzBVxmWM8PnyEQLsgZNXey84FwQs%2BYp7pk5v1p8Aj%2BXrxw3rh7CRGe6f9ZnytemwdUm13YzFXU60lNwVwis6RfdsLWcQ7m37O2zutMgVfc5OzoBAR%2B2dGl84Y98700rrPeInG7Ufgl8sfEPwkkBeRuqB89ZlVtmOPN3vHe1ENHA1Lb4VHije53KckoHSlst7%2F9gfKzEVtASkMC%2BEx2nrC%2Brs2F4B9WrQ6jwUqkm10xfTzHw4HtvftF8jyQn%2FulBgTGRzrNP0LU2vCFxatrlAI3dRNA%2Bzug7eNaQ67miS9it%2F%2B5eNxzMhHgXXWeV%2Fr5nOdEjHlAK0MXitzZqQSpThLGOBT1dtsUfVFAdRb6rOHT99MglVk%2F7zixU58xGAPsF6Ui2rOdAdOy%2FAlpAFIowvJ7A0AY6pgHu7w1peGW%2BKeWmO5WU8FmoPHVS6PAhM0US6HU1LxUWU46exp2mqursg%2FhCFpYFSIu27tWD%2FaISEvIw6KyZS7WmKIkjFnmoEIr%2BHglAenBejFQCT50FU8WzNmHUlm%2FrWcH7NeZosrPI5R7V%2BuhF7Ie8XfjmVqzyLcbcaFn%2B6aXtNvlHnQUw9eGH4oIaSQSxxs7U3oQ%2BCfqGA1%2F1k0MpxyFenluDQFBd&X-Amz-Signature=4d20a05e53d5e91f05667d7f32a014c057be4986cc247a8c54ef26848cc34592&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
