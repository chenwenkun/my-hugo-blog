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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X5IYKNOI%2F20251117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251117T005518Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFh%2FadFjJbH%2BEGKhwZ2ZOOEgtEpRvXX%2FUyAjoeren4L8AiEA7yHniaUiOWhDKX%2Fbvc0S99zCjCUeJv8s9cXMFIZ1vaQqiAQIov%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIqDsDgUlUmFzbXjiSrcA9tjVQH2F8BW1tx9zasMT1Ayd8WERLKmQ8UbT3BpWFF44sOcv147ylKMx%2BoqGuJD%2Frkf%2FxLC2Uv86TBrszNmTcPbwJlKcDaS9qwsq8542nuOT26wprHDCnKN1FuF23kkkef075Dg7pIB2u0MGsmLDbsLxBE8clusuiixekZ6532W1sJqkgZWpWuxPW1jQFtuEXaG7Q4zZX%2F3lHTgiSXe9N090qWLYenUKneARNbb2%2B%2FtERBJoay2s9d7pxcqlw4FB%2B6eUfQGY8oA97sHLlXfwYsuOEJ5wHa3pGMCtSJoz%2BqEaia%2F3Gkc%2BtZN%2BNoYn3jALMB5hDAqZO1Mvh3iBD7Wb0hjW6eRe7DyJ%2B3evCoUgZvQduViWbNQWcFyZsBHBTuDsW6075vJFTLrJSgDc7TlMpsen7Ixgyylefzm8nM%2FLF49ETiGNt0lNUZIQEd%2BeZiyJoWRfcYkexrWFYOVWtbBNjmz1wkAqxuxX24B977N7VtO1aTmNRh%2FGfONDLM%2F7eUGQFfCterPx2qNCQCnKe5W5ewnXM8sa5Ivw3XzIaWvWOcC12xJvCJAVHHQRvAYCqRPMFNJuIyEnbWCA44palaQLyPAfHSBTIyRQ0fVodN6a9AlSpDaiF663A9dkTtUMJ%2Fg6cgGOqUByNeo6yTBHAHp6HpE8LIiSEONX1XTVh5K2xCMc4tI0dPHOI%2Fff5X2w0ovDq5%2FxvtZVAHkExCHuNumoHkw3K88WV5%2BBXda8H9iWiqV1vLjNLpaf4kwAuujunM6PSTz2r7QNOfmPQ6xonVYfFMEP4yzSXIIqnD7PIEESF%2FOHUhQj6Y4hPoPu845htrlWwseKT9AISWBAasAQqcxfilr%2BlgZUOk6ni0P&X-Amz-Signature=2445ecc992bf4f9cc650895ecce716263bd3fd65b1d03aee6cbf7150d89f7991&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X5IYKNOI%2F20251117%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251117T005518Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFh%2FadFjJbH%2BEGKhwZ2ZOOEgtEpRvXX%2FUyAjoeren4L8AiEA7yHniaUiOWhDKX%2Fbvc0S99zCjCUeJv8s9cXMFIZ1vaQqiAQIov%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIqDsDgUlUmFzbXjiSrcA9tjVQH2F8BW1tx9zasMT1Ayd8WERLKmQ8UbT3BpWFF44sOcv147ylKMx%2BoqGuJD%2Frkf%2FxLC2Uv86TBrszNmTcPbwJlKcDaS9qwsq8542nuOT26wprHDCnKN1FuF23kkkef075Dg7pIB2u0MGsmLDbsLxBE8clusuiixekZ6532W1sJqkgZWpWuxPW1jQFtuEXaG7Q4zZX%2F3lHTgiSXe9N090qWLYenUKneARNbb2%2B%2FtERBJoay2s9d7pxcqlw4FB%2B6eUfQGY8oA97sHLlXfwYsuOEJ5wHa3pGMCtSJoz%2BqEaia%2F3Gkc%2BtZN%2BNoYn3jALMB5hDAqZO1Mvh3iBD7Wb0hjW6eRe7DyJ%2B3evCoUgZvQduViWbNQWcFyZsBHBTuDsW6075vJFTLrJSgDc7TlMpsen7Ixgyylefzm8nM%2FLF49ETiGNt0lNUZIQEd%2BeZiyJoWRfcYkexrWFYOVWtbBNjmz1wkAqxuxX24B977N7VtO1aTmNRh%2FGfONDLM%2F7eUGQFfCterPx2qNCQCnKe5W5ewnXM8sa5Ivw3XzIaWvWOcC12xJvCJAVHHQRvAYCqRPMFNJuIyEnbWCA44palaQLyPAfHSBTIyRQ0fVodN6a9AlSpDaiF663A9dkTtUMJ%2Fg6cgGOqUByNeo6yTBHAHp6HpE8LIiSEONX1XTVh5K2xCMc4tI0dPHOI%2Fff5X2w0ovDq5%2FxvtZVAHkExCHuNumoHkw3K88WV5%2BBXda8H9iWiqV1vLjNLpaf4kwAuujunM6PSTz2r7QNOfmPQ6xonVYfFMEP4yzSXIIqnD7PIEESF%2FOHUhQj6Y4hPoPu845htrlWwseKT9AISWBAasAQqcxfilr%2BlgZUOk6ni0P&X-Amz-Signature=6f4ef8461a75ed5fb89949c7acfc67240c193d0b2f240089f92af91880d118a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
