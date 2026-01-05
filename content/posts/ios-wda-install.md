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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VDOMEOSK%2F20260105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260105T062441Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHMaCXVzLXdlc3QtMiJIMEYCIQD1Uu9OJaWfiqTb28h%2BXFrF99gGlgtCW3RRGsLEGpCITgIhAK4HuGvKShVbe%2F1ndNVaIpjTa5V9qS7YwCX5EZINBYl%2BKv8DCDwQABoMNjM3NDIzMTgzODA1Igx3ZlN28fWABHgURDcq3AMdcJvj%2BwCP4QTTC7QKqWL%2F3jwtB80YvX7T0uPGUImch8UfTaUwWqoSIgtnVmt7fITcGpDUOJhFnAltr7FS8jEzOIdFqo%2BTmagVc%2BzuO8UPAWeItq2ZNn%2BslcFcd%2B9%2B524sraeEvWUnD9mAql1zR4IfS5jpGxPOIfW24qJxIh7nOmrX%2B%2B1aeZxuDSlH2GjvJPLGLIqyhQDF1EG5h0hYpfSxGbcxR9LtW3ZyMPQYzU5VW6UOMwJY6279M9vZ7RF4r5u31dseagJKuZsC2WzbGKSAcXyFu49RO2NguDWXDY6PrjzQI2micJCum1lRBlginP86EnPEleKzxazeedZMAhBVfnY9HqxmgH8G302HbT9co%2B7TxSnDzPYVIvuTGu5DJoA%2B0mP4vfNsv8UBApOdOJghk%2FLnwvtwFSu6fdbhIQMUOvcF%2FSV%2BLAB8wfxGAmz5wk2o03bR6yk6FfoW9BxOgISGLPxIpQZ6AiF9ODGJZmOc5XQlhGNH%2FZPiDwjInnhRPIfmjbD2J8Hb6%2F2aRYB9%2BZiJAh1kI0lHPmuh4xJjFkMJFGmHredgi0GyoLJKBCSAwUtw%2BA87Rz2uL2DJbwLxD1JrETbLlFJ3AXDSehZbSOJro6euR4yQkES911hUVjDJxuzKBjqkAQpvHyd7ZP0v4NA6AdumwO5EmbMXcfleqXCr5jK%2BIpDW7g2boyx5dKqk4fjNDq%2B5jVnJWCPx89CjqbXo2FcUFF%2BoEzKogTSdOr9uKpmLquaMMO%2B7TC9PQPQAw346nIkWKPLaxk3AGBjMAT3N8r4JT%2BDZMpEgI6gnGfdYmUR037MiMD4crQJ8LzMqWkznJ1tsN7YfSnYdLhY71MgOc42Obyalsg9j&X-Amz-Signature=056d04876b6c70a570fa47a1d9c0e030b1655b8f5222f9f1b024518dd6827b46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VDOMEOSK%2F20260105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260105T062441Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHMaCXVzLXdlc3QtMiJIMEYCIQD1Uu9OJaWfiqTb28h%2BXFrF99gGlgtCW3RRGsLEGpCITgIhAK4HuGvKShVbe%2F1ndNVaIpjTa5V9qS7YwCX5EZINBYl%2BKv8DCDwQABoMNjM3NDIzMTgzODA1Igx3ZlN28fWABHgURDcq3AMdcJvj%2BwCP4QTTC7QKqWL%2F3jwtB80YvX7T0uPGUImch8UfTaUwWqoSIgtnVmt7fITcGpDUOJhFnAltr7FS8jEzOIdFqo%2BTmagVc%2BzuO8UPAWeItq2ZNn%2BslcFcd%2B9%2B524sraeEvWUnD9mAql1zR4IfS5jpGxPOIfW24qJxIh7nOmrX%2B%2B1aeZxuDSlH2GjvJPLGLIqyhQDF1EG5h0hYpfSxGbcxR9LtW3ZyMPQYzU5VW6UOMwJY6279M9vZ7RF4r5u31dseagJKuZsC2WzbGKSAcXyFu49RO2NguDWXDY6PrjzQI2micJCum1lRBlginP86EnPEleKzxazeedZMAhBVfnY9HqxmgH8G302HbT9co%2B7TxSnDzPYVIvuTGu5DJoA%2B0mP4vfNsv8UBApOdOJghk%2FLnwvtwFSu6fdbhIQMUOvcF%2FSV%2BLAB8wfxGAmz5wk2o03bR6yk6FfoW9BxOgISGLPxIpQZ6AiF9ODGJZmOc5XQlhGNH%2FZPiDwjInnhRPIfmjbD2J8Hb6%2F2aRYB9%2BZiJAh1kI0lHPmuh4xJjFkMJFGmHredgi0GyoLJKBCSAwUtw%2BA87Rz2uL2DJbwLxD1JrETbLlFJ3AXDSehZbSOJro6euR4yQkES911hUVjDJxuzKBjqkAQpvHyd7ZP0v4NA6AdumwO5EmbMXcfleqXCr5jK%2BIpDW7g2boyx5dKqk4fjNDq%2B5jVnJWCPx89CjqbXo2FcUFF%2BoEzKogTSdOr9uKpmLquaMMO%2B7TC9PQPQAw346nIkWKPLaxk3AGBjMAT3N8r4JT%2BDZMpEgI6gnGfdYmUR037MiMD4crQJ8LzMqWkznJ1tsN7YfSnYdLhY71MgOc42Obyalsg9j&X-Amz-Signature=d136d092b81814165fb901d5399f9a410edadb7b9b672ac6bb352b1307b454dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
