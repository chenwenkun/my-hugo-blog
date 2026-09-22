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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3MEI5XA%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T155511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCD72wciTqyXJuEvbxvwg0BTr%2BH75INgGix9o%2FemO%2FAlQIhANgxWzJ1XIhBguJ2sjE94Ru%2FNCeSt%2FKhETAN6tx%2BvrQdKogECKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxaCd%2BqyfmHQLaq4LYq3ANQTb7quu6dOwjMTZMR%2BvNKYRQny2Sg4eQJLSnkFhZvjR0XoQWoOGzUXs1Afbt66dV8dPG%2Bk6PmTl6Y%2F%2BwC%2BVyhLsU6hx3JkJyPKD512EvXXbVFCEzCQvGuOeuPtc4AHaYh26caXeYQxKhhKoWB9VkUSz1P5%2Fe8ye71Lex1KNoI%2BBM8rluvTFqj2GEd4Z%2FYP%2F6jRwNApcF8cmNjY3pxkqDM0bqmuFW304g0rpdZcqBW%2FjbjfbjkGqUp8LvBb08WByoUMVaPk4OMoWpdkl4%2B%2FS%2FeG%2FUEhHHChw%2BlXXTJH%2BRdt4NMq5vf3FprZtH1HsnTfCxJHPJAEuzLDdfPgoxng38bM1U7Lx6KNntl52iaAhv6%2BDS0RfeYYbiuXT6YJhcz%2BZ7tBbS0HVfGfkomwv3PJ4%2FtnAk6IIX72PSI2oNhlJ%2FLYn%2BZv8sKjHKr5xlwPiDWVYrbGPDqK0bqTDaFSMLvTNZm7DDM20x4q%2BxdUynnwdP7XgP273cVoKsiFg4UDxQbrkKNTgXJ0q7Fr4tUTNzgEV9V1iN19LyLYnR%2Fq0HL%2FmdvVs3B7Gt3vS9coZV6jMj%2FhzkFPPzJ%2FikUQsG4OiBMpjaijm9Qfrp%2BKL0DNjYOuGGUQqg%2BBO3NIreiAMioBTD%2Fh8rVBjqkAcEXeFwtxXBiYx1WM%2BwyFgb2Homkrq3Kl1p353o8TGh7W3oqXIdicpEDcfTYQK2drrpLYREN1OJ3pPg215Cr0YcRbPL62QvChwZCYXYyeostlHHkuahkz1E36UsptqBrrW9McNxdZyqQa5p30Xq75xKIebvrRblg3LtR1VL%2FllR9BwVqiLJyURkP%2BnQmXfKwvVeT4kfbcQ7C3DDQVN%2FdLLnhue0W&X-Amz-Signature=bf16cd4f16f9551c9ea290a974bd52e062e407a5a9b2d94876ccb4317670214c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3MEI5XA%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T155511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCD72wciTqyXJuEvbxvwg0BTr%2BH75INgGix9o%2FemO%2FAlQIhANgxWzJ1XIhBguJ2sjE94Ru%2FNCeSt%2FKhETAN6tx%2BvrQdKogECKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxaCd%2BqyfmHQLaq4LYq3ANQTb7quu6dOwjMTZMR%2BvNKYRQny2Sg4eQJLSnkFhZvjR0XoQWoOGzUXs1Afbt66dV8dPG%2Bk6PmTl6Y%2F%2BwC%2BVyhLsU6hx3JkJyPKD512EvXXbVFCEzCQvGuOeuPtc4AHaYh26caXeYQxKhhKoWB9VkUSz1P5%2Fe8ye71Lex1KNoI%2BBM8rluvTFqj2GEd4Z%2FYP%2F6jRwNApcF8cmNjY3pxkqDM0bqmuFW304g0rpdZcqBW%2FjbjfbjkGqUp8LvBb08WByoUMVaPk4OMoWpdkl4%2B%2FS%2FeG%2FUEhHHChw%2BlXXTJH%2BRdt4NMq5vf3FprZtH1HsnTfCxJHPJAEuzLDdfPgoxng38bM1U7Lx6KNntl52iaAhv6%2BDS0RfeYYbiuXT6YJhcz%2BZ7tBbS0HVfGfkomwv3PJ4%2FtnAk6IIX72PSI2oNhlJ%2FLYn%2BZv8sKjHKr5xlwPiDWVYrbGPDqK0bqTDaFSMLvTNZm7DDM20x4q%2BxdUynnwdP7XgP273cVoKsiFg4UDxQbrkKNTgXJ0q7Fr4tUTNzgEV9V1iN19LyLYnR%2Fq0HL%2FmdvVs3B7Gt3vS9coZV6jMj%2FhzkFPPzJ%2FikUQsG4OiBMpjaijm9Qfrp%2BKL0DNjYOuGGUQqg%2BBO3NIreiAMioBTD%2Fh8rVBjqkAcEXeFwtxXBiYx1WM%2BwyFgb2Homkrq3Kl1p353o8TGh7W3oqXIdicpEDcfTYQK2drrpLYREN1OJ3pPg215Cr0YcRbPL62QvChwZCYXYyeostlHHkuahkz1E36UsptqBrrW9McNxdZyqQa5p30Xq75xKIebvrRblg3LtR1VL%2FllR9BwVqiLJyURkP%2BnQmXfKwvVeT4kfbcQ7C3DDQVN%2FdLLnhue0W&X-Amz-Signature=b4af6844661d30e8afaabc04b34e2d529d46e359d9d9277670f9847531c424cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3MEI5XA%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T155511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCD72wciTqyXJuEvbxvwg0BTr%2BH75INgGix9o%2FemO%2FAlQIhANgxWzJ1XIhBguJ2sjE94Ru%2FNCeSt%2FKhETAN6tx%2BvrQdKogECKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxaCd%2BqyfmHQLaq4LYq3ANQTb7quu6dOwjMTZMR%2BvNKYRQny2Sg4eQJLSnkFhZvjR0XoQWoOGzUXs1Afbt66dV8dPG%2Bk6PmTl6Y%2F%2BwC%2BVyhLsU6hx3JkJyPKD512EvXXbVFCEzCQvGuOeuPtc4AHaYh26caXeYQxKhhKoWB9VkUSz1P5%2Fe8ye71Lex1KNoI%2BBM8rluvTFqj2GEd4Z%2FYP%2F6jRwNApcF8cmNjY3pxkqDM0bqmuFW304g0rpdZcqBW%2FjbjfbjkGqUp8LvBb08WByoUMVaPk4OMoWpdkl4%2B%2FS%2FeG%2FUEhHHChw%2BlXXTJH%2BRdt4NMq5vf3FprZtH1HsnTfCxJHPJAEuzLDdfPgoxng38bM1U7Lx6KNntl52iaAhv6%2BDS0RfeYYbiuXT6YJhcz%2BZ7tBbS0HVfGfkomwv3PJ4%2FtnAk6IIX72PSI2oNhlJ%2FLYn%2BZv8sKjHKr5xlwPiDWVYrbGPDqK0bqTDaFSMLvTNZm7DDM20x4q%2BxdUynnwdP7XgP273cVoKsiFg4UDxQbrkKNTgXJ0q7Fr4tUTNzgEV9V1iN19LyLYnR%2Fq0HL%2FmdvVs3B7Gt3vS9coZV6jMj%2FhzkFPPzJ%2FikUQsG4OiBMpjaijm9Qfrp%2BKL0DNjYOuGGUQqg%2BBO3NIreiAMioBTD%2Fh8rVBjqkAcEXeFwtxXBiYx1WM%2BwyFgb2Homkrq3Kl1p353o8TGh7W3oqXIdicpEDcfTYQK2drrpLYREN1OJ3pPg215Cr0YcRbPL62QvChwZCYXYyeostlHHkuahkz1E36UsptqBrrW9McNxdZyqQa5p30Xq75xKIebvrRblg3LtR1VL%2FllR9BwVqiLJyURkP%2BnQmXfKwvVeT4kfbcQ7C3DDQVN%2FdLLnhue0W&X-Amz-Signature=34a5e1aa7ea5bc00a0ae68479134556bb69b02efc39a385d3373c5387ffaa9c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3MEI5XA%2F20260922%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260922T155511Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCD72wciTqyXJuEvbxvwg0BTr%2BH75INgGix9o%2FemO%2FAlQIhANgxWzJ1XIhBguJ2sjE94Ru%2FNCeSt%2FKhETAN6tx%2BvrQdKogECKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxaCd%2BqyfmHQLaq4LYq3ANQTb7quu6dOwjMTZMR%2BvNKYRQny2Sg4eQJLSnkFhZvjR0XoQWoOGzUXs1Afbt66dV8dPG%2Bk6PmTl6Y%2F%2BwC%2BVyhLsU6hx3JkJyPKD512EvXXbVFCEzCQvGuOeuPtc4AHaYh26caXeYQxKhhKoWB9VkUSz1P5%2Fe8ye71Lex1KNoI%2BBM8rluvTFqj2GEd4Z%2FYP%2F6jRwNApcF8cmNjY3pxkqDM0bqmuFW304g0rpdZcqBW%2FjbjfbjkGqUp8LvBb08WByoUMVaPk4OMoWpdkl4%2B%2FS%2FeG%2FUEhHHChw%2BlXXTJH%2BRdt4NMq5vf3FprZtH1HsnTfCxJHPJAEuzLDdfPgoxng38bM1U7Lx6KNntl52iaAhv6%2BDS0RfeYYbiuXT6YJhcz%2BZ7tBbS0HVfGfkomwv3PJ4%2FtnAk6IIX72PSI2oNhlJ%2FLYn%2BZv8sKjHKr5xlwPiDWVYrbGPDqK0bqTDaFSMLvTNZm7DDM20x4q%2BxdUynnwdP7XgP273cVoKsiFg4UDxQbrkKNTgXJ0q7Fr4tUTNzgEV9V1iN19LyLYnR%2Fq0HL%2FmdvVs3B7Gt3vS9coZV6jMj%2FhzkFPPzJ%2FikUQsG4OiBMpjaijm9Qfrp%2BKL0DNjYOuGGUQqg%2BBO3NIreiAMioBTD%2Fh8rVBjqkAcEXeFwtxXBiYx1WM%2BwyFgb2Homkrq3Kl1p353o8TGh7W3oqXIdicpEDcfTYQK2drrpLYREN1OJ3pPg215Cr0YcRbPL62QvChwZCYXYyeostlHHkuahkz1E36UsptqBrrW9McNxdZyqQa5p30Xq75xKIebvrRblg3LtR1VL%2FllR9BwVqiLJyURkP%2BnQmXfKwvVeT4kfbcQ7C3DDQVN%2FdLLnhue0W&X-Amz-Signature=4f7baa1946f458a93244894d0c82972c40949e273de523aa22ad2aac242813de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
