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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZUULB7SJ%2F20260426%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260426T183616Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCC2irD3wRbPDL8dtLB4aXh7mxMc3RCj2Xc7BrWGNx5wAIgL%2BYtUp7K3PpMqn%2BssU3eGp2mh02OOsrGDzkdHQBff1wqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFirQTHVi6LRQclFNircAy49iIvGq0FhjpLkd7J%2B3WhGn1SYWsgdb4fidIVivGIOkDJ5fx8rpVZn9dGRKrbKZ0aP03oqYw%2BOO6pvfMO4RA%2Fw5H3E%2FBOwO%2FBrZvmZGiAM3LVPpMDxYOaQP3NlDXsrCZBl%2BvJCF3f1FtHUgWHTBswQRVlm%2F7dtqTUfz3ehKAoKbHA0QTNnFpi9%2FS5IEHylI%2Biw5EXNBGjF7hSt%2FdREEYton7ldMLxsiGQzV7175sseQ2w3WDdKAJc5A0Aeq%2BnNn%2FYHNwBoGUwTU6wZ37mVHtRIE8yFXsD08ELVoWz7LfifA%2FgRxf6EQyaL%2BSvqUT7N021E0M4Ux8qLEf6z0hlayQyE7hYjAJbNf7OEjoP%2FIlqdZPzyd41TBHg4YSK2xM0ClhUzToDL0FaXKY63vue2QVK1qFofO370eEalwtcZk2zyaODWPWqbn7frAGSZ4j6wwiGnyjHfOTpyqVxzYuqxjXW6PaD3smm6ovqRsV6Ppr0ZxlSTNUYPup%2BQRqX4TDSFXBQJAQrMRt8OmOAS8SiwmYheE9WiyhrqDKYqlbhZiQb7I56EFrDcaDPDlPlk%2BgIT86zyz2%2FeOowXBNbSLNKk%2FiyNWgpGA7enYwtwjuqfmL9PUbaDcVwznmBpjuAUMPqVuM8GOqUBqr8azrW5Jh8AMmItn8Jb9a0rnIotKZZTv5X6984ZU9%2BAMkR%2FsWvXiLgku0LPN%2BGmsV18rjut80sKKfIbnOTA3JBRE9EMS1xe0NRphURpq7QybmRZTS7p%2Bcy8EL4ZAmUFB56jVIOVcTCcPqCAnN0eKH4Lc%2Bx9oo4iulJWdu2ukneOPo%2BQUYH%2BtHCCQfw5BqzIPoDtkDbIIltHymLLUv24Ht2fx0AR&X-Amz-Signature=25f570be525bd58deeb1574affde7945d3e87617462c98961aa282ce83ff8352&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZUULB7SJ%2F20260426%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260426T183616Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCC2irD3wRbPDL8dtLB4aXh7mxMc3RCj2Xc7BrWGNx5wAIgL%2BYtUp7K3PpMqn%2BssU3eGp2mh02OOsrGDzkdHQBff1wqiAQIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFirQTHVi6LRQclFNircAy49iIvGq0FhjpLkd7J%2B3WhGn1SYWsgdb4fidIVivGIOkDJ5fx8rpVZn9dGRKrbKZ0aP03oqYw%2BOO6pvfMO4RA%2Fw5H3E%2FBOwO%2FBrZvmZGiAM3LVPpMDxYOaQP3NlDXsrCZBl%2BvJCF3f1FtHUgWHTBswQRVlm%2F7dtqTUfz3ehKAoKbHA0QTNnFpi9%2FS5IEHylI%2Biw5EXNBGjF7hSt%2FdREEYton7ldMLxsiGQzV7175sseQ2w3WDdKAJc5A0Aeq%2BnNn%2FYHNwBoGUwTU6wZ37mVHtRIE8yFXsD08ELVoWz7LfifA%2FgRxf6EQyaL%2BSvqUT7N021E0M4Ux8qLEf6z0hlayQyE7hYjAJbNf7OEjoP%2FIlqdZPzyd41TBHg4YSK2xM0ClhUzToDL0FaXKY63vue2QVK1qFofO370eEalwtcZk2zyaODWPWqbn7frAGSZ4j6wwiGnyjHfOTpyqVxzYuqxjXW6PaD3smm6ovqRsV6Ppr0ZxlSTNUYPup%2BQRqX4TDSFXBQJAQrMRt8OmOAS8SiwmYheE9WiyhrqDKYqlbhZiQb7I56EFrDcaDPDlPlk%2BgIT86zyz2%2FeOowXBNbSLNKk%2FiyNWgpGA7enYwtwjuqfmL9PUbaDcVwznmBpjuAUMPqVuM8GOqUBqr8azrW5Jh8AMmItn8Jb9a0rnIotKZZTv5X6984ZU9%2BAMkR%2FsWvXiLgku0LPN%2BGmsV18rjut80sKKfIbnOTA3JBRE9EMS1xe0NRphURpq7QybmRZTS7p%2Bcy8EL4ZAmUFB56jVIOVcTCcPqCAnN0eKH4Lc%2Bx9oo4iulJWdu2ukneOPo%2BQUYH%2BtHCCQfw5BqzIPoDtkDbIIltHymLLUv24Ht2fx0AR&X-Amz-Signature=2b7e5e2a550ff177f5dbd26e7f66aeac7a9a1455cf415f89e6762e5cb2da8d07&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
