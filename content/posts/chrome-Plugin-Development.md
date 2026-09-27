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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6LE2AB7%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T022555Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIQC9rqO%2FlltfFhoWsiQ8yUhNs4siD%2BehCe2SfaE1D%2FgGsAIgNt6VkqdbcaesQYucLnj0aY%2BTVbmomHprtN7G%2BCkMQ4Yq%2FwMIEBAAGgw2Mzc0MjMxODM4MDUiDKKnxHrIfiQXrFYPnircA3YsujMJsepOsoWfKS63CpsyJ3THkMRTh%2FSIOB%2F0A%2FsU8POe%2BOIZcEDn%2FS2wymRQ2iziBlZXrEVZjoGUpT8nQEqvv9KqBxA%2BY9PCwuk2vCGASjk7VNDStyFC%2FQla6iXadV8d8ZK%2FYTJ5Y6Hj2LHDGV8%2F%2FFAU9AYaBjo4XPY7sgTW32TCqQhyuNgYyNVemcfR8JgxxBU3z3UHN6r8J4%2FctAiq8wlTavsIwSHiZ0hdEsNTSF%2BtpAlHphPzEsTarh6TdV7n93SPas%2FmRA894jT3s%2Fties2wYdeRWs2R9bejosOiG065DnIm6aTrbLUxxRInBoLQPqupnG%2BYCccmQtbxj8SA160fzEiJHWIf6kIzSET9bLU9Fh5u%2FU19JSASw24H79GG%2BSu19Q8aFK40tLmxjka920rpiEYv0WJyajKkNax0Xg63O30TZTFe0u0cLwlZY6RrptGDyxstVf1YIpzU1dUjP60%2FHK7FUDigZSqqHUILtdlKuGbbtjW1%2ByrrQjhE5zUUlj61Ku3VENKK3rkFHS6rEP5LRLsniga7DIR3mjNaM3FGwUAfyCGIVovU%2F3C5srHRVhIlcb6%2FfRuBrY9Z7gvSjD5Q0KjW6D2nAR9DaZvZvCRbwGfQlhJUgwMHMPOl4dUGOqUBKgBKhCIKZO7PF7gicmV9DlOhhR2M2BjDaxX9n97j2PE3Yfq4gbE23E4jFeEJd%2FVfwCVLm9v%2F6%2FtrcPpZk9%2BD4Rd%2F5J2P6GW58YL%2FXS1OxUI8%2FrxrnhD12HqRfvc0zUBSA0mHpwMtXxZFXoVBpHJYxsOSSw7x6Zhxo%2BvcN6riB9grvA8ZGjyMdPS%2Fosdu%2BamWDujci5uIC9l1zZLItkh%2FptujRnRI&X-Amz-Signature=b3843957432793e233c34a0923c16d2078e8abe77ec0739e34c3095583e6f8f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6LE2AB7%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T022555Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIQC9rqO%2FlltfFhoWsiQ8yUhNs4siD%2BehCe2SfaE1D%2FgGsAIgNt6VkqdbcaesQYucLnj0aY%2BTVbmomHprtN7G%2BCkMQ4Yq%2FwMIEBAAGgw2Mzc0MjMxODM4MDUiDKKnxHrIfiQXrFYPnircA3YsujMJsepOsoWfKS63CpsyJ3THkMRTh%2FSIOB%2F0A%2FsU8POe%2BOIZcEDn%2FS2wymRQ2iziBlZXrEVZjoGUpT8nQEqvv9KqBxA%2BY9PCwuk2vCGASjk7VNDStyFC%2FQla6iXadV8d8ZK%2FYTJ5Y6Hj2LHDGV8%2F%2FFAU9AYaBjo4XPY7sgTW32TCqQhyuNgYyNVemcfR8JgxxBU3z3UHN6r8J4%2FctAiq8wlTavsIwSHiZ0hdEsNTSF%2BtpAlHphPzEsTarh6TdV7n93SPas%2FmRA894jT3s%2Fties2wYdeRWs2R9bejosOiG065DnIm6aTrbLUxxRInBoLQPqupnG%2BYCccmQtbxj8SA160fzEiJHWIf6kIzSET9bLU9Fh5u%2FU19JSASw24H79GG%2BSu19Q8aFK40tLmxjka920rpiEYv0WJyajKkNax0Xg63O30TZTFe0u0cLwlZY6RrptGDyxstVf1YIpzU1dUjP60%2FHK7FUDigZSqqHUILtdlKuGbbtjW1%2ByrrQjhE5zUUlj61Ku3VENKK3rkFHS6rEP5LRLsniga7DIR3mjNaM3FGwUAfyCGIVovU%2F3C5srHRVhIlcb6%2FfRuBrY9Z7gvSjD5Q0KjW6D2nAR9DaZvZvCRbwGfQlhJUgwMHMPOl4dUGOqUBKgBKhCIKZO7PF7gicmV9DlOhhR2M2BjDaxX9n97j2PE3Yfq4gbE23E4jFeEJd%2FVfwCVLm9v%2F6%2FtrcPpZk9%2BD4Rd%2F5J2P6GW58YL%2FXS1OxUI8%2FrxrnhD12HqRfvc0zUBSA0mHpwMtXxZFXoVBpHJYxsOSSw7x6Zhxo%2BvcN6riB9grvA8ZGjyMdPS%2Fosdu%2BamWDujci5uIC9l1zZLItkh%2FptujRnRI&X-Amz-Signature=43e0a0e60c59e58e03366145e173d38a3daa34f8e590e770982fb5694bae9473&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6LE2AB7%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T022555Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIQC9rqO%2FlltfFhoWsiQ8yUhNs4siD%2BehCe2SfaE1D%2FgGsAIgNt6VkqdbcaesQYucLnj0aY%2BTVbmomHprtN7G%2BCkMQ4Yq%2FwMIEBAAGgw2Mzc0MjMxODM4MDUiDKKnxHrIfiQXrFYPnircA3YsujMJsepOsoWfKS63CpsyJ3THkMRTh%2FSIOB%2F0A%2FsU8POe%2BOIZcEDn%2FS2wymRQ2iziBlZXrEVZjoGUpT8nQEqvv9KqBxA%2BY9PCwuk2vCGASjk7VNDStyFC%2FQla6iXadV8d8ZK%2FYTJ5Y6Hj2LHDGV8%2F%2FFAU9AYaBjo4XPY7sgTW32TCqQhyuNgYyNVemcfR8JgxxBU3z3UHN6r8J4%2FctAiq8wlTavsIwSHiZ0hdEsNTSF%2BtpAlHphPzEsTarh6TdV7n93SPas%2FmRA894jT3s%2Fties2wYdeRWs2R9bejosOiG065DnIm6aTrbLUxxRInBoLQPqupnG%2BYCccmQtbxj8SA160fzEiJHWIf6kIzSET9bLU9Fh5u%2FU19JSASw24H79GG%2BSu19Q8aFK40tLmxjka920rpiEYv0WJyajKkNax0Xg63O30TZTFe0u0cLwlZY6RrptGDyxstVf1YIpzU1dUjP60%2FHK7FUDigZSqqHUILtdlKuGbbtjW1%2ByrrQjhE5zUUlj61Ku3VENKK3rkFHS6rEP5LRLsniga7DIR3mjNaM3FGwUAfyCGIVovU%2F3C5srHRVhIlcb6%2FfRuBrY9Z7gvSjD5Q0KjW6D2nAR9DaZvZvCRbwGfQlhJUgwMHMPOl4dUGOqUBKgBKhCIKZO7PF7gicmV9DlOhhR2M2BjDaxX9n97j2PE3Yfq4gbE23E4jFeEJd%2FVfwCVLm9v%2F6%2FtrcPpZk9%2BD4Rd%2F5J2P6GW58YL%2FXS1OxUI8%2FrxrnhD12HqRfvc0zUBSA0mHpwMtXxZFXoVBpHJYxsOSSw7x6Zhxo%2BvcN6riB9grvA8ZGjyMdPS%2Fosdu%2BamWDujci5uIC9l1zZLItkh%2FptujRnRI&X-Amz-Signature=28feb335c626e314f1d4dd0ff6f6c78696b5f97f84e579d51999bda43ce7a10b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W6LE2AB7%2F20260927%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260927T022555Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEgaCXVzLXdlc3QtMiJHMEUCIQC9rqO%2FlltfFhoWsiQ8yUhNs4siD%2BehCe2SfaE1D%2FgGsAIgNt6VkqdbcaesQYucLnj0aY%2BTVbmomHprtN7G%2BCkMQ4Yq%2FwMIEBAAGgw2Mzc0MjMxODM4MDUiDKKnxHrIfiQXrFYPnircA3YsujMJsepOsoWfKS63CpsyJ3THkMRTh%2FSIOB%2F0A%2FsU8POe%2BOIZcEDn%2FS2wymRQ2iziBlZXrEVZjoGUpT8nQEqvv9KqBxA%2BY9PCwuk2vCGASjk7VNDStyFC%2FQla6iXadV8d8ZK%2FYTJ5Y6Hj2LHDGV8%2F%2FFAU9AYaBjo4XPY7sgTW32TCqQhyuNgYyNVemcfR8JgxxBU3z3UHN6r8J4%2FctAiq8wlTavsIwSHiZ0hdEsNTSF%2BtpAlHphPzEsTarh6TdV7n93SPas%2FmRA894jT3s%2Fties2wYdeRWs2R9bejosOiG065DnIm6aTrbLUxxRInBoLQPqupnG%2BYCccmQtbxj8SA160fzEiJHWIf6kIzSET9bLU9Fh5u%2FU19JSASw24H79GG%2BSu19Q8aFK40tLmxjka920rpiEYv0WJyajKkNax0Xg63O30TZTFe0u0cLwlZY6RrptGDyxstVf1YIpzU1dUjP60%2FHK7FUDigZSqqHUILtdlKuGbbtjW1%2ByrrQjhE5zUUlj61Ku3VENKK3rkFHS6rEP5LRLsniga7DIR3mjNaM3FGwUAfyCGIVovU%2F3C5srHRVhIlcb6%2FfRuBrY9Z7gvSjD5Q0KjW6D2nAR9DaZvZvCRbwGfQlhJUgwMHMPOl4dUGOqUBKgBKhCIKZO7PF7gicmV9DlOhhR2M2BjDaxX9n97j2PE3Yfq4gbE23E4jFeEJd%2FVfwCVLm9v%2F6%2FtrcPpZk9%2BD4Rd%2F5J2P6GW58YL%2FXS1OxUI8%2FrxrnhD12HqRfvc0zUBSA0mHpwMtXxZFXoVBpHJYxsOSSw7x6Zhxo%2BvcN6riB9grvA8ZGjyMdPS%2Fosdu%2BamWDujci5uIC9l1zZLItkh%2FptujRnRI&X-Amz-Signature=dab730890a176999109591d0789efa6aa683f9c2cdb97b39ecf4860bd243c117&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
