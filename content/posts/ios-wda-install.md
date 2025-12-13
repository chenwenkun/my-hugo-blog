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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEXPD6LG%2F20251213%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251213T181441Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIF%2F6cLgQWv9%2BozWgv4GIiFFgRQRfvD5rXcIMW5VERG%2FWAiEAjMqHQLjLJPvCAR%2FJUehZXuM4dhOBsiqZd7q0GcCSOy0q%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDGkVNffi%2FlVkh84rZircA1cenVzO6UOi%2BH8PfLpnU0FUP%2BsQfQFBQbkr%2Bl3WNLPlE55FMM6C6wYa61Q8Kujklj5VGYdxWqwggVmEIFIifvoVzhTSxgjaqvSV%2BTq7%2Bc0YVbOzUDkIBmo1zhz28J8upPTXckl3mEP%2FMzqVRr%2Bq4Tgw9BShaGvunJ6tVK3PtIabVzFmqbYVQo1VFBSgUd8uN%2B0tLytWkzu3e3gQf27qaITrxgo3a%2BedwpfavJl6I1mTVe%2BySu5sTfDIfbDHL2h99bzVcL7zkYaq1HTD69NoHAjydX2b1a5Eoa9o1XbDh8CdswBlwonbsp268P4%2BVlGCe9%2F3EDWt78UdlHzdwy2cz2PDcJVHZB253460%2Bbj5UkkLhvWWOwEBSNv2HluDx9CVdIIrNGYayMkfNorGB5YmWrs4yxa%2FTYqAB9KpjKfj2CCc%2BjppbaExp%2FUPg3JgqVPpecAmkWXr4%2BcCASe30Y2cRFcwVuyIPoL06YEJcsp90EpF2rOfS4ypnxu9KTvh%2FxwQCx6C56MtMAMQar9SptdWO7gLQa2sOQDlugKyEL2P2VUSLuGxo9U9fbYvsFNBpKuKSA20II2PAGZMS7WypZ5FzjgkKuw73WKJ3e4WqJoJEuAZIzeOmJVTBWwTFzIMMMK79skGOqUBqM0shglKwEl1AB%2Bxjnvh4b0%2B71izQxysi0Np0bTORuYDuEEC19V3IzJhY69YHRbU6mdvSJ0f%2B3WlkhSWCeNQwLabqb2silDWMFLe9H1VawJYCVtNzRt09qUaMXGl2x3y8VEeuIkb8S2DStlHrTU5hJWfhEjR7jGiZ1AukhvPlICGJDmRtow5DtSg3pnSsbr3A4wosqJNK88hCSuSnXqPGEzV%2Fp3S&X-Amz-Signature=d68478e6dea53f867783b7f51f1a01c3818f19b2f0a29c5eace34f934b86520f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WEXPD6LG%2F20251213%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251213T181441Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIF%2F6cLgQWv9%2BozWgv4GIiFFgRQRfvD5rXcIMW5VERG%2FWAiEAjMqHQLjLJPvCAR%2FJUehZXuM4dhOBsiqZd7q0GcCSOy0q%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDGkVNffi%2FlVkh84rZircA1cenVzO6UOi%2BH8PfLpnU0FUP%2BsQfQFBQbkr%2Bl3WNLPlE55FMM6C6wYa61Q8Kujklj5VGYdxWqwggVmEIFIifvoVzhTSxgjaqvSV%2BTq7%2Bc0YVbOzUDkIBmo1zhz28J8upPTXckl3mEP%2FMzqVRr%2Bq4Tgw9BShaGvunJ6tVK3PtIabVzFmqbYVQo1VFBSgUd8uN%2B0tLytWkzu3e3gQf27qaITrxgo3a%2BedwpfavJl6I1mTVe%2BySu5sTfDIfbDHL2h99bzVcL7zkYaq1HTD69NoHAjydX2b1a5Eoa9o1XbDh8CdswBlwonbsp268P4%2BVlGCe9%2F3EDWt78UdlHzdwy2cz2PDcJVHZB253460%2Bbj5UkkLhvWWOwEBSNv2HluDx9CVdIIrNGYayMkfNorGB5YmWrs4yxa%2FTYqAB9KpjKfj2CCc%2BjppbaExp%2FUPg3JgqVPpecAmkWXr4%2BcCASe30Y2cRFcwVuyIPoL06YEJcsp90EpF2rOfS4ypnxu9KTvh%2FxwQCx6C56MtMAMQar9SptdWO7gLQa2sOQDlugKyEL2P2VUSLuGxo9U9fbYvsFNBpKuKSA20II2PAGZMS7WypZ5FzjgkKuw73WKJ3e4WqJoJEuAZIzeOmJVTBWwTFzIMMMK79skGOqUBqM0shglKwEl1AB%2Bxjnvh4b0%2B71izQxysi0Np0bTORuYDuEEC19V3IzJhY69YHRbU6mdvSJ0f%2B3WlkhSWCeNQwLabqb2silDWMFLe9H1VawJYCVtNzRt09qUaMXGl2x3y8VEeuIkb8S2DStlHrTU5hJWfhEjR7jGiZ1AukhvPlICGJDmRtow5DtSg3pnSsbr3A4wosqJNK88hCSuSnXqPGEzV%2Fp3S&X-Amz-Signature=348a085d075fe67c9525afd8524bf362c8c9f94d481f1922833e1cb38ab66465&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
