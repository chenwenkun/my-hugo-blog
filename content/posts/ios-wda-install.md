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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZIBTVM7%2F20251206%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251206T122009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCve%2FQMt2yTqP9%2F%2FvLA89Fd2jqJvT9VXN9D9KmRXG%2BfKwIhAO9VsccRmZeIfxgmccTvEaU2dq2GyQRiXBIs4km4itd9Kv8DCHQQABoMNjM3NDIzMTgzODA1IgyvHLtsrkS7TcpmlbUq3APnHRP%2FmKX5w09SspIC3n5q879qFMv%2BPKb%2B6a%2BEO5JLPZ4B1homC%2FJbtBuDsrSWWL0jvkucDnwobISt3ScUu1oOtvE1Y2dbkZaZM8e9VUhKp8Xql1yIgDOTRhLy31LeHuXDUMGkQ6P1953DvJs3Mp8E5ep6QKtDOU%2FJHn8K9QCcTPSIV2tTU%2BEG0EN1A%2Fmj%2FIecZkHG2%2FYf1KL0YF0UsWWj%2BI%2FbkeE64o%2BKT5RR1idtEvGYf%2B7UffORHHC%2F%2BCP4O1kRSwQcSHkz5ClpSYC6vQe%2FunKS6rjXyGHi53KPHsxKXCgefO%2FxITPPenLfUMw7d0aYEQzoP0hkmZWHjxMPJDN3mq6BB4UdQqlHbp7FwbelQlocP5%2FhOGtun%2BHCddRBW7FO69kydJeXfyC5TzY3qXFEdeGuPzp3WsJmm3PByPFr2c46zC3La9tRjMpJmnP8vYIIQEDGTLXdKI4UllNfocHB75aogkG3UR4nJC%2Fudd4hVJk5cWkTxUVlkUPN42WT%2F4qSmIIQUOXRYWJtYc1w0jnbozhHZFNHZNh1px8%2FYcQ1h6ge7L6n2eAwXny9ffgdOpRspW8XMbzbTelPxqMhwggLEOBESzduAWDBun%2B04R1XAJqQoR7ATSZs1rpPiDDbptDJBjqkAeAAHdvAdPi8qQoM%2FxTNHX%2BAae93Eu7di8NxJFSVbGTf3DKli4yi3AstgJnWhWzF57IIxzGzJPT3%2BjCOj5hNOzEr7tuJgh87dKyBzmssRvW%2F%2BW7HENd%2BaOX4dHEAkAKLy6Tn%2FPk76n6jLYU3WV3qZBgQdGKXiIPo%2BZ5SrlL7f%2FtKEi9l3otra7OMdb9CQQHPOdnTjgRzbI3q%2FBfihXNywbDFsw0h&X-Amz-Signature=80b7fbf8b1798287f4a9bf2664e0a755302c0cff51fa416beda2c32d51f69a67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZIBTVM7%2F20251206%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251206T122009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCve%2FQMt2yTqP9%2F%2FvLA89Fd2jqJvT9VXN9D9KmRXG%2BfKwIhAO9VsccRmZeIfxgmccTvEaU2dq2GyQRiXBIs4km4itd9Kv8DCHQQABoMNjM3NDIzMTgzODA1IgyvHLtsrkS7TcpmlbUq3APnHRP%2FmKX5w09SspIC3n5q879qFMv%2BPKb%2B6a%2BEO5JLPZ4B1homC%2FJbtBuDsrSWWL0jvkucDnwobISt3ScUu1oOtvE1Y2dbkZaZM8e9VUhKp8Xql1yIgDOTRhLy31LeHuXDUMGkQ6P1953DvJs3Mp8E5ep6QKtDOU%2FJHn8K9QCcTPSIV2tTU%2BEG0EN1A%2Fmj%2FIecZkHG2%2FYf1KL0YF0UsWWj%2BI%2FbkeE64o%2BKT5RR1idtEvGYf%2B7UffORHHC%2F%2BCP4O1kRSwQcSHkz5ClpSYC6vQe%2FunKS6rjXyGHi53KPHsxKXCgefO%2FxITPPenLfUMw7d0aYEQzoP0hkmZWHjxMPJDN3mq6BB4UdQqlHbp7FwbelQlocP5%2FhOGtun%2BHCddRBW7FO69kydJeXfyC5TzY3qXFEdeGuPzp3WsJmm3PByPFr2c46zC3La9tRjMpJmnP8vYIIQEDGTLXdKI4UllNfocHB75aogkG3UR4nJC%2Fudd4hVJk5cWkTxUVlkUPN42WT%2F4qSmIIQUOXRYWJtYc1w0jnbozhHZFNHZNh1px8%2FYcQ1h6ge7L6n2eAwXny9ffgdOpRspW8XMbzbTelPxqMhwggLEOBESzduAWDBun%2B04R1XAJqQoR7ATSZs1rpPiDDbptDJBjqkAeAAHdvAdPi8qQoM%2FxTNHX%2BAae93Eu7di8NxJFSVbGTf3DKli4yi3AstgJnWhWzF57IIxzGzJPT3%2BjCOj5hNOzEr7tuJgh87dKyBzmssRvW%2F%2BW7HENd%2BaOX4dHEAkAKLy6Tn%2FPk76n6jLYU3WV3qZBgQdGKXiIPo%2BZ5SrlL7f%2FtKEi9l3otra7OMdb9CQQHPOdnTjgRzbI3q%2FBfihXNywbDFsw0h&X-Amz-Signature=b7421f4714d2b93acadc73548ce000b96a88e39d130ec4b14ebb7d79878ea571&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
