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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WYYBG2I3%2F20251113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251113T181559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDnKSjtNoifmtsQzIpRw3l6g3L0hEfJXRq4BH2yPniDfAiEAnwHn7ttGgbWqJnN8%2FtdB9Yh2Ia3L3unNtkMV2xdbEK0q%2FwMIUxAAGgw2Mzc0MjMxODM4MDUiDEnkBbeXEYej4fOu%2BircA6dZplZQpvqst%2BXWKEUulciKYbtCF8sz%2FfwgAfU594ITmWLqPtGvPnJ4T9sZjzAB4g4rIIfonWvpRVJODBKEURqlpswyfeYj45fpOUIE2gf8msaVpB3fC8SVmejn4S%2Faul35ysI%2FKskXJE%2FrEe0hzsStEUai5wdlHBbmHLwnyzvOBdZR27nRI81oVGnf4XQo3ekbiSsIk6Ppe3HumUEf19%2FTvHeOd8aCUH5cpVs5DArCtQZMs8mMtJJl2tBDVW1kvBiriRpZ8rLhThRyiR8QEDHH3D8ODVLwji0qeuDz3ivRzV8GeqSlAOhxG0a9Pz9325MhdhGvqk6izyQ3VXCS%2BgdsRHUSIgTemrFqfwyhbAXDNcIboKEOwFFLbJwx%2FbWNCHZqrsLlOenmakY0C8bl2wx4zbd76%2FVJOqc%2BAiI9AV8IJBtKm4DjHLowFjJluPZ1ehqF0prWQrnMO9Y8MIyfooM8DIQnYnkI9xDBWi70%2FCYhczmmoiQahK8EThNt2C%2BEziB%2BearKE4wG85m56Y7%2BS4X%2Boaoqo9PfA2ZDCJMzmxS2mX3Rb%2BkYGMc4JFbQ9tyRbxFRmJFtsQrarQEiLDocDiUh0EsXBBHNpR%2BbEXzqu0GQqbLRRpvxpD%2FWN4RAMKGp2MgGOqUB2BU2oKckoPiFakdKGHaPZeD6%2BJF7JSBM5ooYsiZ0mAJdXUS75JjZp%2FKQBC45MxSg2hoZASUX2%2BexFUpFejH%2Bdu0mEXeatPxBgck5WR8UYFJct6v1XjMDvVzgpTtt83luScak64DIHC2wO%2FVGnxJmqqT0Oo9HkWW5nYE0i85TDvGfX8BCsjjDn%2BUlMSzzrA8OzBdJkqdpGHllz5L65%2BlxWe0Jj21c&X-Amz-Signature=2bb8926e7dfee7b9dbc1b5413963642ac7358b323912b45a44ba12560758d97f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WYYBG2I3%2F20251113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251113T181559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDnKSjtNoifmtsQzIpRw3l6g3L0hEfJXRq4BH2yPniDfAiEAnwHn7ttGgbWqJnN8%2FtdB9Yh2Ia3L3unNtkMV2xdbEK0q%2FwMIUxAAGgw2Mzc0MjMxODM4MDUiDEnkBbeXEYej4fOu%2BircA6dZplZQpvqst%2BXWKEUulciKYbtCF8sz%2FfwgAfU594ITmWLqPtGvPnJ4T9sZjzAB4g4rIIfonWvpRVJODBKEURqlpswyfeYj45fpOUIE2gf8msaVpB3fC8SVmejn4S%2Faul35ysI%2FKskXJE%2FrEe0hzsStEUai5wdlHBbmHLwnyzvOBdZR27nRI81oVGnf4XQo3ekbiSsIk6Ppe3HumUEf19%2FTvHeOd8aCUH5cpVs5DArCtQZMs8mMtJJl2tBDVW1kvBiriRpZ8rLhThRyiR8QEDHH3D8ODVLwji0qeuDz3ivRzV8GeqSlAOhxG0a9Pz9325MhdhGvqk6izyQ3VXCS%2BgdsRHUSIgTemrFqfwyhbAXDNcIboKEOwFFLbJwx%2FbWNCHZqrsLlOenmakY0C8bl2wx4zbd76%2FVJOqc%2BAiI9AV8IJBtKm4DjHLowFjJluPZ1ehqF0prWQrnMO9Y8MIyfooM8DIQnYnkI9xDBWi70%2FCYhczmmoiQahK8EThNt2C%2BEziB%2BearKE4wG85m56Y7%2BS4X%2Boaoqo9PfA2ZDCJMzmxS2mX3Rb%2BkYGMc4JFbQ9tyRbxFRmJFtsQrarQEiLDocDiUh0EsXBBHNpR%2BbEXzqu0GQqbLRRpvxpD%2FWN4RAMKGp2MgGOqUB2BU2oKckoPiFakdKGHaPZeD6%2BJF7JSBM5ooYsiZ0mAJdXUS75JjZp%2FKQBC45MxSg2hoZASUX2%2BexFUpFejH%2Bdu0mEXeatPxBgck5WR8UYFJct6v1XjMDvVzgpTtt83luScak64DIHC2wO%2FVGnxJmqqT0Oo9HkWW5nYE0i85TDvGfX8BCsjjDn%2BUlMSzzrA8OzBdJkqdpGHllz5L65%2BlxWe0Jj21c&X-Amz-Signature=a84069735a08d3594416ed7dbe9e0ade992325bd59e5c8d1b954873ca5389c75&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
