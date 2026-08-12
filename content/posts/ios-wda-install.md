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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XF34F3PZ%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T010107Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHea3QH4MCBg%2FRqeIGvJeka6cdZV%2FRlmZfMOIuhyMb0zAiEAyH9CEPmlmQ6bch5QbiEXbu6NsSqjlAL1CEimK7PJX7gqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBCJBmG1QDlMsHHyvCrcA2fSS0QfSkSl8izjS%2B6jCZZH9FgyLyA96KmfVXJG0rlwy8ZhQRTAiLKT%2BbAo2ZjBsxwEWqm%2BsFrxkPk57VwyrGMamaJ0jaBvzprF7iCmeEHMNuRo0I1KwFiBjAGFVo5f40wYr3HBVaerwfs5y4ti8FFWkPHs9RgZSxKFGzlbxrSUlxthtE%2FCFAyg8%2Fpgq70olV8tqQPELoZgJ8AOnOWMdElyJ5QwsPhPjolMaceym4KhgR5Wpo4Q7fprppnFXKgHITpeySk53sEliAg5AIZ7VYiJSXz34U9%2F6YqynsXJ5CPBa%2BDLv3TgqfFaCiYf%2BvqvvRQrXD5%2FguJYRJHAph4%2FuBaF9cNeYWKmr5EwzEL8ck44HwC8nvGJhSpxZJR90Lns53M2rV99cItnEkEq11QtRLJsa90cq4FaL0FRdQbItsm7b4D61igy4Ynqsq%2BUGUxHX%2BEmBqQqm9ZuTmhgRKYASeCfDVCMoC3ag1LPguL3exmXMcu4LunZQMMY860Df1FQW7s4odKkT8wDd60KuwbTU2fRskwSHGyvt12oKcVAuCm%2BMWoZNLKaXkxWO50JxdcqmweAbbkMaXyRZzrR3E7rDPhMu0SVj5N%2FJtCBmScM7Jos7JGUzGI7BMSyTcYbMMvm7tMGOqUBF1KHJerWpjIsV6DIgFwAP9jZDpk9CWbNfkAxTWQyk5mz%2Bu9MDwbxlx982nCaAChedFL3D1EhRIKRmitfg24QPYOXxYfAF3yExKvGB231%2BiM0Km8NX9g7wXHdAMZzK8UnR5XR3KJRXr27CBvhoLY9LrTGLVQWgKs9uSMJCvpZ96qglVi9vjLYEIzROX6E0vA86lgTqP6EKbm%2BO3cjWNTS09rPcXOF&X-Amz-Signature=799bb47cdbff543d3a632b9e1dc1dbd0c06071b9ef129fba78d28bc659357d05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XF34F3PZ%2F20260812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260812T010108Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHea3QH4MCBg%2FRqeIGvJeka6cdZV%2FRlmZfMOIuhyMb0zAiEAyH9CEPmlmQ6bch5QbiEXbu6NsSqjlAL1CEimK7PJX7gqiAQIwf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBCJBmG1QDlMsHHyvCrcA2fSS0QfSkSl8izjS%2B6jCZZH9FgyLyA96KmfVXJG0rlwy8ZhQRTAiLKT%2BbAo2ZjBsxwEWqm%2BsFrxkPk57VwyrGMamaJ0jaBvzprF7iCmeEHMNuRo0I1KwFiBjAGFVo5f40wYr3HBVaerwfs5y4ti8FFWkPHs9RgZSxKFGzlbxrSUlxthtE%2FCFAyg8%2Fpgq70olV8tqQPELoZgJ8AOnOWMdElyJ5QwsPhPjolMaceym4KhgR5Wpo4Q7fprppnFXKgHITpeySk53sEliAg5AIZ7VYiJSXz34U9%2F6YqynsXJ5CPBa%2BDLv3TgqfFaCiYf%2BvqvvRQrXD5%2FguJYRJHAph4%2FuBaF9cNeYWKmr5EwzEL8ck44HwC8nvGJhSpxZJR90Lns53M2rV99cItnEkEq11QtRLJsa90cq4FaL0FRdQbItsm7b4D61igy4Ynqsq%2BUGUxHX%2BEmBqQqm9ZuTmhgRKYASeCfDVCMoC3ag1LPguL3exmXMcu4LunZQMMY860Df1FQW7s4odKkT8wDd60KuwbTU2fRskwSHGyvt12oKcVAuCm%2BMWoZNLKaXkxWO50JxdcqmweAbbkMaXyRZzrR3E7rDPhMu0SVj5N%2FJtCBmScM7Jos7JGUzGI7BMSyTcYbMMvm7tMGOqUBF1KHJerWpjIsV6DIgFwAP9jZDpk9CWbNfkAxTWQyk5mz%2Bu9MDwbxlx982nCaAChedFL3D1EhRIKRmitfg24QPYOXxYfAF3yExKvGB231%2BiM0Km8NX9g7wXHdAMZzK8UnR5XR3KJRXr27CBvhoLY9LrTGLVQWgKs9uSMJCvpZ96qglVi9vjLYEIzROX6E0vA86lgTqP6EKbm%2BO3cjWNTS09rPcXOF&X-Amz-Signature=8b1aba6c15c3724ba99fa6b3cb3f8d14e80b5381ad7b63570f1c9ba297ce8c23&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
