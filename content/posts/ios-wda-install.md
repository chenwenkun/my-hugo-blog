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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BD5DOCM%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T125919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCEIrXaEsFXVmbnXRI%2F2jKPrTTUChyFElJMojF%2FpwpkAQIgcItwfI%2BUropDXlasONLfb52B2C6aXn2xKjlgNEhYpVcqiAQIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNdUdnykOvMVeuUn%2BircA%2FFYz%2FYpRbvBwaFjNTJEaaRgp%2BmGKK2RgxcauP63bIgnET6WuJB9tJ92ZVPTPAsk3xiM53yrNPBmSNkNlrlgEHfYjuMVJ8sGfJEnvoKS44MFr3c7rLx7vJ2iEZwNUvQHNhSYPQ6PDiZ8bMAoPJGD0WfO5UgYiY4wNGAonyD%2BRx43vBV9Q2MLNQ1%2FdrdgJGPKPMxHHhafgr%2Fh%2F7vB4qw7a6P%2BdW6LR105ZTRIHq75O9%2FUP%2F%2FBT8CD9RRgeFORC9C2Afp0r%2F3crkeBtzZqtSfVwbjb9jBpQQ46HkM3Lx56FUTkUhYQfjLYg2ZI6B3O4hwYGt56F9%2FyYmDsRdCuFQsQ35q6f1g9JqB2AyXxtEpOCJ1hiXMsHN4rgQcHWzIk9dLHdkgOmtyLc%2BRRHkGS8ugkwoh6etT%2BJ0Q3Bn%2FU52vYl5TG7pNgw9nJjZ4SFzh4T4ww2yOYza3brGN4dsD5PBSipbfW9qzwFJiDJU84jRQcxwyp4KhEOFuViokr4dA0tdjXWGjqXSvGYfbF1GCHGhk8YA%2FT83uXS%2F5XZyNf5o4flleoydDCpv6yuH2KfUvqpJ1znJjzEGC3igfPpzoR3jv88wEvDQFVg8XKlCguV4iUqXYp7JT7qvqDAMI2Sp5wMM%2BD%2Fs4GOqUBvLk3cpNPgHPE5yJ9OFVl3v7I8FO8zMIa5iE8hZwFLqiGZmhSVt5xFw3XMqVbc1ZS1IG5WW4q5r3SYkajPTOfgsxDoCyuzzbhao1sxlLnNVk6dsRF5ufV5AFvv3%2B1Dq%2B0aY%2BzoAvf4NRpcPfVCmed6jKfKbdZLK8ZHB%2BUDIZK%2BL%2Bl8K3cibq4fP7mEPTfonCFqQCuSvRjQlVZMU4fNXHKR7HpYRm4&X-Amz-Signature=5cf5a22bfebe22e41015767d701fcdc3941612ddd0a8464e9132186c1f1d52c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BD5DOCM%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T125919Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCEIrXaEsFXVmbnXRI%2F2jKPrTTUChyFElJMojF%2FpwpkAQIgcItwfI%2BUropDXlasONLfb52B2C6aXn2xKjlgNEhYpVcqiAQIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNdUdnykOvMVeuUn%2BircA%2FFYz%2FYpRbvBwaFjNTJEaaRgp%2BmGKK2RgxcauP63bIgnET6WuJB9tJ92ZVPTPAsk3xiM53yrNPBmSNkNlrlgEHfYjuMVJ8sGfJEnvoKS44MFr3c7rLx7vJ2iEZwNUvQHNhSYPQ6PDiZ8bMAoPJGD0WfO5UgYiY4wNGAonyD%2BRx43vBV9Q2MLNQ1%2FdrdgJGPKPMxHHhafgr%2Fh%2F7vB4qw7a6P%2BdW6LR105ZTRIHq75O9%2FUP%2F%2FBT8CD9RRgeFORC9C2Afp0r%2F3crkeBtzZqtSfVwbjb9jBpQQ46HkM3Lx56FUTkUhYQfjLYg2ZI6B3O4hwYGt56F9%2FyYmDsRdCuFQsQ35q6f1g9JqB2AyXxtEpOCJ1hiXMsHN4rgQcHWzIk9dLHdkgOmtyLc%2BRRHkGS8ugkwoh6etT%2BJ0Q3Bn%2FU52vYl5TG7pNgw9nJjZ4SFzh4T4ww2yOYza3brGN4dsD5PBSipbfW9qzwFJiDJU84jRQcxwyp4KhEOFuViokr4dA0tdjXWGjqXSvGYfbF1GCHGhk8YA%2FT83uXS%2F5XZyNf5o4flleoydDCpv6yuH2KfUvqpJ1znJjzEGC3igfPpzoR3jv88wEvDQFVg8XKlCguV4iUqXYp7JT7qvqDAMI2Sp5wMM%2BD%2Fs4GOqUBvLk3cpNPgHPE5yJ9OFVl3v7I8FO8zMIa5iE8hZwFLqiGZmhSVt5xFw3XMqVbc1ZS1IG5WW4q5r3SYkajPTOfgsxDoCyuzzbhao1sxlLnNVk6dsRF5ufV5AFvv3%2B1Dq%2B0aY%2BzoAvf4NRpcPfVCmed6jKfKbdZLK8ZHB%2BUDIZK%2BL%2Bl8K3cibq4fP7mEPTfonCFqQCuSvRjQlVZMU4fNXHKR7HpYRm4&X-Amz-Signature=35e0e784883d96216159362f4e8d50cd0aedc3133a415c831e5bca29b2ee594e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
