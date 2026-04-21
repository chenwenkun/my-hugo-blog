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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665DHNVQLQ%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T072052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGcaCXVzLXdlc3QtMiJHMEUCIETBZKb%2FpP%2Ba9QCVlvOboLOfLXfRiBgVr%2F4WT4n60awwAiEA2Ap0jiYy%2BEhX2x7vJFl6EYtxPJkZOqwn%2BMtz6bpfDDcq%2FwMILxAAGgw2Mzc0MjMxODM4MDUiDEZ95lBZRknit9TcQircA92m4lgE5Z0zDvD01DeyixPG0KlTGIym4Og3MuQot77dxnx1TSkStsTqD%2FwA2LL9R8p2lI89U0XB6K8mSFibmjAxDhBZZYe7hJ4R85JKbtsl%2BRhrHZStiRhnlVJEpvl%2B%2BGPYS6U34lVRfxlx4wTWhVizlUZi8cGQuitttbYInAl9G8qtQFvn2uhzUymWX75ngTlzjUWx%2BMVFCFC2mh%2FQhOUycwoKhGQJ6Q9NmbAKi6j4EF5zVGZl7X4LzqI3Njfr%2BcXd0QW4PU6JrYimsWeTe2PUfVmyZgTNhA967K28r7p%2Bl76ag4we5NCU2LCkMFYW9nrBnxJtTB5GpuMgxgpIJX858l2MfhzU%2BzkRoC68nHvgJZJ2J95kILQ43Bxh%2FElFchzdvl8sAGb6%2FCottI0dlly%2Fg%2FeiWT%2FCDbFFijhqqc2QbcUud9U0H%2BULOY1vu2SH8KAAAmqh6kdcF4r5XDW2Jf8hgBpnJmVu1abS0SSy%2B2Q%2FxjBIndRZRHRvSQDENJ7zpoj6OcgE%2Fnz%2B%2FbpNIEAO6O%2Ba3h7%2FIBiKWEuljbtai6gD0Jaiy2srMUfIp%2FeTppulPbLEJ6kqGHUc%2BWvzP1cEAQpqQ6w3pT907Ip2XjJYpzzdZfLvE5lJEw%2BQZuBmMIGunM8GOqUBRRramqaaSt1haaz20n1MU3IoKja9w794USd65z0E0rF3vuwgBKMjrsj2RaccWYJ7WLfot2ItCyKic4znT5tHFWTUx5hbuI3LQh6X3irQ0xdR8S1Kxxxil5u0W3fIy04eLe%2BoS7nO8lLA3nRHHITw0GII0Oa0Ia2Lg6VIMQ45TJp5E2ehlu7WJeuB7ck7kjastiO6NYzjpi00CsnTrqLXvuWB2jhi&X-Amz-Signature=7dd69e570cfce9ebc2a6935b697621c25ee5308f4249699599174e5cf7effa42&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665DHNVQLQ%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T072052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGcaCXVzLXdlc3QtMiJHMEUCIETBZKb%2FpP%2Ba9QCVlvOboLOfLXfRiBgVr%2F4WT4n60awwAiEA2Ap0jiYy%2BEhX2x7vJFl6EYtxPJkZOqwn%2BMtz6bpfDDcq%2FwMILxAAGgw2Mzc0MjMxODM4MDUiDEZ95lBZRknit9TcQircA92m4lgE5Z0zDvD01DeyixPG0KlTGIym4Og3MuQot77dxnx1TSkStsTqD%2FwA2LL9R8p2lI89U0XB6K8mSFibmjAxDhBZZYe7hJ4R85JKbtsl%2BRhrHZStiRhnlVJEpvl%2B%2BGPYS6U34lVRfxlx4wTWhVizlUZi8cGQuitttbYInAl9G8qtQFvn2uhzUymWX75ngTlzjUWx%2BMVFCFC2mh%2FQhOUycwoKhGQJ6Q9NmbAKi6j4EF5zVGZl7X4LzqI3Njfr%2BcXd0QW4PU6JrYimsWeTe2PUfVmyZgTNhA967K28r7p%2Bl76ag4we5NCU2LCkMFYW9nrBnxJtTB5GpuMgxgpIJX858l2MfhzU%2BzkRoC68nHvgJZJ2J95kILQ43Bxh%2FElFchzdvl8sAGb6%2FCottI0dlly%2Fg%2FeiWT%2FCDbFFijhqqc2QbcUud9U0H%2BULOY1vu2SH8KAAAmqh6kdcF4r5XDW2Jf8hgBpnJmVu1abS0SSy%2B2Q%2FxjBIndRZRHRvSQDENJ7zpoj6OcgE%2Fnz%2B%2FbpNIEAO6O%2Ba3h7%2FIBiKWEuljbtai6gD0Jaiy2srMUfIp%2FeTppulPbLEJ6kqGHUc%2BWvzP1cEAQpqQ6w3pT907Ip2XjJYpzzdZfLvE5lJEw%2BQZuBmMIGunM8GOqUBRRramqaaSt1haaz20n1MU3IoKja9w794USd65z0E0rF3vuwgBKMjrsj2RaccWYJ7WLfot2ItCyKic4znT5tHFWTUx5hbuI3LQh6X3irQ0xdR8S1Kxxxil5u0W3fIy04eLe%2BoS7nO8lLA3nRHHITw0GII0Oa0Ia2Lg6VIMQ45TJp5E2ehlu7WJeuB7ck7kjastiO6NYzjpi00CsnTrqLXvuWB2jhi&X-Amz-Signature=6560e55924236cd962f8c6585bfe6c4e2eee82d68cccf307471fcc5b3870bf5f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
