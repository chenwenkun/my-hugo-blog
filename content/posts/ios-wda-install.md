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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667U3RFTAW%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T100306Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKzEoySYsOkNCOz%2Fir7LZGB1qSXNq5Bzm8UYIQdMU5%2BAiEA%2BSWefKmhZsX5S5rGaNxapjeW2zj2bJkKTiIrw8YZGyUqiAQIof%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO7JASEI6YLdFpTlISrcA7AeQZRmKhoq70cqag6TLNWxnwZOHKFE%2FHd5C1km8mmSFzALllqVjXB5jIoUzGsukDMKn0c%2BlPABajwV7eioc%2FZMs1j5dDYd6b52Fzs0secb52Tv8gaZiEzCg74Y2FUETjznRy4TE1e5yoDIBEt1ow2u36IASBbr8jHKrcNQYmB8111l6eOJ9X9mGbMeO05ohvOR5hsGxflXAfBc%2Bj5j1hdOZBcAEQnzs%2Fm6qXTRfSBCK178DMAzc8Rq2xuHtuaTw4fn78OvFE%2B4rgjKW8uaBcK3XOEKRImBCV79pRS7VD0sUmxaHmWU%2FXUXWJS2ET7Xv7q1TKm9wKRch%2Bxi3FBn%2BZerSyQz9dsmMFVVJzLKUTlf2H9jETAhWy%2BDQqJp31BS%2BYD%2BzjtAbs6PxMmVrQM7kMvZy4NKoYt2S%2BVMYM11PJnOKnVFeKkn00OgkSJbq4ZHcXCM6wfGyttuYHlQ%2F%2B8pVOrcV1UCk9UwRlsDT94FrfFmsrVtt15puEiZFXk4dklW8UXpEB4f8525eYR%2Ba1E%2F8vLR51OSaxmmsDfnJrboQU8vx8nfpW8AewOgDRypZHkUBlgQBOJ9iBYhB2CeWAyyEtOHdzsS4SzxiKaJnLnvmW2GTJVE%2Ffsm7sNOkQfAMJ%2B7ztEGOqUBlXjtQSB4A5TuGTItwFVwU6G%2By2a0ubtAmPOelEufShFIQY6x7VfFjLqC3mWXdUm4z4Int2gamQzmtKx38cc6yngMQBAzQ9Vm3VQ5K3RDZD%2Bi%2FO%2BEsrM5AsSaL1OkhHeVZClYrGcgbmrUzB9EZy5GD72w2a0cAWijF%2FjY%2FdePjxOMTXNeyYcDU7HhjOaiUyu9xomE58KTjzkwGwhzPURCoYBEMjdU&X-Amz-Signature=330e1fb9f46a070ee2208beab353dfc3722e4c25cc69ea75585174689b9ca9d7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667U3RFTAW%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T100306Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKzEoySYsOkNCOz%2Fir7LZGB1qSXNq5Bzm8UYIQdMU5%2BAiEA%2BSWefKmhZsX5S5rGaNxapjeW2zj2bJkKTiIrw8YZGyUqiAQIof%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO7JASEI6YLdFpTlISrcA7AeQZRmKhoq70cqag6TLNWxnwZOHKFE%2FHd5C1km8mmSFzALllqVjXB5jIoUzGsukDMKn0c%2BlPABajwV7eioc%2FZMs1j5dDYd6b52Fzs0secb52Tv8gaZiEzCg74Y2FUETjznRy4TE1e5yoDIBEt1ow2u36IASBbr8jHKrcNQYmB8111l6eOJ9X9mGbMeO05ohvOR5hsGxflXAfBc%2Bj5j1hdOZBcAEQnzs%2Fm6qXTRfSBCK178DMAzc8Rq2xuHtuaTw4fn78OvFE%2B4rgjKW8uaBcK3XOEKRImBCV79pRS7VD0sUmxaHmWU%2FXUXWJS2ET7Xv7q1TKm9wKRch%2Bxi3FBn%2BZerSyQz9dsmMFVVJzLKUTlf2H9jETAhWy%2BDQqJp31BS%2BYD%2BzjtAbs6PxMmVrQM7kMvZy4NKoYt2S%2BVMYM11PJnOKnVFeKkn00OgkSJbq4ZHcXCM6wfGyttuYHlQ%2F%2B8pVOrcV1UCk9UwRlsDT94FrfFmsrVtt15puEiZFXk4dklW8UXpEB4f8525eYR%2Ba1E%2F8vLR51OSaxmmsDfnJrboQU8vx8nfpW8AewOgDRypZHkUBlgQBOJ9iBYhB2CeWAyyEtOHdzsS4SzxiKaJnLnvmW2GTJVE%2Ffsm7sNOkQfAMJ%2B7ztEGOqUBlXjtQSB4A5TuGTItwFVwU6G%2By2a0ubtAmPOelEufShFIQY6x7VfFjLqC3mWXdUm4z4Int2gamQzmtKx38cc6yngMQBAzQ9Vm3VQ5K3RDZD%2Bi%2FO%2BEsrM5AsSaL1OkhHeVZClYrGcgbmrUzB9EZy5GD72w2a0cAWijF%2FjY%2FdePjxOMTXNeyYcDU7HhjOaiUyu9xomE58KTjzkwGwhzPURCoYBEMjdU&X-Amz-Signature=9daf43e8b5963c2a7f9fae7d95c3a91f2bbfa862bbe0d117b61a2a5a560bb3e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
