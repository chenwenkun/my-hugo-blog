---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
---
测试系统 16.6 运行闪退

18.3 18.4系统正常安装

代码地址：

本来是 facebook 的项目，目前由 appium 进行维护

代码下载

先在xcode 构建一次，修改Bundle Identifier，勾选自己的 appleid

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ASM2YTV%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T020852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD6KuqCRIU9BtqGu6ciyGW%2FGxkhFhhgqBdEpmUV%2BDpTEQIhAKvS9eR978BHj4eA42MKyXh%2B%2FC7ZZRln%2Bv7TtQgpM20EKv8DCGcQABoMNjM3NDIzMTgzODA1IgxFXuRIk9rLsO2ubGcq3APOqZMXMmaQXK1dgADb1tJBVTsv1HH8v23vRcA9z9uaoeSe6L5RzDfVtigb7N7gGa13zf7zczEjR27BJYdy%2B26Et9l%2FKniBKkglg0Oh6hIr0tfcLm67j6mc3K%2F6yPzxVrz%2BQnEGIjxreKHhn2%2FMqtdNfvBDwwHEjtSrGq5KoUMfu0og5QRpNzqDx3YZEO5FBYPw9EatXKv%2B4m7Cnq2f2XbT%2FlVLCsxF5s5j6EwC2WQFYgVMIZv3xZb3ayggevdBdiuRqdHV4JiBx5nCGiFph3%2FuuaAM%2FtbUXGvxOylRtyLe9Hv48m7WNGwJQcCugbXluRSB%2Bbm1baKRGapQE2B2ckUGWez9TUM1cHpAHKMDfLeQXCcTlM9Wf5zm7mGhuR%2FWDI3efehdOcd%2FlrUv1e6G5VMykTWrN6LkIMceSv1OA5KXmms8XDIRnCIULMsOcDRD0BlrYghO7POLF5yG%2FWjDExaKi%2FDCofzBBgsOeOFA89V9LOcnCH6VEWlfpd0u%2Bxv4jsQbvbwDvkKkfDiCj1ULTa%2FcDFMOpZOjXCnWNFGdZSU748XKqYB5kfaqQWGjMK8oqQpw7QvAVDWop9OlHOePxSgm8blo%2BUeSSMtnDO5amXf0Lrc1eKUFgQa%2BAIjNnTCt29HGBjqkAbSGnSnSghTlnzcMEdnIb%2FIPvrLwjJD0FGFRZvCEqOA2FEecI4MciSq9%2BDmmeJ5d4iurCQtYcAUv4WP8ECyLXVbO6XjyTROBYXr42KL8iE2PEfOSizUxLnyOEvuyPptcgUHh8wc1EtjKxcgGkEH3heM8IPLAs5Z6lW32xyjaktVo6SEFzPPjmrIrACJXsXvT3cnCkL%2BwHUX%2FS05lN1ZLcBInTCtM&X-Amz-Signature=87c3a37d1718cdca03000a9a9b062d5e685418c8584ee0b8e9b5049405f2872b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ASM2YTV%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T020852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD6KuqCRIU9BtqGu6ciyGW%2FGxkhFhhgqBdEpmUV%2BDpTEQIhAKvS9eR978BHj4eA42MKyXh%2B%2FC7ZZRln%2Bv7TtQgpM20EKv8DCGcQABoMNjM3NDIzMTgzODA1IgxFXuRIk9rLsO2ubGcq3APOqZMXMmaQXK1dgADb1tJBVTsv1HH8v23vRcA9z9uaoeSe6L5RzDfVtigb7N7gGa13zf7zczEjR27BJYdy%2B26Et9l%2FKniBKkglg0Oh6hIr0tfcLm67j6mc3K%2F6yPzxVrz%2BQnEGIjxreKHhn2%2FMqtdNfvBDwwHEjtSrGq5KoUMfu0og5QRpNzqDx3YZEO5FBYPw9EatXKv%2B4m7Cnq2f2XbT%2FlVLCsxF5s5j6EwC2WQFYgVMIZv3xZb3ayggevdBdiuRqdHV4JiBx5nCGiFph3%2FuuaAM%2FtbUXGvxOylRtyLe9Hv48m7WNGwJQcCugbXluRSB%2Bbm1baKRGapQE2B2ckUGWez9TUM1cHpAHKMDfLeQXCcTlM9Wf5zm7mGhuR%2FWDI3efehdOcd%2FlrUv1e6G5VMykTWrN6LkIMceSv1OA5KXmms8XDIRnCIULMsOcDRD0BlrYghO7POLF5yG%2FWjDExaKi%2FDCofzBBgsOeOFA89V9LOcnCH6VEWlfpd0u%2Bxv4jsQbvbwDvkKkfDiCj1ULTa%2FcDFMOpZOjXCnWNFGdZSU748XKqYB5kfaqQWGjMK8oqQpw7QvAVDWop9OlHOePxSgm8blo%2BUeSSMtnDO5amXf0Lrc1eKUFgQa%2BAIjNnTCt29HGBjqkAbSGnSnSghTlnzcMEdnIb%2FIPvrLwjJD0FGFRZvCEqOA2FEecI4MciSq9%2BDmmeJ5d4iurCQtYcAUv4WP8ECyLXVbO6XjyTROBYXr42KL8iE2PEfOSizUxLnyOEvuyPptcgUHh8wc1EtjKxcgGkEH3heM8IPLAs5Z6lW32xyjaktVo6SEFzPPjmrIrACJXsXvT3cnCkL%2BwHUX%2FS05lN1ZLcBInTCtM&X-Amz-Signature=4766bd4510c2d9ece7fee5f942ca32499880af992584e085d8930ca7aaf87cd3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
