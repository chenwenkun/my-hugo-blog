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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZBUDRSP%2F20260317%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260317T011107Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCIFGs0TXqhN4BMoO10%2F%2BQ%2BcXzuoRTBMxcat6dq0%2BzF4BwAiEAzjGU931gv7tDAcTmcaWfvvX4ponTas7J8eZBk%2Bq7qncqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOE9rbvkxS5UCWM19yrcA%2BuJP5%2F7jyQeMAvkRMeGmX%2BZLOQG7980VtKNPUouGjdiDL2aUgvK%2BkXKH7j9JyPRHTJxuHPp9YewBHIBPD%2FoouvVcu%2FZ%2BVMnsZz0ICaevE%2FLkclDDHwF8C24%2FqBSLL6tCnaxabXcdqazgo6cGCOt3Owj8aIhZgL0gG2pASl%2Ft0Ceki0lzMAi2LJZDfPTiMNplHnERNBJfg%2FpjggEpnY9XZDZUYCYOPim40Pi9gBrdX0ArV9gYZ1VlfIxABzOxXYc68wT41mom1CcpDAeYs3YNb8eFh0n0aG6ZoXriZ3NUrfW3yd86VZfwHgsgYaBxIWc08g6C%2FYBRrg%2FLFLIMAUPghoO4z93%2B6XGSPZT789RSvmuHqQAXCxOxgH9Rb3bqQA421md7dQts462qbNUYdQ0DMynBpjia9wNZn3EbhUwBV3JjWL4QNMxhTnH2bpYIqQdN4nAVBACzXuInIGekg28rOeeG%2BVbtkQNlUGJhUmYBu537%2B4bOkGZQxQoGyNQHtnHR1KX%2Bp0yqJ%2FS71lhCV6enZIwjhHawZiAArz5jjekv9YPeH6QdvhmMhAFvtCQEqK3UsoqUC5SKvBQqSkqZKwbyyZXxPLwr0xAM3SyCgqD%2B2WDYroAXazjK4grfRo1MJi64s0GOqUB%2By0865bTA9NVS7L3AD8KD8UJhFWU7Q0RqnZnepyxq6GU%2F9k%2FT9wiiiG6OtWO50TtwWNmePBZcwrBroZ%2B4rCP239A52i22wlORVYxWRytFB5Jd27ZHu0RI1jfvnSbSjgYa0WH3oSbQvcb%2BRz67ljcttqoxEg82LQcotu2Syvaa1DVSrP5FBYRdbpG9KXK6G2qpU3Knn%2BGgVNMrNQveMw5KkoaZ9NC&X-Amz-Signature=cb36835d427cdbef1a57c468435444cd542dbbb09fa319d50589992b82b5a739&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZBUDRSP%2F20260317%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260317T011107Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBgaCXVzLXdlc3QtMiJHMEUCIFGs0TXqhN4BMoO10%2F%2BQ%2BcXzuoRTBMxcat6dq0%2BzF4BwAiEAzjGU931gv7tDAcTmcaWfvvX4ponTas7J8eZBk%2Bq7qncqiAQI4f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOE9rbvkxS5UCWM19yrcA%2BuJP5%2F7jyQeMAvkRMeGmX%2BZLOQG7980VtKNPUouGjdiDL2aUgvK%2BkXKH7j9JyPRHTJxuHPp9YewBHIBPD%2FoouvVcu%2FZ%2BVMnsZz0ICaevE%2FLkclDDHwF8C24%2FqBSLL6tCnaxabXcdqazgo6cGCOt3Owj8aIhZgL0gG2pASl%2Ft0Ceki0lzMAi2LJZDfPTiMNplHnERNBJfg%2FpjggEpnY9XZDZUYCYOPim40Pi9gBrdX0ArV9gYZ1VlfIxABzOxXYc68wT41mom1CcpDAeYs3YNb8eFh0n0aG6ZoXriZ3NUrfW3yd86VZfwHgsgYaBxIWc08g6C%2FYBRrg%2FLFLIMAUPghoO4z93%2B6XGSPZT789RSvmuHqQAXCxOxgH9Rb3bqQA421md7dQts462qbNUYdQ0DMynBpjia9wNZn3EbhUwBV3JjWL4QNMxhTnH2bpYIqQdN4nAVBACzXuInIGekg28rOeeG%2BVbtkQNlUGJhUmYBu537%2B4bOkGZQxQoGyNQHtnHR1KX%2Bp0yqJ%2FS71lhCV6enZIwjhHawZiAArz5jjekv9YPeH6QdvhmMhAFvtCQEqK3UsoqUC5SKvBQqSkqZKwbyyZXxPLwr0xAM3SyCgqD%2B2WDYroAXazjK4grfRo1MJi64s0GOqUB%2By0865bTA9NVS7L3AD8KD8UJhFWU7Q0RqnZnepyxq6GU%2F9k%2FT9wiiiG6OtWO50TtwWNmePBZcwrBroZ%2B4rCP239A52i22wlORVYxWRytFB5Jd27ZHu0RI1jfvnSbSjgYa0WH3oSbQvcb%2BRz67ljcttqoxEg82LQcotu2Syvaa1DVSrP5FBYRdbpG9KXK6G2qpU3Knn%2BGgVNMrNQveMw5KkoaZ9NC&X-Amz-Signature=7c9f8433ec53cbd8206605d3da2eec8f9276110acb68405bbd1859cb7e5c50db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
