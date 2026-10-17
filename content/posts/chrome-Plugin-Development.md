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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666K6RAEBD%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T143644Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCIDrz6dUT2W%2BYrTVQC%2FroohS9q3H1V2Jch1YcSii8k4khAiEAiRiresoDdgAiCjgM5O5MuS1mfVmVyYCujrSZf5%2B2rC8qiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKfltLna8sa7BHTExSrcA78a4q4XvUVbz7gQmDXL2HR2AJCCmzUzv%2FwOhsu8HLtiWAX4yARGd78r%2FbtIuEL8EhuU4LwUyq050hYpe9aGdBrWz7ueywyXdrDLqrfZcViCTKxK6XJecUhxHDDat2jILz5d6Vdzcc%2BP%2FvZU%2FHmZXukvuXU0827nKVJIMoLPnjf%2F%2BUPXP7LZXAbxXhXRx62kYQz1kEY6A1LE09hgczlflTAs4a3kvjvZlAqrAEivTd%2F0ZnyoOxbYDkcl07P3%2BVMAJNhnomi9uZLk3tEU%2FuhScyLujKzF9UAzQQRgpwVfYxVF9ajWfbXITs%2F868EkorL7zLNPoBxYW4C%2BROxIy5P%2FAQDXGnDwNfsDWDITD5BwZa9cujE%2B4%2B8wuIV%2FNw2aBkyFqDeFntUIuhcup5I%2B7Zl5aDmtw1NTVLbRVJGyPaVDglEEdMIu4veys8ofiNKUV1L5jOb9RqdGfZwyaqXBuGw8r%2FVnwBS7r%2Folp7otCGRrzMgp44e%2FWEDTkpRwVw%2FA6OHnYKOtvxbDH85%2FBOAsYG%2BeWeGt0zch61xtUupBLs2jiwQiwES1TX7dENuiLMwZ%2FeXTt6j%2F2uxqCoEDB6wdpXyvS0vQ9tSlEdGiYve4G0LMFvLXVa798GgazR26SKyfMMnyzdYGOqUBuoh12M4mNf0FbEe9a9NnoaTSpMIshPbVpg1L4LHW%2FLy8fNQvDKA6t3h3gChwEWaHURRwybotbOyELjphCI9xZ7cxI4cTqBG6KvfpfqY%2FB6Sm12e15ehs%2FLDECsCNT4vx9%2F20ZVc6kkiHZ1FBFdUm%2Fx2FSpuXKJWw02GxcB9BsGdr8KtNlqZpaRSCjF2opsNzTy%2Fk01JTziwH4IY6%2BAHLtp4dBM2b&X-Amz-Signature=67fe99f3596142ecce1f3bb74b6c008eb058ab9d28842e652172e277bec376de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666K6RAEBD%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T143644Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCIDrz6dUT2W%2BYrTVQC%2FroohS9q3H1V2Jch1YcSii8k4khAiEAiRiresoDdgAiCjgM5O5MuS1mfVmVyYCujrSZf5%2B2rC8qiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKfltLna8sa7BHTExSrcA78a4q4XvUVbz7gQmDXL2HR2AJCCmzUzv%2FwOhsu8HLtiWAX4yARGd78r%2FbtIuEL8EhuU4LwUyq050hYpe9aGdBrWz7ueywyXdrDLqrfZcViCTKxK6XJecUhxHDDat2jILz5d6Vdzcc%2BP%2FvZU%2FHmZXukvuXU0827nKVJIMoLPnjf%2F%2BUPXP7LZXAbxXhXRx62kYQz1kEY6A1LE09hgczlflTAs4a3kvjvZlAqrAEivTd%2F0ZnyoOxbYDkcl07P3%2BVMAJNhnomi9uZLk3tEU%2FuhScyLujKzF9UAzQQRgpwVfYxVF9ajWfbXITs%2F868EkorL7zLNPoBxYW4C%2BROxIy5P%2FAQDXGnDwNfsDWDITD5BwZa9cujE%2B4%2B8wuIV%2FNw2aBkyFqDeFntUIuhcup5I%2B7Zl5aDmtw1NTVLbRVJGyPaVDglEEdMIu4veys8ofiNKUV1L5jOb9RqdGfZwyaqXBuGw8r%2FVnwBS7r%2Folp7otCGRrzMgp44e%2FWEDTkpRwVw%2FA6OHnYKOtvxbDH85%2FBOAsYG%2BeWeGt0zch61xtUupBLs2jiwQiwES1TX7dENuiLMwZ%2FeXTt6j%2F2uxqCoEDB6wdpXyvS0vQ9tSlEdGiYve4G0LMFvLXVa798GgazR26SKyfMMnyzdYGOqUBuoh12M4mNf0FbEe9a9NnoaTSpMIshPbVpg1L4LHW%2FLy8fNQvDKA6t3h3gChwEWaHURRwybotbOyELjphCI9xZ7cxI4cTqBG6KvfpfqY%2FB6Sm12e15ehs%2FLDECsCNT4vx9%2F20ZVc6kkiHZ1FBFdUm%2Fx2FSpuXKJWw02GxcB9BsGdr8KtNlqZpaRSCjF2opsNzTy%2Fk01JTziwH4IY6%2BAHLtp4dBM2b&X-Amz-Signature=a727a59376bbba6acc8ec5b17e516827260064bff6912e1179afc8f2ba1b7f85&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666K6RAEBD%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T143644Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCIDrz6dUT2W%2BYrTVQC%2FroohS9q3H1V2Jch1YcSii8k4khAiEAiRiresoDdgAiCjgM5O5MuS1mfVmVyYCujrSZf5%2B2rC8qiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKfltLna8sa7BHTExSrcA78a4q4XvUVbz7gQmDXL2HR2AJCCmzUzv%2FwOhsu8HLtiWAX4yARGd78r%2FbtIuEL8EhuU4LwUyq050hYpe9aGdBrWz7ueywyXdrDLqrfZcViCTKxK6XJecUhxHDDat2jILz5d6Vdzcc%2BP%2FvZU%2FHmZXukvuXU0827nKVJIMoLPnjf%2F%2BUPXP7LZXAbxXhXRx62kYQz1kEY6A1LE09hgczlflTAs4a3kvjvZlAqrAEivTd%2F0ZnyoOxbYDkcl07P3%2BVMAJNhnomi9uZLk3tEU%2FuhScyLujKzF9UAzQQRgpwVfYxVF9ajWfbXITs%2F868EkorL7zLNPoBxYW4C%2BROxIy5P%2FAQDXGnDwNfsDWDITD5BwZa9cujE%2B4%2B8wuIV%2FNw2aBkyFqDeFntUIuhcup5I%2B7Zl5aDmtw1NTVLbRVJGyPaVDglEEdMIu4veys8ofiNKUV1L5jOb9RqdGfZwyaqXBuGw8r%2FVnwBS7r%2Folp7otCGRrzMgp44e%2FWEDTkpRwVw%2FA6OHnYKOtvxbDH85%2FBOAsYG%2BeWeGt0zch61xtUupBLs2jiwQiwES1TX7dENuiLMwZ%2FeXTt6j%2F2uxqCoEDB6wdpXyvS0vQ9tSlEdGiYve4G0LMFvLXVa798GgazR26SKyfMMnyzdYGOqUBuoh12M4mNf0FbEe9a9NnoaTSpMIshPbVpg1L4LHW%2FLy8fNQvDKA6t3h3gChwEWaHURRwybotbOyELjphCI9xZ7cxI4cTqBG6KvfpfqY%2FB6Sm12e15ehs%2FLDECsCNT4vx9%2F20ZVc6kkiHZ1FBFdUm%2Fx2FSpuXKJWw02GxcB9BsGdr8KtNlqZpaRSCjF2opsNzTy%2Fk01JTziwH4IY6%2BAHLtp4dBM2b&X-Amz-Signature=3e141b74609821144a77cb33b54c8337a5f6e9c9e56b83de35d4794c0f87a7bd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666K6RAEBD%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T143644Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDYaCXVzLXdlc3QtMiJHMEUCIDrz6dUT2W%2BYrTVQC%2FroohS9q3H1V2Jch1YcSii8k4khAiEAiRiresoDdgAiCjgM5O5MuS1mfVmVyYCujrSZf5%2B2rC8qiAQI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKfltLna8sa7BHTExSrcA78a4q4XvUVbz7gQmDXL2HR2AJCCmzUzv%2FwOhsu8HLtiWAX4yARGd78r%2FbtIuEL8EhuU4LwUyq050hYpe9aGdBrWz7ueywyXdrDLqrfZcViCTKxK6XJecUhxHDDat2jILz5d6Vdzcc%2BP%2FvZU%2FHmZXukvuXU0827nKVJIMoLPnjf%2F%2BUPXP7LZXAbxXhXRx62kYQz1kEY6A1LE09hgczlflTAs4a3kvjvZlAqrAEivTd%2F0ZnyoOxbYDkcl07P3%2BVMAJNhnomi9uZLk3tEU%2FuhScyLujKzF9UAzQQRgpwVfYxVF9ajWfbXITs%2F868EkorL7zLNPoBxYW4C%2BROxIy5P%2FAQDXGnDwNfsDWDITD5BwZa9cujE%2B4%2B8wuIV%2FNw2aBkyFqDeFntUIuhcup5I%2B7Zl5aDmtw1NTVLbRVJGyPaVDglEEdMIu4veys8ofiNKUV1L5jOb9RqdGfZwyaqXBuGw8r%2FVnwBS7r%2Folp7otCGRrzMgp44e%2FWEDTkpRwVw%2FA6OHnYKOtvxbDH85%2FBOAsYG%2BeWeGt0zch61xtUupBLs2jiwQiwES1TX7dENuiLMwZ%2FeXTt6j%2F2uxqCoEDB6wdpXyvS0vQ9tSlEdGiYve4G0LMFvLXVa798GgazR26SKyfMMnyzdYGOqUBuoh12M4mNf0FbEe9a9NnoaTSpMIshPbVpg1L4LHW%2FLy8fNQvDKA6t3h3gChwEWaHURRwybotbOyELjphCI9xZ7cxI4cTqBG6KvfpfqY%2FB6Sm12e15ehs%2FLDECsCNT4vx9%2F20ZVc6kkiHZ1FBFdUm%2Fx2FSpuXKJWw02GxcB9BsGdr8KtNlqZpaRSCjF2opsNzTy%2Fk01JTziwH4IY6%2BAHLtp4dBM2b&X-Amz-Signature=8bdde1f32922f32b2fa71996422b8294c6b5c3973f11956c485a682275c64c85&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
