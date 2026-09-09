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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667TFSCKBX%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T153107Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCUYJxmIwk7qZDwv7hxuohhUTQ5ojwrQXvdrIt8KhdyMwIgQdKP6%2B0MHKZFf25Z%2B9lWNtOIcifOl%2FU0CgJFnuF0BxAq%2FwMIcBAAGgw2Mzc0MjMxODM4MDUiDBWkkoq0Ma%2F8XQVubCrcA5bYiPhV5SwBauyyXTB4TVwYQpNN7hTWMaVb7%2FnYfPl6eSvtlsokUmlre7ClkepUE7X%2B5AH5EGb66qPvaahmF9oy3QCWmStxle9WBsnmkACIWwJRtH8ALNXA%2BbCGwoMBLej%2F0PPZ5pxP16v%2B87zlIVrvGn%2Btp6gBahzj0bJT6q72w9cQ0ZOo6RtWTZGwYe3X%2B%2Fdpvy38F01Yy02IYMQS96M%2BFne5beX9uYXo%2FPR%2Bsw7n5FtCm1Q9BbvNSRg6zDoqUjcDEh5YxD7QKK12OVH3%2B2w%2FnUL2ZNiJgc%2F9hgJMRQ8KY%2BCOZtEUzYVVbU5Yh7%2FOhoLlpBiICiETGXppFw2VjCqci3Yp2i%2F00Ickfg1l4qzwN5oKoJZZItpNymY1TGFe2tUi6bwQRXjIpIFTt29CjykYH6A4OSL9ou%2BijWPsaajG6xbgAU4PcdUGzuwLDrY%2F%2BgRRlz6kMzfDiSJ5gHmZsTfDyHa3TQTgDgoCSFXxSrbjpbl09aNnm0N2s6r3qGZ%2FrhHBrUkDsrwmVCS42xtRIsa%2FFMuZp8f1SpHemHaekSkJVGm9GxHl96e0B%2BR1qRmyxqQ6AMAyukL7ti%2BaOxo6agjlqCnC0Q0VG2W%2BEWrtlX15K0Qb6T4HdGjqZtR3MILlhdUGOqUByB%2BvngYYXEKQ2ShJjoi7i5GgJ%2FX3SvgZA0JZQqJTYU82wWHo6TseadAL161gP%2F1w6aGul0XLmVsMJQ6jDeZIxoGNUqVO73o%2BRifaZpnaDBIXerj2E9zqQ0PWnaFbnSgYvKOI1SOnsTTPpwAjLOVSKHWtsptYqi1knEXLElF5g%2F6nP2tXqi3Dm0Y6MTyAiDGJyskT7FpuGbMVQdm3OL3D6HmRB24e&X-Amz-Signature=0eee4a2144e4dc2f71af6c225cdfd9d97e20f0ab20676e9e4b94d3e5627c2f7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667TFSCKBX%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T153107Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCUYJxmIwk7qZDwv7hxuohhUTQ5ojwrQXvdrIt8KhdyMwIgQdKP6%2B0MHKZFf25Z%2B9lWNtOIcifOl%2FU0CgJFnuF0BxAq%2FwMIcBAAGgw2Mzc0MjMxODM4MDUiDBWkkoq0Ma%2F8XQVubCrcA5bYiPhV5SwBauyyXTB4TVwYQpNN7hTWMaVb7%2FnYfPl6eSvtlsokUmlre7ClkepUE7X%2B5AH5EGb66qPvaahmF9oy3QCWmStxle9WBsnmkACIWwJRtH8ALNXA%2BbCGwoMBLej%2F0PPZ5pxP16v%2B87zlIVrvGn%2Btp6gBahzj0bJT6q72w9cQ0ZOo6RtWTZGwYe3X%2B%2Fdpvy38F01Yy02IYMQS96M%2BFne5beX9uYXo%2FPR%2Bsw7n5FtCm1Q9BbvNSRg6zDoqUjcDEh5YxD7QKK12OVH3%2B2w%2FnUL2ZNiJgc%2F9hgJMRQ8KY%2BCOZtEUzYVVbU5Yh7%2FOhoLlpBiICiETGXppFw2VjCqci3Yp2i%2F00Ickfg1l4qzwN5oKoJZZItpNymY1TGFe2tUi6bwQRXjIpIFTt29CjykYH6A4OSL9ou%2BijWPsaajG6xbgAU4PcdUGzuwLDrY%2F%2BgRRlz6kMzfDiSJ5gHmZsTfDyHa3TQTgDgoCSFXxSrbjpbl09aNnm0N2s6r3qGZ%2FrhHBrUkDsrwmVCS42xtRIsa%2FFMuZp8f1SpHemHaekSkJVGm9GxHl96e0B%2BR1qRmyxqQ6AMAyukL7ti%2BaOxo6agjlqCnC0Q0VG2W%2BEWrtlX15K0Qb6T4HdGjqZtR3MILlhdUGOqUByB%2BvngYYXEKQ2ShJjoi7i5GgJ%2FX3SvgZA0JZQqJTYU82wWHo6TseadAL161gP%2F1w6aGul0XLmVsMJQ6jDeZIxoGNUqVO73o%2BRifaZpnaDBIXerj2E9zqQ0PWnaFbnSgYvKOI1SOnsTTPpwAjLOVSKHWtsptYqi1knEXLElF5g%2F6nP2tXqi3Dm0Y6MTyAiDGJyskT7FpuGbMVQdm3OL3D6HmRB24e&X-Amz-Signature=0fedbe2d8d2164b0f4bceef362355798ff8db722aaac282d513fa3c01f68495d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667TFSCKBX%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T153107Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCUYJxmIwk7qZDwv7hxuohhUTQ5ojwrQXvdrIt8KhdyMwIgQdKP6%2B0MHKZFf25Z%2B9lWNtOIcifOl%2FU0CgJFnuF0BxAq%2FwMIcBAAGgw2Mzc0MjMxODM4MDUiDBWkkoq0Ma%2F8XQVubCrcA5bYiPhV5SwBauyyXTB4TVwYQpNN7hTWMaVb7%2FnYfPl6eSvtlsokUmlre7ClkepUE7X%2B5AH5EGb66qPvaahmF9oy3QCWmStxle9WBsnmkACIWwJRtH8ALNXA%2BbCGwoMBLej%2F0PPZ5pxP16v%2B87zlIVrvGn%2Btp6gBahzj0bJT6q72w9cQ0ZOo6RtWTZGwYe3X%2B%2Fdpvy38F01Yy02IYMQS96M%2BFne5beX9uYXo%2FPR%2Bsw7n5FtCm1Q9BbvNSRg6zDoqUjcDEh5YxD7QKK12OVH3%2B2w%2FnUL2ZNiJgc%2F9hgJMRQ8KY%2BCOZtEUzYVVbU5Yh7%2FOhoLlpBiICiETGXppFw2VjCqci3Yp2i%2F00Ickfg1l4qzwN5oKoJZZItpNymY1TGFe2tUi6bwQRXjIpIFTt29CjykYH6A4OSL9ou%2BijWPsaajG6xbgAU4PcdUGzuwLDrY%2F%2BgRRlz6kMzfDiSJ5gHmZsTfDyHa3TQTgDgoCSFXxSrbjpbl09aNnm0N2s6r3qGZ%2FrhHBrUkDsrwmVCS42xtRIsa%2FFMuZp8f1SpHemHaekSkJVGm9GxHl96e0B%2BR1qRmyxqQ6AMAyukL7ti%2BaOxo6agjlqCnC0Q0VG2W%2BEWrtlX15K0Qb6T4HdGjqZtR3MILlhdUGOqUByB%2BvngYYXEKQ2ShJjoi7i5GgJ%2FX3SvgZA0JZQqJTYU82wWHo6TseadAL161gP%2F1w6aGul0XLmVsMJQ6jDeZIxoGNUqVO73o%2BRifaZpnaDBIXerj2E9zqQ0PWnaFbnSgYvKOI1SOnsTTPpwAjLOVSKHWtsptYqi1knEXLElF5g%2F6nP2tXqi3Dm0Y6MTyAiDGJyskT7FpuGbMVQdm3OL3D6HmRB24e&X-Amz-Signature=05fe287674ed9ba785789c5cd4b590ad7d3d37f4c64c055e2db9f7b3ffed431d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667TFSCKBX%2F20260909%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260909T153107Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCUYJxmIwk7qZDwv7hxuohhUTQ5ojwrQXvdrIt8KhdyMwIgQdKP6%2B0MHKZFf25Z%2B9lWNtOIcifOl%2FU0CgJFnuF0BxAq%2FwMIcBAAGgw2Mzc0MjMxODM4MDUiDBWkkoq0Ma%2F8XQVubCrcA5bYiPhV5SwBauyyXTB4TVwYQpNN7hTWMaVb7%2FnYfPl6eSvtlsokUmlre7ClkepUE7X%2B5AH5EGb66qPvaahmF9oy3QCWmStxle9WBsnmkACIWwJRtH8ALNXA%2BbCGwoMBLej%2F0PPZ5pxP16v%2B87zlIVrvGn%2Btp6gBahzj0bJT6q72w9cQ0ZOo6RtWTZGwYe3X%2B%2Fdpvy38F01Yy02IYMQS96M%2BFne5beX9uYXo%2FPR%2Bsw7n5FtCm1Q9BbvNSRg6zDoqUjcDEh5YxD7QKK12OVH3%2B2w%2FnUL2ZNiJgc%2F9hgJMRQ8KY%2BCOZtEUzYVVbU5Yh7%2FOhoLlpBiICiETGXppFw2VjCqci3Yp2i%2F00Ickfg1l4qzwN5oKoJZZItpNymY1TGFe2tUi6bwQRXjIpIFTt29CjykYH6A4OSL9ou%2BijWPsaajG6xbgAU4PcdUGzuwLDrY%2F%2BgRRlz6kMzfDiSJ5gHmZsTfDyHa3TQTgDgoCSFXxSrbjpbl09aNnm0N2s6r3qGZ%2FrhHBrUkDsrwmVCS42xtRIsa%2FFMuZp8f1SpHemHaekSkJVGm9GxHl96e0B%2BR1qRmyxqQ6AMAyukL7ti%2BaOxo6agjlqCnC0Q0VG2W%2BEWrtlX15K0Qb6T4HdGjqZtR3MILlhdUGOqUByB%2BvngYYXEKQ2ShJjoi7i5GgJ%2FX3SvgZA0JZQqJTYU82wWHo6TseadAL161gP%2F1w6aGul0XLmVsMJQ6jDeZIxoGNUqVO73o%2BRifaZpnaDBIXerj2E9zqQ0PWnaFbnSgYvKOI1SOnsTTPpwAjLOVSKHWtsptYqi1knEXLElF5g%2F6nP2tXqi3Dm0Y6MTyAiDGJyskT7FpuGbMVQdm3OL3D6HmRB24e&X-Amz-Signature=50e19224095c79b69290fa7c10b7f47d71b225a98eda8104722d9d8e59a6a610&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
