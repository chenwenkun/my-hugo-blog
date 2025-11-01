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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666D42QRIE%2F20251101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251101T121846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJHMEUCIAUHnY67ud3gD6kc7%2FdUZ9HQDLU6OR5cgEKzDWOFBtQdAiEAsqAYe%2BfYCQMVw9CIhzfk1R0m%2FqvzsMIEs88nNpSAfnoq%2FwMIKBAAGgw2Mzc0MjMxODM4MDUiDOqFC0P%2BgY3PdsltqircA79Mo2Z%2BpYeK4Bj0%2BXjNsCxPzOAAUcoPHQNBm4QQpOom27lOEa%2BmcSyu996b2NWQmC1NfCt3788edStXEYu2oPTKIhJGB8LuItdyIbAxbmWEA4YCmS8wpDXDuOJQnTvPW%2F%2BdZ5O9%2FLEkBm0gvAHmjVw2eZ7wlh7S1hQNrWw2Yan6jtbtBZkCnDwyvmtlLYQVIbJgCjlTp2TENVBG8ZKT5N1NqhKadW192B1bGtJM9KSkaprgaONmxDuM2mUPTBiTHl63xe45ua%2F3friQzhFoqt3%2B31oGR67%2FmE1RZSxnLDHsTe%2FLjoxcak7w2j2%2FMIvGqdzfNBUkiOqlyiIsMet7PUAd%2BX%2BkX1TwSfwBOK0FJcEBNz9sbua1LwGhCg78MY0FpSAJEYoAk05XpSYwuiau8jPXhw6n546MykgjUMYNkfUOZI8kTAl5CCdZUBVW3zbSU6lJF3WyM029Q1TE1EelWPt2FSvh8PAAsUIbxSzfhwQeLN1nasHdsn7WFOrrr2s3a5kNs1eb6YUXTtNtIaQ33yIGqhrp7llQvjipPYiTa7qdNDvc0YObiRgpc7wj3Ddet06bTX7722Ingxfzff29Hf7jouGHTy12a85ADf8eAR1w7JUBWyHxdj484w7SMKLolsgGOqUBNhyi8C47VIlDpplVviy9oLdr2Th9JzOpbuMnSMp%2BAzFY6BEVq3KQHHgq9WJXV6lazKarE%2BL1VAZsqpXj8D5v6Y5BNGvn7iiZtjk8QMYe0c79jYr6UzphbBCyyQ%2BedpN7Oel%2Bz7oDaXJBHUDSW%2BEinlaHW4b9omjoKBA7Ubp8%2B7zASoCOjaokwTm%2FEt7gMQ%2BVZjtDIfg9d94w8M6qhRUQii5AXJON&X-Amz-Signature=765c7efce7d7f72ad8ce465e6bc8f46d8213e5f8e156908d2e49368bdc083a0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666D42QRIE%2F20251101%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251101T121846Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGAaCXVzLXdlc3QtMiJHMEUCIAUHnY67ud3gD6kc7%2FdUZ9HQDLU6OR5cgEKzDWOFBtQdAiEAsqAYe%2BfYCQMVw9CIhzfk1R0m%2FqvzsMIEs88nNpSAfnoq%2FwMIKBAAGgw2Mzc0MjMxODM4MDUiDOqFC0P%2BgY3PdsltqircA79Mo2Z%2BpYeK4Bj0%2BXjNsCxPzOAAUcoPHQNBm4QQpOom27lOEa%2BmcSyu996b2NWQmC1NfCt3788edStXEYu2oPTKIhJGB8LuItdyIbAxbmWEA4YCmS8wpDXDuOJQnTvPW%2F%2BdZ5O9%2FLEkBm0gvAHmjVw2eZ7wlh7S1hQNrWw2Yan6jtbtBZkCnDwyvmtlLYQVIbJgCjlTp2TENVBG8ZKT5N1NqhKadW192B1bGtJM9KSkaprgaONmxDuM2mUPTBiTHl63xe45ua%2F3friQzhFoqt3%2B31oGR67%2FmE1RZSxnLDHsTe%2FLjoxcak7w2j2%2FMIvGqdzfNBUkiOqlyiIsMet7PUAd%2BX%2BkX1TwSfwBOK0FJcEBNz9sbua1LwGhCg78MY0FpSAJEYoAk05XpSYwuiau8jPXhw6n546MykgjUMYNkfUOZI8kTAl5CCdZUBVW3zbSU6lJF3WyM029Q1TE1EelWPt2FSvh8PAAsUIbxSzfhwQeLN1nasHdsn7WFOrrr2s3a5kNs1eb6YUXTtNtIaQ33yIGqhrp7llQvjipPYiTa7qdNDvc0YObiRgpc7wj3Ddet06bTX7722Ingxfzff29Hf7jouGHTy12a85ADf8eAR1w7JUBWyHxdj484w7SMKLolsgGOqUBNhyi8C47VIlDpplVviy9oLdr2Th9JzOpbuMnSMp%2BAzFY6BEVq3KQHHgq9WJXV6lazKarE%2BL1VAZsqpXj8D5v6Y5BNGvn7iiZtjk8QMYe0c79jYr6UzphbBCyyQ%2BedpN7Oel%2Bz7oDaXJBHUDSW%2BEinlaHW4b9omjoKBA7Ubp8%2B7zASoCOjaokwTm%2FEt7gMQ%2BVZjtDIfg9d94w8M6qhRUQii5AXJON&X-Amz-Signature=17256f57b88cfbddcea40f1a9dbfd2dd9e163a57f302bb8a404b872156efe4a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
