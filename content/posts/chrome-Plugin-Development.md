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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624ZKPLYS%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T184052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2FRvYvcGen%2FiQUw9l%2BUGAC7gaSmVLmYmFjXryYcXoINAiBU%2FJ%2FOsCT%2FFwOJTjY%2FEZh2NofDEsJSLJYCSpxW585kFyqIBAih%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuA0ld9OBN8mFgleBKtwDe07Nma0nOK4UfSrn99VTpd7Jh0%2Bz%2BDovElrK84QwXhNuLMuBnPzMMV3iyPhNuQI3UmLdAkqmEK6cxa35vl9HphjO5FTp1qbmlboertTEtLf5GMHzgl8zo6AhhmeAA39gRMA4ZdHcpfcapeP5NQPHY99hfAySbxoYsJVNZAGMuYDe4VdIqddUOg5hMCd0tLukXdL5JZc0h4nU3G%2F8RT0Psn0RwnUZ8%2BgzIRbo8slYUFVHIGIFbsT9cBBYaqtnQTCaNUQ0v%2BLLuqRlXZ9Qq6%2FqZe3AjvMuLZYklhYgzA5YWVEyygKuJF%2BUN6AYfQA51%2FRL9BYOzT3GqJEp6s4DfFlhNn7n5yqL4hLyalM%2B9XhUro5XXUumxW8DqaMajpn8XJZMcEdXkliAzWKDS9B40Jb5Kuy8fLo58H9IbifcEx0I94HtIbI07T5uNOSIRTNXZncFZQWXcXxWSDMarYSaRfNNyHR5jFKxDBXTgGof7xlsPlvFMHV1IU01pZNozEkZdJ2luBH1NdS%2FcHXyS%2FIm2j%2BrtgTg%2FQu5Uv%2Fjcwq97yDu2yg%2FCNhdKihB%2FtI2IGE1J4NAjcuE7rmI1V%2F3zWyEMnbOKPcaXq1wz5BgL2RSk2UvY7z0HgK5K9bp%2F2Nu3F0wwvTn0wY6pgFf%2Fa42ntebwT8DYz7wz84SS8BDURJFlxdt92Zlc93X5DQ%2BrXIc0a4EipJUHw9rN7zGoziPjMiNng6FU%2FuQei5EHAkQkxAq5dMWxEBOK7iYCOUtlKeW0LuvMlvEVhe1n2ylBpSiViLSu985jzFT1Hr1NwDBgljoaVa7XkpdDJLHQWg5dHx73eDPZcgEir5fu3ZAvxZnAKb%2B88eczC%2FbLQqtVdq6EOpC&X-Amz-Signature=8d290e23365c1443bac7e04d78ced1d1008c439c5c9d554df06a1e6b43d316c9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624ZKPLYS%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T184052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2FRvYvcGen%2FiQUw9l%2BUGAC7gaSmVLmYmFjXryYcXoINAiBU%2FJ%2FOsCT%2FFwOJTjY%2FEZh2NofDEsJSLJYCSpxW585kFyqIBAih%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuA0ld9OBN8mFgleBKtwDe07Nma0nOK4UfSrn99VTpd7Jh0%2Bz%2BDovElrK84QwXhNuLMuBnPzMMV3iyPhNuQI3UmLdAkqmEK6cxa35vl9HphjO5FTp1qbmlboertTEtLf5GMHzgl8zo6AhhmeAA39gRMA4ZdHcpfcapeP5NQPHY99hfAySbxoYsJVNZAGMuYDe4VdIqddUOg5hMCd0tLukXdL5JZc0h4nU3G%2F8RT0Psn0RwnUZ8%2BgzIRbo8slYUFVHIGIFbsT9cBBYaqtnQTCaNUQ0v%2BLLuqRlXZ9Qq6%2FqZe3AjvMuLZYklhYgzA5YWVEyygKuJF%2BUN6AYfQA51%2FRL9BYOzT3GqJEp6s4DfFlhNn7n5yqL4hLyalM%2B9XhUro5XXUumxW8DqaMajpn8XJZMcEdXkliAzWKDS9B40Jb5Kuy8fLo58H9IbifcEx0I94HtIbI07T5uNOSIRTNXZncFZQWXcXxWSDMarYSaRfNNyHR5jFKxDBXTgGof7xlsPlvFMHV1IU01pZNozEkZdJ2luBH1NdS%2FcHXyS%2FIm2j%2BrtgTg%2FQu5Uv%2Fjcwq97yDu2yg%2FCNhdKihB%2FtI2IGE1J4NAjcuE7rmI1V%2F3zWyEMnbOKPcaXq1wz5BgL2RSk2UvY7z0HgK5K9bp%2F2Nu3F0wwvTn0wY6pgFf%2Fa42ntebwT8DYz7wz84SS8BDURJFlxdt92Zlc93X5DQ%2BrXIc0a4EipJUHw9rN7zGoziPjMiNng6FU%2FuQei5EHAkQkxAq5dMWxEBOK7iYCOUtlKeW0LuvMlvEVhe1n2ylBpSiViLSu985jzFT1Hr1NwDBgljoaVa7XkpdDJLHQWg5dHx73eDPZcgEir5fu3ZAvxZnAKb%2B88eczC%2FbLQqtVdq6EOpC&X-Amz-Signature=2c497de306355503fb04e9d2320bfc5cb3334afd860a10232dc2207a4dada018&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624ZKPLYS%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T184052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2FRvYvcGen%2FiQUw9l%2BUGAC7gaSmVLmYmFjXryYcXoINAiBU%2FJ%2FOsCT%2FFwOJTjY%2FEZh2NofDEsJSLJYCSpxW585kFyqIBAih%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuA0ld9OBN8mFgleBKtwDe07Nma0nOK4UfSrn99VTpd7Jh0%2Bz%2BDovElrK84QwXhNuLMuBnPzMMV3iyPhNuQI3UmLdAkqmEK6cxa35vl9HphjO5FTp1qbmlboertTEtLf5GMHzgl8zo6AhhmeAA39gRMA4ZdHcpfcapeP5NQPHY99hfAySbxoYsJVNZAGMuYDe4VdIqddUOg5hMCd0tLukXdL5JZc0h4nU3G%2F8RT0Psn0RwnUZ8%2BgzIRbo8slYUFVHIGIFbsT9cBBYaqtnQTCaNUQ0v%2BLLuqRlXZ9Qq6%2FqZe3AjvMuLZYklhYgzA5YWVEyygKuJF%2BUN6AYfQA51%2FRL9BYOzT3GqJEp6s4DfFlhNn7n5yqL4hLyalM%2B9XhUro5XXUumxW8DqaMajpn8XJZMcEdXkliAzWKDS9B40Jb5Kuy8fLo58H9IbifcEx0I94HtIbI07T5uNOSIRTNXZncFZQWXcXxWSDMarYSaRfNNyHR5jFKxDBXTgGof7xlsPlvFMHV1IU01pZNozEkZdJ2luBH1NdS%2FcHXyS%2FIm2j%2BrtgTg%2FQu5Uv%2Fjcwq97yDu2yg%2FCNhdKihB%2FtI2IGE1J4NAjcuE7rmI1V%2F3zWyEMnbOKPcaXq1wz5BgL2RSk2UvY7z0HgK5K9bp%2F2Nu3F0wwvTn0wY6pgFf%2Fa42ntebwT8DYz7wz84SS8BDURJFlxdt92Zlc93X5DQ%2BrXIc0a4EipJUHw9rN7zGoziPjMiNng6FU%2FuQei5EHAkQkxAq5dMWxEBOK7iYCOUtlKeW0LuvMlvEVhe1n2ylBpSiViLSu985jzFT1Hr1NwDBgljoaVa7XkpdDJLHQWg5dHx73eDPZcgEir5fu3ZAvxZnAKb%2B88eczC%2FbLQqtVdq6EOpC&X-Amz-Signature=5d0967403b46f55c40855983a2791e6124d940cd35ed60145d64d91490805608&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624ZKPLYS%2F20260810%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260810T184052Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2FRvYvcGen%2FiQUw9l%2BUGAC7gaSmVLmYmFjXryYcXoINAiBU%2FJ%2FOsCT%2FFwOJTjY%2FEZh2NofDEsJSLJYCSpxW585kFyqIBAih%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMuA0ld9OBN8mFgleBKtwDe07Nma0nOK4UfSrn99VTpd7Jh0%2Bz%2BDovElrK84QwXhNuLMuBnPzMMV3iyPhNuQI3UmLdAkqmEK6cxa35vl9HphjO5FTp1qbmlboertTEtLf5GMHzgl8zo6AhhmeAA39gRMA4ZdHcpfcapeP5NQPHY99hfAySbxoYsJVNZAGMuYDe4VdIqddUOg5hMCd0tLukXdL5JZc0h4nU3G%2F8RT0Psn0RwnUZ8%2BgzIRbo8slYUFVHIGIFbsT9cBBYaqtnQTCaNUQ0v%2BLLuqRlXZ9Qq6%2FqZe3AjvMuLZYklhYgzA5YWVEyygKuJF%2BUN6AYfQA51%2FRL9BYOzT3GqJEp6s4DfFlhNn7n5yqL4hLyalM%2B9XhUro5XXUumxW8DqaMajpn8XJZMcEdXkliAzWKDS9B40Jb5Kuy8fLo58H9IbifcEx0I94HtIbI07T5uNOSIRTNXZncFZQWXcXxWSDMarYSaRfNNyHR5jFKxDBXTgGof7xlsPlvFMHV1IU01pZNozEkZdJ2luBH1NdS%2FcHXyS%2FIm2j%2BrtgTg%2FQu5Uv%2Fjcwq97yDu2yg%2FCNhdKihB%2FtI2IGE1J4NAjcuE7rmI1V%2F3zWyEMnbOKPcaXq1wz5BgL2RSk2UvY7z0HgK5K9bp%2F2Nu3F0wwvTn0wY6pgFf%2Fa42ntebwT8DYz7wz84SS8BDURJFlxdt92Zlc93X5DQ%2BrXIc0a4EipJUHw9rN7zGoziPjMiNng6FU%2FuQei5EHAkQkxAq5dMWxEBOK7iYCOUtlKeW0LuvMlvEVhe1n2ylBpSiViLSu985jzFT1Hr1NwDBgljoaVa7XkpdDJLHQWg5dHx73eDPZcgEir5fu3ZAvxZnAKb%2B88eczC%2FbLQqtVdq6EOpC&X-Amz-Signature=6c5b1262d5f2afb7434919797db88e412b97abea7e6079e92597fc9f514bda08&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
