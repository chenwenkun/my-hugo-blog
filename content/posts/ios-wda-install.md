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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665CKE676G%2F20261118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261118T144528Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJIMEYCIQDWRnx2RKnUvXMshOoA%2BjSyugy9EqtzQEk5o6k26R%2FrqwIhAOmOjJ3z%2B4JtffcztbB9A3HbpoPEKsxLfT17K6C7MWR6KogECP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzjc9LLxO3eOEA5rg8q3APZNkipZ%2F0bHuKaDbHgYG2VL2gm3H7HrYZLe1TbVJCphQRtubDLazwG%2F2VdS32WSoBN4%2FqyGky8wdkygiVwkaI%2FMVqQlQug5EXjwCWSC%2B9gswTVYs5CIwp%2BLaRXs5iElvSI6ezrBgAuOj1Yo7FKLOFFWAc2QQV9Tsx4E2pchhG92hl4emdJHbQDJ4y1YuQAC0QIUmCXJcd5aMbDhkGsO2f6n7e7sbg3lASA%2Fj%2BCZWktBd%2B7f0XCCKwrWhPx5xvgvwzaMj3VnDQD0PvqplvFb5vlvum%2BsU1ZAwFpAHj5rkbW%2Bx7CILgAfCq2y18yn3JuZEhu0NkOcH7x5XXkbiqPVPzpNo8H4FQL37Zk2ttBvNq2S%2B%2F5DJEmCC2Kt%2FlsTsJ6SZ1UJjklq3NtEupTqkPOwXDDLlNnobtR3cNf3P%2F9ZLqQVJKhTN9b3CoIB8iSVZtSXXOBYiy0X3Vz7aMorXQjpsHfnsRMQ6T8mwdWMXeJhJRg4Xf9C8rXbRYaOY16eWycgQ7pFtzIG%2F2X9CEAakwcI0g%2FrZR1jsWsi9AjOn%2BzcykwPni1%2B87UPzugpXvl7MPJo8fI3%2BdA9nkXLU%2FFyiQ89yTfcll4agU51YMTC0j0gt453EfSkiVVIpvym5jiojCyyPbXBjqkAex9984D5r6rv8JLhm%2FjHRdnb%2Fo21C1a1k40TSR6CLi5HBNbo6NsQRlmQ62MdNqlkzOuu31CQMpVNn8YLzavspwazt4RxLEyHqz%2F2bNs93V8dJRUIxue%2ByT7bVdVlAWaSOjhzr8IflwPX4xbLEujXxsBptWCWN0jGSiOp5JqxEfR4M2NotQAiHXKNu4kOxboGEkgNrRgJEwsQy9xKchAfvhm8rfd&X-Amz-Signature=531bbd48fbc6284ef25e57e66513284b00c19309c8bab4490c8cd3495e9cfdf8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665CKE676G%2F20261118%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261118T144528Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJIMEYCIQDWRnx2RKnUvXMshOoA%2BjSyugy9EqtzQEk5o6k26R%2FrqwIhAOmOjJ3z%2B4JtffcztbB9A3HbpoPEKsxLfT17K6C7MWR6KogECP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igzjc9LLxO3eOEA5rg8q3APZNkipZ%2F0bHuKaDbHgYG2VL2gm3H7HrYZLe1TbVJCphQRtubDLazwG%2F2VdS32WSoBN4%2FqyGky8wdkygiVwkaI%2FMVqQlQug5EXjwCWSC%2B9gswTVYs5CIwp%2BLaRXs5iElvSI6ezrBgAuOj1Yo7FKLOFFWAc2QQV9Tsx4E2pchhG92hl4emdJHbQDJ4y1YuQAC0QIUmCXJcd5aMbDhkGsO2f6n7e7sbg3lASA%2Fj%2BCZWktBd%2B7f0XCCKwrWhPx5xvgvwzaMj3VnDQD0PvqplvFb5vlvum%2BsU1ZAwFpAHj5rkbW%2Bx7CILgAfCq2y18yn3JuZEhu0NkOcH7x5XXkbiqPVPzpNo8H4FQL37Zk2ttBvNq2S%2B%2F5DJEmCC2Kt%2FlsTsJ6SZ1UJjklq3NtEupTqkPOwXDDLlNnobtR3cNf3P%2F9ZLqQVJKhTN9b3CoIB8iSVZtSXXOBYiy0X3Vz7aMorXQjpsHfnsRMQ6T8mwdWMXeJhJRg4Xf9C8rXbRYaOY16eWycgQ7pFtzIG%2F2X9CEAakwcI0g%2FrZR1jsWsi9AjOn%2BzcykwPni1%2B87UPzugpXvl7MPJo8fI3%2BdA9nkXLU%2FFyiQ89yTfcll4agU51YMTC0j0gt453EfSkiVVIpvym5jiojCyyPbXBjqkAex9984D5r6rv8JLhm%2FjHRdnb%2Fo21C1a1k40TSR6CLi5HBNbo6NsQRlmQ62MdNqlkzOuu31CQMpVNn8YLzavspwazt4RxLEyHqz%2F2bNs93V8dJRUIxue%2ByT7bVdVlAWaSOjhzr8IflwPX4xbLEujXxsBptWCWN0jGSiOp5JqxEfR4M2NotQAiHXKNu4kOxboGEkgNrRgJEwsQy9xKchAfvhm8rfd&X-Amz-Signature=513988ea179b5d47ec4cd932c6bb033a5b36c9fd51a226cad4e8a07044802af9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
