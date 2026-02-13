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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VO6ZBSET%2F20260213%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260213T183223Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIGHTX1LVi3YX6tYEYWzs8O8QfPTerfTdQ6%2FTG5CCAnEqAiEAmR6eVPZBlpJKGVW8Q99ml%2BE7%2F3mxDwd8yaDOahTZgo8qiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJ8sr5KPClhCObnGlCrcAxk%2BSaDLfFCYs%2BnVjdBbzZKbrYlJVhFhTngo41MuG8bl163RcsaKutuEbyFtGNld3zs6ImiDuEtfcRZF3K5ReIH3Z9YhMUFM6g3ZdhDv7Gsg2BCqlKl04%2BQaSrcc7OTGPkH3n%2BJ1OcyWcg%2B%2FnR%2BgZ1%2FJgqavdPp8AUabQiHqOajLRWR7d99TdURabygRROGx8mFX%2FDA337tbV6uyUbeUk29cu%2FXgb0WgwXs%2FklUP4g%2FrOL18sfgUzFfJ28X%2FZge14UGFSk2CXwvBcOHEcZQyqb1HWy0D8D2sUg3pMp8mQtcnYRtFoh%2FtBa3loaHTs2iAZIRnvqIWrDpKb1mdtDtwpvrlRt2fJWi6NTfO8MhApDGZDd%2Fe%2BBhkz0BELd3PdmO5lrkY3c3mUSpsVT2sPDDjudO%2FFkpIw01rhxaH6K7ucp1O6%2BdZJ3PbrZxs0W9VjJGn1yJR4ZEVS6UgsN0KJavoCpTDQDsPxVEDgOj6updFKZPD6F2CJQDXViuErz73lxWe%2BYg2Td0O7AUDCofwN96n8NwqsejBFZwbtH6%2F%2BPo0ivGqassbmXMbBDAoCxiSUMg%2Bl56iyDESXW1bK3wMBi0QiCeNMsuD9Ns0vTvblD%2FPxoXOhswCPXKYWZ9h255AMLO3vcwGOqUB3cpwPGRZtODZResM9t1MIzeiAmxx7%2BzJa4bZnrIvDZ11AxaOM5l1KvnF%2B%2FRmQjYJjXno3ZknWu3iUQMVFmfWGOXEZKjtI43%2BMpxXsMGKN6ykqfE1g%2BCnLCQDe8j0AQ53HNogC8zD63P%2FAVzF3FaJivaVHKnxznd%2BZ%2BCaE2pl2OdP6qAas%2FBIgJasxk%2FP38YpDwTmONrTiiXdaKq8%2BXjl6wh9Cn9E&X-Amz-Signature=642c79ab71bb028db1899c68fa96e9bcde8717393a3033b174820f05f7e38973&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VO6ZBSET%2F20260213%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260213T183223Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIGHTX1LVi3YX6tYEYWzs8O8QfPTerfTdQ6%2FTG5CCAnEqAiEAmR6eVPZBlpJKGVW8Q99ml%2BE7%2F3mxDwd8yaDOahTZgo8qiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJ8sr5KPClhCObnGlCrcAxk%2BSaDLfFCYs%2BnVjdBbzZKbrYlJVhFhTngo41MuG8bl163RcsaKutuEbyFtGNld3zs6ImiDuEtfcRZF3K5ReIH3Z9YhMUFM6g3ZdhDv7Gsg2BCqlKl04%2BQaSrcc7OTGPkH3n%2BJ1OcyWcg%2B%2FnR%2BgZ1%2FJgqavdPp8AUabQiHqOajLRWR7d99TdURabygRROGx8mFX%2FDA337tbV6uyUbeUk29cu%2FXgb0WgwXs%2FklUP4g%2FrOL18sfgUzFfJ28X%2FZge14UGFSk2CXwvBcOHEcZQyqb1HWy0D8D2sUg3pMp8mQtcnYRtFoh%2FtBa3loaHTs2iAZIRnvqIWrDpKb1mdtDtwpvrlRt2fJWi6NTfO8MhApDGZDd%2Fe%2BBhkz0BELd3PdmO5lrkY3c3mUSpsVT2sPDDjudO%2FFkpIw01rhxaH6K7ucp1O6%2BdZJ3PbrZxs0W9VjJGn1yJR4ZEVS6UgsN0KJavoCpTDQDsPxVEDgOj6updFKZPD6F2CJQDXViuErz73lxWe%2BYg2Td0O7AUDCofwN96n8NwqsejBFZwbtH6%2F%2BPo0ivGqassbmXMbBDAoCxiSUMg%2Bl56iyDESXW1bK3wMBi0QiCeNMsuD9Ns0vTvblD%2FPxoXOhswCPXKYWZ9h255AMLO3vcwGOqUB3cpwPGRZtODZResM9t1MIzeiAmxx7%2BzJa4bZnrIvDZ11AxaOM5l1KvnF%2B%2FRmQjYJjXno3ZknWu3iUQMVFmfWGOXEZKjtI43%2BMpxXsMGKN6ykqfE1g%2BCnLCQDe8j0AQ53HNogC8zD63P%2FAVzF3FaJivaVHKnxznd%2BZ%2BCaE2pl2OdP6qAas%2FBIgJasxk%2FP38YpDwTmONrTiiXdaKq8%2BXjl6wh9Cn9E&X-Amz-Signature=7368ea1e1bd63420e819cbd8711271181d919b916dc714f3c68a562553d314e6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
