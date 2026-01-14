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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ZOQWRDX%2F20260114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260114T181953Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJIMEYCIQCEsmL7TgkE2o09YOp6KD3R%2BD6dNyfpyzjHZm4aerc%2F0QIhALZ2i5SxnKeVUM3xcasOIuOJGEVU%2BjrRKapEB6iux3KEKv8DCCMQABoMNjM3NDIzMTgzODA1Igx3Snn4Ll%2BZRENvR%2F0q3AO1Z4UC07fUumwvB9NIj%2FKxRQyTaJ%2FBpTS3UNUPl16LJ1b0f5ucUkoqkp4nocUMzT2cp6FwY1QnrbrOzsvly0LICN5FZU%2B%2BFlh82svrJPPSCyOjNGgQtMuPX5Cma030GOi7KMxi0db49NAAE%2Fo7yvk8aVDT2s%2FUI%2FwOTMJZWLptnQGDzywLFGxHujIP5%2F0RRn7E4R%2FcvM04sChrbsKwKlhkra8L2%2FTSf4xqqcYdaGktnwVnax4wM6mDrXwj1I7TGe5EgtH5AXsJBeZgXVStpFaMKcUzHcvsA%2B7ZlnXemABlNWcl0m2gIkWH7DEg042UPGlQBuc%2BczRNko2de2oXEyMVGIkiKMSyCNCr2Rm0FstewE2uHMXd0pJ3XskVPyAzEVeS3JCf44Kq1kiIBxw3y4HGZ4VpP5UKekg1ONGQWzJ1%2BgAybvuBv13dShhOb%2B7Bl1JQQNJI2luam%2BNnH8WeRn%2BNPEwgIhkkahSa3r9K1Z3xNIJWrLX3VzxbrOJ9LyFyepSWf%2BbQFNl%2FrWksUfWyJqysZzdkBwh2MyTAYQy6gr%2FBaMWtzow24hV7IWIawuH%2F1GVlaAQekrMb%2BYMIFQUnDVK8QCLCpFZcrdHGZFpUjB7zQCjv52JDubhGlUTGUDDGqp%2FLBjqkAVm%2BaxrKeGubpXwwGvCdKdqLR1qfnHdiaiQYSVy7y5l2rJvSj3xUso%2FstJiw6079WjRn%2FsfkLrp1lIBAf71Q8XZCjdywWdiqHSXv8IQ34q1bWFpx0LadyRByGVcnhtPdoGn%2BSRCsD%2F5oNewkMbFABtzZSpAMWCHMbkDrH06hTfLOSXabAT57Qi1s3msqKhBQ6bhQXrmNRNlWV%2FUcJnHz4lgsXK0u&X-Amz-Signature=b280d9f84b4723757e0481ac6ec4ec9f323c42e750d04c9ebece3249e0041f13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ZOQWRDX%2F20260114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260114T181953Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFoaCXVzLXdlc3QtMiJIMEYCIQCEsmL7TgkE2o09YOp6KD3R%2BD6dNyfpyzjHZm4aerc%2F0QIhALZ2i5SxnKeVUM3xcasOIuOJGEVU%2BjrRKapEB6iux3KEKv8DCCMQABoMNjM3NDIzMTgzODA1Igx3Snn4Ll%2BZRENvR%2F0q3AO1Z4UC07fUumwvB9NIj%2FKxRQyTaJ%2FBpTS3UNUPl16LJ1b0f5ucUkoqkp4nocUMzT2cp6FwY1QnrbrOzsvly0LICN5FZU%2B%2BFlh82svrJPPSCyOjNGgQtMuPX5Cma030GOi7KMxi0db49NAAE%2Fo7yvk8aVDT2s%2FUI%2FwOTMJZWLptnQGDzywLFGxHujIP5%2F0RRn7E4R%2FcvM04sChrbsKwKlhkra8L2%2FTSf4xqqcYdaGktnwVnax4wM6mDrXwj1I7TGe5EgtH5AXsJBeZgXVStpFaMKcUzHcvsA%2B7ZlnXemABlNWcl0m2gIkWH7DEg042UPGlQBuc%2BczRNko2de2oXEyMVGIkiKMSyCNCr2Rm0FstewE2uHMXd0pJ3XskVPyAzEVeS3JCf44Kq1kiIBxw3y4HGZ4VpP5UKekg1ONGQWzJ1%2BgAybvuBv13dShhOb%2B7Bl1JQQNJI2luam%2BNnH8WeRn%2BNPEwgIhkkahSa3r9K1Z3xNIJWrLX3VzxbrOJ9LyFyepSWf%2BbQFNl%2FrWksUfWyJqysZzdkBwh2MyTAYQy6gr%2FBaMWtzow24hV7IWIawuH%2F1GVlaAQekrMb%2BYMIFQUnDVK8QCLCpFZcrdHGZFpUjB7zQCjv52JDubhGlUTGUDDGqp%2FLBjqkAVm%2BaxrKeGubpXwwGvCdKdqLR1qfnHdiaiQYSVy7y5l2rJvSj3xUso%2FstJiw6079WjRn%2FsfkLrp1lIBAf71Q8XZCjdywWdiqHSXv8IQ34q1bWFpx0LadyRByGVcnhtPdoGn%2BSRCsD%2F5oNewkMbFABtzZSpAMWCHMbkDrH06hTfLOSXabAT57Qi1s3msqKhBQ6bhQXrmNRNlWV%2FUcJnHz4lgsXK0u&X-Amz-Signature=dd602fc433b95e99905fe3bddfa858462116b83a417f986754b7ad55fcfa38bb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
