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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z5PIKTLZ%2F20260120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260120T062143Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCwBrIuz%2FJXnWKcqJJEZ4inmLhavjLaSanOkfMQJNUaSgIhAIr%2F3HyKVY7N4Tcr6Opj2mP2muNh1%2BvKgeX4OQdga7rUKogECKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwNzz2FX67kx0m%2F6Dwq3APyzSK6kTfvMdSjQPw1POIOOkpYTvjQgrDfdmCRbS9oM4QQKk3M5jeQdxYUh3Q93KQler7UrY7eNfgCyxo1sZo1qBIyc%2F5lYTJBCVfisjYzIzJi4kdok3%2FrcK67XM9nyeSGzuwPB1LQevXijZp2lJhUee3RGLx5PUrKkiYYtjL7VYtlzwtAGpKcXEvL1ujIyp5dAuzVd2f08BxGLOpErervZ8FwasA6OHfn3FiV4ZJ21UJ6fOsBZAmfe6TUbADwQ9fmMTCPKbQXJWsPKOVeHqTZvQriMj98cLaP8%2FfzYieFziOF%2FzJ5yWHaq6kVlsmVeFxRnv%2Fv0p71cO%2FMi5mGQyUV1XVwD67Ct7ll33cf1G15I%2FVjawU0xuc6LR9JtGuidGJAGBLqG0RyC%2FWmc%2ByHAi0liyOnfcPyCFw5RYwK%2BByczz6eBd6APqbsQWu6Kqr989z0S%2FAA4ZVD2tKTN4NAUL39w3grXKqHjrkTQQvlgBDHN7poznThBmlgL6ujBzufj5us%2F6KSRJmIx0o1mPkPcM1LRHmTz3wbgNwmZbPtM0naE0Ys7U4gvXVfyUArhMcvpS9BZEfBapsR5Yhr3tsF%2FCH2JKKH3NmRzZyT9Fpcoqvo5zEK8p0ocpjiHuUbUDDDtrzLBjqkASNa56AqYilgZvPKHWHctXw13HOnjIFrgVHIUJIet5NKaPRbjGNyUo8VgTTUoF4RiVKzX1RMzYPBIPxlo6r9LXt6SesSMI2d7JcNE9FNnWAsa1%2Fhwc%2FZPORp92E9JjVZLoY28kFuNYssKpA3v%2FmfIe1Ga5MJw6vC7Jc7rFs5m6sXdSSobXIjeTYSPudCEfs2MqSdzu3I7z5VsSABsUNA250Dz16Q&X-Amz-Signature=15c171887a2b728dde15c34880d4997eeae600195cb79a5895214796a5bbbda1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z5PIKTLZ%2F20260120%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260120T062143Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCwBrIuz%2FJXnWKcqJJEZ4inmLhavjLaSanOkfMQJNUaSgIhAIr%2F3HyKVY7N4Tcr6Opj2mP2muNh1%2BvKgeX4OQdga7rUKogECKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwNzz2FX67kx0m%2F6Dwq3APyzSK6kTfvMdSjQPw1POIOOkpYTvjQgrDfdmCRbS9oM4QQKk3M5jeQdxYUh3Q93KQler7UrY7eNfgCyxo1sZo1qBIyc%2F5lYTJBCVfisjYzIzJi4kdok3%2FrcK67XM9nyeSGzuwPB1LQevXijZp2lJhUee3RGLx5PUrKkiYYtjL7VYtlzwtAGpKcXEvL1ujIyp5dAuzVd2f08BxGLOpErervZ8FwasA6OHfn3FiV4ZJ21UJ6fOsBZAmfe6TUbADwQ9fmMTCPKbQXJWsPKOVeHqTZvQriMj98cLaP8%2FfzYieFziOF%2FzJ5yWHaq6kVlsmVeFxRnv%2Fv0p71cO%2FMi5mGQyUV1XVwD67Ct7ll33cf1G15I%2FVjawU0xuc6LR9JtGuidGJAGBLqG0RyC%2FWmc%2ByHAi0liyOnfcPyCFw5RYwK%2BByczz6eBd6APqbsQWu6Kqr989z0S%2FAA4ZVD2tKTN4NAUL39w3grXKqHjrkTQQvlgBDHN7poznThBmlgL6ujBzufj5us%2F6KSRJmIx0o1mPkPcM1LRHmTz3wbgNwmZbPtM0naE0Ys7U4gvXVfyUArhMcvpS9BZEfBapsR5Yhr3tsF%2FCH2JKKH3NmRzZyT9Fpcoqvo5zEK8p0ocpjiHuUbUDDDtrzLBjqkASNa56AqYilgZvPKHWHctXw13HOnjIFrgVHIUJIet5NKaPRbjGNyUo8VgTTUoF4RiVKzX1RMzYPBIPxlo6r9LXt6SesSMI2d7JcNE9FNnWAsa1%2Fhwc%2FZPORp92E9JjVZLoY28kFuNYssKpA3v%2FmfIe1Ga5MJw6vC7Jc7rFs5m6sXdSSobXIjeTYSPudCEfs2MqSdzu3I7z5VsSABsUNA250Dz16Q&X-Amz-Signature=b9243218201561711aef403d422ec5d54151103f3b0bb83d2584fde65a5a90f7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
