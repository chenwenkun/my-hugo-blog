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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667RVJOBDA%2F20251127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251127T181536Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC932pcSQ5f%2FFVzvtHAUqI4Kndkw5xT6ROAz8HB5ouQ0gIhAP3WKtt6Uo6zMo1iUmL53ir2UplvCI5BUH0D5N8o1jURKogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igwx5y6MJ58tpkSYQhYq3AODI94vGR4cGQR9TnmXCMarnkZU8oH4nNh7dgV8TQJBF%2BNm3dJxjob%2FHwa94QRB1oF23ui3wg7l524DXgmDxpoZ3wfKQk6aNxAUcxpVDynju6Z%2FS7GMBuDTbdrWUATxTOBCqhWwPCgVHZD3xrtcdkGvMDf02zX%2B%2B4Ni%2Fpx2slNAhi4eL%2FL%2BFnyDRc3yO1jmWnAerYMI5OIBTG5PmLW%2FTwKlBAQlpSpS5KBWNmt4jj%2BZr7UiZchwXbgwQQGW5C3ZJ3aTN6CMTEHz%2BQxCkgtS1u8ICUJn3BFivaxt9z7LxCgUETM2VXNjZUTCu7US%2FRBtQD3pzbFx6MfqxXhdWTFtdhBUb7EJMJas5iyN5UHyFCbQpOIbHjclYCJjs4vd4dvvSIoxNBVnqpl0BL%2BN32yTD5%2FfwNDplN88LvwDljQB0t6fTMO5i43dPMXqIOo3lAQXBqZ1l%2F70ghlyW2rCNkC16MTnfUeEiGXprXFSjX%2BVmOBzg5A%2FURAiI82r7d8SfvTbX6jxs6zPWKGZtyuDcdYnfR8LWhM1c1pG99vDVPTpFdpjRhXJUwrLXRwOx5DBi1%2BVg459wGs4bSAwOi4%2F5Aoym2mS81Hs2oDuKVsC%2Fi1Ovy4bczrEqa8BNOqVjFChWDD5tKHJBjqkAWg1W12gHFjly53EIuCM8ebgi7HCyreaA9H8u7y3ecVm1reA4CyY0AGvE7sd4Hk5nYwAMtS1ri8%2Bb37TKytQPKjWc3uoNG88CC6byx84hXE7FXAWsdEw2S1C9QSK0rhe1z3dX4wQ0%2FjdLvVrsZsKP3svRHAY0zcQf9ILL4eRt5WBm3l32cYk2Ni9De0ARyp6yR5eKxMWqJyZsfKtuBy8lUOtH2MK&X-Amz-Signature=aa098eb10369b7298c0272021788d5a278dce6510bd4db18378c1246d72b6627&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667RVJOBDA%2F20251127%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251127T181536Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC932pcSQ5f%2FFVzvtHAUqI4Kndkw5xT6ROAz8HB5ouQ0gIhAP3WKtt6Uo6zMo1iUmL53ir2UplvCI5BUH0D5N8o1jURKogECJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igwx5y6MJ58tpkSYQhYq3AODI94vGR4cGQR9TnmXCMarnkZU8oH4nNh7dgV8TQJBF%2BNm3dJxjob%2FHwa94QRB1oF23ui3wg7l524DXgmDxpoZ3wfKQk6aNxAUcxpVDynju6Z%2FS7GMBuDTbdrWUATxTOBCqhWwPCgVHZD3xrtcdkGvMDf02zX%2B%2B4Ni%2Fpx2slNAhi4eL%2FL%2BFnyDRc3yO1jmWnAerYMI5OIBTG5PmLW%2FTwKlBAQlpSpS5KBWNmt4jj%2BZr7UiZchwXbgwQQGW5C3ZJ3aTN6CMTEHz%2BQxCkgtS1u8ICUJn3BFivaxt9z7LxCgUETM2VXNjZUTCu7US%2FRBtQD3pzbFx6MfqxXhdWTFtdhBUb7EJMJas5iyN5UHyFCbQpOIbHjclYCJjs4vd4dvvSIoxNBVnqpl0BL%2BN32yTD5%2FfwNDplN88LvwDljQB0t6fTMO5i43dPMXqIOo3lAQXBqZ1l%2F70ghlyW2rCNkC16MTnfUeEiGXprXFSjX%2BVmOBzg5A%2FURAiI82r7d8SfvTbX6jxs6zPWKGZtyuDcdYnfR8LWhM1c1pG99vDVPTpFdpjRhXJUwrLXRwOx5DBi1%2BVg459wGs4bSAwOi4%2F5Aoym2mS81Hs2oDuKVsC%2Fi1Ovy4bczrEqa8BNOqVjFChWDD5tKHJBjqkAWg1W12gHFjly53EIuCM8ebgi7HCyreaA9H8u7y3ecVm1reA4CyY0AGvE7sd4Hk5nYwAMtS1ri8%2Bb37TKytQPKjWc3uoNG88CC6byx84hXE7FXAWsdEw2S1C9QSK0rhe1z3dX4wQ0%2FjdLvVrsZsKP3svRHAY0zcQf9ILL4eRt5WBm3l32cYk2Ni9De0ARyp6yR5eKxMWqJyZsfKtuBy8lUOtH2MK&X-Amz-Signature=97ad4909f69ef6196cb41e49caee2889e96dac9ae1a950840a88d74c2ab20729&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
