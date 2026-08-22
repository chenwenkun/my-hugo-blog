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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRBXJKOS%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T062025Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDjYBRzyF29oUfkLYow6UshlR1Qqbf1a6Vtntrqn25kwQIgHQhA809wGJZc%2Fq8H2GUZrhcIvvl%2FzLmVzSoNz8DY520qiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAmJ3Lvjz1Tfl4gdUircA3LIfUZyKRncbl3%2BZv1KXu9E6oj%2BXX7XjS8gg8Td0pHKlh0wmUfsVHtVOSOXApUTyfNpmjO3FvUbV8OnnEzTo54b1VQ42XBlqxStoCtWKCmNXjZO7fvAbSGqMGQJlZoemiWyt%2Fas3er1iBE%2BzH4t%2Bd5WVAKRVWtnC%2BnNrzCEKTCRm4dKxHbUwBzjKbpt84R29f16RNooUO5Uob20odzVwvkXIsGl%2BUvm34CGWV469FYRBsgy4ZDQn4VOW5XTQEIBoHxdFwvZs0%2Bm1SYpUXqFfDbnE%2FtZzGkRthZmovBBgUxUN%2BlZbndIOXJGlq6oJ2vQBfMpsLzOmsOFlYWyVcipL7tEdmi%2BpYGBOAA8%2BvnOBDVOCt6DHCeM8VJcrBScBFTkMhZBAscqT%2F2kWgVKV8HLi0nt5XwSH0GJ%2FlkUK53Gx7qRAB%2BOUAXTEXrlLdexdrzf25X8i7lOFTI6fMEgzwoQnP%2BZafiWsRyMryMDcT%2B6P1HRMNf5vgd1vvMSB9R43K%2FDjg8pn5nEgrchyKvin0xt3kfvnT7EgxX74UE6aaU6NV32tlONr%2BKav89PRRH3050fo6TuhHF1aNm%2BIkDItZoceppob4%2FddnCsuVf7YsoVYIcR4zH20VMbw58232%2ByMMv2pNQGOqUBYQy3zm6C1%2BDQXK0AsPTo0k1uQc%2F%2FUvv0sm7wRTQzhdiyoaVdXLAZsIw9QgVeB1erI5TL2Jjc389KgbvuNrdIN%2BMTynvNSTOCQlM6LD5qwW82B4jazbC2ih1vS02jZ7yhr0yJV%2F8dpLgUbbY8MQPrm7nYUrzqmRwXFlCtXLpplIOICbRsLPMjoJKcReQkWyj48vBYkPrCBRLf6qCHZvQbyRevQgVd&X-Amz-Signature=18d45e86b8b5d1183aa028aeb432ea34389cbff29535006fae0f20d0fa430c79&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRBXJKOS%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T062025Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDjYBRzyF29oUfkLYow6UshlR1Qqbf1a6Vtntrqn25kwQIgHQhA809wGJZc%2Fq8H2GUZrhcIvvl%2FzLmVzSoNz8DY520qiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAmJ3Lvjz1Tfl4gdUircA3LIfUZyKRncbl3%2BZv1KXu9E6oj%2BXX7XjS8gg8Td0pHKlh0wmUfsVHtVOSOXApUTyfNpmjO3FvUbV8OnnEzTo54b1VQ42XBlqxStoCtWKCmNXjZO7fvAbSGqMGQJlZoemiWyt%2Fas3er1iBE%2BzH4t%2Bd5WVAKRVWtnC%2BnNrzCEKTCRm4dKxHbUwBzjKbpt84R29f16RNooUO5Uob20odzVwvkXIsGl%2BUvm34CGWV469FYRBsgy4ZDQn4VOW5XTQEIBoHxdFwvZs0%2Bm1SYpUXqFfDbnE%2FtZzGkRthZmovBBgUxUN%2BlZbndIOXJGlq6oJ2vQBfMpsLzOmsOFlYWyVcipL7tEdmi%2BpYGBOAA8%2BvnOBDVOCt6DHCeM8VJcrBScBFTkMhZBAscqT%2F2kWgVKV8HLi0nt5XwSH0GJ%2FlkUK53Gx7qRAB%2BOUAXTEXrlLdexdrzf25X8i7lOFTI6fMEgzwoQnP%2BZafiWsRyMryMDcT%2B6P1HRMNf5vgd1vvMSB9R43K%2FDjg8pn5nEgrchyKvin0xt3kfvnT7EgxX74UE6aaU6NV32tlONr%2BKav89PRRH3050fo6TuhHF1aNm%2BIkDItZoceppob4%2FddnCsuVf7YsoVYIcR4zH20VMbw58232%2ByMMv2pNQGOqUBYQy3zm6C1%2BDQXK0AsPTo0k1uQc%2F%2FUvv0sm7wRTQzhdiyoaVdXLAZsIw9QgVeB1erI5TL2Jjc389KgbvuNrdIN%2BMTynvNSTOCQlM6LD5qwW82B4jazbC2ih1vS02jZ7yhr0yJV%2F8dpLgUbbY8MQPrm7nYUrzqmRwXFlCtXLpplIOICbRsLPMjoJKcReQkWyj48vBYkPrCBRLf6qCHZvQbyRevQgVd&X-Amz-Signature=adb99871a0e09ce242c26a019dcbd9f2648bef4ea223a14e28bd13f64bbf53ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRBXJKOS%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T062026Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDjYBRzyF29oUfkLYow6UshlR1Qqbf1a6Vtntrqn25kwQIgHQhA809wGJZc%2Fq8H2GUZrhcIvvl%2FzLmVzSoNz8DY520qiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAmJ3Lvjz1Tfl4gdUircA3LIfUZyKRncbl3%2BZv1KXu9E6oj%2BXX7XjS8gg8Td0pHKlh0wmUfsVHtVOSOXApUTyfNpmjO3FvUbV8OnnEzTo54b1VQ42XBlqxStoCtWKCmNXjZO7fvAbSGqMGQJlZoemiWyt%2Fas3er1iBE%2BzH4t%2Bd5WVAKRVWtnC%2BnNrzCEKTCRm4dKxHbUwBzjKbpt84R29f16RNooUO5Uob20odzVwvkXIsGl%2BUvm34CGWV469FYRBsgy4ZDQn4VOW5XTQEIBoHxdFwvZs0%2Bm1SYpUXqFfDbnE%2FtZzGkRthZmovBBgUxUN%2BlZbndIOXJGlq6oJ2vQBfMpsLzOmsOFlYWyVcipL7tEdmi%2BpYGBOAA8%2BvnOBDVOCt6DHCeM8VJcrBScBFTkMhZBAscqT%2F2kWgVKV8HLi0nt5XwSH0GJ%2FlkUK53Gx7qRAB%2BOUAXTEXrlLdexdrzf25X8i7lOFTI6fMEgzwoQnP%2BZafiWsRyMryMDcT%2B6P1HRMNf5vgd1vvMSB9R43K%2FDjg8pn5nEgrchyKvin0xt3kfvnT7EgxX74UE6aaU6NV32tlONr%2BKav89PRRH3050fo6TuhHF1aNm%2BIkDItZoceppob4%2FddnCsuVf7YsoVYIcR4zH20VMbw58232%2ByMMv2pNQGOqUBYQy3zm6C1%2BDQXK0AsPTo0k1uQc%2F%2FUvv0sm7wRTQzhdiyoaVdXLAZsIw9QgVeB1erI5TL2Jjc389KgbvuNrdIN%2BMTynvNSTOCQlM6LD5qwW82B4jazbC2ih1vS02jZ7yhr0yJV%2F8dpLgUbbY8MQPrm7nYUrzqmRwXFlCtXLpplIOICbRsLPMjoJKcReQkWyj48vBYkPrCBRLf6qCHZvQbyRevQgVd&X-Amz-Signature=50fd8ed80b45b0c4c1cb5edd5a9f954a20db950abbe4bdff1e92780307af1b67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WRBXJKOS%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T062026Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDjYBRzyF29oUfkLYow6UshlR1Qqbf1a6Vtntrqn25kwQIgHQhA809wGJZc%2Fq8H2GUZrhcIvvl%2FzLmVzSoNz8DY520qiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDAmJ3Lvjz1Tfl4gdUircA3LIfUZyKRncbl3%2BZv1KXu9E6oj%2BXX7XjS8gg8Td0pHKlh0wmUfsVHtVOSOXApUTyfNpmjO3FvUbV8OnnEzTo54b1VQ42XBlqxStoCtWKCmNXjZO7fvAbSGqMGQJlZoemiWyt%2Fas3er1iBE%2BzH4t%2Bd5WVAKRVWtnC%2BnNrzCEKTCRm4dKxHbUwBzjKbpt84R29f16RNooUO5Uob20odzVwvkXIsGl%2BUvm34CGWV469FYRBsgy4ZDQn4VOW5XTQEIBoHxdFwvZs0%2Bm1SYpUXqFfDbnE%2FtZzGkRthZmovBBgUxUN%2BlZbndIOXJGlq6oJ2vQBfMpsLzOmsOFlYWyVcipL7tEdmi%2BpYGBOAA8%2BvnOBDVOCt6DHCeM8VJcrBScBFTkMhZBAscqT%2F2kWgVKV8HLi0nt5XwSH0GJ%2FlkUK53Gx7qRAB%2BOUAXTEXrlLdexdrzf25X8i7lOFTI6fMEgzwoQnP%2BZafiWsRyMryMDcT%2B6P1HRMNf5vgd1vvMSB9R43K%2FDjg8pn5nEgrchyKvin0xt3kfvnT7EgxX74UE6aaU6NV32tlONr%2BKav89PRRH3050fo6TuhHF1aNm%2BIkDItZoceppob4%2FddnCsuVf7YsoVYIcR4zH20VMbw58232%2ByMMv2pNQGOqUBYQy3zm6C1%2BDQXK0AsPTo0k1uQc%2F%2FUvv0sm7wRTQzhdiyoaVdXLAZsIw9QgVeB1erI5TL2Jjc389KgbvuNrdIN%2BMTynvNSTOCQlM6LD5qwW82B4jazbC2ih1vS02jZ7yhr0yJV%2F8dpLgUbbY8MQPrm7nYUrzqmRwXFlCtXLpplIOICbRsLPMjoJKcReQkWyj48vBYkPrCBRLf6qCHZvQbyRevQgVd&X-Amz-Signature=20f013d3c45d2d935af0686cbb15d3f4ddbced68dda32930aa541e19abdf04b4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
