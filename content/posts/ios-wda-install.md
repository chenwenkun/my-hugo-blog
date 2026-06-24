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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JLMI5FI%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T021103Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJIMEYCIQD%2FmtCqY574uyG6%2FwJU7ayOM4qhpecZ%2B%2FUngBTp1tgJugIhAL9hAVGrFsdhq%2BNUOA9N%2B7daQ6CMTGKvE164NJefHq0ZKv8DCCsQABoMNjM3NDIzMTgzODA1IgzStNM1BaMOEWhjPKgq3AOQ1R3C9GoidpUV0vjCncvYSzFhLhQabHGYKCkJBMUF8nZPHDMm1d24%2Fj%2F%2FVzaaf8N45lwbqmcE3w6rxjjGnm%2BnBIx319KA5ENv9%2BbfhZKrdrwzVwhnSuDmxHGTGGd5C5dShz5Cj6HwDcOsiipPpme7PexZsVwR1IbuSeIkvWnCOvLi2K5ZtOXNlyc3UuqZ7frmC%2FqJvTj1XH2B%2FWvGPl%2BFuOgPWeFUlmQYOUvIwttROp8Cd1vl8LZPhzkPim2k7mbUPpuK4P%2FaTMeO8GbCnoxkvJOrL%2FusapF78Q2vY4bCqqclYWupphzYHhA4S0CECHiKA9z0q3Zqe2V2yI%2F3ZhqaN8sX%2Fyw6GFWJ1%2FzjEef6a5gLsld6DsNYhJSb%2BcSEZZZl0pB0%2F9bS0Hi%2FISrjf8B40lJfM5BzeTFgeYLp%2B9bV8Zh54iIj7mVmLmr2bBkTJmnESYwurHCDGOoU77hz2C4VHDvVFqbLv5hm%2FcqpudrwfLmzYu6y3gNfayJurzeL%2B%2BE4Fw22h%2FJEZVso1F%2FXbcYbJZYouYIPIuxNuR40f1IJc5LX50EOHL%2FWMzmaHCX3Gudmnokgdzyze7AR8DAgehGqNx0CTfkX2c50YaQmh3mNl0M9yMjviqXIBhXHqjDq8ezRBjqkAf0ohY%2FD6kxw9%2F9G%2FZDBcKy1U862zrftEW6CYoHRjqiKHrOqeWInyM82WJAYkYvHorppqfZUXYJi%2BOeE82Yt0B%2Fdej5LCturkuD%2BHCZxw7FWWnGEsKVDdeWjNlAj7uH18RzPur84a82XSOFeIsY4DMt%2BQTGnV%2FCprYHwVi4IJ8AsFdG6OFyRf%2BROWe2VWnKNkCmVH8fxfctd5aZR4HbBpowAuy8k&X-Amz-Signature=4b7b68cf19ae04ad957c88d4c899f54fe1ebbf8627c7bb7fb36f7892f48727e6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JLMI5FI%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T021103Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGIaCXVzLXdlc3QtMiJIMEYCIQD%2FmtCqY574uyG6%2FwJU7ayOM4qhpecZ%2B%2FUngBTp1tgJugIhAL9hAVGrFsdhq%2BNUOA9N%2B7daQ6CMTGKvE164NJefHq0ZKv8DCCsQABoMNjM3NDIzMTgzODA1IgzStNM1BaMOEWhjPKgq3AOQ1R3C9GoidpUV0vjCncvYSzFhLhQabHGYKCkJBMUF8nZPHDMm1d24%2Fj%2F%2FVzaaf8N45lwbqmcE3w6rxjjGnm%2BnBIx319KA5ENv9%2BbfhZKrdrwzVwhnSuDmxHGTGGd5C5dShz5Cj6HwDcOsiipPpme7PexZsVwR1IbuSeIkvWnCOvLi2K5ZtOXNlyc3UuqZ7frmC%2FqJvTj1XH2B%2FWvGPl%2BFuOgPWeFUlmQYOUvIwttROp8Cd1vl8LZPhzkPim2k7mbUPpuK4P%2FaTMeO8GbCnoxkvJOrL%2FusapF78Q2vY4bCqqclYWupphzYHhA4S0CECHiKA9z0q3Zqe2V2yI%2F3ZhqaN8sX%2Fyw6GFWJ1%2FzjEef6a5gLsld6DsNYhJSb%2BcSEZZZl0pB0%2F9bS0Hi%2FISrjf8B40lJfM5BzeTFgeYLp%2B9bV8Zh54iIj7mVmLmr2bBkTJmnESYwurHCDGOoU77hz2C4VHDvVFqbLv5hm%2FcqpudrwfLmzYu6y3gNfayJurzeL%2B%2BE4Fw22h%2FJEZVso1F%2FXbcYbJZYouYIPIuxNuR40f1IJc5LX50EOHL%2FWMzmaHCX3Gudmnokgdzyze7AR8DAgehGqNx0CTfkX2c50YaQmh3mNl0M9yMjviqXIBhXHqjDq8ezRBjqkAf0ohY%2FD6kxw9%2F9G%2FZDBcKy1U862zrftEW6CYoHRjqiKHrOqeWInyM82WJAYkYvHorppqfZUXYJi%2BOeE82Yt0B%2Fdej5LCturkuD%2BHCZxw7FWWnGEsKVDdeWjNlAj7uH18RzPur84a82XSOFeIsY4DMt%2BQTGnV%2FCprYHwVi4IJ8AsFdG6OFyRf%2BROWe2VWnKNkCmVH8fxfctd5aZR4HbBpowAuy8k&X-Amz-Signature=1be23d0a457967c88a6b099fcc0dad25882be19dfbe9ce7231cba52c9063c844&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
