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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IFXCT4Z%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T122700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAJO81r495%2FnaOuUwn6pgq01MX2N%2ByBQRQduv85C0y5wIhAJ821756SRERhUoT2sK2rpEtKp0QzJ6xea%2BoSc1iLXjrKogECIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwU1MZUPeIZsB9WNd0q3AMk9mXZzSAJ6Db848PXFIUkba8TxF%2F9xm%2FFY3Tz2pYQ8R3reXRVizUXDvJxfPHSs5JpIwOWWMJNxQrXGhFG50PzM1RhxqibxX1nIyOAs5ZNER8SAqwRQPPZmo3yUSNAKjkDXrVSByo4hG2IbXrfFO9k63mm3rb4uO2iSSmdXM9OWdVRMIZ0M7HwZY9kEt2lAOWSH1J6zJh1PGxZ90VVT5LPYgzxhG2iefzPNFrq57USBumGSVHDtdi9mfFeLa%2FOVMupcJNOUFGqjQgOVYolIByu1yyFAwYOsH2SUIjyWMVXqfqPC5NUUwdoXawXwJtvvJkhME9jwP8s4H5bl1PzLRVcvFl3XoZxlG0a5TvuAyqdAZoAbm5B%2Fuma%2B7uZ%2FpkHouSAf%2BcMwV%2FFmMDmkFB3916iwKU7ie3MWcoEI4gf0hpxsWnNJT6zTPTTCb%2FIiSrS7Gcqy7heerm%2F3dunj8SQ39T2EgYWI%2BNy56S%2FZwcAX%2Blca5X%2FipElTIzS%2BFs4fJaov2OyFVZ9f80USvrQEr6ryCvTgnB46GVVZy7dperQLb%2B6K52xuq65jBKRgdxidX4CJllXuFwAEpQGoO%2F56QfDZ63bQIBULwS12XZ%2F3mhPqketmpugATCkDEGXJE8MRjCXo%2BHTBjqkAbApMOoD0XRwAW5F1pb7A%2FJfxKQ0ti4nsvBausks60p5yNn1mTgNxGI59atXMRDNhA5HOVXakDD1idJUu1zpruhd2LRQiircjj7pLoKbz8p74236B7%2BT5x%2FqZiCLG%2FwwL2grsQGPkbGtumUdpirnePb9r6u4BPJwX1rwOE8p6eDzGKisl%2B9IQC55h4Poqp1p59GpSHJv7CBbSgipwllmqWxkehVS&X-Amz-Signature=197dca485a214af9fab018531d3c0cb60259ebd97b0cd995d9ad4f98e3f020f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IFXCT4Z%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T122700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAJO81r495%2FnaOuUwn6pgq01MX2N%2ByBQRQduv85C0y5wIhAJ821756SRERhUoT2sK2rpEtKp0QzJ6xea%2BoSc1iLXjrKogECIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwU1MZUPeIZsB9WNd0q3AMk9mXZzSAJ6Db848PXFIUkba8TxF%2F9xm%2FFY3Tz2pYQ8R3reXRVizUXDvJxfPHSs5JpIwOWWMJNxQrXGhFG50PzM1RhxqibxX1nIyOAs5ZNER8SAqwRQPPZmo3yUSNAKjkDXrVSByo4hG2IbXrfFO9k63mm3rb4uO2iSSmdXM9OWdVRMIZ0M7HwZY9kEt2lAOWSH1J6zJh1PGxZ90VVT5LPYgzxhG2iefzPNFrq57USBumGSVHDtdi9mfFeLa%2FOVMupcJNOUFGqjQgOVYolIByu1yyFAwYOsH2SUIjyWMVXqfqPC5NUUwdoXawXwJtvvJkhME9jwP8s4H5bl1PzLRVcvFl3XoZxlG0a5TvuAyqdAZoAbm5B%2Fuma%2B7uZ%2FpkHouSAf%2BcMwV%2FFmMDmkFB3916iwKU7ie3MWcoEI4gf0hpxsWnNJT6zTPTTCb%2FIiSrS7Gcqy7heerm%2F3dunj8SQ39T2EgYWI%2BNy56S%2FZwcAX%2Blca5X%2FipElTIzS%2BFs4fJaov2OyFVZ9f80USvrQEr6ryCvTgnB46GVVZy7dperQLb%2B6K52xuq65jBKRgdxidX4CJllXuFwAEpQGoO%2F56QfDZ63bQIBULwS12XZ%2F3mhPqketmpugATCkDEGXJE8MRjCXo%2BHTBjqkAbApMOoD0XRwAW5F1pb7A%2FJfxKQ0ti4nsvBausks60p5yNn1mTgNxGI59atXMRDNhA5HOVXakDD1idJUu1zpruhd2LRQiircjj7pLoKbz8p74236B7%2BT5x%2FqZiCLG%2FwwL2grsQGPkbGtumUdpirnePb9r6u4BPJwX1rwOE8p6eDzGKisl%2B9IQC55h4Poqp1p59GpSHJv7CBbSgipwllmqWxkehVS&X-Amz-Signature=e642a58bc7e041ea639bcd67b64201824ed838c7641f835ba520b2d78f670110&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IFXCT4Z%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T122700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAJO81r495%2FnaOuUwn6pgq01MX2N%2ByBQRQduv85C0y5wIhAJ821756SRERhUoT2sK2rpEtKp0QzJ6xea%2BoSc1iLXjrKogECIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwU1MZUPeIZsB9WNd0q3AMk9mXZzSAJ6Db848PXFIUkba8TxF%2F9xm%2FFY3Tz2pYQ8R3reXRVizUXDvJxfPHSs5JpIwOWWMJNxQrXGhFG50PzM1RhxqibxX1nIyOAs5ZNER8SAqwRQPPZmo3yUSNAKjkDXrVSByo4hG2IbXrfFO9k63mm3rb4uO2iSSmdXM9OWdVRMIZ0M7HwZY9kEt2lAOWSH1J6zJh1PGxZ90VVT5LPYgzxhG2iefzPNFrq57USBumGSVHDtdi9mfFeLa%2FOVMupcJNOUFGqjQgOVYolIByu1yyFAwYOsH2SUIjyWMVXqfqPC5NUUwdoXawXwJtvvJkhME9jwP8s4H5bl1PzLRVcvFl3XoZxlG0a5TvuAyqdAZoAbm5B%2Fuma%2B7uZ%2FpkHouSAf%2BcMwV%2FFmMDmkFB3916iwKU7ie3MWcoEI4gf0hpxsWnNJT6zTPTTCb%2FIiSrS7Gcqy7heerm%2F3dunj8SQ39T2EgYWI%2BNy56S%2FZwcAX%2Blca5X%2FipElTIzS%2BFs4fJaov2OyFVZ9f80USvrQEr6ryCvTgnB46GVVZy7dperQLb%2B6K52xuq65jBKRgdxidX4CJllXuFwAEpQGoO%2F56QfDZ63bQIBULwS12XZ%2F3mhPqketmpugATCkDEGXJE8MRjCXo%2BHTBjqkAbApMOoD0XRwAW5F1pb7A%2FJfxKQ0ti4nsvBausks60p5yNn1mTgNxGI59atXMRDNhA5HOVXakDD1idJUu1zpruhd2LRQiircjj7pLoKbz8p74236B7%2BT5x%2FqZiCLG%2FwwL2grsQGPkbGtumUdpirnePb9r6u4BPJwX1rwOE8p6eDzGKisl%2B9IQC55h4Poqp1p59GpSHJv7CBbSgipwllmqWxkehVS&X-Amz-Signature=47ac07aabc1fe64255d4387dbc4f6dd48fd089ad23888dcaeea8a9d5f535b5da&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664IFXCT4Z%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T122700Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCAJO81r495%2FnaOuUwn6pgq01MX2N%2ByBQRQduv85C0y5wIhAJ821756SRERhUoT2sK2rpEtKp0QzJ6xea%2BoSc1iLXjrKogECIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwU1MZUPeIZsB9WNd0q3AMk9mXZzSAJ6Db848PXFIUkba8TxF%2F9xm%2FFY3Tz2pYQ8R3reXRVizUXDvJxfPHSs5JpIwOWWMJNxQrXGhFG50PzM1RhxqibxX1nIyOAs5ZNER8SAqwRQPPZmo3yUSNAKjkDXrVSByo4hG2IbXrfFO9k63mm3rb4uO2iSSmdXM9OWdVRMIZ0M7HwZY9kEt2lAOWSH1J6zJh1PGxZ90VVT5LPYgzxhG2iefzPNFrq57USBumGSVHDtdi9mfFeLa%2FOVMupcJNOUFGqjQgOVYolIByu1yyFAwYOsH2SUIjyWMVXqfqPC5NUUwdoXawXwJtvvJkhME9jwP8s4H5bl1PzLRVcvFl3XoZxlG0a5TvuAyqdAZoAbm5B%2Fuma%2B7uZ%2FpkHouSAf%2BcMwV%2FFmMDmkFB3916iwKU7ie3MWcoEI4gf0hpxsWnNJT6zTPTTCb%2FIiSrS7Gcqy7heerm%2F3dunj8SQ39T2EgYWI%2BNy56S%2FZwcAX%2Blca5X%2FipElTIzS%2BFs4fJaov2OyFVZ9f80USvrQEr6ryCvTgnB46GVVZy7dperQLb%2B6K52xuq65jBKRgdxidX4CJllXuFwAEpQGoO%2F56QfDZ63bQIBULwS12XZ%2F3mhPqketmpugATCkDEGXJE8MRjCXo%2BHTBjqkAbApMOoD0XRwAW5F1pb7A%2FJfxKQ0ti4nsvBausks60p5yNn1mTgNxGI59atXMRDNhA5HOVXakDD1idJUu1zpruhd2LRQiircjj7pLoKbz8p74236B7%2BT5x%2FqZiCLG%2FwwL2grsQGPkbGtumUdpirnePb9r6u4BPJwX1rwOE8p6eDzGKisl%2B9IQC55h4Poqp1p59GpSHJv7CBbSgipwllmqWxkehVS&X-Amz-Signature=8bc0ce81eccbd3d9f9c26095c65cfbadc480f90a1a8c5b64c531430fa2bf96b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
