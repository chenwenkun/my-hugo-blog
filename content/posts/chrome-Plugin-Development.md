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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSJESOMD%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T030315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKKR88dmxHIFR2Nc%2FUm4ATZ2SC9xqVj5ef56alLDQOYAiBl7TfWM3pPbjAdcqTCnY0sUjSepcxWxnm5AGujeg8TXCqIBAiM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM8kkJknrpLnwDCxrAKtwDMOanjj4uX5EKTfl9dEKFvF0L53POHhYQAPNV2oOH4wv%2BQHHgBFHEs353NCN0wB7R5Nm7Ad9yz1MYwe4dcXkZsGHss6f1dRMoGH78XQUo81D%2Fc7yVi4qfVCFhLLfuT6Dk3%2BGYrwRbGprCIrF6X2R%2BGPhuYq7S6%2FCDh32Ku0%2B6oHacsu7NjUoQuR8Bjxmz374HLc5%2Fu%2BXevdidwarbr9%2FI67Csyrn%2B8X%2FTsKwWrtsR9kr8zhzextyJGUzniJy8xLc6zKRawphJZoyE564dmFWBsp2PYoSWNMc42JBgCQf%2FCzMdIZGxUC2gLzdegKIFafbSsQcJuQVRBkBgZWBCkyGrWVfo8MvySV5pk7%2BpbHUQWvdHWGYssAyxcEUifhrf5tXXXyf%2F9Cn5oLetITBu4uCELLePDsO984U5L27XgW6VkbIhPQQB54mJQMFDRQdFobi3AelQSqXBIwcrCzYuuvp%2BRBpojjbe21y1TOG5mvTBWzMqSMOqE4dts%2FY%2F33%2F5%2B31pA%2Fd3bIDng85HiwpOOMBDpWhrAJ%2F3Cdd2DUCjG19yeF8os82f30UQTtBviPirWY6JfT393JuNGy8dieGCI%2FPHuyEVUREBakhN5ur3tbQeRFpPAWvh4tRC2x0KUHMwsbv81QY6pgG3w6AxoKlX4vynR15VEs9Ofl1tySc%2BXQMA16L1JUrzaaePtzFFCwVm6TiAJo1D%2FkUH0k0sKdr2OfSr93Mb2oUbRSIlsrK4WSLHV2xsZ2u6YWQKcUhogBr%2F2JnuD1jPOTj%2FzFPXm2tt6ol%2BY%2BRexdEk%2B%2BnMDh3Zm2oiM9qlpfS2X4bCjw6sOGk7E44lEgbD3bKcr%2BDpoL3uXYHOieyzxLVZr%2BzXAplk&X-Amz-Signature=793c75d541d041fa4ba5df756d69c0aa7aa087d263296a04d673d0d9f8eb17d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSJESOMD%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T030315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKKR88dmxHIFR2Nc%2FUm4ATZ2SC9xqVj5ef56alLDQOYAiBl7TfWM3pPbjAdcqTCnY0sUjSepcxWxnm5AGujeg8TXCqIBAiM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM8kkJknrpLnwDCxrAKtwDMOanjj4uX5EKTfl9dEKFvF0L53POHhYQAPNV2oOH4wv%2BQHHgBFHEs353NCN0wB7R5Nm7Ad9yz1MYwe4dcXkZsGHss6f1dRMoGH78XQUo81D%2Fc7yVi4qfVCFhLLfuT6Dk3%2BGYrwRbGprCIrF6X2R%2BGPhuYq7S6%2FCDh32Ku0%2B6oHacsu7NjUoQuR8Bjxmz374HLc5%2Fu%2BXevdidwarbr9%2FI67Csyrn%2B8X%2FTsKwWrtsR9kr8zhzextyJGUzniJy8xLc6zKRawphJZoyE564dmFWBsp2PYoSWNMc42JBgCQf%2FCzMdIZGxUC2gLzdegKIFafbSsQcJuQVRBkBgZWBCkyGrWVfo8MvySV5pk7%2BpbHUQWvdHWGYssAyxcEUifhrf5tXXXyf%2F9Cn5oLetITBu4uCELLePDsO984U5L27XgW6VkbIhPQQB54mJQMFDRQdFobi3AelQSqXBIwcrCzYuuvp%2BRBpojjbe21y1TOG5mvTBWzMqSMOqE4dts%2FY%2F33%2F5%2B31pA%2Fd3bIDng85HiwpOOMBDpWhrAJ%2F3Cdd2DUCjG19yeF8os82f30UQTtBviPirWY6JfT393JuNGy8dieGCI%2FPHuyEVUREBakhN5ur3tbQeRFpPAWvh4tRC2x0KUHMwsbv81QY6pgG3w6AxoKlX4vynR15VEs9Ofl1tySc%2BXQMA16L1JUrzaaePtzFFCwVm6TiAJo1D%2FkUH0k0sKdr2OfSr93Mb2oUbRSIlsrK4WSLHV2xsZ2u6YWQKcUhogBr%2F2JnuD1jPOTj%2FzFPXm2tt6ol%2BY%2BRexdEk%2B%2BnMDh3Zm2oiM9qlpfS2X4bCjw6sOGk7E44lEgbD3bKcr%2BDpoL3uXYHOieyzxLVZr%2BzXAplk&X-Amz-Signature=67467125c4c5f466654b859a3c03173664c66faea34117c9fd8bcf6932d4e97b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSJESOMD%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T030315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKKR88dmxHIFR2Nc%2FUm4ATZ2SC9xqVj5ef56alLDQOYAiBl7TfWM3pPbjAdcqTCnY0sUjSepcxWxnm5AGujeg8TXCqIBAiM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM8kkJknrpLnwDCxrAKtwDMOanjj4uX5EKTfl9dEKFvF0L53POHhYQAPNV2oOH4wv%2BQHHgBFHEs353NCN0wB7R5Nm7Ad9yz1MYwe4dcXkZsGHss6f1dRMoGH78XQUo81D%2Fc7yVi4qfVCFhLLfuT6Dk3%2BGYrwRbGprCIrF6X2R%2BGPhuYq7S6%2FCDh32Ku0%2B6oHacsu7NjUoQuR8Bjxmz374HLc5%2Fu%2BXevdidwarbr9%2FI67Csyrn%2B8X%2FTsKwWrtsR9kr8zhzextyJGUzniJy8xLc6zKRawphJZoyE564dmFWBsp2PYoSWNMc42JBgCQf%2FCzMdIZGxUC2gLzdegKIFafbSsQcJuQVRBkBgZWBCkyGrWVfo8MvySV5pk7%2BpbHUQWvdHWGYssAyxcEUifhrf5tXXXyf%2F9Cn5oLetITBu4uCELLePDsO984U5L27XgW6VkbIhPQQB54mJQMFDRQdFobi3AelQSqXBIwcrCzYuuvp%2BRBpojjbe21y1TOG5mvTBWzMqSMOqE4dts%2FY%2F33%2F5%2B31pA%2Fd3bIDng85HiwpOOMBDpWhrAJ%2F3Cdd2DUCjG19yeF8os82f30UQTtBviPirWY6JfT393JuNGy8dieGCI%2FPHuyEVUREBakhN5ur3tbQeRFpPAWvh4tRC2x0KUHMwsbv81QY6pgG3w6AxoKlX4vynR15VEs9Ofl1tySc%2BXQMA16L1JUrzaaePtzFFCwVm6TiAJo1D%2FkUH0k0sKdr2OfSr93Mb2oUbRSIlsrK4WSLHV2xsZ2u6YWQKcUhogBr%2F2JnuD1jPOTj%2FzFPXm2tt6ol%2BY%2BRexdEk%2B%2BnMDh3Zm2oiM9qlpfS2X4bCjw6sOGk7E44lEgbD3bKcr%2BDpoL3uXYHOieyzxLVZr%2BzXAplk&X-Amz-Signature=090f448f137cccb85e2cd4a8c357f21e7cdc563130976700e120760ab07542d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XSJESOMD%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T030315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAKKR88dmxHIFR2Nc%2FUm4ATZ2SC9xqVj5ef56alLDQOYAiBl7TfWM3pPbjAdcqTCnY0sUjSepcxWxnm5AGujeg8TXCqIBAiM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM8kkJknrpLnwDCxrAKtwDMOanjj4uX5EKTfl9dEKFvF0L53POHhYQAPNV2oOH4wv%2BQHHgBFHEs353NCN0wB7R5Nm7Ad9yz1MYwe4dcXkZsGHss6f1dRMoGH78XQUo81D%2Fc7yVi4qfVCFhLLfuT6Dk3%2BGYrwRbGprCIrF6X2R%2BGPhuYq7S6%2FCDh32Ku0%2B6oHacsu7NjUoQuR8Bjxmz374HLc5%2Fu%2BXevdidwarbr9%2FI67Csyrn%2B8X%2FTsKwWrtsR9kr8zhzextyJGUzniJy8xLc6zKRawphJZoyE564dmFWBsp2PYoSWNMc42JBgCQf%2FCzMdIZGxUC2gLzdegKIFafbSsQcJuQVRBkBgZWBCkyGrWVfo8MvySV5pk7%2BpbHUQWvdHWGYssAyxcEUifhrf5tXXXyf%2F9Cn5oLetITBu4uCELLePDsO984U5L27XgW6VkbIhPQQB54mJQMFDRQdFobi3AelQSqXBIwcrCzYuuvp%2BRBpojjbe21y1TOG5mvTBWzMqSMOqE4dts%2FY%2F33%2F5%2B31pA%2Fd3bIDng85HiwpOOMBDpWhrAJ%2F3Cdd2DUCjG19yeF8os82f30UQTtBviPirWY6JfT393JuNGy8dieGCI%2FPHuyEVUREBakhN5ur3tbQeRFpPAWvh4tRC2x0KUHMwsbv81QY6pgG3w6AxoKlX4vynR15VEs9Ofl1tySc%2BXQMA16L1JUrzaaePtzFFCwVm6TiAJo1D%2FkUH0k0sKdr2OfSr93Mb2oUbRSIlsrK4WSLHV2xsZ2u6YWQKcUhogBr%2F2JnuD1jPOTj%2FzFPXm2tt6ol%2BY%2BRexdEk%2B%2BnMDh3Zm2oiM9qlpfS2X4bCjw6sOGk7E44lEgbD3bKcr%2BDpoL3uXYHOieyzxLVZr%2BzXAplk&X-Amz-Signature=8b7ba3202b9bf3d0e02988c2462f5e9dc63e1caa1a5a07439de878224e2f178e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
