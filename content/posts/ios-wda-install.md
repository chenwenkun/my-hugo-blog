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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665W7HSYRJ%2F20260206%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260206T064011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQCvDaTCGFr0LCM%2BZCC%2FIKG6ehpU3hKpQ1A%2FUQrZgg9NDwIhAOdfujtbNxhtVYC5Qb662%2FtftI4W214nRgcx2RM2VuigKv8DCD8QABoMNjM3NDIzMTgzODA1IgzMMqghXebVaPfxyqgq3ANj%2FHNeqSYyCf26ATjI4GyPBTOKEN7VQuDzujiaceuoMIK7XpEOJdJmSYTKvpNCyDzIFL%2FETkNZLieZMQwoVsz6usmA8VuSom2tACGsDy8VlsEwJpCya7MaRhHvpvWKGMikzhsYf1VWHo3u7fbLL55rfPgPrU6rZasAjDKhJ%2BHZcu%2F7f8xCbxhU8RwJk7QOxM6T5liPx6g1ihFwbcUIBmZdORe7pP0LjtNNpMHpp1fVrbKxMuNSJPGZ90pNGYrbNvjKsQrx7uJx9RCIHXpfknx%2BYh%2FVynijCoMP4lmwqZdZKx%2FYT4%2FJ0HBEUkC9UDp2WKR6PfxE4eoy%2BY0XZkY8EhIfg4WwF%2FNHI1mdcnHfOMzPg9qELdW0ISV6AKIfkdK4Zn%2BstC6WiqqWgb1Ydq7ZZNi5nyooQm9OjqnnKdEsTCLuhxcGut3LiKDSL2CpRvWsr7Gf5leG6jnxoKnwijFYuljgAyX3GXKXa5ZH5M0j9bCjShg%2BP8ZxWKasCocqTDyZTAg9XCJAE4i%2F9vP40zBp2RKBs4bg5p4C3bEwEReL0LtL2YaP0DLIdd5S5toPKYrOwFmHuUM8GEaJk2iYD2zqoG6cmdo7XhjNE52ivtNE%2BgBCKFfTMXsvxRG5636zVDCqh5bMBjqkASntSS9Vjo4Sx3KuG6v3zXCFViqn2neb5E%2FIHJcH9AX2wrt7qAxKjqp%2FgIUwcWYj8S9MiKONKNqnSCT%2BiKGL82qERgg3zjn2uEmXcO25OVu7aSx4GwVGZGyGCVZRtF9WhR3OxSQDNrFWdfE%2F8RWxYL0QxrGHmPiKGoDnAURWY8hQC%2BImBqRy%2Fid8TVp64xXEz3WhiEb8opyjflXA8%2FTljohUQ0Mq&X-Amz-Signature=4320ac8a916861a7b55f6b85fce102c065820b411e9b847c75c4c60a7f92e5a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665W7HSYRJ%2F20260206%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260206T064011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQCvDaTCGFr0LCM%2BZCC%2FIKG6ehpU3hKpQ1A%2FUQrZgg9NDwIhAOdfujtbNxhtVYC5Qb662%2FtftI4W214nRgcx2RM2VuigKv8DCD8QABoMNjM3NDIzMTgzODA1IgzMMqghXebVaPfxyqgq3ANj%2FHNeqSYyCf26ATjI4GyPBTOKEN7VQuDzujiaceuoMIK7XpEOJdJmSYTKvpNCyDzIFL%2FETkNZLieZMQwoVsz6usmA8VuSom2tACGsDy8VlsEwJpCya7MaRhHvpvWKGMikzhsYf1VWHo3u7fbLL55rfPgPrU6rZasAjDKhJ%2BHZcu%2F7f8xCbxhU8RwJk7QOxM6T5liPx6g1ihFwbcUIBmZdORe7pP0LjtNNpMHpp1fVrbKxMuNSJPGZ90pNGYrbNvjKsQrx7uJx9RCIHXpfknx%2BYh%2FVynijCoMP4lmwqZdZKx%2FYT4%2FJ0HBEUkC9UDp2WKR6PfxE4eoy%2BY0XZkY8EhIfg4WwF%2FNHI1mdcnHfOMzPg9qELdW0ISV6AKIfkdK4Zn%2BstC6WiqqWgb1Ydq7ZZNi5nyooQm9OjqnnKdEsTCLuhxcGut3LiKDSL2CpRvWsr7Gf5leG6jnxoKnwijFYuljgAyX3GXKXa5ZH5M0j9bCjShg%2BP8ZxWKasCocqTDyZTAg9XCJAE4i%2F9vP40zBp2RKBs4bg5p4C3bEwEReL0LtL2YaP0DLIdd5S5toPKYrOwFmHuUM8GEaJk2iYD2zqoG6cmdo7XhjNE52ivtNE%2BgBCKFfTMXsvxRG5636zVDCqh5bMBjqkASntSS9Vjo4Sx3KuG6v3zXCFViqn2neb5E%2FIHJcH9AX2wrt7qAxKjqp%2FgIUwcWYj8S9MiKONKNqnSCT%2BiKGL82qERgg3zjn2uEmXcO25OVu7aSx4GwVGZGyGCVZRtF9WhR3OxSQDNrFWdfE%2F8RWxYL0QxrGHmPiKGoDnAURWY8hQC%2BImBqRy%2Fid8TVp64xXEz3WhiEb8opyjflXA8%2FTljohUQ0Mq&X-Amz-Signature=bc58dcb43d7ae1c6e3a3906cc621b53d5b9512e899a137b94b028b59bbe6a751&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
