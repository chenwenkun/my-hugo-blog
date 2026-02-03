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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZQCPTUXH%2F20260203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260203T184136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJIMEYCIQC%2BPyY8rxN98Rd5GEQMUyrcNC%2BHqhOTU%2BgXS2Lp12q33gIhAJ425ZQN%2BeMdOs%2Bz0IXmmLIQ%2Fm0vawOqX5Yj%2BkG%2BYpMeKv8DCAMQABoMNjM3NDIzMTgzODA1IgzVWt8Uj1ZxuZpE7lgq3AOJa4DNfI9fmHBmu4FLTtwk3VBrioRlexU2XHCd97QBTcRozWDqbvUHZtCKXo4hVBYiyqcFqWo5hdMhd%2BiPq5iicpu00fi1Avx%2ByocWeEaqcoBRHavZNsEJZZQxwkozlId1bmEb%2B8uyf4g1KhlZVCEiNp31IP4k%2BPGzHXnoZwX7hYYA%2FLL%2Bn5XMSs%2FliWTBBjVDMCgNhSPCt80bMil2w%2B62Czrw5f5u0qnM11fvsIy73tdeLPBvHhg%2FCNAf8xXmonaqLTU%2BEW47SFXV7RLrh6K4PQ27FP%2FLBDZt4yhpxtjrnboMxqlKuJxfRBljssQz1IKQlLaTrKEbzBtYaFinJ0FyRn%2F5XNICYU0pO4%2Bs41GG9ld8Kdee5RTjoXW0b8RoZVClYkGwZK0BCRFZ%2FKNXq0umoaqoJUKrsJ3Dr5t8DloVaYWIthM7M7ijSxB2VSMu4sO96HT6UjHWDAkmJ9ho5y8GWKEH0DT0nuPbQDmC6JVWfecJTK7act7W3OKAU0exZhPzxcePWeCPaMdXrkjjDFoUkRNSR2UVNs8VY8vn4ZccIkL2tPlMwAAt9L0X%2FXUyFmffCMx5HnOh5rY54HZuN%2FkNKV9aAfAxouDf00Vcat341XwFayq%2B0Nf11VWr9DCk%2BIjMBjqkAZ3EZ4YWRW%2F%2BTcLTxwN%2FXVgLyJxDgr%2BwGKzEopqobJIjGPq3%2F3opv0uOWooPO98dqrpPu2vS90TpgeOFV5OaFBsH4euPpPcegYGBTpXuxjewPPb%2BhDoPql%2Feog%2FBhwuAvbHn9kHDCWA%2FcU%2BsHAYd49E53j8MCgd0CQgU70PmOt4RVlWYBiO1sjsihOGJoaioAW3s5JnkaBc2yQtC%2Fzl42LJVg5hL&X-Amz-Signature=1aa085d81b14c9c84c0fcc0bc862326b434d4d6896b8e27c09807fcf5150429c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZQCPTUXH%2F20260203%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260203T184136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDsaCXVzLXdlc3QtMiJIMEYCIQC%2BPyY8rxN98Rd5GEQMUyrcNC%2BHqhOTU%2BgXS2Lp12q33gIhAJ425ZQN%2BeMdOs%2Bz0IXmmLIQ%2Fm0vawOqX5Yj%2BkG%2BYpMeKv8DCAMQABoMNjM3NDIzMTgzODA1IgzVWt8Uj1ZxuZpE7lgq3AOJa4DNfI9fmHBmu4FLTtwk3VBrioRlexU2XHCd97QBTcRozWDqbvUHZtCKXo4hVBYiyqcFqWo5hdMhd%2BiPq5iicpu00fi1Avx%2ByocWeEaqcoBRHavZNsEJZZQxwkozlId1bmEb%2B8uyf4g1KhlZVCEiNp31IP4k%2BPGzHXnoZwX7hYYA%2FLL%2Bn5XMSs%2FliWTBBjVDMCgNhSPCt80bMil2w%2B62Czrw5f5u0qnM11fvsIy73tdeLPBvHhg%2FCNAf8xXmonaqLTU%2BEW47SFXV7RLrh6K4PQ27FP%2FLBDZt4yhpxtjrnboMxqlKuJxfRBljssQz1IKQlLaTrKEbzBtYaFinJ0FyRn%2F5XNICYU0pO4%2Bs41GG9ld8Kdee5RTjoXW0b8RoZVClYkGwZK0BCRFZ%2FKNXq0umoaqoJUKrsJ3Dr5t8DloVaYWIthM7M7ijSxB2VSMu4sO96HT6UjHWDAkmJ9ho5y8GWKEH0DT0nuPbQDmC6JVWfecJTK7act7W3OKAU0exZhPzxcePWeCPaMdXrkjjDFoUkRNSR2UVNs8VY8vn4ZccIkL2tPlMwAAt9L0X%2FXUyFmffCMx5HnOh5rY54HZuN%2FkNKV9aAfAxouDf00Vcat341XwFayq%2B0Nf11VWr9DCk%2BIjMBjqkAZ3EZ4YWRW%2F%2BTcLTxwN%2FXVgLyJxDgr%2BwGKzEopqobJIjGPq3%2F3opv0uOWooPO98dqrpPu2vS90TpgeOFV5OaFBsH4euPpPcegYGBTpXuxjewPPb%2BhDoPql%2Feog%2FBhwuAvbHn9kHDCWA%2FcU%2BsHAYd49E53j8MCgd0CQgU70PmOt4RVlWYBiO1sjsihOGJoaioAW3s5JnkaBc2yQtC%2Fzl42LJVg5hL&X-Amz-Signature=9f7e9f90656e748a18f0cab4cd25ad352a113518be5bdbeb9690189156f653a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
