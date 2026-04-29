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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BWKZRUN%2F20260429%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260429T075848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIC%2BExH2abboRWhM65lrLMxcxYf1ADTgNlV4RHKEvlYuQAiEAj5TxD2nZXZRiefaIhM0ipG2Pt2x1Av1Y%2BLoK09Kp6CAqiAQI8P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDElVzm6KbuLZ4EPj2SrcA8gF9%2FF1D98HvKSnt4e92sw7LxgiCRRZOiZDBbUUzhrgqXR%2F1xtX1lAkq6%2BqjCZMgAU0avyHy4FNDVqs0qPN5vg6wp6SxSbMt8UMZmv7AElHIUHhT5gOJZoazjSONAKHw6nZ4Kmk0HIPQkuvojWPhTTimBQi8M702%2FoZw6A%2FtHmP%2FAfh3ySfvqKfOyACDRrSmUJF3EiykIkJVdHjr%2FhFW%2BU8OebzfCNAkgN118YnnkmzEhj6exc%2Bq9u8f9Qn9%2Fmxh79%2FZYhbVD5zuhawgUtoDF8clGY1j9ZDsPYLleMkvQTOhLYRhKp9prX%2BM0bUIBHUTsCxTiS9jQkDirTp7rlSHpB8pMK%2BPOsQfTshy%2FlC1cRoQR0BrYcUOJUy6UvjPLgqIXZn%2BPBf%2FjKnmrNGPG9Ui8GcAxHjavpl1EdJEc7XbBAK358y8HzbLUF6GQNldWkoOWhnXFINFqzgC2igrSWfi2saocPWEK2dP%2Fu6lGFmqMiv3xkjdAZzLNvjtlmMwqqhZoKzkXa5jqUp4DC9sirJ4KQT1MLjpwgWbKbia5Ktz%2BG2uDiCYQGwG5GKJ82x%2BfcxkBeEb%2BOLek%2BQiHMSzUYhKbaVqhLLM5ERU305c%2FLI2L70m5kLKQ1sjgiFuJd2MNDbxs8GOqUBtdajojCPDu68TQFWq90ekBUpwbLNQWqeb%2B9u34zJAHBFw898NQ%2Bs4oomTptePA%2BjoktDj8wdV0ioSv4OIf1zRKPaMqEtAmBF%2FOHY%2Bp7VKdDYvAOB4Ot7nzjKEDdZuh5MuWErIB02ImCukadydgJToysXx1VGaheb7c2oFvJqLBH41BfTdi6aUfqYEUhoEusZrjO%2FsGFbCHSKEMfCTRChUUpqIzlQ&X-Amz-Signature=d68ce7e53d30b338d0f28e8fdc2b50daa05747f76302e03a18350d2abbf2c0dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BWKZRUN%2F20260429%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260429T075848Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIC%2BExH2abboRWhM65lrLMxcxYf1ADTgNlV4RHKEvlYuQAiEAj5TxD2nZXZRiefaIhM0ipG2Pt2x1Av1Y%2BLoK09Kp6CAqiAQI8P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDElVzm6KbuLZ4EPj2SrcA8gF9%2FF1D98HvKSnt4e92sw7LxgiCRRZOiZDBbUUzhrgqXR%2F1xtX1lAkq6%2BqjCZMgAU0avyHy4FNDVqs0qPN5vg6wp6SxSbMt8UMZmv7AElHIUHhT5gOJZoazjSONAKHw6nZ4Kmk0HIPQkuvojWPhTTimBQi8M702%2FoZw6A%2FtHmP%2FAfh3ySfvqKfOyACDRrSmUJF3EiykIkJVdHjr%2FhFW%2BU8OebzfCNAkgN118YnnkmzEhj6exc%2Bq9u8f9Qn9%2Fmxh79%2FZYhbVD5zuhawgUtoDF8clGY1j9ZDsPYLleMkvQTOhLYRhKp9prX%2BM0bUIBHUTsCxTiS9jQkDirTp7rlSHpB8pMK%2BPOsQfTshy%2FlC1cRoQR0BrYcUOJUy6UvjPLgqIXZn%2BPBf%2FjKnmrNGPG9Ui8GcAxHjavpl1EdJEc7XbBAK358y8HzbLUF6GQNldWkoOWhnXFINFqzgC2igrSWfi2saocPWEK2dP%2Fu6lGFmqMiv3xkjdAZzLNvjtlmMwqqhZoKzkXa5jqUp4DC9sirJ4KQT1MLjpwgWbKbia5Ktz%2BG2uDiCYQGwG5GKJ82x%2BfcxkBeEb%2BOLek%2BQiHMSzUYhKbaVqhLLM5ERU305c%2FLI2L70m5kLKQ1sjgiFuJd2MNDbxs8GOqUBtdajojCPDu68TQFWq90ekBUpwbLNQWqeb%2B9u34zJAHBFw898NQ%2Bs4oomTptePA%2BjoktDj8wdV0ioSv4OIf1zRKPaMqEtAmBF%2FOHY%2Bp7VKdDYvAOB4Ot7nzjKEDdZuh5MuWErIB02ImCukadydgJToysXx1VGaheb7c2oFvJqLBH41BfTdi6aUfqYEUhoEusZrjO%2FsGFbCHSKEMfCTRChUUpqIzlQ&X-Amz-Signature=4258563646c6f9f0c99980458ff997186173fe00267ad90e1602a83a75ba05b3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
