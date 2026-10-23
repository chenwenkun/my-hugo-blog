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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XXQSGLBK%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T204606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIANJeMCPZMZN%2FLhVZdPUpD7ZQ7nOUesJU46hkS1gKLCoAiAEGLsiAvGy1Ehmnv6ssOT%2BDsCEVWwDpNaukI0Fmx%2BvDyqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMKm31qsarqLz9d1tzKtwDyaX0Nef2f%2FSkx7e8MI23YvY4kbtizzpOBg4ldt0R5FqLYVTy4xrbMWfrQN08ZLvD5DZVbuOLEwzsnz2%2FTG8e2J7lGtM%2FvU%2FAZjdgKTrDleAepxrJX7bS07I%2BuAj1PscCyZBwDE1fqdwq3CMhW6mlaifKVuwsB8yVie6bWyOooqhiZdF916SQLBHvTas1oRDyHpUw0qRCgx9Cf5ouFIB3S65yOGtFLNmTm5noz1xoSI5T9aDuAxM%2BcyMzpmNqfdbUKx4XJWumx2LaAAI7%2BC4fVZCgRwadMOJ6WfMcohmHHplX9yPzvt8aE%2B7GGoBOEGR%2FsoyAv8KmWimK9j4MX8sb2Wi6qvg7lvtCLti4UA2mUSh2Zpu2F8MnwMNNQs%2BdBghULEBxfppDYIhSN%2FOOi%2FHvdwNIRHNFHcgM9xaPK6188%2FHwe73qOgEOzGWEHMu9SABrCABpC3xulifPFMRr8JiCcK%2FF1p210qPp5BVjJ9ixpwBUvSH3YeEeqcV4jTNVWHrUEpMk6WCjiODn5Ic%2FfII9BBc438hjOgQo7IjA00B3CWwVCqtDcxR2I%2B1Q47vOSv6zsClxyt2rHtFGU4E8duOOH8q7GQ8foyhxwL6oP7MCeiuNlT0qyYbzqH1QwcMw%2BYnv1gY6pgFu18tJgYjMcDkvC41FJD4iM4eXjShe1Q1M0tfMC%2BRm1i8knGQVubqc4IBqAgWl1l1VBOfkv%2B3%2BKIjdJobLJCVMTRpLVVBSNJ18Pk9xIDu7HD6nzoo9G%2BsWLk8yPgxmuwNk%2BW%2BFDk8PG%2FF%2BbjVhHFj6ktlzhuxu4hkoswVsYODZiMBFByzXD5wfHEuAM9YxFRG%2BK1gdPbmO46SdQLPA2KgcAWC%2BFDnl&X-Amz-Signature=27efe589018d67a84fffd28b5155e5cfb8a9085ba16759992b44927836c6a72c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XXQSGLBK%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T204606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIANJeMCPZMZN%2FLhVZdPUpD7ZQ7nOUesJU46hkS1gKLCoAiAEGLsiAvGy1Ehmnv6ssOT%2BDsCEVWwDpNaukI0Fmx%2BvDyqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMKm31qsarqLz9d1tzKtwDyaX0Nef2f%2FSkx7e8MI23YvY4kbtizzpOBg4ldt0R5FqLYVTy4xrbMWfrQN08ZLvD5DZVbuOLEwzsnz2%2FTG8e2J7lGtM%2FvU%2FAZjdgKTrDleAepxrJX7bS07I%2BuAj1PscCyZBwDE1fqdwq3CMhW6mlaifKVuwsB8yVie6bWyOooqhiZdF916SQLBHvTas1oRDyHpUw0qRCgx9Cf5ouFIB3S65yOGtFLNmTm5noz1xoSI5T9aDuAxM%2BcyMzpmNqfdbUKx4XJWumx2LaAAI7%2BC4fVZCgRwadMOJ6WfMcohmHHplX9yPzvt8aE%2B7GGoBOEGR%2FsoyAv8KmWimK9j4MX8sb2Wi6qvg7lvtCLti4UA2mUSh2Zpu2F8MnwMNNQs%2BdBghULEBxfppDYIhSN%2FOOi%2FHvdwNIRHNFHcgM9xaPK6188%2FHwe73qOgEOzGWEHMu9SABrCABpC3xulifPFMRr8JiCcK%2FF1p210qPp5BVjJ9ixpwBUvSH3YeEeqcV4jTNVWHrUEpMk6WCjiODn5Ic%2FfII9BBc438hjOgQo7IjA00B3CWwVCqtDcxR2I%2B1Q47vOSv6zsClxyt2rHtFGU4E8duOOH8q7GQ8foyhxwL6oP7MCeiuNlT0qyYbzqH1QwcMw%2BYnv1gY6pgFu18tJgYjMcDkvC41FJD4iM4eXjShe1Q1M0tfMC%2BRm1i8knGQVubqc4IBqAgWl1l1VBOfkv%2B3%2BKIjdJobLJCVMTRpLVVBSNJ18Pk9xIDu7HD6nzoo9G%2BsWLk8yPgxmuwNk%2BW%2BFDk8PG%2FF%2BbjVhHFj6ktlzhuxu4hkoswVsYODZiMBFByzXD5wfHEuAM9YxFRG%2BK1gdPbmO46SdQLPA2KgcAWC%2BFDnl&X-Amz-Signature=bdb67f831851146958476468dcfaf18d655b056284d7148e456a929f979461d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XXQSGLBK%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T204606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIANJeMCPZMZN%2FLhVZdPUpD7ZQ7nOUesJU46hkS1gKLCoAiAEGLsiAvGy1Ehmnv6ssOT%2BDsCEVWwDpNaukI0Fmx%2BvDyqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMKm31qsarqLz9d1tzKtwDyaX0Nef2f%2FSkx7e8MI23YvY4kbtizzpOBg4ldt0R5FqLYVTy4xrbMWfrQN08ZLvD5DZVbuOLEwzsnz2%2FTG8e2J7lGtM%2FvU%2FAZjdgKTrDleAepxrJX7bS07I%2BuAj1PscCyZBwDE1fqdwq3CMhW6mlaifKVuwsB8yVie6bWyOooqhiZdF916SQLBHvTas1oRDyHpUw0qRCgx9Cf5ouFIB3S65yOGtFLNmTm5noz1xoSI5T9aDuAxM%2BcyMzpmNqfdbUKx4XJWumx2LaAAI7%2BC4fVZCgRwadMOJ6WfMcohmHHplX9yPzvt8aE%2B7GGoBOEGR%2FsoyAv8KmWimK9j4MX8sb2Wi6qvg7lvtCLti4UA2mUSh2Zpu2F8MnwMNNQs%2BdBghULEBxfppDYIhSN%2FOOi%2FHvdwNIRHNFHcgM9xaPK6188%2FHwe73qOgEOzGWEHMu9SABrCABpC3xulifPFMRr8JiCcK%2FF1p210qPp5BVjJ9ixpwBUvSH3YeEeqcV4jTNVWHrUEpMk6WCjiODn5Ic%2FfII9BBc438hjOgQo7IjA00B3CWwVCqtDcxR2I%2B1Q47vOSv6zsClxyt2rHtFGU4E8duOOH8q7GQ8foyhxwL6oP7MCeiuNlT0qyYbzqH1QwcMw%2BYnv1gY6pgFu18tJgYjMcDkvC41FJD4iM4eXjShe1Q1M0tfMC%2BRm1i8knGQVubqc4IBqAgWl1l1VBOfkv%2B3%2BKIjdJobLJCVMTRpLVVBSNJ18Pk9xIDu7HD6nzoo9G%2BsWLk8yPgxmuwNk%2BW%2BFDk8PG%2FF%2BbjVhHFj6ktlzhuxu4hkoswVsYODZiMBFByzXD5wfHEuAM9YxFRG%2BK1gdPbmO46SdQLPA2KgcAWC%2BFDnl&X-Amz-Signature=7b9af9151e32de3d02d1b1cce1256960d9675aeba0311c2786e5cd9a79416d71&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XXQSGLBK%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T204606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIANJeMCPZMZN%2FLhVZdPUpD7ZQ7nOUesJU46hkS1gKLCoAiAEGLsiAvGy1Ehmnv6ssOT%2BDsCEVWwDpNaukI0Fmx%2BvDyqIBAiV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMKm31qsarqLz9d1tzKtwDyaX0Nef2f%2FSkx7e8MI23YvY4kbtizzpOBg4ldt0R5FqLYVTy4xrbMWfrQN08ZLvD5DZVbuOLEwzsnz2%2FTG8e2J7lGtM%2FvU%2FAZjdgKTrDleAepxrJX7bS07I%2BuAj1PscCyZBwDE1fqdwq3CMhW6mlaifKVuwsB8yVie6bWyOooqhiZdF916SQLBHvTas1oRDyHpUw0qRCgx9Cf5ouFIB3S65yOGtFLNmTm5noz1xoSI5T9aDuAxM%2BcyMzpmNqfdbUKx4XJWumx2LaAAI7%2BC4fVZCgRwadMOJ6WfMcohmHHplX9yPzvt8aE%2B7GGoBOEGR%2FsoyAv8KmWimK9j4MX8sb2Wi6qvg7lvtCLti4UA2mUSh2Zpu2F8MnwMNNQs%2BdBghULEBxfppDYIhSN%2FOOi%2FHvdwNIRHNFHcgM9xaPK6188%2FHwe73qOgEOzGWEHMu9SABrCABpC3xulifPFMRr8JiCcK%2FF1p210qPp5BVjJ9ixpwBUvSH3YeEeqcV4jTNVWHrUEpMk6WCjiODn5Ic%2FfII9BBc438hjOgQo7IjA00B3CWwVCqtDcxR2I%2B1Q47vOSv6zsClxyt2rHtFGU4E8duOOH8q7GQ8foyhxwL6oP7MCeiuNlT0qyYbzqH1QwcMw%2BYnv1gY6pgFu18tJgYjMcDkvC41FJD4iM4eXjShe1Q1M0tfMC%2BRm1i8knGQVubqc4IBqAgWl1l1VBOfkv%2B3%2BKIjdJobLJCVMTRpLVVBSNJ18Pk9xIDu7HD6nzoo9G%2BsWLk8yPgxmuwNk%2BW%2BFDk8PG%2FF%2BbjVhHFj6ktlzhuxu4hkoswVsYODZiMBFByzXD5wfHEuAM9YxFRG%2BK1gdPbmO46SdQLPA2KgcAWC%2BFDnl&X-Amz-Signature=c03b1e7a178feb3c480ef1a910611f6f1b37e1769f921c21bfbaa5267c64a2a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
