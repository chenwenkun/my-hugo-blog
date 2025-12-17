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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666C67ZMUK%2F20251217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251217T181856Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCjSWBQ7afZ%2FW0dXLvZVH7%2BcqI0sLxgOlbbqaUmOLFK2QIhAI1NZKU5lUcm27rvoiJlllASchLypAwWUW1MseA9zUSVKogECIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzV3bO9hKFD5zd70OUq3ANRFT6FcqnY1A24C6sb0bYINdMfTCnFqIxnlr7ysrZAyGB5Bgg5UpsurGeUNrwJloQI770ceBODmgne8NApeLFfPkQRmxggsaMFofSZezXlHSrtigH5Krv0zti1ypuokrhYs%2Bj%2BHxb4UoNY8vNnGKtp%2FRc9vpS0Nu1Vm%2Bu8Qon6%2F1zmFE%2BnkPccZuVnK65FGgCnpPj6OfUDVeg9xlQqe2980V2nD%2BC768bLD%2FV96MDANK5fGGeyhzkrKe%2BdQNcmHkuLcUNrDJS%2FvUPFQweJT23UEZi7v6HxrcaZVMZYA3D8NoBC%2Fmc64t%2BpDx5%2BdFIdrExPWHFAc4S5brKVc7PbicydLwS%2B8y6g8XTSKK1xupAS%2BdNR45R7SvMroj1wER8Ao6HSsWyeCKKr%2FF%2FbcgS2tHNMFFgyLXIiF1PIOJH%2Fp%2Bs526XX%2BdRGQe6T1S1bT2FdX3jwC9x6ZN9Ie%2FQluPEJlgilxCjmw4rl9eCeDLhaXoEQ8SD5xnkOqf6xCpToS568PWlaxtbgAd8Q01gZ9WETMTn8Ntcy8Qh%2BC8J%2BHSy0W37NhCqBYWdCjJHegXMw%2FoTMxTWwKa9qzeoPU63uWC0QcNFK%2BSVDlvHGgzIASeQBp3Cx8znNrfy6PbeeKKqmCzC8oIvKBjqkAQro57k%2FocbAuOFhtblcjqYXHEYbZEpu3SZKCoWD02yG7sjaiQsW7siPS70mJXTnKP9pDcWOpBC6Gh964327d0Hv09cnzEeVHxvQrXkn5X3nSE9YM3Fohi1vrxF0iacsFJzjCTrn0PA%2FQCSfh%2BA%2BWlZTXlAfO1BaOO9BKlr1z%2B%2BJIwncXW2wAuj7sjm%2FKNcwMxTx5SRrzwA7UjLLEFbWKsftTMqe&X-Amz-Signature=3307f346b68f99f4c29cbea8ee38e9fe6c5a36d6a4b63236811e7a04025f4d0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666C67ZMUK%2F20251217%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251217T181856Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCjSWBQ7afZ%2FW0dXLvZVH7%2BcqI0sLxgOlbbqaUmOLFK2QIhAI1NZKU5lUcm27rvoiJlllASchLypAwWUW1MseA9zUSVKogECIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzV3bO9hKFD5zd70OUq3ANRFT6FcqnY1A24C6sb0bYINdMfTCnFqIxnlr7ysrZAyGB5Bgg5UpsurGeUNrwJloQI770ceBODmgne8NApeLFfPkQRmxggsaMFofSZezXlHSrtigH5Krv0zti1ypuokrhYs%2Bj%2BHxb4UoNY8vNnGKtp%2FRc9vpS0Nu1Vm%2Bu8Qon6%2F1zmFE%2BnkPccZuVnK65FGgCnpPj6OfUDVeg9xlQqe2980V2nD%2BC768bLD%2FV96MDANK5fGGeyhzkrKe%2BdQNcmHkuLcUNrDJS%2FvUPFQweJT23UEZi7v6HxrcaZVMZYA3D8NoBC%2Fmc64t%2BpDx5%2BdFIdrExPWHFAc4S5brKVc7PbicydLwS%2B8y6g8XTSKK1xupAS%2BdNR45R7SvMroj1wER8Ao6HSsWyeCKKr%2FF%2FbcgS2tHNMFFgyLXIiF1PIOJH%2Fp%2Bs526XX%2BdRGQe6T1S1bT2FdX3jwC9x6ZN9Ie%2FQluPEJlgilxCjmw4rl9eCeDLhaXoEQ8SD5xnkOqf6xCpToS568PWlaxtbgAd8Q01gZ9WETMTn8Ntcy8Qh%2BC8J%2BHSy0W37NhCqBYWdCjJHegXMw%2FoTMxTWwKa9qzeoPU63uWC0QcNFK%2BSVDlvHGgzIASeQBp3Cx8znNrfy6PbeeKKqmCzC8oIvKBjqkAQro57k%2FocbAuOFhtblcjqYXHEYbZEpu3SZKCoWD02yG7sjaiQsW7siPS70mJXTnKP9pDcWOpBC6Gh964327d0Hv09cnzEeVHxvQrXkn5X3nSE9YM3Fohi1vrxF0iacsFJzjCTrn0PA%2FQCSfh%2BA%2BWlZTXlAfO1BaOO9BKlr1z%2B%2BJIwncXW2wAuj7sjm%2FKNcwMxTx5SRrzwA7UjLLEFbWKsftTMqe&X-Amz-Signature=7fe2970c10449e2b87d3fab1665a283a020c79840d558d07ce41f304ee64c425&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
