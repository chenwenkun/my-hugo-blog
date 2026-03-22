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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667KY7W2BR%2F20260322%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260322T063753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC500S1amkXnidRyf7fD9uxW3edjiWB1rPt1ZwZfQE%2FiQIgAvqI1iWLxEHjHT2nc13C1zHp1NhoNzvJ4jYLeal2mqYq%2FwMIXxAAGgw2Mzc0MjMxODM4MDUiDON4eTB2AfvuFg5OOCrcAwJ7Z%2B1avagGoJn3BQLCC17ok8Gt7lxIJY%2BzBW4zXHmSJz5MC0cdwmKKDnxSi8BbwmzPlE9vR%2BU%2BalRVtql8LjGuVcgefeMdc4B8%2B2ZkC1iZw%2F3QuGkTeKUA42p1G2rRXJhO5LEQLOjpDm1DnjrvEBYxKapwYhfflD57Twx8upPsphXyOtHIkbr8mzcfFsXTj9bo8e1oCS%2Bil%2F1fWFHYuCnhN2ZN4EUCwLMomPBhmLy2jhc1%2FGCjN3S4GwET5QhVAq114xgixpnzGlHt7EzbE9u9FQTs05VpovNsfsPhfT02WMoBLykT6Kw7yV9naG3WX0AAPl2fi67Rz7u6LxlDkbKfThHZ2eQUATTWQ%2FMiavwXY4Wr%2BJ1%2FTDgSsyxwceuYLvuWzPfHMhOnDPbd8EojVIiFi%2BjjMNG%2BkRbLqnKeUk1cLPMTDJWzQl4a0QcY%2BEz%2BIR9xAVCRxyhhVk3MyAcf2m3zLLKkBH%2BxMSybSbZNjx71QffLDp3OZSJx6mq2LAW%2FWaMDKjX4u%2Bt2V9ty1kpDVaaJDE9vjlFSmU7bMYkogVD10pM8FxRajsfS30fxvYKpg6QqPMDifUg08wL0Wp3D21c4nj28mVkTUYgPslFOeyR1WyHJSmofKakCKYmjMPn7%2Fc0GOqUBcikf1NhP0YlK4vA%2FL1xpUFiZnA7KV0jEr6mSf64uwRNTygpgI%2BrLCbNdb9gVXum%2BqpqcipyxWXHpOoJqltSNDLrpLbHFNZNHJkY3kuMG7kKQvx%2BzxhuoL2mQgy7hgym9aiz5eEWnYCnGadZAr8PNoJykOcx7PN%2Bvjb25MwIG177QnArWQdX6arc8jmbGvk7rnYtVhkDqI4mC0CZog21pbZHCl26X&X-Amz-Signature=8bb677645f0e4f75b1850647297881da0d0cd5ea18ad1b2c3324b7238736f959&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667KY7W2BR%2F20260322%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260322T063753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC500S1amkXnidRyf7fD9uxW3edjiWB1rPt1ZwZfQE%2FiQIgAvqI1iWLxEHjHT2nc13C1zHp1NhoNzvJ4jYLeal2mqYq%2FwMIXxAAGgw2Mzc0MjMxODM4MDUiDON4eTB2AfvuFg5OOCrcAwJ7Z%2B1avagGoJn3BQLCC17ok8Gt7lxIJY%2BzBW4zXHmSJz5MC0cdwmKKDnxSi8BbwmzPlE9vR%2BU%2BalRVtql8LjGuVcgefeMdc4B8%2B2ZkC1iZw%2F3QuGkTeKUA42p1G2rRXJhO5LEQLOjpDm1DnjrvEBYxKapwYhfflD57Twx8upPsphXyOtHIkbr8mzcfFsXTj9bo8e1oCS%2Bil%2F1fWFHYuCnhN2ZN4EUCwLMomPBhmLy2jhc1%2FGCjN3S4GwET5QhVAq114xgixpnzGlHt7EzbE9u9FQTs05VpovNsfsPhfT02WMoBLykT6Kw7yV9naG3WX0AAPl2fi67Rz7u6LxlDkbKfThHZ2eQUATTWQ%2FMiavwXY4Wr%2BJ1%2FTDgSsyxwceuYLvuWzPfHMhOnDPbd8EojVIiFi%2BjjMNG%2BkRbLqnKeUk1cLPMTDJWzQl4a0QcY%2BEz%2BIR9xAVCRxyhhVk3MyAcf2m3zLLKkBH%2BxMSybSbZNjx71QffLDp3OZSJx6mq2LAW%2FWaMDKjX4u%2Bt2V9ty1kpDVaaJDE9vjlFSmU7bMYkogVD10pM8FxRajsfS30fxvYKpg6QqPMDifUg08wL0Wp3D21c4nj28mVkTUYgPslFOeyR1WyHJSmofKakCKYmjMPn7%2Fc0GOqUBcikf1NhP0YlK4vA%2FL1xpUFiZnA7KV0jEr6mSf64uwRNTygpgI%2BrLCbNdb9gVXum%2BqpqcipyxWXHpOoJqltSNDLrpLbHFNZNHJkY3kuMG7kKQvx%2BzxhuoL2mQgy7hgym9aiz5eEWnYCnGadZAr8PNoJykOcx7PN%2Bvjb25MwIG177QnArWQdX6arc8jmbGvk7rnYtVhkDqI4mC0CZog21pbZHCl26X&X-Amz-Signature=eb7342efb57c96a6d6fbc83494050b648f67001e0cc2e0d68c0f48afb167e97e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
