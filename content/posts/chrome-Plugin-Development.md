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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XNWUI46F%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T130658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFbkJUfjiIpbGHbkIMsWcI60pHy5z%2BY0qEdSHg4Oj4ZZAiEAssozc5TRC8i17Gk%2BpvPzRB0e%2F03Nd3Zp%2Bq7mSdSCjPsqiAQItf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHnQlDGq4WaAyo%2FTbCrcA4SUXX6dyFQH85WnOTASuY5ajYPZ4ih%2BnNbPKgPHNLIeiSyOCT6oB8iBxOO14yh8Ua3wM11ylNmjtADoiL2DavAzv53NcR0PeXJ79rs3A5eAM2qdrF8NropsIrohAjMkGwNqz3UmaonGo7YlkcqMnZ5RkAgyQTsu1BR3c8jJRi3vxNSddypLW8VSAfEwSrEbKd6XqBsiQ8lIrm3lndJXTmqtttLEF943ltbTIOFSkVy1I5XFcnvIuumuVmFK6ZZ6bVwXztfbDvo2nhubbhOdcxBmCgGpwAD%2FDAvBHJUo9wjQ0iFM6kcXHflI%2BlU1djdiuAiA2jP8VYlw3AM1sz%2BBEzu63%2F5Y0U37HnH6%2FB1EH9wR4xVeuxIbXdcyUTXFhKNiOCdEl6CR1i4Wfa1baIdh1vTACDhWbKMGE9iWavno7PsjKbMdht%2FC8SaEkcBwlGTJRNGMwnmPODGrJkS3BBPsKp3lfznmXqMdSBNS9rXM0tnojskOtZ55ccK0oerxZna8yW0huFuKIOUl6UzZh5upcsUYvXL6QU%2BW%2BkdQymfeGblfA7GAz%2BjZ1Pqe%2FECnT9fuLN%2FcnkF%2B1mhW%2FKZoMD59Bk5bA7Vh0uxPaN%2BAHe5Q7DwlXPIAA2dh7y8uKgLlMMa95tcGOqUBsZDMJyEUCurmkEg81VxPMCGmvPTCVzQB80q%2B6H3L053p17FgH9RYwjc5%2F2SgFQBMno%2FkM2iJ4syqohnPgg%2BPM7o13aUjqRk7Ps1SJ6rWjE4T1WlBHbUaqQpU%2BuGP9Vke0OsoG0ObVeQ6F72%2BErGwiUL9fg3Yva2ZL0edikah2pV0czzgZclz4xIGKo70DR2DbADcXtobGS0BCLXNi7toYL93Znf5&X-Amz-Signature=6d5e2c142972e95907dc0fe9d622cedd774c354abb850488050b8413fd59e274&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XNWUI46F%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T130658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFbkJUfjiIpbGHbkIMsWcI60pHy5z%2BY0qEdSHg4Oj4ZZAiEAssozc5TRC8i17Gk%2BpvPzRB0e%2F03Nd3Zp%2Bq7mSdSCjPsqiAQItf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHnQlDGq4WaAyo%2FTbCrcA4SUXX6dyFQH85WnOTASuY5ajYPZ4ih%2BnNbPKgPHNLIeiSyOCT6oB8iBxOO14yh8Ua3wM11ylNmjtADoiL2DavAzv53NcR0PeXJ79rs3A5eAM2qdrF8NropsIrohAjMkGwNqz3UmaonGo7YlkcqMnZ5RkAgyQTsu1BR3c8jJRi3vxNSddypLW8VSAfEwSrEbKd6XqBsiQ8lIrm3lndJXTmqtttLEF943ltbTIOFSkVy1I5XFcnvIuumuVmFK6ZZ6bVwXztfbDvo2nhubbhOdcxBmCgGpwAD%2FDAvBHJUo9wjQ0iFM6kcXHflI%2BlU1djdiuAiA2jP8VYlw3AM1sz%2BBEzu63%2F5Y0U37HnH6%2FB1EH9wR4xVeuxIbXdcyUTXFhKNiOCdEl6CR1i4Wfa1baIdh1vTACDhWbKMGE9iWavno7PsjKbMdht%2FC8SaEkcBwlGTJRNGMwnmPODGrJkS3BBPsKp3lfznmXqMdSBNS9rXM0tnojskOtZ55ccK0oerxZna8yW0huFuKIOUl6UzZh5upcsUYvXL6QU%2BW%2BkdQymfeGblfA7GAz%2BjZ1Pqe%2FECnT9fuLN%2FcnkF%2B1mhW%2FKZoMD59Bk5bA7Vh0uxPaN%2BAHe5Q7DwlXPIAA2dh7y8uKgLlMMa95tcGOqUBsZDMJyEUCurmkEg81VxPMCGmvPTCVzQB80q%2B6H3L053p17FgH9RYwjc5%2F2SgFQBMno%2FkM2iJ4syqohnPgg%2BPM7o13aUjqRk7Ps1SJ6rWjE4T1WlBHbUaqQpU%2BuGP9Vke0OsoG0ObVeQ6F72%2BErGwiUL9fg3Yva2ZL0edikah2pV0czzgZclz4xIGKo70DR2DbADcXtobGS0BCLXNi7toYL93Znf5&X-Amz-Signature=6d408c9620410b8649b30243a7f69117ec0c829b1a025b85885148872dbc5df3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XNWUI46F%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T130658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFbkJUfjiIpbGHbkIMsWcI60pHy5z%2BY0qEdSHg4Oj4ZZAiEAssozc5TRC8i17Gk%2BpvPzRB0e%2F03Nd3Zp%2Bq7mSdSCjPsqiAQItf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHnQlDGq4WaAyo%2FTbCrcA4SUXX6dyFQH85WnOTASuY5ajYPZ4ih%2BnNbPKgPHNLIeiSyOCT6oB8iBxOO14yh8Ua3wM11ylNmjtADoiL2DavAzv53NcR0PeXJ79rs3A5eAM2qdrF8NropsIrohAjMkGwNqz3UmaonGo7YlkcqMnZ5RkAgyQTsu1BR3c8jJRi3vxNSddypLW8VSAfEwSrEbKd6XqBsiQ8lIrm3lndJXTmqtttLEF943ltbTIOFSkVy1I5XFcnvIuumuVmFK6ZZ6bVwXztfbDvo2nhubbhOdcxBmCgGpwAD%2FDAvBHJUo9wjQ0iFM6kcXHflI%2BlU1djdiuAiA2jP8VYlw3AM1sz%2BBEzu63%2F5Y0U37HnH6%2FB1EH9wR4xVeuxIbXdcyUTXFhKNiOCdEl6CR1i4Wfa1baIdh1vTACDhWbKMGE9iWavno7PsjKbMdht%2FC8SaEkcBwlGTJRNGMwnmPODGrJkS3BBPsKp3lfznmXqMdSBNS9rXM0tnojskOtZ55ccK0oerxZna8yW0huFuKIOUl6UzZh5upcsUYvXL6QU%2BW%2BkdQymfeGblfA7GAz%2BjZ1Pqe%2FECnT9fuLN%2FcnkF%2B1mhW%2FKZoMD59Bk5bA7Vh0uxPaN%2BAHe5Q7DwlXPIAA2dh7y8uKgLlMMa95tcGOqUBsZDMJyEUCurmkEg81VxPMCGmvPTCVzQB80q%2B6H3L053p17FgH9RYwjc5%2F2SgFQBMno%2FkM2iJ4syqohnPgg%2BPM7o13aUjqRk7Ps1SJ6rWjE4T1WlBHbUaqQpU%2BuGP9Vke0OsoG0ObVeQ6F72%2BErGwiUL9fg3Yva2ZL0edikah2pV0czzgZclz4xIGKo70DR2DbADcXtobGS0BCLXNi7toYL93Znf5&X-Amz-Signature=5e79c8b1e8b5c91c7ddc1f213c9b9de803323d20474b61338650eb038938fb9c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XNWUI46F%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T130658Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFbkJUfjiIpbGHbkIMsWcI60pHy5z%2BY0qEdSHg4Oj4ZZAiEAssozc5TRC8i17Gk%2BpvPzRB0e%2F03Nd3Zp%2Bq7mSdSCjPsqiAQItf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHnQlDGq4WaAyo%2FTbCrcA4SUXX6dyFQH85WnOTASuY5ajYPZ4ih%2BnNbPKgPHNLIeiSyOCT6oB8iBxOO14yh8Ua3wM11ylNmjtADoiL2DavAzv53NcR0PeXJ79rs3A5eAM2qdrF8NropsIrohAjMkGwNqz3UmaonGo7YlkcqMnZ5RkAgyQTsu1BR3c8jJRi3vxNSddypLW8VSAfEwSrEbKd6XqBsiQ8lIrm3lndJXTmqtttLEF943ltbTIOFSkVy1I5XFcnvIuumuVmFK6ZZ6bVwXztfbDvo2nhubbhOdcxBmCgGpwAD%2FDAvBHJUo9wjQ0iFM6kcXHflI%2BlU1djdiuAiA2jP8VYlw3AM1sz%2BBEzu63%2F5Y0U37HnH6%2FB1EH9wR4xVeuxIbXdcyUTXFhKNiOCdEl6CR1i4Wfa1baIdh1vTACDhWbKMGE9iWavno7PsjKbMdht%2FC8SaEkcBwlGTJRNGMwnmPODGrJkS3BBPsKp3lfznmXqMdSBNS9rXM0tnojskOtZ55ccK0oerxZna8yW0huFuKIOUl6UzZh5upcsUYvXL6QU%2BW%2BkdQymfeGblfA7GAz%2BjZ1Pqe%2FECnT9fuLN%2FcnkF%2B1mhW%2FKZoMD59Bk5bA7Vh0uxPaN%2BAHe5Q7DwlXPIAA2dh7y8uKgLlMMa95tcGOqUBsZDMJyEUCurmkEg81VxPMCGmvPTCVzQB80q%2B6H3L053p17FgH9RYwjc5%2F2SgFQBMno%2FkM2iJ4syqohnPgg%2BPM7o13aUjqRk7Ps1SJ6rWjE4T1WlBHbUaqQpU%2BuGP9Vke0OsoG0ObVeQ6F72%2BErGwiUL9fg3Yva2ZL0edikah2pV0czzgZclz4xIGKo70DR2DbADcXtobGS0BCLXNi7toYL93Znf5&X-Amz-Signature=c3494c9f9c6c582d57457c55493f6b9dfbc636f08c390a6aa04bbe646106b6c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
