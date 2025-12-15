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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VE26NJJB%2F20251215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251215T122530Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB7vqLks3f9maF%2FKhgw8DgOO3mvTxfUkhUpdtLsUoMXlAiEA%2FTMA6PiSLww1bOHx%2B5PL0E8fV0u%2BGmqfENQtlAzafCMq%2FwMITRAAGgw2Mzc0MjMxODM4MDUiDOBM2%2FsO0vY31HxPBSrcA0Z8wfK%2FdRP%2FFpK1qeyb1vDu5fJYJhVcQm%2Bjp%2FI190yru4P6erRZW3W6G3kmyhCoFeY1OvzzoOFl4jCQk45yextoxVvUhYsJMaowOaG1CEJ380Q10vVDFnR5Z3tzBEWLfcOL4AZ6y1jGK9R%2BpTFaDkXuy8yYWLDAWAT3SZ9IuCQgBm3o%2F5aPVbF5LWsmFLRK6A47uWqwP10vYeNOdKKFsi%2FtIP0ulmBYIqXVmeLGVQXToG0x1W%2F8VRAij8dYRXMnlBi6p3Z34RKeMYiaBf6jkCTbOWDkIQHsNCUK8Svx3M2FVONYwN31dfLFSOS84eJrtxidF6A55reVFCiZqAyjKV7h89XccE%2BcAlmhPE0ljsXScClTqBHTYFqY0ZsT9Bj84%2Fqn9R6dzbjVXvI4EdF%2BpuZSVmDmBPzRdhfeVzzreFXKumIrrImkmnpIdYUGbecI9pDebVlcIVvLF5UiWVnJC24BZW3wgKfjRhY2Y5ThP8r%2FbqM1N4cdY7ZwJpNBBS6jLH1ubycD%2BQlUsoW206gi85zf1LhYS%2BkVN4tw7TEx1A2ViuCHc3vmtkb8SVQt0qKNkrYKmDakf8Od%2BZWpymOQSdSqMIJdWRxV76at4UcLH%2B%2Fb%2B%2BCoXR2Q6tyQt0WtMNLg%2F8kGOqUBvtpkqIP0%2FBXKZYhcCiyp0HdqmC6X29p9cd7TXPMeLQUoKtsMMJ%2Fx1%2F1IBCvBJFdAY7XBpDmTWMpdM0NhRefw%2B%2FJQbduyCcZApklFuXjj66D9oZT1q%2B12YRUd4W2o3IOVdU1BZENjJMMxYm%2F93UVARycB5yS%2Blrgsf0nnCVXJjj1rdUi%2FCFPCOec%2F%2BuisTOeuV%2BY50MwAsFGVuopZFD8BWZ%2BeK8Qb&X-Amz-Signature=eb9e4668fca4f594d2757cd00e816ce71f64671df65833426e59d71c3cdf1de6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VE26NJJB%2F20251215%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251215T122530Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB7vqLks3f9maF%2FKhgw8DgOO3mvTxfUkhUpdtLsUoMXlAiEA%2FTMA6PiSLww1bOHx%2B5PL0E8fV0u%2BGmqfENQtlAzafCMq%2FwMITRAAGgw2Mzc0MjMxODM4MDUiDOBM2%2FsO0vY31HxPBSrcA0Z8wfK%2FdRP%2FFpK1qeyb1vDu5fJYJhVcQm%2Bjp%2FI190yru4P6erRZW3W6G3kmyhCoFeY1OvzzoOFl4jCQk45yextoxVvUhYsJMaowOaG1CEJ380Q10vVDFnR5Z3tzBEWLfcOL4AZ6y1jGK9R%2BpTFaDkXuy8yYWLDAWAT3SZ9IuCQgBm3o%2F5aPVbF5LWsmFLRK6A47uWqwP10vYeNOdKKFsi%2FtIP0ulmBYIqXVmeLGVQXToG0x1W%2F8VRAij8dYRXMnlBi6p3Z34RKeMYiaBf6jkCTbOWDkIQHsNCUK8Svx3M2FVONYwN31dfLFSOS84eJrtxidF6A55reVFCiZqAyjKV7h89XccE%2BcAlmhPE0ljsXScClTqBHTYFqY0ZsT9Bj84%2Fqn9R6dzbjVXvI4EdF%2BpuZSVmDmBPzRdhfeVzzreFXKumIrrImkmnpIdYUGbecI9pDebVlcIVvLF5UiWVnJC24BZW3wgKfjRhY2Y5ThP8r%2FbqM1N4cdY7ZwJpNBBS6jLH1ubycD%2BQlUsoW206gi85zf1LhYS%2BkVN4tw7TEx1A2ViuCHc3vmtkb8SVQt0qKNkrYKmDakf8Od%2BZWpymOQSdSqMIJdWRxV76at4UcLH%2B%2Fb%2B%2BCoXR2Q6tyQt0WtMNLg%2F8kGOqUBvtpkqIP0%2FBXKZYhcCiyp0HdqmC6X29p9cd7TXPMeLQUoKtsMMJ%2Fx1%2F1IBCvBJFdAY7XBpDmTWMpdM0NhRefw%2B%2FJQbduyCcZApklFuXjj66D9oZT1q%2B12YRUd4W2o3IOVdU1BZENjJMMxYm%2F93UVARycB5yS%2Blrgsf0nnCVXJjj1rdUi%2FCFPCOec%2F%2BuisTOeuV%2BY50MwAsFGVuopZFD8BWZ%2BeK8Qb&X-Amz-Signature=83a031c2d7809dfb7da4ff598603d0797884acb0ddf2d61c443fedd96cb0783c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
