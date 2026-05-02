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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VNY6ZK62%2F20260502%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260502T184152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJIMEYCIQDguVVfjwUkJH02JhWlbKdeehiL6SY2EZ8chffp3udM9AIhALX%2FjaFsnP%2BtMiB56zAyg65qLAEube4dpHb6fHYfhfdDKv8DCEMQABoMNjM3NDIzMTgzODA1Igzc3OegE9EoX8T2LHQq3AMJqEh4MzGI0LQV4jSnYKtfouqSwurYuTYUYL22BBZRPLV1NnixDuGRz74v%2FayDo4Z9V%2Fhmk1VctzvgSiFAyg5edlqH%2BKeptM056PlKS2RL7SIXZcMqSIvLTWiULCSNaeCVMm1bQ67owqmb5mEJ%2FVRaRj7vjiHa660mD9Uo%2F9ypXsxoXgGjlWqxGlsT9Q6J3nuNS2t0oIh5dbjvZFswW7cXpdk8eWHUoPETnvSRoILH1QsXPgiDrgFdfsVHOtXR%2BtLtPE4o%2FlvnbWdiBR7C9YTVLby79l2ywWuJMqVGM%2F58SEwtoxNoJK7O3RLx9WrAEDGeUFceS9oS0qMs3oijYqoNeAT%2BZNDpZHkrAnJeXa%2FT165Z5NruDXKLbqFWsa2NSpGKvzkVeIhY4KT0pb0GxCo%2FxhlD%2BawdrMBFDZEQ64NE3ibeqV294blmGJ2vYFzpsdWncdSoHKyskuTGilFFhO%2BAogkwznjS0QIdKFm43eGJSI8Jlxm3xtRJPmCj%2FfI0nU0wGJFoGd7av9IByi0xf7GLgTlqL5E4UojKKX2pwCetR0jm7YaAtsn5pZBqnoGPQY%2Bj8wG0hv0h%2B%2B76dcf32H5I70WEfG6SnubmiFzZcN2z72WWmvyafmvVVYRoyTDt79jPBjqkAZkd%2Fk%2BMdXsHnP4RL%2FrCM5PCeUjrU17RLpI9v7x1w2tOzbfCyWcnM9r0%2BxjUh68nYfEVs4I3a6BCnQydEWQYPv2otiSCfVwggukzSD0WXRGW9uApM5ZXTESnfCyWBSqy9xQlH8lNQTBszn7FlvPkuQAz%2FVEN3RbGlsvUwN4Mg6GoYRTwQONhGO7%2BJ2CjptB3afgzzAOYYoKxTAu9YNj%2FciXP7il2&X-Amz-Signature=77638a191b20e4038b79b87499928db8f72ac4976e98140b5048a667a612b1c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VNY6ZK62%2F20260502%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260502T184152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHoaCXVzLXdlc3QtMiJIMEYCIQDguVVfjwUkJH02JhWlbKdeehiL6SY2EZ8chffp3udM9AIhALX%2FjaFsnP%2BtMiB56zAyg65qLAEube4dpHb6fHYfhfdDKv8DCEMQABoMNjM3NDIzMTgzODA1Igzc3OegE9EoX8T2LHQq3AMJqEh4MzGI0LQV4jSnYKtfouqSwurYuTYUYL22BBZRPLV1NnixDuGRz74v%2FayDo4Z9V%2Fhmk1VctzvgSiFAyg5edlqH%2BKeptM056PlKS2RL7SIXZcMqSIvLTWiULCSNaeCVMm1bQ67owqmb5mEJ%2FVRaRj7vjiHa660mD9Uo%2F9ypXsxoXgGjlWqxGlsT9Q6J3nuNS2t0oIh5dbjvZFswW7cXpdk8eWHUoPETnvSRoILH1QsXPgiDrgFdfsVHOtXR%2BtLtPE4o%2FlvnbWdiBR7C9YTVLby79l2ywWuJMqVGM%2F58SEwtoxNoJK7O3RLx9WrAEDGeUFceS9oS0qMs3oijYqoNeAT%2BZNDpZHkrAnJeXa%2FT165Z5NruDXKLbqFWsa2NSpGKvzkVeIhY4KT0pb0GxCo%2FxhlD%2BawdrMBFDZEQ64NE3ibeqV294blmGJ2vYFzpsdWncdSoHKyskuTGilFFhO%2BAogkwznjS0QIdKFm43eGJSI8Jlxm3xtRJPmCj%2FfI0nU0wGJFoGd7av9IByi0xf7GLgTlqL5E4UojKKX2pwCetR0jm7YaAtsn5pZBqnoGPQY%2Bj8wG0hv0h%2B%2B76dcf32H5I70WEfG6SnubmiFzZcN2z72WWmvyafmvVVYRoyTDt79jPBjqkAZkd%2Fk%2BMdXsHnP4RL%2FrCM5PCeUjrU17RLpI9v7x1w2tOzbfCyWcnM9r0%2BxjUh68nYfEVs4I3a6BCnQydEWQYPv2otiSCfVwggukzSD0WXRGW9uApM5ZXTESnfCyWBSqy9xQlH8lNQTBszn7FlvPkuQAz%2FVEN3RbGlsvUwN4Mg6GoYRTwQONhGO7%2BJ2CjptB3afgzzAOYYoKxTAu9YNj%2FciXP7il2&X-Amz-Signature=af3797ca728fd05873cfa3258a8f2b5ac18caff28eea68452a58948db4051251&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
