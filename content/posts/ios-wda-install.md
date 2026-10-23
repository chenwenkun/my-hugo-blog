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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/cb756a73-27bc-4b0d-951a-858df3344b59/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VG2DDGRM%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T160454Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCID2qVFXXleg7G1CaE5zCvOGocZqdjbzcUvJWHm3DMhojAiAo4wGbDUTtlvYiApYVF6bX0U3h2ul49sd0sk149ckt0yqIBAiN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIME0L%2FPD68uoM6JJU8KtwD%2FylIokuAte%2BPTccOGDm5MYR1auWvV0ykEe43Wd3tR1sIlM%2BxMwqegzcDzy0ryjGvEC0ODEXnoeCxx6HmvVMKQBDYtWBCNFPqV3I8aGU2Bm3iZj7MF79JI32SGvikbbYANUZ8CiSGP84LPdCAiF4DWz9C7eQrywQLYIeWEH%2FOUanN9vA44nD5qovMgGrFuz3s1rNL6aForrwF1a37ht%2B5KEncHVmGhz7dvUjNBYjx4vdfxxXydJvPcod%2B4v8Bd45zuhj7jRvxDLIKO2rPnFg5eyAyvwyVfbOLzteww942jv5O5eCXExlLmqhOu8Tvpjd49Xt3P52P52Whmq8YfIGG7Co%2FAcBsaqwewY4o61Cxgq8Bu58zLLnWY3i4dCm6uTVF%2FQsteNNqSTGjrw8oGh7dpDYrh42Lf44iIKomZ%2B0S6n%2BX0BeL8OiSvYFCg7xtMPbOup%2BVcYKoU0kxl6oJC32Kz2oRL8zV5dRsAdUDkc1CBlSXy60rMy4HkOrQKD7UqBXN9yi7zC6v4kAgTweHGhXU5Rygi3EPiXa0W3aTb11IsD6Sc2mnMwYxPvc6HHhh1npzrK05MSOy2pgMcrI%2FM3K19LrTpzTIR4aOtE3sBUfFCuHp%2FyfdsKwP7oS4x8EwuJLt1gY6pgGpjv7uLjGmkXjfOkm6pYFBZrwZaZ3aKIQFCTEhx2PID%2BFmtlE2xcnmr4Ee1q88TyK1FC66ltjAKL4LetOnyYoGeBYWqfxeNH8bWDB%2Bgg0LsIMc1znoJzQKdjVxT4bZb7lIxGIe7Zy21dPoiFE1JjtfOoJwK764tdifloCBYvEfbBf3f2t2WOOM8GpfCET0of0LvD24xoLiMFVVhB22cwM0BANGJqAh&X-Amz-Signature=c766ff7e32c5800978d42056d267d8791e2053723a186adb9d11fe1b9c69fe89&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/358b8d2b-1bfe-4fb9-beb5-83e1de5f201e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VG2DDGRM%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T160454Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCID2qVFXXleg7G1CaE5zCvOGocZqdjbzcUvJWHm3DMhojAiAo4wGbDUTtlvYiApYVF6bX0U3h2ul49sd0sk149ckt0yqIBAiN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIME0L%2FPD68uoM6JJU8KtwD%2FylIokuAte%2BPTccOGDm5MYR1auWvV0ykEe43Wd3tR1sIlM%2BxMwqegzcDzy0ryjGvEC0ODEXnoeCxx6HmvVMKQBDYtWBCNFPqV3I8aGU2Bm3iZj7MF79JI32SGvikbbYANUZ8CiSGP84LPdCAiF4DWz9C7eQrywQLYIeWEH%2FOUanN9vA44nD5qovMgGrFuz3s1rNL6aForrwF1a37ht%2B5KEncHVmGhz7dvUjNBYjx4vdfxxXydJvPcod%2B4v8Bd45zuhj7jRvxDLIKO2rPnFg5eyAyvwyVfbOLzteww942jv5O5eCXExlLmqhOu8Tvpjd49Xt3P52P52Whmq8YfIGG7Co%2FAcBsaqwewY4o61Cxgq8Bu58zLLnWY3i4dCm6uTVF%2FQsteNNqSTGjrw8oGh7dpDYrh42Lf44iIKomZ%2B0S6n%2BX0BeL8OiSvYFCg7xtMPbOup%2BVcYKoU0kxl6oJC32Kz2oRL8zV5dRsAdUDkc1CBlSXy60rMy4HkOrQKD7UqBXN9yi7zC6v4kAgTweHGhXU5Rygi3EPiXa0W3aTb11IsD6Sc2mnMwYxPvc6HHhh1npzrK05MSOy2pgMcrI%2FM3K19LrTpzTIR4aOtE3sBUfFCuHp%2FyfdsKwP7oS4x8EwuJLt1gY6pgGpjv7uLjGmkXjfOkm6pYFBZrwZaZ3aKIQFCTEhx2PID%2BFmtlE2xcnmr4Ee1q88TyK1FC66ltjAKL4LetOnyYoGeBYWqfxeNH8bWDB%2Bgg0LsIMc1znoJzQKdjVxT4bZb7lIxGIe7Zy21dPoiFE1JjtfOoJwK764tdifloCBYvEfbBf3f2t2WOOM8GpfCET0of0LvD24xoLiMFVVhB22cwM0BANGJqAh&X-Amz-Signature=a096e10acaa0a9f4b8f377a417da7ebb48f234b1a35b73004545a08140749bb1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
