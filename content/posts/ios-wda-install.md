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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666AOIFWD6%2F20260307%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260307T122452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaCXVzLXdlc3QtMiJIMEYCIQCOYwz09uA6Ily1ix7Qv3sdPxQg0l9UrxcpGKRbKn05wgIhAOeZ1VHSAio4BSJfCuJ4UXSz255DXJFp47KFellvi2IVKogECPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxbsLN5hduZXWNo9fsq3ANDsR5Q%2B8RwWa0Q1CZMo4O0Dv3pRD3p4p9sLzdYf7pm95E71%2FsarUuBYPCcqkRDGNic2suBtGsQsbtwzseHtLU4UUhgyt8qGT8YEiVXyUXohDkz76jROtAVyGP1YNsLRuks9Y3cSdJ1xSlF%2BXGNtxaXwzJchhxJk7ZarZdwfo9HrY%2FjVEP3XIkGG%2F0lj6lN8pVRFrx%2F7DNzgZ4OUn1KX3dlaR8zGnxq2fuo9AmuJ0o0y5VBQslYUkE4gErRxmhTZfKy1GPJNz6E6YG95RWgrG3%2B51OyTiIDRDS%2FKqAE7%2FgjpBvMAZ0Cz1EvL4%2B%2B4RVchqG%2Fn1qIxUcy5%2F0GvCGAI%2FrRQFj2n16a7I1%2Bujj1G8m6xxbk%2F%2FNZc0qxglltfx8AG5v0bcMrmjh%2BENKmTpxo7ll4WMRLiJ%2Fq14CUsdAWZNhDc9tgtQxoj9GW3%2B8swLLD5CWeTu1T39ZvwraWVe8zlHHXPGS%2B2fkWBsFSOxg%2F08kVDspjG7OOMwnF1p6ivTz45Wa47LR7YWuu5Rj%2BN9H1hRmRytRI2YoXT30Uk5tkay3O1L%2Fs6rEhSwj8cLA%2FdbexRULScliZdkuiEyNWcKj5XiG4pWxY8hALW%2BdFYYHBdgRj%2BvxWXeTjgmrokxzkwjDXj7DNBjqkATRez%2FmUjocCClcTjV1v2lIvOmneJGx1B2gwxA9%2Bq5fW2Z8Sr2syqILd%2Fcu1bW0qbjQn0wHM8FxeNuLj%2BDYvSUZM6LYcMriC9nXB6CZ8T8ZMA8KNAjpSw1GyBdO%2FbOvcQoDoTYHJal%2F52GIUqJ78%2F57VoGE3Kwbu%2F%2B7ZOlsWg%2BYx0xA9GsTshpgE3cI2ahNblwB%2BJLSIB8%2F%2BfiF7bKE9WVWsiwpr&X-Amz-Signature=46b8083305212be87ccce10bf8a1093afbcb883d00c7cdcf3913922ff318132d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666AOIFWD6%2F20260307%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260307T122452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaCXVzLXdlc3QtMiJIMEYCIQCOYwz09uA6Ily1ix7Qv3sdPxQg0l9UrxcpGKRbKn05wgIhAOeZ1VHSAio4BSJfCuJ4UXSz255DXJFp47KFellvi2IVKogECPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxbsLN5hduZXWNo9fsq3ANDsR5Q%2B8RwWa0Q1CZMo4O0Dv3pRD3p4p9sLzdYf7pm95E71%2FsarUuBYPCcqkRDGNic2suBtGsQsbtwzseHtLU4UUhgyt8qGT8YEiVXyUXohDkz76jROtAVyGP1YNsLRuks9Y3cSdJ1xSlF%2BXGNtxaXwzJchhxJk7ZarZdwfo9HrY%2FjVEP3XIkGG%2F0lj6lN8pVRFrx%2F7DNzgZ4OUn1KX3dlaR8zGnxq2fuo9AmuJ0o0y5VBQslYUkE4gErRxmhTZfKy1GPJNz6E6YG95RWgrG3%2B51OyTiIDRDS%2FKqAE7%2FgjpBvMAZ0Cz1EvL4%2B%2B4RVchqG%2Fn1qIxUcy5%2F0GvCGAI%2FrRQFj2n16a7I1%2Bujj1G8m6xxbk%2F%2FNZc0qxglltfx8AG5v0bcMrmjh%2BENKmTpxo7ll4WMRLiJ%2Fq14CUsdAWZNhDc9tgtQxoj9GW3%2B8swLLD5CWeTu1T39ZvwraWVe8zlHHXPGS%2B2fkWBsFSOxg%2F08kVDspjG7OOMwnF1p6ivTz45Wa47LR7YWuu5Rj%2BN9H1hRmRytRI2YoXT30Uk5tkay3O1L%2Fs6rEhSwj8cLA%2FdbexRULScliZdkuiEyNWcKj5XiG4pWxY8hALW%2BdFYYHBdgRj%2BvxWXeTjgmrokxzkwjDXj7DNBjqkATRez%2FmUjocCClcTjV1v2lIvOmneJGx1B2gwxA9%2Bq5fW2Z8Sr2syqILd%2Fcu1bW0qbjQn0wHM8FxeNuLj%2BDYvSUZM6LYcMriC9nXB6CZ8T8ZMA8KNAjpSw1GyBdO%2FbOvcQoDoTYHJal%2F52GIUqJ78%2F57VoGE3Kwbu%2F%2B7ZOlsWg%2BYx0xA9GsTshpgE3cI2ahNblwB%2BJLSIB8%2F%2BfiF7bKE9WVWsiwpr&X-Amz-Signature=54e8bf04ef501d2006cc68a9bcebea9834ed651da3c0d4b710632f284ae3508d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
