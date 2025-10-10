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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VMCTQREJ%2F20251010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251010T061631Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQDdWjirA8YIteI3GzePMQvh7nD97eW5P7sgIY0FGai3ogIhAIJtwRcJ9z%2BgvG%2BmtTioUekKy%2Fa8snqD5G6PVtsuVVaHKogECOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyrB3sbMlc6JQJsYAcq3APUhDbQNmmcygsIrLllBeB86elpWajQB64f6TquN4iAGefnA73dRFFbjgRLglz3K9cmC93MBBBkRFzjzbPevxOrpdtUAmJk4dG6bqFuQ71KOQBxCf6ntEaCJARxwS%2BbMnnhLnc86ST6PkiMZNPVyNujF%2FOYqGht%2B0tOOcPFNC0KVGe1BxnNqnpx3vfd8D%2FzMWsF6HOCR5bdiOUCUnqhu4Tuy2a67tadAaCXlvt14N3aR6AhYvpBGSwPgCfzrKuNagYou2rwXtsmX7S9TYuxY8IVW%2B0SwehwwZsy93WqDR%2FfNeWNctktchc8nNelzVhSh31HBv1XC5STJChVG7TveRr5Z1k895U5Li1xnqfSqldsX9Q23PwW0iuQCvmtaCBXzsQ5fIWG1lNvhpCgKvIwJ%2BevxsdPrVHINyco58wgivQewcH8ll3UmepCN3Pa%2BFWzvo6vGmTbcXYNiBhR45Mg6Gs4Yh1%2BhdJK1brTq4vDzLGScd9mCx0HRecUp6HuIvhf2iET18pz1WW1YccSAtLJu8sTPZxsgXZDsE4rAoI%2FmYyCIlIjfpHDU8LheYcdnYnzIbeT1oEDjy7GE6LWwJG8jm4NwAbqnDQauKqIdL1H%2FJAJbjWVbWKBRVuKyxBSFDDds6LHBjqkAWJOzjS%2BchSH4X6MTfsslvi6EU8HeU941o82S7ZhG2FTsj034J6w87PGXSBPe0epqblDwLbNde5q3dsQVyciXFSliK3mVrQSYbYQhs9JnYH7UE3OSHVe1MFjv9iOs%2B1jjqtIYzU03QO6l%2FqjStt9QHu4PmaBKx1rZU3Cv37jjHMSXw0MhteLTPfYCf0NI4IMeDE0fDsSN89zanDu8k9lfEKe95S5&X-Amz-Signature=8af2ae502bb487d87085b739de15c9070a45850154de3efd497152a88f97961c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VMCTQREJ%2F20251010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251010T061631Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQDdWjirA8YIteI3GzePMQvh7nD97eW5P7sgIY0FGai3ogIhAIJtwRcJ9z%2BgvG%2BmtTioUekKy%2Fa8snqD5G6PVtsuVVaHKogECOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyrB3sbMlc6JQJsYAcq3APUhDbQNmmcygsIrLllBeB86elpWajQB64f6TquN4iAGefnA73dRFFbjgRLglz3K9cmC93MBBBkRFzjzbPevxOrpdtUAmJk4dG6bqFuQ71KOQBxCf6ntEaCJARxwS%2BbMnnhLnc86ST6PkiMZNPVyNujF%2FOYqGht%2B0tOOcPFNC0KVGe1BxnNqnpx3vfd8D%2FzMWsF6HOCR5bdiOUCUnqhu4Tuy2a67tadAaCXlvt14N3aR6AhYvpBGSwPgCfzrKuNagYou2rwXtsmX7S9TYuxY8IVW%2B0SwehwwZsy93WqDR%2FfNeWNctktchc8nNelzVhSh31HBv1XC5STJChVG7TveRr5Z1k895U5Li1xnqfSqldsX9Q23PwW0iuQCvmtaCBXzsQ5fIWG1lNvhpCgKvIwJ%2BevxsdPrVHINyco58wgivQewcH8ll3UmepCN3Pa%2BFWzvo6vGmTbcXYNiBhR45Mg6Gs4Yh1%2BhdJK1brTq4vDzLGScd9mCx0HRecUp6HuIvhf2iET18pz1WW1YccSAtLJu8sTPZxsgXZDsE4rAoI%2FmYyCIlIjfpHDU8LheYcdnYnzIbeT1oEDjy7GE6LWwJG8jm4NwAbqnDQauKqIdL1H%2FJAJbjWVbWKBRVuKyxBSFDDds6LHBjqkAWJOzjS%2BchSH4X6MTfsslvi6EU8HeU941o82S7ZhG2FTsj034J6w87PGXSBPe0epqblDwLbNde5q3dsQVyciXFSliK3mVrQSYbYQhs9JnYH7UE3OSHVe1MFjv9iOs%2B1jjqtIYzU03QO6l%2FqjStt9QHu4PmaBKx1rZU3Cv37jjHMSXw0MhteLTPfYCf0NI4IMeDE0fDsSN89zanDu8k9lfEKe95S5&X-Amz-Signature=62cd7c4d93e52a305a625f2de40ee2c9bab3329644b04c681f1e37de28cd0f43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
