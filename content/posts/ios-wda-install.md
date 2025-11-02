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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S2IIYWEU%2F20251102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251102T005615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJHMEUCIBFUjBms1WIE04ayE9tSTPjrE2yi1mqgxz%2Bz9ZTJziMQAiEA0pQil6IzfloDx%2FWNd0CN58mw6JSWUBWbUsYbiRWDiXAq%2FwMINhAAGgw2Mzc0MjMxODM4MDUiDIon8yWfkGNBfwtt9ircA%2BoTTec85Zw5C%2BHBMKhhmkXyGUPwTyZKwS7OJ%2BUaEnLkRFyojeQQ9NA3TkxqUBPP%2BY5pJJ77FGChzMDd4%2FKeeq%2FWbju3N2l2Xo7HGseIg5kAQg0f3ZgdIbmUXbJPqYKv%2FhfWQ9dRj%2ByQkwPmKsb%2BMwEk4%2Fl7S9KsoYI2Q%2Bi34wJ9bdMLxBBPHx6ft4nTZEbI42HufdGEUVKM%2F7G5FbPbhHrObUuP6MpIeefSY9WNGzNHVRsgszNjfhJRHoHNunFAVTcuLY9Zx7n%2B1a4ufdtoxEFsQwzY31SdMrrc4abQAGXLSb%2BhHiPlBFOA8vqIajlyMRgDzXe2%2FtH4F8r3jTMbRk7H8cMxqYkYJCGHuApcOkqSpjP3z%2FD0beiTvaZ7E1nWoQkmG2Zswd9c0uiTTs8zCcngrzUE0AKhj8Ikooke%2BGf78YNUR7ZRsMDkmjleEw2CsJfptS3vYgGZMQf4Ik8hflUxvS81uteZYn5A9ExbOgzRBjiNsidfPXWL18AgR%2FJdkxnXMD7qEioXToVRU0Gj1e7oqXUIrQsG8Xe7mub6ELMfc1e0DpkxlMdzEzddO2DBYjOQcZasNj5MNHS1zQY%2Br0dAym4o2C%2FvGdA69uAh%2BG84Gk7t5IGIldqWBq5KMM7ZmcgGOqUBehQ7YyjJnHQXMbmNekhtCMmty%2FFC8WkzODtPcDYYbPzeJ5VXgmBTNT3biEzXtbFM7NDgZk4hNYvpqHtVQ6icGrk%2BvGiKvfDc2uE%2Fb2JJWEtw8riuRuemCAnxHKwqXQCe6vhghMgW08J3oaNssvnTVl96f4t31uaVuvmx0BbBQvJNaYenDS5PdHmN7HbiKLqybvNZbmo37zqf9I2%2BqYL5oCqx6soO&X-Amz-Signature=b8465f39099a1804494ee97325481ac75c8cbf2a71512313630b177eb845436c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S2IIYWEU%2F20251102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251102T005615Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJHMEUCIBFUjBms1WIE04ayE9tSTPjrE2yi1mqgxz%2Bz9ZTJziMQAiEA0pQil6IzfloDx%2FWNd0CN58mw6JSWUBWbUsYbiRWDiXAq%2FwMINhAAGgw2Mzc0MjMxODM4MDUiDIon8yWfkGNBfwtt9ircA%2BoTTec85Zw5C%2BHBMKhhmkXyGUPwTyZKwS7OJ%2BUaEnLkRFyojeQQ9NA3TkxqUBPP%2BY5pJJ77FGChzMDd4%2FKeeq%2FWbju3N2l2Xo7HGseIg5kAQg0f3ZgdIbmUXbJPqYKv%2FhfWQ9dRj%2ByQkwPmKsb%2BMwEk4%2Fl7S9KsoYI2Q%2Bi34wJ9bdMLxBBPHx6ft4nTZEbI42HufdGEUVKM%2F7G5FbPbhHrObUuP6MpIeefSY9WNGzNHVRsgszNjfhJRHoHNunFAVTcuLY9Zx7n%2B1a4ufdtoxEFsQwzY31SdMrrc4abQAGXLSb%2BhHiPlBFOA8vqIajlyMRgDzXe2%2FtH4F8r3jTMbRk7H8cMxqYkYJCGHuApcOkqSpjP3z%2FD0beiTvaZ7E1nWoQkmG2Zswd9c0uiTTs8zCcngrzUE0AKhj8Ikooke%2BGf78YNUR7ZRsMDkmjleEw2CsJfptS3vYgGZMQf4Ik8hflUxvS81uteZYn5A9ExbOgzRBjiNsidfPXWL18AgR%2FJdkxnXMD7qEioXToVRU0Gj1e7oqXUIrQsG8Xe7mub6ELMfc1e0DpkxlMdzEzddO2DBYjOQcZasNj5MNHS1zQY%2Br0dAym4o2C%2FvGdA69uAh%2BG84Gk7t5IGIldqWBq5KMM7ZmcgGOqUBehQ7YyjJnHQXMbmNekhtCMmty%2FFC8WkzODtPcDYYbPzeJ5VXgmBTNT3biEzXtbFM7NDgZk4hNYvpqHtVQ6icGrk%2BvGiKvfDc2uE%2Fb2JJWEtw8riuRuemCAnxHKwqXQCe6vhghMgW08J3oaNssvnTVl96f4t31uaVuvmx0BbBQvJNaYenDS5PdHmN7HbiKLqybvNZbmo37zqf9I2%2BqYL5oCqx6soO&X-Amz-Signature=91d0b6f751599db4aa032daf829222ffbd1836f3ca9f80b919f2e9fc6421f5af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
