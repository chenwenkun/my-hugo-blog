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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466436CAO4F%2F20260601%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260601T023813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJIMEYCIQCzLt5YtIxYaIHClLavp4vLjd0WkUe505lH2Kn2ojrs1gIhAODLUHmZFJlZpyFGmhq0Cxje1F1ogSkxhTYkGvJGd9YeKv8DCAIQABoMNjM3NDIzMTgzODA1Igy3QdOXMPKx4vSdfPMq3ANCJWke4dIyH8qvHLLy6GyI51jqtXOPeXyrocBT%2BFBF5LXYrrfiR74UbQKiSkR4zUGxKQgAk5SXY%2BvCPBBoXa1QF974%2BoJj2avLNx0gZqy1%2Bb2EgSdnkWOtcpWdJHuPuUN4y5GLXoX4R5G7aroeOfW0VRbUjJtOi%2B8bIeRhj24P3S8q94yW%2FF5IiMtanT1WRmdJ1pXmkTlqrk%2BaHCAxSNng%2BGEtNan%2BJam4We4aqXY61y%2FcfARhoOqFS2vKcDgel9gPebIjvYlvuJ2RcTsoG%2Fmv%2FDEwYrWUxZpTW9UGso%2FQwDA255qvlALYai2qtPUJTQEU50IDU%2BP5o56ztPwppwWiRRtl2E8un48QbeJEPRM0qahSXbcfmCMzV1uimz27hl%2BSW1ThfpnkGSQadRcyplYltrrWzJE9wKfTncMSZbhin%2BbFd1dzfY8c4FTxtZ2KtyjL0%2ByDXXgyJJQlqfxLWFBOmYcKizwb3O%2F7N1YB%2BDhe2yq6NGGThCiyjwNNskXu%2B41Z3LD2RrZAoovjPZUYJD30SImHswnPw%2BtVjFPuu5ygKrcTJaO29UrIRD2IMWYJFU7U47KCILvP%2FMNxghnxVYkffzaQ9SAtYAF%2FtLYZIusVax%2BKZ00S9MtGxSuQ1DCupvPQBjqkAaZb32kl32aHBkLlFJTNN1slZ4H5HdlCZ8OQ1yztlKZjeMXo2SR%2FrbXz7jPoh6GBVgb54bAlUQP37cUBRBEhbjj%2BNKQmQBjwcXNR6d2otWlY%2FCtqrOT8hO26Y%2BI5NPfmg4V3fZEUJJ%2BHOhZN7eH68%2FEt6qQ9RnLRgaPaDbv0O2W%2BSefe6wL9frWNG%2F8XbgIqXyC3L1QnqSlZO%2Bg03NCgatj5OyCB&X-Amz-Signature=feaffcbdc9cefa4a9e6f18fee57b0f5cafc488f34aaf0aae4866c5760611bc03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466436CAO4F%2F20260601%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260601T023813Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJIMEYCIQCzLt5YtIxYaIHClLavp4vLjd0WkUe505lH2Kn2ojrs1gIhAODLUHmZFJlZpyFGmhq0Cxje1F1ogSkxhTYkGvJGd9YeKv8DCAIQABoMNjM3NDIzMTgzODA1Igy3QdOXMPKx4vSdfPMq3ANCJWke4dIyH8qvHLLy6GyI51jqtXOPeXyrocBT%2BFBF5LXYrrfiR74UbQKiSkR4zUGxKQgAk5SXY%2BvCPBBoXa1QF974%2BoJj2avLNx0gZqy1%2Bb2EgSdnkWOtcpWdJHuPuUN4y5GLXoX4R5G7aroeOfW0VRbUjJtOi%2B8bIeRhj24P3S8q94yW%2FF5IiMtanT1WRmdJ1pXmkTlqrk%2BaHCAxSNng%2BGEtNan%2BJam4We4aqXY61y%2FcfARhoOqFS2vKcDgel9gPebIjvYlvuJ2RcTsoG%2Fmv%2FDEwYrWUxZpTW9UGso%2FQwDA255qvlALYai2qtPUJTQEU50IDU%2BP5o56ztPwppwWiRRtl2E8un48QbeJEPRM0qahSXbcfmCMzV1uimz27hl%2BSW1ThfpnkGSQadRcyplYltrrWzJE9wKfTncMSZbhin%2BbFd1dzfY8c4FTxtZ2KtyjL0%2ByDXXgyJJQlqfxLWFBOmYcKizwb3O%2F7N1YB%2BDhe2yq6NGGThCiyjwNNskXu%2B41Z3LD2RrZAoovjPZUYJD30SImHswnPw%2BtVjFPuu5ygKrcTJaO29UrIRD2IMWYJFU7U47KCILvP%2FMNxghnxVYkffzaQ9SAtYAF%2FtLYZIusVax%2BKZ00S9MtGxSuQ1DCupvPQBjqkAaZb32kl32aHBkLlFJTNN1slZ4H5HdlCZ8OQ1yztlKZjeMXo2SR%2FrbXz7jPoh6GBVgb54bAlUQP37cUBRBEhbjj%2BNKQmQBjwcXNR6d2otWlY%2FCtqrOT8hO26Y%2BI5NPfmg4V3fZEUJJ%2BHOhZN7eH68%2FEt6qQ9RnLRgaPaDbv0O2W%2BSefe6wL9frWNG%2F8XbgIqXyC3L1QnqSlZO%2Bg03NCgatj5OyCB&X-Amz-Signature=33e3fa5e48f0efb3a4e8f2a440252a85b26097084e45cb05ae5d55eb06b3cdea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
