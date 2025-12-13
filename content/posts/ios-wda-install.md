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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7NFEWS%2F20251213%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251213T122030Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJIMEYCIQCN%2Flsx55K3jr3ytOSZZF2JUBaQPfehuCcFxTStJvIDVQIhAOWMmMBBf%2FhcttKMD7XZE9Zqj%2FDlPr9e2HVgQqoqZICdKv8DCBwQABoMNjM3NDIzMTgzODA1IgwH61V91nYrVug2xlsq3AMAq%2FGDrQW4RV7evvU%2By5T552T0rgGBoGD5v%2FgR680yEvNiVmZZaz3Uec5LpSZg0pvl5Cf2v1gnLRTNy001YHtwbaM1BU1hxJKV8Qs3ET6Lm8r%2BR7mGbtySYvenJvI%2B8neVD4DMreBPhE7Qg2lNSIr0DZJR8GFICIF7lkmAqq%2F06dGyCaX98Blt1oFMb%2Fextxnyaqxn3U5mxEqKiDBgaeObqVMEYQ8TrHl7O0YKtLn%2BsgZJ4spCGZ40kMTNwugBnToezkmSUT8OtySapuhqE0Jnl28rkFzmtKfdU7vaTQI4LLeit2sslnNdGgQ3L2cAqlIr5RX0UQ3e27PCKQvZlvR3WODo%2BID%2FSfWv3aaTZRIe0ZvEq31UxyhoK2pITP21ukwTY7%2BK2XkTlTvzzioap%2FvjWuQVWCHktakBefDY9Y5%2FT1iPecEZQ%2BveLp9uaR%2FOkCy6mN3ossUmN3CUd37XgHZBPq1SyXQufatLH%2FvxeVi3av8ju1jG2icFIr5SyZBLrCCZIZuH9Pxh2VAdrTcCWajbO10Y0tgrU6tdk4%2F2az3REC6vt0d03VryiXo9IXk4ld6VzStZ%2B6%2BTo4ARAxtVAJnBYGGTqJ7db00xwOYaghRQtXmLoFtfGQHlhC7SRjDpmfXJBjqkASSk24Ezj0mky2lNRPvGqRmqL5IZeD3ukAoFFFC8lfuU2cPFcIUKd9ZREtbUQnxcomnm5RX6z8tKzlBrazQdGJQNbZKGRKVbt%2FKscextv9QVdQBUf0w7OMzsFaDiMOlDmNnmSroKMOGayKGFp6jxmU7NmNB5yy0iHhqvzp8TZnY1uga0zYttYZajUlJcT9Gb40NkhFvEUsXhxTHxtb6H17UTu1rU&X-Amz-Signature=42fbe83bded887ef070622143df5f079e2d31297ee651ae9128aa1600b096ca6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7NFEWS%2F20251213%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251213T122030Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFQaCXVzLXdlc3QtMiJIMEYCIQCN%2Flsx55K3jr3ytOSZZF2JUBaQPfehuCcFxTStJvIDVQIhAOWMmMBBf%2FhcttKMD7XZE9Zqj%2FDlPr9e2HVgQqoqZICdKv8DCBwQABoMNjM3NDIzMTgzODA1IgwH61V91nYrVug2xlsq3AMAq%2FGDrQW4RV7evvU%2By5T552T0rgGBoGD5v%2FgR680yEvNiVmZZaz3Uec5LpSZg0pvl5Cf2v1gnLRTNy001YHtwbaM1BU1hxJKV8Qs3ET6Lm8r%2BR7mGbtySYvenJvI%2B8neVD4DMreBPhE7Qg2lNSIr0DZJR8GFICIF7lkmAqq%2F06dGyCaX98Blt1oFMb%2Fextxnyaqxn3U5mxEqKiDBgaeObqVMEYQ8TrHl7O0YKtLn%2BsgZJ4spCGZ40kMTNwugBnToezkmSUT8OtySapuhqE0Jnl28rkFzmtKfdU7vaTQI4LLeit2sslnNdGgQ3L2cAqlIr5RX0UQ3e27PCKQvZlvR3WODo%2BID%2FSfWv3aaTZRIe0ZvEq31UxyhoK2pITP21ukwTY7%2BK2XkTlTvzzioap%2FvjWuQVWCHktakBefDY9Y5%2FT1iPecEZQ%2BveLp9uaR%2FOkCy6mN3ossUmN3CUd37XgHZBPq1SyXQufatLH%2FvxeVi3av8ju1jG2icFIr5SyZBLrCCZIZuH9Pxh2VAdrTcCWajbO10Y0tgrU6tdk4%2F2az3REC6vt0d03VryiXo9IXk4ld6VzStZ%2B6%2BTo4ARAxtVAJnBYGGTqJ7db00xwOYaghRQtXmLoFtfGQHlhC7SRjDpmfXJBjqkASSk24Ezj0mky2lNRPvGqRmqL5IZeD3ukAoFFFC8lfuU2cPFcIUKd9ZREtbUQnxcomnm5RX6z8tKzlBrazQdGJQNbZKGRKVbt%2FKscextv9QVdQBUf0w7OMzsFaDiMOlDmNnmSroKMOGayKGFp6jxmU7NmNB5yy0iHhqvzp8TZnY1uga0zYttYZajUlJcT9Gb40NkhFvEUsXhxTHxtb6H17UTu1rU&X-Amz-Signature=11b6aabdf231d17c4b6301af00049393f5d5c4532a2fd17c289ad182be0fd6aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
