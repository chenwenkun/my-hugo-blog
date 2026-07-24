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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664RO7PU5P%2F20260724%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260724T191022Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIFp3lKt4yMJnTSzAAJLFVlxWxGGds3Hw68FyyplxcTlHAiBG%2Fwu9FC9a9NsArv0QP%2B8VS%2FoqLheufwYcUFZvfzamaSr%2FAwgLEAAaDDYzNzQyMzE4MzgwNSIM%2Bc3wNhmhTbXoAQO7KtwDXP1C39%2BCvRSsGQm9r4amjvctDk8cksrcY0fcxsW9qiwZf8zCGD3FKqlm%2FsEVzc%2BQ39LB3IgIOQWcCihMiiUU1CSvXthmhF6dlAqcQLKyRuLwduFu9eJT%2BOMbJwdgDlNX0Shnx5oChfTd7TXrl0ByJ57fnajW7A2UtnqymkwiEeJnu4us8%2FFYssFTkPoKjP5nw0l3NA0DnhA8lMJ4V5ZcjR8cQm%2B%2BqauIoHY19o0X195heiyte33ucmuTIQcBsBOAWU0Tdvjsrv8Ij7O0qpR5aEfcU%2FNp3m%2B2AmFtKpwx0M5JTh3cgeSzAAXB5gK91dWoehtRNF6lC8jmFWO2KLEIckqqwJE%2Blp4fVFm5EtQJccyEDDSTQvR4xLtIOj6FlUnklBLwXerXKCS%2F5lCzYKOFwDuU3VkPwcFlDIJ%2BVhwVawIT6f6IhzQ4L3zvEV2x3BeP6EeNNVDel7LFEEcxeNVo26wwzuNf8h8LiGlzsVwESyAeq6x6oHnkqWfFv6Psi9fAeJUM9whHyEE%2B%2BZijTSwhAmfQird5D86SDm409aNDHDNUSvldvgSlm9uZS7dkmDRIdA8LIqsxp4YhnSc3vSFd8yrn7anAHpOusp9kdGnXKFCrh0lSuTTL2OwxkZgwpdqO0wY6pgGNcWCgd1v406yrazRwaGsld%2BKs4cHfLiwoOUl1DIWm4f8le4YL%2BSbEAtCi5manm9w7EcfN%2BBzYS%2B7QT3Ak9zrLNQDyNvgSWwFhZ6en8PpWyNlMcmVvpoZgBUvpObyy3mRnpfBQkDc%2Bw%2BPfCrsSKWeR02EL3Md6zUWtskG6e4EOu40neEeBXK8MbGfPR%2BmoCrlerkkOubiAk1gBTsyKj6eTHki9K4en&X-Amz-Signature=1084313050038ea2903ac9b2f54679a0544f43aa10bb72acc72a6f69c584a77d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664RO7PU5P%2F20260724%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260724T191022Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIFp3lKt4yMJnTSzAAJLFVlxWxGGds3Hw68FyyplxcTlHAiBG%2Fwu9FC9a9NsArv0QP%2B8VS%2FoqLheufwYcUFZvfzamaSr%2FAwgLEAAaDDYzNzQyMzE4MzgwNSIM%2Bc3wNhmhTbXoAQO7KtwDXP1C39%2BCvRSsGQm9r4amjvctDk8cksrcY0fcxsW9qiwZf8zCGD3FKqlm%2FsEVzc%2BQ39LB3IgIOQWcCihMiiUU1CSvXthmhF6dlAqcQLKyRuLwduFu9eJT%2BOMbJwdgDlNX0Shnx5oChfTd7TXrl0ByJ57fnajW7A2UtnqymkwiEeJnu4us8%2FFYssFTkPoKjP5nw0l3NA0DnhA8lMJ4V5ZcjR8cQm%2B%2BqauIoHY19o0X195heiyte33ucmuTIQcBsBOAWU0Tdvjsrv8Ij7O0qpR5aEfcU%2FNp3m%2B2AmFtKpwx0M5JTh3cgeSzAAXB5gK91dWoehtRNF6lC8jmFWO2KLEIckqqwJE%2Blp4fVFm5EtQJccyEDDSTQvR4xLtIOj6FlUnklBLwXerXKCS%2F5lCzYKOFwDuU3VkPwcFlDIJ%2BVhwVawIT6f6IhzQ4L3zvEV2x3BeP6EeNNVDel7LFEEcxeNVo26wwzuNf8h8LiGlzsVwESyAeq6x6oHnkqWfFv6Psi9fAeJUM9whHyEE%2B%2BZijTSwhAmfQird5D86SDm409aNDHDNUSvldvgSlm9uZS7dkmDRIdA8LIqsxp4YhnSc3vSFd8yrn7anAHpOusp9kdGnXKFCrh0lSuTTL2OwxkZgwpdqO0wY6pgGNcWCgd1v406yrazRwaGsld%2BKs4cHfLiwoOUl1DIWm4f8le4YL%2BSbEAtCi5manm9w7EcfN%2BBzYS%2B7QT3Ak9zrLNQDyNvgSWwFhZ6en8PpWyNlMcmVvpoZgBUvpObyy3mRnpfBQkDc%2Bw%2BPfCrsSKWeR02EL3Md6zUWtskG6e4EOu40neEeBXK8MbGfPR%2BmoCrlerkkOubiAk1gBTsyKj6eTHki9K4en&X-Amz-Signature=6b9805316d13878f3e99173cf063bb1c520765b7eb9ca82d03d8857cc2669358&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
