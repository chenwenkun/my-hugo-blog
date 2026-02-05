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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R7WFWXA6%2F20260205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260205T183531Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJHMEUCIHohl8LWfXUwPijk2om7vZGT8rBmhJY7HZdE6qO%2FBgJbAiEA2DwqrcHirEnkAJJOb6GCQXpWlCWSpHfcIzUr2Va2GREq%2FwMIMxAAGgw2Mzc0MjMxODM4MDUiDHiShg%2Bp%2FzpfBSAPUSrcA29T9gSoGXy2rFo0jt8LgIPoPrvY%2BFWTfEK%2FYT%2BfHAGvnd4mBq7TY2W10yBSZSWTkqr9z%2FamEW32uZKiZyw3YW7%2B8rPnxlnocgNHVPy3lkvw4C6TN26964Fsge8GjiLiMGmOsdQR%2BEG%2B2%2BeVoAw3nzG1dC%2FDvbV%2FAng2hzCXiwz3aLrn2yyThePQNhbnkMvc%2BQppIEqXOioPmm9rJw67Va5on%2BsUv1xNEwcGlcx7%2FMB%2FPemd4uJXzDrQOUuFvEuBPOb0lMnaForbxnoss8w3neyKVwoRZHasAcIlTzF7mvdat6YISKzSLvwHK55IFHK0k8N%2B1uy0RMPF231t7rZl6mfukPaJRLiwzQ8uWOhGu%2Fqol4qy%2BRxk4RXyc%2Fp2IspIDF5Y9CUAbLgV9yR3oRUggDTyUlL4H0CQyfLgC9FCTCQoDyDk3RchlEK2NCDQHpHJ18hJY8Q47C%2Fnmutkht6WUyAg%2FhO85Ez%2FzS%2Fo5gj6fVIj8GqLPwXDoTrgya10hdTYrAVvr%2FZBIHZbar%2FYEtnce1EcF08iLXne5xY6anZD%2F2LQViJtBa91%2B7%2FERP2%2BhJ9LGeqlXLgPg%2BGcKCWz82TBNjFe%2BEbxVLcxIxHOECr4BPNpZF7erJrzE2zSAsVuML66k8wGOqUBcir%2FUb1vhP2Ii8h3uU2gefx5Kh%2FWsaDFSkAvq9SHtu3bffWO7PIl2XNfYVDNP%2BO4RLrLzGE4R8fKYCzUgc2WHfnrpHuGVURLJmRbHTScr7ww6MegIGRnw6Vh%2B%2F9YWUA9PsszJspVNUaHsrEkNznL8UyVJ6ZyEk01tjD5PRbA6cNOQEJuetBlDCqbzhRvMpJ3Lh%2FwELA6pghjY6brD9Ge19YInL4g&X-Amz-Signature=21804841c7b07e5c36a4a191c04727331af46c02383688e2f0547ac4571467b9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466R7WFWXA6%2F20260205%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260205T183531Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGoaCXVzLXdlc3QtMiJHMEUCIHohl8LWfXUwPijk2om7vZGT8rBmhJY7HZdE6qO%2FBgJbAiEA2DwqrcHirEnkAJJOb6GCQXpWlCWSpHfcIzUr2Va2GREq%2FwMIMxAAGgw2Mzc0MjMxODM4MDUiDHiShg%2Bp%2FzpfBSAPUSrcA29T9gSoGXy2rFo0jt8LgIPoPrvY%2BFWTfEK%2FYT%2BfHAGvnd4mBq7TY2W10yBSZSWTkqr9z%2FamEW32uZKiZyw3YW7%2B8rPnxlnocgNHVPy3lkvw4C6TN26964Fsge8GjiLiMGmOsdQR%2BEG%2B2%2BeVoAw3nzG1dC%2FDvbV%2FAng2hzCXiwz3aLrn2yyThePQNhbnkMvc%2BQppIEqXOioPmm9rJw67Va5on%2BsUv1xNEwcGlcx7%2FMB%2FPemd4uJXzDrQOUuFvEuBPOb0lMnaForbxnoss8w3neyKVwoRZHasAcIlTzF7mvdat6YISKzSLvwHK55IFHK0k8N%2B1uy0RMPF231t7rZl6mfukPaJRLiwzQ8uWOhGu%2Fqol4qy%2BRxk4RXyc%2Fp2IspIDF5Y9CUAbLgV9yR3oRUggDTyUlL4H0CQyfLgC9FCTCQoDyDk3RchlEK2NCDQHpHJ18hJY8Q47C%2Fnmutkht6WUyAg%2FhO85Ez%2FzS%2Fo5gj6fVIj8GqLPwXDoTrgya10hdTYrAVvr%2FZBIHZbar%2FYEtnce1EcF08iLXne5xY6anZD%2F2LQViJtBa91%2B7%2FERP2%2BhJ9LGeqlXLgPg%2BGcKCWz82TBNjFe%2BEbxVLcxIxHOECr4BPNpZF7erJrzE2zSAsVuML66k8wGOqUBcir%2FUb1vhP2Ii8h3uU2gefx5Kh%2FWsaDFSkAvq9SHtu3bffWO7PIl2XNfYVDNP%2BO4RLrLzGE4R8fKYCzUgc2WHfnrpHuGVURLJmRbHTScr7ww6MegIGRnw6Vh%2B%2F9YWUA9PsszJspVNUaHsrEkNznL8UyVJ6ZyEk01tjD5PRbA6cNOQEJuetBlDCqbzhRvMpJ3Lh%2FwELA6pghjY6brD9Ge19YInL4g&X-Amz-Signature=f0cdf6af4a733266d0c4773ad931492105df7b6d5b1f9e80835251c48f56aabc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
