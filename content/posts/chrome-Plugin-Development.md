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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GVIA3V5%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T184453Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2Beiz%2F%2Bds2bUrXKI970J30SqOY8Y21PpwfrzyvXFP%2FIAiAKXnOlipsoQcpyheVwHBYegRnlQys8EVq0aZ18KUcGmSqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMRqcILkrPvnPiQ%2FEBKtwDhRCmua7TckVJphpY7NXNxCfStA3HscaYacGUEsxxaXjtim1FrrZgzTybuqu%2F2QAjFui%2F6fhaqZONTof0GD%2FJXrGypjvrT05%2BrI80qcs1ZSAHq3zfNZizt6CMwuqcXAQgq1V39SoPsqDBgADIibuNyBMx8M1EYokc4aVoNb7yqqpBb%2BSMIZjMpJwZKwAWMRKnfwZ8%2FX164BuskPmS%2Fd4ApMxn%2FBPq61P6MmuLGNA7Qqd3LTSWr14a9%2BIDv%2F3c1ztpnqCc1sfv1Bq0ahafMHb77qvm7SBhHeUNwvJ7QyCfPByuRIL9EEK0%2FoiGHOrxRK5UbzwUnWBo58wj%2Bevj6JQBYNXrLCX14M7QqEkkDuoCINBx%2Bjzhq1lF3IFA2IunVZrgfq0M0lnLmuVQPjrUFQWO8RYp%2BwAK1GTsjC20LtB%2FSF5xa5czb1dozOBMFqvTtDcwXihcnAE%2FBGjhHHr%2BbUg1coNxgXJNaLtMUty7rFxZhVkq02UQ05ewm9nAW3oK4nrvpjpd35NGe5tjXXFCf9Uhh9K4LcKaKZpqSNLsZmXuJ7Wyf%2BEBCGrWiJVdzFMV3EvzNvxNjAU6VcdUcKDvEmUJ7FojsdkUKZX5KPULoEzluATVGNoxfoIzlUjiX68w7dHt0wY6pgFlTzeShSDBmMdSpM7tFvP1vDrpZfsnJ4b0%2BxXo%2FS%2FLhuCYGxMyd1hXoGtPXPS16wAGHgko1u4IDJhPPumfkhznJjqTiVX6PuCJxn6mr2sekGXTHuHUX4HJfodZCb5TKNMYfG1cFBMnTdE5dFILj9Ya1F%2BdhZaeBmju24l7b5cMFcNcSZQ9xqJdbd0bh1PxwhswmiP8t3gThDZ%2Blat1230%2F9P8YpzfT&X-Amz-Signature=dcc1d01e188e8ad5e89ae0811cd7c4db45b4d60059e9e890eed514cec04f9099&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GVIA3V5%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T184453Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2Beiz%2F%2Bds2bUrXKI970J30SqOY8Y21PpwfrzyvXFP%2FIAiAKXnOlipsoQcpyheVwHBYegRnlQys8EVq0aZ18KUcGmSqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMRqcILkrPvnPiQ%2FEBKtwDhRCmua7TckVJphpY7NXNxCfStA3HscaYacGUEsxxaXjtim1FrrZgzTybuqu%2F2QAjFui%2F6fhaqZONTof0GD%2FJXrGypjvrT05%2BrI80qcs1ZSAHq3zfNZizt6CMwuqcXAQgq1V39SoPsqDBgADIibuNyBMx8M1EYokc4aVoNb7yqqpBb%2BSMIZjMpJwZKwAWMRKnfwZ8%2FX164BuskPmS%2Fd4ApMxn%2FBPq61P6MmuLGNA7Qqd3LTSWr14a9%2BIDv%2F3c1ztpnqCc1sfv1Bq0ahafMHb77qvm7SBhHeUNwvJ7QyCfPByuRIL9EEK0%2FoiGHOrxRK5UbzwUnWBo58wj%2Bevj6JQBYNXrLCX14M7QqEkkDuoCINBx%2Bjzhq1lF3IFA2IunVZrgfq0M0lnLmuVQPjrUFQWO8RYp%2BwAK1GTsjC20LtB%2FSF5xa5czb1dozOBMFqvTtDcwXihcnAE%2FBGjhHHr%2BbUg1coNxgXJNaLtMUty7rFxZhVkq02UQ05ewm9nAW3oK4nrvpjpd35NGe5tjXXFCf9Uhh9K4LcKaKZpqSNLsZmXuJ7Wyf%2BEBCGrWiJVdzFMV3EvzNvxNjAU6VcdUcKDvEmUJ7FojsdkUKZX5KPULoEzluATVGNoxfoIzlUjiX68w7dHt0wY6pgFlTzeShSDBmMdSpM7tFvP1vDrpZfsnJ4b0%2BxXo%2FS%2FLhuCYGxMyd1hXoGtPXPS16wAGHgko1u4IDJhPPumfkhznJjqTiVX6PuCJxn6mr2sekGXTHuHUX4HJfodZCb5TKNMYfG1cFBMnTdE5dFILj9Ya1F%2BdhZaeBmju24l7b5cMFcNcSZQ9xqJdbd0bh1PxwhswmiP8t3gThDZ%2Blat1230%2F9P8YpzfT&X-Amz-Signature=770e1ee5e5acaf398fbcff68719adb86377350309382d681ca17c3dc81415cd6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GVIA3V5%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T184453Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2Beiz%2F%2Bds2bUrXKI970J30SqOY8Y21PpwfrzyvXFP%2FIAiAKXnOlipsoQcpyheVwHBYegRnlQys8EVq0aZ18KUcGmSqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMRqcILkrPvnPiQ%2FEBKtwDhRCmua7TckVJphpY7NXNxCfStA3HscaYacGUEsxxaXjtim1FrrZgzTybuqu%2F2QAjFui%2F6fhaqZONTof0GD%2FJXrGypjvrT05%2BrI80qcs1ZSAHq3zfNZizt6CMwuqcXAQgq1V39SoPsqDBgADIibuNyBMx8M1EYokc4aVoNb7yqqpBb%2BSMIZjMpJwZKwAWMRKnfwZ8%2FX164BuskPmS%2Fd4ApMxn%2FBPq61P6MmuLGNA7Qqd3LTSWr14a9%2BIDv%2F3c1ztpnqCc1sfv1Bq0ahafMHb77qvm7SBhHeUNwvJ7QyCfPByuRIL9EEK0%2FoiGHOrxRK5UbzwUnWBo58wj%2Bevj6JQBYNXrLCX14M7QqEkkDuoCINBx%2Bjzhq1lF3IFA2IunVZrgfq0M0lnLmuVQPjrUFQWO8RYp%2BwAK1GTsjC20LtB%2FSF5xa5czb1dozOBMFqvTtDcwXihcnAE%2FBGjhHHr%2BbUg1coNxgXJNaLtMUty7rFxZhVkq02UQ05ewm9nAW3oK4nrvpjpd35NGe5tjXXFCf9Uhh9K4LcKaKZpqSNLsZmXuJ7Wyf%2BEBCGrWiJVdzFMV3EvzNvxNjAU6VcdUcKDvEmUJ7FojsdkUKZX5KPULoEzluATVGNoxfoIzlUjiX68w7dHt0wY6pgFlTzeShSDBmMdSpM7tFvP1vDrpZfsnJ4b0%2BxXo%2FS%2FLhuCYGxMyd1hXoGtPXPS16wAGHgko1u4IDJhPPumfkhznJjqTiVX6PuCJxn6mr2sekGXTHuHUX4HJfodZCb5TKNMYfG1cFBMnTdE5dFILj9Ya1F%2BdhZaeBmju24l7b5cMFcNcSZQ9xqJdbd0bh1PxwhswmiP8t3gThDZ%2Blat1230%2F9P8YpzfT&X-Amz-Signature=7b6a6a7095e3b2876cc0449b5a651efe012815faf573511eaa4484ce0fc24229&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GVIA3V5%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T184453Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG%2Beiz%2F%2Bds2bUrXKI970J30SqOY8Y21PpwfrzyvXFP%2FIAiAKXnOlipsoQcpyheVwHBYegRnlQys8EVq0aZ18KUcGmSqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMRqcILkrPvnPiQ%2FEBKtwDhRCmua7TckVJphpY7NXNxCfStA3HscaYacGUEsxxaXjtim1FrrZgzTybuqu%2F2QAjFui%2F6fhaqZONTof0GD%2FJXrGypjvrT05%2BrI80qcs1ZSAHq3zfNZizt6CMwuqcXAQgq1V39SoPsqDBgADIibuNyBMx8M1EYokc4aVoNb7yqqpBb%2BSMIZjMpJwZKwAWMRKnfwZ8%2FX164BuskPmS%2Fd4ApMxn%2FBPq61P6MmuLGNA7Qqd3LTSWr14a9%2BIDv%2F3c1ztpnqCc1sfv1Bq0ahafMHb77qvm7SBhHeUNwvJ7QyCfPByuRIL9EEK0%2FoiGHOrxRK5UbzwUnWBo58wj%2Bevj6JQBYNXrLCX14M7QqEkkDuoCINBx%2Bjzhq1lF3IFA2IunVZrgfq0M0lnLmuVQPjrUFQWO8RYp%2BwAK1GTsjC20LtB%2FSF5xa5czb1dozOBMFqvTtDcwXihcnAE%2FBGjhHHr%2BbUg1coNxgXJNaLtMUty7rFxZhVkq02UQ05ewm9nAW3oK4nrvpjpd35NGe5tjXXFCf9Uhh9K4LcKaKZpqSNLsZmXuJ7Wyf%2BEBCGrWiJVdzFMV3EvzNvxNjAU6VcdUcKDvEmUJ7FojsdkUKZX5KPULoEzluATVGNoxfoIzlUjiX68w7dHt0wY6pgFlTzeShSDBmMdSpM7tFvP1vDrpZfsnJ4b0%2BxXo%2FS%2FLhuCYGxMyd1hXoGtPXPS16wAGHgko1u4IDJhPPumfkhznJjqTiVX6PuCJxn6mr2sekGXTHuHUX4HJfodZCb5TKNMYfG1cFBMnTdE5dFILj9Ya1F%2BdhZaeBmju24l7b5cMFcNcSZQ9xqJdbd0bh1PxwhswmiP8t3gThDZ%2Blat1230%2F9P8YpzfT&X-Amz-Signature=2ad7362534e1f31c2fa9a765bf16e6cbb857196a057cbbe38f1a07839de645b9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
