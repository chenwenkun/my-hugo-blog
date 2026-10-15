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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622YE5YPV%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T155602Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCIEdvZhGKKJ8f%2F1AKokFJwfG0Ez6CuXPOe7LXvLAWLXqMAiAP1AX2TwyILeGNz1TnaG%2B4Y5mCW%2FwOVDQCJlXYeCzuHSqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4z%2BwbHj0xxddwITAKtwDgGGDxbb3p4gjV6UxBab0JI6%2BY8LoqB7xv%2FfayjyykcWjlySeACd3bJYJiMRDJR8rN8zstpUlqg9Sf2hBBHd0DWTrmycj%2B771KKoYy%2FcvmXhbP%2Be8i0phbKnv2jE%2FnjLgm7kqdtFpl56%2BfmbKK5rup%2BtH36Wgh2kaNjVt6c8J8lYzYy4PcxdcVzFcLXsc9DZAL0jdSMr%2Fj9%2B5lmQtougDg59EPgEHCT8xIevyjdpt0ZQVhg5MxtWBCiISG63fNJ8oVVBDx9Nqx3zJ9yCBt98YAaLMSjyHGHvykwqbGQO7QOF2mHmQ4SLkfB7exbshgwSLgfvdCYZk35jtFd2u7mT9fbx2OvAcNpgsw1wgr1ncG9CGeuE5q1HV6IWuger%2FRqPIMLS2yi5U1SN44VR1jeHy7GHK8wyjho2Tc%2Bf21hiZ4IZO%2FWjDJLtK14h8x1fzPsjNzfZeZPyvcTYDYhVaQOkcKfq6nlkHOQUQxC%2F6KifqJwJKZ4zKcfnBgdffSEtAzvHBYDITMHwLyVOEhA6lzE3Co4VJtzDQo6n%2Fv2cfqihcv4mN603wskzMkIJCstJEExQlbvTM1VY8oHvSjzSCPOTAlyP3HL%2FVDJi0aQ1376jW8Vgv7gkgC7eUWxIQrqcwx%2B3C1gY6pgFWcN6hyUFy2pSEgkKfQiAcuSxDeCElBQM4wS%2F7ZtjpDRb6zYKF242S%2BmLdRwO6IYr%2FdmKoYNS6En80G%2BxQLfLV86rUP63UK5XtYqCB%2BnEyzc%2B9sS3tmLS4PCAvv9FD%2B%2FWsMiSxssdaOIZSsdCAQsC%2F4ByZ%2BWhb%2Fpv3uyTLry5o201I70BYampdfB8XfYZ%2FWTTSk1uAAQHQz8B8MIly3DsSf%2Fm%2FXM31&X-Amz-Signature=b88903e96765186d3aeba824a037808592d457b14802a44bcef3b84765223566&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622YE5YPV%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T155602Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCIEdvZhGKKJ8f%2F1AKokFJwfG0Ez6CuXPOe7LXvLAWLXqMAiAP1AX2TwyILeGNz1TnaG%2B4Y5mCW%2FwOVDQCJlXYeCzuHSqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4z%2BwbHj0xxddwITAKtwDgGGDxbb3p4gjV6UxBab0JI6%2BY8LoqB7xv%2FfayjyykcWjlySeACd3bJYJiMRDJR8rN8zstpUlqg9Sf2hBBHd0DWTrmycj%2B771KKoYy%2FcvmXhbP%2Be8i0phbKnv2jE%2FnjLgm7kqdtFpl56%2BfmbKK5rup%2BtH36Wgh2kaNjVt6c8J8lYzYy4PcxdcVzFcLXsc9DZAL0jdSMr%2Fj9%2B5lmQtougDg59EPgEHCT8xIevyjdpt0ZQVhg5MxtWBCiISG63fNJ8oVVBDx9Nqx3zJ9yCBt98YAaLMSjyHGHvykwqbGQO7QOF2mHmQ4SLkfB7exbshgwSLgfvdCYZk35jtFd2u7mT9fbx2OvAcNpgsw1wgr1ncG9CGeuE5q1HV6IWuger%2FRqPIMLS2yi5U1SN44VR1jeHy7GHK8wyjho2Tc%2Bf21hiZ4IZO%2FWjDJLtK14h8x1fzPsjNzfZeZPyvcTYDYhVaQOkcKfq6nlkHOQUQxC%2F6KifqJwJKZ4zKcfnBgdffSEtAzvHBYDITMHwLyVOEhA6lzE3Co4VJtzDQo6n%2Fv2cfqihcv4mN603wskzMkIJCstJEExQlbvTM1VY8oHvSjzSCPOTAlyP3HL%2FVDJi0aQ1376jW8Vgv7gkgC7eUWxIQrqcwx%2B3C1gY6pgFWcN6hyUFy2pSEgkKfQiAcuSxDeCElBQM4wS%2F7ZtjpDRb6zYKF242S%2BmLdRwO6IYr%2FdmKoYNS6En80G%2BxQLfLV86rUP63UK5XtYqCB%2BnEyzc%2B9sS3tmLS4PCAvv9FD%2B%2FWsMiSxssdaOIZSsdCAQsC%2F4ByZ%2BWhb%2Fpv3uyTLry5o201I70BYampdfB8XfYZ%2FWTTSk1uAAQHQz8B8MIly3DsSf%2Fm%2FXM31&X-Amz-Signature=3eb2a7e08ecde85852a38cbd8759196c5869bbb055973197a4f93fee07d03dd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622YE5YPV%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T155602Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCIEdvZhGKKJ8f%2F1AKokFJwfG0Ez6CuXPOe7LXvLAWLXqMAiAP1AX2TwyILeGNz1TnaG%2B4Y5mCW%2FwOVDQCJlXYeCzuHSqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4z%2BwbHj0xxddwITAKtwDgGGDxbb3p4gjV6UxBab0JI6%2BY8LoqB7xv%2FfayjyykcWjlySeACd3bJYJiMRDJR8rN8zstpUlqg9Sf2hBBHd0DWTrmycj%2B771KKoYy%2FcvmXhbP%2Be8i0phbKnv2jE%2FnjLgm7kqdtFpl56%2BfmbKK5rup%2BtH36Wgh2kaNjVt6c8J8lYzYy4PcxdcVzFcLXsc9DZAL0jdSMr%2Fj9%2B5lmQtougDg59EPgEHCT8xIevyjdpt0ZQVhg5MxtWBCiISG63fNJ8oVVBDx9Nqx3zJ9yCBt98YAaLMSjyHGHvykwqbGQO7QOF2mHmQ4SLkfB7exbshgwSLgfvdCYZk35jtFd2u7mT9fbx2OvAcNpgsw1wgr1ncG9CGeuE5q1HV6IWuger%2FRqPIMLS2yi5U1SN44VR1jeHy7GHK8wyjho2Tc%2Bf21hiZ4IZO%2FWjDJLtK14h8x1fzPsjNzfZeZPyvcTYDYhVaQOkcKfq6nlkHOQUQxC%2F6KifqJwJKZ4zKcfnBgdffSEtAzvHBYDITMHwLyVOEhA6lzE3Co4VJtzDQo6n%2Fv2cfqihcv4mN603wskzMkIJCstJEExQlbvTM1VY8oHvSjzSCPOTAlyP3HL%2FVDJi0aQ1376jW8Vgv7gkgC7eUWxIQrqcwx%2B3C1gY6pgFWcN6hyUFy2pSEgkKfQiAcuSxDeCElBQM4wS%2F7ZtjpDRb6zYKF242S%2BmLdRwO6IYr%2FdmKoYNS6En80G%2BxQLfLV86rUP63UK5XtYqCB%2BnEyzc%2B9sS3tmLS4PCAvv9FD%2B%2FWsMiSxssdaOIZSsdCAQsC%2F4ByZ%2BWhb%2Fpv3uyTLry5o201I70BYampdfB8XfYZ%2FWTTSk1uAAQHQz8B8MIly3DsSf%2Fm%2FXM31&X-Amz-Signature=f91c0bc61db9ee849dcc6fe12cee361f64be25b66fcb8d7fe5cff99840e847f7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46622YE5YPV%2F20261015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261015T155602Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCIEdvZhGKKJ8f%2F1AKokFJwfG0Ez6CuXPOe7LXvLAWLXqMAiAP1AX2TwyILeGNz1TnaG%2B4Y5mCW%2FwOVDQCJlXYeCzuHSqIBAjM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM4z%2BwbHj0xxddwITAKtwDgGGDxbb3p4gjV6UxBab0JI6%2BY8LoqB7xv%2FfayjyykcWjlySeACd3bJYJiMRDJR8rN8zstpUlqg9Sf2hBBHd0DWTrmycj%2B771KKoYy%2FcvmXhbP%2Be8i0phbKnv2jE%2FnjLgm7kqdtFpl56%2BfmbKK5rup%2BtH36Wgh2kaNjVt6c8J8lYzYy4PcxdcVzFcLXsc9DZAL0jdSMr%2Fj9%2B5lmQtougDg59EPgEHCT8xIevyjdpt0ZQVhg5MxtWBCiISG63fNJ8oVVBDx9Nqx3zJ9yCBt98YAaLMSjyHGHvykwqbGQO7QOF2mHmQ4SLkfB7exbshgwSLgfvdCYZk35jtFd2u7mT9fbx2OvAcNpgsw1wgr1ncG9CGeuE5q1HV6IWuger%2FRqPIMLS2yi5U1SN44VR1jeHy7GHK8wyjho2Tc%2Bf21hiZ4IZO%2FWjDJLtK14h8x1fzPsjNzfZeZPyvcTYDYhVaQOkcKfq6nlkHOQUQxC%2F6KifqJwJKZ4zKcfnBgdffSEtAzvHBYDITMHwLyVOEhA6lzE3Co4VJtzDQo6n%2Fv2cfqihcv4mN603wskzMkIJCstJEExQlbvTM1VY8oHvSjzSCPOTAlyP3HL%2FVDJi0aQ1376jW8Vgv7gkgC7eUWxIQrqcwx%2B3C1gY6pgFWcN6hyUFy2pSEgkKfQiAcuSxDeCElBQM4wS%2F7ZtjpDRb6zYKF242S%2BmLdRwO6IYr%2FdmKoYNS6En80G%2BxQLfLV86rUP63UK5XtYqCB%2BnEyzc%2B9sS3tmLS4PCAvv9FD%2B%2FWsMiSxssdaOIZSsdCAQsC%2F4ByZ%2BWhb%2Fpv3uyTLry5o201I70BYampdfB8XfYZ%2FWTTSk1uAAQHQz8B8MIly3DsSf%2Fm%2FXM31&X-Amz-Signature=9c087a84d80b8b63b0b482bb316fec7f1653d373dfed4b220aa943de5e803a53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
