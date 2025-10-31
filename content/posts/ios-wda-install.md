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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y7H7NA4F%2F20251031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251031T061735Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJHMEUCIQDUbX9ads%2FTIG0HnYUfBk%2BghYbs6bQultSIl0kVVHnM0AIgKCe77jcP99AmQCJABJUGur9dsWPig7%2B2jek2Wcab48YqiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNnfI7Y2MNTqhvKDkyrcA4B%2FiOccHbv%2BL7bJDyiPavVB4B%2BKowMaNUGTS%2B%2F9%2BRqLzPaQNtZEcAl%2FpjGrlwVM4tfbgYYGdw3rUcr71OjAJSnbMShYMLy0v21pdxZy51gmU5raTTauKPPD%2BPhQTipvU33t0LBypDzHm5TpNbdrh2s%2F64PDkTxLXUzf8CBGKS7J7oCu%2FeVjsCIxnsjdzF%2FejjWxBCosD1ZnTesA6ksLyuJmXru4nxDj1k2%2BfnRl6zbabGXCfscqcwBZMzxaDNapQ7vpBL4gt87kZ32T4bnypKUFDHMsTxcwBRYIcdSLRyW8sL%2FVafwTz5r5sToIMjl8XOfpaZvbs%2FDM4Wa2oXDHq%2B04m9%2FUosT6EQg26T2ZmvOZ0BrVKkN0CuekidfsRdeqN5LyYDhDstDtoK0yF70te68A5Clgmnh8m4y9nrCK7aUUQl%2Bjnh0DMKcwexeW7nRBk8jR7Iy91rX777iwflmkEmGqHaCLXQ%2FCuNe4ntLM8pG%2FNUqoqWYfhMH%2FFZYS1yZsh%2FqDJfQXdcCneY6Ct8GmMCvLjhyrLfwoWoHMUW2zh5CQciZq8kwp2CkJGxTbDaWRkjr7WZsDLRfq4AmdS3QjJ4RP%2BwXmpM9Qe%2FLuK8MWmeqZ9uh7Bs%2BNlndgH2EkMIqikcgGOqUBgUTpPAlXGBztR5uHrFmkNzsI%2FaBgBbhfB1TRc3CFndQskwfgWa%2Fk8S6HDpkPh1GUcTOYwFNRL%2BL3p2RTQ%2BfG2a4cW1mqbKOuaouzCKr0DQ7A%2FqbSLGdb%2BH%2BPh74DMFexKoVAAxWaBHMlFY2RrJBAGDU4khjFfDRa7UVxTCN%2FjiY47ns4UlqbEyiYMgmk6PNvKxV8EVAwA9MgwaDzjAlqDi%2BZF1Hq&X-Amz-Signature=d81db94c811942f1662b59481bae285be2c95a61f50d6835261e2eacb21959a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y7H7NA4F%2F20251031%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251031T061735Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEYaCXVzLXdlc3QtMiJHMEUCIQDUbX9ads%2FTIG0HnYUfBk%2BghYbs6bQultSIl0kVVHnM0AIgKCe77jcP99AmQCJABJUGur9dsWPig7%2B2jek2Wcab48YqiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNnfI7Y2MNTqhvKDkyrcA4B%2FiOccHbv%2BL7bJDyiPavVB4B%2BKowMaNUGTS%2B%2F9%2BRqLzPaQNtZEcAl%2FpjGrlwVM4tfbgYYGdw3rUcr71OjAJSnbMShYMLy0v21pdxZy51gmU5raTTauKPPD%2BPhQTipvU33t0LBypDzHm5TpNbdrh2s%2F64PDkTxLXUzf8CBGKS7J7oCu%2FeVjsCIxnsjdzF%2FejjWxBCosD1ZnTesA6ksLyuJmXru4nxDj1k2%2BfnRl6zbabGXCfscqcwBZMzxaDNapQ7vpBL4gt87kZ32T4bnypKUFDHMsTxcwBRYIcdSLRyW8sL%2FVafwTz5r5sToIMjl8XOfpaZvbs%2FDM4Wa2oXDHq%2B04m9%2FUosT6EQg26T2ZmvOZ0BrVKkN0CuekidfsRdeqN5LyYDhDstDtoK0yF70te68A5Clgmnh8m4y9nrCK7aUUQl%2Bjnh0DMKcwexeW7nRBk8jR7Iy91rX777iwflmkEmGqHaCLXQ%2FCuNe4ntLM8pG%2FNUqoqWYfhMH%2FFZYS1yZsh%2FqDJfQXdcCneY6Ct8GmMCvLjhyrLfwoWoHMUW2zh5CQciZq8kwp2CkJGxTbDaWRkjr7WZsDLRfq4AmdS3QjJ4RP%2BwXmpM9Qe%2FLuK8MWmeqZ9uh7Bs%2BNlndgH2EkMIqikcgGOqUBgUTpPAlXGBztR5uHrFmkNzsI%2FaBgBbhfB1TRc3CFndQskwfgWa%2Fk8S6HDpkPh1GUcTOYwFNRL%2BL3p2RTQ%2BfG2a4cW1mqbKOuaouzCKr0DQ7A%2FqbSLGdb%2BH%2BPh74DMFexKoVAAxWaBHMlFY2RrJBAGDU4khjFfDRa7UVxTCN%2FjiY47ns4UlqbEyiYMgmk6PNvKxV8EVAwA9MgwaDzjAlqDi%2BZF1Hq&X-Amz-Signature=e84d1485b9e6d07b8a722acead0cadbf6568c14ca43948ea3eae1f9f4761139b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
