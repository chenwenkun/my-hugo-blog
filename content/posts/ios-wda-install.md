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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QTOK2ERX%2F20251004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251004T181303Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCJiDIZpWIzCqqzvKbasUjCzl%2FpQrq7dvD3csysKKp1ZwIhAL458Gx5iH22qN%2BRerXdkVpJe1gdGA5z110nX58erjFwKv8DCGIQABoMNjM3NDIzMTgzODA1IgyZou47nI%2BK%2BIKKimwq3AN%2F6Q597M6HJNiLmwhU5DwRiYq17%2FonHFVJ4NWHweRYLmLDFG%2BudsGHOhGld8MxFfOZ%2BaQwMsrYFgrqtDQ9qHRHe4CN2Tuv%2FPLI4GR2uVpe3l78QxCS74bhZLK37OBkU2dA66em1EVO5%2BXTzftTi6e7kALuAdTv5MSUVESkbVaRBLiBXD2wPnGIGxBG1%2FNZ2kflHD77Bkle%2BZT9jnlOW9jjP%2FpNGpPqCBenrI3%2FkIcVHw7K156qilZvGWZ92erSCOzy24SSrh%2FQTgkqvjnOW7S76eWiVH5gEXLjvbPdrjuMP01INralXXL%2FNHwSHv0BNcoCybuNCKdbHDIizzhkrnRu9kac7y5GDlMmZRVqD4U7DjdYbicyN%2BWI38TjNWEvVY%2Bh4zSLSxNjUHCuixMHAa%2BYGLdX01RLIkTvxTzbqSkL8EEzs5MpQd1XaiII0oI6GoolhjlyQfgc3OmREUko%2B2nGFKKoLdlKnsGHekcyheL7gLI64FlpbSjv7DhPdVtflOfb0VUZ47O1fpxduZpoAlvVw%2Fc9LUATmxm58R4SLbtrDYCY6I9f0a6yDGtp0L0dx0DpNh4BofL71Rvb5ci6RArO%2BEXXD%2BK0%2BfxBQ5LdzEPsV8EjpkqLnerB3H4frTDjooXHBjqkARqrwRD1x5oSUP81PZmdH2VWPUkHgGrIdQXllGvYyshsIpCrben2GZS3YaumGQ1cPCSeXb1hMZaspf%2BUiBrLkYENPa1543TltrYpnJFnEuBQCELH36SZtNDFgyKANAn8vlVzHDvBbngwqcXHAGdTxk7ayHT1uRUwUJ1eDsXMp4Dap%2BeHEs8KBL50i9RxQ%2FQecnLai%2FISEW680aZxcCx62FxR%2FFKy&X-Amz-Signature=1c1a9d090b9bc5ac83ca7378389d934d2ad29ce22a282d61f0cd7a33683e1e6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QTOK2ERX%2F20251004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251004T181303Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCJiDIZpWIzCqqzvKbasUjCzl%2FpQrq7dvD3csysKKp1ZwIhAL458Gx5iH22qN%2BRerXdkVpJe1gdGA5z110nX58erjFwKv8DCGIQABoMNjM3NDIzMTgzODA1IgyZou47nI%2BK%2BIKKimwq3AN%2F6Q597M6HJNiLmwhU5DwRiYq17%2FonHFVJ4NWHweRYLmLDFG%2BudsGHOhGld8MxFfOZ%2BaQwMsrYFgrqtDQ9qHRHe4CN2Tuv%2FPLI4GR2uVpe3l78QxCS74bhZLK37OBkU2dA66em1EVO5%2BXTzftTi6e7kALuAdTv5MSUVESkbVaRBLiBXD2wPnGIGxBG1%2FNZ2kflHD77Bkle%2BZT9jnlOW9jjP%2FpNGpPqCBenrI3%2FkIcVHw7K156qilZvGWZ92erSCOzy24SSrh%2FQTgkqvjnOW7S76eWiVH5gEXLjvbPdrjuMP01INralXXL%2FNHwSHv0BNcoCybuNCKdbHDIizzhkrnRu9kac7y5GDlMmZRVqD4U7DjdYbicyN%2BWI38TjNWEvVY%2Bh4zSLSxNjUHCuixMHAa%2BYGLdX01RLIkTvxTzbqSkL8EEzs5MpQd1XaiII0oI6GoolhjlyQfgc3OmREUko%2B2nGFKKoLdlKnsGHekcyheL7gLI64FlpbSjv7DhPdVtflOfb0VUZ47O1fpxduZpoAlvVw%2Fc9LUATmxm58R4SLbtrDYCY6I9f0a6yDGtp0L0dx0DpNh4BofL71Rvb5ci6RArO%2BEXXD%2BK0%2BfxBQ5LdzEPsV8EjpkqLnerB3H4frTDjooXHBjqkARqrwRD1x5oSUP81PZmdH2VWPUkHgGrIdQXllGvYyshsIpCrben2GZS3YaumGQ1cPCSeXb1hMZaspf%2BUiBrLkYENPa1543TltrYpnJFnEuBQCELH36SZtNDFgyKANAn8vlVzHDvBbngwqcXHAGdTxk7ayHT1uRUwUJ1eDsXMp4Dap%2BeHEs8KBL50i9RxQ%2FQecnLai%2FISEW680aZxcCx62FxR%2FFKy&X-Amz-Signature=21387c957a340f9df7f086f119aa8c1ea07f0bac2a8047f63fd7e1b3b55ccf95&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
