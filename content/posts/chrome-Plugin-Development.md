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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HH2HXWV%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T102619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG0Wk8%2FbyGLQccvrD9yPSETfljMOOKTNGTi0%2F6yWl9KyAiBghmZI%2FVg2NXaDpdFIyoAAPT0g827AuXVk6yGYeDjaXyqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMBwutblEkdvUGCdKbKtwDlckaWtwG7vaHXxQCD65wI%2B%2FEdw2VhgUsfX6Ji%2B8a4r8jk0ugj%2B%2FOS%2FwxL1GOD%2BFUp9gAJssHVxE9h4wasIQABOvE9AHP3rd9gvma%2Frl8HdCqkPup0EvFj3H%2Fkrp%2B5D7fLo67fNG3gn06Wty5DYaIgAxL%2Fd%2B62vs2IndAl08l7vZqZqE8aUw8QQJJca4BeS8IeQXEY36ztqGaQRDKmxgDugjwrNJkm7C%2BBSsGTAyZysXE8V0SPkNMjTyKtx8CileLkad3qHXpU62%2BCqdCqmxDtlmQIV2PVfTnoeEb77j3jVy0mD125nCBcQtiM%2FMmyoMVOJpsFruTdm3kNlWl%2FOybN8oS4fgvRm1a86zSOjbhXRKSyEM3BQXprBvsVfSoDcgzar2nqYxuXc%2FXqWthZkCwtxUuELgyEro6cXlEMIF4v4kd%2Faah358U6lgQHMPAvFSdofrmYfrb9iHnZfyhZELGZturGsb9roS2Wb%2BGjwlQ8QBk2153%2BJJ5A8AtozrYI%2BSgJGBB%2FuzxmAqlMGLOocAi6efFk9rfriONBZGcgkVarRtECenHfoGJGR9jLh4Xr37%2FL2mLPA3cNltm19WCzO784W0AWTRhvf87b%2Fq8p%2FB6WcfPEJc8tci0IwoSacYwz7%2FO1QY6pgHh47RZX0c%2FegpgZIhAcCqqwULXk47qvtFwFoazN%2FozOyak0rhDrq0zm%2BNadEZ5UAOeDqR%2FWYiBuf9JaEn3Z6Ruox37wHkQ7VVsWXP6V9WweW%2BdgJTiLTMk2ccX8RUm8a7PFAKOSJeR683wgitnxv75B1AH4KZJ%2FPHnUSwKhMBfuc6RW02W3aA0b6tnJPc%2FEJPV5eIi9pG8%2Bas7MqOTq2UjdurdaBSi&X-Amz-Signature=a37ee7450d7f78fd11e2deadf69629d7e1c14625126b4bd6231791c3dc203c54&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HH2HXWV%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T102619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG0Wk8%2FbyGLQccvrD9yPSETfljMOOKTNGTi0%2F6yWl9KyAiBghmZI%2FVg2NXaDpdFIyoAAPT0g827AuXVk6yGYeDjaXyqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMBwutblEkdvUGCdKbKtwDlckaWtwG7vaHXxQCD65wI%2B%2FEdw2VhgUsfX6Ji%2B8a4r8jk0ugj%2B%2FOS%2FwxL1GOD%2BFUp9gAJssHVxE9h4wasIQABOvE9AHP3rd9gvma%2Frl8HdCqkPup0EvFj3H%2Fkrp%2B5D7fLo67fNG3gn06Wty5DYaIgAxL%2Fd%2B62vs2IndAl08l7vZqZqE8aUw8QQJJca4BeS8IeQXEY36ztqGaQRDKmxgDugjwrNJkm7C%2BBSsGTAyZysXE8V0SPkNMjTyKtx8CileLkad3qHXpU62%2BCqdCqmxDtlmQIV2PVfTnoeEb77j3jVy0mD125nCBcQtiM%2FMmyoMVOJpsFruTdm3kNlWl%2FOybN8oS4fgvRm1a86zSOjbhXRKSyEM3BQXprBvsVfSoDcgzar2nqYxuXc%2FXqWthZkCwtxUuELgyEro6cXlEMIF4v4kd%2Faah358U6lgQHMPAvFSdofrmYfrb9iHnZfyhZELGZturGsb9roS2Wb%2BGjwlQ8QBk2153%2BJJ5A8AtozrYI%2BSgJGBB%2FuzxmAqlMGLOocAi6efFk9rfriONBZGcgkVarRtECenHfoGJGR9jLh4Xr37%2FL2mLPA3cNltm19WCzO784W0AWTRhvf87b%2Fq8p%2FB6WcfPEJc8tci0IwoSacYwz7%2FO1QY6pgHh47RZX0c%2FegpgZIhAcCqqwULXk47qvtFwFoazN%2FozOyak0rhDrq0zm%2BNadEZ5UAOeDqR%2FWYiBuf9JaEn3Z6Ruox37wHkQ7VVsWXP6V9WweW%2BdgJTiLTMk2ccX8RUm8a7PFAKOSJeR683wgitnxv75B1AH4KZJ%2FPHnUSwKhMBfuc6RW02W3aA0b6tnJPc%2FEJPV5eIi9pG8%2Bas7MqOTq2UjdurdaBSi&X-Amz-Signature=d83c647719fd53e65d7d70577cfb6b66e40b92e70d202c05311a41bbff63ad1d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HH2HXWV%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T102619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG0Wk8%2FbyGLQccvrD9yPSETfljMOOKTNGTi0%2F6yWl9KyAiBghmZI%2FVg2NXaDpdFIyoAAPT0g827AuXVk6yGYeDjaXyqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMBwutblEkdvUGCdKbKtwDlckaWtwG7vaHXxQCD65wI%2B%2FEdw2VhgUsfX6Ji%2B8a4r8jk0ugj%2B%2FOS%2FwxL1GOD%2BFUp9gAJssHVxE9h4wasIQABOvE9AHP3rd9gvma%2Frl8HdCqkPup0EvFj3H%2Fkrp%2B5D7fLo67fNG3gn06Wty5DYaIgAxL%2Fd%2B62vs2IndAl08l7vZqZqE8aUw8QQJJca4BeS8IeQXEY36ztqGaQRDKmxgDugjwrNJkm7C%2BBSsGTAyZysXE8V0SPkNMjTyKtx8CileLkad3qHXpU62%2BCqdCqmxDtlmQIV2PVfTnoeEb77j3jVy0mD125nCBcQtiM%2FMmyoMVOJpsFruTdm3kNlWl%2FOybN8oS4fgvRm1a86zSOjbhXRKSyEM3BQXprBvsVfSoDcgzar2nqYxuXc%2FXqWthZkCwtxUuELgyEro6cXlEMIF4v4kd%2Faah358U6lgQHMPAvFSdofrmYfrb9iHnZfyhZELGZturGsb9roS2Wb%2BGjwlQ8QBk2153%2BJJ5A8AtozrYI%2BSgJGBB%2FuzxmAqlMGLOocAi6efFk9rfriONBZGcgkVarRtECenHfoGJGR9jLh4Xr37%2FL2mLPA3cNltm19WCzO784W0AWTRhvf87b%2Fq8p%2FB6WcfPEJc8tci0IwoSacYwz7%2FO1QY6pgHh47RZX0c%2FegpgZIhAcCqqwULXk47qvtFwFoazN%2FozOyak0rhDrq0zm%2BNadEZ5UAOeDqR%2FWYiBuf9JaEn3Z6Ruox37wHkQ7VVsWXP6V9WweW%2BdgJTiLTMk2ccX8RUm8a7PFAKOSJeR683wgitnxv75B1AH4KZJ%2FPHnUSwKhMBfuc6RW02W3aA0b6tnJPc%2FEJPV5eIi9pG8%2Bas7MqOTq2UjdurdaBSi&X-Amz-Signature=60e4a8d4a52ebb4bde2ebab2bc2b1a216e183f98c7cc607913fe0bcf497e0171&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663HH2HXWV%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T102619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIG0Wk8%2FbyGLQccvrD9yPSETfljMOOKTNGTi0%2F6yWl9KyAiBghmZI%2FVg2NXaDpdFIyoAAPT0g827AuXVk6yGYeDjaXyqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMBwutblEkdvUGCdKbKtwDlckaWtwG7vaHXxQCD65wI%2B%2FEdw2VhgUsfX6Ji%2B8a4r8jk0ugj%2B%2FOS%2FwxL1GOD%2BFUp9gAJssHVxE9h4wasIQABOvE9AHP3rd9gvma%2Frl8HdCqkPup0EvFj3H%2Fkrp%2B5D7fLo67fNG3gn06Wty5DYaIgAxL%2Fd%2B62vs2IndAl08l7vZqZqE8aUw8QQJJca4BeS8IeQXEY36ztqGaQRDKmxgDugjwrNJkm7C%2BBSsGTAyZysXE8V0SPkNMjTyKtx8CileLkad3qHXpU62%2BCqdCqmxDtlmQIV2PVfTnoeEb77j3jVy0mD125nCBcQtiM%2FMmyoMVOJpsFruTdm3kNlWl%2FOybN8oS4fgvRm1a86zSOjbhXRKSyEM3BQXprBvsVfSoDcgzar2nqYxuXc%2FXqWthZkCwtxUuELgyEro6cXlEMIF4v4kd%2Faah358U6lgQHMPAvFSdofrmYfrb9iHnZfyhZELGZturGsb9roS2Wb%2BGjwlQ8QBk2153%2BJJ5A8AtozrYI%2BSgJGBB%2FuzxmAqlMGLOocAi6efFk9rfriONBZGcgkVarRtECenHfoGJGR9jLh4Xr37%2FL2mLPA3cNltm19WCzO784W0AWTRhvf87b%2Fq8p%2FB6WcfPEJc8tci0IwoSacYwz7%2FO1QY6pgHh47RZX0c%2FegpgZIhAcCqqwULXk47qvtFwFoazN%2FozOyak0rhDrq0zm%2BNadEZ5UAOeDqR%2FWYiBuf9JaEn3Z6Ruox37wHkQ7VVsWXP6V9WweW%2BdgJTiLTMk2ccX8RUm8a7PFAKOSJeR683wgitnxv75B1AH4KZJ%2FPHnUSwKhMBfuc6RW02W3aA0b6tnJPc%2FEJPV5eIi9pG8%2Bas7MqOTq2UjdurdaBSi&X-Amz-Signature=abd18665b7edf0039ab1a0675b6582c80bce66a9403be065790f9be77e6f20aa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
