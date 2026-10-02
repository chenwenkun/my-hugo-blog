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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZLH2WUI%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T213351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCz4wH40VoBOG%2FJeczTkVmeRoQ%2F3c7c65POaqP1ttAlTgIgfYYISRdhkgpxOLR4mUJlKpwfPGWRUluacHS%2FjjTUkkwqiAQIm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFre6nmDDFlt1pl0FyrcA%2Bf9rgMXqsytfZl%2BZPgiCQ6SC58YkfAUaA3kitF%2F8dmzLNE16MDwskDq12c9IhTi3HXmjcMB%2BXfzBZZOUiOeLqp11cFDAYf7me4X1EdOjxPQ1ZSrUgMKfTZgG3ZFLKtSOH%2B5wq1n3f4eHyndTyONCdwk4onQkkWCuCatBE0qfN6V6bgthMJp1e%2BkncRzEWZ0hUigZ%2B4GsoG5B3EuzrLQLoPM4pPqUjfRa4RzyxEZlojVZMkXqZM6H%2B3oFZAeBxClWQo0FloXWY6mgHbxamjPhTbOagOdpl7K9QGJhskb0nnE1MsILX6j9uyFkOggSO%2F7LC67ng1vV1AcPyf11zAjMt62Mry6iXzTSB4XVteS4MeXuEdmPE5u5Nw8vF0m1ob0ColPwPGMbbYMZWOWbofmXPsJtP9DiCYyE1y10zraErAMq7hpjSb0aGF4nMtGGLy5MsHm%2BchCXY0ZBdZk8cbpt40nMsamfnokbfA9Y6%2B%2BVnvTAhH59yrJBffDYHlttCFaj4GPab7DesmzgSKP2FUGs1O0JaVMws1V4Xf1ZsfyKLA8XltoSBYAdYgSvOWD46qgYetA5W868ibE0gDdT0RpqnqPWPo7ApBaL2xYPaf%2F4TQevfn3p8BCw6FDl%2BPxMKL%2B%2F9UGOqUBuKuaqHtt1VRwYVYe16RgfSzUmGw3%2BXvYKQTyENS81eY%2FVgwDzequ%2BMGCqsxwiFYFJTjfrYLzxqhIrbZIEmAhkhchWbHo3RT%2Fno0OpFVMpkaSMCQXOoogtl1NIOOHotaxOEUHQ92NSwQM5eWbnwCADpio%2FJKyme9GcbA2Yk4O6qGlywG221crjkK7JHQYwm9tgg8wVI74x6v7tVV0KQKe6fW5yK8%2F&X-Amz-Signature=c79ebfa2d12f13a98e4ca6e8d1202ccf352a7fe623072ce6a5d908346c6d2334&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZLH2WUI%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T213351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCz4wH40VoBOG%2FJeczTkVmeRoQ%2F3c7c65POaqP1ttAlTgIgfYYISRdhkgpxOLR4mUJlKpwfPGWRUluacHS%2FjjTUkkwqiAQIm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFre6nmDDFlt1pl0FyrcA%2Bf9rgMXqsytfZl%2BZPgiCQ6SC58YkfAUaA3kitF%2F8dmzLNE16MDwskDq12c9IhTi3HXmjcMB%2BXfzBZZOUiOeLqp11cFDAYf7me4X1EdOjxPQ1ZSrUgMKfTZgG3ZFLKtSOH%2B5wq1n3f4eHyndTyONCdwk4onQkkWCuCatBE0qfN6V6bgthMJp1e%2BkncRzEWZ0hUigZ%2B4GsoG5B3EuzrLQLoPM4pPqUjfRa4RzyxEZlojVZMkXqZM6H%2B3oFZAeBxClWQo0FloXWY6mgHbxamjPhTbOagOdpl7K9QGJhskb0nnE1MsILX6j9uyFkOggSO%2F7LC67ng1vV1AcPyf11zAjMt62Mry6iXzTSB4XVteS4MeXuEdmPE5u5Nw8vF0m1ob0ColPwPGMbbYMZWOWbofmXPsJtP9DiCYyE1y10zraErAMq7hpjSb0aGF4nMtGGLy5MsHm%2BchCXY0ZBdZk8cbpt40nMsamfnokbfA9Y6%2B%2BVnvTAhH59yrJBffDYHlttCFaj4GPab7DesmzgSKP2FUGs1O0JaVMws1V4Xf1ZsfyKLA8XltoSBYAdYgSvOWD46qgYetA5W868ibE0gDdT0RpqnqPWPo7ApBaL2xYPaf%2F4TQevfn3p8BCw6FDl%2BPxMKL%2B%2F9UGOqUBuKuaqHtt1VRwYVYe16RgfSzUmGw3%2BXvYKQTyENS81eY%2FVgwDzequ%2BMGCqsxwiFYFJTjfrYLzxqhIrbZIEmAhkhchWbHo3RT%2Fno0OpFVMpkaSMCQXOoogtl1NIOOHotaxOEUHQ92NSwQM5eWbnwCADpio%2FJKyme9GcbA2Yk4O6qGlywG221crjkK7JHQYwm9tgg8wVI74x6v7tVV0KQKe6fW5yK8%2F&X-Amz-Signature=beb7088a8eb1b59658855ffe11af667d931ee39fccbd6b8a8f463732a15bbb16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZLH2WUI%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T213351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCz4wH40VoBOG%2FJeczTkVmeRoQ%2F3c7c65POaqP1ttAlTgIgfYYISRdhkgpxOLR4mUJlKpwfPGWRUluacHS%2FjjTUkkwqiAQIm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFre6nmDDFlt1pl0FyrcA%2Bf9rgMXqsytfZl%2BZPgiCQ6SC58YkfAUaA3kitF%2F8dmzLNE16MDwskDq12c9IhTi3HXmjcMB%2BXfzBZZOUiOeLqp11cFDAYf7me4X1EdOjxPQ1ZSrUgMKfTZgG3ZFLKtSOH%2B5wq1n3f4eHyndTyONCdwk4onQkkWCuCatBE0qfN6V6bgthMJp1e%2BkncRzEWZ0hUigZ%2B4GsoG5B3EuzrLQLoPM4pPqUjfRa4RzyxEZlojVZMkXqZM6H%2B3oFZAeBxClWQo0FloXWY6mgHbxamjPhTbOagOdpl7K9QGJhskb0nnE1MsILX6j9uyFkOggSO%2F7LC67ng1vV1AcPyf11zAjMt62Mry6iXzTSB4XVteS4MeXuEdmPE5u5Nw8vF0m1ob0ColPwPGMbbYMZWOWbofmXPsJtP9DiCYyE1y10zraErAMq7hpjSb0aGF4nMtGGLy5MsHm%2BchCXY0ZBdZk8cbpt40nMsamfnokbfA9Y6%2B%2BVnvTAhH59yrJBffDYHlttCFaj4GPab7DesmzgSKP2FUGs1O0JaVMws1V4Xf1ZsfyKLA8XltoSBYAdYgSvOWD46qgYetA5W868ibE0gDdT0RpqnqPWPo7ApBaL2xYPaf%2F4TQevfn3p8BCw6FDl%2BPxMKL%2B%2F9UGOqUBuKuaqHtt1VRwYVYe16RgfSzUmGw3%2BXvYKQTyENS81eY%2FVgwDzequ%2BMGCqsxwiFYFJTjfrYLzxqhIrbZIEmAhkhchWbHo3RT%2Fno0OpFVMpkaSMCQXOoogtl1NIOOHotaxOEUHQ92NSwQM5eWbnwCADpio%2FJKyme9GcbA2Yk4O6qGlywG221crjkK7JHQYwm9tgg8wVI74x6v7tVV0KQKe6fW5yK8%2F&X-Amz-Signature=c899f6640e5093d3697cc8ae2c214e6ce6df82f65aa1acbf8e991e74f582a5d2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZLH2WUI%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T213351Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCz4wH40VoBOG%2FJeczTkVmeRoQ%2F3c7c65POaqP1ttAlTgIgfYYISRdhkgpxOLR4mUJlKpwfPGWRUluacHS%2FjjTUkkwqiAQIm%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFre6nmDDFlt1pl0FyrcA%2Bf9rgMXqsytfZl%2BZPgiCQ6SC58YkfAUaA3kitF%2F8dmzLNE16MDwskDq12c9IhTi3HXmjcMB%2BXfzBZZOUiOeLqp11cFDAYf7me4X1EdOjxPQ1ZSrUgMKfTZgG3ZFLKtSOH%2B5wq1n3f4eHyndTyONCdwk4onQkkWCuCatBE0qfN6V6bgthMJp1e%2BkncRzEWZ0hUigZ%2B4GsoG5B3EuzrLQLoPM4pPqUjfRa4RzyxEZlojVZMkXqZM6H%2B3oFZAeBxClWQo0FloXWY6mgHbxamjPhTbOagOdpl7K9QGJhskb0nnE1MsILX6j9uyFkOggSO%2F7LC67ng1vV1AcPyf11zAjMt62Mry6iXzTSB4XVteS4MeXuEdmPE5u5Nw8vF0m1ob0ColPwPGMbbYMZWOWbofmXPsJtP9DiCYyE1y10zraErAMq7hpjSb0aGF4nMtGGLy5MsHm%2BchCXY0ZBdZk8cbpt40nMsamfnokbfA9Y6%2B%2BVnvTAhH59yrJBffDYHlttCFaj4GPab7DesmzgSKP2FUGs1O0JaVMws1V4Xf1ZsfyKLA8XltoSBYAdYgSvOWD46qgYetA5W868ibE0gDdT0RpqnqPWPo7ApBaL2xYPaf%2F4TQevfn3p8BCw6FDl%2BPxMKL%2B%2F9UGOqUBuKuaqHtt1VRwYVYe16RgfSzUmGw3%2BXvYKQTyENS81eY%2FVgwDzequ%2BMGCqsxwiFYFJTjfrYLzxqhIrbZIEmAhkhchWbHo3RT%2Fno0OpFVMpkaSMCQXOoogtl1NIOOHotaxOEUHQ92NSwQM5eWbnwCADpio%2FJKyme9GcbA2Yk4O6qGlywG221crjkK7JHQYwm9tgg8wVI74x6v7tVV0KQKe6fW5yK8%2F&X-Amz-Signature=2106883609700d0aa437a60a15e7db7896a197339e15d69081c356b39d79d3f6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
