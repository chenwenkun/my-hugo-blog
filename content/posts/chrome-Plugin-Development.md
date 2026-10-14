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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y4UTPZDV%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T210452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDFk3KBgn%2BAM5EJKlMfPeZvH4IhmKmQjydMWq0rf%2BPVdAiEAoyVB685Gt1r4UUXEUEz15xNrDYD1I9j4sfF9EG4lyXsqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOPSjPcioDFfab6bircA%2FOTRoaxMKhOqvH4JlVNf1nj0NhTleiI2QQ7EZCRQ5yiMFE3yp2Gptf%2FKGFTnnYY%2BNRgsvjJqCAhpmRDrXRXJjkRlGLwEFxgAElhUNchFA4LLCNcxldHFtSCbvgcsblT%2B19DuORdxLRfdkDbVcI1uk4s%2FOPZV4ovZS1iR8STKYTv2wP2PAvx9H5cpuNCngClOJLdcnrja8rMPL%2BvetwBtqD%2FpnBS0dtsU0D7cX%2BP7Tpyp%2FhJOzQb%2FjJyWBxrIcitJeH%2BitPByHkbmWaUuQQJeBZNYXPoXBbxziLdtpaQoiJ5sgnoIfhLaYCbZsOeMdncbrSc%2FY%2BIRBSWE8nSsRqJyn8UGIpQp1vrvHAa3IUjlnuDwlbtVkYrWUTz2QvdOS34JHnrIuMNiIqvt66%2BTyFy5zx6InLZTctCU0voLnf2MvgPcmoHoCwfG8wtKTfs5yZqpRuBwdeVtcMdMgrcMJLn5WqKui9%2BN9GMXanYS7xKo%2FGjEaD2%2BLqDhig7HY5Ww5NudwnernNzhM0Rt4JA1iRuBQoW3cwrdbJSV9HNMh2NJwru7kEH9q2UUP%2FaMcTpZZ%2F47zhzYDndEzpvoIZdnruhhDeKPLw3jNAB%2B1FnL9noNswDEIKSK8GpHzjzZmZAMKvVv9YGOqUBT2gsMH0uxayWjkt2zYPBZZop9OVg68Stt3bhnjH6KBNytHJAwNtScfdYBwrvN5us8CYhdpDm0TNHXFSsHZsaeGV8d9ehifVtmSc%2Ba%2BFGUznto6KqiS%2FBLWv1%2B%2BakQEnzCATrMfey3cWaTUnjbYagz6497WflyO%2FSS3DXzG0e%2FmmOp%2BClEazm0ebEnAsQkq0Y4HcWCNvb8ehB13lU1WJW17eGsn7W&X-Amz-Signature=7dfff27c92cda8b40394fd9be187081725ac5a0a93b48e72c44472872a56e638&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y4UTPZDV%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T210452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDFk3KBgn%2BAM5EJKlMfPeZvH4IhmKmQjydMWq0rf%2BPVdAiEAoyVB685Gt1r4UUXEUEz15xNrDYD1I9j4sfF9EG4lyXsqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOPSjPcioDFfab6bircA%2FOTRoaxMKhOqvH4JlVNf1nj0NhTleiI2QQ7EZCRQ5yiMFE3yp2Gptf%2FKGFTnnYY%2BNRgsvjJqCAhpmRDrXRXJjkRlGLwEFxgAElhUNchFA4LLCNcxldHFtSCbvgcsblT%2B19DuORdxLRfdkDbVcI1uk4s%2FOPZV4ovZS1iR8STKYTv2wP2PAvx9H5cpuNCngClOJLdcnrja8rMPL%2BvetwBtqD%2FpnBS0dtsU0D7cX%2BP7Tpyp%2FhJOzQb%2FjJyWBxrIcitJeH%2BitPByHkbmWaUuQQJeBZNYXPoXBbxziLdtpaQoiJ5sgnoIfhLaYCbZsOeMdncbrSc%2FY%2BIRBSWE8nSsRqJyn8UGIpQp1vrvHAa3IUjlnuDwlbtVkYrWUTz2QvdOS34JHnrIuMNiIqvt66%2BTyFy5zx6InLZTctCU0voLnf2MvgPcmoHoCwfG8wtKTfs5yZqpRuBwdeVtcMdMgrcMJLn5WqKui9%2BN9GMXanYS7xKo%2FGjEaD2%2BLqDhig7HY5Ww5NudwnernNzhM0Rt4JA1iRuBQoW3cwrdbJSV9HNMh2NJwru7kEH9q2UUP%2FaMcTpZZ%2F47zhzYDndEzpvoIZdnruhhDeKPLw3jNAB%2B1FnL9noNswDEIKSK8GpHzjzZmZAMKvVv9YGOqUBT2gsMH0uxayWjkt2zYPBZZop9OVg68Stt3bhnjH6KBNytHJAwNtScfdYBwrvN5us8CYhdpDm0TNHXFSsHZsaeGV8d9ehifVtmSc%2Ba%2BFGUznto6KqiS%2FBLWv1%2B%2BakQEnzCATrMfey3cWaTUnjbYagz6497WflyO%2FSS3DXzG0e%2FmmOp%2BClEazm0ebEnAsQkq0Y4HcWCNvb8ehB13lU1WJW17eGsn7W&X-Amz-Signature=0ee5e49e328325dd862a7954072c619d29227c2fccff8504f91baa913738e6a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y4UTPZDV%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T210452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDFk3KBgn%2BAM5EJKlMfPeZvH4IhmKmQjydMWq0rf%2BPVdAiEAoyVB685Gt1r4UUXEUEz15xNrDYD1I9j4sfF9EG4lyXsqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOPSjPcioDFfab6bircA%2FOTRoaxMKhOqvH4JlVNf1nj0NhTleiI2QQ7EZCRQ5yiMFE3yp2Gptf%2FKGFTnnYY%2BNRgsvjJqCAhpmRDrXRXJjkRlGLwEFxgAElhUNchFA4LLCNcxldHFtSCbvgcsblT%2B19DuORdxLRfdkDbVcI1uk4s%2FOPZV4ovZS1iR8STKYTv2wP2PAvx9H5cpuNCngClOJLdcnrja8rMPL%2BvetwBtqD%2FpnBS0dtsU0D7cX%2BP7Tpyp%2FhJOzQb%2FjJyWBxrIcitJeH%2BitPByHkbmWaUuQQJeBZNYXPoXBbxziLdtpaQoiJ5sgnoIfhLaYCbZsOeMdncbrSc%2FY%2BIRBSWE8nSsRqJyn8UGIpQp1vrvHAa3IUjlnuDwlbtVkYrWUTz2QvdOS34JHnrIuMNiIqvt66%2BTyFy5zx6InLZTctCU0voLnf2MvgPcmoHoCwfG8wtKTfs5yZqpRuBwdeVtcMdMgrcMJLn5WqKui9%2BN9GMXanYS7xKo%2FGjEaD2%2BLqDhig7HY5Ww5NudwnernNzhM0Rt4JA1iRuBQoW3cwrdbJSV9HNMh2NJwru7kEH9q2UUP%2FaMcTpZZ%2F47zhzYDndEzpvoIZdnruhhDeKPLw3jNAB%2B1FnL9noNswDEIKSK8GpHzjzZmZAMKvVv9YGOqUBT2gsMH0uxayWjkt2zYPBZZop9OVg68Stt3bhnjH6KBNytHJAwNtScfdYBwrvN5us8CYhdpDm0TNHXFSsHZsaeGV8d9ehifVtmSc%2Ba%2BFGUznto6KqiS%2FBLWv1%2B%2BakQEnzCATrMfey3cWaTUnjbYagz6497WflyO%2FSS3DXzG0e%2FmmOp%2BClEazm0ebEnAsQkq0Y4HcWCNvb8ehB13lU1WJW17eGsn7W&X-Amz-Signature=523f8d2138f9ffb042b17e62bd58331733acd28a17a10c48f91ef3f536b62d1a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Y4UTPZDV%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T210452Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDFk3KBgn%2BAM5EJKlMfPeZvH4IhmKmQjydMWq0rf%2BPVdAiEAoyVB685Gt1r4UUXEUEz15xNrDYD1I9j4sfF9EG4lyXsqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOPSjPcioDFfab6bircA%2FOTRoaxMKhOqvH4JlVNf1nj0NhTleiI2QQ7EZCRQ5yiMFE3yp2Gptf%2FKGFTnnYY%2BNRgsvjJqCAhpmRDrXRXJjkRlGLwEFxgAElhUNchFA4LLCNcxldHFtSCbvgcsblT%2B19DuORdxLRfdkDbVcI1uk4s%2FOPZV4ovZS1iR8STKYTv2wP2PAvx9H5cpuNCngClOJLdcnrja8rMPL%2BvetwBtqD%2FpnBS0dtsU0D7cX%2BP7Tpyp%2FhJOzQb%2FjJyWBxrIcitJeH%2BitPByHkbmWaUuQQJeBZNYXPoXBbxziLdtpaQoiJ5sgnoIfhLaYCbZsOeMdncbrSc%2FY%2BIRBSWE8nSsRqJyn8UGIpQp1vrvHAa3IUjlnuDwlbtVkYrWUTz2QvdOS34JHnrIuMNiIqvt66%2BTyFy5zx6InLZTctCU0voLnf2MvgPcmoHoCwfG8wtKTfs5yZqpRuBwdeVtcMdMgrcMJLn5WqKui9%2BN9GMXanYS7xKo%2FGjEaD2%2BLqDhig7HY5Ww5NudwnernNzhM0Rt4JA1iRuBQoW3cwrdbJSV9HNMh2NJwru7kEH9q2UUP%2FaMcTpZZ%2F47zhzYDndEzpvoIZdnruhhDeKPLw3jNAB%2B1FnL9noNswDEIKSK8GpHzjzZmZAMKvVv9YGOqUBT2gsMH0uxayWjkt2zYPBZZop9OVg68Stt3bhnjH6KBNytHJAwNtScfdYBwrvN5us8CYhdpDm0TNHXFSsHZsaeGV8d9ehifVtmSc%2Ba%2BFGUznto6KqiS%2FBLWv1%2B%2BakQEnzCATrMfey3cWaTUnjbYagz6497WflyO%2FSS3DXzG0e%2FmmOp%2BClEazm0ebEnAsQkq0Y4HcWCNvb8ehB13lU1WJW17eGsn7W&X-Amz-Signature=94d895f474f8f327f7f6c8b51b8362c6842ce6bfdba8eedc56756f60d052b75b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
