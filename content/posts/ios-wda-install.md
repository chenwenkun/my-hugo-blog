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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y4MSCQRU%2F20260427%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260427T131611Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFCQx0L0qIA3KcdVOfNnnrcJB44MlYmouTL%2Fbj4pewSyAiEA2FvNYTJTLb6DBa5gPXbYE9SlJDCCezefNV09Wu9p6c0qiAQIxf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCU9r%2FYxfaMkX2rJ%2ByrcA6SkNn0kLleCSrup%2FA9qjhHd394yDxG3fBXmxGA2FbNj1ctXT%2FG0pkZeYdiKN6eaq%2BQ8%2FZX3CgygiP%2BH5WZ5fEuZPfhp5Mywq%2FZjahKqmMlsXGRT%2B9GJllJh%2BC93igQaCA0x6aMhUgannuxanT4PV3lZQbZunz061fWmoH%2BGGtt%2FML3hRnsupOa2OBNskb4Cl478xZxDyjprV63aPG1vNeRQMw6XaD%2F3cJ%2FPJ9Aui18CYHAlS2Mq6bRjRCLlMX22EG%2FUYJuUxuYldfed82UIOBhRDureAw1eVkbDvkVE0XZ4qdQRAT0ChX20hD4Fbm5kCMEQIK%2FNvFX11NoUv9yh7QsTMErXLp1ZSUo1Rk0EBBDF0Kn%2BhbqDiwu52c9guuH4A1coH5uVpbvQeNPUO7r23JFqhV8dHavdnDsvyoiwbUtplb5Wz0NvQ8ZJ%2FC1x0nZG5TQfRctOHSjIoOO11Am3ROgBPn%2BZvhA8P2X8vXA6FM9KZQ8inozj8LpfDjIS53bhCqQYm2doISrecEFy%2BtCWDsC7fzc5vIS8%2B6wicxQYv5%2FBfqx8YVgvHqoiCizALKCoZESUSki2GHnrY6%2BLbISJB8gL7w9bXwSq87seiCJNmWOVRz7KT%2FSTNDUvX9avMJ6jvc8GOqUB5nYeXY4soN%2BAWLa2KnHBYUdtu1cf05AS2I53RCqj3iyfaqoC7pNLXYVhxt%2B1n5S2bg1pvY%2FhaZpPA%2Bc3PxkI2DvFFGIBNKySN2Nj82dn6sBL75mh0dKKt4utO9UPCyWn7irb5nDAvRmQyFticdPL%2BA060r1o2KBlZYRZ7NOOr8%2Flc2hOfRNT48kl2yCQdJxTM92PxMp85%2FxTooPMMT6QH%2B0gVUXX&X-Amz-Signature=02d0572670195381bae46db5c6ac33f8a0062be0a4576859414ba90c2c0250c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y4MSCQRU%2F20260427%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260427T131611Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFCQx0L0qIA3KcdVOfNnnrcJB44MlYmouTL%2Fbj4pewSyAiEA2FvNYTJTLb6DBa5gPXbYE9SlJDCCezefNV09Wu9p6c0qiAQIxf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCU9r%2FYxfaMkX2rJ%2ByrcA6SkNn0kLleCSrup%2FA9qjhHd394yDxG3fBXmxGA2FbNj1ctXT%2FG0pkZeYdiKN6eaq%2BQ8%2FZX3CgygiP%2BH5WZ5fEuZPfhp5Mywq%2FZjahKqmMlsXGRT%2B9GJllJh%2BC93igQaCA0x6aMhUgannuxanT4PV3lZQbZunz061fWmoH%2BGGtt%2FML3hRnsupOa2OBNskb4Cl478xZxDyjprV63aPG1vNeRQMw6XaD%2F3cJ%2FPJ9Aui18CYHAlS2Mq6bRjRCLlMX22EG%2FUYJuUxuYldfed82UIOBhRDureAw1eVkbDvkVE0XZ4qdQRAT0ChX20hD4Fbm5kCMEQIK%2FNvFX11NoUv9yh7QsTMErXLp1ZSUo1Rk0EBBDF0Kn%2BhbqDiwu52c9guuH4A1coH5uVpbvQeNPUO7r23JFqhV8dHavdnDsvyoiwbUtplb5Wz0NvQ8ZJ%2FC1x0nZG5TQfRctOHSjIoOO11Am3ROgBPn%2BZvhA8P2X8vXA6FM9KZQ8inozj8LpfDjIS53bhCqQYm2doISrecEFy%2BtCWDsC7fzc5vIS8%2B6wicxQYv5%2FBfqx8YVgvHqoiCizALKCoZESUSki2GHnrY6%2BLbISJB8gL7w9bXwSq87seiCJNmWOVRz7KT%2FSTNDUvX9avMJ6jvc8GOqUB5nYeXY4soN%2BAWLa2KnHBYUdtu1cf05AS2I53RCqj3iyfaqoC7pNLXYVhxt%2B1n5S2bg1pvY%2FhaZpPA%2Bc3PxkI2DvFFGIBNKySN2Nj82dn6sBL75mh0dKKt4utO9UPCyWn7irb5nDAvRmQyFticdPL%2BA060r1o2KBlZYRZ7NOOr8%2Flc2hOfRNT48kl2yCQdJxTM92PxMp85%2FxTooPMMT6QH%2B0gVUXX&X-Amz-Signature=b113b6ec92edc9f0f7e0c1fcb0a773e07c9e517ab649e0f0bec5dae6b1298b84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
