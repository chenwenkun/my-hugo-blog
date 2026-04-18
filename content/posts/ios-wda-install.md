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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HAINTN5%2F20260418%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260418T065544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB8aCXVzLXdlc3QtMiJGMEQCIBy8Ol3wXGEODEsiQD2Zn9MjpZIsncB%2F%2FkFv22TlAqsJAiBezOeGIh1r1qwD22h7ZMVd6yBrEDN0dlFnQLKdr%2FVWZiqIBAjo%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSapqCkA8o2WBNjxgKtwD0rhWLlI%2Bn%2BhfjeGRP6a57yRjoa7QXc4x54gBYjflkoibAR1NeJCcw8z6vGgA3u1OsBqXXMzSHbeotJVe9WfKO6gLpHtQ00ul5DMJLGV6txPYZO6iCTunLXBzPjii6sDuGVC7IjlIBdpXM6xC2IprCCvF9X0jJPG13ZopGFydevLxG%2F%2FCpqZ7bqyqopXdPLAjQ%2FJwkq9Zwl0XDRJ%2FXhuxGD91b87ZB3Xp734IYQUWECklYINKnfC9EPreNTsssYNIPsHgv7ys2c5NE3LAVsCbo6UhUKLaEBztgjI7BjMOzW0ca4pjYt5Z2qXOKJmPvsIZe%2Bq%2FbFoxtsCpfwZCBOMEEjSVoq805Ub8vVc1Pv%2F6Kx%2FPsL6dWs5cksW2MZ1KQSISPzh%2FCxXsxg7f7TIrByw9pB0Dtzt9e2uvEcJcQZJGPWGvDIOkRd1yWrjdTKfGXac7%2F4hsvNQMFl%2B0Y4m0Latcgq6qI7NRpFuZ6E0jqXiFMhOKJSb%2FRMfHo4EzjnlKiDySayNx9UOcO5hFC7X7pBNYRjR7aLwoCkwKnxxh9bLPS%2BziCR31tEFvJ8QSp%2B1w6hOnmQkDmSitSxzNVF84GgPUdUZ8HacIBe0XmC6GdLeGOWaUXkrezzqeUZt2jQQw8NKMzwY6pgEx6TGsn6q09%2FswsB%2BTNeLyLsBCmoHLJQyDRaXLTcKz7VdrW5RhUBC7IUUfjQs9ommWvSCL%2FH%2B%2BcxoRVmZs3NuEuPQIBfJA%2Fw%2FSIrvETz4wEO6Yekew%2BvNXIp9RM8ZLqYyQ9FBbUkZjOVsOP9rrgCVr%2Byi4tmcIlNTwMP6Z1Pk86sWs504%2B8WC9t1jTEg6oyRbzgejK6GBaqiyWDkMPEtyQb7B98hmf&X-Amz-Signature=367f349dc12b136e45d24d520a39b96f8b0f47c1400cb64e6633288eb51b6ce9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HAINTN5%2F20260418%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260418T065544Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB8aCXVzLXdlc3QtMiJGMEQCIBy8Ol3wXGEODEsiQD2Zn9MjpZIsncB%2F%2FkFv22TlAqsJAiBezOeGIh1r1qwD22h7ZMVd6yBrEDN0dlFnQLKdr%2FVWZiqIBAjo%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSapqCkA8o2WBNjxgKtwD0rhWLlI%2Bn%2BhfjeGRP6a57yRjoa7QXc4x54gBYjflkoibAR1NeJCcw8z6vGgA3u1OsBqXXMzSHbeotJVe9WfKO6gLpHtQ00ul5DMJLGV6txPYZO6iCTunLXBzPjii6sDuGVC7IjlIBdpXM6xC2IprCCvF9X0jJPG13ZopGFydevLxG%2F%2FCpqZ7bqyqopXdPLAjQ%2FJwkq9Zwl0XDRJ%2FXhuxGD91b87ZB3Xp734IYQUWECklYINKnfC9EPreNTsssYNIPsHgv7ys2c5NE3LAVsCbo6UhUKLaEBztgjI7BjMOzW0ca4pjYt5Z2qXOKJmPvsIZe%2Bq%2FbFoxtsCpfwZCBOMEEjSVoq805Ub8vVc1Pv%2F6Kx%2FPsL6dWs5cksW2MZ1KQSISPzh%2FCxXsxg7f7TIrByw9pB0Dtzt9e2uvEcJcQZJGPWGvDIOkRd1yWrjdTKfGXac7%2F4hsvNQMFl%2B0Y4m0Latcgq6qI7NRpFuZ6E0jqXiFMhOKJSb%2FRMfHo4EzjnlKiDySayNx9UOcO5hFC7X7pBNYRjR7aLwoCkwKnxxh9bLPS%2BziCR31tEFvJ8QSp%2B1w6hOnmQkDmSitSxzNVF84GgPUdUZ8HacIBe0XmC6GdLeGOWaUXkrezzqeUZt2jQQw8NKMzwY6pgEx6TGsn6q09%2FswsB%2BTNeLyLsBCmoHLJQyDRaXLTcKz7VdrW5RhUBC7IUUfjQs9ommWvSCL%2FH%2B%2BcxoRVmZs3NuEuPQIBfJA%2Fw%2FSIrvETz4wEO6Yekew%2BvNXIp9RM8ZLqYyQ9FBbUkZjOVsOP9rrgCVr%2Byi4tmcIlNTwMP6Z1Pk86sWs504%2B8WC9t1jTEg6oyRbzgejK6GBaqiyWDkMPEtyQb7B98hmf&X-Amz-Signature=f71645f2140239de5a943b78e9eb57ac06badb6a99ff481da4fa7860020eb84e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
