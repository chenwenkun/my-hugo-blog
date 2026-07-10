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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QLNOTNZW%2F20260710%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260710T135626Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCDUYZPn6NAZk9CpbdnhRdflI13EGOAqU3EKwx69p%2FYgwIhAN271sv6mBRVndf0%2BniCJruyXUWmS7JjY6UMQoYB%2FGgWKogECLb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwqDP%2Fnv4tByRyut%2BIq3AOlRtWN0sc4HAoANbV5DqdizCcgZgpg1HTo7kJY2tThDythmbteXIymKD0z58VscUA6yPj9niCrR%2BP5Vh3vyZ8FYtyykKwFAaXDGpHQtpj5LJD0sWimXEhzYSX%2Fu7FnxKZOMUjQ3nnT13EEvUGFmTOKS%2F9%2BqEfDCrTkyfKFxtXo%2BrFcNV9J1fs6K1%2Fe1isMym8Ys9c%2Bp4lXNR4302ixl%2BqEcWwsjKEvRG0uj%2FoMA%2FxJ35Lc%2BcdM7BkxwYAO6ui967JzbZAyCbjRQ6iPkq3UxS20UdoJy5WREoIQLjy7mzPAadrdGj0ZxMpSmhf9MZsAVEiARGMkvvYq%2B0o1KSI6%2FrEYwefgzcTEEt0%2BYPG63%2FChYlr0SsBvSw3Z5MPLjkeHH40pUzRc8ih%2FqxQNteQZidKsGsook05iAV2OO%2FkFKpcgv0Ga7xcyK8WDe9g3Bkox%2FdngvwAIKgyuLYzGSRoYCr6A%2FZ9K2Ox%2BF5yic61cnG7e31qYe25NqlmihK1my1n6lVicPpd%2Ffv7mjz%2BaLHunPU9UvyQykZCGjBbO7mhwhyCE%2FTGR6lobJ3V1cMz01BXjcCgrOmAKVGygPQQ0%2F4Rhx9nHxkOaeWoJ2hmKPqqhb53ZRs1LzzeQm%2FWjz1meJTDP1MPSBjqkAQn5ktNx8uvY%2BZMUhL%2FXXTOrKuKlxv2tBf%2BCczzQzKkoM0n9YdtWsypE1rdHypiPXHLB8tNrqMJ91qsjgYnMyUtQQ9pBcX97pWX%2BqGbQGwRplGiuMzhqP9YRjfj%2Fbd1sfwoAaGze%2BafAZLyywHOv86bRs%2BYNv0z2POA9rW3b%2FgWB5BKurK201XJkXyfYnxdZd7a4Q2Vgtd2bvvw%2Fj%2BANsb5%2FtlwC&X-Amz-Signature=c69309098e38a8a545dccf27f130b6bedc0fb2f0562e70d5f63f87fc14c3a574&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QLNOTNZW%2F20260710%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260710T135626Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCDUYZPn6NAZk9CpbdnhRdflI13EGOAqU3EKwx69p%2FYgwIhAN271sv6mBRVndf0%2BniCJruyXUWmS7JjY6UMQoYB%2FGgWKogECLb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwqDP%2Fnv4tByRyut%2BIq3AOlRtWN0sc4HAoANbV5DqdizCcgZgpg1HTo7kJY2tThDythmbteXIymKD0z58VscUA6yPj9niCrR%2BP5Vh3vyZ8FYtyykKwFAaXDGpHQtpj5LJD0sWimXEhzYSX%2Fu7FnxKZOMUjQ3nnT13EEvUGFmTOKS%2F9%2BqEfDCrTkyfKFxtXo%2BrFcNV9J1fs6K1%2Fe1isMym8Ys9c%2Bp4lXNR4302ixl%2BqEcWwsjKEvRG0uj%2FoMA%2FxJ35Lc%2BcdM7BkxwYAO6ui967JzbZAyCbjRQ6iPkq3UxS20UdoJy5WREoIQLjy7mzPAadrdGj0ZxMpSmhf9MZsAVEiARGMkvvYq%2B0o1KSI6%2FrEYwefgzcTEEt0%2BYPG63%2FChYlr0SsBvSw3Z5MPLjkeHH40pUzRc8ih%2FqxQNteQZidKsGsook05iAV2OO%2FkFKpcgv0Ga7xcyK8WDe9g3Bkox%2FdngvwAIKgyuLYzGSRoYCr6A%2FZ9K2Ox%2BF5yic61cnG7e31qYe25NqlmihK1my1n6lVicPpd%2Ffv7mjz%2BaLHunPU9UvyQykZCGjBbO7mhwhyCE%2FTGR6lobJ3V1cMz01BXjcCgrOmAKVGygPQQ0%2F4Rhx9nHxkOaeWoJ2hmKPqqhb53ZRs1LzzeQm%2FWjz1meJTDP1MPSBjqkAQn5ktNx8uvY%2BZMUhL%2FXXTOrKuKlxv2tBf%2BCczzQzKkoM0n9YdtWsypE1rdHypiPXHLB8tNrqMJ91qsjgYnMyUtQQ9pBcX97pWX%2BqGbQGwRplGiuMzhqP9YRjfj%2Fbd1sfwoAaGze%2BafAZLyywHOv86bRs%2BYNv0z2POA9rW3b%2FgWB5BKurK201XJkXyfYnxdZd7a4Q2Vgtd2bvvw%2Fj%2BANsb5%2FtlwC&X-Amz-Signature=9b0c2d23f71621deb0fff09f08e6d649062d1463cdd34c348f2a956c5b45d78b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
