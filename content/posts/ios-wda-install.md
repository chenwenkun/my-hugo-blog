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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665S3RDIUL%2F20251218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251218T122311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAL6mCNA90guMwqEQrKfqDeyxtKiwJCdiSByukf3s9X3AiB9pV2cYWYxo44nFZ1tp0tz%2FpWIJuZlXLc%2BWBIEmlusjCqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlLDyx1U4L1PctkugKtwDWPsitBeLf0Y34gNdQj%2FTFXWr7wFIe4PY1nfv9Z6FRRAcq61nrs55NTxKpFaD%2Fq5UXxTNQu9zB4qDmt%2FpEwaZO2rfbodEipBd0vQ%2B5myqbAVX%2B6g5tI8JYsRckdnVYTMoJ3AsP%2B1NArDAsj6hVJ2odT9FVPZdiqF5z8mjL2hqx7cAtsfF%2FWRpg61g5O1zVUKrAufOfJw8NbGyfN76yGKK1HN5QkxwAQpgOUc8OR8N9S1qv3is3RFkOyUPLlSdwIGlLmQpO0Kg%2BY7zQP3tDGXzkI76JFP3Ty3rEcZ84NXRDDUc8zN3tsIlJ3FVWoixtx7ocZaXzDgyettn3NGgjssxcE9n6Ilbf85NTAHTk034C8hTt0DW9%2BbExk6IJz3MOy4aEs0trQ5LLKUHO1FoTbX27syl3D5lZvuPRV3wdZk69W2WECUVjz8lcKlKrXPx47fiTFvj%2Bo74alFwnaDI%2BDt2PBC3SwBxBmOJn6SpJ64B00jhOmFlily68dSsp%2B98Mm6vQSk3jGpTm7Vp2itctAUL002tyesjegKL6KYDufCfff4h68rPizevndvvP2cnmtkwuxDYdN%2BvJYjQ665lpy0ezdcXGN12l4Dd%2BqK0TyQBGlRdLthJgRfvQoF1VG0wtsqPygY6pgHBkvYHp2zroqbOwnyHTzJR8ru7FGdOmyK5gV3T5%2FYSdj5zUk0CrRjdVG%2FCHZILzT5b5TE4Z0oLpAWS3ok9%2F9k7IBxz%2BeIvv5ZrkGbXLBJD7v8g3K02YRi0TAusYVnA6604KofJqJCu4XVvZq8gnD9ReO47CRka22%2F04%2Bau%2Br%2Bw5wkfPBoHr0gKnbnX%2FXPkK%2FBS35HJ67k1kDCmMZ8Q1JHC9omM0HDC&X-Amz-Signature=33d1f469c3519af04ced49fb51cb3e0576c65097851fe1ff4d5b10e174af820f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665S3RDIUL%2F20251218%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251218T122311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAL6mCNA90guMwqEQrKfqDeyxtKiwJCdiSByukf3s9X3AiB9pV2cYWYxo44nFZ1tp0tz%2FpWIJuZlXLc%2BWBIEmlusjCqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlLDyx1U4L1PctkugKtwDWPsitBeLf0Y34gNdQj%2FTFXWr7wFIe4PY1nfv9Z6FRRAcq61nrs55NTxKpFaD%2Fq5UXxTNQu9zB4qDmt%2FpEwaZO2rfbodEipBd0vQ%2B5myqbAVX%2B6g5tI8JYsRckdnVYTMoJ3AsP%2B1NArDAsj6hVJ2odT9FVPZdiqF5z8mjL2hqx7cAtsfF%2FWRpg61g5O1zVUKrAufOfJw8NbGyfN76yGKK1HN5QkxwAQpgOUc8OR8N9S1qv3is3RFkOyUPLlSdwIGlLmQpO0Kg%2BY7zQP3tDGXzkI76JFP3Ty3rEcZ84NXRDDUc8zN3tsIlJ3FVWoixtx7ocZaXzDgyettn3NGgjssxcE9n6Ilbf85NTAHTk034C8hTt0DW9%2BbExk6IJz3MOy4aEs0trQ5LLKUHO1FoTbX27syl3D5lZvuPRV3wdZk69W2WECUVjz8lcKlKrXPx47fiTFvj%2Bo74alFwnaDI%2BDt2PBC3SwBxBmOJn6SpJ64B00jhOmFlily68dSsp%2B98Mm6vQSk3jGpTm7Vp2itctAUL002tyesjegKL6KYDufCfff4h68rPizevndvvP2cnmtkwuxDYdN%2BvJYjQ665lpy0ezdcXGN12l4Dd%2BqK0TyQBGlRdLthJgRfvQoF1VG0wtsqPygY6pgHBkvYHp2zroqbOwnyHTzJR8ru7FGdOmyK5gV3T5%2FYSdj5zUk0CrRjdVG%2FCHZILzT5b5TE4Z0oLpAWS3ok9%2F9k7IBxz%2BeIvv5ZrkGbXLBJD7v8g3K02YRi0TAusYVnA6604KofJqJCu4XVvZq8gnD9ReO47CRka22%2F04%2Bau%2Br%2Bw5wkfPBoHr0gKnbnX%2FXPkK%2FBS35HJ67k1kDCmMZ8Q1JHC9omM0HDC&X-Amz-Signature=234c396e4ede7066d53159c3a56fabbe122305925271d9146754b7fbbfe5bd09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
