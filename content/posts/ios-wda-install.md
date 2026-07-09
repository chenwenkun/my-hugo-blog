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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQDDKZLC%2F20260709%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260709T142845Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCgOPu53Nyc1KV8AyhM23ZqB8d092xNiYlSyK8LBmXCegIgXrGsNx%2BqDdLfJd2N%2FGrnfE3mNvtrhrbnmgYwgIpngs4qiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD%2BqLC9TfMx3rHkcpSrcA05narGni0HkZhfWn25tEuwp%2BxjfyCOKRcNVKH3VHR1TbIfN%2FK9kTqm8OG2Yzc5aZob1hy9yYJF1XVsX6a%2Fxdjzodp%2FBx3Jv2WuJwmex%2FE9tO9aVe%2BUeU2P7H3e9LBjHe%2BDlEHy4OWiEtZbLNAScoDJdNU5oleriuCg1STEgHs3JteLoJrHuGefix4oPzrxgGtApv5yaJT3JHUA4tSJoBpsVIUBBavEgM4g%2BTtd9BMQSgJzDa0CEiwLNELjbejEeylwOst8J4vJarAISVQD%2B7trtt2otIFJchyXzADKL5SwoZXvLW8Ph08Y%2Bt32W%2F31wJAqaKPEwgmseDy6YPJiJlTdm7LEqvA6P0GWyAgDPFJ%2BJ1qaYhmEe%2ByWDsK9i%2FZg0%2BNs%2BPUIdbuWUX6Mx1FDoX1oAqQbNxxbUkgn1m%2ByRqSfIrtpDvDyZutnMuKfUXByXlz7gmk5l2zuES2iHAOhfNeEbmf3OxKKCWdKvE8mZoeSYBImi%2Bu1KT5xogADEjiWa8OiJVH2cjFQlTDCB%2F5C28KoXC9wi6oJOQEvTa1rp6K3b9%2BJvt0yUZc%2BQYOOQ02Gke1FR3I%2F%2BHuPwpf0VFmki7ZaC9SyMzKR3t3Cr2eWKzFejppsZ1m0U%2Bj3rMRUFMKa%2BvtIGOqUB08Zi7QrOCvkPxPn%2BRSMP%2BVG2egsgzoWye4uaI2EnAqJa1Z4Bdsd6XIAWjpWU9pvBzKrQnhpqLHLjp7yBhl6M6VE6zi%2F8Jd3e9HeUex%2B%2B2XFkIPpmaiM%2BfQkQIA9kzLKx1M4fwpEmzTXmqoH6VRW5fDtwACexwbUDlzTo7cwj%2F4YkFQ%2BkvoN1Zy34ioATxCubybH8re8M8nrweo0nL5HVBQrRQ9F5&X-Amz-Signature=dfae7ef5c82aebcdd15915de19e4fff2f384d2b5840c04c57f6fc7d1a8cf541f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VQDDKZLC%2F20260709%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260709T142845Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCgOPu53Nyc1KV8AyhM23ZqB8d092xNiYlSyK8LBmXCegIgXrGsNx%2BqDdLfJd2N%2FGrnfE3mNvtrhrbnmgYwgIpngs4qiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDD%2BqLC9TfMx3rHkcpSrcA05narGni0HkZhfWn25tEuwp%2BxjfyCOKRcNVKH3VHR1TbIfN%2FK9kTqm8OG2Yzc5aZob1hy9yYJF1XVsX6a%2Fxdjzodp%2FBx3Jv2WuJwmex%2FE9tO9aVe%2BUeU2P7H3e9LBjHe%2BDlEHy4OWiEtZbLNAScoDJdNU5oleriuCg1STEgHs3JteLoJrHuGefix4oPzrxgGtApv5yaJT3JHUA4tSJoBpsVIUBBavEgM4g%2BTtd9BMQSgJzDa0CEiwLNELjbejEeylwOst8J4vJarAISVQD%2B7trtt2otIFJchyXzADKL5SwoZXvLW8Ph08Y%2Bt32W%2F31wJAqaKPEwgmseDy6YPJiJlTdm7LEqvA6P0GWyAgDPFJ%2BJ1qaYhmEe%2ByWDsK9i%2FZg0%2BNs%2BPUIdbuWUX6Mx1FDoX1oAqQbNxxbUkgn1m%2ByRqSfIrtpDvDyZutnMuKfUXByXlz7gmk5l2zuES2iHAOhfNeEbmf3OxKKCWdKvE8mZoeSYBImi%2Bu1KT5xogADEjiWa8OiJVH2cjFQlTDCB%2F5C28KoXC9wi6oJOQEvTa1rp6K3b9%2BJvt0yUZc%2BQYOOQ02Gke1FR3I%2F%2BHuPwpf0VFmki7ZaC9SyMzKR3t3Cr2eWKzFejppsZ1m0U%2Bj3rMRUFMKa%2BvtIGOqUB08Zi7QrOCvkPxPn%2BRSMP%2BVG2egsgzoWye4uaI2EnAqJa1Z4Bdsd6XIAWjpWU9pvBzKrQnhpqLHLjp7yBhl6M6VE6zi%2F8Jd3e9HeUex%2B%2B2XFkIPpmaiM%2BfQkQIA9kzLKx1M4fwpEmzTXmqoH6VRW5fDtwACexwbUDlzTo7cwj%2F4YkFQ%2BkvoN1Zy34ioATxCubybH8re8M8nrweo0nL5HVBQrRQ9F5&X-Amz-Signature=93aecffe7cc441d3e71e7f1ac45c90f2a90cbe1f291e2ac68742161bb61697d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
