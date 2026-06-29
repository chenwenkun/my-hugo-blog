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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZ2CRN74%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T152856Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH9uQjLpg%2Fvh2zb8Yfw7TwAVSLZNC1UaW6MGzHmTVcdnAiEA7haheVIECKcsmIMgfLzVSEhHATyeuO%2BqhTI6UatAoh4qiAQIsf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEUwuS2o8EwR20AgpyrcA5bznPg6sCBHreUs60Fh5IHScafxNIkqPrwcN%2FRmbYGo9i51vttC6FZfiAKCvwRGD89%2Fjqmem9xqnYtTbDbvYQm%2B7Lkd5uNeI8KoRebAj7Q3x1UUYE931jWttG%2F2PyjlabeAl3%2Fk0pL8Rl9RIrB7MHF4xtokRw9ujA0fC6ko7SG8bqcHUJasLFYWfgYRLsHJMU9v30HWVv%2FVWm%2FHn63UpK7x8y4oX9KByMiK88IOnKvC%2BhR44VqMd0KVFEc55GtXU%2FZVRexs3CNMyJljfs%2BiRQK0T9xmCROgx%2Fyehfz0PEvHBd3L1Ywu9JIBm79bbfa7DemxDtb12n2IIiDfnTOPwovdTcrqKu5UaDM2QRLmi9CSilVGgt85FHgeB8CsdMudDUExdFahzboXTw%2ByNZGKUWpgX2wXUZUwtQoHXqwd5HkkhxND7uYNky8mS8SDDkVYsVDR7V3RbAzenKavUkHaj8R5G27LhH6x1qT61sAABCJp9BRm55RjD9WrlrrTChfNBmktER4OmEX6lEiBoHtqlp9rV5Hzk02VJv6aOqskuHyyEtoWmY%2FRoJQSICm7zWHez7v3Xb3udWEx3EweApRCI5nBnbd9EcdckqPHesm2XTBh6IIGtwLJYVrRc48aMLebitIGOqUBI5TIBCJu20fRH2l4EypILi3aiRHfcP%2Bi93H3t3eQPyx8KyQMKn96osYlL%2FhNoWgBj9z0KD2becdvTBbsXwvIRaRx050suZitcenR0NYOIkajI02%2BnEp8UCZ9O5jJu%2BGyyrrnng7JVaP4oMxPRsmR1jpkaSIpumyypDPpughEVLdgqe51w6YqOWKhMiGU%2B5palX3xszuO8gAAbJHabvQ7exwKg0NG&X-Amz-Signature=85400dcd46c31b4afa8057002732b84153c2cf3361b39ad116ee006ca1aed1b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TZ2CRN74%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T152856Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH9uQjLpg%2Fvh2zb8Yfw7TwAVSLZNC1UaW6MGzHmTVcdnAiEA7haheVIECKcsmIMgfLzVSEhHATyeuO%2BqhTI6UatAoh4qiAQIsf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEUwuS2o8EwR20AgpyrcA5bznPg6sCBHreUs60Fh5IHScafxNIkqPrwcN%2FRmbYGo9i51vttC6FZfiAKCvwRGD89%2Fjqmem9xqnYtTbDbvYQm%2B7Lkd5uNeI8KoRebAj7Q3x1UUYE931jWttG%2F2PyjlabeAl3%2Fk0pL8Rl9RIrB7MHF4xtokRw9ujA0fC6ko7SG8bqcHUJasLFYWfgYRLsHJMU9v30HWVv%2FVWm%2FHn63UpK7x8y4oX9KByMiK88IOnKvC%2BhR44VqMd0KVFEc55GtXU%2FZVRexs3CNMyJljfs%2BiRQK0T9xmCROgx%2Fyehfz0PEvHBd3L1Ywu9JIBm79bbfa7DemxDtb12n2IIiDfnTOPwovdTcrqKu5UaDM2QRLmi9CSilVGgt85FHgeB8CsdMudDUExdFahzboXTw%2ByNZGKUWpgX2wXUZUwtQoHXqwd5HkkhxND7uYNky8mS8SDDkVYsVDR7V3RbAzenKavUkHaj8R5G27LhH6x1qT61sAABCJp9BRm55RjD9WrlrrTChfNBmktER4OmEX6lEiBoHtqlp9rV5Hzk02VJv6aOqskuHyyEtoWmY%2FRoJQSICm7zWHez7v3Xb3udWEx3EweApRCI5nBnbd9EcdckqPHesm2XTBh6IIGtwLJYVrRc48aMLebitIGOqUBI5TIBCJu20fRH2l4EypILi3aiRHfcP%2Bi93H3t3eQPyx8KyQMKn96osYlL%2FhNoWgBj9z0KD2becdvTBbsXwvIRaRx050suZitcenR0NYOIkajI02%2BnEp8UCZ9O5jJu%2BGyyrrnng7JVaP4oMxPRsmR1jpkaSIpumyypDPpughEVLdgqe51w6YqOWKhMiGU%2B5palX3xszuO8gAAbJHabvQ7exwKg0NG&X-Amz-Signature=1b249fd847db08b5e22a8874a258b569999433690675f73b364c0df8ac381eff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
