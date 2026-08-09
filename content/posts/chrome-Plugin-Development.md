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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QGPFD5XH%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T063634Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCXT3v01STwR3hP6UK6MrP0yXgk3JKgr9qHux5v0CTnDwIgX5P%2F0Fu5E6zJ6NVf6HdSAmhqKvxGmx8yaaARkjXSd%2Fsq%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDDRqvKaEg3yNF0%2FeKCrcA9pCRbpG%2BS0cFfpdDw0Dsg4GMWBy3p7oPJVfS5ReX%2B7zMEnSrkP1KBWeSbOde%2BwK0wBMgFp071ipuopkXmXbdV41EfBtOiYXDpfab%2BCqwReDY1KcsYD50HVEJsnen%2FIERoq0ia9Vdv8cVtAKYRWG0IL53P19L8lDAmE1jT7fUHUXSkEhg9dIf3MH068jZIlL5m6rr7%2B5rc9MCCCzLBqZueQHz1uBxXtHNiiaG2ng3wFR%2F5ItiJBUtKYwY6yS2sPSVDtGgcc%2BaR3pl004kSf%2B%2BzIQPQnZcJAHvjLQPuFgIg8Hmc7K51nT%2F%2F8XjLksI32l47e9B60AEN8cQCNxbdca5E5CCAPp1J0Cnbej2x7Vwdhoph9qv2YNWEms3F38LZhawfrwYBCSBWtMTIuYm%2BNrMsvTZs6zyVzzcFMykQfNzpD53laKSv3hdaQP5s4smUhwIwMvbAcgB%2Ba9Im6Xwvz%2F7ssPYENsZO0F2AEwN5uP8gNt%2FspCIOTJ4a%2Byg%2B5hddU7lmtpxQXwep88XALPH%2F6M8uoJDjJ4DObweje4FYtuE2X%2BKwrxcIKVJxt1zsXwj4b4tcrmZlIWk3i2NzeWR%2BgCwHSjRD%2FF%2FCgUJRp4%2F5AzJMwX2jNMHv5JAgWDyi25MLv439MGOqUBNpcD9pSoIp6Bs4KmXVKg77H%2BLrU0PJwoM%2FfGQ8omSB5SJEd8Au5oZUkimNNVolLRXNUfHM6eZacpHEcXDJyCvLkJwEhVs0X6bjCEkmXDcKn%2BYPssJaT4ZFuhnOHpB2%2Bs5bX1Exu4LfTro26%2BcmlrbFiqHGWhTfXz7coz6M5ar1S3T9hm7fFSk3LACMCGaQnHpum%2Fq51n95oYpgg%2F8NJW4FpFa0y8&X-Amz-Signature=ba78597679ef0a7ddeeef9cc2c66a958ed43094abcfa98c59f05d3ad9156ec2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QGPFD5XH%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T063634Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCXT3v01STwR3hP6UK6MrP0yXgk3JKgr9qHux5v0CTnDwIgX5P%2F0Fu5E6zJ6NVf6HdSAmhqKvxGmx8yaaARkjXSd%2Fsq%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDDRqvKaEg3yNF0%2FeKCrcA9pCRbpG%2BS0cFfpdDw0Dsg4GMWBy3p7oPJVfS5ReX%2B7zMEnSrkP1KBWeSbOde%2BwK0wBMgFp071ipuopkXmXbdV41EfBtOiYXDpfab%2BCqwReDY1KcsYD50HVEJsnen%2FIERoq0ia9Vdv8cVtAKYRWG0IL53P19L8lDAmE1jT7fUHUXSkEhg9dIf3MH068jZIlL5m6rr7%2B5rc9MCCCzLBqZueQHz1uBxXtHNiiaG2ng3wFR%2F5ItiJBUtKYwY6yS2sPSVDtGgcc%2BaR3pl004kSf%2B%2BzIQPQnZcJAHvjLQPuFgIg8Hmc7K51nT%2F%2F8XjLksI32l47e9B60AEN8cQCNxbdca5E5CCAPp1J0Cnbej2x7Vwdhoph9qv2YNWEms3F38LZhawfrwYBCSBWtMTIuYm%2BNrMsvTZs6zyVzzcFMykQfNzpD53laKSv3hdaQP5s4smUhwIwMvbAcgB%2Ba9Im6Xwvz%2F7ssPYENsZO0F2AEwN5uP8gNt%2FspCIOTJ4a%2Byg%2B5hddU7lmtpxQXwep88XALPH%2F6M8uoJDjJ4DObweje4FYtuE2X%2BKwrxcIKVJxt1zsXwj4b4tcrmZlIWk3i2NzeWR%2BgCwHSjRD%2FF%2FCgUJRp4%2F5AzJMwX2jNMHv5JAgWDyi25MLv439MGOqUBNpcD9pSoIp6Bs4KmXVKg77H%2BLrU0PJwoM%2FfGQ8omSB5SJEd8Au5oZUkimNNVolLRXNUfHM6eZacpHEcXDJyCvLkJwEhVs0X6bjCEkmXDcKn%2BYPssJaT4ZFuhnOHpB2%2Bs5bX1Exu4LfTro26%2BcmlrbFiqHGWhTfXz7coz6M5ar1S3T9hm7fFSk3LACMCGaQnHpum%2Fq51n95oYpgg%2F8NJW4FpFa0y8&X-Amz-Signature=77e2e6d6afdeb0673c8a1857f52ca852ffd2f4033edc1d932431ecf2fd0aa2bb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QGPFD5XH%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T063634Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCXT3v01STwR3hP6UK6MrP0yXgk3JKgr9qHux5v0CTnDwIgX5P%2F0Fu5E6zJ6NVf6HdSAmhqKvxGmx8yaaARkjXSd%2Fsq%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDDRqvKaEg3yNF0%2FeKCrcA9pCRbpG%2BS0cFfpdDw0Dsg4GMWBy3p7oPJVfS5ReX%2B7zMEnSrkP1KBWeSbOde%2BwK0wBMgFp071ipuopkXmXbdV41EfBtOiYXDpfab%2BCqwReDY1KcsYD50HVEJsnen%2FIERoq0ia9Vdv8cVtAKYRWG0IL53P19L8lDAmE1jT7fUHUXSkEhg9dIf3MH068jZIlL5m6rr7%2B5rc9MCCCzLBqZueQHz1uBxXtHNiiaG2ng3wFR%2F5ItiJBUtKYwY6yS2sPSVDtGgcc%2BaR3pl004kSf%2B%2BzIQPQnZcJAHvjLQPuFgIg8Hmc7K51nT%2F%2F8XjLksI32l47e9B60AEN8cQCNxbdca5E5CCAPp1J0Cnbej2x7Vwdhoph9qv2YNWEms3F38LZhawfrwYBCSBWtMTIuYm%2BNrMsvTZs6zyVzzcFMykQfNzpD53laKSv3hdaQP5s4smUhwIwMvbAcgB%2Ba9Im6Xwvz%2F7ssPYENsZO0F2AEwN5uP8gNt%2FspCIOTJ4a%2Byg%2B5hddU7lmtpxQXwep88XALPH%2F6M8uoJDjJ4DObweje4FYtuE2X%2BKwrxcIKVJxt1zsXwj4b4tcrmZlIWk3i2NzeWR%2BgCwHSjRD%2FF%2FCgUJRp4%2F5AzJMwX2jNMHv5JAgWDyi25MLv439MGOqUBNpcD9pSoIp6Bs4KmXVKg77H%2BLrU0PJwoM%2FfGQ8omSB5SJEd8Au5oZUkimNNVolLRXNUfHM6eZacpHEcXDJyCvLkJwEhVs0X6bjCEkmXDcKn%2BYPssJaT4ZFuhnOHpB2%2Bs5bX1Exu4LfTro26%2BcmlrbFiqHGWhTfXz7coz6M5ar1S3T9hm7fFSk3LACMCGaQnHpum%2Fq51n95oYpgg%2F8NJW4FpFa0y8&X-Amz-Signature=4242b580c4db2975099e892a68f0932630cb9f65b9c72ee32244c63ec4943276&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QGPFD5XH%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T063634Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCXT3v01STwR3hP6UK6MrP0yXgk3JKgr9qHux5v0CTnDwIgX5P%2F0Fu5E6zJ6NVf6HdSAmhqKvxGmx8yaaARkjXSd%2Fsq%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDDRqvKaEg3yNF0%2FeKCrcA9pCRbpG%2BS0cFfpdDw0Dsg4GMWBy3p7oPJVfS5ReX%2B7zMEnSrkP1KBWeSbOde%2BwK0wBMgFp071ipuopkXmXbdV41EfBtOiYXDpfab%2BCqwReDY1KcsYD50HVEJsnen%2FIERoq0ia9Vdv8cVtAKYRWG0IL53P19L8lDAmE1jT7fUHUXSkEhg9dIf3MH068jZIlL5m6rr7%2B5rc9MCCCzLBqZueQHz1uBxXtHNiiaG2ng3wFR%2F5ItiJBUtKYwY6yS2sPSVDtGgcc%2BaR3pl004kSf%2B%2BzIQPQnZcJAHvjLQPuFgIg8Hmc7K51nT%2F%2F8XjLksI32l47e9B60AEN8cQCNxbdca5E5CCAPp1J0Cnbej2x7Vwdhoph9qv2YNWEms3F38LZhawfrwYBCSBWtMTIuYm%2BNrMsvTZs6zyVzzcFMykQfNzpD53laKSv3hdaQP5s4smUhwIwMvbAcgB%2Ba9Im6Xwvz%2F7ssPYENsZO0F2AEwN5uP8gNt%2FspCIOTJ4a%2Byg%2B5hddU7lmtpxQXwep88XALPH%2F6M8uoJDjJ4DObweje4FYtuE2X%2BKwrxcIKVJxt1zsXwj4b4tcrmZlIWk3i2NzeWR%2BgCwHSjRD%2FF%2FCgUJRp4%2F5AzJMwX2jNMHv5JAgWDyi25MLv439MGOqUBNpcD9pSoIp6Bs4KmXVKg77H%2BLrU0PJwoM%2FfGQ8omSB5SJEd8Au5oZUkimNNVolLRXNUfHM6eZacpHEcXDJyCvLkJwEhVs0X6bjCEkmXDcKn%2BYPssJaT4ZFuhnOHpB2%2Bs5bX1Exu4LfTro26%2BcmlrbFiqHGWhTfXz7coz6M5ar1S3T9hm7fFSk3LACMCGaQnHpum%2Fq51n95oYpgg%2F8NJW4FpFa0y8&X-Amz-Signature=eeebc337d1dd70c3251e286384fd8d3b96deff141049a8c3acbf36de2ae2d395&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
