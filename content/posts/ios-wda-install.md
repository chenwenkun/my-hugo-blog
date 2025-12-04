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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RT4IXZAO%2F20251204%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251204T181847Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCOUche5%2FTiQPNtkDeSiE1sTXan%2F%2Ffq6zqFjJdYDD1mcAIhAIg4lWax4liouIftoT%2BNc%2BhLmYcjiMefxN4N1FET%2Fo3wKv8DCEsQABoMNjM3NDIzMTgzODA1IgxSLWpSESswyPY725wq3AMMG3K%2BMG6XtKAx5CVJwwSvTIsPG%2BePQUygPS9REK31pjAIteKbxUWtJF56dG1u9bLkm1yXbvQCO6nzkCI4bHn%2FexIGGm1BytCA2veYEBk6jpsJ12y2eXKzgpKz2q9P%2FWRsCGkVCDVDOF3fGko4oqdMtkVbYUsz5dLzv166z%2FZ%2FgpmMoGqaKc8is9agZMM6NKooy0Ys8PKwiW5EIEpliMoUo4jOyIyqb8ZFqm2Xh1sglnWuj8d3YuhkXLQBu23IAafuvny%2FTPDtALVUwmv91paJZsowuHlelVbOEEnlyui2MbORuTdX%2BRBJAMBG4Ipo9wLAgkBYu1aqRQFjE%2B0Eo7Cv86RoH5BN7vgQiHW7tYPt5dCOpJStu8Pka7s0Pvi3zYsPkdf8zIp%2BDdV9dd1sfs9q%2F6sUPZa9rBuyKpDZdrXGcDg%2F8hzMPTIlrwI8YqDOyQZBNUKf4hl%2Bk8UHpuhkxoNzp8KeYsW5wIyrxJ7J8dEXpicQTuM8XZITk3tVxjM1XW97saINupf8946x3%2BN1isMqUaqyhsByjEE1zQt%2BHGBZy6Vn7bygaBmYwYuS7JpAgbhDCmpupq7VzvGoW0F21Ra7zv1cMggavp9xLWX1x1Dz%2FhSwMyJnGLozmuNvbDCrl8fJBjqkAQV8v1yA5yH7PJw2VkAM2Vc1iEbbmTZvo6fR7b7u6n9RKa2I7csp34aRDYTRhFTbHA%2B3RzibCmEksO4DbhYa%2BgD%2FYqzBoRHw0vfPr1OiPcjzvn9z2WM%2Bva7HGgGjTBpd6ccYTKG6yjJ3fwX8wSgDIDXBgerLfqhQLJ2%2Bq%2FUDvq1%2Byd2b4jE2Qc1wlox92Gr%2FLb7lHb37nw48%2B4t2QwzYv1jzHH03&X-Amz-Signature=5accb1e5f282929a454189435ab68e7ea63777cd7d5b6da4172fa9392ba23b43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RT4IXZAO%2F20251204%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251204T181847Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCOUche5%2FTiQPNtkDeSiE1sTXan%2F%2Ffq6zqFjJdYDD1mcAIhAIg4lWax4liouIftoT%2BNc%2BhLmYcjiMefxN4N1FET%2Fo3wKv8DCEsQABoMNjM3NDIzMTgzODA1IgxSLWpSESswyPY725wq3AMMG3K%2BMG6XtKAx5CVJwwSvTIsPG%2BePQUygPS9REK31pjAIteKbxUWtJF56dG1u9bLkm1yXbvQCO6nzkCI4bHn%2FexIGGm1BytCA2veYEBk6jpsJ12y2eXKzgpKz2q9P%2FWRsCGkVCDVDOF3fGko4oqdMtkVbYUsz5dLzv166z%2FZ%2FgpmMoGqaKc8is9agZMM6NKooy0Ys8PKwiW5EIEpliMoUo4jOyIyqb8ZFqm2Xh1sglnWuj8d3YuhkXLQBu23IAafuvny%2FTPDtALVUwmv91paJZsowuHlelVbOEEnlyui2MbORuTdX%2BRBJAMBG4Ipo9wLAgkBYu1aqRQFjE%2B0Eo7Cv86RoH5BN7vgQiHW7tYPt5dCOpJStu8Pka7s0Pvi3zYsPkdf8zIp%2BDdV9dd1sfs9q%2F6sUPZa9rBuyKpDZdrXGcDg%2F8hzMPTIlrwI8YqDOyQZBNUKf4hl%2Bk8UHpuhkxoNzp8KeYsW5wIyrxJ7J8dEXpicQTuM8XZITk3tVxjM1XW97saINupf8946x3%2BN1isMqUaqyhsByjEE1zQt%2BHGBZy6Vn7bygaBmYwYuS7JpAgbhDCmpupq7VzvGoW0F21Ra7zv1cMggavp9xLWX1x1Dz%2FhSwMyJnGLozmuNvbDCrl8fJBjqkAQV8v1yA5yH7PJw2VkAM2Vc1iEbbmTZvo6fR7b7u6n9RKa2I7csp34aRDYTRhFTbHA%2B3RzibCmEksO4DbhYa%2BgD%2FYqzBoRHw0vfPr1OiPcjzvn9z2WM%2Bva7HGgGjTBpd6ccYTKG6yjJ3fwX8wSgDIDXBgerLfqhQLJ2%2Bq%2FUDvq1%2Byd2b4jE2Qc1wlox92Gr%2FLb7lHb37nw48%2B4t2QwzYv1jzHH03&X-Amz-Signature=eb6fcbce153b469e360021dfb0fab33d4710a149692f24a443475df95e9cabb9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
