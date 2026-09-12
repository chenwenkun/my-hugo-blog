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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46656W3XX5P%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T195022Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBBsxY8T5THNzPKW1GI58iz7tSgVCw0HTd9zFtmb9YUdAiB8jztCnhN3HcJdvMa%2FiFKYG8cQiZoVXrQBh%2B%2B8o1nuWyqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMUczzNYqMvVpVsEsCKtwD1as9wimuKJ1iQ7zOJLNmpsLm9UDQEmgNdo2jU%2BtoCzxFodWRbJKHFu2tDS8F8Mk3JG5vM0MPWv2EXUgEPMbqGf1xG3DdF42akP8ByCCgYO%2F9xCqN%2BAL7TNkxYNUPovt4y41LWdjjvqbYt0HY0Vq1NJ%2FKsSKTyydriUUYN7%2FGRUZ7CcIO7hGa6VQtDqigP1w2yc7fKsLQEj32JQl4nUaVC57Z1KoM2FApkbsj5yqBEgP8yvsV5HyJd84LtF1vQ19AbpXPHz51kS6BNdzdIiIAigqUVcXWUMyxPypmBqdV4Sw2ypuqKSmASydLF68AmWSkkiahJMqp%2FajvPzUBjP156WoHvo5jxpJ52uv1SMojp%2F22QJVYWWP24tWDTLDMoUp2RrD%2Bk265tuQIqR9LJMtaBSqV1xVmfqg3XmYa1zi079vkKTH1w7UJJTjbgXG%2FNHsczTcpsdQpUWARCOX64gcGrQJnscaxI%2BlKAlN7iOmLROhx0Jkgh5K4onFD2aDkVxWeoV0wWDzBbzCZ0Nk9mCW50NxjwWoGDgVA7E89bSjocDva%2BZtUBMRs%2B%2FF7Dstw1Qvi726ZlvJkFqC5ciSk0WKGFUXT6PrZc3PPxd2Y4M5%2FBx2DhUA8rd48RYN9JAEwuseW1QY6pgGqcmxWu8xaUHLw9qLgqPRz7lttxXWHiXyZ2AUPrSzIBhxzX03c2ekSH%2FjTLWAXCypiBf%2FZvvbmBP6CLDd9KARJi%2FidxM077TZRPwCfWzT5WdgbXHPCMwDnAvgWJIosCg17%2BzZgQy86au8rgo46L127QVP9JYioiN3IHhuyvM%2FlMROsZWL7WwftH803NYsBlKxIKDy%2BSyqm3t%2FXRyywaMbBdnOFaURz&X-Amz-Signature=99afc868fd6397bf67e286cea72b0d9a46eab2daef0b29f01bb4f07f8b5f835c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46656W3XX5P%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T195022Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBBsxY8T5THNzPKW1GI58iz7tSgVCw0HTd9zFtmb9YUdAiB8jztCnhN3HcJdvMa%2FiFKYG8cQiZoVXrQBh%2B%2B8o1nuWyqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMUczzNYqMvVpVsEsCKtwD1as9wimuKJ1iQ7zOJLNmpsLm9UDQEmgNdo2jU%2BtoCzxFodWRbJKHFu2tDS8F8Mk3JG5vM0MPWv2EXUgEPMbqGf1xG3DdF42akP8ByCCgYO%2F9xCqN%2BAL7TNkxYNUPovt4y41LWdjjvqbYt0HY0Vq1NJ%2FKsSKTyydriUUYN7%2FGRUZ7CcIO7hGa6VQtDqigP1w2yc7fKsLQEj32JQl4nUaVC57Z1KoM2FApkbsj5yqBEgP8yvsV5HyJd84LtF1vQ19AbpXPHz51kS6BNdzdIiIAigqUVcXWUMyxPypmBqdV4Sw2ypuqKSmASydLF68AmWSkkiahJMqp%2FajvPzUBjP156WoHvo5jxpJ52uv1SMojp%2F22QJVYWWP24tWDTLDMoUp2RrD%2Bk265tuQIqR9LJMtaBSqV1xVmfqg3XmYa1zi079vkKTH1w7UJJTjbgXG%2FNHsczTcpsdQpUWARCOX64gcGrQJnscaxI%2BlKAlN7iOmLROhx0Jkgh5K4onFD2aDkVxWeoV0wWDzBbzCZ0Nk9mCW50NxjwWoGDgVA7E89bSjocDva%2BZtUBMRs%2B%2FF7Dstw1Qvi726ZlvJkFqC5ciSk0WKGFUXT6PrZc3PPxd2Y4M5%2FBx2DhUA8rd48RYN9JAEwuseW1QY6pgGqcmxWu8xaUHLw9qLgqPRz7lttxXWHiXyZ2AUPrSzIBhxzX03c2ekSH%2FjTLWAXCypiBf%2FZvvbmBP6CLDd9KARJi%2FidxM077TZRPwCfWzT5WdgbXHPCMwDnAvgWJIosCg17%2BzZgQy86au8rgo46L127QVP9JYioiN3IHhuyvM%2FlMROsZWL7WwftH803NYsBlKxIKDy%2BSyqm3t%2FXRyywaMbBdnOFaURz&X-Amz-Signature=98e6a375974a91440cc2d641bb3d9d5f39c58a7c2b564596f1e1161fa9c97649&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46656W3XX5P%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T195022Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBBsxY8T5THNzPKW1GI58iz7tSgVCw0HTd9zFtmb9YUdAiB8jztCnhN3HcJdvMa%2FiFKYG8cQiZoVXrQBh%2B%2B8o1nuWyqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMUczzNYqMvVpVsEsCKtwD1as9wimuKJ1iQ7zOJLNmpsLm9UDQEmgNdo2jU%2BtoCzxFodWRbJKHFu2tDS8F8Mk3JG5vM0MPWv2EXUgEPMbqGf1xG3DdF42akP8ByCCgYO%2F9xCqN%2BAL7TNkxYNUPovt4y41LWdjjvqbYt0HY0Vq1NJ%2FKsSKTyydriUUYN7%2FGRUZ7CcIO7hGa6VQtDqigP1w2yc7fKsLQEj32JQl4nUaVC57Z1KoM2FApkbsj5yqBEgP8yvsV5HyJd84LtF1vQ19AbpXPHz51kS6BNdzdIiIAigqUVcXWUMyxPypmBqdV4Sw2ypuqKSmASydLF68AmWSkkiahJMqp%2FajvPzUBjP156WoHvo5jxpJ52uv1SMojp%2F22QJVYWWP24tWDTLDMoUp2RrD%2Bk265tuQIqR9LJMtaBSqV1xVmfqg3XmYa1zi079vkKTH1w7UJJTjbgXG%2FNHsczTcpsdQpUWARCOX64gcGrQJnscaxI%2BlKAlN7iOmLROhx0Jkgh5K4onFD2aDkVxWeoV0wWDzBbzCZ0Nk9mCW50NxjwWoGDgVA7E89bSjocDva%2BZtUBMRs%2B%2FF7Dstw1Qvi726ZlvJkFqC5ciSk0WKGFUXT6PrZc3PPxd2Y4M5%2FBx2DhUA8rd48RYN9JAEwuseW1QY6pgGqcmxWu8xaUHLw9qLgqPRz7lttxXWHiXyZ2AUPrSzIBhxzX03c2ekSH%2FjTLWAXCypiBf%2FZvvbmBP6CLDd9KARJi%2FidxM077TZRPwCfWzT5WdgbXHPCMwDnAvgWJIosCg17%2BzZgQy86au8rgo46L127QVP9JYioiN3IHhuyvM%2FlMROsZWL7WwftH803NYsBlKxIKDy%2BSyqm3t%2FXRyywaMbBdnOFaURz&X-Amz-Signature=cae848b71e57f5a5f2e75e92dbfe0e26ab6b5f6eb24db5c8f9bf668320afece7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46656W3XX5P%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T195022Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIBBsxY8T5THNzPKW1GI58iz7tSgVCw0HTd9zFtmb9YUdAiB8jztCnhN3HcJdvMa%2FiFKYG8cQiZoVXrQBh%2B%2B8o1nuWyqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMUczzNYqMvVpVsEsCKtwD1as9wimuKJ1iQ7zOJLNmpsLm9UDQEmgNdo2jU%2BtoCzxFodWRbJKHFu2tDS8F8Mk3JG5vM0MPWv2EXUgEPMbqGf1xG3DdF42akP8ByCCgYO%2F9xCqN%2BAL7TNkxYNUPovt4y41LWdjjvqbYt0HY0Vq1NJ%2FKsSKTyydriUUYN7%2FGRUZ7CcIO7hGa6VQtDqigP1w2yc7fKsLQEj32JQl4nUaVC57Z1KoM2FApkbsj5yqBEgP8yvsV5HyJd84LtF1vQ19AbpXPHz51kS6BNdzdIiIAigqUVcXWUMyxPypmBqdV4Sw2ypuqKSmASydLF68AmWSkkiahJMqp%2FajvPzUBjP156WoHvo5jxpJ52uv1SMojp%2F22QJVYWWP24tWDTLDMoUp2RrD%2Bk265tuQIqR9LJMtaBSqV1xVmfqg3XmYa1zi079vkKTH1w7UJJTjbgXG%2FNHsczTcpsdQpUWARCOX64gcGrQJnscaxI%2BlKAlN7iOmLROhx0Jkgh5K4onFD2aDkVxWeoV0wWDzBbzCZ0Nk9mCW50NxjwWoGDgVA7E89bSjocDva%2BZtUBMRs%2B%2FF7Dstw1Qvi726ZlvJkFqC5ciSk0WKGFUXT6PrZc3PPxd2Y4M5%2FBx2DhUA8rd48RYN9JAEwuseW1QY6pgGqcmxWu8xaUHLw9qLgqPRz7lttxXWHiXyZ2AUPrSzIBhxzX03c2ekSH%2FjTLWAXCypiBf%2FZvvbmBP6CLDd9KARJi%2FidxM077TZRPwCfWzT5WdgbXHPCMwDnAvgWJIosCg17%2BzZgQy86au8rgo46L127QVP9JYioiN3IHhuyvM%2FlMROsZWL7WwftH803NYsBlKxIKDy%2BSyqm3t%2FXRyywaMbBdnOFaURz&X-Amz-Signature=ddea5b05c67f3dd4a8f13db2a2d82c2d638fa921e2a62766bf559340780ae75f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
