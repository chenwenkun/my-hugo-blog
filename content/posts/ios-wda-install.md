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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W4RKO7MS%2F20260306%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260306T063420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJHMEUCIGjreEdvYIdM1g%2F62xCy9RejZ6UcsOVO4nL%2B73fj%2FsCCAiEAiNW8o0GnCZ3zJAL5gssw%2BHPkfgaflOy08s5LwjqMUu8qiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLg0Qx0MZxat3GCqNyrcAxPD347exsIkXOoU7rEht%2B4iXWZ8ZW63nuLvF9D6IPFGWZMsMdxmgMi6Nj7hExAXd1hrg2xUOd3bCvw0S%2FiHhbqii3A%2FKqVhM0OZ39EIzoESiP1VXoXAVbXznT1zcB0vI6QPECsbmLh%2FzZWTn2QCaglryGmdNFgh%2FU%2F3T2nS0IFOCD4igapEgsKnJ%2B5rIK8w%2B%2BmCLMDq5SACcpQyW1gsQcPiRLdfo0cj4PI4LXX8n4zcv1k9yQq6T2LQy6B8HVjtEEPLpsWwDYM05uVsVsICjQZU5z7rKre8A3qchU8ExXbGXOdek23oPJmkDY3fXYnL2jLYmnPGLKJUm89kJUvmqgflr%2BEDKSoZb5SDlzlNAy%2BdHcPudKJRYhOJErGt9Qgnx5T7RQqmKbbeHa%2F0KUS8ngbFOohNshpkLaGz0R2Nn3DWvJP12oid5CLCTnWv3PDq1aMCz2cZttJ57yapC5g3bkucYBykecqsnJFUZ%2FxWAZO70E0OfWn%2F8e3q2ZbsaC8pnUiZEVf5rwRr0pPSXeVPb%2BriyhILETDpRyByiMhAF4yTX35HAiMoF%2F4onqd1LKTYSEsXGDu%2BGWDHkzbqgZ1Yt59eZIIuw9hJAN91fGM8grFi03d0EgM9m0d6Erv5MNzQqM0GOqUB5IDrrdenFERPse3%2F3s64nIxOiPqGC7YTnR0J6fUr9zvahuU53XmCFDvr9S8XMgclFb1e0q8w4eZC%2F65GCCu6LdKjZLd%2FtkflBLVsAWxksHCY9f2EnFD7KAYtbdWQTQe5ltjmPKrbOkVHyJgXUwOTzfg4HhP7C8xBbVmoWbwxdS%2ByzBpzMAkoNp51JYdEUeo%2BSkCqyuU68LDIxzQwt6AWmAyq5Jn6&X-Amz-Signature=b31dcbf0bb078c2c42b5359734d1d17f69344fe8b470fca636038b9dc5314455&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W4RKO7MS%2F20260306%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260306T063420Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBEaCXVzLXdlc3QtMiJHMEUCIGjreEdvYIdM1g%2F62xCy9RejZ6UcsOVO4nL%2B73fj%2FsCCAiEAiNW8o0GnCZ3zJAL5gssw%2BHPkfgaflOy08s5LwjqMUu8qiAQI2v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDLg0Qx0MZxat3GCqNyrcAxPD347exsIkXOoU7rEht%2B4iXWZ8ZW63nuLvF9D6IPFGWZMsMdxmgMi6Nj7hExAXd1hrg2xUOd3bCvw0S%2FiHhbqii3A%2FKqVhM0OZ39EIzoESiP1VXoXAVbXznT1zcB0vI6QPECsbmLh%2FzZWTn2QCaglryGmdNFgh%2FU%2F3T2nS0IFOCD4igapEgsKnJ%2B5rIK8w%2B%2BmCLMDq5SACcpQyW1gsQcPiRLdfo0cj4PI4LXX8n4zcv1k9yQq6T2LQy6B8HVjtEEPLpsWwDYM05uVsVsICjQZU5z7rKre8A3qchU8ExXbGXOdek23oPJmkDY3fXYnL2jLYmnPGLKJUm89kJUvmqgflr%2BEDKSoZb5SDlzlNAy%2BdHcPudKJRYhOJErGt9Qgnx5T7RQqmKbbeHa%2F0KUS8ngbFOohNshpkLaGz0R2Nn3DWvJP12oid5CLCTnWv3PDq1aMCz2cZttJ57yapC5g3bkucYBykecqsnJFUZ%2FxWAZO70E0OfWn%2F8e3q2ZbsaC8pnUiZEVf5rwRr0pPSXeVPb%2BriyhILETDpRyByiMhAF4yTX35HAiMoF%2F4onqd1LKTYSEsXGDu%2BGWDHkzbqgZ1Yt59eZIIuw9hJAN91fGM8grFi03d0EgM9m0d6Erv5MNzQqM0GOqUB5IDrrdenFERPse3%2F3s64nIxOiPqGC7YTnR0J6fUr9zvahuU53XmCFDvr9S8XMgclFb1e0q8w4eZC%2F65GCCu6LdKjZLd%2FtkflBLVsAWxksHCY9f2EnFD7KAYtbdWQTQe5ltjmPKrbOkVHyJgXUwOTzfg4HhP7C8xBbVmoWbwxdS%2ByzBpzMAkoNp51JYdEUeo%2BSkCqyuU68LDIxzQwt6AWmAyq5Jn6&X-Amz-Signature=44721f9ddf0179dce4b24982160ac318842c2d7fe82380cf5ae51595dea2fe2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
