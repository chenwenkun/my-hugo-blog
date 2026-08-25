---
title: iOS WDA作为App独立运行
date: '2025-09-25'
tags:
  - 技术
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

把 WebDriverAgent（WDA）**打包成可独立安装运行的 iOS App（.ipa）**，用于：

- 不依赖 Xcode 直接在真机上启动 WDA
- 远程/自动化环境更方便地拉起 WDA 服务
- iOS 17+ 也可用（按你的记录验证）
---

## 已验证情况（来自原始记录）

- iOS 16.6：运行闪退
- iOS 18.3 / 18.4：可正常安装运行
---

## 背景：WDA 与维护者

- WDA 最早来自 Facebook（现已不活跃）
- 当前常用维护版本由 Appium 维护（建议优先使用 Appium 维护分支）
（下方保留原始对象/链接块）

---

## 步骤 1：下载代码 & Xcode 首次构建

1. 下载/拉取 WebDriverAgent 代码
1. 用 Xcode 打开工程并先构建一次（确保依赖齐全）
1. 修改 `Bundle Identifier`
1. 选择并勾选你自己的 Apple ID（签名用）
（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WO5BEYRY%2F20260825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260825T122459Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJHMEUCIQDmGyjrBaRqao%2Fji4FUYXMdasfPtrBbGBbBi0HgawVtsgIgCvWXleKBF2JfUR2i3jJWzVb3jDAQBkmC23%2BQvGBfNtYq%2FwMIAxAAGgw2Mzc0MjMxODM4MDUiDHTT3PhUPzcGDv5QIircA2Oy5sJIGiIN0GkM3QEmURV7ktH7MERx7xKcE8K7hOC66FaJnyHcIHjSkj8eb8k7pu%2FtClTWuf1k8uhxqsEPqgWNIgD49FzHxc6Bf5LyfQnel4WvJMdcR%2F8Urw5ah%2BFg%2FCQgqkhx%2BRZ3mmiaIwaHyLyf%2FRiiuVIUE9i1l09gE2He0x9qGapxbcYQYW2crClfsl7TYzZkb%2FdhWrbEWaAmgHmobgub6NaC5%2BAupAIDipUNNEHh2yY6XzSjPA8HoPFCdxKcpZypCHuH9Bz%2B9mx94qxAw%2BomrQjvNI6a9AqBdN%2BMmoevNR3l3Fq9hmNSQddwIi3pbN%2FIyQvCYOmctTtuVhSNuYytM%2BxqL3MNDEeFyT50YvOVC%2BP3Dn%2B%2FgQhThYzU9LS6HJQD86zJUtJTCMymNWyi9wbX7NDGSlMyrqUxXr%2F1jvTxh67erYpUEXmwC4QA7k3860iBicmWX4IThV7y%2FHDiYEYKYuz3%2F8LBXyhsbR0dFWmihMLO71RObiEPeohYacgl7eAjbpHD7%2FaaCxYrooLUEd2XT0V%2BQdh7OvT1pOHEPOJu1ufNlwR3KYxPltmN3IusJ4CiJU9xkrdzh09lqBeioXuDx7rx%2FOGpZhYOYQwzRYLxvJZonwMAL32FMIvWtdQGOqUBIYhQeJ3GXgM1JZ5X1wFLD2wTJYM0yoJPzLD4n9phbEh3iJFoRf2KGNILR18zMyCPijbhhQwDkLIjtZJQ06E4oEQYJ8TZdc2BZIAd26J95xGsIuD7O%2FBWCqO9%2F%2BQwSwPbF%2FDZansxWSOL280daPtkaoeMblKsIbziQwxfhHylKquOgvg%2B2ikkEo95sL7RzyFEAXqMYDCI%2FWnlj0hP3iBUXq%2BSk0bX&X-Amz-Signature=18ffad41bc1fd62658757443d45a2fda93f3e9346af92a319699904aa8c9166c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 2：用 xcodebuild 产出可用于打包的构建产物

```bash
cd /Users/chenwenkun/Downloads/androidandios/iosui/WebDriverAgent/WebDriverAgent

# 使用 xcodebuild 构建 WebDriverAgentRunner 用于测试
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath

# Apple Silicon（可选）显式指定 arm64
xcodebuild build-for-testing \
  -scheme WebDriverAgentRunner \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath /tmp/derivedDataPath \
  -arch arm64
```

---

## 步骤 3：组装 Payload 并打包 ipa

```bash
cd /tmp/derivedDataPath
cd Build/Products/Release-iphoneos

# 创建 Payload 并复制 .app
mkdir Payload && cp -r *.app Payload

# 打包 ipa
zip -r WDA.ipa Payload
```

---

## 步骤 4：清理 Frameworks（关键）

进入：

`WebDriverAgentRunner-Runner.app/Frameworks`

把 **XC 开头的文件全部删掉**（按你原记录的踩坑经验）

（下方保留原图）

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WO5BEYRY%2F20260825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260825T122459Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJHMEUCIQDmGyjrBaRqao%2Fji4FUYXMdasfPtrBbGBbBi0HgawVtsgIgCvWXleKBF2JfUR2i3jJWzVb3jDAQBkmC23%2BQvGBfNtYq%2FwMIAxAAGgw2Mzc0MjMxODM4MDUiDHTT3PhUPzcGDv5QIircA2Oy5sJIGiIN0GkM3QEmURV7ktH7MERx7xKcE8K7hOC66FaJnyHcIHjSkj8eb8k7pu%2FtClTWuf1k8uhxqsEPqgWNIgD49FzHxc6Bf5LyfQnel4WvJMdcR%2F8Urw5ah%2BFg%2FCQgqkhx%2BRZ3mmiaIwaHyLyf%2FRiiuVIUE9i1l09gE2He0x9qGapxbcYQYW2crClfsl7TYzZkb%2FdhWrbEWaAmgHmobgub6NaC5%2BAupAIDipUNNEHh2yY6XzSjPA8HoPFCdxKcpZypCHuH9Bz%2B9mx94qxAw%2BomrQjvNI6a9AqBdN%2BMmoevNR3l3Fq9hmNSQddwIi3pbN%2FIyQvCYOmctTtuVhSNuYytM%2BxqL3MNDEeFyT50YvOVC%2BP3Dn%2B%2FgQhThYzU9LS6HJQD86zJUtJTCMymNWyi9wbX7NDGSlMyrqUxXr%2F1jvTxh67erYpUEXmwC4QA7k3860iBicmWX4IThV7y%2FHDiYEYKYuz3%2F8LBXyhsbR0dFWmihMLO71RObiEPeohYacgl7eAjbpHD7%2FaaCxYrooLUEd2XT0V%2BQdh7OvT1pOHEPOJu1ufNlwR3KYxPltmN3IusJ4CiJU9xkrdzh09lqBeioXuDx7rx%2FOGpZhYOYQwzRYLxvJZonwMAL32FMIvWtdQGOqUBIYhQeJ3GXgM1JZ5X1wFLD2wTJYM0yoJPzLD4n9phbEh3iJFoRf2KGNILR18zMyCPijbhhQwDkLIjtZJQ06E4oEQYJ8TZdc2BZIAd26J95xGsIuD7O%2FBWCqO9%2F%2BQwSwPbF%2FDZansxWSOL280daPtkaoeMblKsIbziQwxfhHylKquOgvg%2B2ikkEo95sL7RzyFEAXqMYDCI%2FWnlj0hP3iBUXq%2BSk0bX&X-Amz-Signature=7b7cad61607182f9c4e6856dd4bda3d95d8a94f907f7f0a8bb15d5c3e42e0163&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 步骤 5：重签名（Re-sign）

使用工具进行重签名：

- iOS App Signer / App Resigner
- 你原文参考链接（保留）：  
产物：保存为 `WDA2.ipa`

（你记录里提到：个人开发者证书可用）

---

## 步骤 6：安装到真机（tidevice）

```bash
pip install tidevice

tidevice install WDA2.ipa
```

---

## 步骤 7：启动与验证

1. 手机上点击 WDA 图标启动
1. 浏览器打开：
- http://localhost:8100/status
出现一段 JSON 即正常。

---

## 附件（保留）

---

## 国内环境补充（你的原始备注整理）

如果需要把端口映射到电脑端进行访问/调试：

```bash
brew install --HEAD libimobiledevice
iproxy 8100 8100
```

然后在电脑端访问 `http://localhost:8100/status`。
