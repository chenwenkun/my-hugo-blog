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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665FYXOUTG%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T082011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBqwmy%2Fl51C5Ew6TBW%2Fi45LVKWGsp0QE40y9xM5n2icSAiEAzWJNjhD8wZ5E78%2BebHC0I4k%2BVijwbY2em5%2BLwXF3RVIq%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDDHAPey6SCbNNxgfDCrcA6qh632w1HOlUXlPfV1WQ2kmPC%2BkMPtcFPKRqIaRi%2FPIbt%2Bw%2BJfog%2BJr6VuImbq7HDf6OBKmXseV4%2Fp%2Fes5SYga7x6TUjChMtg9jd152Hedr%2BVzimP1R1Y9ssXzfID71f60niNAXcJN35QfqmvSkYvufT3qGM0FVHD1vtJ4J8aRopnda%2F%2FAPRDEXyb5H0DY%2FwycIUINcmLqwpUhRvYXDObeZCwuza0MRID7Z0mZ06js8OrQV0yiYdvgkda%2FrcK2K%2Bn9C5vFcFp4Gf5k%2BxaPtY1M2VldbPamQBnNfBzpEON4V1YjbnBMexMLNLxlLrZi8uF0OZwuHlaTbwRdqWwuS6z5jvW1PoDGi4wPU%2FPXOjDEvXeKu8b3%2B7ugWkwF27eXTkq4EP5YAo3%2Bp5m0J7jRReeuA2RRKYm1yErUI4eN9MA55GydNtGR%2BFAAfghwOi4z8R%2B6IhAK0x3KGv4C5ddvVLloZ10AgvbWbZCnlVD9ToBRLi3g13Z7buQNPULBjEoNOshx9W6CBKTe5PAjTlpmd3J0r5epsNalEHExDZKhopQuJaFTFD5Y3wHVNiMVC674RuRURfVeDhA%2FosAUGDxMJySyWOMezw8cAM4gnOnjKNJOSe7n3FA0KPehx0k76MMmv08YGOqUBOFbLBnRmH6dcsWHAunnyJ7PIF%2B3yFFUQ7%2FVoAsntYXCFBS57s8RvAJx4CXR49QQMwObxWowK3bEFAHpMteqOia5elQEBn2nrlF9CskXI%2B%2BoamdhfXPCTnb8say1pnZs25d5Lf%2F9oyaIaeOmSb7DTaFLWd5ZJj7zcnDUBTJSV%2FlTJvYQuqC%2FEz9vm8C%2FjKZrcx08pSnuJxOHZL2I5EEjIdwcNgG3A&X-Amz-Signature=15d70c52898fd75a4a9183bed9c3905f1b170d83c0068362a10442e78278c9bc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665FYXOUTG%2F20250925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250925T082011Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBqwmy%2Fl51C5Ew6TBW%2Fi45LVKWGsp0QE40y9xM5n2icSAiEAzWJNjhD8wZ5E78%2BebHC0I4k%2BVijwbY2em5%2BLwXF3RVIq%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDDHAPey6SCbNNxgfDCrcA6qh632w1HOlUXlPfV1WQ2kmPC%2BkMPtcFPKRqIaRi%2FPIbt%2Bw%2BJfog%2BJr6VuImbq7HDf6OBKmXseV4%2Fp%2Fes5SYga7x6TUjChMtg9jd152Hedr%2BVzimP1R1Y9ssXzfID71f60niNAXcJN35QfqmvSkYvufT3qGM0FVHD1vtJ4J8aRopnda%2F%2FAPRDEXyb5H0DY%2FwycIUINcmLqwpUhRvYXDObeZCwuza0MRID7Z0mZ06js8OrQV0yiYdvgkda%2FrcK2K%2Bn9C5vFcFp4Gf5k%2BxaPtY1M2VldbPamQBnNfBzpEON4V1YjbnBMexMLNLxlLrZi8uF0OZwuHlaTbwRdqWwuS6z5jvW1PoDGi4wPU%2FPXOjDEvXeKu8b3%2B7ugWkwF27eXTkq4EP5YAo3%2Bp5m0J7jRReeuA2RRKYm1yErUI4eN9MA55GydNtGR%2BFAAfghwOi4z8R%2B6IhAK0x3KGv4C5ddvVLloZ10AgvbWbZCnlVD9ToBRLi3g13Z7buQNPULBjEoNOshx9W6CBKTe5PAjTlpmd3J0r5epsNalEHExDZKhopQuJaFTFD5Y3wHVNiMVC674RuRURfVeDhA%2FosAUGDxMJySyWOMezw8cAM4gnOnjKNJOSe7n3FA0KPehx0k76MMmv08YGOqUBOFbLBnRmH6dcsWHAunnyJ7PIF%2B3yFFUQ7%2FVoAsntYXCFBS57s8RvAJx4CXR49QQMwObxWowK3bEFAHpMteqOia5elQEBn2nrlF9CskXI%2B%2BoamdhfXPCTnb8say1pnZs25d5Lf%2F9oyaIaeOmSb7DTaFLWd5ZJj7zcnDUBTJSV%2FlTJvYQuqC%2FEz9vm8C%2FjKZrcx08pSnuJxOHZL2I5EEjIdwcNgG3A&X-Amz-Signature=eb0db01bb5a1ad2c5b8ce7d32b857def315f4ef8e2360de050433b50e9039f86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
