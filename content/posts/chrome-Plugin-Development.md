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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UVN5UGVB%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T181244Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQC63zB%2FoX%2BHFNd%2FxuO%2BiZW5CgwQZt9Sco3DYd5%2FIq1FfgIgDWgELuFS55DEMfOyjPFv6kPvyDZnHMcCSx9cJ8p7DG8q%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDCcQ8Jtpk%2FvQFcTtMircA6zWzX7utzsr8pitenW11eIXbO2XMvdwWrng9VDzlHPSR9%2BJEUAjW6hQhRxNwAGR2wXOeY%2FITzhQjB%2B%2BRYMNQEArA0jFrpcYaEgd6EqfRqdHglED%2B9yb7PGk4d14aaGLf3vPHSB%2F9UtEB65wqPOrx563FcfAYd%2BxxkRQibgv5jCUUYSNGxDeiicnQdN8f0DrcKmI0CTMm8g9AVSM3ywoL%2BgAckTNG9IkX30j7x1v0p3BhxOnYhs7cBgAXFEGJtG%2FYFLyjXptHYRDS3myYwHj2oWnavnnvS9KazqEndmej3%2FvCWIj%2B2%2FCR8hcuEgmYb71YmGL8jekeiw8CFXhW6FrdXm%2B4%2F%2BI2CFa6amlOo6yfBr7%2BzVbdD2DdCFultsPCaB%2BSW9o9WIkpi%2F6uBYXe3%2FqJJtaBSqcMsdZ90WKIaU7Y6RcTAUlw%2Fis0Ff%2FL181ZkZ%2FG%2FahHpURb1Ly9w8ET3uBmpeY0GwT6Qot7aNQbDfrhol0BEQkyC0%2Fb%2FiRTofQzSD7%2FkW7V%2Bb%2BQ%2FN382uoFxADkvudnTDUMNazNlIAafxBF1oeCdQraBe0EpsNJCw4%2BjX199kYgXmpS09TlJ6xpxR4ZS1Gh%2FnVfE2O%2BBBP1Vpi4GouM9qW81GAQRmpy9EbMKzOh9QGOqUB%2B8GSqrHDV9E2QyKQx%2Bpt0QNsBsBFEdQ8NZ5Ag%2F2vf0gD6Ej%2FZR7VOorEDjpz6tWNfCF1jvlzny3QeP220rqgvrUk8YHgHHuSCX7EBPxiRpBu04gx50Rgi5YWGx7nfeB5f8DMTgyZuMvC7F4IDze0kJ3dHv0HNBMZoCuIG%2BuvlwFyXC7tfP981IQEnuHTiBNM2E2%2B8LDeXR8VbIyDKeHy13FsBKmF&X-Amz-Signature=df3db46efb5fee938495ad5d02b16aa282199a826e5e71eff0e86aa0d934f5fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UVN5UGVB%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T181244Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQC63zB%2FoX%2BHFNd%2FxuO%2BiZW5CgwQZt9Sco3DYd5%2FIq1FfgIgDWgELuFS55DEMfOyjPFv6kPvyDZnHMcCSx9cJ8p7DG8q%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDCcQ8Jtpk%2FvQFcTtMircA6zWzX7utzsr8pitenW11eIXbO2XMvdwWrng9VDzlHPSR9%2BJEUAjW6hQhRxNwAGR2wXOeY%2FITzhQjB%2B%2BRYMNQEArA0jFrpcYaEgd6EqfRqdHglED%2B9yb7PGk4d14aaGLf3vPHSB%2F9UtEB65wqPOrx563FcfAYd%2BxxkRQibgv5jCUUYSNGxDeiicnQdN8f0DrcKmI0CTMm8g9AVSM3ywoL%2BgAckTNG9IkX30j7x1v0p3BhxOnYhs7cBgAXFEGJtG%2FYFLyjXptHYRDS3myYwHj2oWnavnnvS9KazqEndmej3%2FvCWIj%2B2%2FCR8hcuEgmYb71YmGL8jekeiw8CFXhW6FrdXm%2B4%2F%2BI2CFa6amlOo6yfBr7%2BzVbdD2DdCFultsPCaB%2BSW9o9WIkpi%2F6uBYXe3%2FqJJtaBSqcMsdZ90WKIaU7Y6RcTAUlw%2Fis0Ff%2FL181ZkZ%2FG%2FahHpURb1Ly9w8ET3uBmpeY0GwT6Qot7aNQbDfrhol0BEQkyC0%2Fb%2FiRTofQzSD7%2FkW7V%2Bb%2BQ%2FN382uoFxADkvudnTDUMNazNlIAafxBF1oeCdQraBe0EpsNJCw4%2BjX199kYgXmpS09TlJ6xpxR4ZS1Gh%2FnVfE2O%2BBBP1Vpi4GouM9qW81GAQRmpy9EbMKzOh9QGOqUB%2B8GSqrHDV9E2QyKQx%2Bpt0QNsBsBFEdQ8NZ5Ag%2F2vf0gD6Ej%2FZR7VOorEDjpz6tWNfCF1jvlzny3QeP220rqgvrUk8YHgHHuSCX7EBPxiRpBu04gx50Rgi5YWGx7nfeB5f8DMTgyZuMvC7F4IDze0kJ3dHv0HNBMZoCuIG%2BuvlwFyXC7tfP981IQEnuHTiBNM2E2%2B8LDeXR8VbIyDKeHy13FsBKmF&X-Amz-Signature=9e627ab0f6fb06eb3fb87bfe00971bf9684951bf3ae185e6c90a41b99c82dab0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UVN5UGVB%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T181244Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQC63zB%2FoX%2BHFNd%2FxuO%2BiZW5CgwQZt9Sco3DYd5%2FIq1FfgIgDWgELuFS55DEMfOyjPFv6kPvyDZnHMcCSx9cJ8p7DG8q%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDCcQ8Jtpk%2FvQFcTtMircA6zWzX7utzsr8pitenW11eIXbO2XMvdwWrng9VDzlHPSR9%2BJEUAjW6hQhRxNwAGR2wXOeY%2FITzhQjB%2B%2BRYMNQEArA0jFrpcYaEgd6EqfRqdHglED%2B9yb7PGk4d14aaGLf3vPHSB%2F9UtEB65wqPOrx563FcfAYd%2BxxkRQibgv5jCUUYSNGxDeiicnQdN8f0DrcKmI0CTMm8g9AVSM3ywoL%2BgAckTNG9IkX30j7x1v0p3BhxOnYhs7cBgAXFEGJtG%2FYFLyjXptHYRDS3myYwHj2oWnavnnvS9KazqEndmej3%2FvCWIj%2B2%2FCR8hcuEgmYb71YmGL8jekeiw8CFXhW6FrdXm%2B4%2F%2BI2CFa6amlOo6yfBr7%2BzVbdD2DdCFultsPCaB%2BSW9o9WIkpi%2F6uBYXe3%2FqJJtaBSqcMsdZ90WKIaU7Y6RcTAUlw%2Fis0Ff%2FL181ZkZ%2FG%2FahHpURb1Ly9w8ET3uBmpeY0GwT6Qot7aNQbDfrhol0BEQkyC0%2Fb%2FiRTofQzSD7%2FkW7V%2Bb%2BQ%2FN382uoFxADkvudnTDUMNazNlIAafxBF1oeCdQraBe0EpsNJCw4%2BjX199kYgXmpS09TlJ6xpxR4ZS1Gh%2FnVfE2O%2BBBP1Vpi4GouM9qW81GAQRmpy9EbMKzOh9QGOqUB%2B8GSqrHDV9E2QyKQx%2Bpt0QNsBsBFEdQ8NZ5Ag%2F2vf0gD6Ej%2FZR7VOorEDjpz6tWNfCF1jvlzny3QeP220rqgvrUk8YHgHHuSCX7EBPxiRpBu04gx50Rgi5YWGx7nfeB5f8DMTgyZuMvC7F4IDze0kJ3dHv0HNBMZoCuIG%2BuvlwFyXC7tfP981IQEnuHTiBNM2E2%2B8LDeXR8VbIyDKeHy13FsBKmF&X-Amz-Signature=1a013c47d66b809c77772474c217c8abfc9f3dce5adfd48ca5d9017a3f14295c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UVN5UGVB%2F20260816%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260816T181244Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGkaCXVzLXdlc3QtMiJHMEUCIQC63zB%2FoX%2BHFNd%2FxuO%2BiZW5CgwQZt9Sco3DYd5%2FIq1FfgIgDWgELuFS55DEMfOyjPFv6kPvyDZnHMcCSx9cJ8p7DG8q%2FwMIMhAAGgw2Mzc0MjMxODM4MDUiDCcQ8Jtpk%2FvQFcTtMircA6zWzX7utzsr8pitenW11eIXbO2XMvdwWrng9VDzlHPSR9%2BJEUAjW6hQhRxNwAGR2wXOeY%2FITzhQjB%2B%2BRYMNQEArA0jFrpcYaEgd6EqfRqdHglED%2B9yb7PGk4d14aaGLf3vPHSB%2F9UtEB65wqPOrx563FcfAYd%2BxxkRQibgv5jCUUYSNGxDeiicnQdN8f0DrcKmI0CTMm8g9AVSM3ywoL%2BgAckTNG9IkX30j7x1v0p3BhxOnYhs7cBgAXFEGJtG%2FYFLyjXptHYRDS3myYwHj2oWnavnnvS9KazqEndmej3%2FvCWIj%2B2%2FCR8hcuEgmYb71YmGL8jekeiw8CFXhW6FrdXm%2B4%2F%2BI2CFa6amlOo6yfBr7%2BzVbdD2DdCFultsPCaB%2BSW9o9WIkpi%2F6uBYXe3%2FqJJtaBSqcMsdZ90WKIaU7Y6RcTAUlw%2Fis0Ff%2FL181ZkZ%2FG%2FahHpURb1Ly9w8ET3uBmpeY0GwT6Qot7aNQbDfrhol0BEQkyC0%2Fb%2FiRTofQzSD7%2FkW7V%2Bb%2BQ%2FN382uoFxADkvudnTDUMNazNlIAafxBF1oeCdQraBe0EpsNJCw4%2BjX199kYgXmpS09TlJ6xpxR4ZS1Gh%2FnVfE2O%2BBBP1Vpi4GouM9qW81GAQRmpy9EbMKzOh9QGOqUB%2B8GSqrHDV9E2QyKQx%2Bpt0QNsBsBFEdQ8NZ5Ag%2F2vf0gD6Ej%2FZR7VOorEDjpz6tWNfCF1jvlzny3QeP220rqgvrUk8YHgHHuSCX7EBPxiRpBu04gx50Rgi5YWGx7nfeB5f8DMTgyZuMvC7F4IDze0kJ3dHv0HNBMZoCuIG%2BuvlwFyXC7tfP981IQEnuHTiBNM2E2%2B8LDeXR8VbIyDKeHy13FsBKmF&X-Amz-Signature=ab3ada90c480d192546be1c1514722ab25deda7354d7ec82a9ecaeb77efa84bb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
