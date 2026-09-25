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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FY4M6ZS%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T205054Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJIMEYCIQDWhTh1DZ1%2FpCifzXwiCMHYGx%2BXPKW1iuWv5%2FIAdkmmogIhAPHxn9qHDTbE9ZSj4hlou6dAA%2BWBEmAwDkAOPcDc%2FFvaKogECPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxcjklBw0Kht9dIl%2FUq3APXYkJkG%2FDWwRCLK1p%2FmKka2J6P8UpFywra0uLntt0hPFNujnbEVp61TFpDC1IOnGKc82qoEVuVxJtcVysZfsQX3%2BQNzUheNIOdLz2CFBaF61n6Fh7VefK64yKfxJV7wWTrmyVHs5dpMuRYnY9VSvuKCOu18AwJFQQE5XGN4aFmcMx32KenBly91t5tOhCd%2FjvP40ITWRnT%2FWjjf6T%2Bst%2BRRIXyLy6zM2Om%2BAPf14WYt9GwWK3HBkuAU%2F6GHVM4WkxgdQ%2B66GtSuKM%2BReOs%2Bv0wmXp7EVwo8GNjtb8XhP0XOMFc3v%2FvlD6j1FTVuWxb5eoiwQUUtty7iHB2ohBmQv%2B5%2Bn3EpB8fH9TqCArhurBFu9%2B%2FzeFzg5t0Y%2BZIVSTyOGOOmM36yKdb1n1CyW%2FiQ%2BQkn4cv6SeyA1eMdflLfFgI02PjC909Va6nn4nOJ6lQYZ2Kz21uIgy%2BFU%2BMSWChoZ%2BKJ4fWVJCBCiqb9dzIiwASvv2G4N%2F1NSd4Pb5avs7vfdcqKWHcB6kPONvwaGdzCgd7E6rq%2FyzyDfvZChf6QNGqiapaTJGWQTNN%2FjocFD3C2JlfIGMI4kTyTmCxnFDMSKs%2BUN8309gr2UAfDzEjTLDM7mPigdo%2FkGHVJOkqzTCohdvVBjqkAdv0WgLpevRkxNqAY73h6Kq24iw7H0SasnIPQkkIMTR2r07%2FkySO%2FzDSiJ%2FHsMc0NHzMvwrgtQRqWm2eJ1b0Ph0sfLbxEyl4YE%2FJUfviFUoO21QsyUJ2u4Bzf7bWi2fCKUB4aDBh0CHsuaYLrddf%2B%2FJEHg2c8D0dU8lA%2F3c7YImxWE%2F6MuG%2FNXs9xd7%2BKvxYimb3S%2BW%2FTFY3wArHUvnmXx%2FF1n53&X-Amz-Signature=be983b3f50c433fb5961ee80f583a0e4205a31fe36b515fe8eede11b999c1460&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FY4M6ZS%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T205054Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJIMEYCIQDWhTh1DZ1%2FpCifzXwiCMHYGx%2BXPKW1iuWv5%2FIAdkmmogIhAPHxn9qHDTbE9ZSj4hlou6dAA%2BWBEmAwDkAOPcDc%2FFvaKogECPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxcjklBw0Kht9dIl%2FUq3APXYkJkG%2FDWwRCLK1p%2FmKka2J6P8UpFywra0uLntt0hPFNujnbEVp61TFpDC1IOnGKc82qoEVuVxJtcVysZfsQX3%2BQNzUheNIOdLz2CFBaF61n6Fh7VefK64yKfxJV7wWTrmyVHs5dpMuRYnY9VSvuKCOu18AwJFQQE5XGN4aFmcMx32KenBly91t5tOhCd%2FjvP40ITWRnT%2FWjjf6T%2Bst%2BRRIXyLy6zM2Om%2BAPf14WYt9GwWK3HBkuAU%2F6GHVM4WkxgdQ%2B66GtSuKM%2BReOs%2Bv0wmXp7EVwo8GNjtb8XhP0XOMFc3v%2FvlD6j1FTVuWxb5eoiwQUUtty7iHB2ohBmQv%2B5%2Bn3EpB8fH9TqCArhurBFu9%2B%2FzeFzg5t0Y%2BZIVSTyOGOOmM36yKdb1n1CyW%2FiQ%2BQkn4cv6SeyA1eMdflLfFgI02PjC909Va6nn4nOJ6lQYZ2Kz21uIgy%2BFU%2BMSWChoZ%2BKJ4fWVJCBCiqb9dzIiwASvv2G4N%2F1NSd4Pb5avs7vfdcqKWHcB6kPONvwaGdzCgd7E6rq%2FyzyDfvZChf6QNGqiapaTJGWQTNN%2FjocFD3C2JlfIGMI4kTyTmCxnFDMSKs%2BUN8309gr2UAfDzEjTLDM7mPigdo%2FkGHVJOkqzTCohdvVBjqkAdv0WgLpevRkxNqAY73h6Kq24iw7H0SasnIPQkkIMTR2r07%2FkySO%2FzDSiJ%2FHsMc0NHzMvwrgtQRqWm2eJ1b0Ph0sfLbxEyl4YE%2FJUfviFUoO21QsyUJ2u4Bzf7bWi2fCKUB4aDBh0CHsuaYLrddf%2B%2FJEHg2c8D0dU8lA%2F3c7YImxWE%2F6MuG%2FNXs9xd7%2BKvxYimb3S%2BW%2FTFY3wArHUvnmXx%2FF1n53&X-Amz-Signature=19813f16a0d483a2bdde750c8018f6136c263c6e624284c660a7630031010a3c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FY4M6ZS%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T205054Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJIMEYCIQDWhTh1DZ1%2FpCifzXwiCMHYGx%2BXPKW1iuWv5%2FIAdkmmogIhAPHxn9qHDTbE9ZSj4hlou6dAA%2BWBEmAwDkAOPcDc%2FFvaKogECPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxcjklBw0Kht9dIl%2FUq3APXYkJkG%2FDWwRCLK1p%2FmKka2J6P8UpFywra0uLntt0hPFNujnbEVp61TFpDC1IOnGKc82qoEVuVxJtcVysZfsQX3%2BQNzUheNIOdLz2CFBaF61n6Fh7VefK64yKfxJV7wWTrmyVHs5dpMuRYnY9VSvuKCOu18AwJFQQE5XGN4aFmcMx32KenBly91t5tOhCd%2FjvP40ITWRnT%2FWjjf6T%2Bst%2BRRIXyLy6zM2Om%2BAPf14WYt9GwWK3HBkuAU%2F6GHVM4WkxgdQ%2B66GtSuKM%2BReOs%2Bv0wmXp7EVwo8GNjtb8XhP0XOMFc3v%2FvlD6j1FTVuWxb5eoiwQUUtty7iHB2ohBmQv%2B5%2Bn3EpB8fH9TqCArhurBFu9%2B%2FzeFzg5t0Y%2BZIVSTyOGOOmM36yKdb1n1CyW%2FiQ%2BQkn4cv6SeyA1eMdflLfFgI02PjC909Va6nn4nOJ6lQYZ2Kz21uIgy%2BFU%2BMSWChoZ%2BKJ4fWVJCBCiqb9dzIiwASvv2G4N%2F1NSd4Pb5avs7vfdcqKWHcB6kPONvwaGdzCgd7E6rq%2FyzyDfvZChf6QNGqiapaTJGWQTNN%2FjocFD3C2JlfIGMI4kTyTmCxnFDMSKs%2BUN8309gr2UAfDzEjTLDM7mPigdo%2FkGHVJOkqzTCohdvVBjqkAdv0WgLpevRkxNqAY73h6Kq24iw7H0SasnIPQkkIMTR2r07%2FkySO%2FzDSiJ%2FHsMc0NHzMvwrgtQRqWm2eJ1b0Ph0sfLbxEyl4YE%2FJUfviFUoO21QsyUJ2u4Bzf7bWi2fCKUB4aDBh0CHsuaYLrddf%2B%2FJEHg2c8D0dU8lA%2F3c7YImxWE%2F6MuG%2FNXs9xd7%2BKvxYimb3S%2BW%2FTFY3wArHUvnmXx%2FF1n53&X-Amz-Signature=41132f705091b295cd18657d70a41b142bff7fc91c77b87dbeac99c459679ded&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663FY4M6ZS%2F20260925%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260925T205054Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJIMEYCIQDWhTh1DZ1%2FpCifzXwiCMHYGx%2BXPKW1iuWv5%2FIAdkmmogIhAPHxn9qHDTbE9ZSj4hlou6dAA%2BWBEmAwDkAOPcDc%2FFvaKogECPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxcjklBw0Kht9dIl%2FUq3APXYkJkG%2FDWwRCLK1p%2FmKka2J6P8UpFywra0uLntt0hPFNujnbEVp61TFpDC1IOnGKc82qoEVuVxJtcVysZfsQX3%2BQNzUheNIOdLz2CFBaF61n6Fh7VefK64yKfxJV7wWTrmyVHs5dpMuRYnY9VSvuKCOu18AwJFQQE5XGN4aFmcMx32KenBly91t5tOhCd%2FjvP40ITWRnT%2FWjjf6T%2Bst%2BRRIXyLy6zM2Om%2BAPf14WYt9GwWK3HBkuAU%2F6GHVM4WkxgdQ%2B66GtSuKM%2BReOs%2Bv0wmXp7EVwo8GNjtb8XhP0XOMFc3v%2FvlD6j1FTVuWxb5eoiwQUUtty7iHB2ohBmQv%2B5%2Bn3EpB8fH9TqCArhurBFu9%2B%2FzeFzg5t0Y%2BZIVSTyOGOOmM36yKdb1n1CyW%2FiQ%2BQkn4cv6SeyA1eMdflLfFgI02PjC909Va6nn4nOJ6lQYZ2Kz21uIgy%2BFU%2BMSWChoZ%2BKJ4fWVJCBCiqb9dzIiwASvv2G4N%2F1NSd4Pb5avs7vfdcqKWHcB6kPONvwaGdzCgd7E6rq%2FyzyDfvZChf6QNGqiapaTJGWQTNN%2FjocFD3C2JlfIGMI4kTyTmCxnFDMSKs%2BUN8309gr2UAfDzEjTLDM7mPigdo%2FkGHVJOkqzTCohdvVBjqkAdv0WgLpevRkxNqAY73h6Kq24iw7H0SasnIPQkkIMTR2r07%2FkySO%2FzDSiJ%2FHsMc0NHzMvwrgtQRqWm2eJ1b0Ph0sfLbxEyl4YE%2FJUfviFUoO21QsyUJ2u4Bzf7bWi2fCKUB4aDBh0CHsuaYLrddf%2B%2FJEHg2c8D0dU8lA%2F3c7YImxWE%2F6MuG%2FNXs9xd7%2BKvxYimb3S%2BW%2FTFY3wArHUvnmXx%2FF1n53&X-Amz-Signature=2b4e8bbefc5dca13aa5a879919f4163aed3b9904639bac45def1836df507e1bf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
