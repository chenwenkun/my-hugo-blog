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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UG6WJFEO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T150158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGtrHUt%2BGFkXkGSVVXLwhCEGwJeicC%2FX9yrJeRq3jkW2AiBH4mdJfET6M7hZI58PzwhS%2FZyD5sSoGVGwY%2F3JIbC7EiqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMm2x1eEVpYWIg1tZoKtwDBv0FNHtxNyduEXsHUIFwn2VtqHvNxuJv6rhm6GN4mKEyLhxAFjHpdSqLE80KRlS4b1WcKGL52nMv%2FPEwKv0utNMiwdMMn72heFXXb439LcZE09j9r7rbUL1MwDVcvLYO9Tarm9R8neMB%2Fll%2FC80cm2KRNKIZyadNHl%2FQjJgFLwhxAB1qsqD4EWPq5Sde380r9nMd%2FuHzKOo4ClfIKFOqEQrtUC88UainsEMD69eINzzcBBJUeWjBnqAB8Ad0M%2BMiYfs%2FF1TcGCYIoxIfZkKDTiwRIzHZmptvHk8oyZdoGRZwwdOKx%2BcVhthxnBNZHeNq3c%2BF6gcvFXwNqngFiqpoq4awyXfonf3Gy0IpdTm4zAsELUJp7Qt6z%2Bb%2FVOpNRYMbKQc%2FXWsPsnnZMCyalpGyTfEkH2Q%2BhHcUzrf5SNErC9OblUYGztbmBicgYYjikjCXAPlkAV49f1v635dZEe1PZWG0K8Gtu7rnMIFcOsjiadh5vWYDzt9V9u%2FwXmMWmvipXlJ7%2BuNJ1bpkfmTnS%2FhwjgcEvSTDghbYoS%2B35qKYQG%2FT1AtMGvkz2h0uM%2Bv9nSqR0sGtSY1UClvCn%2BIxoQnd8jvfkw71z6cdRJUG9In3ucJt8%2B5qyFKU2XyQkFgwluzy1gY6pgHfjmFQ8QHT33ZbKYgHveIlqHgoN1AiYJwmcj3XRG%2B3NfhnvKDeFxjeoCZQpylKk36jSJVjCFMbA2Pn%2BYsM0s8GHnp9Ip%2BMJFKYuaEuQ6rj7Xy9rWZISa1AFtEjZQfKQSSkto1Daklso2O%2F6mc0gOpeZlJZ15gWOupZ0QHzX%2FlCC74Fusbf69FDRH5LD02Jm9a47llOOlS4WGCjA2p1XqYeNX7RBszZ&X-Amz-Signature=4b59fbf8a967b33ac079ea515ca5cc3e633379af512179508bfa0e97f80a229e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UG6WJFEO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T150158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGtrHUt%2BGFkXkGSVVXLwhCEGwJeicC%2FX9yrJeRq3jkW2AiBH4mdJfET6M7hZI58PzwhS%2FZyD5sSoGVGwY%2F3JIbC7EiqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMm2x1eEVpYWIg1tZoKtwDBv0FNHtxNyduEXsHUIFwn2VtqHvNxuJv6rhm6GN4mKEyLhxAFjHpdSqLE80KRlS4b1WcKGL52nMv%2FPEwKv0utNMiwdMMn72heFXXb439LcZE09j9r7rbUL1MwDVcvLYO9Tarm9R8neMB%2Fll%2FC80cm2KRNKIZyadNHl%2FQjJgFLwhxAB1qsqD4EWPq5Sde380r9nMd%2FuHzKOo4ClfIKFOqEQrtUC88UainsEMD69eINzzcBBJUeWjBnqAB8Ad0M%2BMiYfs%2FF1TcGCYIoxIfZkKDTiwRIzHZmptvHk8oyZdoGRZwwdOKx%2BcVhthxnBNZHeNq3c%2BF6gcvFXwNqngFiqpoq4awyXfonf3Gy0IpdTm4zAsELUJp7Qt6z%2Bb%2FVOpNRYMbKQc%2FXWsPsnnZMCyalpGyTfEkH2Q%2BhHcUzrf5SNErC9OblUYGztbmBicgYYjikjCXAPlkAV49f1v635dZEe1PZWG0K8Gtu7rnMIFcOsjiadh5vWYDzt9V9u%2FwXmMWmvipXlJ7%2BuNJ1bpkfmTnS%2FhwjgcEvSTDghbYoS%2B35qKYQG%2FT1AtMGvkz2h0uM%2Bv9nSqR0sGtSY1UClvCn%2BIxoQnd8jvfkw71z6cdRJUG9In3ucJt8%2B5qyFKU2XyQkFgwluzy1gY6pgHfjmFQ8QHT33ZbKYgHveIlqHgoN1AiYJwmcj3XRG%2B3NfhnvKDeFxjeoCZQpylKk36jSJVjCFMbA2Pn%2BYsM0s8GHnp9Ip%2BMJFKYuaEuQ6rj7Xy9rWZISa1AFtEjZQfKQSSkto1Daklso2O%2F6mc0gOpeZlJZ15gWOupZ0QHzX%2FlCC74Fusbf69FDRH5LD02Jm9a47llOOlS4WGCjA2p1XqYeNX7RBszZ&X-Amz-Signature=409c7bc023e994d0f4600033a0fe6cdbb219570e86a31fd9f1bbbd8c0dc536fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UG6WJFEO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T150158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGtrHUt%2BGFkXkGSVVXLwhCEGwJeicC%2FX9yrJeRq3jkW2AiBH4mdJfET6M7hZI58PzwhS%2FZyD5sSoGVGwY%2F3JIbC7EiqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMm2x1eEVpYWIg1tZoKtwDBv0FNHtxNyduEXsHUIFwn2VtqHvNxuJv6rhm6GN4mKEyLhxAFjHpdSqLE80KRlS4b1WcKGL52nMv%2FPEwKv0utNMiwdMMn72heFXXb439LcZE09j9r7rbUL1MwDVcvLYO9Tarm9R8neMB%2Fll%2FC80cm2KRNKIZyadNHl%2FQjJgFLwhxAB1qsqD4EWPq5Sde380r9nMd%2FuHzKOo4ClfIKFOqEQrtUC88UainsEMD69eINzzcBBJUeWjBnqAB8Ad0M%2BMiYfs%2FF1TcGCYIoxIfZkKDTiwRIzHZmptvHk8oyZdoGRZwwdOKx%2BcVhthxnBNZHeNq3c%2BF6gcvFXwNqngFiqpoq4awyXfonf3Gy0IpdTm4zAsELUJp7Qt6z%2Bb%2FVOpNRYMbKQc%2FXWsPsnnZMCyalpGyTfEkH2Q%2BhHcUzrf5SNErC9OblUYGztbmBicgYYjikjCXAPlkAV49f1v635dZEe1PZWG0K8Gtu7rnMIFcOsjiadh5vWYDzt9V9u%2FwXmMWmvipXlJ7%2BuNJ1bpkfmTnS%2FhwjgcEvSTDghbYoS%2B35qKYQG%2FT1AtMGvkz2h0uM%2Bv9nSqR0sGtSY1UClvCn%2BIxoQnd8jvfkw71z6cdRJUG9In3ucJt8%2B5qyFKU2XyQkFgwluzy1gY6pgHfjmFQ8QHT33ZbKYgHveIlqHgoN1AiYJwmcj3XRG%2B3NfhnvKDeFxjeoCZQpylKk36jSJVjCFMbA2Pn%2BYsM0s8GHnp9Ip%2BMJFKYuaEuQ6rj7Xy9rWZISa1AFtEjZQfKQSSkto1Daklso2O%2F6mc0gOpeZlJZ15gWOupZ0QHzX%2FlCC74Fusbf69FDRH5LD02Jm9a47llOOlS4WGCjA2p1XqYeNX7RBszZ&X-Amz-Signature=9c62d43628f249ab648283feca66c34c96c57cc276292680c25383adae0a4b5b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UG6WJFEO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T150158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGtrHUt%2BGFkXkGSVVXLwhCEGwJeicC%2FX9yrJeRq3jkW2AiBH4mdJfET6M7hZI58PzwhS%2FZyD5sSoGVGwY%2F3JIbC7EiqIBAim%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMm2x1eEVpYWIg1tZoKtwDBv0FNHtxNyduEXsHUIFwn2VtqHvNxuJv6rhm6GN4mKEyLhxAFjHpdSqLE80KRlS4b1WcKGL52nMv%2FPEwKv0utNMiwdMMn72heFXXb439LcZE09j9r7rbUL1MwDVcvLYO9Tarm9R8neMB%2Fll%2FC80cm2KRNKIZyadNHl%2FQjJgFLwhxAB1qsqD4EWPq5Sde380r9nMd%2FuHzKOo4ClfIKFOqEQrtUC88UainsEMD69eINzzcBBJUeWjBnqAB8Ad0M%2BMiYfs%2FF1TcGCYIoxIfZkKDTiwRIzHZmptvHk8oyZdoGRZwwdOKx%2BcVhthxnBNZHeNq3c%2BF6gcvFXwNqngFiqpoq4awyXfonf3Gy0IpdTm4zAsELUJp7Qt6z%2Bb%2FVOpNRYMbKQc%2FXWsPsnnZMCyalpGyTfEkH2Q%2BhHcUzrf5SNErC9OblUYGztbmBicgYYjikjCXAPlkAV49f1v635dZEe1PZWG0K8Gtu7rnMIFcOsjiadh5vWYDzt9V9u%2FwXmMWmvipXlJ7%2BuNJ1bpkfmTnS%2FhwjgcEvSTDghbYoS%2B35qKYQG%2FT1AtMGvkz2h0uM%2Bv9nSqR0sGtSY1UClvCn%2BIxoQnd8jvfkw71z6cdRJUG9In3ucJt8%2B5qyFKU2XyQkFgwluzy1gY6pgHfjmFQ8QHT33ZbKYgHveIlqHgoN1AiYJwmcj3XRG%2B3NfhnvKDeFxjeoCZQpylKk36jSJVjCFMbA2Pn%2BYsM0s8GHnp9Ip%2BMJFKYuaEuQ6rj7Xy9rWZISa1AFtEjZQfKQSSkto1Daklso2O%2F6mc0gOpeZlJZ15gWOupZ0QHzX%2FlCC74Fusbf69FDRH5LD02Jm9a47llOOlS4WGCjA2p1XqYeNX7RBszZ&X-Amz-Signature=e094353ce66ae853f584d5111249023514532f5d15790005be6a21733d486d8e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
