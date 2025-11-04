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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662DZWR74C%2F20251104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251104T061731Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDsJVaVAjpm3mXxjV9NJ3YZizz3ptl4E3H%2FLfJIYcCPGAiEArmyy36UlcZJi%2F2rQm2wJHIto6Rdd58CTY0FzJyxBbj4q%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDPUW5YA05Glez1Q7ZyrcA2GbpazCnO6PPLQc95jLN9iwNJ%2FyRsQ8JkIiU%2FhE0HfFckNsEQbMQ3Uyc04LDF%2BbIPHu830etx%2FvK0vf0nnMs7cHm54TmpJlXFJpQaq4Lb8j5vSczGIjYc18Syo1TlxS%2BU6P9bkla9xiRLXEGMk5uPv1PV5p6KMWrtvrOWSiURynqFe3DwV1jqbVwGSptoTkNw%2FhDuI%2BfzUsOrJb81ctsT4cWRKWOoKqal9y1w0MjYka9GzByflXI7n3HXaeesTwSKfGdb5Ao8Jvu%2BcNapXKTnUxie6XGCj8li3WZRYkID5ATDlJt1gsTQQxrNGYZDTzidXdCb2XRMhBEjWOePouLcwGIGLKgA7LU2wYZFfS7KHOK8AxxyTG3Lfz8pQalQyfYG4QDwDrdFnT8pVCatGdDedw2mrXz9s2N8Z6EifqugUqVcdhHR%2FFmvfAtmzk5ZuO5fiZK2CZ8MHZKL1xF0A%2Fe%2F4BlJchh8V6aNYt2gwjn69fVaMkUkX9B66bE3eUEKS8jlzGq6ym3%2BypduQsTkhRL0shuoPI9cNkQhq6nB4AJQVu5SPlTqm6cmbls%2B9xBQil16PIXGAD%2BSTm2DB9GHGZK9KXdgEBXkg2JoD6ijy3mGWAvL9rB3MoKepqmvlqMPihpsgGOqUBrSz00VIMKqgwh8bdv4OIywKffG30mLLOqicBudEBy%2Fdmxjh5%2Fvq7w2Slzbx7FCXdcaBMZekG2sQUMsOgvI1ir2rNU7fQmJDDFhZ2QvTi2tgK3Y%2FXW7mz%2FHP8EXjsZfg7Q7Ux8rzfeP8G9zzBapjknUfN6icJBzoF0FtsBWzx9WR3IGwSpq%2Bud9AD27r83B1Ll6ygjw6jNBv2Ylk9ro8egcc31l25&X-Amz-Signature=187a9231b275d5a630eafbac9cefce1283a7a6577607dd7409d708ac89364891&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662DZWR74C%2F20251104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251104T061731Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDsJVaVAjpm3mXxjV9NJ3YZizz3ptl4E3H%2FLfJIYcCPGAiEArmyy36UlcZJi%2F2rQm2wJHIto6Rdd58CTY0FzJyxBbj4q%2FwMIbxAAGgw2Mzc0MjMxODM4MDUiDPUW5YA05Glez1Q7ZyrcA2GbpazCnO6PPLQc95jLN9iwNJ%2FyRsQ8JkIiU%2FhE0HfFckNsEQbMQ3Uyc04LDF%2BbIPHu830etx%2FvK0vf0nnMs7cHm54TmpJlXFJpQaq4Lb8j5vSczGIjYc18Syo1TlxS%2BU6P9bkla9xiRLXEGMk5uPv1PV5p6KMWrtvrOWSiURynqFe3DwV1jqbVwGSptoTkNw%2FhDuI%2BfzUsOrJb81ctsT4cWRKWOoKqal9y1w0MjYka9GzByflXI7n3HXaeesTwSKfGdb5Ao8Jvu%2BcNapXKTnUxie6XGCj8li3WZRYkID5ATDlJt1gsTQQxrNGYZDTzidXdCb2XRMhBEjWOePouLcwGIGLKgA7LU2wYZFfS7KHOK8AxxyTG3Lfz8pQalQyfYG4QDwDrdFnT8pVCatGdDedw2mrXz9s2N8Z6EifqugUqVcdhHR%2FFmvfAtmzk5ZuO5fiZK2CZ8MHZKL1xF0A%2Fe%2F4BlJchh8V6aNYt2gwjn69fVaMkUkX9B66bE3eUEKS8jlzGq6ym3%2BypduQsTkhRL0shuoPI9cNkQhq6nB4AJQVu5SPlTqm6cmbls%2B9xBQil16PIXGAD%2BSTm2DB9GHGZK9KXdgEBXkg2JoD6ijy3mGWAvL9rB3MoKepqmvlqMPihpsgGOqUBrSz00VIMKqgwh8bdv4OIywKffG30mLLOqicBudEBy%2Fdmxjh5%2Fvq7w2Slzbx7FCXdcaBMZekG2sQUMsOgvI1ir2rNU7fQmJDDFhZ2QvTi2tgK3Y%2FXW7mz%2FHP8EXjsZfg7Q7Ux8rzfeP8G9zzBapjknUfN6icJBzoF0FtsBWzx9WR3IGwSpq%2Bud9AD27r83B1Ll6ygjw6jNBv2Ylk9ro8egcc31l25&X-Amz-Signature=8feb45027a5f5909db2e85cdf019b4e9723e426246ad6402fc00692e9186b807&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
