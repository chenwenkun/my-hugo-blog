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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RXXRB3DN%2F20260529%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260529T200648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJHMEUCIFz7CIXjUiZ6PFXjsXleweleKMzNlppYtHEwhtxE4IAdAiEApbFdkegiETEj3GIGWf9JG66tdCoHjnkOi6OF%2BwVrxGcqiAQIzf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI2EbD%2Flu901z2Ec9CrcA7UrIwnoj9o8uO%2BlwSdyciW4UkNbubjqrRwqIUfdbvvShWiap0V1WCZ722da9%2BSX8UyWXiUQvgjhw6ex4T%2BvB4xicsjWWLv%2Ftl0dWAwI6FHYCLpeKUyJeOFeB3IGXV3aYM9C8d5lCkYMTl%2BIuMA4hRFWGxvdCv51lcl5dG9gevgmNmbjSKz5H%2F9Y%2FSCQZLSivjnTRFBiqPaqEkk2tJzcudcKHvjEjF0WODCX8Re7AP4jfcEoVkjj89IIgBfCnMyD7hSGdLZnbSwF9iyrtqXPRX1R3E9fExS7ODXBXzNG1VS4UFEw%2B81yXjT4guGGy%2B8CcNlvdhHUTNzQLi85Z8DN7yS2CxKIeEHb9ahm%2BHPBtYNqfDz%2BpkAth0OGlS34z7iRvTcT0WGGgArZPZAZ6kTHbnOF1UoqpO2S%2F3QGQdPYyArJxANLTHnITzz8WvnIV1ZDaEMWB6RwyR8%2FnUBjcVnkECfriBxRWv%2Fcv5ysbOGw4FElSNcAtboo3ZB780Bk89yJQPCWlG%2B4EZ21VQxbBsThtfOeRcAPcANNUCrrtPxRspeWhuPeZdHGjL8PIK60Ns6A85VFkHiW1yKFt%2FpTX37wF8rErZu2V35AbbAxqbHTquJUBuxhzJ7t7RkbYV5IMK%2Ff59AGOqUB8Jyklnraw0hKtWSTa4yzeZpaotUofYH6birtpeHp25LBfoHxSibQDroFukHtbg9cPaeArmgI%2BI61ZMb0OEJfJBB%2F47GvThJ26eThnFLt3zu5qRk%2F6n1h2c6pQA4zq5Frx5Q09%2FwcdMHQqyz2LKD6zeS3cbz0WsJS7ZVKUbQQ2gI6zvcVMZmAcjICHTv%2FbKFem2N6n7fzcyIT7FpuNfcrSOxN6tgB&X-Amz-Signature=ebfc380f77fb872ef67051f58a166f763968389fff2d187f635c05cbfd19387f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RXXRB3DN%2F20260529%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260529T200648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJHMEUCIFz7CIXjUiZ6PFXjsXleweleKMzNlppYtHEwhtxE4IAdAiEApbFdkegiETEj3GIGWf9JG66tdCoHjnkOi6OF%2BwVrxGcqiAQIzf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDI2EbD%2Flu901z2Ec9CrcA7UrIwnoj9o8uO%2BlwSdyciW4UkNbubjqrRwqIUfdbvvShWiap0V1WCZ722da9%2BSX8UyWXiUQvgjhw6ex4T%2BvB4xicsjWWLv%2Ftl0dWAwI6FHYCLpeKUyJeOFeB3IGXV3aYM9C8d5lCkYMTl%2BIuMA4hRFWGxvdCv51lcl5dG9gevgmNmbjSKz5H%2F9Y%2FSCQZLSivjnTRFBiqPaqEkk2tJzcudcKHvjEjF0WODCX8Re7AP4jfcEoVkjj89IIgBfCnMyD7hSGdLZnbSwF9iyrtqXPRX1R3E9fExS7ODXBXzNG1VS4UFEw%2B81yXjT4guGGy%2B8CcNlvdhHUTNzQLi85Z8DN7yS2CxKIeEHb9ahm%2BHPBtYNqfDz%2BpkAth0OGlS34z7iRvTcT0WGGgArZPZAZ6kTHbnOF1UoqpO2S%2F3QGQdPYyArJxANLTHnITzz8WvnIV1ZDaEMWB6RwyR8%2FnUBjcVnkECfriBxRWv%2Fcv5ysbOGw4FElSNcAtboo3ZB780Bk89yJQPCWlG%2B4EZ21VQxbBsThtfOeRcAPcANNUCrrtPxRspeWhuPeZdHGjL8PIK60Ns6A85VFkHiW1yKFt%2FpTX37wF8rErZu2V35AbbAxqbHTquJUBuxhzJ7t7RkbYV5IMK%2Ff59AGOqUB8Jyklnraw0hKtWSTa4yzeZpaotUofYH6birtpeHp25LBfoHxSibQDroFukHtbg9cPaeArmgI%2BI61ZMb0OEJfJBB%2F47GvThJ26eThnFLt3zu5qRk%2F6n1h2c6pQA4zq5Frx5Q09%2FwcdMHQqyz2LKD6zeS3cbz0WsJS7ZVKUbQQ2gI6zvcVMZmAcjICHTv%2FbKFem2N6n7fzcyIT7FpuNfcrSOxN6tgB&X-Amz-Signature=d06f389b8360532dd828962dec76a4d0c0172dcb4631279d519e16f6fa4d5d78&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
