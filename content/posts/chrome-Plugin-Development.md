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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOORWXBS%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T015840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAQ0104lahPgPuTByXhAFa%2BjspP2SHhH0D%2BF7%2BszpbtlAiA3vPpeeoAaoi2B9ywCiDfNJj0YPD4xfC64pAO4sCbpbCqIBAiQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMqH5RkuMxcQawHymWKtwDp1Xn130vqfXVChFN%2Bvw7gwNdA9pZJXARz8SH8Fxy8ne72s1CuljIv4rSwna1khZslPKLGhwE9uDyq0QbtkHjo1GPbuM7CCplEvmIM9w78Ke74e9hlS9ZZRaO14ddZDQmMSZ%2FvcG%2FRmaIo1SEEZbpogkj1A0nE%2FrR74UoTdb%2FmH3A3YCQw%2BNHmat5F3JZYmi9gU90126ioPyNgkoyKPKLlRt5JR2ICK4qsr1bMTE%2B5dDKvYVMXWI6pADqRakPkQUYVeZmZRgLh2OZ8P%2F7R3GI%2BarQwXT0qeLbzMj4uXrtDq%2BDyOFMj8VzraPwZPIC%2FWBLSmO7mY%2FqzGuAl2zZGWc9MJ6I%2F4tqsCGC6r1z3yNkW1QzoiE1bU6Kbo%2FR%2FPmDWmdpy%2B4oWHYW0PkG%2B9rRsawa8%2F0fvw8OEFzg78WDszWNSoCrzrH099N%2Baa9FRHZorLqdIZf%2FciPWpjyAQgvR0Pzqi6TDxLwcHUYEqRpg1fDHEJY343UfmIzZwFNLUPfnZHC3%2F887wLV8W73GfOQ%2BFSWrRPEs7fhv2hblC%2BgTlDlqKPk7IKhUBbkukcvivtAf%2Bixvik5wcdPNS794T2iN%2BhcL7uEN9sbenL4ndI4Eu1C0f0uuLwFcaaSQx2DdYWgw5PKM1QY6pgGu7LN%2BitZ%2BnmrPZfK4sRinzwBTMdWCK39UKztPI6r77R45FS7l2ndgdXzHUfb9YdseWdpA4P%2B%2FUOC5dXUnEAazEgVKXFBsoQDv%2Fw3%2BDTddiORjcRLhkYSNQXRbDEerCoAyccdavjGGFB5PmtrHXATy9NGB7MCjErHCYvr0IVbyD6XRRGH8nuGGSAZkjul6cYs6sT6jn1dCGkXEd%2FcZuxhyvqAiwvGO&X-Amz-Signature=363263dc39c6d171200856e1c69a45671b61661c1cb066c04ca23df8f8cb105c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOORWXBS%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T015840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAQ0104lahPgPuTByXhAFa%2BjspP2SHhH0D%2BF7%2BszpbtlAiA3vPpeeoAaoi2B9ywCiDfNJj0YPD4xfC64pAO4sCbpbCqIBAiQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMqH5RkuMxcQawHymWKtwDp1Xn130vqfXVChFN%2Bvw7gwNdA9pZJXARz8SH8Fxy8ne72s1CuljIv4rSwna1khZslPKLGhwE9uDyq0QbtkHjo1GPbuM7CCplEvmIM9w78Ke74e9hlS9ZZRaO14ddZDQmMSZ%2FvcG%2FRmaIo1SEEZbpogkj1A0nE%2FrR74UoTdb%2FmH3A3YCQw%2BNHmat5F3JZYmi9gU90126ioPyNgkoyKPKLlRt5JR2ICK4qsr1bMTE%2B5dDKvYVMXWI6pADqRakPkQUYVeZmZRgLh2OZ8P%2F7R3GI%2BarQwXT0qeLbzMj4uXrtDq%2BDyOFMj8VzraPwZPIC%2FWBLSmO7mY%2FqzGuAl2zZGWc9MJ6I%2F4tqsCGC6r1z3yNkW1QzoiE1bU6Kbo%2FR%2FPmDWmdpy%2B4oWHYW0PkG%2B9rRsawa8%2F0fvw8OEFzg78WDszWNSoCrzrH099N%2Baa9FRHZorLqdIZf%2FciPWpjyAQgvR0Pzqi6TDxLwcHUYEqRpg1fDHEJY343UfmIzZwFNLUPfnZHC3%2F887wLV8W73GfOQ%2BFSWrRPEs7fhv2hblC%2BgTlDlqKPk7IKhUBbkukcvivtAf%2Bixvik5wcdPNS794T2iN%2BhcL7uEN9sbenL4ndI4Eu1C0f0uuLwFcaaSQx2DdYWgw5PKM1QY6pgGu7LN%2BitZ%2BnmrPZfK4sRinzwBTMdWCK39UKztPI6r77R45FS7l2ndgdXzHUfb9YdseWdpA4P%2B%2FUOC5dXUnEAazEgVKXFBsoQDv%2Fw3%2BDTddiORjcRLhkYSNQXRbDEerCoAyccdavjGGFB5PmtrHXATy9NGB7MCjErHCYvr0IVbyD6XRRGH8nuGGSAZkjul6cYs6sT6jn1dCGkXEd%2FcZuxhyvqAiwvGO&X-Amz-Signature=05ba607cb2b747a057fa7bf0dc3455c3ac6c32c2437508cdcfc785ddc5f0435e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOORWXBS%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T015840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAQ0104lahPgPuTByXhAFa%2BjspP2SHhH0D%2BF7%2BszpbtlAiA3vPpeeoAaoi2B9ywCiDfNJj0YPD4xfC64pAO4sCbpbCqIBAiQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMqH5RkuMxcQawHymWKtwDp1Xn130vqfXVChFN%2Bvw7gwNdA9pZJXARz8SH8Fxy8ne72s1CuljIv4rSwna1khZslPKLGhwE9uDyq0QbtkHjo1GPbuM7CCplEvmIM9w78Ke74e9hlS9ZZRaO14ddZDQmMSZ%2FvcG%2FRmaIo1SEEZbpogkj1A0nE%2FrR74UoTdb%2FmH3A3YCQw%2BNHmat5F3JZYmi9gU90126ioPyNgkoyKPKLlRt5JR2ICK4qsr1bMTE%2B5dDKvYVMXWI6pADqRakPkQUYVeZmZRgLh2OZ8P%2F7R3GI%2BarQwXT0qeLbzMj4uXrtDq%2BDyOFMj8VzraPwZPIC%2FWBLSmO7mY%2FqzGuAl2zZGWc9MJ6I%2F4tqsCGC6r1z3yNkW1QzoiE1bU6Kbo%2FR%2FPmDWmdpy%2B4oWHYW0PkG%2B9rRsawa8%2F0fvw8OEFzg78WDszWNSoCrzrH099N%2Baa9FRHZorLqdIZf%2FciPWpjyAQgvR0Pzqi6TDxLwcHUYEqRpg1fDHEJY343UfmIzZwFNLUPfnZHC3%2F887wLV8W73GfOQ%2BFSWrRPEs7fhv2hblC%2BgTlDlqKPk7IKhUBbkukcvivtAf%2Bixvik5wcdPNS794T2iN%2BhcL7uEN9sbenL4ndI4Eu1C0f0uuLwFcaaSQx2DdYWgw5PKM1QY6pgGu7LN%2BitZ%2BnmrPZfK4sRinzwBTMdWCK39UKztPI6r77R45FS7l2ndgdXzHUfb9YdseWdpA4P%2B%2FUOC5dXUnEAazEgVKXFBsoQDv%2Fw3%2BDTddiORjcRLhkYSNQXRbDEerCoAyccdavjGGFB5PmtrHXATy9NGB7MCjErHCYvr0IVbyD6XRRGH8nuGGSAZkjul6cYs6sT6jn1dCGkXEd%2FcZuxhyvqAiwvGO&X-Amz-Signature=16a50e70323f82cec52afab0ca5a9c7df20d52b248195f406bf2c716f8ce979c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOORWXBS%2F20260911%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260911T015840Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAQ0104lahPgPuTByXhAFa%2BjspP2SHhH0D%2BF7%2BszpbtlAiA3vPpeeoAaoi2B9ywCiDfNJj0YPD4xfC64pAO4sCbpbCqIBAiQ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMqH5RkuMxcQawHymWKtwDp1Xn130vqfXVChFN%2Bvw7gwNdA9pZJXARz8SH8Fxy8ne72s1CuljIv4rSwna1khZslPKLGhwE9uDyq0QbtkHjo1GPbuM7CCplEvmIM9w78Ke74e9hlS9ZZRaO14ddZDQmMSZ%2FvcG%2FRmaIo1SEEZbpogkj1A0nE%2FrR74UoTdb%2FmH3A3YCQw%2BNHmat5F3JZYmi9gU90126ioPyNgkoyKPKLlRt5JR2ICK4qsr1bMTE%2B5dDKvYVMXWI6pADqRakPkQUYVeZmZRgLh2OZ8P%2F7R3GI%2BarQwXT0qeLbzMj4uXrtDq%2BDyOFMj8VzraPwZPIC%2FWBLSmO7mY%2FqzGuAl2zZGWc9MJ6I%2F4tqsCGC6r1z3yNkW1QzoiE1bU6Kbo%2FR%2FPmDWmdpy%2B4oWHYW0PkG%2B9rRsawa8%2F0fvw8OEFzg78WDszWNSoCrzrH099N%2Baa9FRHZorLqdIZf%2FciPWpjyAQgvR0Pzqi6TDxLwcHUYEqRpg1fDHEJY343UfmIzZwFNLUPfnZHC3%2F887wLV8W73GfOQ%2BFSWrRPEs7fhv2hblC%2BgTlDlqKPk7IKhUBbkukcvivtAf%2Bixvik5wcdPNS794T2iN%2BhcL7uEN9sbenL4ndI4Eu1C0f0uuLwFcaaSQx2DdYWgw5PKM1QY6pgGu7LN%2BitZ%2BnmrPZfK4sRinzwBTMdWCK39UKztPI6r77R45FS7l2ndgdXzHUfb9YdseWdpA4P%2B%2FUOC5dXUnEAazEgVKXFBsoQDv%2Fw3%2BDTddiORjcRLhkYSNQXRbDEerCoAyccdavjGGFB5PmtrHXATy9NGB7MCjErHCYvr0IVbyD6XRRGH8nuGGSAZkjul6cYs6sT6jn1dCGkXEd%2FcZuxhyvqAiwvGO&X-Amz-Signature=9ca8700ee1f0167b704cd91fb5c8c35666e9918ddac4d25ce220e45123508252&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
