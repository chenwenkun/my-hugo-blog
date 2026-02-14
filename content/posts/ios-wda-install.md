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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VBKOQI7Z%2F20260214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260214T181937Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJGMEQCIDJDA4BUHTEEbbhLWy6Tbld68cFHkEKWeh1CsfRiRTGbAiBAiwB2vqDNcsnEzyD4JQ%2F3%2BXan%2FN42IS7G32hAgfSYIyr%2FAwgLEAAaDDYzNzQyMzE4MzgwNSIMtSwodQMZ1UIBZ0sRKtwDBb2Uw7c6Zh0DZb8dYewU5TGZUyg%2FJHit22dk8CDneRpz5Alr7aNP5a4JQ4k0LOZRZI7S0t1qzVyWRx4AegO5HkUkGpM4vLHbz28hK6sY%2FMeERvNgnO5rCKyFkrBqDH3hqSdtz8jaTu2DnWF8imkH75dMUv1P%2FVLNtbP2i53dCsA2sdqaUKlnjnJmiduoRLofddiy%2FogqwxJ3NmL3J23z2tiY2sKV%2FuBd90DJ0cCTkeDyCuuM5QbVoWBPxxvun6NaTzAPNcYX%2BWVskitMddFPdYt13dmQIWwZHUJy0igF6qjuzZyv82ne8Epme26lXWsAs9H3qpd6hcdalXZ8T8yiF5owGU2iXGzWTJM3B6yQ3xRy914CRsuO6I0UoDlikoQuh1Pv0x4PIXoNHN24qTcGkRBLBXUVQakBzZDgwkwLt%2FALID%2Ff9DVHuXAokr%2BCCDe%2BxwgGjxRoLM4LGr%2BfqDBDlsn6POLMdVrgAjc4ykCXVM5ndaQFSlmZIaO2pQaYv9eTO6ZIDZQQfTUTV27P9NPYHIf1B6EEZm%2BAPBTm3Mj%2FInxkx%2FS2FowfEtiao46K7TsTY00SF3lpULXSqPERLr2yL31nrE6nyiIrJ36aVCncUZRElVaRPlOhESJlHzQwivjCzAY6pgE5JJUZGAHfVkNJCZI2WMCSlkj9qTWpSm2zekVNcrxDpg3E0lEXwhQ5kR7%2BMj2jznmOAbfvXiujC%2BYWRPvXuBh54IHzGKtwoB7Ku%2FCn1veBJlfZK20Y7SrrFb4%2BnUMF9UPmxjAxW67hZ4N32NXY9CkhAOs9339O%2FgtiQv%2F1CCbvR9yCHlx9Wylnel1YEoFL3mKflHFEus2sOhAIxh3E8vCbwviDG7wg&X-Amz-Signature=f41bed2181f05a4c465b5851aadb0d436aa506f9cb864cffe9e468ad5183944b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VBKOQI7Z%2F20260214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260214T181937Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEIaCXVzLXdlc3QtMiJGMEQCIDJDA4BUHTEEbbhLWy6Tbld68cFHkEKWeh1CsfRiRTGbAiBAiwB2vqDNcsnEzyD4JQ%2F3%2BXan%2FN42IS7G32hAgfSYIyr%2FAwgLEAAaDDYzNzQyMzE4MzgwNSIMtSwodQMZ1UIBZ0sRKtwDBb2Uw7c6Zh0DZb8dYewU5TGZUyg%2FJHit22dk8CDneRpz5Alr7aNP5a4JQ4k0LOZRZI7S0t1qzVyWRx4AegO5HkUkGpM4vLHbz28hK6sY%2FMeERvNgnO5rCKyFkrBqDH3hqSdtz8jaTu2DnWF8imkH75dMUv1P%2FVLNtbP2i53dCsA2sdqaUKlnjnJmiduoRLofddiy%2FogqwxJ3NmL3J23z2tiY2sKV%2FuBd90DJ0cCTkeDyCuuM5QbVoWBPxxvun6NaTzAPNcYX%2BWVskitMddFPdYt13dmQIWwZHUJy0igF6qjuzZyv82ne8Epme26lXWsAs9H3qpd6hcdalXZ8T8yiF5owGU2iXGzWTJM3B6yQ3xRy914CRsuO6I0UoDlikoQuh1Pv0x4PIXoNHN24qTcGkRBLBXUVQakBzZDgwkwLt%2FALID%2Ff9DVHuXAokr%2BCCDe%2BxwgGjxRoLM4LGr%2BfqDBDlsn6POLMdVrgAjc4ykCXVM5ndaQFSlmZIaO2pQaYv9eTO6ZIDZQQfTUTV27P9NPYHIf1B6EEZm%2BAPBTm3Mj%2FInxkx%2FS2FowfEtiao46K7TsTY00SF3lpULXSqPERLr2yL31nrE6nyiIrJ36aVCncUZRElVaRPlOhESJlHzQwivjCzAY6pgE5JJUZGAHfVkNJCZI2WMCSlkj9qTWpSm2zekVNcrxDpg3E0lEXwhQ5kR7%2BMj2jznmOAbfvXiujC%2BYWRPvXuBh54IHzGKtwoB7Ku%2FCn1veBJlfZK20Y7SrrFb4%2BnUMF9UPmxjAxW67hZ4N32NXY9CkhAOs9339O%2FgtiQv%2F1CCbvR9yCHlx9Wylnel1YEoFL3mKflHFEus2sOhAIxh3E8vCbwviDG7wg&X-Amz-Signature=ab2642cfd442b774704ad04beac5f341d106b0c02ee6dfc957f6d0e72a2fe67f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
