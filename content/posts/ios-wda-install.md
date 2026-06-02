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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XEROQL6U%2F20260602%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260602T100136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIH%2BkeZTRKcz%2BpaX78C6Hy9qezgjZTPb3aACvtgCI03hWAiEAxTsQoRuG1XXKjOPAUGCvH6g3nj%2FJa7yIQ2ZiSQXZ94Mq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDKKkgghf9KWcuiGvhyrcAzY0s6L6WHD%2BT0C4MYx%2Bvdswob9TphAJrMEXf6J17e%2FnWNqC6qIP1BEORyANWcP%2FlNklQPd%2FYYdaTiMgbuLkHrqHnezq%2FGuZp2KEddMI11Mo7eBbifS90C9oIQKCzUInH8jh%2F17YK%2Bx1NeM%2B%2FrcmeUd%2FX1Q4Bqe8BiDSFgkx9Gy4oxF4xDYUvhNSQQ%2BmCuFs8OaoYJrjAorQlPJUGuhf9bcXmcV3YK5YTTZnepq7oplIwajjM75mkkITJaLvmTUONd43ozItQUv8cwWk4Q9AFhyE%2FIu6WhgWgZ69lnNnMspwtvkhSwhIki44SBNkTB8f%2F%2FzRDzkQ%2BLTA%2FLP6g3LcUC0E5VL0ICDAKqn5ZuZOIAtI5rICJD7M%2FjCjq2%2Fk0dC9R%2F1AcshLfdGc3KUPOPwf%2BnQF9vcY4W2RQx2WLvcOOmACTNVWpV7j1vaEmceZj0xwkTalTdBDADPCZ%2F8FQv6GGBtXxJIQRXUgP%2FhIhVhI2%2FbGUBfNXrKTx7gPmxQ%2FYhSmcb1ljkj5N5b%2FuhMMUvn5lpBYDvkec1Ytzl8eKayZnR8ScFQRV%2BrGl%2F1GSNBcH3xDHZpgvNdt8AIBOj17a4wXUfyScoCaEVY7tVgNX7G7Az1pbhMAD4jrgSpN%2B7E2MIe4%2BtAGOqUB8rFOG7FS0%2FhhdHu7r9MCN%2Fc1U4W2mby5lOxtFoCb6mSbp21I1ouSJWZcED36SiEe8dZhlj7jygqES%2BAn%2BjRisIG2P%2FYd7ucq901MHcR%2BPRW6Wb%2BdO%2FN88gUNXxP0IwXiKiSjXWIzECIbM1gP2QJzFdxuTwjx6Kcc550pX6i5Xi3IcYDEGFHPoUFX%2Bjh5l%2BNyFMFfSbofnTlDVJUOp5t0cY%2B1Qa0g&X-Amz-Signature=0682dce2a3208015b8ef680810fab9c6c1026068d8ec44f15c5e08bca245d75c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XEROQL6U%2F20260602%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260602T100136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFkaCXVzLXdlc3QtMiJHMEUCIH%2BkeZTRKcz%2BpaX78C6Hy9qezgjZTPb3aACvtgCI03hWAiEAxTsQoRuG1XXKjOPAUGCvH6g3nj%2FJa7yIQ2ZiSQXZ94Mq%2FwMIIhAAGgw2Mzc0MjMxODM4MDUiDKKkgghf9KWcuiGvhyrcAzY0s6L6WHD%2BT0C4MYx%2Bvdswob9TphAJrMEXf6J17e%2FnWNqC6qIP1BEORyANWcP%2FlNklQPd%2FYYdaTiMgbuLkHrqHnezq%2FGuZp2KEddMI11Mo7eBbifS90C9oIQKCzUInH8jh%2F17YK%2Bx1NeM%2B%2FrcmeUd%2FX1Q4Bqe8BiDSFgkx9Gy4oxF4xDYUvhNSQQ%2BmCuFs8OaoYJrjAorQlPJUGuhf9bcXmcV3YK5YTTZnepq7oplIwajjM75mkkITJaLvmTUONd43ozItQUv8cwWk4Q9AFhyE%2FIu6WhgWgZ69lnNnMspwtvkhSwhIki44SBNkTB8f%2F%2FzRDzkQ%2BLTA%2FLP6g3LcUC0E5VL0ICDAKqn5ZuZOIAtI5rICJD7M%2FjCjq2%2Fk0dC9R%2F1AcshLfdGc3KUPOPwf%2BnQF9vcY4W2RQx2WLvcOOmACTNVWpV7j1vaEmceZj0xwkTalTdBDADPCZ%2F8FQv6GGBtXxJIQRXUgP%2FhIhVhI2%2FbGUBfNXrKTx7gPmxQ%2FYhSmcb1ljkj5N5b%2FuhMMUvn5lpBYDvkec1Ytzl8eKayZnR8ScFQRV%2BrGl%2F1GSNBcH3xDHZpgvNdt8AIBOj17a4wXUfyScoCaEVY7tVgNX7G7Az1pbhMAD4jrgSpN%2B7E2MIe4%2BtAGOqUB8rFOG7FS0%2FhhdHu7r9MCN%2Fc1U4W2mby5lOxtFoCb6mSbp21I1ouSJWZcED36SiEe8dZhlj7jygqES%2BAn%2BjRisIG2P%2FYd7ucq901MHcR%2BPRW6Wb%2BdO%2FN88gUNXxP0IwXiKiSjXWIzECIbM1gP2QJzFdxuTwjx6Kcc550pX6i5Xi3IcYDEGFHPoUFX%2Bjh5l%2BNyFMFfSbofnTlDVJUOp5t0cY%2B1Qa0g&X-Amz-Signature=ba578024296dd266027527d26a3302e000952053d275069c4d3619d3e3baf6f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
