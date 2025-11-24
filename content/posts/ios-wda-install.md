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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HPZEJ3D%2F20251124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251124T005715Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF3%2FL4yyoW%2B%2FlbXg5yH1iTvas1thyW8%2BPDMZpGE85yzXAiAGFUPEVAQG%2FkNHjLMIuyGjagslLxijBGZJU%2BCi8fCoxSr%2FAwhJEAAaDDYzNzQyMzE4MzgwNSIM%2B%2BYZI2%2B3fkQUN7C%2FKtwD9tI7U3BL7C%2B%2Bc6vlmIi0KLOBArMH4QRLX0DkCkOgDmdmHFUvXwkOyHKJlcJjycU1KCT9e2UJIT3QFnXuxhW%2B7HnXKDsxLKN618ypH7QhdT3nLKFztLviIRyEPEH75zZNrcHNCN%2BAttTu1ByeWuua4kFimtVHHhtHXaA%2BknlxvI0JcVribVDTbb%2BdbqGwqOlIuxCz2sbacodfblzktD8K0%2FggV9hUKkzOfhGFx4Km%2BZabsT7PRku2xC6AgrMFK9Ew80gMZ4%2BwAuVDwPbtg2kkZ6nZftm0tULbt%2FYZUiLlaHKU%2FYbrH%2FlufliO1URUTxgeZvkJBymUOzaxAPMvBEiIP%2Fmpr1lB8nr32MoSrtUoZdSuHGLHxRW9wszqMk5qmpSTNDbf4Hcb9TUOuAz0F0AwKg8qompzlVygEvjgKUr5taTfGEOA4AOXeLJFfeXP9FjCyNL6L%2FNr254M5GO8l%2BLtKhEQMpwIo8aQWNSz2pLmTrSKrbTFPow%2FIJWrinuXQOO4hStHrZyaA8%2BZ7Rt1AaWKRmKoQxriHc6DHWE2rwlfRifvvhixtqfbALYaGwEFpZQ5tumodYUy29JEdNJQZKMI6TY%2B6QIK9CB1LkyOq2ScE9lj0Rr7YpRNshdmWc8wv7%2BOyQY6pgFjyUsJteQc9m4AuWCgh51vTEZmh6t8TCoHVIrHAtaweRyT5c%2Fu4NWphP4dbG71qR1WQz4OAhxX8nxAnZD2amAfO1EBU%2FhmITqLd6xeZXKoEakw9LRyV8Zh7Z1mUfxXSXgpLaosQhz0Fnms0m7kK6%2Bxr%2BGU%2FsSo2ZBZqstXe1X5k3Wlpwqz1R5a0kkxGP8xbg4V5U0edNJ%2B%2Bp4vyWGZyNwTjvHLcGct&X-Amz-Signature=cc0ccde179eb8d576788e45adee69006ea4447492c8dfb617ad52d0335522c15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HPZEJ3D%2F20251124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251124T005715Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEID%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIF3%2FL4yyoW%2B%2FlbXg5yH1iTvas1thyW8%2BPDMZpGE85yzXAiAGFUPEVAQG%2FkNHjLMIuyGjagslLxijBGZJU%2BCi8fCoxSr%2FAwhJEAAaDDYzNzQyMzE4MzgwNSIM%2B%2BYZI2%2B3fkQUN7C%2FKtwD9tI7U3BL7C%2B%2Bc6vlmIi0KLOBArMH4QRLX0DkCkOgDmdmHFUvXwkOyHKJlcJjycU1KCT9e2UJIT3QFnXuxhW%2B7HnXKDsxLKN618ypH7QhdT3nLKFztLviIRyEPEH75zZNrcHNCN%2BAttTu1ByeWuua4kFimtVHHhtHXaA%2BknlxvI0JcVribVDTbb%2BdbqGwqOlIuxCz2sbacodfblzktD8K0%2FggV9hUKkzOfhGFx4Km%2BZabsT7PRku2xC6AgrMFK9Ew80gMZ4%2BwAuVDwPbtg2kkZ6nZftm0tULbt%2FYZUiLlaHKU%2FYbrH%2FlufliO1URUTxgeZvkJBymUOzaxAPMvBEiIP%2Fmpr1lB8nr32MoSrtUoZdSuHGLHxRW9wszqMk5qmpSTNDbf4Hcb9TUOuAz0F0AwKg8qompzlVygEvjgKUr5taTfGEOA4AOXeLJFfeXP9FjCyNL6L%2FNr254M5GO8l%2BLtKhEQMpwIo8aQWNSz2pLmTrSKrbTFPow%2FIJWrinuXQOO4hStHrZyaA8%2BZ7Rt1AaWKRmKoQxriHc6DHWE2rwlfRifvvhixtqfbALYaGwEFpZQ5tumodYUy29JEdNJQZKMI6TY%2B6QIK9CB1LkyOq2ScE9lj0Rr7YpRNshdmWc8wv7%2BOyQY6pgFjyUsJteQc9m4AuWCgh51vTEZmh6t8TCoHVIrHAtaweRyT5c%2Fu4NWphP4dbG71qR1WQz4OAhxX8nxAnZD2amAfO1EBU%2FhmITqLd6xeZXKoEakw9LRyV8Zh7Z1mUfxXSXgpLaosQhz0Fnms0m7kK6%2Bxr%2BGU%2FsSo2ZBZqstXe1X5k3Wlpwqz1R5a0kkxGP8xbg4V5U0edNJ%2B%2Bp4vyWGZyNwTjvHLcGct&X-Amz-Signature=fd2775c178a9712729e05d4a7e5bd8184115436bafc07803fd5d3baef08be766&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
