---
title: 谷歌浏览器插件类测试工具
date: '2025-09-25'
tags:
  - 开发
draft: false
author: chenwenkun
toc: true
show_reading_time: true
---
## 目标

整理一组我常用的「浏览器插件 / 辅助工具」能力，主要面向：

- 测试 / 预发 / 生产环境快速区分
- 页面刷新、缓存清理类操作
- 禅道（ZenTao）用例与测试单效率提升
---

## 1）页面强制刷新器（强刷 + 清缓存）

**用途：**

- 避免浏览器缓存导致“看起来没更新”
- 页面调试时快速清理缓存并强制重新加载资源
**要点：**

- 提供两个刷新功能：
（下方保留原有对象/附件）

---

## 2）测试 / 预发 / 正式环境标识器

**用途：**

- 通过 tab / 页面角标明显提示当前环境
- 降低在不同环境之间切换时的误操作风险（尤其是生产环境）
（下方保留原有对象/附件）

---

## 3）禅道测试用例支持 shift+批量选择插件

**用途：**

- 在禅道用例列表中，支持 Shift 多选，提高批量操作效率
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VNZYTNYA%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T102829Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIFMAOF2nUWSullda%2FcPi9vPXxpaQsJ3WA%2FTuxGB8a3MVAiAuPoE6vE9EvfhLrA1mC2vwSGeO12q3TQe%2FL7oXoJIBgCr%2FAwgCEAAaDDYzNzQyMzE4MzgwNSIMpwYK5eucuwfFlBuuKtwDQpLG423dGlg1i8RpkfOEIjEbde9PoyEo5JzAc2nABgLaexF2FKCgddxZYAeybQKpz2gGLsaqXiv52u890mFIIv8OsYeUYwTlGlLiCzXVLQZWOpJqj%2BnBDR%2FO%2Bhk9dH%2BJD2ooh0Xly%2FXbTwCb9enCgIHDlNSYjfZYmYsSNQUpW8reMHipdc5u%2Bini5jM%2F7i26weJtg7gIY%2Bi9wOjqbUIN9TlKgenhQN85%2FwEgBgL4%2FAmn%2B8439hXh6UEed%2BKPRtyWOHByhvALNWOwtr5NaAc9voqA6jsCFlvzcDVQ4QfqTVgQUNPDz6FC7zzYSwt%2FCRYs6V%2FBFfS%2FasQ%2Bo%2FDTcAnK9RpcvMpuG0FPQCf3RKMb1DBLwZlFIcWwPz87g2bVeo5Vq3nHaXfAjjT7b%2B3xOSdbYHEE%2FN0AGBXbtTo1JhU0%2BHIfZgzoCYisRad85mBNb11OcQl%2BrQdG2NkGnHMQNjIQiJJUpiHC6FfXCJ2LNFIOI3E3yRFcZtZE28jraz%2BVW6CoTsO%2FA1OAYBtq5opFgySlGEQbQ7MbUnmEtncBusPrxBHeud2g864fzCaYKQDBuX0GR7tpVTRk6v0USj%2B66hjsYqxQnNoiSrHDkERcIt3AbKtpQBEjBpRFVk%2FUAXMwmYTe1QY6pgEqhY%2FFxpY%2Bk6yWGG5Vp%2B0MC96SXX6N66xomW55y%2FSf%2F4AqmnT%2BzED5trjo7YbxLJrE3kzbjCEvhKjrGD%2Bw%2B6N47d7GV5VLTscL79DEIg2FdIJl2dpd7NeJcI6I%2BGFXLalJTuOGmWU%2BiKh6yQSYBAhAzmcnI9%2BDv%2FQs%2BSTpQUeUcrxRCkdo%2FWwpm%2B%2FqZLywjEtVESfpNyix9Dh4BMZ18BFwGLqVSewr&X-Amz-Signature=9287fe18d980c959a6769d1c7141d8d3d8aae22222a5f8360d4af174f9e59467&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VNZYTNYA%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T102829Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIFMAOF2nUWSullda%2FcPi9vPXxpaQsJ3WA%2FTuxGB8a3MVAiAuPoE6vE9EvfhLrA1mC2vwSGeO12q3TQe%2FL7oXoJIBgCr%2FAwgCEAAaDDYzNzQyMzE4MzgwNSIMpwYK5eucuwfFlBuuKtwDQpLG423dGlg1i8RpkfOEIjEbde9PoyEo5JzAc2nABgLaexF2FKCgddxZYAeybQKpz2gGLsaqXiv52u890mFIIv8OsYeUYwTlGlLiCzXVLQZWOpJqj%2BnBDR%2FO%2Bhk9dH%2BJD2ooh0Xly%2FXbTwCb9enCgIHDlNSYjfZYmYsSNQUpW8reMHipdc5u%2Bini5jM%2F7i26weJtg7gIY%2Bi9wOjqbUIN9TlKgenhQN85%2FwEgBgL4%2FAmn%2B8439hXh6UEed%2BKPRtyWOHByhvALNWOwtr5NaAc9voqA6jsCFlvzcDVQ4QfqTVgQUNPDz6FC7zzYSwt%2FCRYs6V%2FBFfS%2FasQ%2Bo%2FDTcAnK9RpcvMpuG0FPQCf3RKMb1DBLwZlFIcWwPz87g2bVeo5Vq3nHaXfAjjT7b%2B3xOSdbYHEE%2FN0AGBXbtTo1JhU0%2BHIfZgzoCYisRad85mBNb11OcQl%2BrQdG2NkGnHMQNjIQiJJUpiHC6FfXCJ2LNFIOI3E3yRFcZtZE28jraz%2BVW6CoTsO%2FA1OAYBtq5opFgySlGEQbQ7MbUnmEtncBusPrxBHeud2g864fzCaYKQDBuX0GR7tpVTRk6v0USj%2B66hjsYqxQnNoiSrHDkERcIt3AbKtpQBEjBpRFVk%2FUAXMwmYTe1QY6pgEqhY%2FFxpY%2Bk6yWGG5Vp%2B0MC96SXX6N66xomW55y%2FSf%2F4AqmnT%2BzED5trjo7YbxLJrE3kzbjCEvhKjrGD%2Bw%2B6N47d7GV5VLTscL79DEIg2FdIJl2dpd7NeJcI6I%2BGFXLalJTuOGmWU%2BiKh6yQSYBAhAzmcnI9%2BDv%2FQs%2BSTpQUeUcrxRCkdo%2FWwpm%2B%2FqZLywjEtVESfpNyix9Dh4BMZ18BFwGLqVSewr&X-Amz-Signature=79bd32af63c12edd40244f02b1e15a2d6b65d817bd5e03f9ed03774616838569&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VNZYTNYA%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T102829Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIFMAOF2nUWSullda%2FcPi9vPXxpaQsJ3WA%2FTuxGB8a3MVAiAuPoE6vE9EvfhLrA1mC2vwSGeO12q3TQe%2FL7oXoJIBgCr%2FAwgCEAAaDDYzNzQyMzE4MzgwNSIMpwYK5eucuwfFlBuuKtwDQpLG423dGlg1i8RpkfOEIjEbde9PoyEo5JzAc2nABgLaexF2FKCgddxZYAeybQKpz2gGLsaqXiv52u890mFIIv8OsYeUYwTlGlLiCzXVLQZWOpJqj%2BnBDR%2FO%2Bhk9dH%2BJD2ooh0Xly%2FXbTwCb9enCgIHDlNSYjfZYmYsSNQUpW8reMHipdc5u%2Bini5jM%2F7i26weJtg7gIY%2Bi9wOjqbUIN9TlKgenhQN85%2FwEgBgL4%2FAmn%2B8439hXh6UEed%2BKPRtyWOHByhvALNWOwtr5NaAc9voqA6jsCFlvzcDVQ4QfqTVgQUNPDz6FC7zzYSwt%2FCRYs6V%2FBFfS%2FasQ%2Bo%2FDTcAnK9RpcvMpuG0FPQCf3RKMb1DBLwZlFIcWwPz87g2bVeo5Vq3nHaXfAjjT7b%2B3xOSdbYHEE%2FN0AGBXbtTo1JhU0%2BHIfZgzoCYisRad85mBNb11OcQl%2BrQdG2NkGnHMQNjIQiJJUpiHC6FfXCJ2LNFIOI3E3yRFcZtZE28jraz%2BVW6CoTsO%2FA1OAYBtq5opFgySlGEQbQ7MbUnmEtncBusPrxBHeud2g864fzCaYKQDBuX0GR7tpVTRk6v0USj%2B66hjsYqxQnNoiSrHDkERcIt3AbKtpQBEjBpRFVk%2FUAXMwmYTe1QY6pgEqhY%2FFxpY%2Bk6yWGG5Vp%2B0MC96SXX6N66xomW55y%2FSf%2F4AqmnT%2BzED5trjo7YbxLJrE3kzbjCEvhKjrGD%2Bw%2B6N47d7GV5VLTscL79DEIg2FdIJl2dpd7NeJcI6I%2BGFXLalJTuOGmWU%2BiKh6yQSYBAhAzmcnI9%2BDv%2FQs%2BSTpQUeUcrxRCkdo%2FWwpm%2B%2FqZLywjEtVESfpNyix9Dh4BMZ18BFwGLqVSewr&X-Amz-Signature=748d71a8f883357d736c301f820259e4eab65910179d83e55786d318f4a006e9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VNZYTNYA%2F20260926%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260926T102829Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDkaCXVzLXdlc3QtMiJGMEQCIFMAOF2nUWSullda%2FcPi9vPXxpaQsJ3WA%2FTuxGB8a3MVAiAuPoE6vE9EvfhLrA1mC2vwSGeO12q3TQe%2FL7oXoJIBgCr%2FAwgCEAAaDDYzNzQyMzE4MzgwNSIMpwYK5eucuwfFlBuuKtwDQpLG423dGlg1i8RpkfOEIjEbde9PoyEo5JzAc2nABgLaexF2FKCgddxZYAeybQKpz2gGLsaqXiv52u890mFIIv8OsYeUYwTlGlLiCzXVLQZWOpJqj%2BnBDR%2FO%2Bhk9dH%2BJD2ooh0Xly%2FXbTwCb9enCgIHDlNSYjfZYmYsSNQUpW8reMHipdc5u%2Bini5jM%2F7i26weJtg7gIY%2Bi9wOjqbUIN9TlKgenhQN85%2FwEgBgL4%2FAmn%2B8439hXh6UEed%2BKPRtyWOHByhvALNWOwtr5NaAc9voqA6jsCFlvzcDVQ4QfqTVgQUNPDz6FC7zzYSwt%2FCRYs6V%2FBFfS%2FasQ%2Bo%2FDTcAnK9RpcvMpuG0FPQCf3RKMb1DBLwZlFIcWwPz87g2bVeo5Vq3nHaXfAjjT7b%2B3xOSdbYHEE%2FN0AGBXbtTo1JhU0%2BHIfZgzoCYisRad85mBNb11OcQl%2BrQdG2NkGnHMQNjIQiJJUpiHC6FfXCJ2LNFIOI3E3yRFcZtZE28jraz%2BVW6CoTsO%2FA1OAYBtq5opFgySlGEQbQ7MbUnmEtncBusPrxBHeud2g864fzCaYKQDBuX0GR7tpVTRk6v0USj%2B66hjsYqxQnNoiSrHDkERcIt3AbKtpQBEjBpRFVk%2FUAXMwmYTe1QY6pgEqhY%2FFxpY%2Bk6yWGG5Vp%2B0MC96SXX6N66xomW55y%2FSf%2F4AqmnT%2BzED5trjo7YbxLJrE3kzbjCEvhKjrGD%2Bw%2B6N47d7GV5VLTscL79DEIg2FdIJl2dpd7NeJcI6I%2BGFXLalJTuOGmWU%2BiKh6yQSYBAhAzmcnI9%2BDv%2FQs%2BSTpQUeUcrxRCkdo%2FWwpm%2B%2FqZLywjEtVESfpNyix9Dh4BMZ18BFwGLqVSewr&X-Amz-Signature=9a8fa37bfef35cad4d801a19a0b63a0ea1fd72e1238bf73d8e7b6120015272d2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
