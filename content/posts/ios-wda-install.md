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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46664U6FSEP%2F20260325%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260325T011337Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCFkrBIUiJUC2pPdQy889%2FO6VOIGl44liDvx7xtqqnt7AIgA4C8JBHLE46UH7C%2FzEbX7AernqiOtFqg8nKeRCA1C18qiAQIoP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJBxXO4NKXPJ%2BsRMLyrcA1otZWFisG12emImdli5xAQnSL%2BHwyGyZ%2F75PLsWZkZ6fDldTM4KZ92RGAH52z0RMBOSjjS7TVrHEai%2BdrXrf1KF%2Bzswf13QbBlZm%2FjyT24Qi%2FfGYmieU%2FJdRxR3YZyADhnhJo%2BxWoTxlVyn%2F83WB9IxlGCEV%2FK7DHT%2FliaXsfLtjqieKlkK3uY5hAudwK%2FGE4FSU0A4gO44O2uvHT2K%2BBsut6HrYDyyRm%2FPUQ07iwhtJj85gbwoLwv98ew6sQiEy%2FLHtXTOVmcPr2r97izV5JqJEnvgB6xrfgvdYFEFYy3%2B7L5wrkyLob%2BrJDpmxs4%2BE%2BqlXayQ1WU7ACHWMN7ahasDb1HQ0Z0K2vUXvdL9ajYcL17DjfH0sjqpDCobnGm7EsT1JNgwfsAVpicHx9j%2F6baPRC7zzXiB0p8eSi1QdsgVPL9qh9xNCMAE%2F4S%2BhaXPe4mIPMYKiKLdVuCCN57OBvnX%2BVsBHXbpkv2LLvYQK5tpWGteFZ4ufzXN0unTfGkp32c40g2e3wN49ndKZ6EfTHn0TORNLJKND4h%2FzV4%2FQl3gMfCpf%2FpzBCXf3D8AKFVMfyJyhdms%2BqRbEHgkpsFxPT6yZe9F4PPmC%2Bv2LhDloXrlA9Q19Q4AB1PIy0HxMJmsjM4GOqUBciJgskBGf%2Fz6T0Iv6W3YTCfNm6D%2BSyjgzRLEaPw8TA8HBccMzcDiFyvFa%2B0J3nHZaXDmhJXr165y7lbIdxyRC9X7FD7mIZm1jNEyurzS7rorIhBO1BBAR1l9sPaGuY7yWLQ5bemzMo60KFV4v4x4u6k2SGwAhlZAtQd8aHQTUAeYdduAEC4y0QJJyGjSrfevQZVzUfpDplXy%2F8jLTHL4eBRlHzK6&X-Amz-Signature=4cfaee0bc9e9f19fcf0d3efd7bae51179b8bf60d7d09b022103a687b17743a09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46664U6FSEP%2F20260325%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260325T011337Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCFkrBIUiJUC2pPdQy889%2FO6VOIGl44liDvx7xtqqnt7AIgA4C8JBHLE46UH7C%2FzEbX7AernqiOtFqg8nKeRCA1C18qiAQIoP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJBxXO4NKXPJ%2BsRMLyrcA1otZWFisG12emImdli5xAQnSL%2BHwyGyZ%2F75PLsWZkZ6fDldTM4KZ92RGAH52z0RMBOSjjS7TVrHEai%2BdrXrf1KF%2Bzswf13QbBlZm%2FjyT24Qi%2FfGYmieU%2FJdRxR3YZyADhnhJo%2BxWoTxlVyn%2F83WB9IxlGCEV%2FK7DHT%2FliaXsfLtjqieKlkK3uY5hAudwK%2FGE4FSU0A4gO44O2uvHT2K%2BBsut6HrYDyyRm%2FPUQ07iwhtJj85gbwoLwv98ew6sQiEy%2FLHtXTOVmcPr2r97izV5JqJEnvgB6xrfgvdYFEFYy3%2B7L5wrkyLob%2BrJDpmxs4%2BE%2BqlXayQ1WU7ACHWMN7ahasDb1HQ0Z0K2vUXvdL9ajYcL17DjfH0sjqpDCobnGm7EsT1JNgwfsAVpicHx9j%2F6baPRC7zzXiB0p8eSi1QdsgVPL9qh9xNCMAE%2F4S%2BhaXPe4mIPMYKiKLdVuCCN57OBvnX%2BVsBHXbpkv2LLvYQK5tpWGteFZ4ufzXN0unTfGkp32c40g2e3wN49ndKZ6EfTHn0TORNLJKND4h%2FzV4%2FQl3gMfCpf%2FpzBCXf3D8AKFVMfyJyhdms%2BqRbEHgkpsFxPT6yZe9F4PPmC%2Bv2LhDloXrlA9Q19Q4AB1PIy0HxMJmsjM4GOqUBciJgskBGf%2Fz6T0Iv6W3YTCfNm6D%2BSyjgzRLEaPw8TA8HBccMzcDiFyvFa%2B0J3nHZaXDmhJXr165y7lbIdxyRC9X7FD7mIZm1jNEyurzS7rorIhBO1BBAR1l9sPaGuY7yWLQ5bemzMo60KFV4v4x4u6k2SGwAhlZAtQd8aHQTUAeYdduAEC4y0QJJyGjSrfevQZVzUfpDplXy%2F8jLTHL4eBRlHzK6&X-Amz-Signature=811f2fd2c5646f0b0b469092c94f6735b396cea41522c14dcb0bbcc34491098b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
