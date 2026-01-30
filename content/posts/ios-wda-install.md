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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662ALREIRN%2F20260130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260130T063520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCJWhyHVkBeoyKH4cF2Vga0Y226fmAzSQ1ro0UUIZ9LsgIgGkVbgjc1MidM4vljkCAymugWvf08SnS7f%2FuAwbTnTHcqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDIbjEsOj5yp0GM9jCrcAxkFznnmJ5%2B%2Bygb9wTFrJ8jN1LK5yvTsBnpKv68%2BgLapEkzEpjwlLk3DheOcxr1P7Ap%2BkWEqrtofsrfpoy4cMi2uVoUzlojN5wIJ0vgWyyB00b3ajjGgVcxKlqR8iuvWbAMhIcCHSzb24LJ7A%2FZSZ9LQmmvTesQZ6dhTQ87rKHWB3kXymImXgw1bvhbMVxFg%2BUkEbBm8enAFJl6hyTH4MS4Yy0xFdz8sXmAZ0zexv8soI93OQqBXP1856vmERiLfgFzeX6kKyePj4ebUcPOs4QmAGQYdw8KaRjudnt%2Fk96CHNsbkaScWToDVw1Cb9zQODWjU%2FA0I1cwzT0RWlOO8avfh4MyYeborobXwz67fStsvBq9UNb%2BynlKmir3l%2BLUe4LRwGZncMrjvKk3R%2BEKVFreLRL1knkG%2FirhJC0jEgYFEhN0ByDx0unvJNr6a59yoNheql7vY2seaxCgxR79c5oFDJ4vDtMjNEQcrTZ9VnQ79mrJW7DWWX6Q4sDGgeMnwRTlXG0Xhc24lfyNwJKXqhJpU2FkgtAYPdWNjzuXkpIBd8y0w4TVuVdpljBHXKbapF%2Bb%2BsPu%2B7QaT8CV2bShZULPk5Ui%2FeXEdYjZPg9EytfE6aJ6X%2FTgPqqpv0kRtMLSS8csGOqUBzI15Ydh9JzWSMxecVFCsuWNE128Js413X7YcYtFk6nOt3Gi2fLxl3a1GwhM%2BiDYdv4P4qejM9PO7aRuTNcSmDPjT4tzW0MWCR1dnoDDm6uf1CDN8rmX5jDcOsgVFF911Ry3Rhh%2Bn7O4CDuFS590qUMd5Hb4Ug5x4e0LY5kcvvJrtw4D5bFAMDah%2FHtwAJUYyrVnxxkFWu7K1UN%2FMAltWnvQQl9N7&X-Amz-Signature=b3ec6a35e97eb80e910f8e89c982093aab6e6f9bbef09739a89c8a94782c7fa4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662ALREIRN%2F20260130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260130T063520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCJWhyHVkBeoyKH4cF2Vga0Y226fmAzSQ1ro0UUIZ9LsgIgGkVbgjc1MidM4vljkCAymugWvf08SnS7f%2FuAwbTnTHcqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDIbjEsOj5yp0GM9jCrcAxkFznnmJ5%2B%2Bygb9wTFrJ8jN1LK5yvTsBnpKv68%2BgLapEkzEpjwlLk3DheOcxr1P7Ap%2BkWEqrtofsrfpoy4cMi2uVoUzlojN5wIJ0vgWyyB00b3ajjGgVcxKlqR8iuvWbAMhIcCHSzb24LJ7A%2FZSZ9LQmmvTesQZ6dhTQ87rKHWB3kXymImXgw1bvhbMVxFg%2BUkEbBm8enAFJl6hyTH4MS4Yy0xFdz8sXmAZ0zexv8soI93OQqBXP1856vmERiLfgFzeX6kKyePj4ebUcPOs4QmAGQYdw8KaRjudnt%2Fk96CHNsbkaScWToDVw1Cb9zQODWjU%2FA0I1cwzT0RWlOO8avfh4MyYeborobXwz67fStsvBq9UNb%2BynlKmir3l%2BLUe4LRwGZncMrjvKk3R%2BEKVFreLRL1knkG%2FirhJC0jEgYFEhN0ByDx0unvJNr6a59yoNheql7vY2seaxCgxR79c5oFDJ4vDtMjNEQcrTZ9VnQ79mrJW7DWWX6Q4sDGgeMnwRTlXG0Xhc24lfyNwJKXqhJpU2FkgtAYPdWNjzuXkpIBd8y0w4TVuVdpljBHXKbapF%2Bb%2BsPu%2B7QaT8CV2bShZULPk5Ui%2FeXEdYjZPg9EytfE6aJ6X%2FTgPqqpv0kRtMLSS8csGOqUBzI15Ydh9JzWSMxecVFCsuWNE128Js413X7YcYtFk6nOt3Gi2fLxl3a1GwhM%2BiDYdv4P4qejM9PO7aRuTNcSmDPjT4tzW0MWCR1dnoDDm6uf1CDN8rmX5jDcOsgVFF911Ry3Rhh%2Bn7O4CDuFS590qUMd5Hb4Ug5x4e0LY5kcvvJrtw4D5bFAMDah%2FHtwAJUYyrVnxxkFWu7K1UN%2FMAltWnvQQl9N7&X-Amz-Signature=228b103c06e1dd0678573be9349c6b09ded449930e9148a5add82fc815be4784&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
