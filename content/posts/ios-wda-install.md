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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46645SBMAOX%2F20260429%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260429T132119Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJGMEQCIEpmODALDv3k3Bk%2BUlRsrdL2IgWdBp3GLMJtxl70TtzNAiBiBadP2eZc4X6dafz8KHNsHosRoeWDlGwwXx1lrDZC8yqIBAj2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM82gpE014yQwtzGzkKtwDVhpGe03Exi5uNUnhvNqWoAxsxl2gUlqb%2BaXGMRZUIdrD8N3u2wAXqH9GodmAmSXEaHScALmTnag1dSkB6CP3c2%2FgXJBABiDBtAuxHB72VGd34D%2FJY0JlrFwKE2w0W8n7haURNj82Bja%2FScFUb7nLZ0guVnnpBGWuRf7rYGa9sHFztxhO2vMZJ5XJ28jLxxLofBQ8YyrkteKsHcLpzVLgEBtKRPwy8RLtIqMNOYRqPAyBFnWSHNIJ7ru7HaI9mNVxlygDk0ttL0X3TsUKBTDcqNW59pb3pq6MqGIll6dn6%2FwbwkNwCFixG6EhTLLRlW6t3roxn82qnbdNpHMb7bhtxEIY57xJxCE%2Bw6qmn413VYHZxMChqyWNoFj23PxFcOGyLbpZJ%2B0b3ZE0vNn04V7AvL7nYZX5U2WGedcw43rSTTxiQoC7CC3Lg0V6u22IEN50%2BONivbIEeMz8eOS7fI40IwYecNs0oM6ftk%2BZlS1oZULMb8xtB4RDZW4GgBmAi%2FCBrIQ2t9gx7OmMAifnN6APICWGj1yRD%2Bw9FWH4f7qPI2FEZOw60D5lqByjFbSCyWpH4zcp%2FqbFEibPpezswAePCG1zKUl8pAHGi8aW3S2dKxjupbj1pyF60v8FGugwufrHzwY6pgFQ1fFbK%2Fz45OFyP0c9lVclNtluJFuQDNkB0HtSTehf5%2FzZVBmbln1bN4Vf8qEnNkHuj7KvhgjGqgeK34v869Joi84rkt%2BDTbtmbrRhhG74z%2F8l4VIbjg3YEf85H5FB0mS%2FsD8ZsLQkzX9MOrqWuxK2pBvEd%2BqJ%2Bscd66Vr60b4pCrij5bKYl3egT0hUCh82N0OM%2FGJOPHSbEOyRNXKoLtaBoD37%2FuQ&X-Amz-Signature=e0cae8d185f3b7923455c9f4c95a8eaf125db02fd168ecf65d3c04a1d49fea7d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46645SBMAOX%2F20260429%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260429T132119Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC0aCXVzLXdlc3QtMiJGMEQCIEpmODALDv3k3Bk%2BUlRsrdL2IgWdBp3GLMJtxl70TtzNAiBiBadP2eZc4X6dafz8KHNsHosRoeWDlGwwXx1lrDZC8yqIBAj2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM82gpE014yQwtzGzkKtwDVhpGe03Exi5uNUnhvNqWoAxsxl2gUlqb%2BaXGMRZUIdrD8N3u2wAXqH9GodmAmSXEaHScALmTnag1dSkB6CP3c2%2FgXJBABiDBtAuxHB72VGd34D%2FJY0JlrFwKE2w0W8n7haURNj82Bja%2FScFUb7nLZ0guVnnpBGWuRf7rYGa9sHFztxhO2vMZJ5XJ28jLxxLofBQ8YyrkteKsHcLpzVLgEBtKRPwy8RLtIqMNOYRqPAyBFnWSHNIJ7ru7HaI9mNVxlygDk0ttL0X3TsUKBTDcqNW59pb3pq6MqGIll6dn6%2FwbwkNwCFixG6EhTLLRlW6t3roxn82qnbdNpHMb7bhtxEIY57xJxCE%2Bw6qmn413VYHZxMChqyWNoFj23PxFcOGyLbpZJ%2B0b3ZE0vNn04V7AvL7nYZX5U2WGedcw43rSTTxiQoC7CC3Lg0V6u22IEN50%2BONivbIEeMz8eOS7fI40IwYecNs0oM6ftk%2BZlS1oZULMb8xtB4RDZW4GgBmAi%2FCBrIQ2t9gx7OmMAifnN6APICWGj1yRD%2Bw9FWH4f7qPI2FEZOw60D5lqByjFbSCyWpH4zcp%2FqbFEibPpezswAePCG1zKUl8pAHGi8aW3S2dKxjupbj1pyF60v8FGugwufrHzwY6pgFQ1fFbK%2Fz45OFyP0c9lVclNtluJFuQDNkB0HtSTehf5%2FzZVBmbln1bN4Vf8qEnNkHuj7KvhgjGqgeK34v869Joi84rkt%2BDTbtmbrRhhG74z%2F8l4VIbjg3YEf85H5FB0mS%2FsD8ZsLQkzX9MOrqWuxK2pBvEd%2BqJ%2Bscd66Vr60b4pCrij5bKYl3egT0hUCh82N0OM%2FGJOPHSbEOyRNXKoLtaBoD37%2FuQ&X-Amz-Signature=13a5e777b52c4fb11cbcda0f7e6d9bf8e43f45daa591a504737379667c791852&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
