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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z3727OPR%2F20260121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260121T005953Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDiW%2B2Ta5ph6ZEwqPksZft2xGnsUtnNkdG9se2odbtvhgIgcAcYqDzcnQOmXlg2JrsKC5l%2FsOFooJ5qSQ7fIPiCr9AqiAQIuf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOnDa%2B676kglm3AaUyrcAwUaxcH2woOt6MnbujUcPs%2BU4dHCxl69dpOk7X6sjgtKsWFD33xuDcNl2%2F%2BjWDD3PsQPH6wkvx3z5r6TWZUCEbeX1onl%2BElfG93gmM3IV4dMMExbp9auzO9dF2WPKcikk9m%2B%2B6HvnZGETLdbFRvih4PHtIKvYzmRMeQOKnaXkqJpv2UAAfaS1wXhwOSI5gS9Yj99BSYEFsfXCgt1fMRmf1n9sEszvG0JgcwMm2yvp6k5vf5MFfpErKPpRVEyrcsCwC9VMQaWYdgdGjU%2BEJN%2F3LsjPAC6rA6jqc8whRwHQ6lfXiZ26KP7JqMOvcmFpN1VbYUR1RQXnp%2BdVWfNFjLD%2FbKE7o7EN0SBNrVplTCJKT5HmsAZ0eRNSiQifgcSUmS5%2BJJXwFycn8TITjz9BpCWAiJKsk8XweQFn1VvFdtkM4F4rdn85tLPsN%2BAh3iWoT7RSl8G3ZCNiCatceEEqzEk3kISXcc31UaHY%2FDt5aGV2LH7F4dEib%2BfOL%2FDN2iWZI4rrHRN5eQxJtLU8f%2BY1EwoLvuBk64%2BAR97l0x7fF1kefLnRW%2BRJ1TOzR5Lzap8rmco2gU%2FNcOblonJLa5yYdTH1fP4HKvb9VMfFC%2B9FhISA6EIZkwqDZxU%2FXO2kxOeMJSxwMsGOqUBd5D7qeC8i09O1PGd9nhPDNUwOM6XLiHWQt%2B%2FiIvrSqms%2B33WGZc5jSJmKB6AxcIHqZKkqbMVm7VdHSrOOFtmrtqPpym27InwMZp8sBWXJEbCsTtUHA7UBPTLllxc5fIs7Fin%2BuMyOH%2FE1z6lnYI8otn7dOhwYxyq3z9HJV7tMuROmRnp%2BiwLdyHP%2Fap%2BdzP5HI8hNl1eWYYV9Ic34O5%2F2r%2B7RjMZ&X-Amz-Signature=ebada96a05ae82d987f3a4cf0e1efaabc39d312bc08898fde1ad241e451fd982&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z3727OPR%2F20260121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260121T005953Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDiW%2B2Ta5ph6ZEwqPksZft2xGnsUtnNkdG9se2odbtvhgIgcAcYqDzcnQOmXlg2JrsKC5l%2FsOFooJ5qSQ7fIPiCr9AqiAQIuf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOnDa%2B676kglm3AaUyrcAwUaxcH2woOt6MnbujUcPs%2BU4dHCxl69dpOk7X6sjgtKsWFD33xuDcNl2%2F%2BjWDD3PsQPH6wkvx3z5r6TWZUCEbeX1onl%2BElfG93gmM3IV4dMMExbp9auzO9dF2WPKcikk9m%2B%2B6HvnZGETLdbFRvih4PHtIKvYzmRMeQOKnaXkqJpv2UAAfaS1wXhwOSI5gS9Yj99BSYEFsfXCgt1fMRmf1n9sEszvG0JgcwMm2yvp6k5vf5MFfpErKPpRVEyrcsCwC9VMQaWYdgdGjU%2BEJN%2F3LsjPAC6rA6jqc8whRwHQ6lfXiZ26KP7JqMOvcmFpN1VbYUR1RQXnp%2BdVWfNFjLD%2FbKE7o7EN0SBNrVplTCJKT5HmsAZ0eRNSiQifgcSUmS5%2BJJXwFycn8TITjz9BpCWAiJKsk8XweQFn1VvFdtkM4F4rdn85tLPsN%2BAh3iWoT7RSl8G3ZCNiCatceEEqzEk3kISXcc31UaHY%2FDt5aGV2LH7F4dEib%2BfOL%2FDN2iWZI4rrHRN5eQxJtLU8f%2BY1EwoLvuBk64%2BAR97l0x7fF1kefLnRW%2BRJ1TOzR5Lzap8rmco2gU%2FNcOblonJLa5yYdTH1fP4HKvb9VMfFC%2B9FhISA6EIZkwqDZxU%2FXO2kxOeMJSxwMsGOqUBd5D7qeC8i09O1PGd9nhPDNUwOM6XLiHWQt%2B%2FiIvrSqms%2B33WGZc5jSJmKB6AxcIHqZKkqbMVm7VdHSrOOFtmrtqPpym27InwMZp8sBWXJEbCsTtUHA7UBPTLllxc5fIs7Fin%2BuMyOH%2FE1z6lnYI8otn7dOhwYxyq3z9HJV7tMuROmRnp%2BiwLdyHP%2Fap%2BdzP5HI8hNl1eWYYV9Ic34O5%2F2r%2B7RjMZ&X-Amz-Signature=d2b24d8baec815bb2ee6f39e13b22f0ad505d7a7a1a62bf2d4154e1098dd45fd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
