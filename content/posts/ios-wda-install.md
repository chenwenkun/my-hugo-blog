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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665CYF7NNB%2F20260714%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260714T130522Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIGnltsncXnwz%2BcEfy4AKav1b2Navyl6dQd7DPGGs8RaQAiEA9bcOeHFK3u%2FE%2BrNKUPADRL4aeNNNSWQwMTX9RX0O5G8q%2FwMIERAAGgw2Mzc0MjMxODM4MDUiDJleaC2MJv7vkXnGLCrcA%2BgKkbxZ4nzCStruxFtCGOI3Wl034Ah%2Fu46hvp6Guoe4NZgTFLGJ9SvA3QM94obKRHiSWeWQlimZrgfsQO1GnFQsuFTGL8bgEtV5b1SzmK5oOyPTSmNe9tCRwMY2RklOKuqYPwwBSN%2FFDaTKR1F57LKPTUm8%2FjHJiy2V%2FB1egQmfFj4DT%2F%2Bvw3Vp0G1%2BlPThSd%2FQtBsIi23HKC24XuxAlrZkHJEEPUq%2BixKTGizC5yHJ9qLl9s3iSw5Vp5KPaZnN1yxnUPqfCQnE7jKqg50sQmwzRwPknZAgXa8HW%2FIasawvoUv23r8mtZmB1DD8XTGmn3gfrCiLS1FQqt0Irza79z3DImwD3DvvuIvxtjOrMIMRbERAYG%2BEoRmkSgNdMYvBy9PHJwXU%2BdT5ub6NlJm47dHTVC7KmUDiymzeqcO0WdxR75cgM%2BY434zL%2B6kiJPBX%2F79F%2B5%2F71EvEKO1eg5jZgPPsX%2F8Hq7y03rmO77ibcX6EY7WRJZAdDI82q0QeUxWxD5Ns1fK9GoZ7tMsnkJ%2F8SIF7jN%2F5TYIkg48loDPqxRnvwx5I1rCp9mlN4LpW%2BL8T13eH1n5h66rE%2FdxVZt027LNC%2F8wsO9QwYAa78KKjm0fkQQFtYUG2d8sE3WeQMJjL19IGOqUB0L45BPaqqbGEa98UZaVDKfws7Xm6xkj8mGkIfi4oVLlF%2BXoFdLgs43LP9YFsPBm35kOdvu2ub4jPvWQBay2cTj0jNmSN6FejFd7cBxO1v1ktc7gynZ0Zs8glAS9lcg%2F8QwbnoJPz4ynJKhY2Q%2F9JWYy96m0m8FMUJ%2F9qKthPMPIzUPMKLq0IdimQKyGp2K111Xu%2BUZ4q%2BboNYmrSB%2FLTvOwnlOo6&X-Amz-Signature=b6711c1d0a44c7d16b8a4d71ded2beac6786d8d3d98e04d30b2ace12f743d66a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665CYF7NNB%2F20260714%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260714T130522Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIGnltsncXnwz%2BcEfy4AKav1b2Navyl6dQd7DPGGs8RaQAiEA9bcOeHFK3u%2FE%2BrNKUPADRL4aeNNNSWQwMTX9RX0O5G8q%2FwMIERAAGgw2Mzc0MjMxODM4MDUiDJleaC2MJv7vkXnGLCrcA%2BgKkbxZ4nzCStruxFtCGOI3Wl034Ah%2Fu46hvp6Guoe4NZgTFLGJ9SvA3QM94obKRHiSWeWQlimZrgfsQO1GnFQsuFTGL8bgEtV5b1SzmK5oOyPTSmNe9tCRwMY2RklOKuqYPwwBSN%2FFDaTKR1F57LKPTUm8%2FjHJiy2V%2FB1egQmfFj4DT%2F%2Bvw3Vp0G1%2BlPThSd%2FQtBsIi23HKC24XuxAlrZkHJEEPUq%2BixKTGizC5yHJ9qLl9s3iSw5Vp5KPaZnN1yxnUPqfCQnE7jKqg50sQmwzRwPknZAgXa8HW%2FIasawvoUv23r8mtZmB1DD8XTGmn3gfrCiLS1FQqt0Irza79z3DImwD3DvvuIvxtjOrMIMRbERAYG%2BEoRmkSgNdMYvBy9PHJwXU%2BdT5ub6NlJm47dHTVC7KmUDiymzeqcO0WdxR75cgM%2BY434zL%2B6kiJPBX%2F79F%2B5%2F71EvEKO1eg5jZgPPsX%2F8Hq7y03rmO77ibcX6EY7WRJZAdDI82q0QeUxWxD5Ns1fK9GoZ7tMsnkJ%2F8SIF7jN%2F5TYIkg48loDPqxRnvwx5I1rCp9mlN4LpW%2BL8T13eH1n5h66rE%2FdxVZt027LNC%2F8wsO9QwYAa78KKjm0fkQQFtYUG2d8sE3WeQMJjL19IGOqUB0L45BPaqqbGEa98UZaVDKfws7Xm6xkj8mGkIfi4oVLlF%2BXoFdLgs43LP9YFsPBm35kOdvu2ub4jPvWQBay2cTj0jNmSN6FejFd7cBxO1v1ktc7gynZ0Zs8glAS9lcg%2F8QwbnoJPz4ynJKhY2Q%2F9JWYy96m0m8FMUJ%2F9qKthPMPIzUPMKLq0IdimQKyGp2K111Xu%2BUZ4q%2BboNYmrSB%2FLTvOwnlOo6&X-Amz-Signature=61b4794baefcf39e3618fa23c09ad08507373e570396d6fde9ea50fd2c07b4ae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
