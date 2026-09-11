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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NITMPIY%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T201114Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCcgaap5RRIKgDpfdqqmCV3k1QHD6XsW7FZSnea4TLm9gIhALplru2fJRH4C%2B7auNGN%2BRuPBWelVqn%2BOcenP1BKffWvKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxGxxrPUkDQiZD7lIMq3ANlhOQUuSL3cLqWIxFYRGvl2Q7PihFLRgDfLedzkkrZcU4RX3kjSx%2BEkr%2Fgv29haByDXWfOWhPySE6%2BCTayqE48qMTU0zW%2FcQLwCWfUsuRMcZev6HIw7or%2FCCrixxh7vViXZoQdCezvjLpWFBVZ5X3W%2FMOwe1cuXUP%2BvWshot86rtgjvXZajanuegMbA7UFcvObdBqimb91QCtMwJ9fAy7CPj8o5A5Pi3kigHP3kWVwFuFQNye8901IluELFJEjb4PDHCYmh4QOhzgFuXi7YtCXFzp2%2F1yXMHc7S9yBXyQsY%2BH9ROH2cPE48858Uv5s49EWKQJpNdluX3b8GPbJzkgehSycJmHjw3d2nhbX00B%2F%2BHap4Up36oRJh0nVietW3KXsgIDJH746fGCgLqoNOCSsgdpM5mFh1WG27tiYECZezvZwNI%2FcTuT9BThtqBxRlqcJ4hU1U%2B8ybiUEtXo8QLoeczZnkt%2F9Jnp5pQTXm3QLDxzQN8pNKBy38PKcXSFtPQBgKW1Kbo8SfkF23uLbey8EPh034qKtyT1GwWqDBLQ9HROpPz6StGshiDBvBqgExl8jlyyBrQnYWiw10nvRoOJb18hJcdADNn00RHAAbmHjsgb5qFRyKrlBsivp9zDI3pDVBjqkAUcaXc8kfogZY7O6ZkUfwV%2FCfoIgFWZbwndmB1c09%2FYeRfRDEejAiPKj2jr3WmMYkYnYQzYebKGYDcfwL5s40lpQ8AN4auSW3l%2FOh6gjprkb4E%2BkbHQlVOzsDDaeJrkl36UqIehRxZHFdobA8h0fDRmBGlHr4VJdJrrqi%2BMmZ5x081ni3FgjcLaW9VwZYIxa8z0uwBinLyhWa9tp1%2FUMUWeFthQ1&X-Amz-Signature=80b190c21596dcbf2bcdf528cdbd48ab93764f33ad2c94c41ce20e3b3afced90&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NITMPIY%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T201114Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCcgaap5RRIKgDpfdqqmCV3k1QHD6XsW7FZSnea4TLm9gIhALplru2fJRH4C%2B7auNGN%2BRuPBWelVqn%2BOcenP1BKffWvKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxGxxrPUkDQiZD7lIMq3ANlhOQUuSL3cLqWIxFYRGvl2Q7PihFLRgDfLedzkkrZcU4RX3kjSx%2BEkr%2Fgv29haByDXWfOWhPySE6%2BCTayqE48qMTU0zW%2FcQLwCWfUsuRMcZev6HIw7or%2FCCrixxh7vViXZoQdCezvjLpWFBVZ5X3W%2FMOwe1cuXUP%2BvWshot86rtgjvXZajanuegMbA7UFcvObdBqimb91QCtMwJ9fAy7CPj8o5A5Pi3kigHP3kWVwFuFQNye8901IluELFJEjb4PDHCYmh4QOhzgFuXi7YtCXFzp2%2F1yXMHc7S9yBXyQsY%2BH9ROH2cPE48858Uv5s49EWKQJpNdluX3b8GPbJzkgehSycJmHjw3d2nhbX00B%2F%2BHap4Up36oRJh0nVietW3KXsgIDJH746fGCgLqoNOCSsgdpM5mFh1WG27tiYECZezvZwNI%2FcTuT9BThtqBxRlqcJ4hU1U%2B8ybiUEtXo8QLoeczZnkt%2F9Jnp5pQTXm3QLDxzQN8pNKBy38PKcXSFtPQBgKW1Kbo8SfkF23uLbey8EPh034qKtyT1GwWqDBLQ9HROpPz6StGshiDBvBqgExl8jlyyBrQnYWiw10nvRoOJb18hJcdADNn00RHAAbmHjsgb5qFRyKrlBsivp9zDI3pDVBjqkAUcaXc8kfogZY7O6ZkUfwV%2FCfoIgFWZbwndmB1c09%2FYeRfRDEejAiPKj2jr3WmMYkYnYQzYebKGYDcfwL5s40lpQ8AN4auSW3l%2FOh6gjprkb4E%2BkbHQlVOzsDDaeJrkl36UqIehRxZHFdobA8h0fDRmBGlHr4VJdJrrqi%2BMmZ5x081ni3FgjcLaW9VwZYIxa8z0uwBinLyhWa9tp1%2FUMUWeFthQ1&X-Amz-Signature=0d06193e8b5be5d052477a770196a8ead4d31c3e09c0a51aa9c4bd1acfd262c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NITMPIY%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T201114Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCcgaap5RRIKgDpfdqqmCV3k1QHD6XsW7FZSnea4TLm9gIhALplru2fJRH4C%2B7auNGN%2BRuPBWelVqn%2BOcenP1BKffWvKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxGxxrPUkDQiZD7lIMq3ANlhOQUuSL3cLqWIxFYRGvl2Q7PihFLRgDfLedzkkrZcU4RX3kjSx%2BEkr%2Fgv29haByDXWfOWhPySE6%2BCTayqE48qMTU0zW%2FcQLwCWfUsuRMcZev6HIw7or%2FCCrixxh7vViXZoQdCezvjLpWFBVZ5X3W%2FMOwe1cuXUP%2BvWshot86rtgjvXZajanuegMbA7UFcvObdBqimb91QCtMwJ9fAy7CPj8o5A5Pi3kigHP3kWVwFuFQNye8901IluELFJEjb4PDHCYmh4QOhzgFuXi7YtCXFzp2%2F1yXMHc7S9yBXyQsY%2BH9ROH2cPE48858Uv5s49EWKQJpNdluX3b8GPbJzkgehSycJmHjw3d2nhbX00B%2F%2BHap4Up36oRJh0nVietW3KXsgIDJH746fGCgLqoNOCSsgdpM5mFh1WG27tiYECZezvZwNI%2FcTuT9BThtqBxRlqcJ4hU1U%2B8ybiUEtXo8QLoeczZnkt%2F9Jnp5pQTXm3QLDxzQN8pNKBy38PKcXSFtPQBgKW1Kbo8SfkF23uLbey8EPh034qKtyT1GwWqDBLQ9HROpPz6StGshiDBvBqgExl8jlyyBrQnYWiw10nvRoOJb18hJcdADNn00RHAAbmHjsgb5qFRyKrlBsivp9zDI3pDVBjqkAUcaXc8kfogZY7O6ZkUfwV%2FCfoIgFWZbwndmB1c09%2FYeRfRDEejAiPKj2jr3WmMYkYnYQzYebKGYDcfwL5s40lpQ8AN4auSW3l%2FOh6gjprkb4E%2BkbHQlVOzsDDaeJrkl36UqIehRxZHFdobA8h0fDRmBGlHr4VJdJrrqi%2BMmZ5x081ni3FgjcLaW9VwZYIxa8z0uwBinLyhWa9tp1%2FUMUWeFthQ1&X-Amz-Signature=6236813763e43dd6848c7205b8e7566f0c6e6a38e979ff342ce80820f9d9e87c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NITMPIY%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T201114Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCcgaap5RRIKgDpfdqqmCV3k1QHD6XsW7FZSnea4TLm9gIhALplru2fJRH4C%2B7auNGN%2BRuPBWelVqn%2BOcenP1BKffWvKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxGxxrPUkDQiZD7lIMq3ANlhOQUuSL3cLqWIxFYRGvl2Q7PihFLRgDfLedzkkrZcU4RX3kjSx%2BEkr%2Fgv29haByDXWfOWhPySE6%2BCTayqE48qMTU0zW%2FcQLwCWfUsuRMcZev6HIw7or%2FCCrixxh7vViXZoQdCezvjLpWFBVZ5X3W%2FMOwe1cuXUP%2BvWshot86rtgjvXZajanuegMbA7UFcvObdBqimb91QCtMwJ9fAy7CPj8o5A5Pi3kigHP3kWVwFuFQNye8901IluELFJEjb4PDHCYmh4QOhzgFuXi7YtCXFzp2%2F1yXMHc7S9yBXyQsY%2BH9ROH2cPE48858Uv5s49EWKQJpNdluX3b8GPbJzkgehSycJmHjw3d2nhbX00B%2F%2BHap4Up36oRJh0nVietW3KXsgIDJH746fGCgLqoNOCSsgdpM5mFh1WG27tiYECZezvZwNI%2FcTuT9BThtqBxRlqcJ4hU1U%2B8ybiUEtXo8QLoeczZnkt%2F9Jnp5pQTXm3QLDxzQN8pNKBy38PKcXSFtPQBgKW1Kbo8SfkF23uLbey8EPh034qKtyT1GwWqDBLQ9HROpPz6StGshiDBvBqgExl8jlyyBrQnYWiw10nvRoOJb18hJcdADNn00RHAAbmHjsgb5qFRyKrlBsivp9zDI3pDVBjqkAUcaXc8kfogZY7O6ZkUfwV%2FCfoIgFWZbwndmB1c09%2FYeRfRDEejAiPKj2jr3WmMYkYnYQzYebKGYDcfwL5s40lpQ8AN4auSW3l%2FOh6gjprkb4E%2BkbHQlVOzsDDaeJrkl36UqIehRxZHFdobA8h0fDRmBGlHr4VJdJrrqi%2BMmZ5x081ni3FgjcLaW9VwZYIxa8z0uwBinLyhWa9tp1%2FUMUWeFthQ1&X-Amz-Signature=91be86fe03f2dacb3f6f003aeb115358ccca55a49a9f5282ab1c6bc50755d3e6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
