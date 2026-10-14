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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TA2BP7HC%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T104852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEdReI1FzpG%2By9gJHz8w%2FnzQ97gL9O9BSXHqYliyru7nAiEAykQRMv0pAMYfsNULMgtnxhdDxhJR0ojTXoV1IvfcYbUqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK0TqZYB7%2F8Vp6hZaSrcA1VSwyDutRODjazFqApOPLTxUNA9XeuX3izApJYK9xchktfTfBqiYdVqQbb8sCxZCSbXqggUnzJU1RSdMgwyegf20QC6Rc9ctHI3etHf12xeCV3xoqswEKfsVcjzDoNSAZE4eIRiqiA%2Fs%2FtmEeFlA1bAABfYt87VRnZlSLRASEmMwQG38JubxmC7FNj%2BXv8rXQCOyzNtpvBqPQyXjuiUctBs7MDa67asv2DiDvuxr%2BzSaotbkpg7lxBM6ATcupkNxKHctWWZAuK1p4hhK4yD1aOgoSOpOVIDWPvNe1j0NzClDxoWJm4Ms8VjqFYEI08nuP0KfLFwN%2FJnL8asQgIL%2BDF3KjOLSjc8AksOox8Njt7W%2BsWgdwniappT1G4vmNNmB3eY%2FbHihOgg6v5Bsi6aUJNksYL6IlG0Y1BT56kXViPtU1C1s0NSI0kNKDEOZgyPoKlF6VD2FkP5lH177UoqXT%2Fugf2FJ30Zmn3AKd9De5mltAB5T3nHCJ%2FNnCy%2FbKUCPzcCudckjmscvFzuCqw%2Fb6AiaRWJFSB%2BL8DKOmhT%2Fn7UQUE3HLbYTsmNramMM7H%2BNz7MDA3mVJkJS7qCMMKh%2FkKyrQgAJddoapnQyVNn%2BbLXqLLXUD9XCG8dv8trMI6OvdYGOqUBQfHRX8uXByn00kBbs4G0yTxGt83Pqky2kulpTF5iD412uXPc6yREC1JQxZHEfj%2BNqQFx2FHanOkXTOlxSgUIExLnU3kACehSuyT16exLWyh5GUprINUSOzYGedQYg3HjCb%2BwOlXP8Q%2BNWqLCa4E%2Bm0wTXt3pduwfTLNPL5ficsBkJTT1myymWunLC5%2BRT6yC4%2BC1eu67Mhqz0vk8YfsF%2Bsh4XTD3&X-Amz-Signature=4958c6bf4d51fa46e207eb1a4aedb3225d0be3107ea35b00d633d66d36ffd973&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TA2BP7HC%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T104852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEdReI1FzpG%2By9gJHz8w%2FnzQ97gL9O9BSXHqYliyru7nAiEAykQRMv0pAMYfsNULMgtnxhdDxhJR0ojTXoV1IvfcYbUqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK0TqZYB7%2F8Vp6hZaSrcA1VSwyDutRODjazFqApOPLTxUNA9XeuX3izApJYK9xchktfTfBqiYdVqQbb8sCxZCSbXqggUnzJU1RSdMgwyegf20QC6Rc9ctHI3etHf12xeCV3xoqswEKfsVcjzDoNSAZE4eIRiqiA%2Fs%2FtmEeFlA1bAABfYt87VRnZlSLRASEmMwQG38JubxmC7FNj%2BXv8rXQCOyzNtpvBqPQyXjuiUctBs7MDa67asv2DiDvuxr%2BzSaotbkpg7lxBM6ATcupkNxKHctWWZAuK1p4hhK4yD1aOgoSOpOVIDWPvNe1j0NzClDxoWJm4Ms8VjqFYEI08nuP0KfLFwN%2FJnL8asQgIL%2BDF3KjOLSjc8AksOox8Njt7W%2BsWgdwniappT1G4vmNNmB3eY%2FbHihOgg6v5Bsi6aUJNksYL6IlG0Y1BT56kXViPtU1C1s0NSI0kNKDEOZgyPoKlF6VD2FkP5lH177UoqXT%2Fugf2FJ30Zmn3AKd9De5mltAB5T3nHCJ%2FNnCy%2FbKUCPzcCudckjmscvFzuCqw%2Fb6AiaRWJFSB%2BL8DKOmhT%2Fn7UQUE3HLbYTsmNramMM7H%2BNz7MDA3mVJkJS7qCMMKh%2FkKyrQgAJddoapnQyVNn%2BbLXqLLXUD9XCG8dv8trMI6OvdYGOqUBQfHRX8uXByn00kBbs4G0yTxGt83Pqky2kulpTF5iD412uXPc6yREC1JQxZHEfj%2BNqQFx2FHanOkXTOlxSgUIExLnU3kACehSuyT16exLWyh5GUprINUSOzYGedQYg3HjCb%2BwOlXP8Q%2BNWqLCa4E%2Bm0wTXt3pduwfTLNPL5ficsBkJTT1myymWunLC5%2BRT6yC4%2BC1eu67Mhqz0vk8YfsF%2Bsh4XTD3&X-Amz-Signature=dbd1b2866342fbe7f362153eb3227cfc592c7e3368dc23e836fbf25c2fb1d8f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TA2BP7HC%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T104852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEdReI1FzpG%2By9gJHz8w%2FnzQ97gL9O9BSXHqYliyru7nAiEAykQRMv0pAMYfsNULMgtnxhdDxhJR0ojTXoV1IvfcYbUqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK0TqZYB7%2F8Vp6hZaSrcA1VSwyDutRODjazFqApOPLTxUNA9XeuX3izApJYK9xchktfTfBqiYdVqQbb8sCxZCSbXqggUnzJU1RSdMgwyegf20QC6Rc9ctHI3etHf12xeCV3xoqswEKfsVcjzDoNSAZE4eIRiqiA%2Fs%2FtmEeFlA1bAABfYt87VRnZlSLRASEmMwQG38JubxmC7FNj%2BXv8rXQCOyzNtpvBqPQyXjuiUctBs7MDa67asv2DiDvuxr%2BzSaotbkpg7lxBM6ATcupkNxKHctWWZAuK1p4hhK4yD1aOgoSOpOVIDWPvNe1j0NzClDxoWJm4Ms8VjqFYEI08nuP0KfLFwN%2FJnL8asQgIL%2BDF3KjOLSjc8AksOox8Njt7W%2BsWgdwniappT1G4vmNNmB3eY%2FbHihOgg6v5Bsi6aUJNksYL6IlG0Y1BT56kXViPtU1C1s0NSI0kNKDEOZgyPoKlF6VD2FkP5lH177UoqXT%2Fugf2FJ30Zmn3AKd9De5mltAB5T3nHCJ%2FNnCy%2FbKUCPzcCudckjmscvFzuCqw%2Fb6AiaRWJFSB%2BL8DKOmhT%2Fn7UQUE3HLbYTsmNramMM7H%2BNz7MDA3mVJkJS7qCMMKh%2FkKyrQgAJddoapnQyVNn%2BbLXqLLXUD9XCG8dv8trMI6OvdYGOqUBQfHRX8uXByn00kBbs4G0yTxGt83Pqky2kulpTF5iD412uXPc6yREC1JQxZHEfj%2BNqQFx2FHanOkXTOlxSgUIExLnU3kACehSuyT16exLWyh5GUprINUSOzYGedQYg3HjCb%2BwOlXP8Q%2BNWqLCa4E%2Bm0wTXt3pduwfTLNPL5ficsBkJTT1myymWunLC5%2BRT6yC4%2BC1eu67Mhqz0vk8YfsF%2Bsh4XTD3&X-Amz-Signature=5fdcb0beae53563d34742dc092222d2268bbdc4ed222b1191d135298a29494b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TA2BP7HC%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T104852Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIEdReI1FzpG%2By9gJHz8w%2FnzQ97gL9O9BSXHqYliyru7nAiEAykQRMv0pAMYfsNULMgtnxhdDxhJR0ojTXoV1IvfcYbUqiAQIsv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDK0TqZYB7%2F8Vp6hZaSrcA1VSwyDutRODjazFqApOPLTxUNA9XeuX3izApJYK9xchktfTfBqiYdVqQbb8sCxZCSbXqggUnzJU1RSdMgwyegf20QC6Rc9ctHI3etHf12xeCV3xoqswEKfsVcjzDoNSAZE4eIRiqiA%2Fs%2FtmEeFlA1bAABfYt87VRnZlSLRASEmMwQG38JubxmC7FNj%2BXv8rXQCOyzNtpvBqPQyXjuiUctBs7MDa67asv2DiDvuxr%2BzSaotbkpg7lxBM6ATcupkNxKHctWWZAuK1p4hhK4yD1aOgoSOpOVIDWPvNe1j0NzClDxoWJm4Ms8VjqFYEI08nuP0KfLFwN%2FJnL8asQgIL%2BDF3KjOLSjc8AksOox8Njt7W%2BsWgdwniappT1G4vmNNmB3eY%2FbHihOgg6v5Bsi6aUJNksYL6IlG0Y1BT56kXViPtU1C1s0NSI0kNKDEOZgyPoKlF6VD2FkP5lH177UoqXT%2Fugf2FJ30Zmn3AKd9De5mltAB5T3nHCJ%2FNnCy%2FbKUCPzcCudckjmscvFzuCqw%2Fb6AiaRWJFSB%2BL8DKOmhT%2Fn7UQUE3HLbYTsmNramMM7H%2BNz7MDA3mVJkJS7qCMMKh%2FkKyrQgAJddoapnQyVNn%2BbLXqLLXUD9XCG8dv8trMI6OvdYGOqUBQfHRX8uXByn00kBbs4G0yTxGt83Pqky2kulpTF5iD412uXPc6yREC1JQxZHEfj%2BNqQFx2FHanOkXTOlxSgUIExLnU3kACehSuyT16exLWyh5GUprINUSOzYGedQYg3HjCb%2BwOlXP8Q%2BNWqLCa4E%2Bm0wTXt3pduwfTLNPL5ficsBkJTT1myymWunLC5%2BRT6yC4%2BC1eu67Mhqz0vk8YfsF%2Bsh4XTD3&X-Amz-Signature=45e963fc38531b18dcb9d3aa4c4cc6fe950f695eb29d906479647d468b8cfd3c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
