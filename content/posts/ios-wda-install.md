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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663R67JGSO%2F20251014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251014T004936Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH8kSpnwIsIBNjXuuF7RBtI5TQ1H%2B9xFdRnhTSOA78QlAiEA4yz1FEzdCiZiAKmntjCBBfUtgdTIcplVaJdxxLrir3cq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDHNJz6orW0zlc1Ge2SrcA7y0PSDBxRcXFcftInHZZNfHUfIHJU%2F2tTJM7IhfL9KAqtusiI%2Bw%2Fd%2FeMuut2IrbYqJAQrWs6DIDDKIHwAZZC%2BlumNxfeaRZ1uAl7l4BWw5Jb3Jfy6nyxz17OUep2SIrlwFEEcSkbrKnXlmE8tFovyZnzG%2BuVJrIGooeZfc8Ahtt0MCDRnSAh7xv%2FiO%2BZKIIeUPzuYBbmNd9dQBJmAGQM0cxBlb6RhyyQVdDFRjJbwzkxmu8TBq%2FY%2BMq0dqWy%2F73LTEYvLEefJOZOLzTMcMpSjkHRAyXMuh0eAJevVeSul0PI8PsPz%2BK6fFCA2WTamNo0BNsiDDl%2Fypv03zmtbUgRnkShKQ8kKsG%2BP%2Bmxn1KdNnRsM2AgdK0t3qz%2Fz%2F84sCxPuMt%2B7hbPg37RSINBK4UKCLIb2FotWrEuuBrASfLdeD2T9YA%2Fg3yE3RIJLJzagYMFpyGUQoq0XPxCqiFF8bDB5uK4DaZTQFgnyDDM7sBHQMww76i7Ac3DuNQPMeMDqD%2BXrVunzbnN1glRQIWMWhdWjfF538Yca3cZiEvoOBuni%2BVvYcRZcpm4BX50nI%2B%2FJznl84R7qcMuykaeFJ0bps0txFgofxDuNt38UuANe5QALwowzkoOxo9MT8ZK9p%2FMP6ptscGOqUBAW1ygTnEY91TF2%2BYDQ16h9hNovqNLmhFMpUNDK7gsK1EKPVWvXOoeAE8xsPD8G%2FdMnQPIyFNDT%2F2j93YLwU%2F4TGvjsYmcXIf6A9CWQTk2760jIn6K9VoV9dtFHuz0EfdGCzjgv7Ndqc77hGO2Avv3EBpPc6YbboNmv9P1EgdKSbk%2BnCTK3QXsNrz3TuOX9wxuULUF0NWO5nDZXeWXlMuPDyg%2BRez&X-Amz-Signature=a186d4f2e45ef12725c2a4b1d9580d70b94c18c2bd278e5ec5f549662ccb0dc4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663R67JGSO%2F20251014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251014T004936Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIH8kSpnwIsIBNjXuuF7RBtI5TQ1H%2B9xFdRnhTSOA78QlAiEA4yz1FEzdCiZiAKmntjCBBfUtgdTIcplVaJdxxLrir3cq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDHNJz6orW0zlc1Ge2SrcA7y0PSDBxRcXFcftInHZZNfHUfIHJU%2F2tTJM7IhfL9KAqtusiI%2Bw%2Fd%2FeMuut2IrbYqJAQrWs6DIDDKIHwAZZC%2BlumNxfeaRZ1uAl7l4BWw5Jb3Jfy6nyxz17OUep2SIrlwFEEcSkbrKnXlmE8tFovyZnzG%2BuVJrIGooeZfc8Ahtt0MCDRnSAh7xv%2FiO%2BZKIIeUPzuYBbmNd9dQBJmAGQM0cxBlb6RhyyQVdDFRjJbwzkxmu8TBq%2FY%2BMq0dqWy%2F73LTEYvLEefJOZOLzTMcMpSjkHRAyXMuh0eAJevVeSul0PI8PsPz%2BK6fFCA2WTamNo0BNsiDDl%2Fypv03zmtbUgRnkShKQ8kKsG%2BP%2Bmxn1KdNnRsM2AgdK0t3qz%2Fz%2F84sCxPuMt%2B7hbPg37RSINBK4UKCLIb2FotWrEuuBrASfLdeD2T9YA%2Fg3yE3RIJLJzagYMFpyGUQoq0XPxCqiFF8bDB5uK4DaZTQFgnyDDM7sBHQMww76i7Ac3DuNQPMeMDqD%2BXrVunzbnN1glRQIWMWhdWjfF538Yca3cZiEvoOBuni%2BVvYcRZcpm4BX50nI%2B%2FJznl84R7qcMuykaeFJ0bps0txFgofxDuNt38UuANe5QALwowzkoOxo9MT8ZK9p%2FMP6ptscGOqUBAW1ygTnEY91TF2%2BYDQ16h9hNovqNLmhFMpUNDK7gsK1EKPVWvXOoeAE8xsPD8G%2FdMnQPIyFNDT%2F2j93YLwU%2F4TGvjsYmcXIf6A9CWQTk2760jIn6K9VoV9dtFHuz0EfdGCzjgv7Ndqc77hGO2Avv3EBpPc6YbboNmv9P1EgdKSbk%2BnCTK3QXsNrz3TuOX9wxuULUF0NWO5nDZXeWXlMuPDyg%2BRez&X-Amz-Signature=d5e6157f990732af1b520903ec53de42abfadc21f3975290896bd7b12fe212de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
