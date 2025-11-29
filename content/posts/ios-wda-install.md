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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666PBBFZ5I%2F20251129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251129T181455Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAkaCXVzLXdlc3QtMiJGMEQCIEjklOnjlZC8klGH9QH%2F%2BQBSVYltr8xMopjWmthJwaC7AiAMWYDrBmcRZrfwmdr%2Fz1Fb6KRcbJHWnl40n2RB9r4D4SqIBAjR%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMC5rdTGT7abTU5o3TKtwDVyNPMjd8q8oUedb24xiTe%2B%2F%2BZB%2BgzMl01%2BWGCMD0kYCQ4AaUG%2FZelqcC1nOMmJiKfXRoSzMDGPjfgp%2Fy7Liq7sq96tp7%2BdO5E0Bk93nvqfYvuJ%2BwmAj7W3LNHtrl0AQMCksqNQIyF4WbrcZrbnYPsUj2vCL5j29m6LHzwZwtjYrYmY2lCHXPaMlH0%2FK2PmhUeFXfg3SEFaFb6Pqq65Smkso%2BDknyWY6ea%2B6JfJO7NiHjLPxL%2FIWNWLW76b8ba8wRKz7M%2Fw06Fv0q1eRo%2F%2FoCh5BPxnuArNaie9azLwSOR74dUyU91dNBfNFfTOOMzxURTQ%2F9fUE6%2BUNiPSqmvRA2hEI4fOPOpFMrZ%2BDxOXFqw1NRMtQYErzAQmDmEeCMr%2Fg1EtAm%2FDWydR31d48rLapp%2BPwZeSPt0xB%2FrIpv0GsXR6Nxm%2BxZqaYZn6xpZVch2tcCNMDTd%2B2ccY3oIHWWTppxr2c7wB8aFTOtXKfC4nQ2Q0oH0dj%2F6Ldd5%2BnA6L2tTutaG7N3WU6WFWkHlQhG3ejVC7Pmeql%2BSl%2FNLx9uYv4lHZ2%2Bw3i9jgayatsccQN%2BO%2BICoxeAjnrmsjbt4m3%2Fi5Wi%2FMjyKMtbVofL2iztN2MCzuf2hjqhcetbC8CgNJ0w9bmsyQY6pgGZmlS5BLKmhuLLgmgcAMzQc%2B8pcD%2Bo8G5UQdUTvoxkp5q%2Fki7RqlqbzMd60ADx%2F6lTysBR94zUCiZq9AXvMnw0I9l3biewyq15pI4MNfs2QmQowqyNzBj%2F2czX5WzMqxjGnmCw%2FX05SINvQpO18XvDi8EQmKu1q%2FPI6z1YNeFOjAMDkDRdfxW5rk2wcyM0oc5TUp8uf%2B3dKv5NUrJCtkYP%2BzJF2bbk&X-Amz-Signature=ab897511630be119e9771e8d863962b7a0610727f3cfe674e75baf87570a69af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666PBBFZ5I%2F20251129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251129T181455Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAkaCXVzLXdlc3QtMiJGMEQCIEjklOnjlZC8klGH9QH%2F%2BQBSVYltr8xMopjWmthJwaC7AiAMWYDrBmcRZrfwmdr%2Fz1Fb6KRcbJHWnl40n2RB9r4D4SqIBAjR%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMC5rdTGT7abTU5o3TKtwDVyNPMjd8q8oUedb24xiTe%2B%2F%2BZB%2BgzMl01%2BWGCMD0kYCQ4AaUG%2FZelqcC1nOMmJiKfXRoSzMDGPjfgp%2Fy7Liq7sq96tp7%2BdO5E0Bk93nvqfYvuJ%2BwmAj7W3LNHtrl0AQMCksqNQIyF4WbrcZrbnYPsUj2vCL5j29m6LHzwZwtjYrYmY2lCHXPaMlH0%2FK2PmhUeFXfg3SEFaFb6Pqq65Smkso%2BDknyWY6ea%2B6JfJO7NiHjLPxL%2FIWNWLW76b8ba8wRKz7M%2Fw06Fv0q1eRo%2F%2FoCh5BPxnuArNaie9azLwSOR74dUyU91dNBfNFfTOOMzxURTQ%2F9fUE6%2BUNiPSqmvRA2hEI4fOPOpFMrZ%2BDxOXFqw1NRMtQYErzAQmDmEeCMr%2Fg1EtAm%2FDWydR31d48rLapp%2BPwZeSPt0xB%2FrIpv0GsXR6Nxm%2BxZqaYZn6xpZVch2tcCNMDTd%2B2ccY3oIHWWTppxr2c7wB8aFTOtXKfC4nQ2Q0oH0dj%2F6Ldd5%2BnA6L2tTutaG7N3WU6WFWkHlQhG3ejVC7Pmeql%2BSl%2FNLx9uYv4lHZ2%2Bw3i9jgayatsccQN%2BO%2BICoxeAjnrmsjbt4m3%2Fi5Wi%2FMjyKMtbVofL2iztN2MCzuf2hjqhcetbC8CgNJ0w9bmsyQY6pgGZmlS5BLKmhuLLgmgcAMzQc%2B8pcD%2Bo8G5UQdUTvoxkp5q%2Fki7RqlqbzMd60ADx%2F6lTysBR94zUCiZq9AXvMnw0I9l3biewyq15pI4MNfs2QmQowqyNzBj%2F2czX5WzMqxjGnmCw%2FX05SINvQpO18XvDi8EQmKu1q%2FPI6z1YNeFOjAMDkDRdfxW5rk2wcyM0oc5TUp8uf%2B3dKv5NUrJCtkYP%2BzJF2bbk&X-Amz-Signature=a4fe5cfc7ff587bca319ecb59c356ab09c86bcb252b20b4104ca4b549168cd6e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
