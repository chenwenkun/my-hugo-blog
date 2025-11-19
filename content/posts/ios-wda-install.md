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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SG3UEV7%2F20251119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251119T061702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIQDNhEnLld9Kzgxr6wee0sDvpPZ1%2FhfZNcrradEGRBPktQIgAq8m0qOiUEBvSiKLv8M32f3wQPiaLBilRFGWqnWicV0qiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA0JjOLScRl759w6CyrcA36drsExsYiRE7Xm%2FOLRh2LuXSjJZrporoGNhT96umxabihzn%2FgDd4n4g1LNblPDu%2BXMal57B3Xn9Lm8pzprOm0FtNAy4ZoFiaWCqKgKYXEiHQlteSRW46uoegcX%2FqS0I0n1%2FZUxmOTdqrQqcmuNs%2FCc4wPQcJOFroKVlVvUrRPKzZWgsVdXKlhc2OfaM7lMUrAuQK6VjN3kciS7LAx0vePFPhpMXj8VWWkbyY1LVWLzrBEogi%2Buw6nZmroOdhdlL5cOWGXCaZwPMb3I7f9bvI%2FYnCzyVvA82wOBIitcLuKCJBMmzKx9y50pdrBrZ%2BQYQXxJEZtLw5iM7hxb%2BhND6rX78KhgZ5SogayCg66pzVzhhMWpJ0I1zwg%2FWN5%2FSxm2do7DqSawgHjal2cJs7T0N%2Bn1bGAvV7Fu7ll9FjeM0l3SE2P%2BpFaCSSMUkjvdLmYt03reomZYH2rCAQwXT1v6d%2FmMeldU%2BNC12SYdwJaHxwHvU4I1IAiBPshew2FKcGDhL%2F20Xh1yACWTDjUAyVPQuZ03F6I%2FaR1RjRt4NEjDnvaEnRvDUd86KWkeeFAkM3L9tI0lxmX2JDk9KMavAMayff%2BuRmfju27CdrAnezcuMrTlUVdP3DDMoVBMcIZfMOyo9cgGOqUBHkIAKltOIHduRQNsfo7OZ4Tx9aZcJVE0a7isGmmAV2wuySSphlouG%2B97HELVQF3e7MdNmnVknYdQzPe2P7mMNXYOyksBQZR9O%2Flt%2BCzQhTFtMfFwI%2FmNDATdnCIpMqC72upc4WoCvslH3f8mybHT6AZstH7LjwQvWgzdeTK5%2FQEN6D3zB%2BV3asMeu8HF6g10%2B3I1zSW2xXlc688D%2F61FJWjwgays&X-Amz-Signature=414e12cc9af38f2e49023ce64b8c0a8cc2555c59c0b8e77170325e998a4656a0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SG3UEV7%2F20251119%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251119T061702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA4aCXVzLXdlc3QtMiJHMEUCIQDNhEnLld9Kzgxr6wee0sDvpPZ1%2FhfZNcrradEGRBPktQIgAq8m0qOiUEBvSiKLv8M32f3wQPiaLBilRFGWqnWicV0qiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA0JjOLScRl759w6CyrcA36drsExsYiRE7Xm%2FOLRh2LuXSjJZrporoGNhT96umxabihzn%2FgDd4n4g1LNblPDu%2BXMal57B3Xn9Lm8pzprOm0FtNAy4ZoFiaWCqKgKYXEiHQlteSRW46uoegcX%2FqS0I0n1%2FZUxmOTdqrQqcmuNs%2FCc4wPQcJOFroKVlVvUrRPKzZWgsVdXKlhc2OfaM7lMUrAuQK6VjN3kciS7LAx0vePFPhpMXj8VWWkbyY1LVWLzrBEogi%2Buw6nZmroOdhdlL5cOWGXCaZwPMb3I7f9bvI%2FYnCzyVvA82wOBIitcLuKCJBMmzKx9y50pdrBrZ%2BQYQXxJEZtLw5iM7hxb%2BhND6rX78KhgZ5SogayCg66pzVzhhMWpJ0I1zwg%2FWN5%2FSxm2do7DqSawgHjal2cJs7T0N%2Bn1bGAvV7Fu7ll9FjeM0l3SE2P%2BpFaCSSMUkjvdLmYt03reomZYH2rCAQwXT1v6d%2FmMeldU%2BNC12SYdwJaHxwHvU4I1IAiBPshew2FKcGDhL%2F20Xh1yACWTDjUAyVPQuZ03F6I%2FaR1RjRt4NEjDnvaEnRvDUd86KWkeeFAkM3L9tI0lxmX2JDk9KMavAMayff%2BuRmfju27CdrAnezcuMrTlUVdP3DDMoVBMcIZfMOyo9cgGOqUBHkIAKltOIHduRQNsfo7OZ4Tx9aZcJVE0a7isGmmAV2wuySSphlouG%2B97HELVQF3e7MdNmnVknYdQzPe2P7mMNXYOyksBQZR9O%2Flt%2BCzQhTFtMfFwI%2FmNDATdnCIpMqC72upc4WoCvslH3f8mybHT6AZstH7LjwQvWgzdeTK5%2FQEN6D3zB%2BV3asMeu8HF6g10%2B3I1zSW2xXlc688D%2F61FJWjwgays&X-Amz-Signature=fa230977f970fb94f8d372ae8a3d9f4cebe133ece36e68b73876cbc6609b956c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
