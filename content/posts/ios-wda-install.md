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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7IKZQGM%2F20251020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251020T122144Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJIMEYCIQCtLvsiJOV0aT6YKHMYzOZNH5eD9235XMG485IaveK8jwIhAKaPvHm2iJMjSf9OifaQcbhUZlpR9WCwF6Tx3KP4IRAiKogECOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzgTRshTluTuZmQcMMq3ANC0RQAgGiX53B1zNgKjCUQ%2BfHh5ovi0ms1GhG0gjnOzWE9IyDPjsgFJ8Pn%2FdjTP9V%2BVJ2NQOqHDEsh5sSxjfGABR%2Bqrq16K8Ug09ai%2BDm%2BDewqJ0HVNE4k5WEYGfFJ9oEeb0XM2R9sIa17sGyGYXlxbBJ06UYD7Wv1EW5mO2varl%2FAiCo7Yr%2BNKluf%2FjIhOD9SNAGT5KEjkq%2BcqVuslJDssTU%2FYtdVbBp3mJQSCDzGOeKsIZEK72QBbJZZfDDZwyqvSIzMbaHOznLAssNtUAWrr7vG9RnMLDnznJx7rYK48KuBcd%2BgvlTzzweFqKvCUUbLdUt7d%2Fh2yFD7yNJPqU5xxRhEaMaq3vijsAc4CcrQGraXjV7rfS%2Br2CFjXK6qgT8UMa%2FKcKno%2FfBcOg%2FFsscqKTyvAmQxz61iVleHOmRhBhKvbTwYqTE1b23medySxIkMPhzjWHVxpdRN88XwXqiVtAYVsmoO4xgJx5I1oM%2FZiIHWb4F%2BlcwwSNoz5U3BuuDXpxb3KAi1tyLUgM1zfljQiAWHRRYY%2Bd%2BbCQFA8TSlkRCs7XCHdUfvVlI0b1gGlD5Yivi0vxQPRyp9aY8HRSn5mTWfQNVV6db6yzQ8jhiJOGeYXT8CpxPAebsBPDCK09fHBjqkAQh6qLCdu9tBeti%2BkRDp4fJdUkrzY3Mgt5bTBOXhrbZJiq2M1PFZh6eFcOBNE%2BtDEJvb0D0XhjsMjqvkhz2IirQyRfoQ%2B0%2BlFZK0sT3St5HUtiJOb9q9tnQvrroyh%2B3hWqlSqOgmD54MR9dJ%2Fo6lw8E%2BVnL0Jd3zOibbNYgV7VpRJAmIGxY75RPRCIeb6Qi0vPkRB7ZDKX%2Fz4xMiXXnSW89xyR2S&X-Amz-Signature=3ad1070aa3c4615fb49167597324b6fe05f8890d9c9090eb619fed128c14fd35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Z7IKZQGM%2F20251020%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251020T122145Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEAaCXVzLXdlc3QtMiJIMEYCIQCtLvsiJOV0aT6YKHMYzOZNH5eD9235XMG485IaveK8jwIhAKaPvHm2iJMjSf9OifaQcbhUZlpR9WCwF6Tx3KP4IRAiKogECOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzgTRshTluTuZmQcMMq3ANC0RQAgGiX53B1zNgKjCUQ%2BfHh5ovi0ms1GhG0gjnOzWE9IyDPjsgFJ8Pn%2FdjTP9V%2BVJ2NQOqHDEsh5sSxjfGABR%2Bqrq16K8Ug09ai%2BDm%2BDewqJ0HVNE4k5WEYGfFJ9oEeb0XM2R9sIa17sGyGYXlxbBJ06UYD7Wv1EW5mO2varl%2FAiCo7Yr%2BNKluf%2FjIhOD9SNAGT5KEjkq%2BcqVuslJDssTU%2FYtdVbBp3mJQSCDzGOeKsIZEK72QBbJZZfDDZwyqvSIzMbaHOznLAssNtUAWrr7vG9RnMLDnznJx7rYK48KuBcd%2BgvlTzzweFqKvCUUbLdUt7d%2Fh2yFD7yNJPqU5xxRhEaMaq3vijsAc4CcrQGraXjV7rfS%2Br2CFjXK6qgT8UMa%2FKcKno%2FfBcOg%2FFsscqKTyvAmQxz61iVleHOmRhBhKvbTwYqTE1b23medySxIkMPhzjWHVxpdRN88XwXqiVtAYVsmoO4xgJx5I1oM%2FZiIHWb4F%2BlcwwSNoz5U3BuuDXpxb3KAi1tyLUgM1zfljQiAWHRRYY%2Bd%2BbCQFA8TSlkRCs7XCHdUfvVlI0b1gGlD5Yivi0vxQPRyp9aY8HRSn5mTWfQNVV6db6yzQ8jhiJOGeYXT8CpxPAebsBPDCK09fHBjqkAQh6qLCdu9tBeti%2BkRDp4fJdUkrzY3Mgt5bTBOXhrbZJiq2M1PFZh6eFcOBNE%2BtDEJvb0D0XhjsMjqvkhz2IirQyRfoQ%2B0%2BlFZK0sT3St5HUtiJOb9q9tnQvrroyh%2B3hWqlSqOgmD54MR9dJ%2Fo6lw8E%2BVnL0Jd3zOibbNYgV7VpRJAmIGxY75RPRCIeb6Qi0vPkRB7ZDKX%2Fz4xMiXXnSW89xyR2S&X-Amz-Signature=de6f834fd01c25bdfdc2ae7dafb670c5744e57fb1184d45c939b2780ef224a81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
