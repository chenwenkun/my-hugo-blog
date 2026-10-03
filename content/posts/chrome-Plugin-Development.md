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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46665JC2OFK%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T104710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDlz%2BXy0E09We0ozfZIC56YcaLNsIB9MT%2Bfjg44CF6PdQIgaiL5RjVpk9gbGvrLZIfOQ5XcqHE2mNmhooFX%2BHPPTPQqiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDYiNeTg%2BnW3DlBzvCrcA%2BB0bLoicLQ12nHTfp0RT3yZZI1vNAu4Am8%2FOHdalnS3TMHI33vlxfuZnRRsbZ%2BAfFVv7gpJHbVjADezHOuumT9CxR%2B4v9Tc%2F4NihtXmoMfvv%2FRlwx1VoNYjwcPch3rNngQicUreoFvPjqaYk%2FLG1MhEBqOZi2WrpySYa6%2BIsXkvWdXjV08cBRmIN4uoUwdVZQJs%2FBYR29Pu8omtos04Gnc2iuwca5J6BdqzcjDWklW6gBzme85ycLHuQnT17R%2FvODpM%2FN81U3aKNJvo7jTDtmq3%2FFMY19UZw0fhtvz1bgHclL8GictOt7DLGk%2Bukk89Ef3%2FnXsNYB54pdmkfFXUNFmtNwvdN2zxhBGGFFRi%2B86uYa7pFBji9ye13r4GYLvlaHWL5oAqT8EcbzpMENUYejzpeVao8h0BSOEt%2FYUdsSEuNtaPtLk3ptWgjO5oCgCpUDtwHMzYcxuwwoMF2QmNX%2Fp2%2FPp8tCEdZK9sMLM417gkvVzuZK13%2BO8b4%2BHizD0jIVD%2FOe97OPAsY1PGJmjPb%2BTeXqj7ZM4Ojk7DFWszwAmaLrCj5ZyxU9KXyHAt58fXbCg1y2EIzWQU09MkIlCTU4CPymUbn%2BjloQhQUthShvhJNiM2llS5g9KvuW1OMNyzg9YGOqUBSA0qRAU7fSnAqAqqS8XQGUerPAnelzI2HwusGO4Kz4R%2FImrz22JsIJxwu3lhYP46%2BMolg7q9N%2BRIdJXckn7YC4iL%2BnW4tG6VeTybUN2YISmsDWtPYzx9wmuT10T%2B1HF8T6lCCkD7lMCRM2VdyaYLKAMQTT5wym3PkmsE6MJ9ZMf%2F%2BrWRZTsM3Rqt02ek3QypIsJw7koDaDH%2BUu4Eoqb9ajxdB6V1&X-Amz-Signature=d97c9c307a88cd600c89cd11748e24e0dcd8518bfa24051adb656bf7b00eb151&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46665JC2OFK%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T104711Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDlz%2BXy0E09We0ozfZIC56YcaLNsIB9MT%2Bfjg44CF6PdQIgaiL5RjVpk9gbGvrLZIfOQ5XcqHE2mNmhooFX%2BHPPTPQqiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDYiNeTg%2BnW3DlBzvCrcA%2BB0bLoicLQ12nHTfp0RT3yZZI1vNAu4Am8%2FOHdalnS3TMHI33vlxfuZnRRsbZ%2BAfFVv7gpJHbVjADezHOuumT9CxR%2B4v9Tc%2F4NihtXmoMfvv%2FRlwx1VoNYjwcPch3rNngQicUreoFvPjqaYk%2FLG1MhEBqOZi2WrpySYa6%2BIsXkvWdXjV08cBRmIN4uoUwdVZQJs%2FBYR29Pu8omtos04Gnc2iuwca5J6BdqzcjDWklW6gBzme85ycLHuQnT17R%2FvODpM%2FN81U3aKNJvo7jTDtmq3%2FFMY19UZw0fhtvz1bgHclL8GictOt7DLGk%2Bukk89Ef3%2FnXsNYB54pdmkfFXUNFmtNwvdN2zxhBGGFFRi%2B86uYa7pFBji9ye13r4GYLvlaHWL5oAqT8EcbzpMENUYejzpeVao8h0BSOEt%2FYUdsSEuNtaPtLk3ptWgjO5oCgCpUDtwHMzYcxuwwoMF2QmNX%2Fp2%2FPp8tCEdZK9sMLM417gkvVzuZK13%2BO8b4%2BHizD0jIVD%2FOe97OPAsY1PGJmjPb%2BTeXqj7ZM4Ojk7DFWszwAmaLrCj5ZyxU9KXyHAt58fXbCg1y2EIzWQU09MkIlCTU4CPymUbn%2BjloQhQUthShvhJNiM2llS5g9KvuW1OMNyzg9YGOqUBSA0qRAU7fSnAqAqqS8XQGUerPAnelzI2HwusGO4Kz4R%2FImrz22JsIJxwu3lhYP46%2BMolg7q9N%2BRIdJXckn7YC4iL%2BnW4tG6VeTybUN2YISmsDWtPYzx9wmuT10T%2B1HF8T6lCCkD7lMCRM2VdyaYLKAMQTT5wym3PkmsE6MJ9ZMf%2F%2BrWRZTsM3Rqt02ek3QypIsJw7koDaDH%2BUu4Eoqb9ajxdB6V1&X-Amz-Signature=a3d9539c94838d511050732b8544479fa15527a3c627e4a649f6d3eb750e030c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46665JC2OFK%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T104710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDlz%2BXy0E09We0ozfZIC56YcaLNsIB9MT%2Bfjg44CF6PdQIgaiL5RjVpk9gbGvrLZIfOQ5XcqHE2mNmhooFX%2BHPPTPQqiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDYiNeTg%2BnW3DlBzvCrcA%2BB0bLoicLQ12nHTfp0RT3yZZI1vNAu4Am8%2FOHdalnS3TMHI33vlxfuZnRRsbZ%2BAfFVv7gpJHbVjADezHOuumT9CxR%2B4v9Tc%2F4NihtXmoMfvv%2FRlwx1VoNYjwcPch3rNngQicUreoFvPjqaYk%2FLG1MhEBqOZi2WrpySYa6%2BIsXkvWdXjV08cBRmIN4uoUwdVZQJs%2FBYR29Pu8omtos04Gnc2iuwca5J6BdqzcjDWklW6gBzme85ycLHuQnT17R%2FvODpM%2FN81U3aKNJvo7jTDtmq3%2FFMY19UZw0fhtvz1bgHclL8GictOt7DLGk%2Bukk89Ef3%2FnXsNYB54pdmkfFXUNFmtNwvdN2zxhBGGFFRi%2B86uYa7pFBji9ye13r4GYLvlaHWL5oAqT8EcbzpMENUYejzpeVao8h0BSOEt%2FYUdsSEuNtaPtLk3ptWgjO5oCgCpUDtwHMzYcxuwwoMF2QmNX%2Fp2%2FPp8tCEdZK9sMLM417gkvVzuZK13%2BO8b4%2BHizD0jIVD%2FOe97OPAsY1PGJmjPb%2BTeXqj7ZM4Ojk7DFWszwAmaLrCj5ZyxU9KXyHAt58fXbCg1y2EIzWQU09MkIlCTU4CPymUbn%2BjloQhQUthShvhJNiM2llS5g9KvuW1OMNyzg9YGOqUBSA0qRAU7fSnAqAqqS8XQGUerPAnelzI2HwusGO4Kz4R%2FImrz22JsIJxwu3lhYP46%2BMolg7q9N%2BRIdJXckn7YC4iL%2BnW4tG6VeTybUN2YISmsDWtPYzx9wmuT10T%2B1HF8T6lCCkD7lMCRM2VdyaYLKAMQTT5wym3PkmsE6MJ9ZMf%2F%2BrWRZTsM3Rqt02ek3QypIsJw7koDaDH%2BUu4Eoqb9ajxdB6V1&X-Amz-Signature=425e227b1c2741472809792105da7e5c761fc774ab969eb38b522f3736bb2e21&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46665JC2OFK%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T104710Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDlz%2BXy0E09We0ozfZIC56YcaLNsIB9MT%2Bfjg44CF6PdQIgaiL5RjVpk9gbGvrLZIfOQ5XcqHE2mNmhooFX%2BHPPTPQqiAQIq%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDYiNeTg%2BnW3DlBzvCrcA%2BB0bLoicLQ12nHTfp0RT3yZZI1vNAu4Am8%2FOHdalnS3TMHI33vlxfuZnRRsbZ%2BAfFVv7gpJHbVjADezHOuumT9CxR%2B4v9Tc%2F4NihtXmoMfvv%2FRlwx1VoNYjwcPch3rNngQicUreoFvPjqaYk%2FLG1MhEBqOZi2WrpySYa6%2BIsXkvWdXjV08cBRmIN4uoUwdVZQJs%2FBYR29Pu8omtos04Gnc2iuwca5J6BdqzcjDWklW6gBzme85ycLHuQnT17R%2FvODpM%2FN81U3aKNJvo7jTDtmq3%2FFMY19UZw0fhtvz1bgHclL8GictOt7DLGk%2Bukk89Ef3%2FnXsNYB54pdmkfFXUNFmtNwvdN2zxhBGGFFRi%2B86uYa7pFBji9ye13r4GYLvlaHWL5oAqT8EcbzpMENUYejzpeVao8h0BSOEt%2FYUdsSEuNtaPtLk3ptWgjO5oCgCpUDtwHMzYcxuwwoMF2QmNX%2Fp2%2FPp8tCEdZK9sMLM417gkvVzuZK13%2BO8b4%2BHizD0jIVD%2FOe97OPAsY1PGJmjPb%2BTeXqj7ZM4Ojk7DFWszwAmaLrCj5ZyxU9KXyHAt58fXbCg1y2EIzWQU09MkIlCTU4CPymUbn%2BjloQhQUthShvhJNiM2llS5g9KvuW1OMNyzg9YGOqUBSA0qRAU7fSnAqAqqS8XQGUerPAnelzI2HwusGO4Kz4R%2FImrz22JsIJxwu3lhYP46%2BMolg7q9N%2BRIdJXckn7YC4iL%2BnW4tG6VeTybUN2YISmsDWtPYzx9wmuT10T%2B1HF8T6lCCkD7lMCRM2VdyaYLKAMQTT5wym3PkmsE6MJ9ZMf%2F%2BrWRZTsM3Rqt02ek3QypIsJw7koDaDH%2BUu4Eoqb9ajxdB6V1&X-Amz-Signature=3fe0df9f574073ba0b5a42a32fefc3faab76d5313a4c5b2ddc27e334a2b2a3f7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
