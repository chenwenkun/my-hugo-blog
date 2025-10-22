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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QP6WF3PJ%2F20251022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251022T122213Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJIMEYCIQDINbbGOkmIjx4ETLvnd5ZH%2FKsB1oLIiw1EcwFUTVNrFQIhAM1D8l0EbeBwnTWWPw9YYcnAdXpWxXUb3GSqEF5Vh6NbKv8DCC0QABoMNjM3NDIzMTgzODA1IgwtSwfoql%2Fm9LSX%2BU0q3AMrH09b%2BZ2%2FWF7rAPABl%2BFgcnAy0Z1sLNS0vNE8oQSiEKWab%2FKUdGL9kVTgPJ37UhI23N%2FQ%2BovBh%2FkywQRNUpKtkZYA03D9EOpYBbBtoxvuAeI0JlZSGhvk7vu5Dt67ejF%2BEMlr8dcFnFx8tbiG1Uuo4U3lT2ZZWJjbmvkqtqIA8yMr%2BR4MnBOyOyDfLN88DEAQs1mrrVnUcYt6CqLKF9v4k6L2fBCUV9Ue4IIO1l5Awh%2FH%2FZcacrj7NKCfgPnzw57zz2n06qbONySLis%2FPAUUkxg%2Bf0abWjMjjE89ChT4v7bT5Qewav9QuHwfN0F1CFE6cz1OUdSXxATXHYq%2BSMwSvkKmyKH7jbx%2F%2Fo6YAo9Mq%2BY17BbDZpaK%2BOqjJsxgslXYrEiIN%2FNFk7CErN2qMvPmqWGX3pC4w5MUmFVcVvOIm4TCAIgTMuWWP26GFLfwk8t2pGu%2FaZYumlkmKyK%2BbkdS3Y1pwbmtVE8VE%2BYKz0WCx5Vou8DRUlhdiTaGR7DmRme1POdDRw70KeKkg1JN7mXR2stW%2FxZF3KoxFiMcmFJGucYceu8A4xvgGcfzLItSCInger3zHfkC2Ur5lKeaQU5sgiPEUA%2B2x8oEW0FwBB8r8yqGJeff6jeP94Z2PdTDuk%2BPHBjqkAYUUUaBI7Myfm%2B5wtUJP%2FhJUTARzcByySKQ7HnTMRARg5Ln6DrJOCK5IrFxnfFGeFkow0kRJIos6oivC1KbNqoR5MS51zOIwrmkOWrNt0YTAuMc2o8fJ4AM1NQ9T5z%2FI9FGHTxuv01b26Likh%2BVkw6zxAOHnVTliC%2FX6NXDb1x97Ef8llrpVJf9u22kNu7buanX7zV1cLS65kZKjHdvNd2v3a%2FjQ&X-Amz-Signature=501409e3438aa2040c7930c656880253d61b7ff1e140cfcf1951b5656b7d6bda&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QP6WF3PJ%2F20251022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251022T122213Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJIMEYCIQDINbbGOkmIjx4ETLvnd5ZH%2FKsB1oLIiw1EcwFUTVNrFQIhAM1D8l0EbeBwnTWWPw9YYcnAdXpWxXUb3GSqEF5Vh6NbKv8DCC0QABoMNjM3NDIzMTgzODA1IgwtSwfoql%2Fm9LSX%2BU0q3AMrH09b%2BZ2%2FWF7rAPABl%2BFgcnAy0Z1sLNS0vNE8oQSiEKWab%2FKUdGL9kVTgPJ37UhI23N%2FQ%2BovBh%2FkywQRNUpKtkZYA03D9EOpYBbBtoxvuAeI0JlZSGhvk7vu5Dt67ejF%2BEMlr8dcFnFx8tbiG1Uuo4U3lT2ZZWJjbmvkqtqIA8yMr%2BR4MnBOyOyDfLN88DEAQs1mrrVnUcYt6CqLKF9v4k6L2fBCUV9Ue4IIO1l5Awh%2FH%2FZcacrj7NKCfgPnzw57zz2n06qbONySLis%2FPAUUkxg%2Bf0abWjMjjE89ChT4v7bT5Qewav9QuHwfN0F1CFE6cz1OUdSXxATXHYq%2BSMwSvkKmyKH7jbx%2F%2Fo6YAo9Mq%2BY17BbDZpaK%2BOqjJsxgslXYrEiIN%2FNFk7CErN2qMvPmqWGX3pC4w5MUmFVcVvOIm4TCAIgTMuWWP26GFLfwk8t2pGu%2FaZYumlkmKyK%2BbkdS3Y1pwbmtVE8VE%2BYKz0WCx5Vou8DRUlhdiTaGR7DmRme1POdDRw70KeKkg1JN7mXR2stW%2FxZF3KoxFiMcmFJGucYceu8A4xvgGcfzLItSCInger3zHfkC2Ur5lKeaQU5sgiPEUA%2B2x8oEW0FwBB8r8yqGJeff6jeP94Z2PdTDuk%2BPHBjqkAYUUUaBI7Myfm%2B5wtUJP%2FhJUTARzcByySKQ7HnTMRARg5Ln6DrJOCK5IrFxnfFGeFkow0kRJIos6oivC1KbNqoR5MS51zOIwrmkOWrNt0YTAuMc2o8fJ4AM1NQ9T5z%2FI9FGHTxuv01b26Likh%2BVkw6zxAOHnVTliC%2FX6NXDb1x97Ef8llrpVJf9u22kNu7buanX7zV1cLS65kZKjHdvNd2v3a%2FjQ&X-Amz-Signature=4d114b43319eb31f87588a09d48c5fb83a45d8425ebe9f589335bf2470bc6088&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
