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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V44PY7MR%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T031118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAlXwwcXIWWdENQAXqDX4q9zeT4JDUs7c74cvlG8bguHAiEA6TjDKUxrvrUCm3iYPCJ2U0qvte2bPpYMtvhZVMQfQmwq%2FwMIexAAGgw2Mzc0MjMxODM4MDUiDH%2BFUYICyg4oTQTcOircAwlBmlkCLI7%2Fx%2FWuLGGP7C0nUfu4462STtskT9Ldssdd7pXc81IX5nu2UEhzVchMNRqLFvuw715mBkbLp9xn1qkQEdY51AwO0SxcvcjtK3uCHqgestSIqpmiWQ2Z3JWZ4AgBSQWEW501%2FLDltYbr%2Fx7PS3TC%2F%2F61jFt9xFRltBnx9Z3cJ9uAUmSoNoiKDC2WFHfR5XF2UiDtLKjRWQhc7pl%2F%2FtjzLaChRWZHDNRqOVcwb2bETM4zz%2FjpTah370tXAwEGNis67STMlUQlUj6GwYCvpKchTXp8GvhC8eWkvFkKvkwGARLt1ZNdczpPccic5o%2BqY7Rkw%2FtHf1r7eAJu8%2BBtRMjLLf6L%2BWn0lfavJ%2BHbjvgrNcNl3RlcE7RajQvf0hlafajMzPaadCpmerT2WpWNcOAi4eC0US1PvMxJnedyCA5ay3rsfJzG5Zti9WwZRmtQE7cs23yrS8CPyOHHnGvy%2BmWqaolmJ89CMqS7XpUVBVZX5KtuHO1iyYTftjCLr%2FiLfDevGTlMbCnreXnfjdaIrBUx5ZnuSxIRjUbdcmKzHsJ%2Fvnu5UYxektLZxZ9bgPeA%2ByTdnEbPQD6envz%2FsTT6UReJdDCK9GPCdWv2K3SAU1Xz5L65Uw2E4QFcMJSNsdYGOqUBHZIIsR91gdlOD0ej%2B7O1QrT8es0DFpHwN%2FgS8dsGkG9r2MQJ5FXcDOB6VZgaw9ryli1Dad1VglZlwf1sR6vdHRZy8QI2%2B%2B%2BRC13illI2ZBXNMjVSH6qInQ8lNt1hhsYJjHs2O%2BKCAlFr4cmMWHVnZYYoVfiz%2F5rclPisTpAaYP2Hg5PDbN3u0sEQPo8biP2IU%2B%2F81R5S5BJlw6U6Q40YZiwSiLUs&X-Amz-Signature=b2311431fab37eba8023fb6ecc990ee85c17d53ad4365baf5a64d27719e90c85&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V44PY7MR%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T031118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAlXwwcXIWWdENQAXqDX4q9zeT4JDUs7c74cvlG8bguHAiEA6TjDKUxrvrUCm3iYPCJ2U0qvte2bPpYMtvhZVMQfQmwq%2FwMIexAAGgw2Mzc0MjMxODM4MDUiDH%2BFUYICyg4oTQTcOircAwlBmlkCLI7%2Fx%2FWuLGGP7C0nUfu4462STtskT9Ldssdd7pXc81IX5nu2UEhzVchMNRqLFvuw715mBkbLp9xn1qkQEdY51AwO0SxcvcjtK3uCHqgestSIqpmiWQ2Z3JWZ4AgBSQWEW501%2FLDltYbr%2Fx7PS3TC%2F%2F61jFt9xFRltBnx9Z3cJ9uAUmSoNoiKDC2WFHfR5XF2UiDtLKjRWQhc7pl%2F%2FtjzLaChRWZHDNRqOVcwb2bETM4zz%2FjpTah370tXAwEGNis67STMlUQlUj6GwYCvpKchTXp8GvhC8eWkvFkKvkwGARLt1ZNdczpPccic5o%2BqY7Rkw%2FtHf1r7eAJu8%2BBtRMjLLf6L%2BWn0lfavJ%2BHbjvgrNcNl3RlcE7RajQvf0hlafajMzPaadCpmerT2WpWNcOAi4eC0US1PvMxJnedyCA5ay3rsfJzG5Zti9WwZRmtQE7cs23yrS8CPyOHHnGvy%2BmWqaolmJ89CMqS7XpUVBVZX5KtuHO1iyYTftjCLr%2FiLfDevGTlMbCnreXnfjdaIrBUx5ZnuSxIRjUbdcmKzHsJ%2Fvnu5UYxektLZxZ9bgPeA%2ByTdnEbPQD6envz%2FsTT6UReJdDCK9GPCdWv2K3SAU1Xz5L65Uw2E4QFcMJSNsdYGOqUBHZIIsR91gdlOD0ej%2B7O1QrT8es0DFpHwN%2FgS8dsGkG9r2MQJ5FXcDOB6VZgaw9ryli1Dad1VglZlwf1sR6vdHRZy8QI2%2B%2B%2BRC13illI2ZBXNMjVSH6qInQ8lNt1hhsYJjHs2O%2BKCAlFr4cmMWHVnZYYoVfiz%2F5rclPisTpAaYP2Hg5PDbN3u0sEQPo8biP2IU%2B%2F81R5S5BJlw6U6Q40YZiwSiLUs&X-Amz-Signature=182575995a2b58f315c32f0dd662ef397325bd262d64c80dde96c377021e2af0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V44PY7MR%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T031118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAlXwwcXIWWdENQAXqDX4q9zeT4JDUs7c74cvlG8bguHAiEA6TjDKUxrvrUCm3iYPCJ2U0qvte2bPpYMtvhZVMQfQmwq%2FwMIexAAGgw2Mzc0MjMxODM4MDUiDH%2BFUYICyg4oTQTcOircAwlBmlkCLI7%2Fx%2FWuLGGP7C0nUfu4462STtskT9Ldssdd7pXc81IX5nu2UEhzVchMNRqLFvuw715mBkbLp9xn1qkQEdY51AwO0SxcvcjtK3uCHqgestSIqpmiWQ2Z3JWZ4AgBSQWEW501%2FLDltYbr%2Fx7PS3TC%2F%2F61jFt9xFRltBnx9Z3cJ9uAUmSoNoiKDC2WFHfR5XF2UiDtLKjRWQhc7pl%2F%2FtjzLaChRWZHDNRqOVcwb2bETM4zz%2FjpTah370tXAwEGNis67STMlUQlUj6GwYCvpKchTXp8GvhC8eWkvFkKvkwGARLt1ZNdczpPccic5o%2BqY7Rkw%2FtHf1r7eAJu8%2BBtRMjLLf6L%2BWn0lfavJ%2BHbjvgrNcNl3RlcE7RajQvf0hlafajMzPaadCpmerT2WpWNcOAi4eC0US1PvMxJnedyCA5ay3rsfJzG5Zti9WwZRmtQE7cs23yrS8CPyOHHnGvy%2BmWqaolmJ89CMqS7XpUVBVZX5KtuHO1iyYTftjCLr%2FiLfDevGTlMbCnreXnfjdaIrBUx5ZnuSxIRjUbdcmKzHsJ%2Fvnu5UYxektLZxZ9bgPeA%2ByTdnEbPQD6envz%2FsTT6UReJdDCK9GPCdWv2K3SAU1Xz5L65Uw2E4QFcMJSNsdYGOqUBHZIIsR91gdlOD0ej%2B7O1QrT8es0DFpHwN%2FgS8dsGkG9r2MQJ5FXcDOB6VZgaw9ryli1Dad1VglZlwf1sR6vdHRZy8QI2%2B%2B%2BRC13illI2ZBXNMjVSH6qInQ8lNt1hhsYJjHs2O%2BKCAlFr4cmMWHVnZYYoVfiz%2F5rclPisTpAaYP2Hg5PDbN3u0sEQPo8biP2IU%2B%2F81R5S5BJlw6U6Q40YZiwSiLUs&X-Amz-Signature=90a7c5647b221dd8a7d636c82d1613aea6f723d73863aa7e4d725de30ece4f38&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V44PY7MR%2F20261012%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261012T031118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAlXwwcXIWWdENQAXqDX4q9zeT4JDUs7c74cvlG8bguHAiEA6TjDKUxrvrUCm3iYPCJ2U0qvte2bPpYMtvhZVMQfQmwq%2FwMIexAAGgw2Mzc0MjMxODM4MDUiDH%2BFUYICyg4oTQTcOircAwlBmlkCLI7%2Fx%2FWuLGGP7C0nUfu4462STtskT9Ldssdd7pXc81IX5nu2UEhzVchMNRqLFvuw715mBkbLp9xn1qkQEdY51AwO0SxcvcjtK3uCHqgestSIqpmiWQ2Z3JWZ4AgBSQWEW501%2FLDltYbr%2Fx7PS3TC%2F%2F61jFt9xFRltBnx9Z3cJ9uAUmSoNoiKDC2WFHfR5XF2UiDtLKjRWQhc7pl%2F%2FtjzLaChRWZHDNRqOVcwb2bETM4zz%2FjpTah370tXAwEGNis67STMlUQlUj6GwYCvpKchTXp8GvhC8eWkvFkKvkwGARLt1ZNdczpPccic5o%2BqY7Rkw%2FtHf1r7eAJu8%2BBtRMjLLf6L%2BWn0lfavJ%2BHbjvgrNcNl3RlcE7RajQvf0hlafajMzPaadCpmerT2WpWNcOAi4eC0US1PvMxJnedyCA5ay3rsfJzG5Zti9WwZRmtQE7cs23yrS8CPyOHHnGvy%2BmWqaolmJ89CMqS7XpUVBVZX5KtuHO1iyYTftjCLr%2FiLfDevGTlMbCnreXnfjdaIrBUx5ZnuSxIRjUbdcmKzHsJ%2Fvnu5UYxektLZxZ9bgPeA%2ByTdnEbPQD6envz%2FsTT6UReJdDCK9GPCdWv2K3SAU1Xz5L65Uw2E4QFcMJSNsdYGOqUBHZIIsR91gdlOD0ej%2B7O1QrT8es0DFpHwN%2FgS8dsGkG9r2MQJ5FXcDOB6VZgaw9ryli1Dad1VglZlwf1sR6vdHRZy8QI2%2B%2B%2BRC13illI2ZBXNMjVSH6qInQ8lNt1hhsYJjHs2O%2BKCAlFr4cmMWHVnZYYoVfiz%2F5rclPisTpAaYP2Hg5PDbN3u0sEQPo8biP2IU%2B%2F81R5S5BJlw6U6Q40YZiwSiLUs&X-Amz-Signature=314122c570b1421162c621a0b3482f865eb1d7b2f2aa996ca0beacc5e442247e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
