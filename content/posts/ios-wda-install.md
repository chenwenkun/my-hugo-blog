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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QAN6JSKD%2F20260517%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260517T080900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDIJ%2BWKDKA4ACtpk6oM%2Fu40oFoi3aeAzi%2FBcm%2FYGQGu%2FAIgZuuxmXxng9Kq82Ez4nWSRvrDTF5bE6glfcCoaPwNeDkqiAQIof%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGDG7v9UcHqbcr%2B4IyrcA9t7SognA9m5oHQ04McypwTzDjnIEPhlKbI03FgqygMxWjdXw2cjRMoX0L6GvngELzysLQiNbxS2tex4aYoE0lsRCcNMPIIUeMl2UugValQ6YrUI%2FQXjpKxtWD8P69MZAv3r%2FmDdEz%2BejchPfehNvCiyCKrKEPb7an03R9yL%2BcGc%2BOxmCRdyzbJ26w3apMPXu6GbbtMSrXdw%2Fbmev%2BgdYn%2ByYvMyviUPuaiYQBuVEbM96%2BC%2FdnehFadqSeKp%2BUKNZ9PPEEICdX6qJK8V%2FUJeY0%2FzgVatNp2pR2eTVTtAUDVtVM3NR9It%2FBR87zQijLR4j5Y9xShT6Bv91alKN0YNdrG41BP0zKDzySF8CayJE%2F2U7zL1aJ1r%2BNVtjk3ej0tT%2FvXjU5zE3zddHgQ6IrB7vH1h5E%2BPklodUnbU9HekNL6FUttt0RA8k0vvuHPsa87EOi0YUkoxFloKJnWnkKTxLBXUFw7QrlswRgLWX02q8SrfkWKFqJ9vLwCmPbZKV%2BR0hHX6cc4jbH1LIZOLy5D39mWqjCFp%2F8SUlE2ieXhEZz9ffo4A2hM2XO%2FDIQ1SPxKL3iNjz%2F6ReKIkC9C%2BeVX2E8qrCe7%2BqRVHPw8euatza%2Bjo5n5WKBcr23%2FCVs7GMOLepdAGOqUB%2B7ua5rYck662%2BFuCLrQQh%2BpGb%2BFu27fLJHGIHIFzlxwkpv6Tf2%2BRTgYdgRXz8FpgBGlgJgEVAkzwGCMyExmbDRvPiJ2VCVdat6ievqFtabZ%2Fuz8p%2BKyqj8AQzc48Hr9ms0nB2rMmDhAZWGtmMeqTm5qcHtXtZ8O0y5Ljoe0hHSP4b%2FoOu%2BnEMnYLKe7Nr9t8Um4KRbVdmYqtOvQz5Q5Eb8uaTwC7&X-Amz-Signature=9dd09719cc30a92670c8ca57ba9b76c52e4927df47694266444b85d529e15cd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QAN6JSKD%2F20260517%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260517T080900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDIJ%2BWKDKA4ACtpk6oM%2Fu40oFoi3aeAzi%2FBcm%2FYGQGu%2FAIgZuuxmXxng9Kq82Ez4nWSRvrDTF5bE6glfcCoaPwNeDkqiAQIof%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGDG7v9UcHqbcr%2B4IyrcA9t7SognA9m5oHQ04McypwTzDjnIEPhlKbI03FgqygMxWjdXw2cjRMoX0L6GvngELzysLQiNbxS2tex4aYoE0lsRCcNMPIIUeMl2UugValQ6YrUI%2FQXjpKxtWD8P69MZAv3r%2FmDdEz%2BejchPfehNvCiyCKrKEPb7an03R9yL%2BcGc%2BOxmCRdyzbJ26w3apMPXu6GbbtMSrXdw%2Fbmev%2BgdYn%2ByYvMyviUPuaiYQBuVEbM96%2BC%2FdnehFadqSeKp%2BUKNZ9PPEEICdX6qJK8V%2FUJeY0%2FzgVatNp2pR2eTVTtAUDVtVM3NR9It%2FBR87zQijLR4j5Y9xShT6Bv91alKN0YNdrG41BP0zKDzySF8CayJE%2F2U7zL1aJ1r%2BNVtjk3ej0tT%2FvXjU5zE3zddHgQ6IrB7vH1h5E%2BPklodUnbU9HekNL6FUttt0RA8k0vvuHPsa87EOi0YUkoxFloKJnWnkKTxLBXUFw7QrlswRgLWX02q8SrfkWKFqJ9vLwCmPbZKV%2BR0hHX6cc4jbH1LIZOLy5D39mWqjCFp%2F8SUlE2ieXhEZz9ffo4A2hM2XO%2FDIQ1SPxKL3iNjz%2F6ReKIkC9C%2BeVX2E8qrCe7%2BqRVHPw8euatza%2Bjo5n5WKBcr23%2FCVs7GMOLepdAGOqUB%2B7ua5rYck662%2BFuCLrQQh%2BpGb%2BFu27fLJHGIHIFzlxwkpv6Tf2%2BRTgYdgRXz8FpgBGlgJgEVAkzwGCMyExmbDRvPiJ2VCVdat6ievqFtabZ%2Fuz8p%2BKyqj8AQzc48Hr9ms0nB2rMmDhAZWGtmMeqTm5qcHtXtZ8O0y5Ljoe0hHSP4b%2FoOu%2BnEMnYLKe7Nr9t8Um4KRbVdmYqtOvQz5Q5Eb8uaTwC7&X-Amz-Signature=8c7603f7707f2dd5f2cf2dcd69f518fe4857f930a52db67c42e22051f3f15123&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
