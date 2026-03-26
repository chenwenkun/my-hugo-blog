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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663SEGXEYN%2F20260326%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260326T011912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDbNxll%2BXfEBZw9RP24z0pD8kjb01T1olMlH1xkS361yAiEAvANHYCoIqkxzJIK%2Bzt5Akp7IHPr1QZeRRdNKlv6Or80qiAQIuP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBOFsyKr4m%2FFESAoBCrcA953T84nnVXXGf4qq9BqFVENGbsMn8dpfw4QN0G9ni0RP1X8C%2FhgiIqx4SrfuhTdwO8WBpemya3GXFb%2BzK4IMzcNlAzaSnuz8oPO3BPg1w97aRjQECbRiL9AnPbUF3hsrxJ01%2BH4MxiDKGRMr8kASHXTZHdguPIPR1OMFl%2FQo0B44e3dGP%2BVrgfsayGvYoNy7A6%2FVAtQ85RrkrcZ%2Bf%2FtCW1K2ypk1%2B%2B2utp6v%2BPjDXfBWokXjARsWEgrBbjciyRD0k08YraXhGZA%2Bv3NBsJj6vsRu9CzyJFCUcvclm0sEsANnS%2FuWTYWQeni8VO75D2ayWr8GeRF6dm2BUn0nwznUNwBIJ83Ug1VhztSjDs6%2BbCUZIbVLOhJBEW3QC8gjIoCvYSvqzY7RtWKDmbB0tQyhEB9rxi9l6iEsJehbLzsKM82Sj2m%2BSMM6U4tepcWM6PRZ8S%2BmRpVqTyfUMnUruFW%2FFan6xZI29cJF3sEQcvJK3xohVK496i9sa4l%2F8Iy463OQ00K%2FT24MAu%2B1E7qAWJjJpfHBoAEWquJWsbwBx%2BtUZOTEzyxX3g2LbG%2B%2BNqtTZb4sj%2FupIQ7ZDQc7CDfFlepw5%2BqywzxoFZiJd5cqggFLkrwKEFwkVEeoz%2BqaP%2BSMNTQkc4GOqUBrfzgWZiuRmn6oECHqKJeZVnOwVl2poSUzRAsYhYAmj2JiMLLIcvTYJPev8%2BNgti6i2JidJ0IpSO9phGV5VG%2BO9kqqW5qDf%2Fe%2BG4SqaaTUjBZDvdh3HnsV%2BDKLtff1l6%2Fy7XtiLZJMyPcZOjkYblRjNS0eoQLfGP%2BI15jqoi5F9Onfe6qHRDbzGLRWkLlbYq8lIYY9ZGGZhG3EpfBuDCOrluPSJPj&X-Amz-Signature=ff1295f702456ae112990c6caa37a8142e8e30042189ec8bfa826dcab73e5f32&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663SEGXEYN%2F20260326%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260326T011912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDbNxll%2BXfEBZw9RP24z0pD8kjb01T1olMlH1xkS361yAiEAvANHYCoIqkxzJIK%2Bzt5Akp7IHPr1QZeRRdNKlv6Or80qiAQIuP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBOFsyKr4m%2FFESAoBCrcA953T84nnVXXGf4qq9BqFVENGbsMn8dpfw4QN0G9ni0RP1X8C%2FhgiIqx4SrfuhTdwO8WBpemya3GXFb%2BzK4IMzcNlAzaSnuz8oPO3BPg1w97aRjQECbRiL9AnPbUF3hsrxJ01%2BH4MxiDKGRMr8kASHXTZHdguPIPR1OMFl%2FQo0B44e3dGP%2BVrgfsayGvYoNy7A6%2FVAtQ85RrkrcZ%2Bf%2FtCW1K2ypk1%2B%2B2utp6v%2BPjDXfBWokXjARsWEgrBbjciyRD0k08YraXhGZA%2Bv3NBsJj6vsRu9CzyJFCUcvclm0sEsANnS%2FuWTYWQeni8VO75D2ayWr8GeRF6dm2BUn0nwznUNwBIJ83Ug1VhztSjDs6%2BbCUZIbVLOhJBEW3QC8gjIoCvYSvqzY7RtWKDmbB0tQyhEB9rxi9l6iEsJehbLzsKM82Sj2m%2BSMM6U4tepcWM6PRZ8S%2BmRpVqTyfUMnUruFW%2FFan6xZI29cJF3sEQcvJK3xohVK496i9sa4l%2F8Iy463OQ00K%2FT24MAu%2B1E7qAWJjJpfHBoAEWquJWsbwBx%2BtUZOTEzyxX3g2LbG%2B%2BNqtTZb4sj%2FupIQ7ZDQc7CDfFlepw5%2BqywzxoFZiJd5cqggFLkrwKEFwkVEeoz%2BqaP%2BSMNTQkc4GOqUBrfzgWZiuRmn6oECHqKJeZVnOwVl2poSUzRAsYhYAmj2JiMLLIcvTYJPev8%2BNgti6i2JidJ0IpSO9phGV5VG%2BO9kqqW5qDf%2Fe%2BG4SqaaTUjBZDvdh3HnsV%2BDKLtff1l6%2Fy7XtiLZJMyPcZOjkYblRjNS0eoQLfGP%2BI15jqoi5F9Onfe6qHRDbzGLRWkLlbYq8lIYY9ZGGZhG3EpfBuDCOrluPSJPj&X-Amz-Signature=15bfb621595499f6e34a6f016e29315110936349566712c811050cbfa599d976&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
