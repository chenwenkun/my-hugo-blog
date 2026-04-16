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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663EN6CPJP%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T012909Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHvzoxumdyJE22kkJK156iS77tVYwJVBSmzM8nSVJa6DAiEA8nNNqllXGeM9HTpagV9pwPez6IKMwS2LKOuiMdsFIJQqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEHr2euEceE54eB8%2FyrcAyWKVcDSWZAp6%2B59VkgRrMR9ZpVQBh2FBIBrlYmA7AO7j3HcpVE3jViRllAvB%2FBSzSgDRI%2Bigubl0Yp2xNi39QfS82T6XumkXGis3V5OLkojl3cjILbqnFxjKcCTKM5xLshnqJUoPeEbWU8AoQJhsrA%2BmVN2dovfF7hhyUvREUQhLj3xm7USugajH6Did30t4wP%2Bkm8YiGNI9GredNBiDYZicT5Oj3U66m0obdeeaBmX5giR7XMhjU%2BDEE4I2v1D8WkAiMTmGKsieE%2FHFpYoC%2BHku07HKwwJSuEk1%2Byfu8%2BWKhBMmCfSYnFRemcHd4FOXcE4nWMbsI94OXRy1%2BWgqT5zUgjubiXnN0wqmC%2BK9fVUYWlVwPTnIfNSh%2BUPo8fy6GFd9rYAACljfrM2HDKWfuc7Sx9gvtqZgbCbCww1NQLEsTG2wzV8EllKEMJq1UmYMDiVF1E%2Fy3wDVtb%2Bu1rLSen%2Btk3Zl2ebf95MtEdDYAXshkSKubxjocaqDbXyc8nrLdBqU2XFrCihSGZSsgV4uFe5PFRIWsCDEORZWqaJlnen47VLlBJ77OEnZCKD%2FA3YNJkWYwnM9F4EZRTARKhULW%2B1Rh%2FkaY2nNCyh99fatGzjezR%2F1%2FuE2veivpSPMJDagM8GOqUBvg%2BTwl%2FptN64pTqQFASc2XUnNaZHF7b9cb1R%2FuhJzkHaUPQi%2Bva7Eqfvz4lRWqdtI5uJIStdph%2FRyAkR9JBvgVs7zwEio%2BR%2Bw2V5JWV1l4qh%2BmYPsuEITm8hub3aOyQutLi2IEmhky0NEJcGRXXLBdX%2FgvwHQjUnDKIbKjAvmDUmtdD60Si6JVinYmtb2Ko%2FV7BLsbcy6%2BesdfV1pa7JZZD3x%2BQN&X-Amz-Signature=4d2214dffe80d48fd9f39f1be09f5208ce480d420e7bc749999e061124171906&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663EN6CPJP%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T012909Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHvzoxumdyJE22kkJK156iS77tVYwJVBSmzM8nSVJa6DAiEA8nNNqllXGeM9HTpagV9pwPez6IKMwS2LKOuiMdsFIJQqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEHr2euEceE54eB8%2FyrcAyWKVcDSWZAp6%2B59VkgRrMR9ZpVQBh2FBIBrlYmA7AO7j3HcpVE3jViRllAvB%2FBSzSgDRI%2Bigubl0Yp2xNi39QfS82T6XumkXGis3V5OLkojl3cjILbqnFxjKcCTKM5xLshnqJUoPeEbWU8AoQJhsrA%2BmVN2dovfF7hhyUvREUQhLj3xm7USugajH6Did30t4wP%2Bkm8YiGNI9GredNBiDYZicT5Oj3U66m0obdeeaBmX5giR7XMhjU%2BDEE4I2v1D8WkAiMTmGKsieE%2FHFpYoC%2BHku07HKwwJSuEk1%2Byfu8%2BWKhBMmCfSYnFRemcHd4FOXcE4nWMbsI94OXRy1%2BWgqT5zUgjubiXnN0wqmC%2BK9fVUYWlVwPTnIfNSh%2BUPo8fy6GFd9rYAACljfrM2HDKWfuc7Sx9gvtqZgbCbCww1NQLEsTG2wzV8EllKEMJq1UmYMDiVF1E%2Fy3wDVtb%2Bu1rLSen%2Btk3Zl2ebf95MtEdDYAXshkSKubxjocaqDbXyc8nrLdBqU2XFrCihSGZSsgV4uFe5PFRIWsCDEORZWqaJlnen47VLlBJ77OEnZCKD%2FA3YNJkWYwnM9F4EZRTARKhULW%2B1Rh%2FkaY2nNCyh99fatGzjezR%2F1%2FuE2veivpSPMJDagM8GOqUBvg%2BTwl%2FptN64pTqQFASc2XUnNaZHF7b9cb1R%2FuhJzkHaUPQi%2Bva7Eqfvz4lRWqdtI5uJIStdph%2FRyAkR9JBvgVs7zwEio%2BR%2Bw2V5JWV1l4qh%2BmYPsuEITm8hub3aOyQutLi2IEmhky0NEJcGRXXLBdX%2FgvwHQjUnDKIbKjAvmDUmtdD60Si6JVinYmtb2Ko%2FV7BLsbcy6%2BesdfV1pa7JZZD3x%2BQN&X-Amz-Signature=b6d0b840fe88980634afb9fea4b5dfa047e5570f43ba5e1a95818872968bfc02&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
