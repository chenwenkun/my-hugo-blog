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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWPPUSOS%2F20260723%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260723T081005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB8aCXVzLXdlc3QtMiJHMEUCIA9r3OZN%2BGXaC%2Bmy0q55IL%2Bpkg8xGpTf5i3qt%2BPt5QfpAiEAta3yGmVx5UEiXJEDHRwr8UqPYCf4HX9GdDFztR4HAS4qiAQI6P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOB2ZY8pk2B1OUczoyrcA%2B3m3qXhaNiUvoyR2BD%2BI9NmgK7d8Hz0H3Y6xNSkvKHrLNcEYB4HCleyAridW%2FUoOr8S1CrjDwI5PzG0lV4gPl4RynCfgr%2BWPS%2Fovt9f%2BBdgslvyahPKCKm0Bp02375TsLde%2B%2BwaKdmmEqrqqfTskctbXn21qNXbFi2GaTnE49JhzhmrE1mugqokdULqYSbDOTy68%2FMVpvcB6X2V1XEBOOfQ74T1IYmL%2BzjgP%2B6XlSwsvfbHol7p9iB0ncsypmXzb7JU4lw1flpmJg2ojz3sG%2Fz11nTyOOYeav4hgPDuDql2DG%2BhjJGz7AF4fht64hN9llD%2BJ97eMRlGgH%2B%2Faj3wHZlaVFsHZ%2BD9iGd3fJcxf1pzqplTn4kF6U4FDlco%2BGFE69raHy4KXs7eE%2F1%2FmhAK5el%2FNDmFYtzaSemMhMJEUsg2ctnt87LdkxKYxcYnSVjWk4HE%2BbGc1CS%2BGrwjQVOJBQd%2FgVkeV25sKewLhUY%2FjEmVfEaxb9BfaV%2F1HHq%2Bkjc1SU08fmxgXJ5j1AIbtCaeiVM85Hrt0aO5Bosih7EbYw23URYAUZKCywJILhkFWEG6XFC9608SPUGw%2BEVnARmjeUnjRMdlE%2BIZFrtozF7cSwabmY2qrO48sgcrVT5pMMTrhtMGOqUBVFji4nnuyHd%2FPy9WjKJZiCn8I%2BxHZBwehdYHGkXxzhWH38DrY8p%2Bv0%2BqiJTR7XXiKOMug9pYtjTxNoFV%2FmdRiyRqRvVKKveyjr3HJJXeXEwc6M2xdLykuCBpMoeln6HKMvx4FB6ER7hovu9A9uAeoC1PGn2DZR1OQNlrbbmltl%2BwdJ45oY9YnF5mDSMr1ppBOnWb%2BvxErMKyPsc7dM4XjG7ba5ZT&X-Amz-Signature=16bc12969a935ead593c1b2868cdcd0802b6c98ecdaedf42a6913ac25c004f45&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWPPUSOS%2F20260723%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260723T081005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB8aCXVzLXdlc3QtMiJHMEUCIA9r3OZN%2BGXaC%2Bmy0q55IL%2Bpkg8xGpTf5i3qt%2BPt5QfpAiEAta3yGmVx5UEiXJEDHRwr8UqPYCf4HX9GdDFztR4HAS4qiAQI6P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOB2ZY8pk2B1OUczoyrcA%2B3m3qXhaNiUvoyR2BD%2BI9NmgK7d8Hz0H3Y6xNSkvKHrLNcEYB4HCleyAridW%2FUoOr8S1CrjDwI5PzG0lV4gPl4RynCfgr%2BWPS%2Fovt9f%2BBdgslvyahPKCKm0Bp02375TsLde%2B%2BwaKdmmEqrqqfTskctbXn21qNXbFi2GaTnE49JhzhmrE1mugqokdULqYSbDOTy68%2FMVpvcB6X2V1XEBOOfQ74T1IYmL%2BzjgP%2B6XlSwsvfbHol7p9iB0ncsypmXzb7JU4lw1flpmJg2ojz3sG%2Fz11nTyOOYeav4hgPDuDql2DG%2BhjJGz7AF4fht64hN9llD%2BJ97eMRlGgH%2B%2Faj3wHZlaVFsHZ%2BD9iGd3fJcxf1pzqplTn4kF6U4FDlco%2BGFE69raHy4KXs7eE%2F1%2FmhAK5el%2FNDmFYtzaSemMhMJEUsg2ctnt87LdkxKYxcYnSVjWk4HE%2BbGc1CS%2BGrwjQVOJBQd%2FgVkeV25sKewLhUY%2FjEmVfEaxb9BfaV%2F1HHq%2Bkjc1SU08fmxgXJ5j1AIbtCaeiVM85Hrt0aO5Bosih7EbYw23URYAUZKCywJILhkFWEG6XFC9608SPUGw%2BEVnARmjeUnjRMdlE%2BIZFrtozF7cSwabmY2qrO48sgcrVT5pMMTrhtMGOqUBVFji4nnuyHd%2FPy9WjKJZiCn8I%2BxHZBwehdYHGkXxzhWH38DrY8p%2Bv0%2BqiJTR7XXiKOMug9pYtjTxNoFV%2FmdRiyRqRvVKKveyjr3HJJXeXEwc6M2xdLykuCBpMoeln6HKMvx4FB6ER7hovu9A9uAeoC1PGn2DZR1OQNlrbbmltl%2BwdJ45oY9YnF5mDSMr1ppBOnWb%2BvxErMKyPsc7dM4XjG7ba5ZT&X-Amz-Signature=b246cb680f00d3545718e256660518ba718b2e131632ee43c299ac6d3e667703&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
