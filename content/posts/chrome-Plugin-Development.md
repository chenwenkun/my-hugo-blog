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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3HGK5S3%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T122342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEuTjUAFtYO4LJGch9ZjXS9uzINMITITwh1NRegM3agBAiB4ytDj1cX3ZvZSQg4bYaNh%2FOkyWQH%2FjOIwpy6FUy5fQSqIBAik%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4nktbk4mDJLzvXvdKtwDAXl2%2Bi9LnxyKsR6T6yEiUdhfL9TncyRCyU4of2dhV4Td9jviwY7PXN8HsorAkCzwMsTXFg7cq1jFTvMU36a3dR62JDtRImLxfH5d%2FSGjfYdcurvK1xvYzOe5RhdcUVQyjKb8%2BzOwJggMmFlEM4FgaFfIImKmZU90h4mb2%2FeOv%2BtG7vVEXY6BPVtBpfowd3ezAPSTpxj2nYiIBQi7uSJDJP%2FQK%2BKrObIjelhDe2d71oymAZEw25oboeMDuvyYD5LoQZXAU6op9aSgRlWkjwZBS6cUap6RjwISHsOVg25bfysqVzRNSFPG%2Bc9fk3RIx01w0N9drIh1we8ELq%2FYBsVFHPaBzDtqZV1SZZ6vi75vNosUvpt%2FXMfn9WMWa8wI%2BYlWv62B9K9ShEdIs9YMFYRof%2FqDF3kM8dIhDQkdNwA1aT1zJCzWzTMMdnPJkmk6PbpBhLswm0%2FtOsLbNMV02PU9Dc7gTlxqVwLGh0DX9QVpRbRzjBe7hCoXsXcFj8be8NCUm7SeEue2e9FgNODvuqEBSONB5cyQzakPiWxwks4kECGdKkFDNLDbJAuwGHIlNT2sqHSu3ltzfOkkWfTBuwfGWwNvB8LoTT93m796xYJCTn9m2yOga2RNTjgxUt8wotmg1AY6pgHgpZaqVOXF%2Ffq0EdIIdizruxzrVzCNcagx%2Bvic24Xa0Xi8pn5A0Q0ZEJp70osoWwJpV85y8JwPsyoezyaEeBdsGoXNfdP70v8EGAghVYhi%2BQlzjwaJV4T9%2BDTmRHTsi8%2FxdItbX8nwQ%2BtfNoh7qCKu2%2B5Qm8T8j9joSnw8lJb2ECyR3oQJkTfEyCxAfI5oI5peiNRbUGjSKgIbbSF5RVrD%2FByVRAkG&X-Amz-Signature=1162175a459caecc06c8eaf87598ba7bc025ffd9a697a21ec80e899f7e0b0605&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3HGK5S3%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T122342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEuTjUAFtYO4LJGch9ZjXS9uzINMITITwh1NRegM3agBAiB4ytDj1cX3ZvZSQg4bYaNh%2FOkyWQH%2FjOIwpy6FUy5fQSqIBAik%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4nktbk4mDJLzvXvdKtwDAXl2%2Bi9LnxyKsR6T6yEiUdhfL9TncyRCyU4of2dhV4Td9jviwY7PXN8HsorAkCzwMsTXFg7cq1jFTvMU36a3dR62JDtRImLxfH5d%2FSGjfYdcurvK1xvYzOe5RhdcUVQyjKb8%2BzOwJggMmFlEM4FgaFfIImKmZU90h4mb2%2FeOv%2BtG7vVEXY6BPVtBpfowd3ezAPSTpxj2nYiIBQi7uSJDJP%2FQK%2BKrObIjelhDe2d71oymAZEw25oboeMDuvyYD5LoQZXAU6op9aSgRlWkjwZBS6cUap6RjwISHsOVg25bfysqVzRNSFPG%2Bc9fk3RIx01w0N9drIh1we8ELq%2FYBsVFHPaBzDtqZV1SZZ6vi75vNosUvpt%2FXMfn9WMWa8wI%2BYlWv62B9K9ShEdIs9YMFYRof%2FqDF3kM8dIhDQkdNwA1aT1zJCzWzTMMdnPJkmk6PbpBhLswm0%2FtOsLbNMV02PU9Dc7gTlxqVwLGh0DX9QVpRbRzjBe7hCoXsXcFj8be8NCUm7SeEue2e9FgNODvuqEBSONB5cyQzakPiWxwks4kECGdKkFDNLDbJAuwGHIlNT2sqHSu3ltzfOkkWfTBuwfGWwNvB8LoTT93m796xYJCTn9m2yOga2RNTjgxUt8wotmg1AY6pgHgpZaqVOXF%2Ffq0EdIIdizruxzrVzCNcagx%2Bvic24Xa0Xi8pn5A0Q0ZEJp70osoWwJpV85y8JwPsyoezyaEeBdsGoXNfdP70v8EGAghVYhi%2BQlzjwaJV4T9%2BDTmRHTsi8%2FxdItbX8nwQ%2BtfNoh7qCKu2%2B5Qm8T8j9joSnw8lJb2ECyR3oQJkTfEyCxAfI5oI5peiNRbUGjSKgIbbSF5RVrD%2FByVRAkG&X-Amz-Signature=43c78b845e03b803556a166e765df152a78b3cb9329686b858c8d3e3b5aa7394&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3HGK5S3%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T122342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEuTjUAFtYO4LJGch9ZjXS9uzINMITITwh1NRegM3agBAiB4ytDj1cX3ZvZSQg4bYaNh%2FOkyWQH%2FjOIwpy6FUy5fQSqIBAik%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4nktbk4mDJLzvXvdKtwDAXl2%2Bi9LnxyKsR6T6yEiUdhfL9TncyRCyU4of2dhV4Td9jviwY7PXN8HsorAkCzwMsTXFg7cq1jFTvMU36a3dR62JDtRImLxfH5d%2FSGjfYdcurvK1xvYzOe5RhdcUVQyjKb8%2BzOwJggMmFlEM4FgaFfIImKmZU90h4mb2%2FeOv%2BtG7vVEXY6BPVtBpfowd3ezAPSTpxj2nYiIBQi7uSJDJP%2FQK%2BKrObIjelhDe2d71oymAZEw25oboeMDuvyYD5LoQZXAU6op9aSgRlWkjwZBS6cUap6RjwISHsOVg25bfysqVzRNSFPG%2Bc9fk3RIx01w0N9drIh1we8ELq%2FYBsVFHPaBzDtqZV1SZZ6vi75vNosUvpt%2FXMfn9WMWa8wI%2BYlWv62B9K9ShEdIs9YMFYRof%2FqDF3kM8dIhDQkdNwA1aT1zJCzWzTMMdnPJkmk6PbpBhLswm0%2FtOsLbNMV02PU9Dc7gTlxqVwLGh0DX9QVpRbRzjBe7hCoXsXcFj8be8NCUm7SeEue2e9FgNODvuqEBSONB5cyQzakPiWxwks4kECGdKkFDNLDbJAuwGHIlNT2sqHSu3ltzfOkkWfTBuwfGWwNvB8LoTT93m796xYJCTn9m2yOga2RNTjgxUt8wotmg1AY6pgHgpZaqVOXF%2Ffq0EdIIdizruxzrVzCNcagx%2Bvic24Xa0Xi8pn5A0Q0ZEJp70osoWwJpV85y8JwPsyoezyaEeBdsGoXNfdP70v8EGAghVYhi%2BQlzjwaJV4T9%2BDTmRHTsi8%2FxdItbX8nwQ%2BtfNoh7qCKu2%2B5Qm8T8j9joSnw8lJb2ECyR3oQJkTfEyCxAfI5oI5peiNRbUGjSKgIbbSF5RVrD%2FByVRAkG&X-Amz-Signature=517ddbb23966985cbc6d73a783e9a240260e34d43132e2521667cdaf4f8191ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X3HGK5S3%2F20260821%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260821T122342Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEuTjUAFtYO4LJGch9ZjXS9uzINMITITwh1NRegM3agBAiB4ytDj1cX3ZvZSQg4bYaNh%2FOkyWQH%2FjOIwpy6FUy5fQSqIBAik%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4nktbk4mDJLzvXvdKtwDAXl2%2Bi9LnxyKsR6T6yEiUdhfL9TncyRCyU4of2dhV4Td9jviwY7PXN8HsorAkCzwMsTXFg7cq1jFTvMU36a3dR62JDtRImLxfH5d%2FSGjfYdcurvK1xvYzOe5RhdcUVQyjKb8%2BzOwJggMmFlEM4FgaFfIImKmZU90h4mb2%2FeOv%2BtG7vVEXY6BPVtBpfowd3ezAPSTpxj2nYiIBQi7uSJDJP%2FQK%2BKrObIjelhDe2d71oymAZEw25oboeMDuvyYD5LoQZXAU6op9aSgRlWkjwZBS6cUap6RjwISHsOVg25bfysqVzRNSFPG%2Bc9fk3RIx01w0N9drIh1we8ELq%2FYBsVFHPaBzDtqZV1SZZ6vi75vNosUvpt%2FXMfn9WMWa8wI%2BYlWv62B9K9ShEdIs9YMFYRof%2FqDF3kM8dIhDQkdNwA1aT1zJCzWzTMMdnPJkmk6PbpBhLswm0%2FtOsLbNMV02PU9Dc7gTlxqVwLGh0DX9QVpRbRzjBe7hCoXsXcFj8be8NCUm7SeEue2e9FgNODvuqEBSONB5cyQzakPiWxwks4kECGdKkFDNLDbJAuwGHIlNT2sqHSu3ltzfOkkWfTBuwfGWwNvB8LoTT93m796xYJCTn9m2yOga2RNTjgxUt8wotmg1AY6pgHgpZaqVOXF%2Ffq0EdIIdizruxzrVzCNcagx%2Bvic24Xa0Xi8pn5A0Q0ZEJp70osoWwJpV85y8JwPsyoezyaEeBdsGoXNfdP70v8EGAghVYhi%2BQlzjwaJV4T9%2BDTmRHTsi8%2FxdItbX8nwQ%2BtfNoh7qCKu2%2B5Qm8T8j9joSnw8lJb2ECyR3oQJkTfEyCxAfI5oI5peiNRbUGjSKgIbbSF5RVrD%2FByVRAkG&X-Amz-Signature=4346a1a31638bf382037281008dff6c590cfefb95df7ddf9299ebb75c93d29fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
