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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHLXDL4P%2F20260302%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260302T123359Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEhDipQrkOxCfAw0BwVpv3yvSLo4pIKgGOxhgVsJpYuVAiEAxuuMuMEqJD7guKeb4TldNEf3jr%2B7g9NVVWdrxOk7aRAqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKRs4LcHmTSnqkwaDircA1fwO0nAtX3U2fMzGZxEDaxSpa%2Fq93xV3TJgg9oc%2BlnfpOvSiXpoAb0Na%2FgbR4%2BT9LEBSM0k7%2BmLaWNBZRVf2WJf2BqU4FUjEpYrzANZ6YwoUTub%2BdK3TPQMC3dF0Rc42j6Jd%2BSjg5AHyLONHbSmccoR1gzd2EzG7J%2FCllXZJwqNh9WlgZRA3ZfjGf9yTAINw5adsfWkEOHE8Ab9WgbLKMDei5FmSkpcQhoaNX9UFSukkYl2qjrhKUR4JZ2xdh7x4AaDmU6Jk9nuNarGCa902NA13DA7OapxA82bvuzT2bDtuemMsrePNmrh9ECh%2F0NHxJjvloRxhtQkeo5N388UBjFquJfwRUs31xtLZ6q0XrWfc6Orb2MzoIKqdm4QnDivfq5cckSP9wY%2FSPdxhpYRNips23WCtkMHE5%2BOlYlVJ1hQGGkvH3QxPRkQptZnwwIfJClnqve8gZWcabyVwWLSDswrEgifXMC%2ByN69ZdT8v6QENH6uA%2FjIIoW7TU18u0PACl6RD5wb6nkV87FW53yQc5hBXTs0lbLqdDRiRJ2g9HWBn28Ls5TBkO9otdV9qyiJWvJkwPGM7UG1Ui2LoZk0BnOTcxk%2BswIoeQmBVm9V3UtdkpbnysTuh77Nq%2BkgMNH5lc0GOqUB8%2Fqg3ezyXacThV%2BMBF1b7gT2b%2BhyZvs45zcZ2qJC0OrUsYsSrWBMxLCLE54orseRnJtboWQ77JOvI1QD9BbkJxEL%2BsJJ5A16nGZr9ZT05hVwwxGGP6ON1KE%2FO%2BhDhTpm0MtNcOVX8NIDkSLm8a8N6xgrfRQG3aaJHiNgno%2FgL%2FtOTZtFAw83jotP45EVnEkv0l8ZhN1FHdsRT04Ja9cMnYDZPcCY&X-Amz-Signature=d2125996627b3e48af63e5901642fca81fbfb18d411b1cddb85e1f3aed3133c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RHLXDL4P%2F20260302%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260302T123359Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEhDipQrkOxCfAw0BwVpv3yvSLo4pIKgGOxhgVsJpYuVAiEAxuuMuMEqJD7guKeb4TldNEf3jr%2B7g9NVVWdrxOk7aRAqiAQIhf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKRs4LcHmTSnqkwaDircA1fwO0nAtX3U2fMzGZxEDaxSpa%2Fq93xV3TJgg9oc%2BlnfpOvSiXpoAb0Na%2FgbR4%2BT9LEBSM0k7%2BmLaWNBZRVf2WJf2BqU4FUjEpYrzANZ6YwoUTub%2BdK3TPQMC3dF0Rc42j6Jd%2BSjg5AHyLONHbSmccoR1gzd2EzG7J%2FCllXZJwqNh9WlgZRA3ZfjGf9yTAINw5adsfWkEOHE8Ab9WgbLKMDei5FmSkpcQhoaNX9UFSukkYl2qjrhKUR4JZ2xdh7x4AaDmU6Jk9nuNarGCa902NA13DA7OapxA82bvuzT2bDtuemMsrePNmrh9ECh%2F0NHxJjvloRxhtQkeo5N388UBjFquJfwRUs31xtLZ6q0XrWfc6Orb2MzoIKqdm4QnDivfq5cckSP9wY%2FSPdxhpYRNips23WCtkMHE5%2BOlYlVJ1hQGGkvH3QxPRkQptZnwwIfJClnqve8gZWcabyVwWLSDswrEgifXMC%2ByN69ZdT8v6QENH6uA%2FjIIoW7TU18u0PACl6RD5wb6nkV87FW53yQc5hBXTs0lbLqdDRiRJ2g9HWBn28Ls5TBkO9otdV9qyiJWvJkwPGM7UG1Ui2LoZk0BnOTcxk%2BswIoeQmBVm9V3UtdkpbnysTuh77Nq%2BkgMNH5lc0GOqUB8%2Fqg3ezyXacThV%2BMBF1b7gT2b%2BhyZvs45zcZ2qJC0OrUsYsSrWBMxLCLE54orseRnJtboWQ77JOvI1QD9BbkJxEL%2BsJJ5A16nGZr9ZT05hVwwxGGP6ON1KE%2FO%2BhDhTpm0MtNcOVX8NIDkSLm8a8N6xgrfRQG3aaJHiNgno%2FgL%2FtOTZtFAw83jotP45EVnEkv0l8ZhN1FHdsRT04Ja9cMnYDZPcCY&X-Amz-Signature=9cffefbe1c55dff757b9ca500db339b7d73b53a05a1f659d044eafeff8b00490&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
