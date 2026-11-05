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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662RK2TYB2%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T134109Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDxJb%2FDQhuYOo%2BjRKevHaW%2FjChP%2FskYieqs5DGACltpqQIhAJZkxWkKWeJKgecm7jo0%2F%2Bwrrulv6PaCId%2FDutCIj5Q1KogECMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzREEZ4j4u30UncHSQq3ANsGtN%2FJ1RpuZSsEuAmjKK32KoyLNK%2F6vg3CodZCmZ3Tb3V8Q0yLR5Wwl8rGWVx0GatXjryyFYUKQI6CVLk%2FB4dopGO69ks6WONk5UhK1C1DEnTArDlBHrzf9kW4hi%2FxrWDek%2BlxqM9o46ab9bgcrAyv7RO1gj0FNFmHEXVn4LVmIzmmEyhfxSnddPFC5SHU%2Bgm1tU%2BjhoXDuwiRh2HCg%2BlafbczRon6j3JMNeCin8xYhHUWM0aubqK66YS4N31WsXd1r8lu4c%2F77d9GFWCKdyQh3rMTCk0xM3hXAXH5Y%2BFzBWOe5I1bjJD8xvzMKwVcKcRtM9%2F%2BPRE%2BcVAZMw24dYIcHWNR4REomQ3Y67eki%2BgYWpy0xbJeqSk3NqZ%2FLkVYPzitIrpEv3wJYbYTDrCFuYEZPHtRh%2FOpYMGa1%2BRUCciybJzdKKro%2BZBJSiooBZsVOGKcLvyBOkujPzHoQ9ZXlAH%2BDoGOnt55WZYmw8EnpOix9%2FRt7KsbvTeVpjo2hC9Cb99N40ZvBwWQTKKHWPI0spjCfq67tkqUyJ77os8S86rtFgxevDpMdC60a5555TiraoieECtnijYok7PGLtxT8E4zUK6p%2FAbEASL6AVTnRiqSOdcAsqAGNC%2FVHPIvjC7ibLXBjqkAUNyFfkJrktFH42arP1ltjqCSc4Ty%2Fpx4gvYuFgwS1RrsfNcpK9qbDntymrvZKIdbFH4Ri6pu48w3%2BvhO5UROtu67FmELOXk17NUF618ropDEJUylY5pnBC6Tzb5iBovJFPdP9v8mCqNqjNjKZ3KuM%2BxixxP%2BjEmS6Th1f8iCAMTyNOI4%2FJYiGN8sqLNvRoFvJL3yEOx7OmEcX6u8Jv10pmEwI7q&X-Amz-Signature=de9f2f356778971d61f4879f0c8711ea451e1eb0d01192932427768237ec63c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662RK2TYB2%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T134109Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDxJb%2FDQhuYOo%2BjRKevHaW%2FjChP%2FskYieqs5DGACltpqQIhAJZkxWkKWeJKgecm7jo0%2F%2Bwrrulv6PaCId%2FDutCIj5Q1KogECMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzREEZ4j4u30UncHSQq3ANsGtN%2FJ1RpuZSsEuAmjKK32KoyLNK%2F6vg3CodZCmZ3Tb3V8Q0yLR5Wwl8rGWVx0GatXjryyFYUKQI6CVLk%2FB4dopGO69ks6WONk5UhK1C1DEnTArDlBHrzf9kW4hi%2FxrWDek%2BlxqM9o46ab9bgcrAyv7RO1gj0FNFmHEXVn4LVmIzmmEyhfxSnddPFC5SHU%2Bgm1tU%2BjhoXDuwiRh2HCg%2BlafbczRon6j3JMNeCin8xYhHUWM0aubqK66YS4N31WsXd1r8lu4c%2F77d9GFWCKdyQh3rMTCk0xM3hXAXH5Y%2BFzBWOe5I1bjJD8xvzMKwVcKcRtM9%2F%2BPRE%2BcVAZMw24dYIcHWNR4REomQ3Y67eki%2BgYWpy0xbJeqSk3NqZ%2FLkVYPzitIrpEv3wJYbYTDrCFuYEZPHtRh%2FOpYMGa1%2BRUCciybJzdKKro%2BZBJSiooBZsVOGKcLvyBOkujPzHoQ9ZXlAH%2BDoGOnt55WZYmw8EnpOix9%2FRt7KsbvTeVpjo2hC9Cb99N40ZvBwWQTKKHWPI0spjCfq67tkqUyJ77os8S86rtFgxevDpMdC60a5555TiraoieECtnijYok7PGLtxT8E4zUK6p%2FAbEASL6AVTnRiqSOdcAsqAGNC%2FVHPIvjC7ibLXBjqkAUNyFfkJrktFH42arP1ltjqCSc4Ty%2Fpx4gvYuFgwS1RrsfNcpK9qbDntymrvZKIdbFH4Ri6pu48w3%2BvhO5UROtu67FmELOXk17NUF618ropDEJUylY5pnBC6Tzb5iBovJFPdP9v8mCqNqjNjKZ3KuM%2BxixxP%2BjEmS6Th1f8iCAMTyNOI4%2FJYiGN8sqLNvRoFvJL3yEOx7OmEcX6u8Jv10pmEwI7q&X-Amz-Signature=3d41ac2ba880a051ebf1c01f88e307f1e28af850681106c868ce60a6e292c5a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662RK2TYB2%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T134109Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDxJb%2FDQhuYOo%2BjRKevHaW%2FjChP%2FskYieqs5DGACltpqQIhAJZkxWkKWeJKgecm7jo0%2F%2Bwrrulv6PaCId%2FDutCIj5Q1KogECMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzREEZ4j4u30UncHSQq3ANsGtN%2FJ1RpuZSsEuAmjKK32KoyLNK%2F6vg3CodZCmZ3Tb3V8Q0yLR5Wwl8rGWVx0GatXjryyFYUKQI6CVLk%2FB4dopGO69ks6WONk5UhK1C1DEnTArDlBHrzf9kW4hi%2FxrWDek%2BlxqM9o46ab9bgcrAyv7RO1gj0FNFmHEXVn4LVmIzmmEyhfxSnddPFC5SHU%2Bgm1tU%2BjhoXDuwiRh2HCg%2BlafbczRon6j3JMNeCin8xYhHUWM0aubqK66YS4N31WsXd1r8lu4c%2F77d9GFWCKdyQh3rMTCk0xM3hXAXH5Y%2BFzBWOe5I1bjJD8xvzMKwVcKcRtM9%2F%2BPRE%2BcVAZMw24dYIcHWNR4REomQ3Y67eki%2BgYWpy0xbJeqSk3NqZ%2FLkVYPzitIrpEv3wJYbYTDrCFuYEZPHtRh%2FOpYMGa1%2BRUCciybJzdKKro%2BZBJSiooBZsVOGKcLvyBOkujPzHoQ9ZXlAH%2BDoGOnt55WZYmw8EnpOix9%2FRt7KsbvTeVpjo2hC9Cb99N40ZvBwWQTKKHWPI0spjCfq67tkqUyJ77os8S86rtFgxevDpMdC60a5555TiraoieECtnijYok7PGLtxT8E4zUK6p%2FAbEASL6AVTnRiqSOdcAsqAGNC%2FVHPIvjC7ibLXBjqkAUNyFfkJrktFH42arP1ltjqCSc4Ty%2Fpx4gvYuFgwS1RrsfNcpK9qbDntymrvZKIdbFH4Ri6pu48w3%2BvhO5UROtu67FmELOXk17NUF618ropDEJUylY5pnBC6Tzb5iBovJFPdP9v8mCqNqjNjKZ3KuM%2BxixxP%2BjEmS6Th1f8iCAMTyNOI4%2FJYiGN8sqLNvRoFvJL3yEOx7OmEcX6u8Jv10pmEwI7q&X-Amz-Signature=9114b1874925b70541b155d1397d1fade873fd4056978f548e5b87f6d206b479&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662RK2TYB2%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T134109Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDxJb%2FDQhuYOo%2BjRKevHaW%2FjChP%2FskYieqs5DGACltpqQIhAJZkxWkKWeJKgecm7jo0%2F%2Bwrrulv6PaCId%2FDutCIj5Q1KogECMf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzREEZ4j4u30UncHSQq3ANsGtN%2FJ1RpuZSsEuAmjKK32KoyLNK%2F6vg3CodZCmZ3Tb3V8Q0yLR5Wwl8rGWVx0GatXjryyFYUKQI6CVLk%2FB4dopGO69ks6WONk5UhK1C1DEnTArDlBHrzf9kW4hi%2FxrWDek%2BlxqM9o46ab9bgcrAyv7RO1gj0FNFmHEXVn4LVmIzmmEyhfxSnddPFC5SHU%2Bgm1tU%2BjhoXDuwiRh2HCg%2BlafbczRon6j3JMNeCin8xYhHUWM0aubqK66YS4N31WsXd1r8lu4c%2F77d9GFWCKdyQh3rMTCk0xM3hXAXH5Y%2BFzBWOe5I1bjJD8xvzMKwVcKcRtM9%2F%2BPRE%2BcVAZMw24dYIcHWNR4REomQ3Y67eki%2BgYWpy0xbJeqSk3NqZ%2FLkVYPzitIrpEv3wJYbYTDrCFuYEZPHtRh%2FOpYMGa1%2BRUCciybJzdKKro%2BZBJSiooBZsVOGKcLvyBOkujPzHoQ9ZXlAH%2BDoGOnt55WZYmw8EnpOix9%2FRt7KsbvTeVpjo2hC9Cb99N40ZvBwWQTKKHWPI0spjCfq67tkqUyJ77os8S86rtFgxevDpMdC60a5555TiraoieECtnijYok7PGLtxT8E4zUK6p%2FAbEASL6AVTnRiqSOdcAsqAGNC%2FVHPIvjC7ibLXBjqkAUNyFfkJrktFH42arP1ltjqCSc4Ty%2Fpx4gvYuFgwS1RrsfNcpK9qbDntymrvZKIdbFH4Ri6pu48w3%2BvhO5UROtu67FmELOXk17NUF618ropDEJUylY5pnBC6Tzb5iBovJFPdP9v8mCqNqjNjKZ3KuM%2BxixxP%2BjEmS6Th1f8iCAMTyNOI4%2FJYiGN8sqLNvRoFvJL3yEOx7OmEcX6u8Jv10pmEwI7q&X-Amz-Signature=29b9ca481f036b41dc765776b7ef8cda2fecde909b1a0b92acc0257c523d3ca3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
