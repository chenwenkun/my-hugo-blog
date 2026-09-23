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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466US7LI7JJ%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T204900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAEEeP%2FNUXAGbkgfzgdB2Sno2PXwkwR8d5vs94NMa5ggAiAgECCNNaeGaexqjQpeFXVwK6Gx%2B%2F7IzkYkCdwRMihYLiqIBAjD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrE4vq853oweAOXVJKtwD5lthP4uajmMJqOpT2qdd7GGkqW0Or7FldRc6kXWRVI9sKr6drk%2BCMqdpjJU5ZtHEvzuCR20Hnu%2B0gXX5wImkkfym8kr0TM0NPtdd6VTgvdHwZTPrWtZXfX3LPAMDxrO1RW79JS%2B0Jbr3DPtYHva1Y2JYDJZO6f2lMEjTJZq3D3rPYbS8jRtCzqYLJuU6CumqPfV1GAuMXEyvnGg3IskMQnFqi%2BgApk0fKBRR1vRcAaqddRiJilSmVG%2BMXlma2PTlGX3ecaJduA%2FdFPWcZPGVE%2BnTSn5qD95N5BOzUbwpCgoLv8HWPhUxk8z1eas%2FDw1wUMtdTBR0P324t%2BbE3%2B4PISQFM%2F2jgAT0Hsk3%2Biqn5J3DSKRg4G%2BKPjGhYXWOc3bkrC1wzV7JUf6J161hWZS6QGmI4lbJQFFZvaL7A3nMzFoDUqIiR1VjPcf%2FVRZ6x%2BuV50qegwpfkhicGqPsOe3zGRbYntspFh2OsbO%2B4%2FFIy%2FjCh4cI358aC6EYnBOMH3jTrdoIDyx5JLs76MmcanISgFSTHRLe0rEq%2B5u84Kw5JHsezpEvz1ciK2s8miFYGJgzVprXLB4yb1mhtTfTejUvlDpd4mcziXR5J1SORlOYGhmREitsI47LWuFtJ%2BAwmbHQ1QY6pgGw7TxkAe85%2BoJAccaheOj4xIlED3l3nZH6saeJAdYBb8REJFoazgAg2gJ9vjES2dPK%2B5vUvOM7kE6UaoPBi0z7sVQ16eptxfIakj8qxTgNeBSO92iWSmWogVQZ2Dqug5n2HMI1Uo%2FZLiV5a7XHEdM2W1vHc5xIR4XOWResbbE451UVncXfjFbJODWV7Ak1ifoGUjJ6iqQkvN6ssrp%2FQnRdUw%2FCyB9s&X-Amz-Signature=9295b42d18c9b2292ba1c615c876910a7aa7359f71689f3d5495f7743ce1c0db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466US7LI7JJ%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T204900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAEEeP%2FNUXAGbkgfzgdB2Sno2PXwkwR8d5vs94NMa5ggAiAgECCNNaeGaexqjQpeFXVwK6Gx%2B%2F7IzkYkCdwRMihYLiqIBAjD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrE4vq853oweAOXVJKtwD5lthP4uajmMJqOpT2qdd7GGkqW0Or7FldRc6kXWRVI9sKr6drk%2BCMqdpjJU5ZtHEvzuCR20Hnu%2B0gXX5wImkkfym8kr0TM0NPtdd6VTgvdHwZTPrWtZXfX3LPAMDxrO1RW79JS%2B0Jbr3DPtYHva1Y2JYDJZO6f2lMEjTJZq3D3rPYbS8jRtCzqYLJuU6CumqPfV1GAuMXEyvnGg3IskMQnFqi%2BgApk0fKBRR1vRcAaqddRiJilSmVG%2BMXlma2PTlGX3ecaJduA%2FdFPWcZPGVE%2BnTSn5qD95N5BOzUbwpCgoLv8HWPhUxk8z1eas%2FDw1wUMtdTBR0P324t%2BbE3%2B4PISQFM%2F2jgAT0Hsk3%2Biqn5J3DSKRg4G%2BKPjGhYXWOc3bkrC1wzV7JUf6J161hWZS6QGmI4lbJQFFZvaL7A3nMzFoDUqIiR1VjPcf%2FVRZ6x%2BuV50qegwpfkhicGqPsOe3zGRbYntspFh2OsbO%2B4%2FFIy%2FjCh4cI358aC6EYnBOMH3jTrdoIDyx5JLs76MmcanISgFSTHRLe0rEq%2B5u84Kw5JHsezpEvz1ciK2s8miFYGJgzVprXLB4yb1mhtTfTejUvlDpd4mcziXR5J1SORlOYGhmREitsI47LWuFtJ%2BAwmbHQ1QY6pgGw7TxkAe85%2BoJAccaheOj4xIlED3l3nZH6saeJAdYBb8REJFoazgAg2gJ9vjES2dPK%2B5vUvOM7kE6UaoPBi0z7sVQ16eptxfIakj8qxTgNeBSO92iWSmWogVQZ2Dqug5n2HMI1Uo%2FZLiV5a7XHEdM2W1vHc5xIR4XOWResbbE451UVncXfjFbJODWV7Ak1ifoGUjJ6iqQkvN6ssrp%2FQnRdUw%2FCyB9s&X-Amz-Signature=8edbbf156fd499b3aae8584f5cb361d141a2d7cc87d73c2a94c2b3caf8a42023&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466US7LI7JJ%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T204900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAEEeP%2FNUXAGbkgfzgdB2Sno2PXwkwR8d5vs94NMa5ggAiAgECCNNaeGaexqjQpeFXVwK6Gx%2B%2F7IzkYkCdwRMihYLiqIBAjD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrE4vq853oweAOXVJKtwD5lthP4uajmMJqOpT2qdd7GGkqW0Or7FldRc6kXWRVI9sKr6drk%2BCMqdpjJU5ZtHEvzuCR20Hnu%2B0gXX5wImkkfym8kr0TM0NPtdd6VTgvdHwZTPrWtZXfX3LPAMDxrO1RW79JS%2B0Jbr3DPtYHva1Y2JYDJZO6f2lMEjTJZq3D3rPYbS8jRtCzqYLJuU6CumqPfV1GAuMXEyvnGg3IskMQnFqi%2BgApk0fKBRR1vRcAaqddRiJilSmVG%2BMXlma2PTlGX3ecaJduA%2FdFPWcZPGVE%2BnTSn5qD95N5BOzUbwpCgoLv8HWPhUxk8z1eas%2FDw1wUMtdTBR0P324t%2BbE3%2B4PISQFM%2F2jgAT0Hsk3%2Biqn5J3DSKRg4G%2BKPjGhYXWOc3bkrC1wzV7JUf6J161hWZS6QGmI4lbJQFFZvaL7A3nMzFoDUqIiR1VjPcf%2FVRZ6x%2BuV50qegwpfkhicGqPsOe3zGRbYntspFh2OsbO%2B4%2FFIy%2FjCh4cI358aC6EYnBOMH3jTrdoIDyx5JLs76MmcanISgFSTHRLe0rEq%2B5u84Kw5JHsezpEvz1ciK2s8miFYGJgzVprXLB4yb1mhtTfTejUvlDpd4mcziXR5J1SORlOYGhmREitsI47LWuFtJ%2BAwmbHQ1QY6pgGw7TxkAe85%2BoJAccaheOj4xIlED3l3nZH6saeJAdYBb8REJFoazgAg2gJ9vjES2dPK%2B5vUvOM7kE6UaoPBi0z7sVQ16eptxfIakj8qxTgNeBSO92iWSmWogVQZ2Dqug5n2HMI1Uo%2FZLiV5a7XHEdM2W1vHc5xIR4XOWResbbE451UVncXfjFbJODWV7Ak1ifoGUjJ6iqQkvN6ssrp%2FQnRdUw%2FCyB9s&X-Amz-Signature=83857bb77bc9d7fb4ae1d7c8828f5d4592c6a3498deae5af401728fa5da67392&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466US7LI7JJ%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T204900Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAEEeP%2FNUXAGbkgfzgdB2Sno2PXwkwR8d5vs94NMa5ggAiAgECCNNaeGaexqjQpeFXVwK6Gx%2B%2F7IzkYkCdwRMihYLiqIBAjD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMrE4vq853oweAOXVJKtwD5lthP4uajmMJqOpT2qdd7GGkqW0Or7FldRc6kXWRVI9sKr6drk%2BCMqdpjJU5ZtHEvzuCR20Hnu%2B0gXX5wImkkfym8kr0TM0NPtdd6VTgvdHwZTPrWtZXfX3LPAMDxrO1RW79JS%2B0Jbr3DPtYHva1Y2JYDJZO6f2lMEjTJZq3D3rPYbS8jRtCzqYLJuU6CumqPfV1GAuMXEyvnGg3IskMQnFqi%2BgApk0fKBRR1vRcAaqddRiJilSmVG%2BMXlma2PTlGX3ecaJduA%2FdFPWcZPGVE%2BnTSn5qD95N5BOzUbwpCgoLv8HWPhUxk8z1eas%2FDw1wUMtdTBR0P324t%2BbE3%2B4PISQFM%2F2jgAT0Hsk3%2Biqn5J3DSKRg4G%2BKPjGhYXWOc3bkrC1wzV7JUf6J161hWZS6QGmI4lbJQFFZvaL7A3nMzFoDUqIiR1VjPcf%2FVRZ6x%2BuV50qegwpfkhicGqPsOe3zGRbYntspFh2OsbO%2B4%2FFIy%2FjCh4cI358aC6EYnBOMH3jTrdoIDyx5JLs76MmcanISgFSTHRLe0rEq%2B5u84Kw5JHsezpEvz1ciK2s8miFYGJgzVprXLB4yb1mhtTfTejUvlDpd4mcziXR5J1SORlOYGhmREitsI47LWuFtJ%2BAwmbHQ1QY6pgGw7TxkAe85%2BoJAccaheOj4xIlED3l3nZH6saeJAdYBb8REJFoazgAg2gJ9vjES2dPK%2B5vUvOM7kE6UaoPBi0z7sVQ16eptxfIakj8qxTgNeBSO92iWSmWogVQZ2Dqug5n2HMI1Uo%2FZLiV5a7XHEdM2W1vHc5xIR4XOWResbbE451UVncXfjFbJODWV7Ak1ifoGUjJ6iqQkvN6ssrp%2FQnRdUw%2FCyB9s&X-Amz-Signature=a441350fa22730c1285866c2858a1caa43e4f4f612a73b39007d2a79ef775262&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
