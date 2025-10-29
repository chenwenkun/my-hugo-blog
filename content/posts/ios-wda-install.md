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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ZN7ARQM%2F20251029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T005426Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJHMEUCIBDwOGb8L1UWBAgsdDBp9ufAauwL6VELZssVwdD7vJGOAiEA3WUhfTC0D67mrE9pA8T4Wh45A%2BxX6KhZqRu4E1U77DwqiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGxKsNiRqSt9Y4cCKyrcAzcSeq5Byk87EMK%2B8j5oRxpj6WJheQxl3OusA%2B8%2B3Tap4fXvflZf8sQr9BzzDwXktzXDSpW0oOeNDv2LcaqRhoF6wHR%2FxWmjfzu%2BJxjEGHM5iA%2FQhoJTR%2FeJyPvitG6eNcddGhygnbnUmmxKDlvcInqU5L1g%2BOXU67EtdEEZ5Ffb6Z%2Betv9ggs%2BCpTGHVKrc9KWuuy%2BLkQMSwnq%2BlSl8JLfZ7EgPybh13m13Juy2WaNCuEDDfkHsDVL66wdn9NZJqvThUTD1%2BjHG6nVDHWlxpg2BNMN7hiJ2oF8UlyzrYAUtq75os01wFhah1vyVH7M4AN02rKpM3Rgk%2FkqsyDu6YDnxQu3Bv11qmhRR9V%2B37WCsAOPVMjoO4UkpNZ3w%2BwzTUPiQ8HejiwRGEH2TryyI5LSa9a5ci5waKVwmk%2B%2FvxRbZvddZoBQ%2FKIayYjvK7B%2FyPYDuDsIlgrVfUMaosFje6r0DIvN92h3770S7DnNpcSLKruEd5ZwteTkmvhRLagTmgQNIv7zjfz5%2BUEjxFd1uTHq97bQPhdf%2FiogHDQ9jNDaQbHt9R58nzjCvjivzklXZ9rgsBzcq5XX61pzOammYlUvhsXcoSVLyHkIJVbHGZYgzkMOzKbygPxYuX4rlMN2thcgGOqUBoK6AB6y4zSxKYIDqMyeLtnHOGE5L1ng0FSMWyYjGrFUpBsqIrp%2F7ho7LtRft38iL8fCgMtSgPw2pBeGlMFsRZFdvi1U29mkjRlZ8VL5KOWtL5bEw%2BoJO4RAM1axBbPVHXANQyGeTE5EhFEP8PmT1T8xJzoWIHRbylGBkvKzfw61c0X%2FK7QHFnf2iIQ1DTMYlpS35bkf5t%2BiiiSX1yYirG1hR1ZKx&X-Amz-Signature=c4307899f5c9267185cb6784cae6977182292e5d186444acbbb949cc2d4c017b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666ZN7ARQM%2F20251029%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251029T005426Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBAaCXVzLXdlc3QtMiJHMEUCIBDwOGb8L1UWBAgsdDBp9ufAauwL6VELZssVwdD7vJGOAiEA3WUhfTC0D67mrE9pA8T4Wh45A%2BxX6KhZqRu4E1U77DwqiAQIyf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGxKsNiRqSt9Y4cCKyrcAzcSeq5Byk87EMK%2B8j5oRxpj6WJheQxl3OusA%2B8%2B3Tap4fXvflZf8sQr9BzzDwXktzXDSpW0oOeNDv2LcaqRhoF6wHR%2FxWmjfzu%2BJxjEGHM5iA%2FQhoJTR%2FeJyPvitG6eNcddGhygnbnUmmxKDlvcInqU5L1g%2BOXU67EtdEEZ5Ffb6Z%2Betv9ggs%2BCpTGHVKrc9KWuuy%2BLkQMSwnq%2BlSl8JLfZ7EgPybh13m13Juy2WaNCuEDDfkHsDVL66wdn9NZJqvThUTD1%2BjHG6nVDHWlxpg2BNMN7hiJ2oF8UlyzrYAUtq75os01wFhah1vyVH7M4AN02rKpM3Rgk%2FkqsyDu6YDnxQu3Bv11qmhRR9V%2B37WCsAOPVMjoO4UkpNZ3w%2BwzTUPiQ8HejiwRGEH2TryyI5LSa9a5ci5waKVwmk%2B%2FvxRbZvddZoBQ%2FKIayYjvK7B%2FyPYDuDsIlgrVfUMaosFje6r0DIvN92h3770S7DnNpcSLKruEd5ZwteTkmvhRLagTmgQNIv7zjfz5%2BUEjxFd1uTHq97bQPhdf%2FiogHDQ9jNDaQbHt9R58nzjCvjivzklXZ9rgsBzcq5XX61pzOammYlUvhsXcoSVLyHkIJVbHGZYgzkMOzKbygPxYuX4rlMN2thcgGOqUBoK6AB6y4zSxKYIDqMyeLtnHOGE5L1ng0FSMWyYjGrFUpBsqIrp%2F7ho7LtRft38iL8fCgMtSgPw2pBeGlMFsRZFdvi1U29mkjRlZ8VL5KOWtL5bEw%2BoJO4RAM1axBbPVHXANQyGeTE5EhFEP8PmT1T8xJzoWIHRbylGBkvKzfw61c0X%2FK7QHFnf2iIQ1DTMYlpS35bkf5t%2BiiiSX1yYirG1hR1ZKx&X-Amz-Signature=ea14bf93f466917571c3a70a9cded6fea77f3084e3b4d8ceb41c98025e5a3e7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
