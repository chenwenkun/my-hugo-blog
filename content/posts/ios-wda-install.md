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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ARS2SZL%2F20251102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251102T061552Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQDE25jq9P8zUK6Ja5pqBWARbzSUFgQZp0ghii6dznrJxAIgT2dXnv3d6cj1hezwX9CFC3gt97bTIqH1RZ%2BUbsA43BQq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDEt%2FsBrALZZDlMJllSrcAxcTaLF44501PZdA0rfW%2BEb9GeK2xz0bNxwmyvPoGFqiV64YQ9nESC2oXUESEhwn%2BofFoW85JJ7dlMClG03aWQLiwmOL6rf3mVwC%2BkrbcF6jSKfKqJynePUcjQb7icoLmf9%2FoVI14ketx%2FEIHuEkKAcVPHz1k5%2Fckrjxy2EyCFKfy2d0ZL5ZrTWDOWM5Kga6DhRf51aGQh2F3Xrv8%2BdEM7wsuIYEpWgOmUFjcKnt2UjdRbOrXiWezzeUpau81B8OvOncPu7MT5LkgKVhu7mJL1WpUUBvVkjBqW%2BgUWZsAAhPabh2aysQXYbPc0i1n5%2BOFtaureIyBQvzotvbYiGCTXzYAU012oLnN%2FQFhkRa43nYWEp6vy49Qq5gtXLRoi%2Fe%2FTuTotjNNwngNrUJAaeqH2kum%2B4PZQHaJ3YBtgTj9f6%2BEISayC2RTMWSP3%2BEvXYvOh0q6u2hcgj7HrXzXfgzYqB2EhLJFS9liYmaQ3r%2FeQvHBrd8iSWkKF7uhmB4WxyTzUUfXziAF8w57hX8St1cZg%2BB8BVoBCcK9fhhmdX4PEp9Gm0ALVd0BQ340UoFftJz%2BjebNwS2jjHXr6Enyr1nYPfelTKgCJud8etsbePB0KUVVTyq5mnBFipITNNoMK3sm8gGOqUB6enp5pAnwFTcbRRmfcd2b%2B9yHqfmUPFSL1UJvs5oD3cUh2V6IYPw6yqFT96veY8sxx4XjWqfPTGDpv69eitDm%2FKJI4IGQ29D3%2BdvybJ0q45UqkM0mZm4LtkdPT2QTstfAX8KjR8oW4hxIFxmAaX%2FdiuuJ%2BWZLC0OvD00cRw0JwKhZer%2FplJZaxE2rql%2B%2Fz7NRYWebHkNlZdm5uvtwzAMecnCJydo&X-Amz-Signature=95cad4adfcba634dd7bb969837a15c14157267741b2bdd726c00189d7f954488&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ARS2SZL%2F20251102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251102T061552Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQDE25jq9P8zUK6Ja5pqBWARbzSUFgQZp0ghii6dznrJxAIgT2dXnv3d6cj1hezwX9CFC3gt97bTIqH1RZ%2BUbsA43BQq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDEt%2FsBrALZZDlMJllSrcAxcTaLF44501PZdA0rfW%2BEb9GeK2xz0bNxwmyvPoGFqiV64YQ9nESC2oXUESEhwn%2BofFoW85JJ7dlMClG03aWQLiwmOL6rf3mVwC%2BkrbcF6jSKfKqJynePUcjQb7icoLmf9%2FoVI14ketx%2FEIHuEkKAcVPHz1k5%2Fckrjxy2EyCFKfy2d0ZL5ZrTWDOWM5Kga6DhRf51aGQh2F3Xrv8%2BdEM7wsuIYEpWgOmUFjcKnt2UjdRbOrXiWezzeUpau81B8OvOncPu7MT5LkgKVhu7mJL1WpUUBvVkjBqW%2BgUWZsAAhPabh2aysQXYbPc0i1n5%2BOFtaureIyBQvzotvbYiGCTXzYAU012oLnN%2FQFhkRa43nYWEp6vy49Qq5gtXLRoi%2Fe%2FTuTotjNNwngNrUJAaeqH2kum%2B4PZQHaJ3YBtgTj9f6%2BEISayC2RTMWSP3%2BEvXYvOh0q6u2hcgj7HrXzXfgzYqB2EhLJFS9liYmaQ3r%2FeQvHBrd8iSWkKF7uhmB4WxyTzUUfXziAF8w57hX8St1cZg%2BB8BVoBCcK9fhhmdX4PEp9Gm0ALVd0BQ340UoFftJz%2BjebNwS2jjHXr6Enyr1nYPfelTKgCJud8etsbePB0KUVVTyq5mnBFipITNNoMK3sm8gGOqUB6enp5pAnwFTcbRRmfcd2b%2B9yHqfmUPFSL1UJvs5oD3cUh2V6IYPw6yqFT96veY8sxx4XjWqfPTGDpv69eitDm%2FKJI4IGQ29D3%2BdvybJ0q45UqkM0mZm4LtkdPT2QTstfAX8KjR8oW4hxIFxmAaX%2FdiuuJ%2BWZLC0OvD00cRw0JwKhZer%2FplJZaxE2rql%2B%2Fz7NRYWebHkNlZdm5uvtwzAMecnCJydo&X-Amz-Signature=9761ed64857502e5e8f4f77c1ab70ed215ad909c03da1697d69138a2291015cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
