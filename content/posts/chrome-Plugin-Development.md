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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46654RM3CN2%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T151322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBmewExlysqoNSQfu3AuMyrtofqawzi%2BRLa0WsB370MqAiEA403gEeyyXG0R2rW0WR1h45Uct2BQSJ%2BCcL0grlld%2F60qiAQIvP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJi1uY1CPSssvA0FFCrcA%2FMruzdjIk9x4izOFt71Dhx%2FE01G2rtw9s2b86Btriw8uHNNhdBq6ij3F7K%2FNNb%2FtjRIphxdqak8dxghZsmEkTXwQ1fdSD%2BeJgNkSWej%2Bxv8Fb%2F12gwbnEf991Aoii7447iKh%2BQrKsJmOnFFbpvsEurucNsV%2B5I0rkrlE11DNeGcvkbcFCaBxZXEnft%2FfWSX6LVOo%2F1aCpMrx2HXXtLqGJssd6A9CZpWZlCCS8BffmhrndTcQFTMMMpzyGn1KZ27YUQAloWSWDLV13fIBhv5IN%2FGAfzJ%2FgRk%2FNhiy2aG9vueRh7LLgvzyxqbbfuu5TmcRl1VAZnJiRPDWCT927J1EHs9v8lvgjSNVplBLODIiIUefD0TabPjqs8v%2F6bhNpnDW1LoBCf8wrB8zDCO9FcNIAroDZLN79dc3TYzhXAYXe0N9i88kQqDxdm%2FlC25I59OqbEfhsjy%2Be8WALKfQY0JfzrV7hzw1kHyr6ZdwCYZwgRDqqLdEMFAQcWnJwsLJYoDeNv5NVilyi%2BFD9GSsHbpdaE4OUtfBEX03ha8a%2FB6ASfMFU4mY9meoBYsyffb67hmUU9yjxdBotEexIt%2B29I2woyMHXgu%2Fjgqn%2FsnpYMK%2F%2BiZJZyPI0J0ybLLP5vlMO%2FU99YGOqUBxhsxd205WvlnAfGg9lPpf7507nKQpkqystirhg4B1vLcoBN58wV8TMLwLekEW1xwR46fby1nkd2860LrS5VSEzMvh1z8iDbna8%2FuV27jz7jVBV9Dw%2Br7YgCxW74u48dR7OOptxKW10zfEUuCkdkhQqRLNOey44CWcMFx52dMADZ4Sj4j%2B%2FKERNSGPd%2B8MtACQW78QsV4dHrqzQPI1DxukiPlO5mX&X-Amz-Signature=b1e2928e0e9e7a2ec91782fd0614073a906fdca4bd75a5f65a9cbdbaf7d7c31b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46654RM3CN2%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T151322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBmewExlysqoNSQfu3AuMyrtofqawzi%2BRLa0WsB370MqAiEA403gEeyyXG0R2rW0WR1h45Uct2BQSJ%2BCcL0grlld%2F60qiAQIvP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJi1uY1CPSssvA0FFCrcA%2FMruzdjIk9x4izOFt71Dhx%2FE01G2rtw9s2b86Btriw8uHNNhdBq6ij3F7K%2FNNb%2FtjRIphxdqak8dxghZsmEkTXwQ1fdSD%2BeJgNkSWej%2Bxv8Fb%2F12gwbnEf991Aoii7447iKh%2BQrKsJmOnFFbpvsEurucNsV%2B5I0rkrlE11DNeGcvkbcFCaBxZXEnft%2FfWSX6LVOo%2F1aCpMrx2HXXtLqGJssd6A9CZpWZlCCS8BffmhrndTcQFTMMMpzyGn1KZ27YUQAloWSWDLV13fIBhv5IN%2FGAfzJ%2FgRk%2FNhiy2aG9vueRh7LLgvzyxqbbfuu5TmcRl1VAZnJiRPDWCT927J1EHs9v8lvgjSNVplBLODIiIUefD0TabPjqs8v%2F6bhNpnDW1LoBCf8wrB8zDCO9FcNIAroDZLN79dc3TYzhXAYXe0N9i88kQqDxdm%2FlC25I59OqbEfhsjy%2Be8WALKfQY0JfzrV7hzw1kHyr6ZdwCYZwgRDqqLdEMFAQcWnJwsLJYoDeNv5NVilyi%2BFD9GSsHbpdaE4OUtfBEX03ha8a%2FB6ASfMFU4mY9meoBYsyffb67hmUU9yjxdBotEexIt%2B29I2woyMHXgu%2Fjgqn%2FsnpYMK%2F%2BiZJZyPI0J0ybLLP5vlMO%2FU99YGOqUBxhsxd205WvlnAfGg9lPpf7507nKQpkqystirhg4B1vLcoBN58wV8TMLwLekEW1xwR46fby1nkd2860LrS5VSEzMvh1z8iDbna8%2FuV27jz7jVBV9Dw%2Br7YgCxW74u48dR7OOptxKW10zfEUuCkdkhQqRLNOey44CWcMFx52dMADZ4Sj4j%2B%2FKERNSGPd%2B8MtACQW78QsV4dHrqzQPI1DxukiPlO5mX&X-Amz-Signature=46dac02c4da9dd4388c41d3b5e5813ae1f8748ecceec14a0b1539606f2f2d9f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46654RM3CN2%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T151322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBmewExlysqoNSQfu3AuMyrtofqawzi%2BRLa0WsB370MqAiEA403gEeyyXG0R2rW0WR1h45Uct2BQSJ%2BCcL0grlld%2F60qiAQIvP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJi1uY1CPSssvA0FFCrcA%2FMruzdjIk9x4izOFt71Dhx%2FE01G2rtw9s2b86Btriw8uHNNhdBq6ij3F7K%2FNNb%2FtjRIphxdqak8dxghZsmEkTXwQ1fdSD%2BeJgNkSWej%2Bxv8Fb%2F12gwbnEf991Aoii7447iKh%2BQrKsJmOnFFbpvsEurucNsV%2B5I0rkrlE11DNeGcvkbcFCaBxZXEnft%2FfWSX6LVOo%2F1aCpMrx2HXXtLqGJssd6A9CZpWZlCCS8BffmhrndTcQFTMMMpzyGn1KZ27YUQAloWSWDLV13fIBhv5IN%2FGAfzJ%2FgRk%2FNhiy2aG9vueRh7LLgvzyxqbbfuu5TmcRl1VAZnJiRPDWCT927J1EHs9v8lvgjSNVplBLODIiIUefD0TabPjqs8v%2F6bhNpnDW1LoBCf8wrB8zDCO9FcNIAroDZLN79dc3TYzhXAYXe0N9i88kQqDxdm%2FlC25I59OqbEfhsjy%2Be8WALKfQY0JfzrV7hzw1kHyr6ZdwCYZwgRDqqLdEMFAQcWnJwsLJYoDeNv5NVilyi%2BFD9GSsHbpdaE4OUtfBEX03ha8a%2FB6ASfMFU4mY9meoBYsyffb67hmUU9yjxdBotEexIt%2B29I2woyMHXgu%2Fjgqn%2FsnpYMK%2F%2BiZJZyPI0J0ybLLP5vlMO%2FU99YGOqUBxhsxd205WvlnAfGg9lPpf7507nKQpkqystirhg4B1vLcoBN58wV8TMLwLekEW1xwR46fby1nkd2860LrS5VSEzMvh1z8iDbna8%2FuV27jz7jVBV9Dw%2Br7YgCxW74u48dR7OOptxKW10zfEUuCkdkhQqRLNOey44CWcMFx52dMADZ4Sj4j%2B%2FKERNSGPd%2B8MtACQW78QsV4dHrqzQPI1DxukiPlO5mX&X-Amz-Signature=3df286b39fec61a23d69515bcae140ce722ef3d0afd1ab419c49debd6db088f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46654RM3CN2%2F20261025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261025T151322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBmewExlysqoNSQfu3AuMyrtofqawzi%2BRLa0WsB370MqAiEA403gEeyyXG0R2rW0WR1h45Uct2BQSJ%2BCcL0grlld%2F60qiAQIvP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJi1uY1CPSssvA0FFCrcA%2FMruzdjIk9x4izOFt71Dhx%2FE01G2rtw9s2b86Btriw8uHNNhdBq6ij3F7K%2FNNb%2FtjRIphxdqak8dxghZsmEkTXwQ1fdSD%2BeJgNkSWej%2Bxv8Fb%2F12gwbnEf991Aoii7447iKh%2BQrKsJmOnFFbpvsEurucNsV%2B5I0rkrlE11DNeGcvkbcFCaBxZXEnft%2FfWSX6LVOo%2F1aCpMrx2HXXtLqGJssd6A9CZpWZlCCS8BffmhrndTcQFTMMMpzyGn1KZ27YUQAloWSWDLV13fIBhv5IN%2FGAfzJ%2FgRk%2FNhiy2aG9vueRh7LLgvzyxqbbfuu5TmcRl1VAZnJiRPDWCT927J1EHs9v8lvgjSNVplBLODIiIUefD0TabPjqs8v%2F6bhNpnDW1LoBCf8wrB8zDCO9FcNIAroDZLN79dc3TYzhXAYXe0N9i88kQqDxdm%2FlC25I59OqbEfhsjy%2Be8WALKfQY0JfzrV7hzw1kHyr6ZdwCYZwgRDqqLdEMFAQcWnJwsLJYoDeNv5NVilyi%2BFD9GSsHbpdaE4OUtfBEX03ha8a%2FB6ASfMFU4mY9meoBYsyffb67hmUU9yjxdBotEexIt%2B29I2woyMHXgu%2Fjgqn%2FsnpYMK%2F%2BiZJZyPI0J0ybLLP5vlMO%2FU99YGOqUBxhsxd205WvlnAfGg9lPpf7507nKQpkqystirhg4B1vLcoBN58wV8TMLwLekEW1xwR46fby1nkd2860LrS5VSEzMvh1z8iDbna8%2FuV27jz7jVBV9Dw%2Br7YgCxW74u48dR7OOptxKW10zfEUuCkdkhQqRLNOey44CWcMFx52dMADZ4Sj4j%2B%2FKERNSGPd%2B8MtACQW78QsV4dHrqzQPI1DxukiPlO5mX&X-Amz-Signature=9769325308350167634c6ba6c1a17b0b5870b4a607a62d8466188bfdbd96adeb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
