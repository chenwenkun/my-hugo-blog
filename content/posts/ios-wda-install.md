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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VERVKBB3%2F20260328%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260328T064454Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJGMEQCIBpMNIGbWzu%2BmV6wgCY1bV78BOFwtdKg2jzVF%2Bgrgo4HAiAfS5Zi0HeYYB5TZlYKzye7MsPv5MRm9GaisXyHQchtLSqIBAju%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFSw3dQ4UtPwajjdpKtwDdtncYIDAolcKApVjfT4hYhduZJR%2Flp8iujx25RS1ZiTXx7xSURCRAl3BU3fpawHeNsIlep0H8EZvVoBJ%2BBklKJIIYqJw6mE8klky8shVnrmCSnHIWWjhMs0pizmr2BCsxmHnVMmqA%2BAVyrkcOdqvOa6UKFmh0QvTjGNSdbIBMZAzyhz6iurbFfZnpr1JLzVX3r%2FhN0vi4254zGZvoiNhHyzjn7kyix2wuKaVYppTLrbJIbDdkBgQsSjfejQ%2BYrSE1iKREZ0T7KHEXDxbMiKI2W%2FxRweOCV%2B0MbwKyvfS5wFjIfX%2FMGAbafXg35%2Bplin0WxXSbgnog4n42q%2FVKWCSjdnVxAEdc1nrWrpe0Xp%2B9Xf%2F3hfdVmF0K%2Bjp0nr03fA0NWozOUYzGrhr15mauMqMXRtwub70iXetR2SM2PJPun%2FEbHk6P2KqBi33ZHqStQqwXh4vY%2BmieIJzlaFtdj42DFxM6SlkQ%2BORZadJj6ehskbhJjEbbLyZJm484NR4w5X2I3cJeboYEzF8ItnU39N4SwMLW3%2BmjvdTKsDGRUX%2F1foKR9vmq1YeBtO%2BmD1WJeDg63v3fdFXUQ7BFET8mJZcXeqc8TyZArbdFFZokFsiT5aRWbq0u657XA0U6gcwlMudzgY6pgHpFnNniWQ6nOZD9W63Nu%2F9T%2FKMAbFD6GfG%2BTsyCENGPQ3OhCbWMGN%2BpomVQeHG87j2qrXbtFA25HzHH849E6abYutVGAcDgwsMuKMIe6WCEt%2Fhqt9wcKeWCB3txfHSsg0b%2FBeHhKkpBZ9lw7lj7J9jG6D4G5D8NiozSX2wlN6l318teN23WA2G4rMcM4823I9zvLE8u2kDX%2BzBVGZOXvOL2%2F7VOaoY&X-Amz-Signature=803e5c95aea6ebae4df2f29629c3d9dd3227ee5b88a7c51848d12b024e9ce8bd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VERVKBB3%2F20260328%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260328T064454Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJGMEQCIBpMNIGbWzu%2BmV6wgCY1bV78BOFwtdKg2jzVF%2Bgrgo4HAiAfS5Zi0HeYYB5TZlYKzye7MsPv5MRm9GaisXyHQchtLSqIBAju%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMFSw3dQ4UtPwajjdpKtwDdtncYIDAolcKApVjfT4hYhduZJR%2Flp8iujx25RS1ZiTXx7xSURCRAl3BU3fpawHeNsIlep0H8EZvVoBJ%2BBklKJIIYqJw6mE8klky8shVnrmCSnHIWWjhMs0pizmr2BCsxmHnVMmqA%2BAVyrkcOdqvOa6UKFmh0QvTjGNSdbIBMZAzyhz6iurbFfZnpr1JLzVX3r%2FhN0vi4254zGZvoiNhHyzjn7kyix2wuKaVYppTLrbJIbDdkBgQsSjfejQ%2BYrSE1iKREZ0T7KHEXDxbMiKI2W%2FxRweOCV%2B0MbwKyvfS5wFjIfX%2FMGAbafXg35%2Bplin0WxXSbgnog4n42q%2FVKWCSjdnVxAEdc1nrWrpe0Xp%2B9Xf%2F3hfdVmF0K%2Bjp0nr03fA0NWozOUYzGrhr15mauMqMXRtwub70iXetR2SM2PJPun%2FEbHk6P2KqBi33ZHqStQqwXh4vY%2BmieIJzlaFtdj42DFxM6SlkQ%2BORZadJj6ehskbhJjEbbLyZJm484NR4w5X2I3cJeboYEzF8ItnU39N4SwMLW3%2BmjvdTKsDGRUX%2F1foKR9vmq1YeBtO%2BmD1WJeDg63v3fdFXUQ7BFET8mJZcXeqc8TyZArbdFFZokFsiT5aRWbq0u657XA0U6gcwlMudzgY6pgHpFnNniWQ6nOZD9W63Nu%2F9T%2FKMAbFD6GfG%2BTsyCENGPQ3OhCbWMGN%2BpomVQeHG87j2qrXbtFA25HzHH849E6abYutVGAcDgwsMuKMIe6WCEt%2Fhqt9wcKeWCB3txfHSsg0b%2FBeHhKkpBZ9lw7lj7J9jG6D4G5D8NiozSX2wlN6l318teN23WA2G4rMcM4823I9zvLE8u2kDX%2BzBVGZOXvOL2%2F7VOaoY&X-Amz-Signature=14815ad6f378c139edc368b0cc54d3ec6d2bc5783273ab6fb7ace7ac66d50e69&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
