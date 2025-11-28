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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSUSEDN7%2F20251128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251128T005200Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCFtGoI3NRW0A2rFp%2BYlEAhae10IyAh9Ld8QBbYR7SgWwIgANqLhQRH1DURAmp0fduShvqN%2BbYkv896UrZBDGlUFoMqiAQIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAnl1l7UaeRB%2Bvi92CrcA05ONK5i2e8DiBTKys9mNc7pcBVZMAbyNySVgD73A3R10Aw7SkHoXw0kpCo04zLLRL%2FQAmBD1T53odIpg%2FvSC2iSWSXBlNRDdV9wGo4c4NrMqaxbJNchYbssI051w4iBq4bz%2BiT47QAh4hZtVz0SAruYzng4P2EayYGYl%2F3KxGa9nmpvsztoNOfTMggKBUQ2NWBpWR81WIcJCxWzEAYMVGHWt4BRp%2FzYacaTJtlGQ9jBftVWeJjvg3rGQ%2BYuq%2FDVv1PM4J3YKDoAgPXiMJXTixG8WLiX4C%2FPWAgaqw%2FCGtmJ8%2Btem3zac%2FfCNZgyfZTwtiGR2hYh2Jp7Q8pq9s4GZN42ut%2FqlWCwMQO70cgLvaaLuhPzCR2eDp6w9ocQk7sb%2FOebpnUboaIuACNm9Pd6iUehnzJknFw%2FzaUZo81Aci6K9O1OSaBTTmMU6yGzyhtxaw2DuW5Zzcxa5nBUfautCsjxmls5n5L7gmXZ4%2BEG3zLveZ2iawPrWyr%2FxruoJYPBQqWc5xG67%2FytIdqSXfxLO7%2Byg8POngXoD0PyBWqKeJRiKQj2D7zbYBJhbdfH41iwPFACTfbN%2FPCkdaI%2BUCEzw9QBrxti3Cv9jtimXbj5fvJSgpC0fMSVZeSd15OzMNTOoskGOqUBC6fnErF1Mt3W1UWgiqVOqJo3pdE8flkkgsQ4bjGod9s086dFt9YvLBUM7xoiEfEkD9t7RPCncu3PKWhIag3lphIQBZeJZzrWOxRabXW%2BPLZ20iu%2B0myWgGNrzuTQPaoFwgO2A%2FO3jdwRuPn4mhG%2Bce1gU3DNczeknk8ZNOw2NPJrrDCZkB%2BeSGPUY3sp5yyJhYb2sO%2F3vB3fCkfdayQLTzrYdOjB&X-Amz-Signature=27644e97e2b22053837db335ebebb3e0731e6aa948b2a3c95dedd87c1455f532&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSUSEDN7%2F20251128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251128T005200Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCFtGoI3NRW0A2rFp%2BYlEAhae10IyAh9Ld8QBbYR7SgWwIgANqLhQRH1DURAmp0fduShvqN%2BbYkv896UrZBDGlUFoMqiAQIpf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAnl1l7UaeRB%2Bvi92CrcA05ONK5i2e8DiBTKys9mNc7pcBVZMAbyNySVgD73A3R10Aw7SkHoXw0kpCo04zLLRL%2FQAmBD1T53odIpg%2FvSC2iSWSXBlNRDdV9wGo4c4NrMqaxbJNchYbssI051w4iBq4bz%2BiT47QAh4hZtVz0SAruYzng4P2EayYGYl%2F3KxGa9nmpvsztoNOfTMggKBUQ2NWBpWR81WIcJCxWzEAYMVGHWt4BRp%2FzYacaTJtlGQ9jBftVWeJjvg3rGQ%2BYuq%2FDVv1PM4J3YKDoAgPXiMJXTixG8WLiX4C%2FPWAgaqw%2FCGtmJ8%2Btem3zac%2FfCNZgyfZTwtiGR2hYh2Jp7Q8pq9s4GZN42ut%2FqlWCwMQO70cgLvaaLuhPzCR2eDp6w9ocQk7sb%2FOebpnUboaIuACNm9Pd6iUehnzJknFw%2FzaUZo81Aci6K9O1OSaBTTmMU6yGzyhtxaw2DuW5Zzcxa5nBUfautCsjxmls5n5L7gmXZ4%2BEG3zLveZ2iawPrWyr%2FxruoJYPBQqWc5xG67%2FytIdqSXfxLO7%2Byg8POngXoD0PyBWqKeJRiKQj2D7zbYBJhbdfH41iwPFACTfbN%2FPCkdaI%2BUCEzw9QBrxti3Cv9jtimXbj5fvJSgpC0fMSVZeSd15OzMNTOoskGOqUBC6fnErF1Mt3W1UWgiqVOqJo3pdE8flkkgsQ4bjGod9s086dFt9YvLBUM7xoiEfEkD9t7RPCncu3PKWhIag3lphIQBZeJZzrWOxRabXW%2BPLZ20iu%2B0myWgGNrzuTQPaoFwgO2A%2FO3jdwRuPn4mhG%2Bce1gU3DNczeknk8ZNOw2NPJrrDCZkB%2BeSGPUY3sp5yyJhYb2sO%2F3vB3fCkfdayQLTzrYdOjB&X-Amz-Signature=d9c7b266fe8be35e7092de87d23d8bdb0dd8660473ff6e0bab47e19a4936cade&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
