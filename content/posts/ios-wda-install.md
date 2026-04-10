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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664CV6UILE%2F20260410%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260410T183830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJGMEQCICDYIG5YqZxgve75xqg3JgW7dd%2By5VAU%2FOjdRx%2BrCMBCAiBNGCOOJyQmZVJTU3WUHRoQGFEHqyl95%2B7gpDKLWFt38Sr%2FAwgyEAAaDDYzNzQyMzE4MzgwNSIMEF9P2jzfJ7tRJ%2Bi5KtwDH4ya%2BXJUnyGT7CZlixycCRR7x1UyFi%2FwyckHj9ZNIQzyLqpkxBNCdviEKKScrtIpq20uB9XVk3KRicEmy9AOqgpZ43lN3vUhzWcvPjjzIVC3XGvLPtcdhx24PM4vdNng%2Fnymxvf3hOAyozfND0FWwj9H7bJ4QupMH8p47geLbZ1ZXb0uYwQfaquet3TbpsxbgTblOgV8ms49bM5K9Z7az%2BTMdymJa6hrpCS2CWmwNIqNRXV6sRDSL7tWtIw7rUjskDF7Zg9G6%2B1xYj64uJiP%2BUh2ZB3H8cpf%2FO887seF5y%2F7QjAbdIg4lO1IXO%2BxWgEc9YVUrUFJzAO0s1AHQK6LBO1LakB%2FFL9Ei%2FSgzVzvgWndBTP8MZqy%2B%2F89SayHPAKviEjXpXOLUeAAahc278EscuYzuep7px11ziRMUEihxxvIPSAGvutEVJY915aumbR3msNRvaz%2BJObluRtI0n5%2BuHALWiLiKE0Y1y6RlZHzDAvLqRb%2Bu%2BzrOXxyISvzqFtbw10cpu%2FaJKAVSUsC87nv6BZE1K9AZ0Eaq2tYMi%2FeXmi8kLX8FbEGpgyNOc3swC6tJVLq%2BoJIDLbqyoAut1ygklUTMIyTk%2FkA8yl5BcLL1sEwuHvom1MJ80%2BpjsUwj8zkzgY6pgGe9FIdQWkXmC7g7SngmgYfB87DS5HlncRPrYI%2B5z7hCYQmMxM9Y%2BdhQ4JG8TC%2BlCr6TtZa8JF4UvG4yuxua6Qn%2BcZ23Wxgd7i4x3tAhyFWHiRnSE42eTDFG6uz6yBOuy%2FXB3pRI2tamZ21k1BF2qouy55rVqWRYZ%2BrFYLdZfvFvkcIZ4wZRTYhKa6cPsBHETheaogrGbOGbirYVCY5BMDLyEDoXBn5&X-Amz-Signature=af8d955acf2858cecc131899ab582884b3aa45351f49c953ff4cec3db3c158bc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664CV6UILE%2F20260410%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260410T183830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJGMEQCICDYIG5YqZxgve75xqg3JgW7dd%2By5VAU%2FOjdRx%2BrCMBCAiBNGCOOJyQmZVJTU3WUHRoQGFEHqyl95%2B7gpDKLWFt38Sr%2FAwgyEAAaDDYzNzQyMzE4MzgwNSIMEF9P2jzfJ7tRJ%2Bi5KtwDH4ya%2BXJUnyGT7CZlixycCRR7x1UyFi%2FwyckHj9ZNIQzyLqpkxBNCdviEKKScrtIpq20uB9XVk3KRicEmy9AOqgpZ43lN3vUhzWcvPjjzIVC3XGvLPtcdhx24PM4vdNng%2Fnymxvf3hOAyozfND0FWwj9H7bJ4QupMH8p47geLbZ1ZXb0uYwQfaquet3TbpsxbgTblOgV8ms49bM5K9Z7az%2BTMdymJa6hrpCS2CWmwNIqNRXV6sRDSL7tWtIw7rUjskDF7Zg9G6%2B1xYj64uJiP%2BUh2ZB3H8cpf%2FO887seF5y%2F7QjAbdIg4lO1IXO%2BxWgEc9YVUrUFJzAO0s1AHQK6LBO1LakB%2FFL9Ei%2FSgzVzvgWndBTP8MZqy%2B%2F89SayHPAKviEjXpXOLUeAAahc278EscuYzuep7px11ziRMUEihxxvIPSAGvutEVJY915aumbR3msNRvaz%2BJObluRtI0n5%2BuHALWiLiKE0Y1y6RlZHzDAvLqRb%2Bu%2BzrOXxyISvzqFtbw10cpu%2FaJKAVSUsC87nv6BZE1K9AZ0Eaq2tYMi%2FeXmi8kLX8FbEGpgyNOc3swC6tJVLq%2BoJIDLbqyoAut1ygklUTMIyTk%2FkA8yl5BcLL1sEwuHvom1MJ80%2BpjsUwj8zkzgY6pgGe9FIdQWkXmC7g7SngmgYfB87DS5HlncRPrYI%2B5z7hCYQmMxM9Y%2BdhQ4JG8TC%2BlCr6TtZa8JF4UvG4yuxua6Qn%2BcZ23Wxgd7i4x3tAhyFWHiRnSE42eTDFG6uz6yBOuy%2FXB3pRI2tamZ21k1BF2qouy55rVqWRYZ%2BrFYLdZfvFvkcIZ4wZRTYhKa6cPsBHETheaogrGbOGbirYVCY5BMDLyEDoXBn5&X-Amz-Signature=d58d365a3388180c0c6c626cdd3ed3ad2ffd77f5dc6741d4f6dd31688208e2c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
