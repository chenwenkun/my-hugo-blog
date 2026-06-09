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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NTYAEFJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T085826Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAAaCXVzLXdlc3QtMiJHMEUCIHkS62WJwY7VdYNL950T%2BRfjdv9f9M6gO7pKn0qbcRuPAiEAl%2F1m3L5p4vVKCrBf5f0Tx5qaH5Kpl%2BOMBb%2BUQIy7zTQqiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBhYh%2FYQUs3EyzPOWircA7PO30%2FaqgkHQRxRvEYQL6AqLTryC1xc6NXaMqwZVwJwVkTgZYaduMUliaId3XJ8%2FS7a5YFEG64NeKKnjp%2B%2FLKXoBf94YNU3T72jSpUUMZZ%2FHYmjaYiz9urG5mbGDTTWCsLEbvHHm7z%2B9%2F%2BbA%2F%2FWp8xeaI36fhA3mVldgt0BaRAJcg%2FXAdOj%2BCUhDkB5FkjetFuluTdgbeY0UpniQ6szK7FGcSUte0%2BiGdiNA%2BItJVfxZq1Qa8LI%2FT6Do6T972HCBQaMy%2F5qbCxLmmAnlOtDDQgrV0lBlpQfzUhP8WQDPePS019NY6nl%2B3s3qiXidFwsvRNZAk7X67aB9sXEux2HW4IK49z0qHxy2YokqB8FRvXL2fo2Rt7c0wuNqr8WblLEnLglVASBM5kKBG%2FWXQ75geS8Vf7f1%2FM8GdG5JY67MLJwEYMmKQcElkj2Uis8b9RFkZs1UVf%2BeSZE7C%2BSeRJRF7HMJhhwqMpuL64n8bK3s8gIPDvJgocPXAlT2rMc5cqyrycR6LL%2FIm%2Fy2FjeDiCnYTKEDdpL%2BuPbbWnwXfrs4NWRvC4%2FWrm5WPOSPoacw%2BahuA2nTS0UqQ0w1dk9Syw7bbENOYTGS8PGtnvkEV9AbS1GgRKwdEJma%2FulXGRuMLePn9EGOqUBy0qcOsGwgUr7MobE5HkN2MWVc72avhAoK53tHrwvEkMbuA6nGMXN7PLPzf5yGVzEaIhO7OkVKmGiBcE3jGu7S21E4ZEa%2Bd0Y6JzCKYGjsYPCv4QrZ7Do2ECHjt6JS98JEKYcF%2B%2FS3dXee7pOuFUIiCT31a4B6VNFXS%2BSY5KQ9j0nt66spJ4g0N2UZhtkO%2FNMHLdMsOX6%2Fmm7P1qVb4erfloME3NE&X-Amz-Signature=a0d7c99b9132c3b538af08303a81f06ee4968182c2276ab50cf5be8367eacbb6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NTYAEFJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T085826Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAAaCXVzLXdlc3QtMiJHMEUCIHkS62WJwY7VdYNL950T%2BRfjdv9f9M6gO7pKn0qbcRuPAiEAl%2F1m3L5p4vVKCrBf5f0Tx5qaH5Kpl%2BOMBb%2BUQIy7zTQqiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBhYh%2FYQUs3EyzPOWircA7PO30%2FaqgkHQRxRvEYQL6AqLTryC1xc6NXaMqwZVwJwVkTgZYaduMUliaId3XJ8%2FS7a5YFEG64NeKKnjp%2B%2FLKXoBf94YNU3T72jSpUUMZZ%2FHYmjaYiz9urG5mbGDTTWCsLEbvHHm7z%2B9%2F%2BbA%2F%2FWp8xeaI36fhA3mVldgt0BaRAJcg%2FXAdOj%2BCUhDkB5FkjetFuluTdgbeY0UpniQ6szK7FGcSUte0%2BiGdiNA%2BItJVfxZq1Qa8LI%2FT6Do6T972HCBQaMy%2F5qbCxLmmAnlOtDDQgrV0lBlpQfzUhP8WQDPePS019NY6nl%2B3s3qiXidFwsvRNZAk7X67aB9sXEux2HW4IK49z0qHxy2YokqB8FRvXL2fo2Rt7c0wuNqr8WblLEnLglVASBM5kKBG%2FWXQ75geS8Vf7f1%2FM8GdG5JY67MLJwEYMmKQcElkj2Uis8b9RFkZs1UVf%2BeSZE7C%2BSeRJRF7HMJhhwqMpuL64n8bK3s8gIPDvJgocPXAlT2rMc5cqyrycR6LL%2FIm%2Fy2FjeDiCnYTKEDdpL%2BuPbbWnwXfrs4NWRvC4%2FWrm5WPOSPoacw%2BahuA2nTS0UqQ0w1dk9Syw7bbENOYTGS8PGtnvkEV9AbS1GgRKwdEJma%2FulXGRuMLePn9EGOqUBy0qcOsGwgUr7MobE5HkN2MWVc72avhAoK53tHrwvEkMbuA6nGMXN7PLPzf5yGVzEaIhO7OkVKmGiBcE3jGu7S21E4ZEa%2Bd0Y6JzCKYGjsYPCv4QrZ7Do2ECHjt6JS98JEKYcF%2B%2FS3dXee7pOuFUIiCT31a4B6VNFXS%2BSY5KQ9j0nt66spJ4g0N2UZhtkO%2FNMHLdMsOX6%2Fmm7P1qVb4erfloME3NE&X-Amz-Signature=cf43d102247f5eadf2ae98e9562c8c521a8d5ecc15e639220dfd1c188e540333&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
