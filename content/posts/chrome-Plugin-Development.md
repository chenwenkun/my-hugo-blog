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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XX53IEYE%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T214712Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDatdI2IhYPtRNpuNzXEh7lCV5%2FhB87SAy8fZePjNCNdAIgerVkZgqAmjM5WZl1huQ15ydtQrCLfGSiuL%2BviLBfaI8qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDhMwm7nKJN2YIZSCyrcA8vXHqYFYcGVSvqQZZWeOlmZlNhiiU%2FvC3FuBY0DoKnT%2FS66dShrTYvhpzSvZzp9FYiMom0ETMPNYc9pudSqxRWbEHH%2B4kCmu0hSr2urtI%2F6UYOb5lNhSIaJjtBDD1V5b4bvKUKp%2BO1H07o02qVZYhHsySxVuvKGZPhptrbv75YHd97sMxvUFGEN0hqK3ImuyWrYTUkAZGFe47LOq5knC5G35n8%2FGEPJ2gPzrKBgiFlvUOxYqFw16E3Tek4Bwfx37w0VwqAtQKfZ7nL%2FkGSjVuGhb32arYrTFQjfJvHw9Jv3OvL%2Fhf3NVa3RhEfmqGnDAr1whCs%2B%2Fxl7H6cgcvjcUld9uPMDLq6AaeucYMaP3ys4ZBPwc9%2B9fBO6DrBdPcHzyaRTiYoRF5HrlUniXnAy5xuC7vrBQ5OhA2ys1Qj8N56RjzPM%2FdWIgMZLfZ784U0TW9B2f58hkozSAa0qZfYW%2FieUkTxyqwRb0aDvCo1lcm7b8aqOMoqXr%2F9P9dK7QtB3nwA8MF95V%2Fh5dfOgLawBMbXrXR8P5m4HfujP5TT3dAJys9C0vF%2FpfOSBhkmhXbIfr%2FR7EI18O3mmYbwFgTXgZcLSeljE2Ypd1g%2BNNbuOFTKjSZBniFfKoac%2B99GHML%2Bi49cGOqUB7PLOYIphNfHPVvRFHxLdqWklXX6R6jmGwGhhgcL9PNSITVuasai%2BGaB1fyaeDWmk2mMPOabZmbrTA8dT%2F8lqpSKsEUYyFQ0t68CfTpD793DVdQVpnTKlddSt1h5MbChS22y286q7qDgdgXzeGbBtpMh2jeU3E9scVcNINelzcCCeCS9lQlvuzDpDU%2BU1YT14aZdMg%2FqU8sh%2B%2BUhfmq4jP7JgS8Kz&X-Amz-Signature=78a3a2ff8f0d870dde76de33de09965a66f474dbb93f15c1f7416743c2d52df1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XX53IEYE%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T214712Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDatdI2IhYPtRNpuNzXEh7lCV5%2FhB87SAy8fZePjNCNdAIgerVkZgqAmjM5WZl1huQ15ydtQrCLfGSiuL%2BviLBfaI8qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDhMwm7nKJN2YIZSCyrcA8vXHqYFYcGVSvqQZZWeOlmZlNhiiU%2FvC3FuBY0DoKnT%2FS66dShrTYvhpzSvZzp9FYiMom0ETMPNYc9pudSqxRWbEHH%2B4kCmu0hSr2urtI%2F6UYOb5lNhSIaJjtBDD1V5b4bvKUKp%2BO1H07o02qVZYhHsySxVuvKGZPhptrbv75YHd97sMxvUFGEN0hqK3ImuyWrYTUkAZGFe47LOq5knC5G35n8%2FGEPJ2gPzrKBgiFlvUOxYqFw16E3Tek4Bwfx37w0VwqAtQKfZ7nL%2FkGSjVuGhb32arYrTFQjfJvHw9Jv3OvL%2Fhf3NVa3RhEfmqGnDAr1whCs%2B%2Fxl7H6cgcvjcUld9uPMDLq6AaeucYMaP3ys4ZBPwc9%2B9fBO6DrBdPcHzyaRTiYoRF5HrlUniXnAy5xuC7vrBQ5OhA2ys1Qj8N56RjzPM%2FdWIgMZLfZ784U0TW9B2f58hkozSAa0qZfYW%2FieUkTxyqwRb0aDvCo1lcm7b8aqOMoqXr%2F9P9dK7QtB3nwA8MF95V%2Fh5dfOgLawBMbXrXR8P5m4HfujP5TT3dAJys9C0vF%2FpfOSBhkmhXbIfr%2FR7EI18O3mmYbwFgTXgZcLSeljE2Ypd1g%2BNNbuOFTKjSZBniFfKoac%2B99GHML%2Bi49cGOqUB7PLOYIphNfHPVvRFHxLdqWklXX6R6jmGwGhhgcL9PNSITVuasai%2BGaB1fyaeDWmk2mMPOabZmbrTA8dT%2F8lqpSKsEUYyFQ0t68CfTpD793DVdQVpnTKlddSt1h5MbChS22y286q7qDgdgXzeGbBtpMh2jeU3E9scVcNINelzcCCeCS9lQlvuzDpDU%2BU1YT14aZdMg%2FqU8sh%2B%2BUhfmq4jP7JgS8Kz&X-Amz-Signature=e30f38d0e5f85a5e92fbe9a8da9ec1f5d2e587d20186397e032dfa8f9e9bc52a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XX53IEYE%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T214712Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDatdI2IhYPtRNpuNzXEh7lCV5%2FhB87SAy8fZePjNCNdAIgerVkZgqAmjM5WZl1huQ15ydtQrCLfGSiuL%2BviLBfaI8qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDhMwm7nKJN2YIZSCyrcA8vXHqYFYcGVSvqQZZWeOlmZlNhiiU%2FvC3FuBY0DoKnT%2FS66dShrTYvhpzSvZzp9FYiMom0ETMPNYc9pudSqxRWbEHH%2B4kCmu0hSr2urtI%2F6UYOb5lNhSIaJjtBDD1V5b4bvKUKp%2BO1H07o02qVZYhHsySxVuvKGZPhptrbv75YHd97sMxvUFGEN0hqK3ImuyWrYTUkAZGFe47LOq5knC5G35n8%2FGEPJ2gPzrKBgiFlvUOxYqFw16E3Tek4Bwfx37w0VwqAtQKfZ7nL%2FkGSjVuGhb32arYrTFQjfJvHw9Jv3OvL%2Fhf3NVa3RhEfmqGnDAr1whCs%2B%2Fxl7H6cgcvjcUld9uPMDLq6AaeucYMaP3ys4ZBPwc9%2B9fBO6DrBdPcHzyaRTiYoRF5HrlUniXnAy5xuC7vrBQ5OhA2ys1Qj8N56RjzPM%2FdWIgMZLfZ784U0TW9B2f58hkozSAa0qZfYW%2FieUkTxyqwRb0aDvCo1lcm7b8aqOMoqXr%2F9P9dK7QtB3nwA8MF95V%2Fh5dfOgLawBMbXrXR8P5m4HfujP5TT3dAJys9C0vF%2FpfOSBhkmhXbIfr%2FR7EI18O3mmYbwFgTXgZcLSeljE2Ypd1g%2BNNbuOFTKjSZBniFfKoac%2B99GHML%2Bi49cGOqUB7PLOYIphNfHPVvRFHxLdqWklXX6R6jmGwGhhgcL9PNSITVuasai%2BGaB1fyaeDWmk2mMPOabZmbrTA8dT%2F8lqpSKsEUYyFQ0t68CfTpD793DVdQVpnTKlddSt1h5MbChS22y286q7qDgdgXzeGbBtpMh2jeU3E9scVcNINelzcCCeCS9lQlvuzDpDU%2BU1YT14aZdMg%2FqU8sh%2B%2BUhfmq4jP7JgS8Kz&X-Amz-Signature=3eba97062176a5ff1fc9b27d6f9a92312e6367d6a360b7af904d4b3cd9f08ca7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XX53IEYE%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T214712Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDatdI2IhYPtRNpuNzXEh7lCV5%2FhB87SAy8fZePjNCNdAIgerVkZgqAmjM5WZl1huQ15ydtQrCLfGSiuL%2BviLBfaI8qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDhMwm7nKJN2YIZSCyrcA8vXHqYFYcGVSvqQZZWeOlmZlNhiiU%2FvC3FuBY0DoKnT%2FS66dShrTYvhpzSvZzp9FYiMom0ETMPNYc9pudSqxRWbEHH%2B4kCmu0hSr2urtI%2F6UYOb5lNhSIaJjtBDD1V5b4bvKUKp%2BO1H07o02qVZYhHsySxVuvKGZPhptrbv75YHd97sMxvUFGEN0hqK3ImuyWrYTUkAZGFe47LOq5knC5G35n8%2FGEPJ2gPzrKBgiFlvUOxYqFw16E3Tek4Bwfx37w0VwqAtQKfZ7nL%2FkGSjVuGhb32arYrTFQjfJvHw9Jv3OvL%2Fhf3NVa3RhEfmqGnDAr1whCs%2B%2Fxl7H6cgcvjcUld9uPMDLq6AaeucYMaP3ys4ZBPwc9%2B9fBO6DrBdPcHzyaRTiYoRF5HrlUniXnAy5xuC7vrBQ5OhA2ys1Qj8N56RjzPM%2FdWIgMZLfZ784U0TW9B2f58hkozSAa0qZfYW%2FieUkTxyqwRb0aDvCo1lcm7b8aqOMoqXr%2F9P9dK7QtB3nwA8MF95V%2Fh5dfOgLawBMbXrXR8P5m4HfujP5TT3dAJys9C0vF%2FpfOSBhkmhXbIfr%2FR7EI18O3mmYbwFgTXgZcLSeljE2Ypd1g%2BNNbuOFTKjSZBniFfKoac%2B99GHML%2Bi49cGOqUB7PLOYIphNfHPVvRFHxLdqWklXX6R6jmGwGhhgcL9PNSITVuasai%2BGaB1fyaeDWmk2mMPOabZmbrTA8dT%2F8lqpSKsEUYyFQ0t68CfTpD793DVdQVpnTKlddSt1h5MbChS22y286q7qDgdgXzeGbBtpMh2jeU3E9scVcNINelzcCCeCS9lQlvuzDpDU%2BU1YT14aZdMg%2FqU8sh%2B%2BUhfmq4jP7JgS8Kz&X-Amz-Signature=e631fe78770fa027258336adbc0b460a50f84acb8c2b31248dd7dc4af118d7e4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
