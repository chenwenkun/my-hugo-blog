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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662MRX6J7Z%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T070529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJGMEQCIFm01H5DJKqNRUvPfrg7fOPZNt53P1gen7jpeXornsxvAiBPzEAH0nQoaiYuYDDKEk0tTmAU7UUl4AUP2xfIZU23hiqIBAj4%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMLiTVnOzMinsjiuQTKtwDnxhFUnhX%2BLxshgfiKU88aeeP67Nr46igcwaxdRXfDzVxG9AjnJ4PuvO865mNCb96PtwvVLOhMQOYfGNoB3ThyE2f2AaRKOMVm9UT4V%2Bb6IQebx8AC6teynQCEHNSBkHO5WoF9xGXQeUkH4u0ThxcsVf3s3CDZIR8nt%2F9ZRv6X02l0XkBMpNk12hJIfU780rhhHu3VY8pYZBezdA%2BR5olZjFZEqMGzfxfS5nlDYtT63EeBsJNeM5pU%2FIeO0HzMtuyaYKI%2FPswmMOk867sUy%2FgTxPExPhBDGUS0PvBokKxx%2Fx%2BHdsXnbe9AqYjUoZQVRW2NxYKqhJI7grOFhNXJ72VHCN4YPZO2wVD6NbVQQRy%2Ft4DSZmyCw%2BiMuX43ntx4ptDW7rmK6blwCOcoMmiuzg8q%2B%2FvG9zx3IUpX3HNvjDNMapxE%2FigsJ%2BdPAau1PylbwTVpN6UhhZJAJmes3gwRrld2tgDJtWVsScgOsN3xWumt169XoZLf6REfIhf9Zm3I8nMhw5FT756YEsDxxtYRwiJpuRXIyAEqP9SNNs7ZYg%2BCGEJ914y8nEKmnC%2FQBqU3mMpHIrwOtKzFfTPh80j%2BrkIWIW1C9Kh0pbcfWhT%2BW9nPm6Rl4rfGYqWQai9KlQwq%2FTXzgY6pgHlv6%2Fq%2B0nQXlFGrw7ZIsCb40%2Bjuk7aDMP9Qm7vA%2Bzw92ANLTgdCdR8ioZeC%2BySyL920F40aJWonZJ8nsvwoKu0agjg0gYfUN70Mg1r%2BgRoaadPseotZlKobwLgehPF6kxdisOa7XQplMrGW1dnWXqm7opyOn7Uc5siZmN9vOFwTQrype%2Ff9teaR%2FE%2BO7g4Ue01ujRjKO1ux6DPzlv5D4E2%2FOiig1Oc&X-Amz-Signature=88f2579caeb75a343cd1a49943c067c981991f3520f6fdb12d93e3cd2b85acb5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662MRX6J7Z%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T070529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEC8aCXVzLXdlc3QtMiJGMEQCIFm01H5DJKqNRUvPfrg7fOPZNt53P1gen7jpeXornsxvAiBPzEAH0nQoaiYuYDDKEk0tTmAU7UUl4AUP2xfIZU23hiqIBAj4%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMLiTVnOzMinsjiuQTKtwDnxhFUnhX%2BLxshgfiKU88aeeP67Nr46igcwaxdRXfDzVxG9AjnJ4PuvO865mNCb96PtwvVLOhMQOYfGNoB3ThyE2f2AaRKOMVm9UT4V%2Bb6IQebx8AC6teynQCEHNSBkHO5WoF9xGXQeUkH4u0ThxcsVf3s3CDZIR8nt%2F9ZRv6X02l0XkBMpNk12hJIfU780rhhHu3VY8pYZBezdA%2BR5olZjFZEqMGzfxfS5nlDYtT63EeBsJNeM5pU%2FIeO0HzMtuyaYKI%2FPswmMOk867sUy%2FgTxPExPhBDGUS0PvBokKxx%2Fx%2BHdsXnbe9AqYjUoZQVRW2NxYKqhJI7grOFhNXJ72VHCN4YPZO2wVD6NbVQQRy%2Ft4DSZmyCw%2BiMuX43ntx4ptDW7rmK6blwCOcoMmiuzg8q%2B%2FvG9zx3IUpX3HNvjDNMapxE%2FigsJ%2BdPAau1PylbwTVpN6UhhZJAJmes3gwRrld2tgDJtWVsScgOsN3xWumt169XoZLf6REfIhf9Zm3I8nMhw5FT756YEsDxxtYRwiJpuRXIyAEqP9SNNs7ZYg%2BCGEJ914y8nEKmnC%2FQBqU3mMpHIrwOtKzFfTPh80j%2BrkIWIW1C9Kh0pbcfWhT%2BW9nPm6Rl4rfGYqWQai9KlQwq%2FTXzgY6pgHlv6%2Fq%2B0nQXlFGrw7ZIsCb40%2Bjuk7aDMP9Qm7vA%2Bzw92ANLTgdCdR8ioZeC%2BySyL920F40aJWonZJ8nsvwoKu0agjg0gYfUN70Mg1r%2BgRoaadPseotZlKobwLgehPF6kxdisOa7XQplMrGW1dnWXqm7opyOn7Uc5siZmN9vOFwTQrype%2Ff9teaR%2FE%2BO7g4Ue01ujRjKO1ux6DPzlv5D4E2%2FOiig1Oc&X-Amz-Signature=4cf7c2576a5e943836bcfddbb4ba816f624cdc319bddeed6d62dae6a9ad9cd83&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
