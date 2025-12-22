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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JPRUY3T%2F20251222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251222T005935Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB8aCXVzLXdlc3QtMiJHMEUCIHPNwQkiaN%2Bk72Ml2SY1WtzZQGjMAiFBs3uze%2F%2FsAtDLAiEA7o8eNro38tvtb%2Bl6Mj8Av9xxrbfBNUqkaDu0kEss7LMqiAQI6P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKT%2Be8IKhkZnMLhN2CrcAy5ECM733Kr%2BKoFwevU2ww8rtsYu%2FKU4vlxao7LrkhINJ4mGOmPYgpjmo7hkhzF4bnx1e3RXmC7L5Ubvm1XDwYjpXIs79nmqJpkQARJHx9bav2pzO9KFcBP6k63MIlIIRJqaEU%2BVv0Zk%2FF8kzTFuVxMyF1af9jwlrbzy68qeczsfXjfG95Qw8SxdPJr8mflAWqNmNLOYVqspJt4HEmUqDhMgTUr7oYTflNX4m0GD5Sg5HGawH7uqcMN3aA%2F%2BIpCjrdQahrdItPfCB9pGZOlW1%2FoNdtSKnVd7QE%2Finnirc4EZwcqc%2FJac%2FUpaV9w75CVnGYyN48%2BfbCqxzmiaztND2Gkj3%2BUXRH%2FRwAcZelLoEoUWSI5Y71M%2FlAKDqU5pUBx1JhzSPE4VeK%2Bsdg01HQismBbyDkcBPsnYGOQ4bDBF0QQ8HxxxHsTvCzEim05PTbRFmAHXQfG%2FJYi6btsXYeG70o6NqjX23y466kFhF%2FWN%2B1f2qMbfWeIKaetKuFfrtG%2FzaMhEtoffP6Mt1pq%2F0oc27Gg8VvCMZJV1uPOtAq2eTyoWY3bd9weLmo2cqTKOEtP11qzd7AsHcZFp%2FDu7g1GFSKpo0B2UDMGfqBMUeIxeuq20aN%2BmPIG17JAuY245MMb5ocoGOqUByVuMbB7v2DdcNMZbijcLY5bOCjN7VzgB7VfcgEfVFnLJrmTPrRbToIoFfaCeA53NJrh9neL7NLP%2Bi2sz7k72KXJ%2B%2FNERVgRvBGZHf7UEOqsLNt1eS5yOeYNCtCGbKBAlm%2Bjf%2B6WyUd2B4aUWuZiXxIPzzQ%2FqOtlJZWy8%2FGxdFEamdULQGEg0jXMF3milgDNv38oiquxB7czt%2FMJyRdzUXYh%2BZld3&X-Amz-Signature=c8d9d2ca71c7e4fdb457ef5604853abd4b9418448f04efcf6a3c0dee5b05fd2c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JPRUY3T%2F20251222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251222T005935Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB8aCXVzLXdlc3QtMiJHMEUCIHPNwQkiaN%2Bk72Ml2SY1WtzZQGjMAiFBs3uze%2F%2FsAtDLAiEA7o8eNro38tvtb%2Bl6Mj8Av9xxrbfBNUqkaDu0kEss7LMqiAQI6P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKT%2Be8IKhkZnMLhN2CrcAy5ECM733Kr%2BKoFwevU2ww8rtsYu%2FKU4vlxao7LrkhINJ4mGOmPYgpjmo7hkhzF4bnx1e3RXmC7L5Ubvm1XDwYjpXIs79nmqJpkQARJHx9bav2pzO9KFcBP6k63MIlIIRJqaEU%2BVv0Zk%2FF8kzTFuVxMyF1af9jwlrbzy68qeczsfXjfG95Qw8SxdPJr8mflAWqNmNLOYVqspJt4HEmUqDhMgTUr7oYTflNX4m0GD5Sg5HGawH7uqcMN3aA%2F%2BIpCjrdQahrdItPfCB9pGZOlW1%2FoNdtSKnVd7QE%2Finnirc4EZwcqc%2FJac%2FUpaV9w75CVnGYyN48%2BfbCqxzmiaztND2Gkj3%2BUXRH%2FRwAcZelLoEoUWSI5Y71M%2FlAKDqU5pUBx1JhzSPE4VeK%2Bsdg01HQismBbyDkcBPsnYGOQ4bDBF0QQ8HxxxHsTvCzEim05PTbRFmAHXQfG%2FJYi6btsXYeG70o6NqjX23y466kFhF%2FWN%2B1f2qMbfWeIKaetKuFfrtG%2FzaMhEtoffP6Mt1pq%2F0oc27Gg8VvCMZJV1uPOtAq2eTyoWY3bd9weLmo2cqTKOEtP11qzd7AsHcZFp%2FDu7g1GFSKpo0B2UDMGfqBMUeIxeuq20aN%2BmPIG17JAuY245MMb5ocoGOqUByVuMbB7v2DdcNMZbijcLY5bOCjN7VzgB7VfcgEfVFnLJrmTPrRbToIoFfaCeA53NJrh9neL7NLP%2Bi2sz7k72KXJ%2B%2FNERVgRvBGZHf7UEOqsLNt1eS5yOeYNCtCGbKBAlm%2Bjf%2B6WyUd2B4aUWuZiXxIPzzQ%2FqOtlJZWy8%2FGxdFEamdULQGEg0jXMF3milgDNv38oiquxB7czt%2FMJyRdzUXYh%2BZld3&X-Amz-Signature=3ac01990ffaad9a7e7448f67d6d241e14b677667c14b240dff0de5a0cd23ac09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
