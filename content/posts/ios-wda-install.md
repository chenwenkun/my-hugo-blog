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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3UMDYSF%2F20251026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251026T121917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGrj5mtOiUssOZEzCcArMoonKuz%2F2EbJNIuW9WaFv%2FQVAiEA4NKgY3WvKd9Ic8suRQo0IHquHIhzzmSX8sFpxb6oi7IqiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBtKqB3xS9WM0fs9LSrcA9Bg7yF3PzFNuCEFlQzyLcxBB4O2Gu3dAFAnFloSQywwqWt49MYlpBdep6L0H7yGrywwiGpIdOkfJvgFEC3FWd95jPX%2Bh4s1YNKpu9PBaqjnR229hNO2z6kqmcmvnyz4WzZEMWYvAgcqU%2Bfkx2XEiVlGJaabIIZil%2BquEldb7zNxnln1luf0ckY0xIXGo7xdluDejewTcgeg59pORCaQH5Hq2IZtBsCdyhqcqUqIq%2FJjZkmlfiJqxrYSkCLN0FqKACoGkeY4l%2FH7b%2FuBZ%2BngaSKA%2FmPzJo2JkREwLdi%2FEdo%2BfEhsS7ZhZkC0cLD6s27fjayxHZcopI6RCIN1HC2O4OIn9MHOioV3BPvoqygl4%2FHyLakctRFCKj3uKfpohi6CWdg%2F0iuHwCpD3RPtEC3rGj%2Bc6xZfHZyCDitu1eiNJfzWdq5PbBnMgj5V0F8MhJS8J4IVhgNCJBaYkg2Okz847ASphdBbJehskMADwfhD9IKrPF3HpJiwbkZVzsmdPbzgU26cC6yVLibtubvXVvE2DBALsghB7C0RLt6cCkuGBahMAhmEjADmWXSdaDm5k0wRSqi5hVRWtE%2Bu9cQTho%2F7ORamgyfWgoV56%2F2D7BQMH2%2BSpGQIYhxcnuCNJNyZMJ%2BY98cGOqUBNYh1pcoQxIvr0RWah7kd%2Bfh4iYucSkciCpOMYPQ1IYhWp4I%2F%2Bq8Ej6Jnlh%2FNfZDlZK4Np3uuww0%2BkqUF3HVqY5raFAfXxoENDQL4o40h3XvCkc7IgtHtgO07KUxFT8t6UKESpdlp0NcNc%2FE5Te9cP%2BGBovS26sO5F34QWK9CsTtBqX5PwBwFnd%2FGy7hYQ7VH9N7CogsdEbna3fzx1k%2BIKbr6Rj4N&X-Amz-Signature=1affbab299e061fe8d958d8e711165b28f46e7ec3f77f37f9d853a7ba4e3392c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3UMDYSF%2F20251026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251026T121917Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGrj5mtOiUssOZEzCcArMoonKuz%2F2EbJNIuW9WaFv%2FQVAiEA4NKgY3WvKd9Ic8suRQo0IHquHIhzzmSX8sFpxb6oi7IqiAQIif%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBtKqB3xS9WM0fs9LSrcA9Bg7yF3PzFNuCEFlQzyLcxBB4O2Gu3dAFAnFloSQywwqWt49MYlpBdep6L0H7yGrywwiGpIdOkfJvgFEC3FWd95jPX%2Bh4s1YNKpu9PBaqjnR229hNO2z6kqmcmvnyz4WzZEMWYvAgcqU%2Bfkx2XEiVlGJaabIIZil%2BquEldb7zNxnln1luf0ckY0xIXGo7xdluDejewTcgeg59pORCaQH5Hq2IZtBsCdyhqcqUqIq%2FJjZkmlfiJqxrYSkCLN0FqKACoGkeY4l%2FH7b%2FuBZ%2BngaSKA%2FmPzJo2JkREwLdi%2FEdo%2BfEhsS7ZhZkC0cLD6s27fjayxHZcopI6RCIN1HC2O4OIn9MHOioV3BPvoqygl4%2FHyLakctRFCKj3uKfpohi6CWdg%2F0iuHwCpD3RPtEC3rGj%2Bc6xZfHZyCDitu1eiNJfzWdq5PbBnMgj5V0F8MhJS8J4IVhgNCJBaYkg2Okz847ASphdBbJehskMADwfhD9IKrPF3HpJiwbkZVzsmdPbzgU26cC6yVLibtubvXVvE2DBALsghB7C0RLt6cCkuGBahMAhmEjADmWXSdaDm5k0wRSqi5hVRWtE%2Bu9cQTho%2F7ORamgyfWgoV56%2F2D7BQMH2%2BSpGQIYhxcnuCNJNyZMJ%2BY98cGOqUBNYh1pcoQxIvr0RWah7kd%2Bfh4iYucSkciCpOMYPQ1IYhWp4I%2F%2Bq8Ej6Jnlh%2FNfZDlZK4Np3uuww0%2BkqUF3HVqY5raFAfXxoENDQL4o40h3XvCkc7IgtHtgO07KUxFT8t6UKESpdlp0NcNc%2FE5Te9cP%2BGBovS26sO5F34QWK9CsTtBqX5PwBwFnd%2FGy7hYQ7VH9N7CogsdEbna3fzx1k%2BIKbr6Rj4N&X-Amz-Signature=f30ef02604a9546b9d2bfebaf58cd3afcaddafe098a428b473d6968415939fde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
