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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667BYJQ4MW%2F20251215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251215T181830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDYQgvhjBQBbA3viHHw7okVu5JjxJwP7olDmz8Em4oQigIgdo%2FKGUsf1kfg8vi8DtjTivAa3Zeeh%2FGnbXoWVDbSe9gq%2FwMIUxAAGgw2Mzc0MjMxODM4MDUiDH97pig%2FBrb8wm0gCSrcA%2BZiwIIbk%2FroJpubzM60ukNdVzyjNKtdXEMTvyD12YdPOL08Snihy%2FYp36FmgCN4KqylLMVNDD5ZAxhTY8edfLX36%2FG8aU0CJtACdAK1LD5LhvlTbuRJk5ZwBcgoI1%2Fk4QTezbd39OX8MbYm2HHz2tC0y4I3eaoftiPwuXGiaV0hP8C4ghWP2ZVV8%2BxCzedhm7fCwK88oUQ0GHo0fZ54BFVNFD3LFv3%2FWCU7czYA75a6PgbvMwD7e7GWML49ND11c7hYOJWcU%2FJx%2BQphM37ZtNFOQfPrruzmj5BYPe%2BK1dUryNfdcpMnvovZ%2FmAlOG3l6ThXrkk01ERBsjvhkQeT8AmMgZRASxD31%2FfP%2F7eVS4PpSdXi5rk1%2Ba0Z7pQfFoQARjDbQgbtAFInSSiIWwQ5K9amJMMHbgfMZEVScLGe15nA5pnQ6zLPuYsKIXY49UBkcMEz6JICODZwQIVYe9Xz3gAE4Axhb8EQZAHMHF%2FdOSC7FgZXEQtWgYPanO1V2aMBrQJlKKUrE9hBqQtFGYu1Q4mcW1hKABM%2BeaL3yZMCiMNUbg53k%2Bnk%2FWBU5SnM2%2BHOpz63d4R6%2F7srnsAXqRGbHtRWZB6yQAR3KiTwJA7SW6boq46suNhYjU%2FurAxsMICWgcoGOqUBzwrdqC7dcn6ks0oZLTEGR8yaCbm%2ByklNjuEgJ3504z7X0VdwdRf2Cp1rjH2Lmhtr8opHeuRkVB7aLkwILVoSgcyJqK4D363L8i5lUWKtNQnjWfvRjbjaj%2FPeCaHSo%2FHPZPIsCWoBE9zFPbp5QnDnQuovU5vBwm76vGlYfi7RiojqZDzg5B4XyIR%2BnsGN%2B9QYlzYGwFkMUWE9HDwLrFmK9rbe7T4b&X-Amz-Signature=39bb614b72aa4232c554b340b9f7b8f3924524887ca59dde4e3225a012bd0d4d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667BYJQ4MW%2F20251215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251215T181830Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDYQgvhjBQBbA3viHHw7okVu5JjxJwP7olDmz8Em4oQigIgdo%2FKGUsf1kfg8vi8DtjTivAa3Zeeh%2FGnbXoWVDbSe9gq%2FwMIUxAAGgw2Mzc0MjMxODM4MDUiDH97pig%2FBrb8wm0gCSrcA%2BZiwIIbk%2FroJpubzM60ukNdVzyjNKtdXEMTvyD12YdPOL08Snihy%2FYp36FmgCN4KqylLMVNDD5ZAxhTY8edfLX36%2FG8aU0CJtACdAK1LD5LhvlTbuRJk5ZwBcgoI1%2Fk4QTezbd39OX8MbYm2HHz2tC0y4I3eaoftiPwuXGiaV0hP8C4ghWP2ZVV8%2BxCzedhm7fCwK88oUQ0GHo0fZ54BFVNFD3LFv3%2FWCU7czYA75a6PgbvMwD7e7GWML49ND11c7hYOJWcU%2FJx%2BQphM37ZtNFOQfPrruzmj5BYPe%2BK1dUryNfdcpMnvovZ%2FmAlOG3l6ThXrkk01ERBsjvhkQeT8AmMgZRASxD31%2FfP%2F7eVS4PpSdXi5rk1%2Ba0Z7pQfFoQARjDbQgbtAFInSSiIWwQ5K9amJMMHbgfMZEVScLGe15nA5pnQ6zLPuYsKIXY49UBkcMEz6JICODZwQIVYe9Xz3gAE4Axhb8EQZAHMHF%2FdOSC7FgZXEQtWgYPanO1V2aMBrQJlKKUrE9hBqQtFGYu1Q4mcW1hKABM%2BeaL3yZMCiMNUbg53k%2Bnk%2FWBU5SnM2%2BHOpz63d4R6%2F7srnsAXqRGbHtRWZB6yQAR3KiTwJA7SW6boq46suNhYjU%2FurAxsMICWgcoGOqUBzwrdqC7dcn6ks0oZLTEGR8yaCbm%2ByklNjuEgJ3504z7X0VdwdRf2Cp1rjH2Lmhtr8opHeuRkVB7aLkwILVoSgcyJqK4D363L8i5lUWKtNQnjWfvRjbjaj%2FPeCaHSo%2FHPZPIsCWoBE9zFPbp5QnDnQuovU5vBwm76vGlYfi7RiojqZDzg5B4XyIR%2BnsGN%2B9QYlzYGwFkMUWE9HDwLrFmK9rbe7T4b&X-Amz-Signature=def46f8c46350abecdcf1b1d0bad65008b0eeb646b0808ac70e84643c8ac8f84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
