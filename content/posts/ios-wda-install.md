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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667SP7VWFW%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T134108Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICzxLJ%2FZaetyIvIi3mTW9FCsB9Mb1Zu2dgwo23Ls1qpoAiEAlDGwptEiKihwqrV%2FAWY0HLOfuI496HOT5DkR%2Bfz4%2FQkqiAQIxv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDL9AFZK5yfX9MrtspircA0FeU3l2cKatom5N8vMcXTQhlFhPdhmBQYeScZEe7vFdjqyK78zSw4W1AVBig%2BmWdWYOih%2F65mB0ARfTMtPsnQk%2B2bMjqUGhA8ypGliciba8Fe3nGj0kh%2BT%2FMQGdiJ3y5mQaaUIUjl1EJ8rlF8z842LNjfeJEvHMtuUaQBtYHiaw%2Bm750ERvDAmIP%2BH82y4XSEKaOVFS4EeRMKJavda%2BIRoOEXI4iYcYJZnHdxFXbZdptmOm9pzS9%2ByLrK7DmWttxaFzV%2F49okpmoywNcMwYkAViURWWNneULPhFeIZzxybW78axGxfVW3L6%2BYP7T2g0ur6YW5LuzhyVGEaP%2BGjoKq6s%2BLx%2FFlO9UkTnELCnwHYNJtJaZfaEJSRtMHwhkTrsKhVxjr06h4qaAzwdgX2BUSCfNGFiOPe2%2BYiNljBke%2BsaLb4aWzN%2BGbBwpSRWMTpp1rBlb2QgzFkhwfwR3vS3Z61FK18TW%2BtK%2BIh5%2FpCVa5ve7TX3v%2BS%2BnH3rzwuGz1ut3KGnGCQMASzrZTOD3%2Fn8cKVzckPyNWr1Y1N5qiSyKul%2FFkK1dR37S5M0zIkrX%2BmgpD0N%2FjG%2Fmf0PcXeH5tRIq4hiFx49OaPRfWCD6jSLlhOZ1dw%2BF0PgGIWGDH%2BVMOOHstcGOqUBp19i6C8mbtlpX%2FfPb8%2B8Oo2yjhVs6Vp33kd%2BqjBHEFFBmNuDPD4izto9fG4c2FDht1lbVGV3H0nQg1VfGDHknq3OqOAKkH5OhJRFL2X%2FJM%2F6pIL1JEN1T%2FltcG3UEOu55ptenYHMqoxcuVlnTpAkkBqYbr3riW0Bh6gF7%2FWJh93q2Jv3J8dUBZnbMMqWqlCGtqOTOtASgVuVOCIsiOznDr0HQY40&X-Amz-Signature=63fefb3b5cbf43b0287d8f253618a3abf4b8d506e2f1c639e791c26dd9431c20&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667SP7VWFW%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T134108Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICzxLJ%2FZaetyIvIi3mTW9FCsB9Mb1Zu2dgwo23Ls1qpoAiEAlDGwptEiKihwqrV%2FAWY0HLOfuI496HOT5DkR%2Bfz4%2FQkqiAQIxv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDL9AFZK5yfX9MrtspircA0FeU3l2cKatom5N8vMcXTQhlFhPdhmBQYeScZEe7vFdjqyK78zSw4W1AVBig%2BmWdWYOih%2F65mB0ARfTMtPsnQk%2B2bMjqUGhA8ypGliciba8Fe3nGj0kh%2BT%2FMQGdiJ3y5mQaaUIUjl1EJ8rlF8z842LNjfeJEvHMtuUaQBtYHiaw%2Bm750ERvDAmIP%2BH82y4XSEKaOVFS4EeRMKJavda%2BIRoOEXI4iYcYJZnHdxFXbZdptmOm9pzS9%2ByLrK7DmWttxaFzV%2F49okpmoywNcMwYkAViURWWNneULPhFeIZzxybW78axGxfVW3L6%2BYP7T2g0ur6YW5LuzhyVGEaP%2BGjoKq6s%2BLx%2FFlO9UkTnELCnwHYNJtJaZfaEJSRtMHwhkTrsKhVxjr06h4qaAzwdgX2BUSCfNGFiOPe2%2BYiNljBke%2BsaLb4aWzN%2BGbBwpSRWMTpp1rBlb2QgzFkhwfwR3vS3Z61FK18TW%2BtK%2BIh5%2FpCVa5ve7TX3v%2BS%2BnH3rzwuGz1ut3KGnGCQMASzrZTOD3%2Fn8cKVzckPyNWr1Y1N5qiSyKul%2FFkK1dR37S5M0zIkrX%2BmgpD0N%2FjG%2Fmf0PcXeH5tRIq4hiFx49OaPRfWCD6jSLlhOZ1dw%2BF0PgGIWGDH%2BVMOOHstcGOqUBp19i6C8mbtlpX%2FfPb8%2B8Oo2yjhVs6Vp33kd%2BqjBHEFFBmNuDPD4izto9fG4c2FDht1lbVGV3H0nQg1VfGDHknq3OqOAKkH5OhJRFL2X%2FJM%2F6pIL1JEN1T%2FltcG3UEOu55ptenYHMqoxcuVlnTpAkkBqYbr3riW0Bh6gF7%2FWJh93q2Jv3J8dUBZnbMMqWqlCGtqOTOtASgVuVOCIsiOznDr0HQY40&X-Amz-Signature=e1ca752f82801d4b3c95793830272e645b69694f6decfa9fd9dd94c6f41e00e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
