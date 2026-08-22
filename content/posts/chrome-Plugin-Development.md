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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZSNRN3S%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T003624Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8nhsVxp4XAIYDRpQDWJSFpoHSHxJ9G%2BdjD%2FKAZGskCwIhAPxNHDzx9YbjqEGVKgGIfFWsEKfc718%2FYtv%2BHnHk1Qu0KogECLH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxnlY2ks%2FGfGTlbnFsq3AOzNafBA%2BIPVWO1FY7Ht%2FS5apVtG4pDKEqeBj1itmrHEOAdJHnwimQ1nOtTEO6TwcvPGwUMaoC3h24zso1pEhlW77yw1pJ3NvhUtgapnoiyBDQjsB7UEafUSfIWowTbrZaGYroxU7sNx0b5O41Kh98p%2B8iZXRZ%2B3lcI3n8XlQjd%2FqBoVjRaEYBjJYZkfsqyf%2B0UvmryGn%2FV1RGySPmhgkF%2FhPZiK%2FKdbwRUFexREJUdajnDinfAnotSPD%2FkINaeawfEk5ab25JJWjcpfXgDaD6r%2FVYK4Hm9LQTN1fCg0EkQd4%2BYw3wlCmJixEuri2ac77MF7c8ZxTdbPUQNQs%2BHxZ2ohgJRdJ83CqxAt4xNoV7UYQNqOnOZ4jK0rN%2FT6OJgPtxo7pLvtgRoCf%2FK%2B4K2Fj9VC5lqHM%2BIOLmVRU0cofI0PvxDJettE%2BJn%2BMdMCvurIaVkq8F3bCMRLer%2FIMnauh2rNf%2FOpE3UaFTgztfOh%2ByoQSJXT3%2Byl9saF8xcPBw9SsW34UVkHDW4ap%2FMviBkc9lbZGAytAj2BkAYjmPOdGX1Wz2hVGQ%2BnSOIm6T2ENAXOOW2HBB7N292Mz02%2FhQ2Kr%2FySzHKO08Jerq2lSaKRNOEuMLLHbPMzNTHO6MICDCXxaPUBjqkAYFMcXIxJYgOAfuEtvFue%2FyOTCTZ6UfZ%2Bp5N%2Fro8buz1ymFYxMPOwFCS83lmHROiDBdOH5yyXD%2FRk40UERts2TpUU2%2FukDKmqBa7f6CSfMRcNsU0E6cgmQEtLrvIdg4WpRza0KEO5CsaMCKHbYyZR1oheqrID4m%2Bzc5%2Fl6xMEzkMOKp9lxCB%2BAgmvVvW2cwhJpZ%2FSgWy0wqipw6YKhYD4IjCPYbG&X-Amz-Signature=6c53e717d14592fd6b720f5ac49e71142f062317b1ddb653042c99540736e96e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZSNRN3S%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T003624Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8nhsVxp4XAIYDRpQDWJSFpoHSHxJ9G%2BdjD%2FKAZGskCwIhAPxNHDzx9YbjqEGVKgGIfFWsEKfc718%2FYtv%2BHnHk1Qu0KogECLH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxnlY2ks%2FGfGTlbnFsq3AOzNafBA%2BIPVWO1FY7Ht%2FS5apVtG4pDKEqeBj1itmrHEOAdJHnwimQ1nOtTEO6TwcvPGwUMaoC3h24zso1pEhlW77yw1pJ3NvhUtgapnoiyBDQjsB7UEafUSfIWowTbrZaGYroxU7sNx0b5O41Kh98p%2B8iZXRZ%2B3lcI3n8XlQjd%2FqBoVjRaEYBjJYZkfsqyf%2B0UvmryGn%2FV1RGySPmhgkF%2FhPZiK%2FKdbwRUFexREJUdajnDinfAnotSPD%2FkINaeawfEk5ab25JJWjcpfXgDaD6r%2FVYK4Hm9LQTN1fCg0EkQd4%2BYw3wlCmJixEuri2ac77MF7c8ZxTdbPUQNQs%2BHxZ2ohgJRdJ83CqxAt4xNoV7UYQNqOnOZ4jK0rN%2FT6OJgPtxo7pLvtgRoCf%2FK%2B4K2Fj9VC5lqHM%2BIOLmVRU0cofI0PvxDJettE%2BJn%2BMdMCvurIaVkq8F3bCMRLer%2FIMnauh2rNf%2FOpE3UaFTgztfOh%2ByoQSJXT3%2Byl9saF8xcPBw9SsW34UVkHDW4ap%2FMviBkc9lbZGAytAj2BkAYjmPOdGX1Wz2hVGQ%2BnSOIm6T2ENAXOOW2HBB7N292Mz02%2FhQ2Kr%2FySzHKO08Jerq2lSaKRNOEuMLLHbPMzNTHO6MICDCXxaPUBjqkAYFMcXIxJYgOAfuEtvFue%2FyOTCTZ6UfZ%2Bp5N%2Fro8buz1ymFYxMPOwFCS83lmHROiDBdOH5yyXD%2FRk40UERts2TpUU2%2FukDKmqBa7f6CSfMRcNsU0E6cgmQEtLrvIdg4WpRza0KEO5CsaMCKHbYyZR1oheqrID4m%2Bzc5%2Fl6xMEzkMOKp9lxCB%2BAgmvVvW2cwhJpZ%2FSgWy0wqipw6YKhYD4IjCPYbG&X-Amz-Signature=fea9ec7a37be8da5a678eb925e68da6aee0879b580140607a85a0097d3c8da80&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZSNRN3S%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T003624Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8nhsVxp4XAIYDRpQDWJSFpoHSHxJ9G%2BdjD%2FKAZGskCwIhAPxNHDzx9YbjqEGVKgGIfFWsEKfc718%2FYtv%2BHnHk1Qu0KogECLH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxnlY2ks%2FGfGTlbnFsq3AOzNafBA%2BIPVWO1FY7Ht%2FS5apVtG4pDKEqeBj1itmrHEOAdJHnwimQ1nOtTEO6TwcvPGwUMaoC3h24zso1pEhlW77yw1pJ3NvhUtgapnoiyBDQjsB7UEafUSfIWowTbrZaGYroxU7sNx0b5O41Kh98p%2B8iZXRZ%2B3lcI3n8XlQjd%2FqBoVjRaEYBjJYZkfsqyf%2B0UvmryGn%2FV1RGySPmhgkF%2FhPZiK%2FKdbwRUFexREJUdajnDinfAnotSPD%2FkINaeawfEk5ab25JJWjcpfXgDaD6r%2FVYK4Hm9LQTN1fCg0EkQd4%2BYw3wlCmJixEuri2ac77MF7c8ZxTdbPUQNQs%2BHxZ2ohgJRdJ83CqxAt4xNoV7UYQNqOnOZ4jK0rN%2FT6OJgPtxo7pLvtgRoCf%2FK%2B4K2Fj9VC5lqHM%2BIOLmVRU0cofI0PvxDJettE%2BJn%2BMdMCvurIaVkq8F3bCMRLer%2FIMnauh2rNf%2FOpE3UaFTgztfOh%2ByoQSJXT3%2Byl9saF8xcPBw9SsW34UVkHDW4ap%2FMviBkc9lbZGAytAj2BkAYjmPOdGX1Wz2hVGQ%2BnSOIm6T2ENAXOOW2HBB7N292Mz02%2FhQ2Kr%2FySzHKO08Jerq2lSaKRNOEuMLLHbPMzNTHO6MICDCXxaPUBjqkAYFMcXIxJYgOAfuEtvFue%2FyOTCTZ6UfZ%2Bp5N%2Fro8buz1ymFYxMPOwFCS83lmHROiDBdOH5yyXD%2FRk40UERts2TpUU2%2FukDKmqBa7f6CSfMRcNsU0E6cgmQEtLrvIdg4WpRza0KEO5CsaMCKHbYyZR1oheqrID4m%2Bzc5%2Fl6xMEzkMOKp9lxCB%2BAgmvVvW2cwhJpZ%2FSgWy0wqipw6YKhYD4IjCPYbG&X-Amz-Signature=1a221fac3b173a2a31488148d5e03c52b4b0660288d19add76a16caa8b0a82ab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZSNRN3S%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T003624Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8nhsVxp4XAIYDRpQDWJSFpoHSHxJ9G%2BdjD%2FKAZGskCwIhAPxNHDzx9YbjqEGVKgGIfFWsEKfc718%2FYtv%2BHnHk1Qu0KogECLH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxnlY2ks%2FGfGTlbnFsq3AOzNafBA%2BIPVWO1FY7Ht%2FS5apVtG4pDKEqeBj1itmrHEOAdJHnwimQ1nOtTEO6TwcvPGwUMaoC3h24zso1pEhlW77yw1pJ3NvhUtgapnoiyBDQjsB7UEafUSfIWowTbrZaGYroxU7sNx0b5O41Kh98p%2B8iZXRZ%2B3lcI3n8XlQjd%2FqBoVjRaEYBjJYZkfsqyf%2B0UvmryGn%2FV1RGySPmhgkF%2FhPZiK%2FKdbwRUFexREJUdajnDinfAnotSPD%2FkINaeawfEk5ab25JJWjcpfXgDaD6r%2FVYK4Hm9LQTN1fCg0EkQd4%2BYw3wlCmJixEuri2ac77MF7c8ZxTdbPUQNQs%2BHxZ2ohgJRdJ83CqxAt4xNoV7UYQNqOnOZ4jK0rN%2FT6OJgPtxo7pLvtgRoCf%2FK%2B4K2Fj9VC5lqHM%2BIOLmVRU0cofI0PvxDJettE%2BJn%2BMdMCvurIaVkq8F3bCMRLer%2FIMnauh2rNf%2FOpE3UaFTgztfOh%2ByoQSJXT3%2Byl9saF8xcPBw9SsW34UVkHDW4ap%2FMviBkc9lbZGAytAj2BkAYjmPOdGX1Wz2hVGQ%2BnSOIm6T2ENAXOOW2HBB7N292Mz02%2FhQ2Kr%2FySzHKO08Jerq2lSaKRNOEuMLLHbPMzNTHO6MICDCXxaPUBjqkAYFMcXIxJYgOAfuEtvFue%2FyOTCTZ6UfZ%2Bp5N%2Fro8buz1ymFYxMPOwFCS83lmHROiDBdOH5yyXD%2FRk40UERts2TpUU2%2FukDKmqBa7f6CSfMRcNsU0E6cgmQEtLrvIdg4WpRza0KEO5CsaMCKHbYyZR1oheqrID4m%2Bzc5%2Fl6xMEzkMOKp9lxCB%2BAgmvVvW2cwhJpZ%2FSgWy0wqipw6YKhYD4IjCPYbG&X-Amz-Signature=923db5a0d97a6782bc57c257a25c78fca705795595a922a1cf0947dfb4b2ba24&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
