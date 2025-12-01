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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSWPDDBC%2F20251201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251201T061953Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJIMEYCIQDftd7cgVwwO%2FQJz9LP4D7Jd5TFIay3N54RR2Oscnh00QIhAMqDW93%2Fsfvu9uN%2FKXbWqISAYD3tjjhVBTInkv1k8UXoKogECPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy7qZQVsJyuHw%2Bdtagq3AN%2BnimkNn5dZqt31bnZ8xl%2F1qesNLIbUMXtfSaJOSmjNe58dCWtvcpg%2BOEHohVfBGuTEqd3BcjHA3WgblMx9TP4YQOGOs4Hn2RivFZGwAoMtm0azpXLV9h5ZTeA8ETJJ1Wn6ypkzUcR%2BtnGITu0IoyxY7cDY8438Y762Gm2D16MgB5oKHbEb5iRcyhsjRAYMpXuAQ9g6dm9zXjMZ4AInzHCGJTB0xtzDj7GTP33gWeMPo9dBmcfwbdqfIaWjhB%2BPjCnoa2QQULnQhVkddREPOqoEWPXv5nS7qPzzVs78XoJGYny3hVB%2BODKpGI%2BTC62GsirjjBvQ4BLxvYAsEY6EBXciQduM28%2BIEQtjsRNnQi9Re%2BPin7G3%2Bn4QVyHea%2BAGW5vJAe0BQ2Q5dz5tT8LH6kJi2tsP7p3P8NqqdTPwL%2Fa4SMbwxwb2vjNObB0jcFIzgtmQGyzTU3zR5df8r92if7426%2FJb0J6rCSdi2TD0EQy6SU%2B1KhIaUVlkICw%2F9QSQgW%2BngF0tXJgn9%2Ba%2FEbSexSxwutRtADCZ7%2BO3dexk0t6j%2BShwokG0rAETsz0oiuQCoO4lghdKSra8nYp7ITFvoxkUI2Yk4fhpRC6KTnBr5bXdkzg%2FnyZslFIkG%2BgOzCgpbTJBjqkATrDUIVPjiq6h4oqGrv5LYkjrPnarEkqhZ2CcZU9khCYfNkptsJhf1F38y79hZNgFH9MvQRY%2FRIMUzwyrPcB7jXcEyoOIG9Gd9PQW4%2BNyGcoj8Oxr3edwq6W1n9eZCbZmHZZn6iRKi5hJRnwQ%2B%2BwwyxWlIKKTgLSV0o1bzzb2LOMAPP%2F9XJxHMtMmJemQSgKNpkLzJtk3VQIo%2Bfmm%2F7ISQ%2Bla4xv&X-Amz-Signature=d448dc15233960b096c11aa7426d14cb24338c3dc8403579dc031236c31f6d4d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSWPDDBC%2F20251201%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251201T061953Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECwaCXVzLXdlc3QtMiJIMEYCIQDftd7cgVwwO%2FQJz9LP4D7Jd5TFIay3N54RR2Oscnh00QIhAMqDW93%2Fsfvu9uN%2FKXbWqISAYD3tjjhVBTInkv1k8UXoKogECPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy7qZQVsJyuHw%2Bdtagq3AN%2BnimkNn5dZqt31bnZ8xl%2F1qesNLIbUMXtfSaJOSmjNe58dCWtvcpg%2BOEHohVfBGuTEqd3BcjHA3WgblMx9TP4YQOGOs4Hn2RivFZGwAoMtm0azpXLV9h5ZTeA8ETJJ1Wn6ypkzUcR%2BtnGITu0IoyxY7cDY8438Y762Gm2D16MgB5oKHbEb5iRcyhsjRAYMpXuAQ9g6dm9zXjMZ4AInzHCGJTB0xtzDj7GTP33gWeMPo9dBmcfwbdqfIaWjhB%2BPjCnoa2QQULnQhVkddREPOqoEWPXv5nS7qPzzVs78XoJGYny3hVB%2BODKpGI%2BTC62GsirjjBvQ4BLxvYAsEY6EBXciQduM28%2BIEQtjsRNnQi9Re%2BPin7G3%2Bn4QVyHea%2BAGW5vJAe0BQ2Q5dz5tT8LH6kJi2tsP7p3P8NqqdTPwL%2Fa4SMbwxwb2vjNObB0jcFIzgtmQGyzTU3zR5df8r92if7426%2FJb0J6rCSdi2TD0EQy6SU%2B1KhIaUVlkICw%2F9QSQgW%2BngF0tXJgn9%2Ba%2FEbSexSxwutRtADCZ7%2BO3dexk0t6j%2BShwokG0rAETsz0oiuQCoO4lghdKSra8nYp7ITFvoxkUI2Yk4fhpRC6KTnBr5bXdkzg%2FnyZslFIkG%2BgOzCgpbTJBjqkATrDUIVPjiq6h4oqGrv5LYkjrPnarEkqhZ2CcZU9khCYfNkptsJhf1F38y79hZNgFH9MvQRY%2FRIMUzwyrPcB7jXcEyoOIG9Gd9PQW4%2BNyGcoj8Oxr3edwq6W1n9eZCbZmHZZn6iRKi5hJRnwQ%2B%2BwwyxWlIKKTgLSV0o1bzzb2LOMAPP%2F9XJxHMtMmJemQSgKNpkLzJtk3VQIo%2Bfmm%2F7ISQ%2Bla4xv&X-Amz-Signature=2c03a6dcf1ef2178fd8bdc069b80349655f282492c73696a460cebfc68f9a947&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
