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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X24NH2KY%2F20260321%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260321T122632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGrgYGw7nwTktqepddNYs6a4qyHgwWe1d61G00utGo7%2FAiB%2BMqHHBqC8EYPK9dj2qOI6NG5gw2l94wqmsXQ3ZqwsRyr%2FAwhKEAAaDDYzNzQyMzE4MzgwNSIM%2FbCG7mR7Vptd%2BX9wKtwDSBjcFrcupULYsscCft%2FlAU3%2FtrascL4W26Y%2F0EG3DPRWifQUfgWdVYqWZcBtVP3sBixa9jI8hjmu9qiFc%2F%2Fkhq9bIS5SjIFI5%2FWaN5q8Qe74LPLLizelubQCXRZbA6C1wEEKqq0QSYcZcYGkSyrnTkZ6M%2Fqcm%2Fjgd8E4go1ZGXQlV9TB0dB0J0lgSzUukW26klI%2FCQpaHUnjmhiKWup9SCHxVpnQZnx%2Fzud2unbtEpHbvBnXAgnWOT4q55w9iN98QJyIK74MvfmIaB6uQQ9J4L25BIPnpuOec14TAfYMdjfWPUekZUTukrtDsKnLa9yS%2Fb1u1A6%2BbKRkTBIP5yeC%2B3B4XsPgMGkTgIJoRYypqcdmC%2BlMN7OwNT%2BZI75QYEa12xNx4gGlDmhb9laGyyW5GBzhtH4m4zKbC6X8PcBEzzERznnC%2F2Morq1OFgaf1%2BB9wjPYUf70DpUW7dxuth4CFAkreuLw9G7mAagIUkD1%2BAKvz6LNqG2qHX1vmkAb2bg2tESOkX2%2BqlqUJpsBV7xgp0JYWVlsHQhtRaneQ1jc88rqXcqD2bhap9mCPhY3oceK9FlkDpdEQYCgNJZKXJHz%2B8oY%2B984dKoa%2F%2B21Q42ViTYmYQRjPKfk8TwRNnAwxrT5zQY6pgGM32HqFSEuxDaP76BUjmiz0VRLt8bCt1vvr5yi9kD0wprJJkZtlBTyx5Q%2F1N1BPU5yUbdkR7MJGwBlLYZZh1qYbG90LTJl0Q3Tj0OWPX6oEYBsu0SeXd%2B1q7Z1P2S2xw5m2nax3VY3k%2FFKiibDev54b7FJTx2dberB5ni5rReITxyKOcxCy5vkqK6rE3sBONjiQfZukJQPg4hCD0Q%2F0XUKVVySINvl&X-Amz-Signature=8725f8765619532ff857bcecc571b4ffc7a7ce4c37aba5431bdc9a1f818c855c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X24NH2KY%2F20260321%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260321T122632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGrgYGw7nwTktqepddNYs6a4qyHgwWe1d61G00utGo7%2FAiB%2BMqHHBqC8EYPK9dj2qOI6NG5gw2l94wqmsXQ3ZqwsRyr%2FAwhKEAAaDDYzNzQyMzE4MzgwNSIM%2FbCG7mR7Vptd%2BX9wKtwDSBjcFrcupULYsscCft%2FlAU3%2FtrascL4W26Y%2F0EG3DPRWifQUfgWdVYqWZcBtVP3sBixa9jI8hjmu9qiFc%2F%2Fkhq9bIS5SjIFI5%2FWaN5q8Qe74LPLLizelubQCXRZbA6C1wEEKqq0QSYcZcYGkSyrnTkZ6M%2Fqcm%2Fjgd8E4go1ZGXQlV9TB0dB0J0lgSzUukW26klI%2FCQpaHUnjmhiKWup9SCHxVpnQZnx%2Fzud2unbtEpHbvBnXAgnWOT4q55w9iN98QJyIK74MvfmIaB6uQQ9J4L25BIPnpuOec14TAfYMdjfWPUekZUTukrtDsKnLa9yS%2Fb1u1A6%2BbKRkTBIP5yeC%2B3B4XsPgMGkTgIJoRYypqcdmC%2BlMN7OwNT%2BZI75QYEa12xNx4gGlDmhb9laGyyW5GBzhtH4m4zKbC6X8PcBEzzERznnC%2F2Morq1OFgaf1%2BB9wjPYUf70DpUW7dxuth4CFAkreuLw9G7mAagIUkD1%2BAKvz6LNqG2qHX1vmkAb2bg2tESOkX2%2BqlqUJpsBV7xgp0JYWVlsHQhtRaneQ1jc88rqXcqD2bhap9mCPhY3oceK9FlkDpdEQYCgNJZKXJHz%2B8oY%2B984dKoa%2F%2B21Q42ViTYmYQRjPKfk8TwRNnAwxrT5zQY6pgGM32HqFSEuxDaP76BUjmiz0VRLt8bCt1vvr5yi9kD0wprJJkZtlBTyx5Q%2F1N1BPU5yUbdkR7MJGwBlLYZZh1qYbG90LTJl0Q3Tj0OWPX6oEYBsu0SeXd%2B1q7Z1P2S2xw5m2nax3VY3k%2FFKiibDev54b7FJTx2dberB5ni5rReITxyKOcxCy5vkqK6rE3sBONjiQfZukJQPg4hCD0Q%2F0XUKVVySINvl&X-Amz-Signature=ded6c19bbde61d9126d1c45155828ee893db4ced9ba3171e5c9e5a5cf7b52687&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
