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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664V47I53F%2F20251107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251107T181529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBffg9SGZCN7%2Fyr3qIcQspxr48SNXEsD07OymudLcTNPAiEA7fjAVIt4mW6LAoT%2Fl7Q%2BEu7pWdT9fwk4N%2BZMNWl9gXAqiAQIwv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIBiPcOObCZttQVfNircAyzptCbl2Du%2F264UtjJDvzNJuHh%2F1I80bMuLqK0VA%2BBnVfzS0aXcZkRA4zKLxv7Jep9zsZn%2BdNAom6zg%2Bqi4KMowd2G7XUEP6tDqz1UDwqrSy72f0APAJQ1jAXapQVzRYqPr%2BHF5KBaznRv%2F7kMId00tdy6A5BquNHx1AOysIV3GbyjL7IATww0MT6LcNr5FmfDUiL6yQsXlhviIdyrk0ey6S4E5f47EJYNDNPWhEryInotQxXnQG5VRhKdWPUvUk64sYen%2B%2BN7qby6pnJOM%2B3%2FE4%2FBHhtg7rrl1cuRbE4SQKoA76q%2B%2FGRzsuSaYcI9DHF46PsKde5danL5hwYgZiTVP9O3PGjNiFQkscE0Yrnf%2F%2FmdF3bDBGUcYxHfan3R0p7bo%2B9rR9MFeEBCmnqemBNirvL7ulPZoN6yJQMdod75NvgT82W%2FR4568DEcgy71WJO%2FyYx%2BEYwjTYh6Lq%2FNtOZ8sTBXYBaHk%2FA4z6N2y3ysD6xe5jLmovIfHxnisbfqHglL%2FMlGvmjtMKLouccM58RWGt1da4sTPDDXxSb%2FzaNJQkWv6OP9uvOgj5jLY8wEes9gatyXhQRcYGUEShkQcJA5l2h2b2Rb9VMFEHUFAh0aNo6znGsFxCBfo9GACMNzYuMgGOqUBLHBiYJfqcI4HG02LAGidBdzCULrsp84D0vdaH6iJNYGngyc0yH3KUXNU8CXeNN%2Beoh9MNfVcQmdj5mWyxHGJmjifH%2BH6P%2BYvFBB%2Bd7CeDEsW3pZcbskR6l4HCsaDF7LYrPdSEHV9qxKCHahO0Y3fc8OIXqAE7uow6OLFWR5sFUlabattZF1JzPMulFC91P0uwwBioRdEqdwkOkEvWgfzTd0a%2Fr%2Fe&X-Amz-Signature=b16a202a4d903e4d482da09e2aa88b321a0f6d692a67837756caaa58e8984e12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664V47I53F%2F20251107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251107T181529Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBffg9SGZCN7%2Fyr3qIcQspxr48SNXEsD07OymudLcTNPAiEA7fjAVIt4mW6LAoT%2Fl7Q%2BEu7pWdT9fwk4N%2BZMNWl9gXAqiAQIwv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIBiPcOObCZttQVfNircAyzptCbl2Du%2F264UtjJDvzNJuHh%2F1I80bMuLqK0VA%2BBnVfzS0aXcZkRA4zKLxv7Jep9zsZn%2BdNAom6zg%2Bqi4KMowd2G7XUEP6tDqz1UDwqrSy72f0APAJQ1jAXapQVzRYqPr%2BHF5KBaznRv%2F7kMId00tdy6A5BquNHx1AOysIV3GbyjL7IATww0MT6LcNr5FmfDUiL6yQsXlhviIdyrk0ey6S4E5f47EJYNDNPWhEryInotQxXnQG5VRhKdWPUvUk64sYen%2B%2BN7qby6pnJOM%2B3%2FE4%2FBHhtg7rrl1cuRbE4SQKoA76q%2B%2FGRzsuSaYcI9DHF46PsKde5danL5hwYgZiTVP9O3PGjNiFQkscE0Yrnf%2F%2FmdF3bDBGUcYxHfan3R0p7bo%2B9rR9MFeEBCmnqemBNirvL7ulPZoN6yJQMdod75NvgT82W%2FR4568DEcgy71WJO%2FyYx%2BEYwjTYh6Lq%2FNtOZ8sTBXYBaHk%2FA4z6N2y3ysD6xe5jLmovIfHxnisbfqHglL%2FMlGvmjtMKLouccM58RWGt1da4sTPDDXxSb%2FzaNJQkWv6OP9uvOgj5jLY8wEes9gatyXhQRcYGUEShkQcJA5l2h2b2Rb9VMFEHUFAh0aNo6znGsFxCBfo9GACMNzYuMgGOqUBLHBiYJfqcI4HG02LAGidBdzCULrsp84D0vdaH6iJNYGngyc0yH3KUXNU8CXeNN%2Beoh9MNfVcQmdj5mWyxHGJmjifH%2BH6P%2BYvFBB%2Bd7CeDEsW3pZcbskR6l4HCsaDF7LYrPdSEHV9qxKCHahO0Y3fc8OIXqAE7uow6OLFWR5sFUlabattZF1JzPMulFC91P0uwwBioRdEqdwkOkEvWgfzTd0a%2Fr%2Fe&X-Amz-Signature=5daf68af417e5a89f169e1e17ca23c15031efde331cb9be1f286b101791df43e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
