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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SKX5MZIZ%2F20251108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251108T121850Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQCXnauKdkvg7h51jQKa9fDV0yHwlS6szSPmARagCrbpigIgUfjrwgfw1OHVllo1UC%2FgaEaCajpVQYcLJifPkF2dDXkqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKtqbb53SQBiqJ8dPCrcAwTaa1gmCnkBmCu%2BYDQXDww%2BtDTqY23uGY%2B1n71mnvW7Glybedt4McI3q6QPfu2xHoGIbvNPIgJwaW15OQr07b4p83svJ%2F7AQ1J7v4DsiPUBlRenjzmnY%2BALwtS6tgnstNpgSy9ut24t9hHgbYJ%2BvoZqYq%2FgP9bLJ654nXnhkVaSU1MeLr%2FHv4xJy%2BPyHfKp%2FHqBQNmkb0Mgh8C4Fe7OzQEtz65QmIEtzVHZ8fY%2BOvz7lrVi2z0o4%2BjHpD3bwMT79A1xMO7VSK%2Bglh9PPshaK45TV%2FcwXo6AZsRBBzbOmp%2Bl6NPT86ThhUyLz33qzLmnRlou0qn8PEOd2Zme5FKx67%2BryYe87LuPlJgOS9sMrdMhszkfKIuMeVGQgn3DkxhrhWrk7IQnnmEIjCNkX9LIAUbEVxwp2nmeG6uTfNerCtAYZSszqxIasumRzS3UBnZp7%2BObMi%2BI2Vd1thawBGrzwA5Z5gIR%2BJYYfnVby1YjZUNcigGJ8OeJOEU%2BErJ727KsQ4Q%2FgMGDSFMehYBriTHRu79VfhuXchlQWAtEdlb9G%2BQ0Nqttb1O%2Bq2GWqwSe68qhT0lalrUu8qF2qZc7bgy5qCRZAB%2B6HUONlGfFRlLZnZyXWyEebHpL0vv3Zt%2BWMO%2BgvMgGOqUBAcxO1Y1G9VHbdut5a4%2BnXf4pCB8gfCpCfQMZrikUi3zwN6MIL%2FFsqcVPcLNb9D0kPeEfbLy%2FYvZfn7tNgFaCHRKvuifsi4QDjUPLvyWKiPd%2BAg7BEjA60tVRb7hicM0kfguk142DZyKDlRNGOkabvNYOfNQ1AmqXV%2FCs1r69fO7v54rDYOCNG%2BvPSuqb44ZZcotBiBU6zHIbsztk3bsk%2FVLFr91k&X-Amz-Signature=5993f30aab1b7c855f90b11bbb9dd5f9d8f27c403d4ce969fb8a49c639270496&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SKX5MZIZ%2F20251108%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251108T121850Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQCXnauKdkvg7h51jQKa9fDV0yHwlS6szSPmARagCrbpigIgUfjrwgfw1OHVllo1UC%2FgaEaCajpVQYcLJifPkF2dDXkqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKtqbb53SQBiqJ8dPCrcAwTaa1gmCnkBmCu%2BYDQXDww%2BtDTqY23uGY%2B1n71mnvW7Glybedt4McI3q6QPfu2xHoGIbvNPIgJwaW15OQr07b4p83svJ%2F7AQ1J7v4DsiPUBlRenjzmnY%2BALwtS6tgnstNpgSy9ut24t9hHgbYJ%2BvoZqYq%2FgP9bLJ654nXnhkVaSU1MeLr%2FHv4xJy%2BPyHfKp%2FHqBQNmkb0Mgh8C4Fe7OzQEtz65QmIEtzVHZ8fY%2BOvz7lrVi2z0o4%2BjHpD3bwMT79A1xMO7VSK%2Bglh9PPshaK45TV%2FcwXo6AZsRBBzbOmp%2Bl6NPT86ThhUyLz33qzLmnRlou0qn8PEOd2Zme5FKx67%2BryYe87LuPlJgOS9sMrdMhszkfKIuMeVGQgn3DkxhrhWrk7IQnnmEIjCNkX9LIAUbEVxwp2nmeG6uTfNerCtAYZSszqxIasumRzS3UBnZp7%2BObMi%2BI2Vd1thawBGrzwA5Z5gIR%2BJYYfnVby1YjZUNcigGJ8OeJOEU%2BErJ727KsQ4Q%2FgMGDSFMehYBriTHRu79VfhuXchlQWAtEdlb9G%2BQ0Nqttb1O%2Bq2GWqwSe68qhT0lalrUu8qF2qZc7bgy5qCRZAB%2B6HUONlGfFRlLZnZyXWyEebHpL0vv3Zt%2BWMO%2BgvMgGOqUBAcxO1Y1G9VHbdut5a4%2BnXf4pCB8gfCpCfQMZrikUi3zwN6MIL%2FFsqcVPcLNb9D0kPeEfbLy%2FYvZfn7tNgFaCHRKvuifsi4QDjUPLvyWKiPd%2BAg7BEjA60tVRb7hicM0kfguk142DZyKDlRNGOkabvNYOfNQ1AmqXV%2FCs1r69fO7v54rDYOCNG%2BvPSuqb44ZZcotBiBU6zHIbsztk3bsk%2FVLFr91k&X-Amz-Signature=b01bdb534748e7d6d5a313bf5f5d1a441de2b93c79b6b63f090d55121f29e82f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
