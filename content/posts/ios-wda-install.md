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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVN6PXXV%2F20260217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260217T123753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIG6Lq0m6FQHq4xMuw%2FnApwb%2FXtHaWlfDlnfTnTfw1hEEAiEA2udW26p7ewh5HMaFDGK%2BVNZC%2BA7VaRRRKmCDaD1I0GYq%2FwMITRAAGgw2Mzc0MjMxODM4MDUiDDQidcA6eXJxLQrLZyrcA6mlxwrOcHQYpOTo3Rp1kUv52uy6naCv%2BPH41o%2FosCnDDRj%2BWKu%2BvmJlL2lUsCWMeldLVKGmMGuh19vpI%2B%2FpxpRjpitUKq7EqZ7q9fsQTfvwX4EvGmAQX3vNX2T6dgFU8GK4a%2BgFpqJvuuwUHANU1SHi3KBGeO%2BrE0MdIqIBz2E50uyGVuSiVlO3canWjAFHtXRnqcJhHvg8P2iu4lM%2B38AXoJyt3yS7UkxEKrmFstEMO%2BZo6uiHU541i5ToFco7HhyCULnjsdtmOMPTzfCZziekGnNd5nITo6YtAjNPQ97msJazaXkGzIeGOWu%2F%2FAWlieqxttWWot2urMK54ljYjDnLwHhh5%2F2WRUWrXNThQ7lCwryH4NiQemuCIsnTb%2BbtbjBpvQPNe8ROwS3nT4RNZNxzvhH2yfRxMCLc1zUlR%2FFJutllywBhM2l84o4N5hcC0BijDsszNsd6z7PJAN5U2NhHfOz1Jku6NiWOKs%2BTgzmuCAtPEMMO7hANiPTNUF9W1M8M%2FR12E2FBZrJp3BtunRUXV5%2FWYB%2Bm1El%2B%2Bp3%2BseCzmJ6ryHp6jTLZqFvjHm778aoGhd6H3gJVLyP0%2FSKe6RuMVsTOzabkAvJgqnPpAcfr5YcLkPiAZ0tlbhTmMIGz0cwGOqUBSosq8czA3%2F3H3a0YuD%2BVv1sqK3x9dz9OtegvweMOUSJycR9cF84uG5PRZiB7sbbRJvW%2F%2Bg%2BqYy%2F04cuJxTm9GKDnHaFtbMVTtBJ3kwodPOlBcegL6hpSA%2BynHAOsKe1jL39AkkDg49uLndpgPIxlnk5wCGpmJYH9r5JOJ42LbSXTnnxj1rE7UpSpfhpAKV8HsE8C9O4AyJ2v0xhxQaT3xxBipskb&X-Amz-Signature=6cf98d18616f99724ba4ab909481fd405375fe1b4077f1f1dc3dcb8713db5bad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVN6PXXV%2F20260217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260217T123753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIG6Lq0m6FQHq4xMuw%2FnApwb%2FXtHaWlfDlnfTnTfw1hEEAiEA2udW26p7ewh5HMaFDGK%2BVNZC%2BA7VaRRRKmCDaD1I0GYq%2FwMITRAAGgw2Mzc0MjMxODM4MDUiDDQidcA6eXJxLQrLZyrcA6mlxwrOcHQYpOTo3Rp1kUv52uy6naCv%2BPH41o%2FosCnDDRj%2BWKu%2BvmJlL2lUsCWMeldLVKGmMGuh19vpI%2B%2FpxpRjpitUKq7EqZ7q9fsQTfvwX4EvGmAQX3vNX2T6dgFU8GK4a%2BgFpqJvuuwUHANU1SHi3KBGeO%2BrE0MdIqIBz2E50uyGVuSiVlO3canWjAFHtXRnqcJhHvg8P2iu4lM%2B38AXoJyt3yS7UkxEKrmFstEMO%2BZo6uiHU541i5ToFco7HhyCULnjsdtmOMPTzfCZziekGnNd5nITo6YtAjNPQ97msJazaXkGzIeGOWu%2F%2FAWlieqxttWWot2urMK54ljYjDnLwHhh5%2F2WRUWrXNThQ7lCwryH4NiQemuCIsnTb%2BbtbjBpvQPNe8ROwS3nT4RNZNxzvhH2yfRxMCLc1zUlR%2FFJutllywBhM2l84o4N5hcC0BijDsszNsd6z7PJAN5U2NhHfOz1Jku6NiWOKs%2BTgzmuCAtPEMMO7hANiPTNUF9W1M8M%2FR12E2FBZrJp3BtunRUXV5%2FWYB%2Bm1El%2B%2Bp3%2BseCzmJ6ryHp6jTLZqFvjHm778aoGhd6H3gJVLyP0%2FSKe6RuMVsTOzabkAvJgqnPpAcfr5YcLkPiAZ0tlbhTmMIGz0cwGOqUBSosq8czA3%2F3H3a0YuD%2BVv1sqK3x9dz9OtegvweMOUSJycR9cF84uG5PRZiB7sbbRJvW%2F%2Bg%2BqYy%2F04cuJxTm9GKDnHaFtbMVTtBJ3kwodPOlBcegL6hpSA%2BynHAOsKe1jL39AkkDg49uLndpgPIxlnk5wCGpmJYH9r5JOJ42LbSXTnnxj1rE7UpSpfhpAKV8HsE8C9O4AyJ2v0xhxQaT3xxBipskb&X-Amz-Signature=c90289419355248df41314f7e5c5c81f88806050c203d66f7077a1ffd7af326d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
