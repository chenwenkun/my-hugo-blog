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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WI5EQOLN%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T160455Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCrlaN1xDGqfvmCtlv%2FW8C0GLZzNkLyqyB7tVDv%2FGMo7wIhAPXogdGMkGfjftLgq9U8ri9jmvgW4zKDlQ7k%2Fo8iAsHSKogECI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzBS3D1250FXPxQbEAq3AMFED3k6XSpI5pwTjbxWQ2Lq6KgcSweoERx4uPImnyIoLBe5F2huid766B5rTNQhte59PhQ1D2OABFM9FXMhUu85W0N98cy4bniXmWJ3cSVLUyWUbfW4pQeCLzaemdwTgLoNtD6Flhtt%2B%2FUPZmKVl5CfKayx2Hss%2F5HCql4ePIqHbCxXD0UqJCsNNvJPnGQv3C%2BUwSsej0b6i6HJ0UaUp8rJEVAdNyhdtbFeogAJNzQvaNnlwrt7IMHOuzhksZHRzK5xz%2FPqUCq4T8sGIElyNNmcJsVYgJ4eBVrQlR6r5cRsrj%2BUG6nTAt%2F67aOZTl9vFAkoiqisUSUL%2FV4pIppPPAcTfQZ3WG29nx6hUqy7PYhSt00e%2F7ox4fUbp9XpIa9MgGpmrzfTwtsvAul99HPOIzCHdRNaaHgQ3L01VEt2Axkwy8na16tXKKKkVHuD9Apdw9%2BPmekwwlvTOPIdUHj3Qn5lX9%2ByCAq08GJnouahuepsL1lVqgS4xT4oDW1Ub4x8%2F8M41SmMr2ZU5uG9IoKPnrP7kkroGbxlkCSTeyq5ks5Z8v8NtAaHttI8HNx5HuiuSq4zTVDqK4WTJg8Ln%2Fc6WFk9mnA8uvOXOV4j5HrDG%2FFZR6%2F3OfTwwIyyGle0DDnk%2B3WBjqkATBnkq%2FStqjU1MeUR1BAZ5k3cX2czPvOpbCsSwhfS3FxbKsJhCc3%2FQBSQdoacyZwL8KJ8pCrtfAWqvtQbvftMGsduC0poCMvbpOLXdGx0%2BgK72WMZ%2F5WVyEtKkX90ATXKaVe%2BXDXBxRzXMuxQUltVmMGDf%2FUiLaMBwZcCd4C9%2FHX4HHaSz%2FwbX4JWK4RJeCuD8ni0PSVD8IIdzB3wib%2FWy5nH5de&X-Amz-Signature=a397643e8c62ff7ba301a19f729f4d04f2b442194e01a2bd3b74342db285259d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WI5EQOLN%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T160455Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCrlaN1xDGqfvmCtlv%2FW8C0GLZzNkLyqyB7tVDv%2FGMo7wIhAPXogdGMkGfjftLgq9U8ri9jmvgW4zKDlQ7k%2Fo8iAsHSKogECI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzBS3D1250FXPxQbEAq3AMFED3k6XSpI5pwTjbxWQ2Lq6KgcSweoERx4uPImnyIoLBe5F2huid766B5rTNQhte59PhQ1D2OABFM9FXMhUu85W0N98cy4bniXmWJ3cSVLUyWUbfW4pQeCLzaemdwTgLoNtD6Flhtt%2B%2FUPZmKVl5CfKayx2Hss%2F5HCql4ePIqHbCxXD0UqJCsNNvJPnGQv3C%2BUwSsej0b6i6HJ0UaUp8rJEVAdNyhdtbFeogAJNzQvaNnlwrt7IMHOuzhksZHRzK5xz%2FPqUCq4T8sGIElyNNmcJsVYgJ4eBVrQlR6r5cRsrj%2BUG6nTAt%2F67aOZTl9vFAkoiqisUSUL%2FV4pIppPPAcTfQZ3WG29nx6hUqy7PYhSt00e%2F7ox4fUbp9XpIa9MgGpmrzfTwtsvAul99HPOIzCHdRNaaHgQ3L01VEt2Axkwy8na16tXKKKkVHuD9Apdw9%2BPmekwwlvTOPIdUHj3Qn5lX9%2ByCAq08GJnouahuepsL1lVqgS4xT4oDW1Ub4x8%2F8M41SmMr2ZU5uG9IoKPnrP7kkroGbxlkCSTeyq5ks5Z8v8NtAaHttI8HNx5HuiuSq4zTVDqK4WTJg8Ln%2Fc6WFk9mnA8uvOXOV4j5HrDG%2FFZR6%2F3OfTwwIyyGle0DDnk%2B3WBjqkATBnkq%2FStqjU1MeUR1BAZ5k3cX2czPvOpbCsSwhfS3FxbKsJhCc3%2FQBSQdoacyZwL8KJ8pCrtfAWqvtQbvftMGsduC0poCMvbpOLXdGx0%2BgK72WMZ%2F5WVyEtKkX90ATXKaVe%2BXDXBxRzXMuxQUltVmMGDf%2FUiLaMBwZcCd4C9%2FHX4HHaSz%2FwbX4JWK4RJeCuD8ni0PSVD8IIdzB3wib%2FWy5nH5de&X-Amz-Signature=bcfd2acc22e58caaebe6f91b29423ea6346f19698a4fe6df7a9d219d5e9716ab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WI5EQOLN%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T160455Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCrlaN1xDGqfvmCtlv%2FW8C0GLZzNkLyqyB7tVDv%2FGMo7wIhAPXogdGMkGfjftLgq9U8ri9jmvgW4zKDlQ7k%2Fo8iAsHSKogECI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzBS3D1250FXPxQbEAq3AMFED3k6XSpI5pwTjbxWQ2Lq6KgcSweoERx4uPImnyIoLBe5F2huid766B5rTNQhte59PhQ1D2OABFM9FXMhUu85W0N98cy4bniXmWJ3cSVLUyWUbfW4pQeCLzaemdwTgLoNtD6Flhtt%2B%2FUPZmKVl5CfKayx2Hss%2F5HCql4ePIqHbCxXD0UqJCsNNvJPnGQv3C%2BUwSsej0b6i6HJ0UaUp8rJEVAdNyhdtbFeogAJNzQvaNnlwrt7IMHOuzhksZHRzK5xz%2FPqUCq4T8sGIElyNNmcJsVYgJ4eBVrQlR6r5cRsrj%2BUG6nTAt%2F67aOZTl9vFAkoiqisUSUL%2FV4pIppPPAcTfQZ3WG29nx6hUqy7PYhSt00e%2F7ox4fUbp9XpIa9MgGpmrzfTwtsvAul99HPOIzCHdRNaaHgQ3L01VEt2Axkwy8na16tXKKKkVHuD9Apdw9%2BPmekwwlvTOPIdUHj3Qn5lX9%2ByCAq08GJnouahuepsL1lVqgS4xT4oDW1Ub4x8%2F8M41SmMr2ZU5uG9IoKPnrP7kkroGbxlkCSTeyq5ks5Z8v8NtAaHttI8HNx5HuiuSq4zTVDqK4WTJg8Ln%2Fc6WFk9mnA8uvOXOV4j5HrDG%2FFZR6%2F3OfTwwIyyGle0DDnk%2B3WBjqkATBnkq%2FStqjU1MeUR1BAZ5k3cX2czPvOpbCsSwhfS3FxbKsJhCc3%2FQBSQdoacyZwL8KJ8pCrtfAWqvtQbvftMGsduC0poCMvbpOLXdGx0%2BgK72WMZ%2F5WVyEtKkX90ATXKaVe%2BXDXBxRzXMuxQUltVmMGDf%2FUiLaMBwZcCd4C9%2FHX4HHaSz%2FwbX4JWK4RJeCuD8ni0PSVD8IIdzB3wib%2FWy5nH5de&X-Amz-Signature=9fad3bc0a64e0ac6df952b54e30f6e61056aed023e4a847dfc31a8b34089a0a0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WI5EQOLN%2F20261023%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261023T160455Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCrlaN1xDGqfvmCtlv%2FW8C0GLZzNkLyqyB7tVDv%2FGMo7wIhAPXogdGMkGfjftLgq9U8ri9jmvgW4zKDlQ7k%2Fo8iAsHSKogECI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzBS3D1250FXPxQbEAq3AMFED3k6XSpI5pwTjbxWQ2Lq6KgcSweoERx4uPImnyIoLBe5F2huid766B5rTNQhte59PhQ1D2OABFM9FXMhUu85W0N98cy4bniXmWJ3cSVLUyWUbfW4pQeCLzaemdwTgLoNtD6Flhtt%2B%2FUPZmKVl5CfKayx2Hss%2F5HCql4ePIqHbCxXD0UqJCsNNvJPnGQv3C%2BUwSsej0b6i6HJ0UaUp8rJEVAdNyhdtbFeogAJNzQvaNnlwrt7IMHOuzhksZHRzK5xz%2FPqUCq4T8sGIElyNNmcJsVYgJ4eBVrQlR6r5cRsrj%2BUG6nTAt%2F67aOZTl9vFAkoiqisUSUL%2FV4pIppPPAcTfQZ3WG29nx6hUqy7PYhSt00e%2F7ox4fUbp9XpIa9MgGpmrzfTwtsvAul99HPOIzCHdRNaaHgQ3L01VEt2Axkwy8na16tXKKKkVHuD9Apdw9%2BPmekwwlvTOPIdUHj3Qn5lX9%2ByCAq08GJnouahuepsL1lVqgS4xT4oDW1Ub4x8%2F8M41SmMr2ZU5uG9IoKPnrP7kkroGbxlkCSTeyq5ks5Z8v8NtAaHttI8HNx5HuiuSq4zTVDqK4WTJg8Ln%2Fc6WFk9mnA8uvOXOV4j5HrDG%2FFZR6%2F3OfTwwIyyGle0DDnk%2B3WBjqkATBnkq%2FStqjU1MeUR1BAZ5k3cX2czPvOpbCsSwhfS3FxbKsJhCc3%2FQBSQdoacyZwL8KJ8pCrtfAWqvtQbvftMGsduC0poCMvbpOLXdGx0%2BgK72WMZ%2F5WVyEtKkX90ATXKaVe%2BXDXBxRzXMuxQUltVmMGDf%2FUiLaMBwZcCd4C9%2FHX4HHaSz%2FwbX4JWK4RJeCuD8ni0PSVD8IIdzB3wib%2FWy5nH5de&X-Amz-Signature=232b80ab4b9e173754e85e1de08bd65a5d269ac9e3465dae1c0963c4081d6261&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
