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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKM2Y5GQ%2F20251214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251214T181606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG4aCXVzLXdlc3QtMiJGMEQCIG8H16VKafOzTk24%2F4XSmFnEW6OrwpNC79goTA2ofK30AiBLI%2FUegdtX6%2BjE7ZNhrWEza66WBF994TAiE1KlN9PlBSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIM%2B3FTmpbwkFHg9jW9KtwDc4uxxnC4mc0ZM%2FICJ6V18RXkbFMj5g93YQam%2FvE4po0fvJ8OwmX4uoz4GlUBc7ocJUFv%2FoGcHgbfLExKCVxTDWZS%2B9yBRv58NWCXhmt%2FhkrHvWuBd%2BjJJ1cphmcd4NQ6eXgKjL641E26%2F2LerDC%2FflOECvOOzi1XWRFdM3JDuSQGZYzZ10j%2BCylzqbmQo1AbT4EaS%2BO9BuSABtmJLEueBWfaBRwCv3MFCkuNUEy5ryCEp%2BGAB%2Fjtwxd2z73e5inS53IyGH23gvrZc%2BlYPInFB70E%2BPV%2FmnuhMfgkDAYTy20gsRG%2BF9swBVyt42O4VTmd6AnnbSUW37wZYm%2Fx6Q%2BKhe8BbxsTaBpJJeZEl4%2Fs7Zwibet7YNzjLW9JrR3RBJ%2BM1NlC4hvi0XBr%2FLuD5HcueUDWtwAjgWtnu2w6otsnLS4B0SggIG6Z2CPicOumfIKRxk9KQAG4x8snFKvgAjigg2mlqx79HsuSM4CUSlhnnN7Ks3iulJrJ1TZXJJoHPW3Jd%2Fntq3GfcKgRrRevbw2zDoU3Q%2FdTurlB4VxcknA0n2CgusJEpzWhjKf6qLl2gdT1A5Q6ii%2BEiG2s5RoWQbGJfkRUWccltX8Qom1Ha8yfbkqn2tGp7%2FU9gku4O7UwjvL6yQY6pgHR8c4D2fS9%2FpGz0wRzpMoqRE8N7S5Co8exJBnzihebXENGczHrT4%2FaXcVwx9tLoCD2ggMzw%2FQfGkleQGV5SGJR1NX%2B7RNLtCV1o3Fx2mwOvJuf%2B5VwEYkXr1gf5jewbKZJI6WIOYueMNYWj7Pb60WdMcEoSbx24Lhqk%2Bbpq%2Focd%2B7NugGxr719skQhzunZmUjFBuCrSXGkRAcm4kOMUT5q49HrXL39&X-Amz-Signature=d30bb2dd0ef53e4f110e86426cc3ad24508b64640c1ecdb95050cc2e48b3c3a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKM2Y5GQ%2F20251214%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251214T181606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG4aCXVzLXdlc3QtMiJGMEQCIG8H16VKafOzTk24%2F4XSmFnEW6OrwpNC79goTA2ofK30AiBLI%2FUegdtX6%2BjE7ZNhrWEza66WBF994TAiE1KlN9PlBSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIM%2B3FTmpbwkFHg9jW9KtwDc4uxxnC4mc0ZM%2FICJ6V18RXkbFMj5g93YQam%2FvE4po0fvJ8OwmX4uoz4GlUBc7ocJUFv%2FoGcHgbfLExKCVxTDWZS%2B9yBRv58NWCXhmt%2FhkrHvWuBd%2BjJJ1cphmcd4NQ6eXgKjL641E26%2F2LerDC%2FflOECvOOzi1XWRFdM3JDuSQGZYzZ10j%2BCylzqbmQo1AbT4EaS%2BO9BuSABtmJLEueBWfaBRwCv3MFCkuNUEy5ryCEp%2BGAB%2Fjtwxd2z73e5inS53IyGH23gvrZc%2BlYPInFB70E%2BPV%2FmnuhMfgkDAYTy20gsRG%2BF9swBVyt42O4VTmd6AnnbSUW37wZYm%2Fx6Q%2BKhe8BbxsTaBpJJeZEl4%2Fs7Zwibet7YNzjLW9JrR3RBJ%2BM1NlC4hvi0XBr%2FLuD5HcueUDWtwAjgWtnu2w6otsnLS4B0SggIG6Z2CPicOumfIKRxk9KQAG4x8snFKvgAjigg2mlqx79HsuSM4CUSlhnnN7Ks3iulJrJ1TZXJJoHPW3Jd%2Fntq3GfcKgRrRevbw2zDoU3Q%2FdTurlB4VxcknA0n2CgusJEpzWhjKf6qLl2gdT1A5Q6ii%2BEiG2s5RoWQbGJfkRUWccltX8Qom1Ha8yfbkqn2tGp7%2FU9gku4O7UwjvL6yQY6pgHR8c4D2fS9%2FpGz0wRzpMoqRE8N7S5Co8exJBnzihebXENGczHrT4%2FaXcVwx9tLoCD2ggMzw%2FQfGkleQGV5SGJR1NX%2B7RNLtCV1o3Fx2mwOvJuf%2B5VwEYkXr1gf5jewbKZJI6WIOYueMNYWj7Pb60WdMcEoSbx24Lhqk%2Bbpq%2Focd%2B7NugGxr719skQhzunZmUjFBuCrSXGkRAcm4kOMUT5q49HrXL39&X-Amz-Signature=b0117b73d25f8d83b1c4b8d0df7e8f8542539110afc3ee8d45788ab96bf391b0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
