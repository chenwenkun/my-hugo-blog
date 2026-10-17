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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJ4QDUJU%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T020229Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIApP4pJElyF7g9RwpqPU8V%2FJ2RiZAF2MIgbQwz1suiF0AiEA3s4Ukt%2Br12imB2uGRnUbbfXMZIKnmWYpZkzkPwDwOR0qiAQI8f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYCPYu4sI99WeQy6CrcA3yu56otiyr1z7xJm%2B7MFQVKwRh2A4fTROtxb4jzr6dKb6RnbCTvoTF%2B6NGleW94QOTVil7LcF9rdBgmA5omKvH32I%2Blx4mIAJ%2BuaBturD8zME9fPiq1pOoSlu%2FqBvagK1yaUVmAV%2FO0PdoiFJ56fYB7Qcs1wPab%2BcI%2FPGZu2bPc%2Bl8ioNecsPH%2F3r6CMCFAdwDSIh%2BVJmhFqOntvd1foIPfBkqa0SEuGTSFKp%2B2pvReDvqC6Q9RJxGD39td0MOAq9%2FFNPfN%2BVksFtt7oxs8W0GH5rr5PeBfBSaKF5cwf7e9bdJ4LepixX1DAtCOojGV%2Fx%2BdBaqEsLaZiwnMQ7sz2iw3g1c8WjZrsbaQ2z%2FVjt1%2Bw6MWvTdWBNTenS2nnAn5pBdgih3sSRUwczD%2F3nHV0nLDGFyp24hkqd7OfuFIm2c1iQ5D1kVCyOrPDovomN1UYfr7JrRUoyhEmMXPyW1oZYraSoW%2FzPoxU4g9xXh8yXbGcF9aoSZaD2htETivf7OY7FUW2S5pyVT5V15aGR7AVoNxytCO1%2Fg8w%2BQvZmXLQ4faiG89kE7W1ISuh1XB%2BAH5PkdiojGXkIC101Jw0Kkj0TKWF7tmRA4nECLye15syP9t8eVCkJXCJSAONDV1MOD%2FytYGOqUB4QDesTJM9B2Dhu6gWmR25Ou3dJODUo8bdoc4jZzsoCphWAQTqNp8eOs3LhkIYnJ4To8IZ8Wo71TfsFtplEMxiPJZkIDo9BEhN%2BjuVpyj%2Bcu1Wv5DMK21X3hmvLgsCEWOI0xF5z3aaiBpcpn5%2FzkUy5s%2FK2g8sQoS9SBpE4wCfD%2BT0xq0b4mbQ%2F0cQPq1fv%2Bao8cAv1rm1xmlrXa2p8bM2ZV51be4&X-Amz-Signature=76e95c74a8876dcd33da74e13f340faf709c3135681ec10bac1af9e21c85aa52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJ4QDUJU%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T020229Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIApP4pJElyF7g9RwpqPU8V%2FJ2RiZAF2MIgbQwz1suiF0AiEA3s4Ukt%2Br12imB2uGRnUbbfXMZIKnmWYpZkzkPwDwOR0qiAQI8f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYCPYu4sI99WeQy6CrcA3yu56otiyr1z7xJm%2B7MFQVKwRh2A4fTROtxb4jzr6dKb6RnbCTvoTF%2B6NGleW94QOTVil7LcF9rdBgmA5omKvH32I%2Blx4mIAJ%2BuaBturD8zME9fPiq1pOoSlu%2FqBvagK1yaUVmAV%2FO0PdoiFJ56fYB7Qcs1wPab%2BcI%2FPGZu2bPc%2Bl8ioNecsPH%2F3r6CMCFAdwDSIh%2BVJmhFqOntvd1foIPfBkqa0SEuGTSFKp%2B2pvReDvqC6Q9RJxGD39td0MOAq9%2FFNPfN%2BVksFtt7oxs8W0GH5rr5PeBfBSaKF5cwf7e9bdJ4LepixX1DAtCOojGV%2Fx%2BdBaqEsLaZiwnMQ7sz2iw3g1c8WjZrsbaQ2z%2FVjt1%2Bw6MWvTdWBNTenS2nnAn5pBdgih3sSRUwczD%2F3nHV0nLDGFyp24hkqd7OfuFIm2c1iQ5D1kVCyOrPDovomN1UYfr7JrRUoyhEmMXPyW1oZYraSoW%2FzPoxU4g9xXh8yXbGcF9aoSZaD2htETivf7OY7FUW2S5pyVT5V15aGR7AVoNxytCO1%2Fg8w%2BQvZmXLQ4faiG89kE7W1ISuh1XB%2BAH5PkdiojGXkIC101Jw0Kkj0TKWF7tmRA4nECLye15syP9t8eVCkJXCJSAONDV1MOD%2FytYGOqUB4QDesTJM9B2Dhu6gWmR25Ou3dJODUo8bdoc4jZzsoCphWAQTqNp8eOs3LhkIYnJ4To8IZ8Wo71TfsFtplEMxiPJZkIDo9BEhN%2BjuVpyj%2Bcu1Wv5DMK21X3hmvLgsCEWOI0xF5z3aaiBpcpn5%2FzkUy5s%2FK2g8sQoS9SBpE4wCfD%2BT0xq0b4mbQ%2F0cQPq1fv%2Bao8cAv1rm1xmlrXa2p8bM2ZV51be4&X-Amz-Signature=b96313a5d920b4655956ecc3b5dcd64c6035fd2bdff7a13c90279d00eaa2810e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJ4QDUJU%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T020229Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIApP4pJElyF7g9RwpqPU8V%2FJ2RiZAF2MIgbQwz1suiF0AiEA3s4Ukt%2Br12imB2uGRnUbbfXMZIKnmWYpZkzkPwDwOR0qiAQI8f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYCPYu4sI99WeQy6CrcA3yu56otiyr1z7xJm%2B7MFQVKwRh2A4fTROtxb4jzr6dKb6RnbCTvoTF%2B6NGleW94QOTVil7LcF9rdBgmA5omKvH32I%2Blx4mIAJ%2BuaBturD8zME9fPiq1pOoSlu%2FqBvagK1yaUVmAV%2FO0PdoiFJ56fYB7Qcs1wPab%2BcI%2FPGZu2bPc%2Bl8ioNecsPH%2F3r6CMCFAdwDSIh%2BVJmhFqOntvd1foIPfBkqa0SEuGTSFKp%2B2pvReDvqC6Q9RJxGD39td0MOAq9%2FFNPfN%2BVksFtt7oxs8W0GH5rr5PeBfBSaKF5cwf7e9bdJ4LepixX1DAtCOojGV%2Fx%2BdBaqEsLaZiwnMQ7sz2iw3g1c8WjZrsbaQ2z%2FVjt1%2Bw6MWvTdWBNTenS2nnAn5pBdgih3sSRUwczD%2F3nHV0nLDGFyp24hkqd7OfuFIm2c1iQ5D1kVCyOrPDovomN1UYfr7JrRUoyhEmMXPyW1oZYraSoW%2FzPoxU4g9xXh8yXbGcF9aoSZaD2htETivf7OY7FUW2S5pyVT5V15aGR7AVoNxytCO1%2Fg8w%2BQvZmXLQ4faiG89kE7W1ISuh1XB%2BAH5PkdiojGXkIC101Jw0Kkj0TKWF7tmRA4nECLye15syP9t8eVCkJXCJSAONDV1MOD%2FytYGOqUB4QDesTJM9B2Dhu6gWmR25Ou3dJODUo8bdoc4jZzsoCphWAQTqNp8eOs3LhkIYnJ4To8IZ8Wo71TfsFtplEMxiPJZkIDo9BEhN%2BjuVpyj%2Bcu1Wv5DMK21X3hmvLgsCEWOI0xF5z3aaiBpcpn5%2FzkUy5s%2FK2g8sQoS9SBpE4wCfD%2BT0xq0b4mbQ%2F0cQPq1fv%2Bao8cAv1rm1xmlrXa2p8bM2ZV51be4&X-Amz-Signature=0f5777785481f38dbfd948c72c48d02a3daecbd66637e9fca208e1df70c6200d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TJ4QDUJU%2F20261017%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261017T020229Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECkaCXVzLXdlc3QtMiJHMEUCIApP4pJElyF7g9RwpqPU8V%2FJ2RiZAF2MIgbQwz1suiF0AiEA3s4Ukt%2Br12imB2uGRnUbbfXMZIKnmWYpZkzkPwDwOR0qiAQI8f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNYCPYu4sI99WeQy6CrcA3yu56otiyr1z7xJm%2B7MFQVKwRh2A4fTROtxb4jzr6dKb6RnbCTvoTF%2B6NGleW94QOTVil7LcF9rdBgmA5omKvH32I%2Blx4mIAJ%2BuaBturD8zME9fPiq1pOoSlu%2FqBvagK1yaUVmAV%2FO0PdoiFJ56fYB7Qcs1wPab%2BcI%2FPGZu2bPc%2Bl8ioNecsPH%2F3r6CMCFAdwDSIh%2BVJmhFqOntvd1foIPfBkqa0SEuGTSFKp%2B2pvReDvqC6Q9RJxGD39td0MOAq9%2FFNPfN%2BVksFtt7oxs8W0GH5rr5PeBfBSaKF5cwf7e9bdJ4LepixX1DAtCOojGV%2Fx%2BdBaqEsLaZiwnMQ7sz2iw3g1c8WjZrsbaQ2z%2FVjt1%2Bw6MWvTdWBNTenS2nnAn5pBdgih3sSRUwczD%2F3nHV0nLDGFyp24hkqd7OfuFIm2c1iQ5D1kVCyOrPDovomN1UYfr7JrRUoyhEmMXPyW1oZYraSoW%2FzPoxU4g9xXh8yXbGcF9aoSZaD2htETivf7OY7FUW2S5pyVT5V15aGR7AVoNxytCO1%2Fg8w%2BQvZmXLQ4faiG89kE7W1ISuh1XB%2BAH5PkdiojGXkIC101Jw0Kkj0TKWF7tmRA4nECLye15syP9t8eVCkJXCJSAONDV1MOD%2FytYGOqUB4QDesTJM9B2Dhu6gWmR25Ou3dJODUo8bdoc4jZzsoCphWAQTqNp8eOs3LhkIYnJ4To8IZ8Wo71TfsFtplEMxiPJZkIDo9BEhN%2BjuVpyj%2Bcu1Wv5DMK21X3hmvLgsCEWOI0xF5z3aaiBpcpn5%2FzkUy5s%2FK2g8sQoS9SBpE4wCfD%2BT0xq0b4mbQ%2F0cQPq1fv%2Bao8cAv1rm1xmlrXa2p8bM2ZV51be4&X-Amz-Signature=443498ca45e2fe80520a2764df592a4004a00131b93e6739ca84a8104b39842a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
