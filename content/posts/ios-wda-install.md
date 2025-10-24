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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2GN44JS%2F20251024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251024T061612Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAwIknFa2%2FATkmW%2BNQlF6E1yoOErXXQuZsZmYOdb2nUhAiEA9z1Ujj374Qsbr3yXad%2FXxPX5qnGXokRqzpzHWq4QYvYq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDE5%2FIY9Xe%2BoIYL4DDCrcA9YnMgTDdTS1Ag1umkuSSag5UpH3ETrKDhFi7KAq5eZZbcc68GjQkg%2Bev4bqQwd6rrxaGKI1d5%2FveIy98slZTQ5o3ksqbjUOxMs7trRkRP9kdyb0Vl0FsdsKQUngr7vKJZojRGD5REdoREQ83Z8NDwX1rX3VNF82q5gxSx6idLVupP4%2F4Y5YMJjDknZcvwIohrUrqgvhNLvzqHs%2Bt3I0lr8nBE1hVOURDl%2FM3%2Bi8wmXNMzkGBHdFEPjmLhChLywj5d1ET9ftvaPKm9F2SJCqtegx3BsIJpIixlRXbkc%2B1TbTMsWnkta%2FjQjc%2FizQXYq6xe9l0zwcqiV3B67jwnBVPLgU6aQNwfIBxYXpGSE%2Fpk56P9RrQM8ldd90ZEsbHNVsu7wwzxgGi3hBYgfXyaxdC9p6X%2BkSCdqdbv2GiPzWmaaberH31qVaKLb2y3uhi7mE9jXtDBnrKEUDBf9daAnuUJ7BZa9GNm5AQD63a8EBf3rNLQ%2FsQqgkutlkROQMj0sjWq%2BJTOoOKp%2BY7qz0%2FCJCx%2FHGjS%2Fy3XInhkjfUYhemu5kXWd2RCXO%2FtGS%2BMzZtWv8F9v9qPu0b9kqforQhI%2F2GGVJ%2BGTWHCBxSnB0naQtgZonq6Km7AfYhpoe6msUMLyh7McGOqUBuF3BiWrBNODwSN%2FqYv%2BYdljtGj8xN95EvwCIJVdvvQWrPJkTfwJieL0ePRZJ4X5Xm07elTWfju2E8Ee4nT3J7sr3C5if1P%2Fjr%2B0gNCm2OsP4b5oOUtRxRXMIEuYA26PEv9iaQa7cORKTWejBsFz3PtMQl%2B6Moz8j58ypSG8ouloFp0HFMY8FR2KGXcaV%2BGtFnEJLIlRmQkgQlDinoXTPdtV4Pb5A&X-Amz-Signature=979b3e67a077765244cf674e20e57de1cc3bc38278ffccc3c45490ece9369c19&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2GN44JS%2F20251024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251024T061612Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAwIknFa2%2FATkmW%2BNQlF6E1yoOErXXQuZsZmYOdb2nUhAiEA9z1Ujj374Qsbr3yXad%2FXxPX5qnGXokRqzpzHWq4QYvYq%2FwMIVxAAGgw2Mzc0MjMxODM4MDUiDE5%2FIY9Xe%2BoIYL4DDCrcA9YnMgTDdTS1Ag1umkuSSag5UpH3ETrKDhFi7KAq5eZZbcc68GjQkg%2Bev4bqQwd6rrxaGKI1d5%2FveIy98slZTQ5o3ksqbjUOxMs7trRkRP9kdyb0Vl0FsdsKQUngr7vKJZojRGD5REdoREQ83Z8NDwX1rX3VNF82q5gxSx6idLVupP4%2F4Y5YMJjDknZcvwIohrUrqgvhNLvzqHs%2Bt3I0lr8nBE1hVOURDl%2FM3%2Bi8wmXNMzkGBHdFEPjmLhChLywj5d1ET9ftvaPKm9F2SJCqtegx3BsIJpIixlRXbkc%2B1TbTMsWnkta%2FjQjc%2FizQXYq6xe9l0zwcqiV3B67jwnBVPLgU6aQNwfIBxYXpGSE%2Fpk56P9RrQM8ldd90ZEsbHNVsu7wwzxgGi3hBYgfXyaxdC9p6X%2BkSCdqdbv2GiPzWmaaberH31qVaKLb2y3uhi7mE9jXtDBnrKEUDBf9daAnuUJ7BZa9GNm5AQD63a8EBf3rNLQ%2FsQqgkutlkROQMj0sjWq%2BJTOoOKp%2BY7qz0%2FCJCx%2FHGjS%2Fy3XInhkjfUYhemu5kXWd2RCXO%2FtGS%2BMzZtWv8F9v9qPu0b9kqforQhI%2F2GGVJ%2BGTWHCBxSnB0naQtgZonq6Km7AfYhpoe6msUMLyh7McGOqUBuF3BiWrBNODwSN%2FqYv%2BYdljtGj8xN95EvwCIJVdvvQWrPJkTfwJieL0ePRZJ4X5Xm07elTWfju2E8Ee4nT3J7sr3C5if1P%2Fjr%2B0gNCm2OsP4b5oOUtRxRXMIEuYA26PEv9iaQa7cORKTWejBsFz3PtMQl%2B6Moz8j58ypSG8ouloFp0HFMY8FR2KGXcaV%2BGtFnEJLIlRmQkgQlDinoXTPdtV4Pb5A&X-Amz-Signature=c1f7c4541383e4d11e793e4dd14cdaee945a73fb113eadfbfbfe15a67035b975&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
