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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RAOLSAXC%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T102009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIQDqZ8VxGzK2ZPdtlG7ZhVHwMe6QyuqCy%2FB%2BnnUUrBpwKQIgJ2H9QWcCkH96fQ%2Flo9pZOiYLX1X1lmc%2Fv%2B2noUoVyOMqiAQI2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG0p6KR4p1QqFMfgnCrcA%2BpI5W4dyfVYnzz0Nd8yhns5EtNtKYg4wod%2F94B2r80SIDzdb%2Fi%2FOaOvU48Q2DwMVfSfDbdg0S12jr2V%2F3xM0MH9jf3F7a77YMPPkIde%2B8wvv6Z%2Fz%2F6AN3gxVfwHGE9crzf8GnYtVcNB8m7VsGjVXMAVHJ2%2FKtEEkzs0enjhuWSn0jo8C5c0Tx98%2BPH3g48jkE7Zqe3gSKNn%2BfUmMt3jvpEEzyK06YZuGRTe2zyMMSdEAuItRwrB7idjylxeWqUb9OD0m1%2FwxIWWQ2AHqijRPT7c9uxp8ewLsYppF%2BM2on2K%2FSOlTqMBipZfzIRcxYg6%2FyULS%2FKGyt26bWF82BNtrFscKEb89sgKPgZEt3Aq%2BjdIaFvbcl2Mrw5C1GWqvgGYDZhaHe4S4csFpvoHg4Q7n6K5yI%2BFyZnTuBM3oN%2FQX0%2FCdWyAhy3g15IoaW%2FG2N7dZxdAu56tFBoAQVHBT3iOjeo7z8lI6Vbq5XRJ9t7FpdBJEDUkyZmkeIzbEguCSoiBwoGXyHS640wlJ9UFSR0P5K%2BouV2tkzA9tlqxPWPc6h5SMZfV%2FL%2FFIK1gPz9DcANtTo5G9UsFzBAUaExgQM1s6kX0Tcs7MLMIZ6Bdm%2FZREnNeb%2BWs3OtkLKbxFS6wMPOE5dQGOqUBeWC2wKsjjv%2BDMOgp4dzhkhUdKrMRctLPtJx33%2B65PAI8vr9T4syB5iFRhfGsOJhSlgHy2PcAbc9NhA1yNTqF0aDueGGHoJm%2FzwjsP9CEeRkn5onkWMMS3CtTQpsVESwBDHpTkiHNa2KgChlk5ZZq1kObeKcS3r7J%2BIIgySgT8T%2FSAhZBGOn5o%2FIrrWX0mE%2BC3rSG%2FvDI7iXipjQ7fo0toTpd6M0d&X-Amz-Signature=1eea787c704e603414f7cf3feed4f704100770c84ac7aa18b05d1220904e4f81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RAOLSAXC%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T102009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIQDqZ8VxGzK2ZPdtlG7ZhVHwMe6QyuqCy%2FB%2BnnUUrBpwKQIgJ2H9QWcCkH96fQ%2Flo9pZOiYLX1X1lmc%2Fv%2B2noUoVyOMqiAQI2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG0p6KR4p1QqFMfgnCrcA%2BpI5W4dyfVYnzz0Nd8yhns5EtNtKYg4wod%2F94B2r80SIDzdb%2Fi%2FOaOvU48Q2DwMVfSfDbdg0S12jr2V%2F3xM0MH9jf3F7a77YMPPkIde%2B8wvv6Z%2Fz%2F6AN3gxVfwHGE9crzf8GnYtVcNB8m7VsGjVXMAVHJ2%2FKtEEkzs0enjhuWSn0jo8C5c0Tx98%2BPH3g48jkE7Zqe3gSKNn%2BfUmMt3jvpEEzyK06YZuGRTe2zyMMSdEAuItRwrB7idjylxeWqUb9OD0m1%2FwxIWWQ2AHqijRPT7c9uxp8ewLsYppF%2BM2on2K%2FSOlTqMBipZfzIRcxYg6%2FyULS%2FKGyt26bWF82BNtrFscKEb89sgKPgZEt3Aq%2BjdIaFvbcl2Mrw5C1GWqvgGYDZhaHe4S4csFpvoHg4Q7n6K5yI%2BFyZnTuBM3oN%2FQX0%2FCdWyAhy3g15IoaW%2FG2N7dZxdAu56tFBoAQVHBT3iOjeo7z8lI6Vbq5XRJ9t7FpdBJEDUkyZmkeIzbEguCSoiBwoGXyHS640wlJ9UFSR0P5K%2BouV2tkzA9tlqxPWPc6h5SMZfV%2FL%2FFIK1gPz9DcANtTo5G9UsFzBAUaExgQM1s6kX0Tcs7MLMIZ6Bdm%2FZREnNeb%2BWs3OtkLKbxFS6wMPOE5dQGOqUBeWC2wKsjjv%2BDMOgp4dzhkhUdKrMRctLPtJx33%2B65PAI8vr9T4syB5iFRhfGsOJhSlgHy2PcAbc9NhA1yNTqF0aDueGGHoJm%2FzwjsP9CEeRkn5onkWMMS3CtTQpsVESwBDHpTkiHNa2KgChlk5ZZq1kObeKcS3r7J%2BIIgySgT8T%2FSAhZBGOn5o%2FIrrWX0mE%2BC3rSG%2FvDI7iXipjQ7fo0toTpd6M0d&X-Amz-Signature=fbd02e8c8ef48892c504107b4142e48f9c65033a261fa7248055a15471999c45&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RAOLSAXC%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T102009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIQDqZ8VxGzK2ZPdtlG7ZhVHwMe6QyuqCy%2FB%2BnnUUrBpwKQIgJ2H9QWcCkH96fQ%2Flo9pZOiYLX1X1lmc%2Fv%2B2noUoVyOMqiAQI2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG0p6KR4p1QqFMfgnCrcA%2BpI5W4dyfVYnzz0Nd8yhns5EtNtKYg4wod%2F94B2r80SIDzdb%2Fi%2FOaOvU48Q2DwMVfSfDbdg0S12jr2V%2F3xM0MH9jf3F7a77YMPPkIde%2B8wvv6Z%2Fz%2F6AN3gxVfwHGE9crzf8GnYtVcNB8m7VsGjVXMAVHJ2%2FKtEEkzs0enjhuWSn0jo8C5c0Tx98%2BPH3g48jkE7Zqe3gSKNn%2BfUmMt3jvpEEzyK06YZuGRTe2zyMMSdEAuItRwrB7idjylxeWqUb9OD0m1%2FwxIWWQ2AHqijRPT7c9uxp8ewLsYppF%2BM2on2K%2FSOlTqMBipZfzIRcxYg6%2FyULS%2FKGyt26bWF82BNtrFscKEb89sgKPgZEt3Aq%2BjdIaFvbcl2Mrw5C1GWqvgGYDZhaHe4S4csFpvoHg4Q7n6K5yI%2BFyZnTuBM3oN%2FQX0%2FCdWyAhy3g15IoaW%2FG2N7dZxdAu56tFBoAQVHBT3iOjeo7z8lI6Vbq5XRJ9t7FpdBJEDUkyZmkeIzbEguCSoiBwoGXyHS640wlJ9UFSR0P5K%2BouV2tkzA9tlqxPWPc6h5SMZfV%2FL%2FFIK1gPz9DcANtTo5G9UsFzBAUaExgQM1s6kX0Tcs7MLMIZ6Bdm%2FZREnNeb%2BWs3OtkLKbxFS6wMPOE5dQGOqUBeWC2wKsjjv%2BDMOgp4dzhkhUdKrMRctLPtJx33%2B65PAI8vr9T4syB5iFRhfGsOJhSlgHy2PcAbc9NhA1yNTqF0aDueGGHoJm%2FzwjsP9CEeRkn5onkWMMS3CtTQpsVESwBDHpTkiHNa2KgChlk5ZZq1kObeKcS3r7J%2BIIgySgT8T%2FSAhZBGOn5o%2FIrrWX0mE%2BC3rSG%2FvDI7iXipjQ7fo0toTpd6M0d&X-Amz-Signature=41926a78cb8dfaed76616d0b607dbc73b97394f362807b79ba013e97af511b60&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RAOLSAXC%2F20260903%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260903T102009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBIaCXVzLXdlc3QtMiJHMEUCIQDqZ8VxGzK2ZPdtlG7ZhVHwMe6QyuqCy%2FB%2BnnUUrBpwKQIgJ2H9QWcCkH96fQ%2Flo9pZOiYLX1X1lmc%2Fv%2B2noUoVyOMqiAQI2%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG0p6KR4p1QqFMfgnCrcA%2BpI5W4dyfVYnzz0Nd8yhns5EtNtKYg4wod%2F94B2r80SIDzdb%2Fi%2FOaOvU48Q2DwMVfSfDbdg0S12jr2V%2F3xM0MH9jf3F7a77YMPPkIde%2B8wvv6Z%2Fz%2F6AN3gxVfwHGE9crzf8GnYtVcNB8m7VsGjVXMAVHJ2%2FKtEEkzs0enjhuWSn0jo8C5c0Tx98%2BPH3g48jkE7Zqe3gSKNn%2BfUmMt3jvpEEzyK06YZuGRTe2zyMMSdEAuItRwrB7idjylxeWqUb9OD0m1%2FwxIWWQ2AHqijRPT7c9uxp8ewLsYppF%2BM2on2K%2FSOlTqMBipZfzIRcxYg6%2FyULS%2FKGyt26bWF82BNtrFscKEb89sgKPgZEt3Aq%2BjdIaFvbcl2Mrw5C1GWqvgGYDZhaHe4S4csFpvoHg4Q7n6K5yI%2BFyZnTuBM3oN%2FQX0%2FCdWyAhy3g15IoaW%2FG2N7dZxdAu56tFBoAQVHBT3iOjeo7z8lI6Vbq5XRJ9t7FpdBJEDUkyZmkeIzbEguCSoiBwoGXyHS640wlJ9UFSR0P5K%2BouV2tkzA9tlqxPWPc6h5SMZfV%2FL%2FFIK1gPz9DcANtTo5G9UsFzBAUaExgQM1s6kX0Tcs7MLMIZ6Bdm%2FZREnNeb%2BWs3OtkLKbxFS6wMPOE5dQGOqUBeWC2wKsjjv%2BDMOgp4dzhkhUdKrMRctLPtJx33%2B65PAI8vr9T4syB5iFRhfGsOJhSlgHy2PcAbc9NhA1yNTqF0aDueGGHoJm%2FzwjsP9CEeRkn5onkWMMS3CtTQpsVESwBDHpTkiHNa2KgChlk5ZZq1kObeKcS3r7J%2BIIgySgT8T%2FSAhZBGOn5o%2FIrrWX0mE%2BC3rSG%2FvDI7iXipjQ7fo0toTpd6M0d&X-Amz-Signature=d82988db0828b8911e1470914d77f6415899ac86f54d45924863ab51bdf77998&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
