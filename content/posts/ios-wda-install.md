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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TLN6UDUG%2F20260217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260217T184209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICg1H4snzY8I%2FNA1DEbG66hyeLT9Llw27uMH%2BzzppztOAiBwNNuRiKaEBHbrYqrMgiramf6WIkwzS62s39sfu495Zyr%2FAwhTEAAaDDYzNzQyMzE4MzgwNSIMqCulXiM64mCEfBnZKtwDwdApEZNdyzzDs9AZeFITzBJWMcq8MnOAbEfoEjbuyYkLbnQVozKTsjg%2BamK93FlapX%2B3N2kpJ2tIbYwgnLVOxL7ovr89rIx0BurLuCXntu5lWdoLZG8fDIERxJXO1Q2fdxnfsvRRMxKgSD7tDpmxjT1nAmQRNS3AVWQlB4hUMAGoqbNwv5MbVJk1C4YRMAbNXK6mhGjW9J8Ni1e9KsGJ0Ov1e9%2BVnMUkCVTuK1xohUGBIN9XefL7lDRye5KX79wZ1zi1w7WPDNnqQ9yP9pWYnKQZRurLyfdenaNtvHVKiV%2BsYzGIooqZRv%2FrJGDZ%2BHAMYbzz6WRHwqVEnBhCALUV5BN52rEyFWxoqCx7KgiU%2FEMQNgQuzc3%2F1kFZrt%2BQsge%2Fr20OgNKfv%2BNHSRjel4ytZD151JUJWRA828MYzk41cNPpGrY5bmiy2NN3G1km1PyUTCTzvBPmZTXfs6txbfnlvAT%2FQM9zIgMLXgzP6huQl6dEFsokgTF1j7GKzLaN2AIwy3Xw3ZKk1dGFVDzDXbChxJbEnMeYP4t93Voj0saWHmLHq0zxw4e8LXI6AXuDGEdT1o3M%2FdOtXUA2UEqvouhCjMQN3Z4iPZNWjzPgp4It3TuNKmjdXDmhgbNNlUMwytjSzAY6pgFw5e0Iyz1zvN2KnjzWlJD1l48KqRRrblqskV6%2BECaN5zO1c%2FS95W6Mt2EWPcafcofT7r3x0pOJU4b0NheaSfAjbRQiDaro1S5ip01Jpb2i0CL4mbgq7F%2BOTD8El0drIPeLeqiIRriQxFLJlyLWR%2ByRni3z6KAaa%2Frd2BRezFFoPvOmQ%2BzMH9t5BqkyxxBK94H3T6Eu99rEUX8OsdJ94p4l%2FnikpghC&X-Amz-Signature=c83d7ca248069e4faee4e6cda2e7dec855b67dadf1bfb75df07130341defcb94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TLN6UDUG%2F20260217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260217T184209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCICg1H4snzY8I%2FNA1DEbG66hyeLT9Llw27uMH%2BzzppztOAiBwNNuRiKaEBHbrYqrMgiramf6WIkwzS62s39sfu495Zyr%2FAwhTEAAaDDYzNzQyMzE4MzgwNSIMqCulXiM64mCEfBnZKtwDwdApEZNdyzzDs9AZeFITzBJWMcq8MnOAbEfoEjbuyYkLbnQVozKTsjg%2BamK93FlapX%2B3N2kpJ2tIbYwgnLVOxL7ovr89rIx0BurLuCXntu5lWdoLZG8fDIERxJXO1Q2fdxnfsvRRMxKgSD7tDpmxjT1nAmQRNS3AVWQlB4hUMAGoqbNwv5MbVJk1C4YRMAbNXK6mhGjW9J8Ni1e9KsGJ0Ov1e9%2BVnMUkCVTuK1xohUGBIN9XefL7lDRye5KX79wZ1zi1w7WPDNnqQ9yP9pWYnKQZRurLyfdenaNtvHVKiV%2BsYzGIooqZRv%2FrJGDZ%2BHAMYbzz6WRHwqVEnBhCALUV5BN52rEyFWxoqCx7KgiU%2FEMQNgQuzc3%2F1kFZrt%2BQsge%2Fr20OgNKfv%2BNHSRjel4ytZD151JUJWRA828MYzk41cNPpGrY5bmiy2NN3G1km1PyUTCTzvBPmZTXfs6txbfnlvAT%2FQM9zIgMLXgzP6huQl6dEFsokgTF1j7GKzLaN2AIwy3Xw3ZKk1dGFVDzDXbChxJbEnMeYP4t93Voj0saWHmLHq0zxw4e8LXI6AXuDGEdT1o3M%2FdOtXUA2UEqvouhCjMQN3Z4iPZNWjzPgp4It3TuNKmjdXDmhgbNNlUMwytjSzAY6pgFw5e0Iyz1zvN2KnjzWlJD1l48KqRRrblqskV6%2BECaN5zO1c%2FS95W6Mt2EWPcafcofT7r3x0pOJU4b0NheaSfAjbRQiDaro1S5ip01Jpb2i0CL4mbgq7F%2BOTD8El0drIPeLeqiIRriQxFLJlyLWR%2ByRni3z6KAaa%2Frd2BRezFFoPvOmQ%2BzMH9t5BqkyxxBK94H3T6Eu99rEUX8OsdJ94p4l%2FnikpghC&X-Amz-Signature=d5250c1a5ff41cc05ab1ef5c4ac3dfbab8a26b67e2f0747c487968623a8fbab6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
