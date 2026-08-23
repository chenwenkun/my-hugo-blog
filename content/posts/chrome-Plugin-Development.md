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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZSU56O7K%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T062152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIHq4ejZ1lBXDULb%2BE0GFEF8IaQfD6M3nileBJU%2BU56CKAiAoukdQFE9X6WI8lg3YjSxXpZs3GBvX%2B03R5A4kL%2Fy07iqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMPkk8eIK6k%2F7KZNBYKtwD3IcM1%2FblUFbv5gHdVpzlSPcmEsWSZpk%2FjTBEWMI%2BcUlzKLUIlNSL45Q9usKB6JfGDQDncVifNx4am8BHKBfAgQ3b%2F1Y0%2BIfuABSppaVwPOgXg983O93t28b%2BPJfY%2FJOTypiVSQVjY9UdIuHL71ust4sjd27LzUYP9xRXkXN1mrAOlpuldMjpWIXEdziO1RhkNVgkairCw7VB5zERkv1W69lSRRQiUhlfDvORPZMBx1M1CIQohrezYxs33NRhJGvcHxFAJHrOi1bqTbEQo3iftuRHmcuU7RWDBK8rWxX%2F8VrOd7iPJIPf7S6kmioyuCuLnFvgwGibsxFiafX%2Fal33RFj5weKnvAlYeDrYpbfC8mZh1fos7TSRfCQ5Lwy7MBQiXqvt%2FFxzvqGJFnttv%2BR2XLLdxogHN5dxnNvFJbsfSuPujbv65XabgAeNi6llfLMHjMYTc0MQXQH8s3lOrJok6OXFhE9TxljWN%2BJvSNUhlHzXxyS7LhUYrbKnl1WzM6GiacWHWu5geGpsCvwCk6ND39Je7G%2B%2Bi4UOL8CMnJc5aF1J3bkz9N79CKqhTepp%2Be%2F345AGzaQdiqGzS6CMCjAJ%2FiyVP951iqU3ms1Hsud4WYRqWvrIBn%2BXEPl9jT4wibip1AY6pgEbYI3aPmCsdmoxmiGeU1icFMq1vzdGA0s8uMXcPKm1dwMFHzNDmw1D6UxP0GPWYLWPSwGvrsOeFlHDoO2ZWd%2BwVvSJt3G%2FqHB%2B3ZuJcT3QXi6kVIbjy6MlWYeRhvNXnxIS%2Fa%2B%2FzVS6xexLjoqzHBcdyrCodWK8oocuhl3wyL5q7QR6fbiGXTODRkSbG1FAtYbfKRMu2GhsBV1aKOU2R%2FFgwGtG%2Bxuu&X-Amz-Signature=bb11acb6c5ff2872bcd78143295679896353057a78fd438e80850c2deac7e242&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZSU56O7K%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T062152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIHq4ejZ1lBXDULb%2BE0GFEF8IaQfD6M3nileBJU%2BU56CKAiAoukdQFE9X6WI8lg3YjSxXpZs3GBvX%2B03R5A4kL%2Fy07iqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMPkk8eIK6k%2F7KZNBYKtwD3IcM1%2FblUFbv5gHdVpzlSPcmEsWSZpk%2FjTBEWMI%2BcUlzKLUIlNSL45Q9usKB6JfGDQDncVifNx4am8BHKBfAgQ3b%2F1Y0%2BIfuABSppaVwPOgXg983O93t28b%2BPJfY%2FJOTypiVSQVjY9UdIuHL71ust4sjd27LzUYP9xRXkXN1mrAOlpuldMjpWIXEdziO1RhkNVgkairCw7VB5zERkv1W69lSRRQiUhlfDvORPZMBx1M1CIQohrezYxs33NRhJGvcHxFAJHrOi1bqTbEQo3iftuRHmcuU7RWDBK8rWxX%2F8VrOd7iPJIPf7S6kmioyuCuLnFvgwGibsxFiafX%2Fal33RFj5weKnvAlYeDrYpbfC8mZh1fos7TSRfCQ5Lwy7MBQiXqvt%2FFxzvqGJFnttv%2BR2XLLdxogHN5dxnNvFJbsfSuPujbv65XabgAeNi6llfLMHjMYTc0MQXQH8s3lOrJok6OXFhE9TxljWN%2BJvSNUhlHzXxyS7LhUYrbKnl1WzM6GiacWHWu5geGpsCvwCk6ND39Je7G%2B%2Bi4UOL8CMnJc5aF1J3bkz9N79CKqhTepp%2Be%2F345AGzaQdiqGzS6CMCjAJ%2FiyVP951iqU3ms1Hsud4WYRqWvrIBn%2BXEPl9jT4wibip1AY6pgEbYI3aPmCsdmoxmiGeU1icFMq1vzdGA0s8uMXcPKm1dwMFHzNDmw1D6UxP0GPWYLWPSwGvrsOeFlHDoO2ZWd%2BwVvSJt3G%2FqHB%2B3ZuJcT3QXi6kVIbjy6MlWYeRhvNXnxIS%2Fa%2B%2FzVS6xexLjoqzHBcdyrCodWK8oocuhl3wyL5q7QR6fbiGXTODRkSbG1FAtYbfKRMu2GhsBV1aKOU2R%2FFgwGtG%2Bxuu&X-Amz-Signature=cd44555a7662fcdf388e4fe6abfb111c80371e9cdc87cf9eecff0f77f8d61f3e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZSU56O7K%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T062152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIHq4ejZ1lBXDULb%2BE0GFEF8IaQfD6M3nileBJU%2BU56CKAiAoukdQFE9X6WI8lg3YjSxXpZs3GBvX%2B03R5A4kL%2Fy07iqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMPkk8eIK6k%2F7KZNBYKtwD3IcM1%2FblUFbv5gHdVpzlSPcmEsWSZpk%2FjTBEWMI%2BcUlzKLUIlNSL45Q9usKB6JfGDQDncVifNx4am8BHKBfAgQ3b%2F1Y0%2BIfuABSppaVwPOgXg983O93t28b%2BPJfY%2FJOTypiVSQVjY9UdIuHL71ust4sjd27LzUYP9xRXkXN1mrAOlpuldMjpWIXEdziO1RhkNVgkairCw7VB5zERkv1W69lSRRQiUhlfDvORPZMBx1M1CIQohrezYxs33NRhJGvcHxFAJHrOi1bqTbEQo3iftuRHmcuU7RWDBK8rWxX%2F8VrOd7iPJIPf7S6kmioyuCuLnFvgwGibsxFiafX%2Fal33RFj5weKnvAlYeDrYpbfC8mZh1fos7TSRfCQ5Lwy7MBQiXqvt%2FFxzvqGJFnttv%2BR2XLLdxogHN5dxnNvFJbsfSuPujbv65XabgAeNi6llfLMHjMYTc0MQXQH8s3lOrJok6OXFhE9TxljWN%2BJvSNUhlHzXxyS7LhUYrbKnl1WzM6GiacWHWu5geGpsCvwCk6ND39Je7G%2B%2Bi4UOL8CMnJc5aF1J3bkz9N79CKqhTepp%2Be%2F345AGzaQdiqGzS6CMCjAJ%2FiyVP951iqU3ms1Hsud4WYRqWvrIBn%2BXEPl9jT4wibip1AY6pgEbYI3aPmCsdmoxmiGeU1icFMq1vzdGA0s8uMXcPKm1dwMFHzNDmw1D6UxP0GPWYLWPSwGvrsOeFlHDoO2ZWd%2BwVvSJt3G%2FqHB%2B3ZuJcT3QXi6kVIbjy6MlWYeRhvNXnxIS%2Fa%2B%2FzVS6xexLjoqzHBcdyrCodWK8oocuhl3wyL5q7QR6fbiGXTODRkSbG1FAtYbfKRMu2GhsBV1aKOU2R%2FFgwGtG%2Bxuu&X-Amz-Signature=7a8129b34cbac04e561b194cb11886661e7b60139380e2dddd6f3331b83ba6f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZSU56O7K%2F20260823%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260823T062152Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJGMEQCIHq4ejZ1lBXDULb%2BE0GFEF8IaQfD6M3nileBJU%2BU56CKAiAoukdQFE9X6WI8lg3YjSxXpZs3GBvX%2B03R5A4kL%2Fy07iqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMPkk8eIK6k%2F7KZNBYKtwD3IcM1%2FblUFbv5gHdVpzlSPcmEsWSZpk%2FjTBEWMI%2BcUlzKLUIlNSL45Q9usKB6JfGDQDncVifNx4am8BHKBfAgQ3b%2F1Y0%2BIfuABSppaVwPOgXg983O93t28b%2BPJfY%2FJOTypiVSQVjY9UdIuHL71ust4sjd27LzUYP9xRXkXN1mrAOlpuldMjpWIXEdziO1RhkNVgkairCw7VB5zERkv1W69lSRRQiUhlfDvORPZMBx1M1CIQohrezYxs33NRhJGvcHxFAJHrOi1bqTbEQo3iftuRHmcuU7RWDBK8rWxX%2F8VrOd7iPJIPf7S6kmioyuCuLnFvgwGibsxFiafX%2Fal33RFj5weKnvAlYeDrYpbfC8mZh1fos7TSRfCQ5Lwy7MBQiXqvt%2FFxzvqGJFnttv%2BR2XLLdxogHN5dxnNvFJbsfSuPujbv65XabgAeNi6llfLMHjMYTc0MQXQH8s3lOrJok6OXFhE9TxljWN%2BJvSNUhlHzXxyS7LhUYrbKnl1WzM6GiacWHWu5geGpsCvwCk6ND39Je7G%2B%2Bi4UOL8CMnJc5aF1J3bkz9N79CKqhTepp%2Be%2F345AGzaQdiqGzS6CMCjAJ%2FiyVP951iqU3ms1Hsud4WYRqWvrIBn%2BXEPl9jT4wibip1AY6pgEbYI3aPmCsdmoxmiGeU1icFMq1vzdGA0s8uMXcPKm1dwMFHzNDmw1D6UxP0GPWYLWPSwGvrsOeFlHDoO2ZWd%2BwVvSJt3G%2FqHB%2B3ZuJcT3QXi6kVIbjy6MlWYeRhvNXnxIS%2Fa%2B%2FzVS6xexLjoqzHBcdyrCodWK8oocuhl3wyL5q7QR6fbiGXTODRkSbG1FAtYbfKRMu2GhsBV1aKOU2R%2FFgwGtG%2Bxuu&X-Amz-Signature=7279ea43d022fff663779219c40a7296b17990e19d4d96b5d75e707749cdffc7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
