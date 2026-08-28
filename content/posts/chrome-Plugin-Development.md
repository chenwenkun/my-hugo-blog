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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664KBWES4E%2F20260828%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260828T175136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEnmxFAQWJ3k3GRqkJ2K5jvv3baIPbzJ4nUeDOsT3bRxAiEA8X04CTt8pn3FQVIa%2F%2BgDsOVZ9j59wRoYnd4QK6z0wzgq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDHzOuT%2B%2Fyjcw%2FpSW2SrcAyv19ECNz0JFrEOMvqo04WMeSh2A7jDOnXphIJlSi6nBBcIx54rtp1sxgRj01lGvazlw1X5%2BR4ObPwZO6pkZK%2FKgTtAyFd0P9TYEhIQhpGvIyHQZuJsUTn1%2BgPu2Lc3YeOgmN0zUW14cN8lFh94mpugroDVq11gerw3bGOcYcHhpXgdRrAYbXTsCpr5V7TPrE4YNMlimXloUwz24oQdEYuGhK3gx1fXbpeHxcO6K7piqqH9YAnyuB6dt7%2BNAPLgfgiPxdNPRcLn2Ba7tdsLuiIfcfNajEWh4YjFbXyImjI%2FgLU7y%2F2XOOWiNEm3Rl%2B7zq0ExGq9%2Fb%2BvnY7acqHm%2BATqZBPOredwMA%2FxdGF%2BbbQFRvZKNqU4dqMnGx0oUIMEIp%2FaucJ2Im94KYgralRAFzBbdyKTUYj%2BfrF4aoPFdfC9w9hjxGx1Vn2Ag%2F8MWtXkzMB0sl1NU0rXXJUixtcbq3a3r5ZBgFUhu%2F9UvMeTZs2qRTtxohpshp1G%2BNnfcdEsuqy7Cwgv22bBhlSI7moQ0SpIQlIaHa43ppSzUK1V%2BFqVK8qCJcQK2UQS%2BsXTpXt6Q145hDxHWrltBAJ6ZqKzIlVpYuzDY6qHSafMzU6S2Dx1VbDClNRoNVTizXhkxMLbpxtQGOqUB%2FPiIrfFCoATPMjn7P6GMP10LaiECZpg3NlkJgA6caqSDxyMn%2FqtyXC02Yz%2Bu3UoVPQ%2FcAyIdGU0gs9t%2BYrNN2%2FYBra63EYHIPKAnsXFbjdZkqb5GR8p8r69v7%2FQtdSBuKjT7Tcgsj%2B%2Fhebb7tHgalZlclN0eJazLmFbsfifx50X6nFTwTmEHgrQW%2BTqpNpbCLxEbaAFtVHGHtdyd7fJJ%2BTM0oRPF&X-Amz-Signature=639c1da3ece456e6f527142dcd981ce32eb8abff3c5370fadb2cf5d35fb747fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664KBWES4E%2F20260828%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260828T175136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEnmxFAQWJ3k3GRqkJ2K5jvv3baIPbzJ4nUeDOsT3bRxAiEA8X04CTt8pn3FQVIa%2F%2BgDsOVZ9j59wRoYnd4QK6z0wzgq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDHzOuT%2B%2Fyjcw%2FpSW2SrcAyv19ECNz0JFrEOMvqo04WMeSh2A7jDOnXphIJlSi6nBBcIx54rtp1sxgRj01lGvazlw1X5%2BR4ObPwZO6pkZK%2FKgTtAyFd0P9TYEhIQhpGvIyHQZuJsUTn1%2BgPu2Lc3YeOgmN0zUW14cN8lFh94mpugroDVq11gerw3bGOcYcHhpXgdRrAYbXTsCpr5V7TPrE4YNMlimXloUwz24oQdEYuGhK3gx1fXbpeHxcO6K7piqqH9YAnyuB6dt7%2BNAPLgfgiPxdNPRcLn2Ba7tdsLuiIfcfNajEWh4YjFbXyImjI%2FgLU7y%2F2XOOWiNEm3Rl%2B7zq0ExGq9%2Fb%2BvnY7acqHm%2BATqZBPOredwMA%2FxdGF%2BbbQFRvZKNqU4dqMnGx0oUIMEIp%2FaucJ2Im94KYgralRAFzBbdyKTUYj%2BfrF4aoPFdfC9w9hjxGx1Vn2Ag%2F8MWtXkzMB0sl1NU0rXXJUixtcbq3a3r5ZBgFUhu%2F9UvMeTZs2qRTtxohpshp1G%2BNnfcdEsuqy7Cwgv22bBhlSI7moQ0SpIQlIaHa43ppSzUK1V%2BFqVK8qCJcQK2UQS%2BsXTpXt6Q145hDxHWrltBAJ6ZqKzIlVpYuzDY6qHSafMzU6S2Dx1VbDClNRoNVTizXhkxMLbpxtQGOqUB%2FPiIrfFCoATPMjn7P6GMP10LaiECZpg3NlkJgA6caqSDxyMn%2FqtyXC02Yz%2Bu3UoVPQ%2FcAyIdGU0gs9t%2BYrNN2%2FYBra63EYHIPKAnsXFbjdZkqb5GR8p8r69v7%2FQtdSBuKjT7Tcgsj%2B%2Fhebb7tHgalZlclN0eJazLmFbsfifx50X6nFTwTmEHgrQW%2BTqpNpbCLxEbaAFtVHGHtdyd7fJJ%2BTM0oRPF&X-Amz-Signature=b7bc9449b1c0c06e9cb1a87e907aa16cbfb1e58511a111616d76edb0366bb11f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664KBWES4E%2F20260828%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260828T175136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEnmxFAQWJ3k3GRqkJ2K5jvv3baIPbzJ4nUeDOsT3bRxAiEA8X04CTt8pn3FQVIa%2F%2BgDsOVZ9j59wRoYnd4QK6z0wzgq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDHzOuT%2B%2Fyjcw%2FpSW2SrcAyv19ECNz0JFrEOMvqo04WMeSh2A7jDOnXphIJlSi6nBBcIx54rtp1sxgRj01lGvazlw1X5%2BR4ObPwZO6pkZK%2FKgTtAyFd0P9TYEhIQhpGvIyHQZuJsUTn1%2BgPu2Lc3YeOgmN0zUW14cN8lFh94mpugroDVq11gerw3bGOcYcHhpXgdRrAYbXTsCpr5V7TPrE4YNMlimXloUwz24oQdEYuGhK3gx1fXbpeHxcO6K7piqqH9YAnyuB6dt7%2BNAPLgfgiPxdNPRcLn2Ba7tdsLuiIfcfNajEWh4YjFbXyImjI%2FgLU7y%2F2XOOWiNEm3Rl%2B7zq0ExGq9%2Fb%2BvnY7acqHm%2BATqZBPOredwMA%2FxdGF%2BbbQFRvZKNqU4dqMnGx0oUIMEIp%2FaucJ2Im94KYgralRAFzBbdyKTUYj%2BfrF4aoPFdfC9w9hjxGx1Vn2Ag%2F8MWtXkzMB0sl1NU0rXXJUixtcbq3a3r5ZBgFUhu%2F9UvMeTZs2qRTtxohpshp1G%2BNnfcdEsuqy7Cwgv22bBhlSI7moQ0SpIQlIaHa43ppSzUK1V%2BFqVK8qCJcQK2UQS%2BsXTpXt6Q145hDxHWrltBAJ6ZqKzIlVpYuzDY6qHSafMzU6S2Dx1VbDClNRoNVTizXhkxMLbpxtQGOqUB%2FPiIrfFCoATPMjn7P6GMP10LaiECZpg3NlkJgA6caqSDxyMn%2FqtyXC02Yz%2Bu3UoVPQ%2FcAyIdGU0gs9t%2BYrNN2%2FYBra63EYHIPKAnsXFbjdZkqb5GR8p8r69v7%2FQtdSBuKjT7Tcgsj%2B%2Fhebb7tHgalZlclN0eJazLmFbsfifx50X6nFTwTmEHgrQW%2BTqpNpbCLxEbaAFtVHGHtdyd7fJJ%2BTM0oRPF&X-Amz-Signature=01b153814904f0833a2930ba9b68a5c562048a06d67af35b19c2cac3f20f7f3e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664KBWES4E%2F20260828%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260828T175136Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEnmxFAQWJ3k3GRqkJ2K5jvv3baIPbzJ4nUeDOsT3bRxAiEA8X04CTt8pn3FQVIa%2F%2BgDsOVZ9j59wRoYnd4QK6z0wzgq%2FwMIURAAGgw2Mzc0MjMxODM4MDUiDHzOuT%2B%2Fyjcw%2FpSW2SrcAyv19ECNz0JFrEOMvqo04WMeSh2A7jDOnXphIJlSi6nBBcIx54rtp1sxgRj01lGvazlw1X5%2BR4ObPwZO6pkZK%2FKgTtAyFd0P9TYEhIQhpGvIyHQZuJsUTn1%2BgPu2Lc3YeOgmN0zUW14cN8lFh94mpugroDVq11gerw3bGOcYcHhpXgdRrAYbXTsCpr5V7TPrE4YNMlimXloUwz24oQdEYuGhK3gx1fXbpeHxcO6K7piqqH9YAnyuB6dt7%2BNAPLgfgiPxdNPRcLn2Ba7tdsLuiIfcfNajEWh4YjFbXyImjI%2FgLU7y%2F2XOOWiNEm3Rl%2B7zq0ExGq9%2Fb%2BvnY7acqHm%2BATqZBPOredwMA%2FxdGF%2BbbQFRvZKNqU4dqMnGx0oUIMEIp%2FaucJ2Im94KYgralRAFzBbdyKTUYj%2BfrF4aoPFdfC9w9hjxGx1Vn2Ag%2F8MWtXkzMB0sl1NU0rXXJUixtcbq3a3r5ZBgFUhu%2F9UvMeTZs2qRTtxohpshp1G%2BNnfcdEsuqy7Cwgv22bBhlSI7moQ0SpIQlIaHa43ppSzUK1V%2BFqVK8qCJcQK2UQS%2BsXTpXt6Q145hDxHWrltBAJ6ZqKzIlVpYuzDY6qHSafMzU6S2Dx1VbDClNRoNVTizXhkxMLbpxtQGOqUB%2FPiIrfFCoATPMjn7P6GMP10LaiECZpg3NlkJgA6caqSDxyMn%2FqtyXC02Yz%2Bu3UoVPQ%2FcAyIdGU0gs9t%2BYrNN2%2FYBra63EYHIPKAnsXFbjdZkqb5GR8p8r69v7%2FQtdSBuKjT7Tcgsj%2B%2Fhebb7tHgalZlclN0eJazLmFbsfifx50X6nFTwTmEHgrQW%2BTqpNpbCLxEbaAFtVHGHtdyd7fJJ%2BTM0oRPF&X-Amz-Signature=eb38fdd56874adcc806e8a03cfd6d911cd56c0ddb1d16362b7a31a5a6a991f8c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
