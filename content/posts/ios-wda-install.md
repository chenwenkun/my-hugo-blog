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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q2O2YSI2%2F20260513%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260513T020523Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQDJU25HCQ0pwVhjAsSlW15rAnswbShZv9yh9uAEUZn1UgIgF%2FDPOwBzy0Gu9Muxn0dGAPkXeC5imR%2BXnjE3cqqHLqEq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDI4fRWk1MGKD6pzlyCrcA3h5HHywjeUQyHvcxc9pzOtbGFTakmAAXE7i0VFp%2FppCA%2BckxhJTw4FEZLxJUf0nR0pWqCg%2FlbtEantMOT411V8DNLpBqFxlt6LhH%2BZY%2FWSP9u23bUTsQP25i%2Fl%2B%2BXko2JNF2M5WzWqIuqz%2FcAqmPhDTGEY833D5cBykeU1zun4GUkmYIUfcsF4lADAO%2F93Ehvi2uBMcip322IDnFmbMFmTPNsQ1pzQLGrCFNVQF7CFY6d9OxrYtkaBVslnZvv22lhn%2BdHmXdXDMHOVnTcn8C0eJVtkULqUkiWYahXV1NibrJyG00QTpwt9VSn2Oev2yIeKdspMKBpN%2F7aAYB5A59enMbFd%2BuigxsomjimgMVZUO9bQHbrKjRV7J5nndhoLljntw3TUia9bDCDNvblxpn9NScskR7HjA3JnAoD5aqk5ysH3uz5vKC51KJUf%2FDkUwZuSeIOQuKYaItBMnPfCZG1eopmlCXk6YZCB4RO%2F4MHxoM7tgDacbiS67bnvjsp8O5hbJNSyMy%2F8G6TKtWs4EsJtYKKmOBnTl5%2BmksOssBE0pLLx2hg9NaMwil0RRGAVzNxaXlvfFzGzf9HlAaf7Eq555i%2B5EncBiZ6UPwxcbHrKHPgCFlo59dwH8Wv%2FuMJ6qj9AGOqUBek3aPLiB5L%2BgSzQYft57qZckF3DI022H6GChes3dkzIyjKKoQBds1vYnezv%2BgiWb2uVmMlVAiAB5yn%2FQJE9vZ86XNWvpB1KvQhjLxjrl4Iva%2FY%2BYMUkDI%2F91HVing0TINhLODIygrwfc7OxrN7v7HNKh1iD%2F7TgfGD9A%2FRJUa0RzpCRz3QVSDsRw7mfOWJWRcusjxdqlVNRZB9nhb6xK8dZZJaoA&X-Amz-Signature=6245cce6e2350280270f8220bd982583db858906a095d7205cc637a915c60341&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q2O2YSI2%2F20260513%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260513T020523Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJHMEUCIQDJU25HCQ0pwVhjAsSlW15rAnswbShZv9yh9uAEUZn1UgIgF%2FDPOwBzy0Gu9Muxn0dGAPkXeC5imR%2BXnjE3cqqHLqEq%2FwMIOxAAGgw2Mzc0MjMxODM4MDUiDI4fRWk1MGKD6pzlyCrcA3h5HHywjeUQyHvcxc9pzOtbGFTakmAAXE7i0VFp%2FppCA%2BckxhJTw4FEZLxJUf0nR0pWqCg%2FlbtEantMOT411V8DNLpBqFxlt6LhH%2BZY%2FWSP9u23bUTsQP25i%2Fl%2B%2BXko2JNF2M5WzWqIuqz%2FcAqmPhDTGEY833D5cBykeU1zun4GUkmYIUfcsF4lADAO%2F93Ehvi2uBMcip322IDnFmbMFmTPNsQ1pzQLGrCFNVQF7CFY6d9OxrYtkaBVslnZvv22lhn%2BdHmXdXDMHOVnTcn8C0eJVtkULqUkiWYahXV1NibrJyG00QTpwt9VSn2Oev2yIeKdspMKBpN%2F7aAYB5A59enMbFd%2BuigxsomjimgMVZUO9bQHbrKjRV7J5nndhoLljntw3TUia9bDCDNvblxpn9NScskR7HjA3JnAoD5aqk5ysH3uz5vKC51KJUf%2FDkUwZuSeIOQuKYaItBMnPfCZG1eopmlCXk6YZCB4RO%2F4MHxoM7tgDacbiS67bnvjsp8O5hbJNSyMy%2F8G6TKtWs4EsJtYKKmOBnTl5%2BmksOssBE0pLLx2hg9NaMwil0RRGAVzNxaXlvfFzGzf9HlAaf7Eq555i%2B5EncBiZ6UPwxcbHrKHPgCFlo59dwH8Wv%2FuMJ6qj9AGOqUBek3aPLiB5L%2BgSzQYft57qZckF3DI022H6GChes3dkzIyjKKoQBds1vYnezv%2BgiWb2uVmMlVAiAB5yn%2FQJE9vZ86XNWvpB1KvQhjLxjrl4Iva%2FY%2BYMUkDI%2F91HVing0TINhLODIygrwfc7OxrN7v7HNKh1iD%2F7TgfGD9A%2FRJUa0RzpCRz3QVSDsRw7mfOWJWRcusjxdqlVNRZB9nhb6xK8dZZJaoA&X-Amz-Signature=14ce996766162a5437fd61665dbecd07833b9efeccac2e76e1b3504991efa6ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
