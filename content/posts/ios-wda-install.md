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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YLZZIG52%2F20251109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251109T121853Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJGMEQCIBcnEWCmoqTiERFTp3B5%2BOiUTxes3JZzQpr2f16CeDGrAiBkkVxwsaR7iYG1lHf0fje%2FLgYb7oFiT9YdfbL2BJrtGiqIBAjq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMLCyzLOSdl3eU3cAJKtwDprMMypMvVKVJCd%2B1El9DnEhJsCgno%2FVBfgFIZ%2FS0MK%2FyuvOJgBWysrKdkQ8ZcPSnq0UuWSqkxNE2Qv%2FJz5BfXgV1roZLKnQNK7nh87KuHWYhoHvqBK%2BuDXtKzgUZbmLa2NJWj5%2FqPayhThCkqb%2F%2FFtoriVOvMOc9XibvzYvvpo%2BJoI5nV8HnRgvuLzHAprq5sMrXtWZlY%2Fd9xT2u87bK19Ggz5Ot%2FO6y92GwaZr8ToIWqr1KXMYo83%2ByBLR65anPqst%2Ffk8B3qQCQT2NWgNpHdtC6513kcaz%2BUqiAFVMuZRuTi4eF%2FkpiKDeT7JQ3VQqNyqyfFzS2vwQe4ksYYOlkKAemnCdL72GKZtA9aYJyFqErXoEHwqa7iy7f9XxzxTJvcK1qCiEhWRqWCNc9LLC%2FmnRKNwZNlNJ8urIkaV2SJOu4iiXZUdgzb4SPccBZBLDDDrdtSmSEHS8%2B9bk7PKvt1lm4qgz3UfRpQrnYV8MXoziztE5OOJ1OLfJLePsiQDtq%2BYWERav38rnSzMRDAoeeY0RoGrtiKW6qqlTVGO8AE4gL5ezlDccIstx4A6rAimt1kNa8Z%2BZ0%2Botmq%2FMni04lti6ifAquximPlY5J2XLLAH8dhJ1rIMMDSn%2Bdbcw%2F6fByAY6pgF%2Bx%2BwmxU5CyTTXgQNqaMsGGZY79%2FucVtMNA52rjbUT0RskNFsLhaSMd2%2FT7HDNLdranQUIJ%2BTlszCF6neAQFuMyY7Q9LcCucv7UQBvn%2Fyi3VjyOUpvAiniYFxwnoC1SEsrap5mB8%2Bt74XSn8%2BJjzyCI79SdO0XOotY5gWNSXW%2F8J9I7sesyT9zpkzGR263h0dQ%2Fb1%2FGiqX148czvIRqL0UTFei%2FzY9&X-Amz-Signature=a2b5d6da82d451c5016c54b6e9661ac373d190812f3f5e003723e662452f32dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YLZZIG52%2F20251109%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251109T121853Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJGMEQCIBcnEWCmoqTiERFTp3B5%2BOiUTxes3JZzQpr2f16CeDGrAiBkkVxwsaR7iYG1lHf0fje%2FLgYb7oFiT9YdfbL2BJrtGiqIBAjq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMLCyzLOSdl3eU3cAJKtwDprMMypMvVKVJCd%2B1El9DnEhJsCgno%2FVBfgFIZ%2FS0MK%2FyuvOJgBWysrKdkQ8ZcPSnq0UuWSqkxNE2Qv%2FJz5BfXgV1roZLKnQNK7nh87KuHWYhoHvqBK%2BuDXtKzgUZbmLa2NJWj5%2FqPayhThCkqb%2F%2FFtoriVOvMOc9XibvzYvvpo%2BJoI5nV8HnRgvuLzHAprq5sMrXtWZlY%2Fd9xT2u87bK19Ggz5Ot%2FO6y92GwaZr8ToIWqr1KXMYo83%2ByBLR65anPqst%2Ffk8B3qQCQT2NWgNpHdtC6513kcaz%2BUqiAFVMuZRuTi4eF%2FkpiKDeT7JQ3VQqNyqyfFzS2vwQe4ksYYOlkKAemnCdL72GKZtA9aYJyFqErXoEHwqa7iy7f9XxzxTJvcK1qCiEhWRqWCNc9LLC%2FmnRKNwZNlNJ8urIkaV2SJOu4iiXZUdgzb4SPccBZBLDDDrdtSmSEHS8%2B9bk7PKvt1lm4qgz3UfRpQrnYV8MXoziztE5OOJ1OLfJLePsiQDtq%2BYWERav38rnSzMRDAoeeY0RoGrtiKW6qqlTVGO8AE4gL5ezlDccIstx4A6rAimt1kNa8Z%2BZ0%2Botmq%2FMni04lti6ifAquximPlY5J2XLLAH8dhJ1rIMMDSn%2Bdbcw%2F6fByAY6pgF%2Bx%2BwmxU5CyTTXgQNqaMsGGZY79%2FucVtMNA52rjbUT0RskNFsLhaSMd2%2FT7HDNLdranQUIJ%2BTlszCF6neAQFuMyY7Q9LcCucv7UQBvn%2Fyi3VjyOUpvAiniYFxwnoC1SEsrap5mB8%2Bt74XSn8%2BJjzyCI79SdO0XOotY5gWNSXW%2F8J9I7sesyT9zpkzGR263h0dQ%2Fb1%2FGiqX148czvIRqL0UTFei%2FzY9&X-Amz-Signature=58a38cb0a1e71f6940c241dea7838a65b8bb60010ed3bb5c1e30885357634bdd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
