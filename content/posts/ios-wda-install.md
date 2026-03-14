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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYKRPERX%2F20260314%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260314T122745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD4JxoYQGBhS6CQ7yr%2FkRByHflTKW0VovNFaGb6O1j7KwIhAJQI%2BOVZWQBI8gQrc7pDgjdYp%2Fuh6T6DhuX%2F5IYhWK%2FqKogECKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igxvr1q9x7xDOdp4x5kq3AM9PObi6aPxG3i7PWL%2Bpnkz%2BzCMVBZdMcif7oGvJeqlQd7Y9JcRYoQgSz9tai6Kyq22fQzFEV%2F%2FMH%2Ft4kbb3%2FbQAOfDSbCsxzlKzv7X%2BDZKsQj3COT9momdRdhCoYp98IDl1%2BG%2FEr6DNVDo%2FCOtvDeHVtBNWGfQ85vrMjAKXUNCo%2F%2BCY%2Foy4xViN9mJqHXf2tGa18hqkEE%2B%2FYdra4GHo3LMSL9T6fMkTbvPlmyuwkywTJ8GHtpC%2BS%2FKIZhu9gAgzCX9f2YT4FoCop8KI3%2F6gHwcqczM7CzeobZiy8KVZNe8xrHL8%2FzJ%2FEZUvgV%2BL4Dd%2B0k8if%2B2L2wHnjBWIamjExk9NrEKO6QePP42u1MoOGZPU3AsKb0PzzST%2FAOpjor38Za20%2FYp90d%2FAtZH0wDpcEC4u4cBlpvKkkIdhejvfW3jHLPyghoQ6fbI1Bh5Si54uazobMivmPN4dflNwktOHzSdM2p2nrZyrcXH2w9Rs2C%2Fw16SwhFXAy16xAa6o0Q%2FvHc%2F%2Fxe6F%2FscgyW7Gs%2FG3xiOMyNkU5n0e6Z2k7WEUkHwx1A%2FqGJTrRd1fv2RVgro9nlBksexXj8bToKMOGubCsk1QkFWjg%2BfqHvKicXYuTlQCY2DdEX4nldS9U178jCe79TNBjqkAdbywwincykGuLvjuruhCKUSJGWMqWYGfzZpyJRzcFFTx0zP1p1MZRGX0bJhmN%2FKTdt3%2BaqufQT6idOVLamiwu6tyjWhOTgd4GruygjhkFE6LDa43Er%2F8vZ3aUzGwWr6Ap42ULYHmcy3%2B8ebEJQbktoGBu3jwU0x51OtlnBg8rBXFnnnJFQivMeLrOJ5HeCSqQgx6Pto2wNCgrgVDwlTCA1BhMDd&X-Amz-Signature=5e9abe59da7f00909a601af6b83dd59868f03c1d9cad416feeda4c9b538d5e67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYKRPERX%2F20260314%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260314T122745Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD4JxoYQGBhS6CQ7yr%2FkRByHflTKW0VovNFaGb6O1j7KwIhAJQI%2BOVZWQBI8gQrc7pDgjdYp%2Fuh6T6DhuX%2F5IYhWK%2FqKogECKT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igxvr1q9x7xDOdp4x5kq3AM9PObi6aPxG3i7PWL%2Bpnkz%2BzCMVBZdMcif7oGvJeqlQd7Y9JcRYoQgSz9tai6Kyq22fQzFEV%2F%2FMH%2Ft4kbb3%2FbQAOfDSbCsxzlKzv7X%2BDZKsQj3COT9momdRdhCoYp98IDl1%2BG%2FEr6DNVDo%2FCOtvDeHVtBNWGfQ85vrMjAKXUNCo%2F%2BCY%2Foy4xViN9mJqHXf2tGa18hqkEE%2B%2FYdra4GHo3LMSL9T6fMkTbvPlmyuwkywTJ8GHtpC%2BS%2FKIZhu9gAgzCX9f2YT4FoCop8KI3%2F6gHwcqczM7CzeobZiy8KVZNe8xrHL8%2FzJ%2FEZUvgV%2BL4Dd%2B0k8if%2B2L2wHnjBWIamjExk9NrEKO6QePP42u1MoOGZPU3AsKb0PzzST%2FAOpjor38Za20%2FYp90d%2FAtZH0wDpcEC4u4cBlpvKkkIdhejvfW3jHLPyghoQ6fbI1Bh5Si54uazobMivmPN4dflNwktOHzSdM2p2nrZyrcXH2w9Rs2C%2Fw16SwhFXAy16xAa6o0Q%2FvHc%2F%2Fxe6F%2FscgyW7Gs%2FG3xiOMyNkU5n0e6Z2k7WEUkHwx1A%2FqGJTrRd1fv2RVgro9nlBksexXj8bToKMOGubCsk1QkFWjg%2BfqHvKicXYuTlQCY2DdEX4nldS9U178jCe79TNBjqkAdbywwincykGuLvjuruhCKUSJGWMqWYGfzZpyJRzcFFTx0zP1p1MZRGX0bJhmN%2FKTdt3%2BaqufQT6idOVLamiwu6tyjWhOTgd4GruygjhkFE6LDa43Er%2F8vZ3aUzGwWr6Ap42ULYHmcy3%2B8ebEJQbktoGBu3jwU0x51OtlnBg8rBXFnnnJFQivMeLrOJ5HeCSqQgx6Pto2wNCgrgVDwlTCA1BhMDd&X-Amz-Signature=90dc35f7b91c0568205e87cd7fccd7a883d337269f751c1a77e23779f3804bd8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
