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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDMVT774%2F20260216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260216T182936Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJIMEYCIQDSq%2FVDQTEC4KVJ6CaPEOqJ0mFnn3c5CaTmVspVCIk%2BuQIhAIVsm4hPbT%2Fd%2BhJtOjXowxOPod5Z1frSPehALmz1gR0mKv8DCDsQABoMNjM3NDIzMTgzODA1IgysKKglt1jxXhXBC%2BMq3AP90l6AvwGp7I3L5lkbAmVRkPX6aAcQbXIDk3irE%2FUp8RyBsoMD2UF4dDJ9doEzN%2BCRcsON1cuHMiLOMH3liKzKNNc%2BMUvY5zIaPFPiEu2Gir7HHdFF9wipZI9Yb14uLrkiiXOdmzFKSZLkbF1RgOg%2Btl%2FrTihYLa2UrTh0bWZHdUE4fDHwNmrd3JTzXUQl74OQHmoZoaQe4yOUKmLBlj98T8vDqkho1x%2FOIn7PnMLZHQQINevr6lEZfVANyZK8QfFS4sJs9EJIInDVzQ%2FfbvC32TUKo9tanAuXdeuFX8OS%2Bq3AcNPGF34FVbLLOispXQTp%2B42lh0%2Blo4fOEQ4DCPKTqLIHE%2FTE%2FWP62Jp8Z7xnPE53UvEMaqTfG4yTz2C%2FOtv%2FpBivd6s3TiMWFz3hzXQpuE7KKsqukvlsZKfWJEJxXt8FirvQsiMBtPqmBM5WHkcYLWVpvvpQvZw9kxoVd7cUg%2FcrIDJZM%2FNPNh2SQ5uqtgd2%2FWhwb79Z9sOO8c3SQ%2FYhHTt3NIYLkjvqI%2FW%2BCdHxcz%2FZAJII6aPHQSl2L6xze55I2UJKKXJSL2t1cP0xVSVHK50fSta033NUxHSAsIe2GNW7GFS4u1vohPFmm4qLHTSHKkimfm6qE4soqDC6rM3MBjqkAQqTCxbFM9yBP58syht1841g%2B96Dp9A1%2FzWU3EyyxYPBSusFbgPvWnW8XZEmkuje%2BTe%2B5idGVVumMO5hrf96HEJoh1s3yCSpbvdjh6rvsu4teQJLGEsaW0HdlGZ%2Fh0ptBUGFa2%2Fwo5N3QfiI1VTtVfE8ujH5A%2BVkqpOdIvHdgP%2BqaRIDUPyOmyHoV1GoL7hSBuyHXNGvWR1D88FiDaKgejHtEcDC&X-Amz-Signature=bdfb31bcf519a0d576645ac6c9caa9896f3ecd080e45e60315344c7d0ecd8b82&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDMVT774%2F20260216%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260216T182936Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJIMEYCIQDSq%2FVDQTEC4KVJ6CaPEOqJ0mFnn3c5CaTmVspVCIk%2BuQIhAIVsm4hPbT%2Fd%2BhJtOjXowxOPod5Z1frSPehALmz1gR0mKv8DCDsQABoMNjM3NDIzMTgzODA1IgysKKglt1jxXhXBC%2BMq3AP90l6AvwGp7I3L5lkbAmVRkPX6aAcQbXIDk3irE%2FUp8RyBsoMD2UF4dDJ9doEzN%2BCRcsON1cuHMiLOMH3liKzKNNc%2BMUvY5zIaPFPiEu2Gir7HHdFF9wipZI9Yb14uLrkiiXOdmzFKSZLkbF1RgOg%2Btl%2FrTihYLa2UrTh0bWZHdUE4fDHwNmrd3JTzXUQl74OQHmoZoaQe4yOUKmLBlj98T8vDqkho1x%2FOIn7PnMLZHQQINevr6lEZfVANyZK8QfFS4sJs9EJIInDVzQ%2FfbvC32TUKo9tanAuXdeuFX8OS%2Bq3AcNPGF34FVbLLOispXQTp%2B42lh0%2Blo4fOEQ4DCPKTqLIHE%2FTE%2FWP62Jp8Z7xnPE53UvEMaqTfG4yTz2C%2FOtv%2FpBivd6s3TiMWFz3hzXQpuE7KKsqukvlsZKfWJEJxXt8FirvQsiMBtPqmBM5WHkcYLWVpvvpQvZw9kxoVd7cUg%2FcrIDJZM%2FNPNh2SQ5uqtgd2%2FWhwb79Z9sOO8c3SQ%2FYhHTt3NIYLkjvqI%2FW%2BCdHxcz%2FZAJII6aPHQSl2L6xze55I2UJKKXJSL2t1cP0xVSVHK50fSta033NUxHSAsIe2GNW7GFS4u1vohPFmm4qLHTSHKkimfm6qE4soqDC6rM3MBjqkAQqTCxbFM9yBP58syht1841g%2B96Dp9A1%2FzWU3EyyxYPBSusFbgPvWnW8XZEmkuje%2BTe%2B5idGVVumMO5hrf96HEJoh1s3yCSpbvdjh6rvsu4teQJLGEsaW0HdlGZ%2Fh0ptBUGFa2%2Fwo5N3QfiI1VTtVfE8ujH5A%2BVkqpOdIvHdgP%2BqaRIDUPyOmyHoV1GoL7hSBuyHXNGvWR1D88FiDaKgejHtEcDC&X-Amz-Signature=05aac16c8dd4067d045b65f015cdb1ef0e3bf621d3516575ab7e96f477291e1f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
