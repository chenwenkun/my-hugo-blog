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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2E6YFOW%2F20251213%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251213T005311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJIMEYCIQCJqPdWu9lHy4Yiavf2em643498uOgf5DtjQIwP1slWCQIhANd%2BNMBw1fqi5V3ILvDZxOkgxKL%2BVLGqkoh8Gt5YnZ6hKv8DCBEQABoMNjM3NDIzMTgzODA1Igy8mgmThwb6bnr9fY8q3APDywTEPD2Li27Jqm904l%2FAqkIXKLR3QzU614gmw4TxdE7xZH%2FYjhEId%2Bz8OP5gFRmIIHsJ6zSWqCYU1H172p0z9Vr8xj1lwgLQ0jA629eRH%2F6lCFt%2BSTkeXdcBruew9k21xjHhbB9uyMAJLmxo3hPMyPhNrF10FV3jLNqQVOKiEh4itjhc23MNkx2kLg0s1nl4%2FavuynkY64%2FZt7wwmAj1gEcLB%2FEM1Rj%2FBvfpW7hwEncA6hi7Ho%2F0n6cRO8AtNga3Mp%2BqV1v345i9uAejJ2FzQ76ML6%2BKSzSxHPIai9A8vy4GQ71F5HKTTmB0pfdOMkh0Q6uJgk41m8ifjZFrsPuvptFOX5W9%2BKp%2FvMBuptIZYrq26GDNNU6b2TD7GVsf8IFNG1Q45PZBLbEV0kkbotXw%2FufBTBCAD98LfVpdZ17zu3x6Qi22uZm0U%2FpZTXw1VBZL3Koitzh8cb7h7jwO35o%2BUGI9zAlHYaDXjq4RxYeHuxoc5UQfeR7MoiBCbmp%2BAt%2BWl5OwAn419hSL5E90DzsPOcMGRhqAJwmNyXttYL%2Fm%2FXhwm666jJto69HnF89%2By4rF11NVwFhQfpfJ%2F%2BjfCZ6vyknXayosNQWmV5IJE16ECq6t6BSVnj5pHpb81DCN2fLJBjqkAfn1r7nQcp%2By71ABiuGNKFS7hUKJkhjTxv4EaRsAUP9Syb%2FyXQ81O1vt02Yo0lSQJK%2FRaYp%2FrlKUy1aSDCcwru5rriAbwkBB6DyjLcgvYniFTMJoFx0avno4njTuKF2NQFOeisCkquyB3G792aVS4idJpGvz9UtTvbXpBXuT9QMu3JN7bpLvEZQ2ZQGjv37FZUk76YrAso8ownXoqjcFcssnZp0C&X-Amz-Signature=f1cc6eff0fbfe1f2e8e34f8ae996c1475d973cf4fbe1e25213094889f07cc139&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T2E6YFOW%2F20251213%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20251213T005311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJIMEYCIQCJqPdWu9lHy4Yiavf2em643498uOgf5DtjQIwP1slWCQIhANd%2BNMBw1fqi5V3ILvDZxOkgxKL%2BVLGqkoh8Gt5YnZ6hKv8DCBEQABoMNjM3NDIzMTgzODA1Igy8mgmThwb6bnr9fY8q3APDywTEPD2Li27Jqm904l%2FAqkIXKLR3QzU614gmw4TxdE7xZH%2FYjhEId%2Bz8OP5gFRmIIHsJ6zSWqCYU1H172p0z9Vr8xj1lwgLQ0jA629eRH%2F6lCFt%2BSTkeXdcBruew9k21xjHhbB9uyMAJLmxo3hPMyPhNrF10FV3jLNqQVOKiEh4itjhc23MNkx2kLg0s1nl4%2FavuynkY64%2FZt7wwmAj1gEcLB%2FEM1Rj%2FBvfpW7hwEncA6hi7Ho%2F0n6cRO8AtNga3Mp%2BqV1v345i9uAejJ2FzQ76ML6%2BKSzSxHPIai9A8vy4GQ71F5HKTTmB0pfdOMkh0Q6uJgk41m8ifjZFrsPuvptFOX5W9%2BKp%2FvMBuptIZYrq26GDNNU6b2TD7GVsf8IFNG1Q45PZBLbEV0kkbotXw%2FufBTBCAD98LfVpdZ17zu3x6Qi22uZm0U%2FpZTXw1VBZL3Koitzh8cb7h7jwO35o%2BUGI9zAlHYaDXjq4RxYeHuxoc5UQfeR7MoiBCbmp%2BAt%2BWl5OwAn419hSL5E90DzsPOcMGRhqAJwmNyXttYL%2Fm%2FXhwm666jJto69HnF89%2By4rF11NVwFhQfpfJ%2F%2BjfCZ6vyknXayosNQWmV5IJE16ECq6t6BSVnj5pHpb81DCN2fLJBjqkAfn1r7nQcp%2By71ABiuGNKFS7hUKJkhjTxv4EaRsAUP9Syb%2FyXQ81O1vt02Yo0lSQJK%2FRaYp%2FrlKUy1aSDCcwru5rriAbwkBB6DyjLcgvYniFTMJoFx0avno4njTuKF2NQFOeisCkquyB3G792aVS4idJpGvz9UtTvbXpBXuT9QMu3JN7bpLvEZQ2ZQGjv37FZUk76YrAso8ownXoqjcFcssnZp0C&X-Amz-Signature=26938170c4a7cc3ac17f276ad944e0acbf1542a29bc038bad0153a7829de87aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
