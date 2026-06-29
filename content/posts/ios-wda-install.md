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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QAYT3UJ%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T022935Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGKwiPZ%2F6FpNXOvFKkBS3XA3GQJeSmrH30CiNFB4nRRVAiEA3CQOj0ZgZGZLW98tn1sFyINlVsmEViJ9OVnHnLf6%2FHYqiAQIo%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDN8FnV95B54XlcweCSrcAzaLrgSznfkusYa2BiUpewIxq3OztB3OQZGaL8uoPvobVkHr%2B8SOqv6%2FI41DIU0eN2Qvg%2F%2BdILWSD4hIWLA%2Bqf18J2IdxNuvCbzvHJ1eJAvG0kNMqq9Jc4M2ELw2sDxGd2dV0hXjtSG60lEbahMq2sXTSNp3jFNzgUbmISmZ4w2YAicaWdONNinywV45V3bxyNP8X3ayKrPhVdidzE1HzexZ6iZ9QlxJgnyD7F2Mng3h%2FUBkWa7%2B94NzXXMhffRMEdDj%2Fntw3g90cAXoaHnrCU8EPEtPIjGjK9MoWARk5OeTh%2BDOyeaiw1vbS6f84TBNNlqvuIARrrk2CgPCZoLLPplWQHAX%2BZLioPtdg1gI2D8VShQJDjZXk0E5leVtXu%2BuKfg86mWQRE5sB5wD8odehBOKKfQCmWuoGpOOvR5WXCKOVvSf6dkAWJpTkoqFHl2qHKyV2MpimbNJLtVrgnoCBKilIrrvSKHGokLucH6XIZZfAKIeahWjO9OBMNspWroshbU02x4dBE7MeneWB36lvYq453XeePwMb459fu1AcRaBniwoAWG03dKkGwzQAwptqZQD4%2Fl1f51qpro74BczLCFieAK4ljbJE%2FwgfO%2FUpRRp6u6Kxk8770MjCYIpMOaUh9IGOqUBrn%2F0RxUBA5%2FkpzqdYuMMOY8Ujr8m4BXTSfXyATdBZkZk671hOxqpBh263RWPzHoQ1K4u9NKe%2FnDthUMDIBlup5BrIIXIklE4StPG4CX9bzudwnP9%2B8gGN6FXwd6Ovx3lYrIz6AwyTpcyVvCBmaiIvxEQdICwgGqsuuXoaBX13UaKLieyoLpdjNznjR8Foy4K3kxUO36adlpySYrG2lg9%2BSw%2FA1XM&X-Amz-Signature=7c42c11bc0f44f820be1ac886e79af4e3ac08d761425b29fecf4bc9e0b0e07d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QAYT3UJ%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T022935Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGKwiPZ%2F6FpNXOvFKkBS3XA3GQJeSmrH30CiNFB4nRRVAiEA3CQOj0ZgZGZLW98tn1sFyINlVsmEViJ9OVnHnLf6%2FHYqiAQIo%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDN8FnV95B54XlcweCSrcAzaLrgSznfkusYa2BiUpewIxq3OztB3OQZGaL8uoPvobVkHr%2B8SOqv6%2FI41DIU0eN2Qvg%2F%2BdILWSD4hIWLA%2Bqf18J2IdxNuvCbzvHJ1eJAvG0kNMqq9Jc4M2ELw2sDxGd2dV0hXjtSG60lEbahMq2sXTSNp3jFNzgUbmISmZ4w2YAicaWdONNinywV45V3bxyNP8X3ayKrPhVdidzE1HzexZ6iZ9QlxJgnyD7F2Mng3h%2FUBkWa7%2B94NzXXMhffRMEdDj%2Fntw3g90cAXoaHnrCU8EPEtPIjGjK9MoWARk5OeTh%2BDOyeaiw1vbS6f84TBNNlqvuIARrrk2CgPCZoLLPplWQHAX%2BZLioPtdg1gI2D8VShQJDjZXk0E5leVtXu%2BuKfg86mWQRE5sB5wD8odehBOKKfQCmWuoGpOOvR5WXCKOVvSf6dkAWJpTkoqFHl2qHKyV2MpimbNJLtVrgnoCBKilIrrvSKHGokLucH6XIZZfAKIeahWjO9OBMNspWroshbU02x4dBE7MeneWB36lvYq453XeePwMb459fu1AcRaBniwoAWG03dKkGwzQAwptqZQD4%2Fl1f51qpro74BczLCFieAK4ljbJE%2FwgfO%2FUpRRp6u6Kxk8770MjCYIpMOaUh9IGOqUBrn%2F0RxUBA5%2FkpzqdYuMMOY8Ujr8m4BXTSfXyATdBZkZk671hOxqpBh263RWPzHoQ1K4u9NKe%2FnDthUMDIBlup5BrIIXIklE4StPG4CX9bzudwnP9%2B8gGN6FXwd6Ovx3lYrIz6AwyTpcyVvCBmaiIvxEQdICwgGqsuuXoaBX13UaKLieyoLpdjNznjR8Foy4K3kxUO36adlpySYrG2lg9%2BSw%2FA1XM&X-Amz-Signature=4229395d2e0a2a2e393603a5ab07c5fdf194f8639dac29a0884dfe76676528fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
