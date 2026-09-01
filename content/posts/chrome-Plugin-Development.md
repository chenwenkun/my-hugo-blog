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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5RESEQL%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T201648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCaeZDa7eaHO4bEJlamOpqHkhacvpdoe6vMradDZKUu3wIhAPWt3pT2nPD5Ax7V5n%2BnMgtLUSl869i0dNvDevVBQ17vKogECLX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FuXy4lnQeBtqXNZEq3ANRg0Jnt86oqyKlO6GFlJ88kEcxxZKIb8XtbxRYq8mofLx5r%2B0iGu1chUP0wqoVbWbJM%2BdemtH2HZxZRYWgvEtkBf3NCFWP95i2l%2FGAjBVNYicdW3rNS6nn3o2KF8AlPkWcngGEOqxT9737iwC4s5uYO6CKX2eUopGvQGxbzDgp7tCv9HfabPPYwUDlTuc0lplAzNxa3Ca5sSI3x4vxyHeIRBiIFPw4ccvFkZ4HgeNTp7AnM4kS44IQvJFeZsLc2BVRjoLYBwf2QxKqjJ0vGocdcn%2BWsHimWKMmxC46YFBccso9O82tpNBFF72cczr1IycKT5GYfCnwRWNVkA%2FZzzWsjF6BWAPezcBioM8DhyWbZORqnxj8Z38fqanhdsSWor7ZU85jMGp4MAWZIUCMtGxFDnnGhUVEhSglXuUQ5JsMM84Vgp2YYUdW0N76mFNIvAEoGy6l7Fz3OvKHR28tJCjG0uVb%2B6sQWMsnubsfQQE4vRqyzmVQsFe2FHcD81zWQUxXeGFPyIIctNMSlmCXU7PUD9%2BOkkny4s%2BDks6CEWComnuY8AelLpEZyAL%2Bm4ypiSbOfjd6wlCPZHs73pbY0k7e5JGR8vB6gG%2Fsy5DWbzirzf7UEGLYqRGML8mT1jCn2tzUBjqkAaAmTElA2Vh6KswTqTAqPptZZJU3KJay8NySoIB%2FENvIrH%2FCRSy5FvvPANngwDC8OkLAegywmreT0Mh6TX4oMdRlfwiLlgrOifkk1Is2VZAyY9t1TrcpD%2BOkl9E6NNU9nzMQYdmUvIX5TZvbw7o%2BuBU89liV%2FF9ne%2B%2BOSLtyeYB0WnXfa7cTuhnF%2FvBlkAbjf%2FSOs%2BwSika7jrngZYuTipMrvbGn&X-Amz-Signature=4244c759ae6bcf70dc6f2765790261ee80fbfc4422008528db816d5da7c4561f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5RESEQL%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T201648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCaeZDa7eaHO4bEJlamOpqHkhacvpdoe6vMradDZKUu3wIhAPWt3pT2nPD5Ax7V5n%2BnMgtLUSl869i0dNvDevVBQ17vKogECLX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FuXy4lnQeBtqXNZEq3ANRg0Jnt86oqyKlO6GFlJ88kEcxxZKIb8XtbxRYq8mofLx5r%2B0iGu1chUP0wqoVbWbJM%2BdemtH2HZxZRYWgvEtkBf3NCFWP95i2l%2FGAjBVNYicdW3rNS6nn3o2KF8AlPkWcngGEOqxT9737iwC4s5uYO6CKX2eUopGvQGxbzDgp7tCv9HfabPPYwUDlTuc0lplAzNxa3Ca5sSI3x4vxyHeIRBiIFPw4ccvFkZ4HgeNTp7AnM4kS44IQvJFeZsLc2BVRjoLYBwf2QxKqjJ0vGocdcn%2BWsHimWKMmxC46YFBccso9O82tpNBFF72cczr1IycKT5GYfCnwRWNVkA%2FZzzWsjF6BWAPezcBioM8DhyWbZORqnxj8Z38fqanhdsSWor7ZU85jMGp4MAWZIUCMtGxFDnnGhUVEhSglXuUQ5JsMM84Vgp2YYUdW0N76mFNIvAEoGy6l7Fz3OvKHR28tJCjG0uVb%2B6sQWMsnubsfQQE4vRqyzmVQsFe2FHcD81zWQUxXeGFPyIIctNMSlmCXU7PUD9%2BOkkny4s%2BDks6CEWComnuY8AelLpEZyAL%2Bm4ypiSbOfjd6wlCPZHs73pbY0k7e5JGR8vB6gG%2Fsy5DWbzirzf7UEGLYqRGML8mT1jCn2tzUBjqkAaAmTElA2Vh6KswTqTAqPptZZJU3KJay8NySoIB%2FENvIrH%2FCRSy5FvvPANngwDC8OkLAegywmreT0Mh6TX4oMdRlfwiLlgrOifkk1Is2VZAyY9t1TrcpD%2BOkl9E6NNU9nzMQYdmUvIX5TZvbw7o%2BuBU89liV%2FF9ne%2B%2BOSLtyeYB0WnXfa7cTuhnF%2FvBlkAbjf%2FSOs%2BwSika7jrngZYuTipMrvbGn&X-Amz-Signature=cdf706ad9c2fb20dc0b601099af47356f9ff2142bb7879778488493a6cb06e98&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5RESEQL%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T201648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCaeZDa7eaHO4bEJlamOpqHkhacvpdoe6vMradDZKUu3wIhAPWt3pT2nPD5Ax7V5n%2BnMgtLUSl869i0dNvDevVBQ17vKogECLX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FuXy4lnQeBtqXNZEq3ANRg0Jnt86oqyKlO6GFlJ88kEcxxZKIb8XtbxRYq8mofLx5r%2B0iGu1chUP0wqoVbWbJM%2BdemtH2HZxZRYWgvEtkBf3NCFWP95i2l%2FGAjBVNYicdW3rNS6nn3o2KF8AlPkWcngGEOqxT9737iwC4s5uYO6CKX2eUopGvQGxbzDgp7tCv9HfabPPYwUDlTuc0lplAzNxa3Ca5sSI3x4vxyHeIRBiIFPw4ccvFkZ4HgeNTp7AnM4kS44IQvJFeZsLc2BVRjoLYBwf2QxKqjJ0vGocdcn%2BWsHimWKMmxC46YFBccso9O82tpNBFF72cczr1IycKT5GYfCnwRWNVkA%2FZzzWsjF6BWAPezcBioM8DhyWbZORqnxj8Z38fqanhdsSWor7ZU85jMGp4MAWZIUCMtGxFDnnGhUVEhSglXuUQ5JsMM84Vgp2YYUdW0N76mFNIvAEoGy6l7Fz3OvKHR28tJCjG0uVb%2B6sQWMsnubsfQQE4vRqyzmVQsFe2FHcD81zWQUxXeGFPyIIctNMSlmCXU7PUD9%2BOkkny4s%2BDks6CEWComnuY8AelLpEZyAL%2Bm4ypiSbOfjd6wlCPZHs73pbY0k7e5JGR8vB6gG%2Fsy5DWbzirzf7UEGLYqRGML8mT1jCn2tzUBjqkAaAmTElA2Vh6KswTqTAqPptZZJU3KJay8NySoIB%2FENvIrH%2FCRSy5FvvPANngwDC8OkLAegywmreT0Mh6TX4oMdRlfwiLlgrOifkk1Is2VZAyY9t1TrcpD%2BOkl9E6NNU9nzMQYdmUvIX5TZvbw7o%2BuBU89liV%2FF9ne%2B%2BOSLtyeYB0WnXfa7cTuhnF%2FvBlkAbjf%2FSOs%2BwSika7jrngZYuTipMrvbGn&X-Amz-Signature=5479971871663993ab6f93b9958400c9ee4d81880a1c1bcaf3b58e5150096205&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5RESEQL%2F20260901%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260901T201648Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCaeZDa7eaHO4bEJlamOpqHkhacvpdoe6vMradDZKUu3wIhAPWt3pT2nPD5Ax7V5n%2BnMgtLUSl869i0dNvDevVBQ17vKogECLX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igz%2FuXy4lnQeBtqXNZEq3ANRg0Jnt86oqyKlO6GFlJ88kEcxxZKIb8XtbxRYq8mofLx5r%2B0iGu1chUP0wqoVbWbJM%2BdemtH2HZxZRYWgvEtkBf3NCFWP95i2l%2FGAjBVNYicdW3rNS6nn3o2KF8AlPkWcngGEOqxT9737iwC4s5uYO6CKX2eUopGvQGxbzDgp7tCv9HfabPPYwUDlTuc0lplAzNxa3Ca5sSI3x4vxyHeIRBiIFPw4ccvFkZ4HgeNTp7AnM4kS44IQvJFeZsLc2BVRjoLYBwf2QxKqjJ0vGocdcn%2BWsHimWKMmxC46YFBccso9O82tpNBFF72cczr1IycKT5GYfCnwRWNVkA%2FZzzWsjF6BWAPezcBioM8DhyWbZORqnxj8Z38fqanhdsSWor7ZU85jMGp4MAWZIUCMtGxFDnnGhUVEhSglXuUQ5JsMM84Vgp2YYUdW0N76mFNIvAEoGy6l7Fz3OvKHR28tJCjG0uVb%2B6sQWMsnubsfQQE4vRqyzmVQsFe2FHcD81zWQUxXeGFPyIIctNMSlmCXU7PUD9%2BOkkny4s%2BDks6CEWComnuY8AelLpEZyAL%2Bm4ypiSbOfjd6wlCPZHs73pbY0k7e5JGR8vB6gG%2Fsy5DWbzirzf7UEGLYqRGML8mT1jCn2tzUBjqkAaAmTElA2Vh6KswTqTAqPptZZJU3KJay8NySoIB%2FENvIrH%2FCRSy5FvvPANngwDC8OkLAegywmreT0Mh6TX4oMdRlfwiLlgrOifkk1Is2VZAyY9t1TrcpD%2BOkl9E6NNU9nzMQYdmUvIX5TZvbw7o%2BuBU89liV%2FF9ne%2B%2BOSLtyeYB0WnXfa7cTuhnF%2FvBlkAbjf%2FSOs%2BwSika7jrngZYuTipMrvbGn&X-Amz-Signature=89743a7fbe68dc7c09cf28ecc406ec165f12785a0432bec3aeed127c670297a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
