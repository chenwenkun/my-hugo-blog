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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YV3QIXDK%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T131935Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2Mow%2BsSXThiryaGsivub7SjzD%2B3xYWEQ00dGiv9%2B8aAiEAx7TGZWz033qMxA06nGJycXBtIaaWy8uOrTxqGfIfkEIqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLZELc2%2FtpIP7ukwLircAwlVFrn%2BPooZP8D5HVdhpZdds0DDN55tuRqwOguHZLDHs9ly3kzMKV9mNk6l9o1KzjQz4ryzTXErYqtBCli4U0pB3RWw0a%2FVu5LxeZ0G7ndb3JWMjJaSj1tW2C5XyuexFAy7G2qpsY0jqbdP1%2B2tfmhnW2KZ7rnZUURFci29kNBkGNnw3IiF%2BQdXoFTpkytuGCo8w6RQHVBVxZ8UrxMOYho%2BPa6Wj%2B4hnC7mb1oIEcO4UzsZJumJDBaOllGra2FxKVPniTi9irgZ%2F6HNZOVor3oiWRWgCZXvT83%2BUA0AYFMz3Ys7EPWf1OexWK%2BG%2BX1TVXX8eq6LqvaBGkW47jiIbD77iyih%2BsqUquJhR%2BzgpG7%2F6Mdz9i5BP5euV7nryXJfSSF88SRGVBFNbgt98TipjgBiMyGBBWIT4GGx0ugG6TSXsVT693MIp8SZutzbVGFLhXmCGmjhCBrBf3EMZv6FEeXfuHQM6pJir2qmoSLhYp9FTSNO01w2IDXisqgp8%2F0rpwbP7yC8268sfGLt%2BXHCWJycGl2m4KdrHfii2fnaTOxT1BgaJe5l1gRhcMYQ55hfvJ9TAm1Abwm1HfQh4dOqoEY04PgRNNv%2FNm6i09BNATNaihRzOgse1eBX4sLgMO2tldEGOqUBqDMTvaoZjFtofVmUSIyqdBRUF2zIaYdt3NytRXEWuGoOYJVqTwtWv0s9R2uN7jym9NpqaT%2FzFezp8sZPjkRxZjKBNM4ukZIkTze62Ke8%2BUaJKSbO5eqR742KLcb%2BQoefxqAz1o6SPfQjkBqpKM%2FbvDwEWLB9co4wb1urtqeHp71v7hnrKQWR0f1Mlzkh3uujExgp5YtiZn0uJOJHc9WXxO7JB%2BFw&X-Amz-Signature=2a54291fe15d4e815cb80c54d117604fa91644989338e5f19d93e662944455ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YV3QIXDK%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T131935Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2Mow%2BsSXThiryaGsivub7SjzD%2B3xYWEQ00dGiv9%2B8aAiEAx7TGZWz033qMxA06nGJycXBtIaaWy8uOrTxqGfIfkEIqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLZELc2%2FtpIP7ukwLircAwlVFrn%2BPooZP8D5HVdhpZdds0DDN55tuRqwOguHZLDHs9ly3kzMKV9mNk6l9o1KzjQz4ryzTXErYqtBCli4U0pB3RWw0a%2FVu5LxeZ0G7ndb3JWMjJaSj1tW2C5XyuexFAy7G2qpsY0jqbdP1%2B2tfmhnW2KZ7rnZUURFci29kNBkGNnw3IiF%2BQdXoFTpkytuGCo8w6RQHVBVxZ8UrxMOYho%2BPa6Wj%2B4hnC7mb1oIEcO4UzsZJumJDBaOllGra2FxKVPniTi9irgZ%2F6HNZOVor3oiWRWgCZXvT83%2BUA0AYFMz3Ys7EPWf1OexWK%2BG%2BX1TVXX8eq6LqvaBGkW47jiIbD77iyih%2BsqUquJhR%2BzgpG7%2F6Mdz9i5BP5euV7nryXJfSSF88SRGVBFNbgt98TipjgBiMyGBBWIT4GGx0ugG6TSXsVT693MIp8SZutzbVGFLhXmCGmjhCBrBf3EMZv6FEeXfuHQM6pJir2qmoSLhYp9FTSNO01w2IDXisqgp8%2F0rpwbP7yC8268sfGLt%2BXHCWJycGl2m4KdrHfii2fnaTOxT1BgaJe5l1gRhcMYQ55hfvJ9TAm1Abwm1HfQh4dOqoEY04PgRNNv%2FNm6i09BNATNaihRzOgse1eBX4sLgMO2tldEGOqUBqDMTvaoZjFtofVmUSIyqdBRUF2zIaYdt3NytRXEWuGoOYJVqTwtWv0s9R2uN7jym9NpqaT%2FzFezp8sZPjkRxZjKBNM4ukZIkTze62Ke8%2BUaJKSbO5eqR742KLcb%2BQoefxqAz1o6SPfQjkBqpKM%2FbvDwEWLB9co4wb1urtqeHp71v7hnrKQWR0f1Mlzkh3uujExgp5YtiZn0uJOJHc9WXxO7JB%2BFw&X-Amz-Signature=a616f7d41cefe5c52896062d02377a7d9481023e98375867d6cc02704f6e2ce6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
