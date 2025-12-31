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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VWH5BNTI%2F20251231%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251231T122239Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIB0fUGP7gEDW0evPtGll0qXNdEUMYJ1GfxhOZ6DXBcXgAiBRc1mz3JDGikGOuInkcrhjH6jEX%2BgviEY0M6PCRQNqKCqIBAjL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMh1jdViDKGFboVrX6KtwDtDKQ9RYqUAP0dSMftEGSSqv2pbfYFxnEqydhtGK2lyqVCPvqYHan17fv6DnMhBbKqE2KvGKAymH32GEWdy%2B2LpXHV2kocf%2BOL5saEX0jazoygEPNV6M5oR2uWqk1EPPUR5XbBjMSkAwA0%2BqVHra1NvrVDdFYol68JX7wQHIJIuhDOXSKgcmcgZpFmcPiDFYodJFVVITtNM7JkIavkTf5bVA07K0IsgAEUUyTE%2Fm%2Fre0UfLr6MuKHDRBk2%2BXQGefdEld04rM66t%2BTr13P7CCaLljfKkTnQildGOEJTgeynXFMhpVuWyuD%2Bt77L1XAuxp9GTg9LeFceB66tYy2rs%2BWG2nR51Fic75YxG7FSpyG58Q952fQccgopa4cNaYkQKT%2FsGzirw7j77qKl9C0mdOwdQJGu8J%2BzBEedbo5ViMm8HsDrofWL9hqRpVX3z8UlHCFgK%2FVWFjOSctecVWw%2BenTsJBPE52lTpghNZg7CQozjFqjRdMthJP6ieSKE8B3toU237gSHCdcxfU8RqKWYkVN9ULIseNJYMpwddTvJAE4iEhN%2BHNNXRPuAMv9L89DQwrSarq0rSxNydN4JlNL7sV7L8PIOw5njr8rDZoMGv9VUIcV6RyivxVIjaHGMlgw%2B%2FHTygY6pgFliZxilEymBddzW7ZQsdPn4rF%2BK6rEf1Xso9UbmE4keYYuccGEPthnK16PmuiIr7RGyQW07BJYlifKnfhDxEPkpqb%2FnRPQ3U5IcLo3NwrESfm75tiCojELPq90yzYOIKa5hNK549qrHMvt%2BKY8MPHrxSRS75q1qb7p1vsW5%2FDg3tz5f2ONiuV0StHsIM4tGMgDh%2FjGyp5T9k2bJwOmMFbxjWChdcOL&X-Amz-Signature=8f8dd1223224ded090f3649e0acb28117be8f8fbb067303dbf43b25fcbf1d08e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VWH5BNTI%2F20251231%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251231T122239Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIB0fUGP7gEDW0evPtGll0qXNdEUMYJ1GfxhOZ6DXBcXgAiBRc1mz3JDGikGOuInkcrhjH6jEX%2BgviEY0M6PCRQNqKCqIBAjL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMh1jdViDKGFboVrX6KtwDtDKQ9RYqUAP0dSMftEGSSqv2pbfYFxnEqydhtGK2lyqVCPvqYHan17fv6DnMhBbKqE2KvGKAymH32GEWdy%2B2LpXHV2kocf%2BOL5saEX0jazoygEPNV6M5oR2uWqk1EPPUR5XbBjMSkAwA0%2BqVHra1NvrVDdFYol68JX7wQHIJIuhDOXSKgcmcgZpFmcPiDFYodJFVVITtNM7JkIavkTf5bVA07K0IsgAEUUyTE%2Fm%2Fre0UfLr6MuKHDRBk2%2BXQGefdEld04rM66t%2BTr13P7CCaLljfKkTnQildGOEJTgeynXFMhpVuWyuD%2Bt77L1XAuxp9GTg9LeFceB66tYy2rs%2BWG2nR51Fic75YxG7FSpyG58Q952fQccgopa4cNaYkQKT%2FsGzirw7j77qKl9C0mdOwdQJGu8J%2BzBEedbo5ViMm8HsDrofWL9hqRpVX3z8UlHCFgK%2FVWFjOSctecVWw%2BenTsJBPE52lTpghNZg7CQozjFqjRdMthJP6ieSKE8B3toU237gSHCdcxfU8RqKWYkVN9ULIseNJYMpwddTvJAE4iEhN%2BHNNXRPuAMv9L89DQwrSarq0rSxNydN4JlNL7sV7L8PIOw5njr8rDZoMGv9VUIcV6RyivxVIjaHGMlgw%2B%2FHTygY6pgFliZxilEymBddzW7ZQsdPn4rF%2BK6rEf1Xso9UbmE4keYYuccGEPthnK16PmuiIr7RGyQW07BJYlifKnfhDxEPkpqb%2FnRPQ3U5IcLo3NwrESfm75tiCojELPq90yzYOIKa5hNK549qrHMvt%2BKY8MPHrxSRS75q1qb7p1vsW5%2FDg3tz5f2ONiuV0StHsIM4tGMgDh%2FjGyp5T9k2bJwOmMFbxjWChdcOL&X-Amz-Signature=ed831e4e04cc82865dcf6c10da55b715154e8ff5e7156025dcb5152f4e738950&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
