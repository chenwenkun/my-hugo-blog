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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V7JGSXB4%2F20260116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260116T122351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDe7tbU3lxAYwebN8NlHM3%2FWo%2FSqZ7P1fFcZsQTs0EJewIhAMNa1NspiJa2idkCNH9pmGSZ6TVA2lWlOvaaWnnBz%2BzGKv8DCE0QABoMNjM3NDIzMTgzODA1IgziO7ZazEGVxXiU0mEq3AOrrABs9PO%2BOTsNq5EwO9cGMBZr%2FctP5l1ZJhhBgBQKdM%2Bmkn0Cm5tajBtj0iCZdDmUsIFjMcLoAoIMVX8EzDNeA%2BV2oR5iMG5S0QB3lkGkKHy%2Bjt97%2BGrzwRJatsTqh7zuHIAZp%2FGa2u%2FuoR4LJAlD5cRL04lavbUtyxsKkvAwo3UWcAiMVuxlNFvpv9Ni0AaEES85vqwIfcoytKX8k9CWF2rpwkOmEfQLzyzUepedHlv0MGc67LQAmGhKrOVraWsOZorsB3txFEwRf6m6N10mPVSLRe1Lo5AU3U8V27MBzJbo4uRMtNYU39ay1Yn34Mt81EbXi2JHQFsTvvSTCJh6J0LnZdc3YFmYvEg0UAhlAWc28O1dLB5yCLoePlpuskdOlUdQeb3P03AHa8U%2F8oJNdyjE%2Bfa%2BpCgFa65Q%2FG1UIZIPBoKlMBLdGVQKPTqrsXSLHS3Ick5WR2rbJsXdxDc69M03g0cvetPOs0gd%2B%2F13le3RvkqTBo%2BnLAkGRxy%2F6ceRMxfsqHPsDPHLddSBQshq1yAWfY77zQeTgPrkpwRntA2Pucatn%2BDY%2BKuuO2jQGAosH15az93xcdUSKnewX4%2BFBVO6wAN498X4FLIUDHEWZS49U4l69V4jb6TNqjCxw6jLBjqkASkmaIBvkeOLeIIeeZmIXgLajtbBRwOAVtGht23NnAKeJ9DdEd7%2BZ%2Bi7ksNAGlGVjjMq5Q7R9l3C48xW6pkH24HbUB0EW7YYcWX%2BdwcKD2KuWu8MJyV4cXwEvwEe8BR4qal4T4rtIac4MsthxBvlMPx6D0I3U0T7XBsNMNr7%2FOjfGeVCKnQWzb%2F4XaPdXhGNOguPf1LNKkeKruRN3PIXbNvqNVil&X-Amz-Signature=c1607955bce40a7237c1d2a67355801bc574a7b1f9c95c8eb4f3d5736f0dee27&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V7JGSXB4%2F20260116%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260116T122351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDe7tbU3lxAYwebN8NlHM3%2FWo%2FSqZ7P1fFcZsQTs0EJewIhAMNa1NspiJa2idkCNH9pmGSZ6TVA2lWlOvaaWnnBz%2BzGKv8DCE0QABoMNjM3NDIzMTgzODA1IgziO7ZazEGVxXiU0mEq3AOrrABs9PO%2BOTsNq5EwO9cGMBZr%2FctP5l1ZJhhBgBQKdM%2Bmkn0Cm5tajBtj0iCZdDmUsIFjMcLoAoIMVX8EzDNeA%2BV2oR5iMG5S0QB3lkGkKHy%2Bjt97%2BGrzwRJatsTqh7zuHIAZp%2FGa2u%2FuoR4LJAlD5cRL04lavbUtyxsKkvAwo3UWcAiMVuxlNFvpv9Ni0AaEES85vqwIfcoytKX8k9CWF2rpwkOmEfQLzyzUepedHlv0MGc67LQAmGhKrOVraWsOZorsB3txFEwRf6m6N10mPVSLRe1Lo5AU3U8V27MBzJbo4uRMtNYU39ay1Yn34Mt81EbXi2JHQFsTvvSTCJh6J0LnZdc3YFmYvEg0UAhlAWc28O1dLB5yCLoePlpuskdOlUdQeb3P03AHa8U%2F8oJNdyjE%2Bfa%2BpCgFa65Q%2FG1UIZIPBoKlMBLdGVQKPTqrsXSLHS3Ick5WR2rbJsXdxDc69M03g0cvetPOs0gd%2B%2F13le3RvkqTBo%2BnLAkGRxy%2F6ceRMxfsqHPsDPHLddSBQshq1yAWfY77zQeTgPrkpwRntA2Pucatn%2BDY%2BKuuO2jQGAosH15az93xcdUSKnewX4%2BFBVO6wAN498X4FLIUDHEWZS49U4l69V4jb6TNqjCxw6jLBjqkASkmaIBvkeOLeIIeeZmIXgLajtbBRwOAVtGht23NnAKeJ9DdEd7%2BZ%2Bi7ksNAGlGVjjMq5Q7R9l3C48xW6pkH24HbUB0EW7YYcWX%2BdwcKD2KuWu8MJyV4cXwEvwEe8BR4qal4T4rtIac4MsthxBvlMPx6D0I3U0T7XBsNMNr7%2FOjfGeVCKnQWzb%2F4XaPdXhGNOguPf1LNKkeKruRN3PIXbNvqNVil&X-Amz-Signature=2b51fcdcea7190fd8e14d23530bbfa7af0bef893ddad6d38295cffcb9f8bf69f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
