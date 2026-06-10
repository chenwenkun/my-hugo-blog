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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q2LZBRG2%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T145112Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJGMEQCIDY6cnM%2B4iwqt7d6D4OrAAoAUqiePZyDLzMGx%2BrM8TkNAiAPnWLQ4LCV0KxfxInZ8n2UacJtj3SkSVmIYaRCjTNjGyqIBAjm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMfXSuXhCGhKhWW3urKtwD9Py834WT55PWYDXUmFPE917kVuJOskg%2FFD5JAP4I49H9IMqxPXX3t1KNsnFWvk5%2B8G2RwM%2Bckph2ZkWSpS5zGMZ76V7bjI%2Fzfo%2BHPOSmyzEx4oOdnjdiym%2FBNlV94%2BgUFPwld7Bljwd32pT4wfW16g8SnlGwGAHRlsTmLzV3ehFQncr0LavTvyV3bQDHBklD6DxqvXJ3SEZI6zooDbVvvzDIW956bGgQV0n0rJjcVTyJ7K34im8Iw4ijOqZ5vVh9uwuhM4w6Zn%2BbJVRdFFNfbaJe1CNJthE5X7Ik7uW4b9QCxDdNr0yzAciRx6bpuTY3aYJ%2B7ywLBqjYlylo3E8Hj7AjQZoOi5fbSSfMkfxrX80tsiOvhIlgxTeJP5ap5pUsBUxJ42dztc4oflvwwBSvWYjyeyPjHKVYLrPLgVVR4vBmtY5%2BMqLNONd8ntt%2Bj7696F3cRSNd%2BjnFLYtBAf9zIZn3bcZrnIXbdHp0DB%2BXy5UDfGzxJ5lpKhgbdHxF3d8a8IPOG8wLbrk7Am71NGCsQ4Ol3%2Fy70Be443fnhjakUKJ%2FOcFs3Exd7Cgzh8Y8%2FdsqO%2BBkQtrmIwuf2ZdHfN2AuYmray4eZJoK9jQywiLCS%2B6QXF4EbK%2FfTbdV6IMwhsWl0QY6pgE5QVTXjIFobrPuqs7aaMRhf0iRJkr9pSaf2ZNZbMAw%2BOiyynXWAG2gqub4SN%2B6pya83fKdo8mui5VF35FF1Il684ahsjnmPSE1%2BwMs%2FL%2BP%2Be09lGN824cxdZg0XLOqoP1ViTiJzIRV8hNKHJROwD%2FqxTq162GWNx74kkT6Kqyd0xS0x7EUZMhwCvfm5uy5ne2sE8BWv%2BCCxlkhG9cOuqagaq%2BOdH8z&X-Amz-Signature=a618872593447024f536b67044c65829d8973f410fc279e6d81fa1fbdd0ac18c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q2LZBRG2%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T145112Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJGMEQCIDY6cnM%2B4iwqt7d6D4OrAAoAUqiePZyDLzMGx%2BrM8TkNAiAPnWLQ4LCV0KxfxInZ8n2UacJtj3SkSVmIYaRCjTNjGyqIBAjm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMfXSuXhCGhKhWW3urKtwD9Py834WT55PWYDXUmFPE917kVuJOskg%2FFD5JAP4I49H9IMqxPXX3t1KNsnFWvk5%2B8G2RwM%2Bckph2ZkWSpS5zGMZ76V7bjI%2Fzfo%2BHPOSmyzEx4oOdnjdiym%2FBNlV94%2BgUFPwld7Bljwd32pT4wfW16g8SnlGwGAHRlsTmLzV3ehFQncr0LavTvyV3bQDHBklD6DxqvXJ3SEZI6zooDbVvvzDIW956bGgQV0n0rJjcVTyJ7K34im8Iw4ijOqZ5vVh9uwuhM4w6Zn%2BbJVRdFFNfbaJe1CNJthE5X7Ik7uW4b9QCxDdNr0yzAciRx6bpuTY3aYJ%2B7ywLBqjYlylo3E8Hj7AjQZoOi5fbSSfMkfxrX80tsiOvhIlgxTeJP5ap5pUsBUxJ42dztc4oflvwwBSvWYjyeyPjHKVYLrPLgVVR4vBmtY5%2BMqLNONd8ntt%2Bj7696F3cRSNd%2BjnFLYtBAf9zIZn3bcZrnIXbdHp0DB%2BXy5UDfGzxJ5lpKhgbdHxF3d8a8IPOG8wLbrk7Am71NGCsQ4Ol3%2Fy70Be443fnhjakUKJ%2FOcFs3Exd7Cgzh8Y8%2FdsqO%2BBkQtrmIwuf2ZdHfN2AuYmray4eZJoK9jQywiLCS%2B6QXF4EbK%2FfTbdV6IMwhsWl0QY6pgE5QVTXjIFobrPuqs7aaMRhf0iRJkr9pSaf2ZNZbMAw%2BOiyynXWAG2gqub4SN%2B6pya83fKdo8mui5VF35FF1Il684ahsjnmPSE1%2BwMs%2FL%2BP%2Be09lGN824cxdZg0XLOqoP1ViTiJzIRV8hNKHJROwD%2FqxTq162GWNx74kkT6Kqyd0xS0x7EUZMhwCvfm5uy5ne2sE8BWv%2BCCxlkhG9cOuqagaq%2BOdH8z&X-Amz-Signature=2800c9866b6ae3cc00851f4d74541d274e7dadadc9736108f1090a519554e4d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
