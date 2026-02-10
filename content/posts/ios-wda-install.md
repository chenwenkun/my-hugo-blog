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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3XWDSR6%2F20260210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260210T185315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEZNgWkbIPjPn42oPfhlGYe4r9ghOk09ib12weWUOd1YAiEAi4uySRVTkq%2B2IQMpeIMOeCvsQXcf%2Bw3E9%2F%2FOnKwoL68qiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDNZCoQk47dYbaDJESrcAxZasItA%2BglrHRLYf%2Fiw613leYpHz56ajWPPfoQTd5B%2FQZSqRcKkmPHUmtG3qrBkk7ypxkbsPlbcZlpd%2BDLMSBc%2FnJwGJbzCrkq%2BEipNqGg2MDXrnauYA8Pg7dpzx5SHQ%2FVliu2iKzIk4FjHpfoQPm7n9c3T%2Fxsnza%2FBt4CSXAazXS2p4%2FP%2Bu7nsZXvq5WDD4x89KA3cpDao53ADQrtIIH87D2Zp3f%2BIYK4c520dvguGXDZJw2CQKd1UE4K0uffsPg6ODP2WodL9vjP%2BzFzTarJlLaiGgSU9tD1mKLplrXgJRyVmrCDZi1jVYodem1tlThos7leprVSxj0SZCveUdYZv9QbIMvlTpE7knyJ%2BSsQLZCjFUooKR2WGv%2FcCQ0f81Oqqcdb09iDv8Mt2iB5qla3TzmxLj0YecsqBya%2FnrA85%2FGoFu5siQ0N%2FtYGJUZQKRAqbifZlo9zTNVIau1J%2FgnwkSm5zxHi8%2F%2BNdehWXtLi2c1y1w2jnQbzaxwxgfTChhI3KWuzrHbvZEtq5wUlkZCJYdPx%2Bylv%2FkI9jnaLApxoxBG0k7yND%2BiEzG1ylogcvLe1Vk1tY4QHBN0UPwFnt4ONme1Dq6dcf01XZoKDpiAbuFCOtUMwehqo57QPJMMPdrcwGOqUB3AGOuF3MB7mqEUvLxk9qrLhs6zRgyLRxokSpvR48MIji3PvYts8uFQw0bm6ByzWZKlNQL%2FmyO9Dfb6xyeTNpbVY3e97cuFVJEpvXO6dXDc03dmF5wmU67MVeDRih%2FNpqwrIrLZehqEqnVWH6rxR4MViiZy%2BRCqg5%2FKfJrMHDa6p37fGHYJaatdG%2FFUjrFilYwhyciPH4xCUwn%2FtAHMAbOHZJStcM&X-Amz-Signature=d4665c1231e1fe32cc570a8245578e594d0b12b8dfbff72fd75e1539796b8612&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3XWDSR6%2F20260210%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260210T185315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEZNgWkbIPjPn42oPfhlGYe4r9ghOk09ib12weWUOd1YAiEAi4uySRVTkq%2B2IQMpeIMOeCvsQXcf%2Bw3E9%2F%2FOnKwoL68qiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDNZCoQk47dYbaDJESrcAxZasItA%2BglrHRLYf%2Fiw613leYpHz56ajWPPfoQTd5B%2FQZSqRcKkmPHUmtG3qrBkk7ypxkbsPlbcZlpd%2BDLMSBc%2FnJwGJbzCrkq%2BEipNqGg2MDXrnauYA8Pg7dpzx5SHQ%2FVliu2iKzIk4FjHpfoQPm7n9c3T%2Fxsnza%2FBt4CSXAazXS2p4%2FP%2Bu7nsZXvq5WDD4x89KA3cpDao53ADQrtIIH87D2Zp3f%2BIYK4c520dvguGXDZJw2CQKd1UE4K0uffsPg6ODP2WodL9vjP%2BzFzTarJlLaiGgSU9tD1mKLplrXgJRyVmrCDZi1jVYodem1tlThos7leprVSxj0SZCveUdYZv9QbIMvlTpE7knyJ%2BSsQLZCjFUooKR2WGv%2FcCQ0f81Oqqcdb09iDv8Mt2iB5qla3TzmxLj0YecsqBya%2FnrA85%2FGoFu5siQ0N%2FtYGJUZQKRAqbifZlo9zTNVIau1J%2FgnwkSm5zxHi8%2F%2BNdehWXtLi2c1y1w2jnQbzaxwxgfTChhI3KWuzrHbvZEtq5wUlkZCJYdPx%2Bylv%2FkI9jnaLApxoxBG0k7yND%2BiEzG1ylogcvLe1Vk1tY4QHBN0UPwFnt4ONme1Dq6dcf01XZoKDpiAbuFCOtUMwehqo57QPJMMPdrcwGOqUB3AGOuF3MB7mqEUvLxk9qrLhs6zRgyLRxokSpvR48MIji3PvYts8uFQw0bm6ByzWZKlNQL%2FmyO9Dfb6xyeTNpbVY3e97cuFVJEpvXO6dXDc03dmF5wmU67MVeDRih%2FNpqwrIrLZehqEqnVWH6rxR4MViiZy%2BRCqg5%2FKfJrMHDa6p37fGHYJaatdG%2FFUjrFilYwhyciPH4xCUwn%2FtAHMAbOHZJStcM&X-Amz-Signature=7c2bab6f1c3075337f5f9e64b0708b4ae30859382e3adc7c24d5cc5bed9ad456&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
