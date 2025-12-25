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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QJCJQQGH%2F20251225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251225T181655Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQCDalJuDD3uIx%2Fp0EpKmZ%2Fw%2B8W7274%2F5B%2FixbLgswyN5wIhAIabfTVMLBYyyikDZ%2BV2LjzoGN7ODVCgchuy0e6sp5FRKv8DCD8QABoMNjM3NDIzMTgzODA1Igwac9DywQ6OJA2SQvQq3AO9RB0H1mNt8H4oRgfZ%2BzUM0gww8QPjnQEvo72a850RUzbvuVawxIScomJSjzCWf%2FcJ9b4XWY4Nw3U9qTDYkXH9vXsrvqK%2B%2BZadt%2FX2SzgkQoE%2FYslmfs%2BKp%2Bwnb%2FA1oddo46bsSNyAlgad19Pedcq5hHSJ4JVDRxHNppRA86RQonuqiR8RuGGjGlp%2BCdzY6gY0sR85JnK0VfW3wqKXWps7M0RA7kQr3%2BKZxipjAjUhXf23XMoJBEA09DdUM%2B4X7LBoUWZWn9dpNS4pqwBk1%2F57DKnGoCiwtuJLwZPoYPKAAa8I1R3gzkWTvtX68np6quavmW7ZTg7mubvhazgpEHKOev23sIE%2FdSMIAObBhL3hpcrtNSx3COIHDaa%2BpvyCzIeDcihw5nBAv5UeSuDtMPQbcPd2xN0N%2B%2FAY78VI10zV%2BUcrMTgTHBL2aa8L37KU7UQkiQP2sggC%2FNP31w5bhhUkk%2BhUQjLm8KPftVQHh1XpnWYRMXdG1zFv%2Fzp4k2FYz%2BwOgNhCuHG%2BcHM5PTY%2Fwf6sfOeEZcflwnHDmWRLuLukZ4ZxQ%2FcMXKWf4W1KPFZNKBrGgkDug3ReU0HFd%2B4gTab0vc74Nsj7tEt4GSHTHaZkNTtpMXGxM%2F%2F17T7YLDCwjrXKBjqkAY07wf%2F8RomfZDPaG0SC0KcnetFJoaS2Ma41hnb7y5ChGgXvoCzzGCsXN2POBP9jP5VJ5KtvLeNphghQ%2BQznAyaEplOe8GotDCrYY8o26DGQFNk5yW993yASwOQ6CvthkNksH4yr42oU8c4CaZpLIbg%2BGlFG7DTJU5fretfvVxM2bGNHmCEcFsBh1u4CCOSr4vrLEuqskZ4UlJ5Iqngjh9dofXkD&X-Amz-Signature=1d16d6720cdb50979d117050aca0594bf6ee24bc75bd08e4ea1d425140547f88&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QJCJQQGH%2F20251225%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251225T181655Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQCDalJuDD3uIx%2Fp0EpKmZ%2Fw%2B8W7274%2F5B%2FixbLgswyN5wIhAIabfTVMLBYyyikDZ%2BV2LjzoGN7ODVCgchuy0e6sp5FRKv8DCD8QABoMNjM3NDIzMTgzODA1Igwac9DywQ6OJA2SQvQq3AO9RB0H1mNt8H4oRgfZ%2BzUM0gww8QPjnQEvo72a850RUzbvuVawxIScomJSjzCWf%2FcJ9b4XWY4Nw3U9qTDYkXH9vXsrvqK%2B%2BZadt%2FX2SzgkQoE%2FYslmfs%2BKp%2Bwnb%2FA1oddo46bsSNyAlgad19Pedcq5hHSJ4JVDRxHNppRA86RQonuqiR8RuGGjGlp%2BCdzY6gY0sR85JnK0VfW3wqKXWps7M0RA7kQr3%2BKZxipjAjUhXf23XMoJBEA09DdUM%2B4X7LBoUWZWn9dpNS4pqwBk1%2F57DKnGoCiwtuJLwZPoYPKAAa8I1R3gzkWTvtX68np6quavmW7ZTg7mubvhazgpEHKOev23sIE%2FdSMIAObBhL3hpcrtNSx3COIHDaa%2BpvyCzIeDcihw5nBAv5UeSuDtMPQbcPd2xN0N%2B%2FAY78VI10zV%2BUcrMTgTHBL2aa8L37KU7UQkiQP2sggC%2FNP31w5bhhUkk%2BhUQjLm8KPftVQHh1XpnWYRMXdG1zFv%2Fzp4k2FYz%2BwOgNhCuHG%2BcHM5PTY%2Fwf6sfOeEZcflwnHDmWRLuLukZ4ZxQ%2FcMXKWf4W1KPFZNKBrGgkDug3ReU0HFd%2B4gTab0vc74Nsj7tEt4GSHTHaZkNTtpMXGxM%2F%2F17T7YLDCwjrXKBjqkAY07wf%2F8RomfZDPaG0SC0KcnetFJoaS2Ma41hnb7y5ChGgXvoCzzGCsXN2POBP9jP5VJ5KtvLeNphghQ%2BQznAyaEplOe8GotDCrYY8o26DGQFNk5yW993yASwOQ6CvthkNksH4yr42oU8c4CaZpLIbg%2BGlFG7DTJU5fretfvVxM2bGNHmCEcFsBh1u4CCOSr4vrLEuqskZ4UlJ5Iqngjh9dofXkD&X-Amz-Signature=ca9bbb1fcd91fc09e9ac0d23aa4eda7499dde48939dafaef1889d38c543b6ab8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
