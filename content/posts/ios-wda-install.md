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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SEXRJD6Q%2F20260818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260818T062331Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAJND0fVv%2FvVYLY5Oe6Ms5oEfvbh7mnopfZ9076aMcOKAiBm5h2qSelqY6AUye6M%2B4ct8Z%2BnRyXnf29Y06cadX3pwyr%2FAwhVEAAaDDYzNzQyMzE4MzgwNSIM5BR%2BfFZrc%2FLo51XkKtwD%2BILrQpvZB4Q3lD30G1mjUNTYBpYwcGEKDbng4Yj7MUqr9oIgvLbHlRWPilYn%2FIla9EugA9fc%2BGuafj2sDWiPRv%2BaUQPfAPB5%2BjXYMbdzdqqWrvhrkKT%2Bstkh0jolgu9T4YsVTna%2FwdNuRKKhXnKIAJKuHkzfs%2BKyHDa%2BxanJUJG50tNkVawTjdwUNAhooNAL3KEz4EP%2Bl94T68sLamwila0Ib5AvzOg08%2FBvuo3O6RDtgdGMpXrU8nhM4dZR8zXIXtOqqhUWVSdEsRK%2BaVtotvHQ0frCoaCIOhOS7BOfbrgUdDdp1ecjkVl0yfB5NSmYNa5tq82ri%2BtR%2Bby7TFr%2FGwWLcqjtXByxG7a1XwQ8Y4RBJJmu8lyBL%2F28y6GKqrF95aU7uXn8YVo2QTXHeaTqANsR6VgvVmOxHWtK1zmz7Si5Pu7cQ%2BfoHtSbZSgpDR4iHgudBzOtSPACjbmwlVjmtdEfRRHIS8vxBGTgNO7EM8J6KkJyC%2F2rMgKhzUrvEkkbCQtpN6sqWtmj%2F8HOP8wn1qlRCITJrv3hs%2BB8eTAVNUh3K7Mt0s5f1sBo5UrJBwNv7AzAQ00a6aX5thw73H6qE8OJfcp7%2BRs4KHjlBfdSHQqfXqPfe0vg4BQE%2B8gwlrWP1AY6pgHP%2Bz%2F3yhXjPg5%2BPvvYee0YxOIS8TkclYdyG6RU8tj6cfMsLJuaJjZ1SGEBYY%2BGOaC5DEjRuoROMuQX2no2cPfZlQJDLPUpAbzuJ%2FymtWOxoa3vlCjFrkUpNkFvro1fti5UiiN%2B7vNPIlhegbFHBwlm4RcahwqhztYuAVplgHhIfBkeqcw4RmZAxqjNNTThUQafHYXTYaU%2FHhFMgTzSXr3BL2TB7av6&X-Amz-Signature=5a2780df2c90a94a910abc09b6dbd87b58020a26f5e25abb2b37113f5a430f2d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SEXRJD6Q%2F20260818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260818T062331Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAJND0fVv%2FvVYLY5Oe6Ms5oEfvbh7mnopfZ9076aMcOKAiBm5h2qSelqY6AUye6M%2B4ct8Z%2BnRyXnf29Y06cadX3pwyr%2FAwhVEAAaDDYzNzQyMzE4MzgwNSIM5BR%2BfFZrc%2FLo51XkKtwD%2BILrQpvZB4Q3lD30G1mjUNTYBpYwcGEKDbng4Yj7MUqr9oIgvLbHlRWPilYn%2FIla9EugA9fc%2BGuafj2sDWiPRv%2BaUQPfAPB5%2BjXYMbdzdqqWrvhrkKT%2Bstkh0jolgu9T4YsVTna%2FwdNuRKKhXnKIAJKuHkzfs%2BKyHDa%2BxanJUJG50tNkVawTjdwUNAhooNAL3KEz4EP%2Bl94T68sLamwila0Ib5AvzOg08%2FBvuo3O6RDtgdGMpXrU8nhM4dZR8zXIXtOqqhUWVSdEsRK%2BaVtotvHQ0frCoaCIOhOS7BOfbrgUdDdp1ecjkVl0yfB5NSmYNa5tq82ri%2BtR%2Bby7TFr%2FGwWLcqjtXByxG7a1XwQ8Y4RBJJmu8lyBL%2F28y6GKqrF95aU7uXn8YVo2QTXHeaTqANsR6VgvVmOxHWtK1zmz7Si5Pu7cQ%2BfoHtSbZSgpDR4iHgudBzOtSPACjbmwlVjmtdEfRRHIS8vxBGTgNO7EM8J6KkJyC%2F2rMgKhzUrvEkkbCQtpN6sqWtmj%2F8HOP8wn1qlRCITJrv3hs%2BB8eTAVNUh3K7Mt0s5f1sBo5UrJBwNv7AzAQ00a6aX5thw73H6qE8OJfcp7%2BRs4KHjlBfdSHQqfXqPfe0vg4BQE%2B8gwlrWP1AY6pgHP%2Bz%2F3yhXjPg5%2BPvvYee0YxOIS8TkclYdyG6RU8tj6cfMsLJuaJjZ1SGEBYY%2BGOaC5DEjRuoROMuQX2no2cPfZlQJDLPUpAbzuJ%2FymtWOxoa3vlCjFrkUpNkFvro1fti5UiiN%2B7vNPIlhegbFHBwlm4RcahwqhztYuAVplgHhIfBkeqcw4RmZAxqjNNTThUQafHYXTYaU%2FHhFMgTzSXr3BL2TB7av6&X-Amz-Signature=986ebf41bc3a540191e40c5c8bdfcfe09bbdab03ed542c4172f65b55baa767a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
