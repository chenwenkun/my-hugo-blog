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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SXY6J7MN%2F20260327%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260327T065608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJIMEYCIQDWzd4uSUAzbQFdYULip5gZB66Y%2FBWV%2BZ4nVWlQYLv2zAIhALIEODh5nXKaP9Mf7jxyu5UeZRr4TMZ609DlxKK%2BSE7NKogECNT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzc1ih6XO5exCSJ%2F4Qq3ANKgmofcdCVRSummGqKoffzXslalMQJGTvQWU0oz7mC1eIzArCjaN%2BORPYqpI%2Fa%2BOgJkEkXSO6HZTzZY15HZbVQLACDOFK185jaxA7XsjwE7iEeltGzFrGGtEebW80ipbWXlNkK8S5eSx0XQC1MvH%2Bg55OIjOa6%2FwdqRvYGguFFdGB8hMrpv2lKKLyeymCRQNGjjh%2BazbsXOvMwNobyp08D6YR4Oy2gOiCZvFpEtY%2Fb%2F2TlB%2FnPD48USS4s8a2HcDz%2BoV5jPHOc%2Bu5HZXAI14bC0NsMBtg0prTFJjp7jme72Ne4oLzTq%2FSBnvW0XlKA28dh0q%2BkvNABt1cprUNpl6fOerkOF02nfPKIPa%2BnWxud%2BtV0ueRCLCEUtmjaLIfVNgpBIArl9PmCiZeCeZ0badxTJTSBvmDFDC0rzrEQ8d40aAi6IVylYWF3alZpiDQshy4aPyVpFqi44%2BkxYjTp%2FyOpKRaBRv39jnuzdHV7B%2BGWcGahuS5YQjRUs8mb1uNv%2BaUJcsBeCrqIO0n4JaKlNbwhti7k%2B1pSy6BQeK13dAS862Sl%2BwUKGWz6skUMEYH5gNLbwEczmUuK52UiYaOMzZgRL6fbAuD%2B3L7q6D3xnk94DwBlYMzxiAIdSN5frzCQ25fOBjqkARWYIhC5qPXCNrSgd%2FYqergUJAlCGQMAJlo7dO4bxudupFvLRd95wZbaYGhixhTz5sZW6h5dg4k21eSlFiVhBCSseacZ7zbpgge8BHjOQazZxdwrkY2XXr6XDLqullZlUqlfWYmY4%2FHWplGLlSPbtq0TEsH7ucqe3oxJBkU9UGOSbYI4s7zfeTYzb3fM2TtWNAiml2Zb01eqVEsUMUHC6gSc0mGK&X-Amz-Signature=78e795f7ef3a19c2e8202b90ba35d0b93d7a08056f8d428c0c973238ddee279b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SXY6J7MN%2F20260327%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260327T065608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJIMEYCIQDWzd4uSUAzbQFdYULip5gZB66Y%2FBWV%2BZ4nVWlQYLv2zAIhALIEODh5nXKaP9Mf7jxyu5UeZRr4TMZ609DlxKK%2BSE7NKogECNT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzc1ih6XO5exCSJ%2F4Qq3ANKgmofcdCVRSummGqKoffzXslalMQJGTvQWU0oz7mC1eIzArCjaN%2BORPYqpI%2Fa%2BOgJkEkXSO6HZTzZY15HZbVQLACDOFK185jaxA7XsjwE7iEeltGzFrGGtEebW80ipbWXlNkK8S5eSx0XQC1MvH%2Bg55OIjOa6%2FwdqRvYGguFFdGB8hMrpv2lKKLyeymCRQNGjjh%2BazbsXOvMwNobyp08D6YR4Oy2gOiCZvFpEtY%2Fb%2F2TlB%2FnPD48USS4s8a2HcDz%2BoV5jPHOc%2Bu5HZXAI14bC0NsMBtg0prTFJjp7jme72Ne4oLzTq%2FSBnvW0XlKA28dh0q%2BkvNABt1cprUNpl6fOerkOF02nfPKIPa%2BnWxud%2BtV0ueRCLCEUtmjaLIfVNgpBIArl9PmCiZeCeZ0badxTJTSBvmDFDC0rzrEQ8d40aAi6IVylYWF3alZpiDQshy4aPyVpFqi44%2BkxYjTp%2FyOpKRaBRv39jnuzdHV7B%2BGWcGahuS5YQjRUs8mb1uNv%2BaUJcsBeCrqIO0n4JaKlNbwhti7k%2B1pSy6BQeK13dAS862Sl%2BwUKGWz6skUMEYH5gNLbwEczmUuK52UiYaOMzZgRL6fbAuD%2B3L7q6D3xnk94DwBlYMzxiAIdSN5frzCQ25fOBjqkARWYIhC5qPXCNrSgd%2FYqergUJAlCGQMAJlo7dO4bxudupFvLRd95wZbaYGhixhTz5sZW6h5dg4k21eSlFiVhBCSseacZ7zbpgge8BHjOQazZxdwrkY2XXr6XDLqullZlUqlfWYmY4%2FHWplGLlSPbtq0TEsH7ucqe3oxJBkU9UGOSbYI4s7zfeTYzb3fM2TtWNAiml2Zb01eqVEsUMUHC6gSc0mGK&X-Amz-Signature=62ed63135b7d8cbac97ffefa56f75311ee7fd57770fc26d654faa8a3d6bde49f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
