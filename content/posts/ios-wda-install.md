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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663A7P3QYX%2F20261018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261018T194950Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJHMEUCIQDlKe5aizZOqjsOOH38C08mwgHM2gA6xcXE5J1gQKuWpQIgYdhrEkMjUUvVtthUeSD6OCd2XABL%2Fd3iXIgM68isoW4q%2FwMIGhAAGgw2Mzc0MjMxODM4MDUiDJjtMpXhpp5wdYtGQSrcA7j%2BQmpF81caEfWxVO0LqNzTw1wSLP9x0UIoW8Sn7mUsvjO%2BybqbV44coKUhx9jsnsVn%2FK6vI6TNS1f0fBoYRLMPN3SUbaOEZzyBpTnCHEpH7oMLnNW3%2Babu8JyiMES7POGFMXR7vn3mAtEtDFI1ce%2F9vAxdJ8cwpp1rOzwxbt3kw56AV9l1hTj%2FHjl3PFDqpGlsku%2BbqiQOJd8ubuUIqL3N38L28OlXJ0GHbWaPdZvg%2B9ouc7oXOQxsaZb92MmvN4gRr6zZuBRt5HbOX7JFXnbttWiwMta2%2FxFVH%2B%2BPT9f0v3WkIE5BCmsNmoog9ArJ5%2BaDKItpwzRs9SeQaDOTb0xskrOGfVt24lu6vCm%2FzNAzf28iq9Eg4Ml%2FD3VmD7peC4eXcwqLxfizvW5zq6klP1WvKu8407NYpkSpfpl4nzQdHB6bVCTlowBBtKSQ3lFSKrF%2BDad8RcyH0O9a95F8hcbQSBFlCVcnN9NxqkepseZwALBf%2F2IK%2FFgWwJAj7ngl8BJAfvE6A9jCMUG8VkR751P7xTYtRydOQ1xe2SZva1xh6SWyXObfE2anZ6mmYCLXHGX66H%2FVAXUa2tjCuTr%2FGiDp%2FtGxrSETIAlwnK%2F4qzKORt06Z4ydZjgZkYc0MJKI1NYGOqUBaonxlNc%2BhMt1ZU%2FvHnKHI2CMME42qmI2H%2FLXMgmDaHiU%2BNAtATVPgUeJplcX1h%2FFJJfN5v2G1B8CcaqTTegqeWbbGYHYlY4dZKwBQwjJz35IdE9ANYB2bIT0W7x9dxpKlxutcTBn%2F%2BuPYyLbo3DeG5woF3FaugKhuDX5Tz9nhqJnPfDa3jE6SjpQ3%2F9INFClsaHo9aetEmkJxGSn9FFmWgiB0fAJ&X-Amz-Signature=d8a60f3184298a66e4480b86fac6df1a93dfe61801d97ee8a61582b8a2025859&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663A7P3QYX%2F20261018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261018T194950Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFIaCXVzLXdlc3QtMiJHMEUCIQDlKe5aizZOqjsOOH38C08mwgHM2gA6xcXE5J1gQKuWpQIgYdhrEkMjUUvVtthUeSD6OCd2XABL%2Fd3iXIgM68isoW4q%2FwMIGhAAGgw2Mzc0MjMxODM4MDUiDJjtMpXhpp5wdYtGQSrcA7j%2BQmpF81caEfWxVO0LqNzTw1wSLP9x0UIoW8Sn7mUsvjO%2BybqbV44coKUhx9jsnsVn%2FK6vI6TNS1f0fBoYRLMPN3SUbaOEZzyBpTnCHEpH7oMLnNW3%2Babu8JyiMES7POGFMXR7vn3mAtEtDFI1ce%2F9vAxdJ8cwpp1rOzwxbt3kw56AV9l1hTj%2FHjl3PFDqpGlsku%2BbqiQOJd8ubuUIqL3N38L28OlXJ0GHbWaPdZvg%2B9ouc7oXOQxsaZb92MmvN4gRr6zZuBRt5HbOX7JFXnbttWiwMta2%2FxFVH%2B%2BPT9f0v3WkIE5BCmsNmoog9ArJ5%2BaDKItpwzRs9SeQaDOTb0xskrOGfVt24lu6vCm%2FzNAzf28iq9Eg4Ml%2FD3VmD7peC4eXcwqLxfizvW5zq6klP1WvKu8407NYpkSpfpl4nzQdHB6bVCTlowBBtKSQ3lFSKrF%2BDad8RcyH0O9a95F8hcbQSBFlCVcnN9NxqkepseZwALBf%2F2IK%2FFgWwJAj7ngl8BJAfvE6A9jCMUG8VkR751P7xTYtRydOQ1xe2SZva1xh6SWyXObfE2anZ6mmYCLXHGX66H%2FVAXUa2tjCuTr%2FGiDp%2FtGxrSETIAlwnK%2F4qzKORt06Z4ydZjgZkYc0MJKI1NYGOqUBaonxlNc%2BhMt1ZU%2FvHnKHI2CMME42qmI2H%2FLXMgmDaHiU%2BNAtATVPgUeJplcX1h%2FFJJfN5v2G1B8CcaqTTegqeWbbGYHYlY4dZKwBQwjJz35IdE9ANYB2bIT0W7x9dxpKlxutcTBn%2F%2BuPYyLbo3DeG5woF3FaugKhuDX5Tz9nhqJnPfDa3jE6SjpQ3%2F9INFClsaHo9aetEmkJxGSn9FFmWgiB0fAJ&X-Amz-Signature=5d63ef5ab1088e970ead7625a6f02f265149ac77fb11a5b053533d6cd02dc20a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
