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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46643POAZ6M%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T131227Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHcPfY5v0mLh8i%2B9WnBgyJ6aY9%2FJs8dglRE%2B7wX07R9%2FAiAs%2BNpMZmCb756IoTWI4MnX6Rf1zPWxa%2BqFWqSwF6YzViqIBAiU%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCzvHYkv6ddvkO5uLKtwDd9JmHR8IeQD1bscMxzLrN5GRaj1yu2sMNSD4Ec0%2BxmGmqrY0lvNP5qKBIgzgjen%2BV0D0rKu2R3i2pshI6fs9YRAJudDkqnZi5WffexZHJUrQgawG3UTFseJMAPrRL1357Y0S7EQIsSzTWMU6LOXSdgTm6JcxOMrg6912dsuDctkp%2BBXChU1Xqhx8KX%2Fcgydq5mulzZh9shfD8vJfA9LZrTH4bAq9A%2FdLzCjshKcUTlv1ihdtFshlJjz05DpTSJ3X%2BY0o%2B%2FRcf1WY6WIGFvQ9i0vTzD7BTCUYTWi8oMuRRIyEuQueedylcGDd%2BLzPdMVA7IonCu5OPXXmVqZR%2B4Xe3MGxEVbRnAj9hnQWf7IN0%2BYTXajq%2Fh4H7ERtIiAxWWlZM2Tuhtcg%2Ba2XQG0qwuosOWkefORw8901ggirWpscUHqQ2a2fwKF1Rf0idnqYF3DVZpbiT5cDlJJbEO%2FemcJpG02fJn1IB%2FlwdJnhp8JxJ29FB%2Fnu%2B6R6%2BYvEJaJUswyEPnRD7ae3gYtXoSLRiPobU24jXS2pU%2BG2cwWmAFaAjVYYNtX3%2BQn75VRppQZEN7fOvGZu7d0Ur77y6UVfyWYd%2BSJzIZSyVFwh0jvNfqnSPTWrX5oYehtIr1NQtQcwlYOn1wY6pgE5EZaHOkB1I49rgGah3mMPPtVarm4e0NfUHEIKXGRjpFMiujLxp7l3rx%2BNDOCwP%2BfNQMLSnLtccjgzhNOkpH4BuSDvhYC9FiEQyms%2FuTXT5dGWMHxzLzVGlNlvo0JKxa3sLA2%2BpMEyb%2FkChsereZfFzTJ4h1XkuQXSx6iC8%2BgD9I%2FqD%2B2Z6AHps%2FvWP0DBNkoNBa8AvlZlYWC6VLywLIBGh8kAQ8Ms&X-Amz-Signature=b9d11fa5d82d030d79dd7729214de80b9873e2d53a06070e0bdde61d82fcdbb3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46643POAZ6M%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T131227Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHcPfY5v0mLh8i%2B9WnBgyJ6aY9%2FJs8dglRE%2B7wX07R9%2FAiAs%2BNpMZmCb756IoTWI4MnX6Rf1zPWxa%2BqFWqSwF6YzViqIBAiU%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCzvHYkv6ddvkO5uLKtwDd9JmHR8IeQD1bscMxzLrN5GRaj1yu2sMNSD4Ec0%2BxmGmqrY0lvNP5qKBIgzgjen%2BV0D0rKu2R3i2pshI6fs9YRAJudDkqnZi5WffexZHJUrQgawG3UTFseJMAPrRL1357Y0S7EQIsSzTWMU6LOXSdgTm6JcxOMrg6912dsuDctkp%2BBXChU1Xqhx8KX%2Fcgydq5mulzZh9shfD8vJfA9LZrTH4bAq9A%2FdLzCjshKcUTlv1ihdtFshlJjz05DpTSJ3X%2BY0o%2B%2FRcf1WY6WIGFvQ9i0vTzD7BTCUYTWi8oMuRRIyEuQueedylcGDd%2BLzPdMVA7IonCu5OPXXmVqZR%2B4Xe3MGxEVbRnAj9hnQWf7IN0%2BYTXajq%2Fh4H7ERtIiAxWWlZM2Tuhtcg%2Ba2XQG0qwuosOWkefORw8901ggirWpscUHqQ2a2fwKF1Rf0idnqYF3DVZpbiT5cDlJJbEO%2FemcJpG02fJn1IB%2FlwdJnhp8JxJ29FB%2Fnu%2B6R6%2BYvEJaJUswyEPnRD7ae3gYtXoSLRiPobU24jXS2pU%2BG2cwWmAFaAjVYYNtX3%2BQn75VRppQZEN7fOvGZu7d0Ur77y6UVfyWYd%2BSJzIZSyVFwh0jvNfqnSPTWrX5oYehtIr1NQtQcwlYOn1wY6pgE5EZaHOkB1I49rgGah3mMPPtVarm4e0NfUHEIKXGRjpFMiujLxp7l3rx%2BNDOCwP%2BfNQMLSnLtccjgzhNOkpH4BuSDvhYC9FiEQyms%2FuTXT5dGWMHxzLzVGlNlvo0JKxa3sLA2%2BpMEyb%2FkChsereZfFzTJ4h1XkuQXSx6iC8%2BgD9I%2FqD%2B2Z6AHps%2FvWP0DBNkoNBa8AvlZlYWC6VLywLIBGh8kAQ8Ms&X-Amz-Signature=64d58d794c6aa59d2931352bc944b17f4d51475aa858d860a2cb947b95aa03dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46643POAZ6M%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T131227Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHcPfY5v0mLh8i%2B9WnBgyJ6aY9%2FJs8dglRE%2B7wX07R9%2FAiAs%2BNpMZmCb756IoTWI4MnX6Rf1zPWxa%2BqFWqSwF6YzViqIBAiU%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCzvHYkv6ddvkO5uLKtwDd9JmHR8IeQD1bscMxzLrN5GRaj1yu2sMNSD4Ec0%2BxmGmqrY0lvNP5qKBIgzgjen%2BV0D0rKu2R3i2pshI6fs9YRAJudDkqnZi5WffexZHJUrQgawG3UTFseJMAPrRL1357Y0S7EQIsSzTWMU6LOXSdgTm6JcxOMrg6912dsuDctkp%2BBXChU1Xqhx8KX%2Fcgydq5mulzZh9shfD8vJfA9LZrTH4bAq9A%2FdLzCjshKcUTlv1ihdtFshlJjz05DpTSJ3X%2BY0o%2B%2FRcf1WY6WIGFvQ9i0vTzD7BTCUYTWi8oMuRRIyEuQueedylcGDd%2BLzPdMVA7IonCu5OPXXmVqZR%2B4Xe3MGxEVbRnAj9hnQWf7IN0%2BYTXajq%2Fh4H7ERtIiAxWWlZM2Tuhtcg%2Ba2XQG0qwuosOWkefORw8901ggirWpscUHqQ2a2fwKF1Rf0idnqYF3DVZpbiT5cDlJJbEO%2FemcJpG02fJn1IB%2FlwdJnhp8JxJ29FB%2Fnu%2B6R6%2BYvEJaJUswyEPnRD7ae3gYtXoSLRiPobU24jXS2pU%2BG2cwWmAFaAjVYYNtX3%2BQn75VRppQZEN7fOvGZu7d0Ur77y6UVfyWYd%2BSJzIZSyVFwh0jvNfqnSPTWrX5oYehtIr1NQtQcwlYOn1wY6pgE5EZaHOkB1I49rgGah3mMPPtVarm4e0NfUHEIKXGRjpFMiujLxp7l3rx%2BNDOCwP%2BfNQMLSnLtccjgzhNOkpH4BuSDvhYC9FiEQyms%2FuTXT5dGWMHxzLzVGlNlvo0JKxa3sLA2%2BpMEyb%2FkChsereZfFzTJ4h1XkuQXSx6iC8%2BgD9I%2FqD%2B2Z6AHps%2FvWP0DBNkoNBa8AvlZlYWC6VLywLIBGh8kAQ8Ms&X-Amz-Signature=6d1e2fe792a192b6f0c67ef6b832dc43bc227726f30b17eea3ddded5c467bfc8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46643POAZ6M%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T131227Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIHcPfY5v0mLh8i%2B9WnBgyJ6aY9%2FJs8dglRE%2B7wX07R9%2FAiAs%2BNpMZmCb756IoTWI4MnX6Rf1zPWxa%2BqFWqSwF6YzViqIBAiU%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMCzvHYkv6ddvkO5uLKtwDd9JmHR8IeQD1bscMxzLrN5GRaj1yu2sMNSD4Ec0%2BxmGmqrY0lvNP5qKBIgzgjen%2BV0D0rKu2R3i2pshI6fs9YRAJudDkqnZi5WffexZHJUrQgawG3UTFseJMAPrRL1357Y0S7EQIsSzTWMU6LOXSdgTm6JcxOMrg6912dsuDctkp%2BBXChU1Xqhx8KX%2Fcgydq5mulzZh9shfD8vJfA9LZrTH4bAq9A%2FdLzCjshKcUTlv1ihdtFshlJjz05DpTSJ3X%2BY0o%2B%2FRcf1WY6WIGFvQ9i0vTzD7BTCUYTWi8oMuRRIyEuQueedylcGDd%2BLzPdMVA7IonCu5OPXXmVqZR%2B4Xe3MGxEVbRnAj9hnQWf7IN0%2BYTXajq%2Fh4H7ERtIiAxWWlZM2Tuhtcg%2Ba2XQG0qwuosOWkefORw8901ggirWpscUHqQ2a2fwKF1Rf0idnqYF3DVZpbiT5cDlJJbEO%2FemcJpG02fJn1IB%2FlwdJnhp8JxJ29FB%2Fnu%2B6R6%2BYvEJaJUswyEPnRD7ae3gYtXoSLRiPobU24jXS2pU%2BG2cwWmAFaAjVYYNtX3%2BQn75VRppQZEN7fOvGZu7d0Ur77y6UVfyWYd%2BSJzIZSyVFwh0jvNfqnSPTWrX5oYehtIr1NQtQcwlYOn1wY6pgE5EZaHOkB1I49rgGah3mMPPtVarm4e0NfUHEIKXGRjpFMiujLxp7l3rx%2BNDOCwP%2BfNQMLSnLtccjgzhNOkpH4BuSDvhYC9FiEQyms%2FuTXT5dGWMHxzLzVGlNlvo0JKxa3sLA2%2BpMEyb%2FkChsereZfFzTJ4h1XkuQXSx6iC8%2BgD9I%2FqD%2B2Z6AHps%2FvWP0DBNkoNBa8AvlZlYWC6VLywLIBGh8kAQ8Ms&X-Amz-Signature=089434a80a3d6ca5030ac0b7cb7b8b5b51c651c297fc5bc5ee46bde2298c08cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
