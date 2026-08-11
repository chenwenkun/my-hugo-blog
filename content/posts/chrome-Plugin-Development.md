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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XFOOZYA%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T064541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDSkriJ6vVKLMcovb16UlSUW7%2F5vdEZcCinWWxfs11OkQIhAKN8b6%2B4R%2BatRoO3Ut%2FdmaLYwaN4uYbP6cgFiz79EiWLKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwVdeQN45wcoyFJnbAq3APv9FyQ4ivy4weA6ys%2B0GAgoZxgr7L1gIVD%2B7dyNbseWGdUUcqs6omYIgHEutv8gvaYwz%2F5rxAdLInym5lCopOvGr02DWlsXr%2FmMivaXY5zVrlG3mVXApcooDnN5UVPpxFv7bUvp5ez400Vq%2BJMFFXKAh4X%2FANlRVIda3%2BwpCQrbprQ%2FwqWyfUPi7kRk3PxXOQxLD%2B1PSNZhtOpxMTe7KPUAK5oRWC2cc%2FKSX7MDKB2ZkSh77h22SHW5LO%2BT1Ld9d%2BHleGiGgKxs%2BUd%2BmnwdJnA4vfheT9Te5ghaeZT9vhCWiCEATXZXI%2Fa2PHpTCr0MLOFDMrI61xa4dE6dUuL6%2FGZ%2B3potNm%2BVKLMJNEKngF1g07ZrppUToXVKw1MR1eCWm786lDT69Aze1DbNzxQ2m6d%2BM63zz5oqQNsGopLwvFdGMWHaLxZ2weP2OWv9VT5GSYFqn4JAZ8MSgnJiJ0eiSi4DkkOZjUR1uxnzw%2F3gJ226T6Fsv0llpMfVggiUfCLcyy%2B5J8bUrhaZLYAM4OA14ieox5Nmd1xNnfglnrCWnaudNz%2Fh0ImoeFst21gpP2Jpvih5QRYWUd4ql5sr1Kfa65PfeVQwCdewSaweJJ0K98pCszujAcNENHzOqlaYjCQ0urTBjqkAXcW3ypiYf0AIND%2BdQA3TFGRzxMxlQsVnzvI5Q5xQXX%2Fmm47onLSvvOW2wha6RdBvfvNjtRfkwuyQPP2BgtvTIrEMkJJ25HDzzyjZFg1xOepDHH3A0xc%2BKE%2BxgCdH%2FNfhNveolZs4C7%2FaiGUSs4Rl%2FO64wIEowK8Z6ddnBPqZveveb6bwq8ARISVOcmjdkKPVFRKU8DZAsqmc1uu5iyMPB6K7AOr&X-Amz-Signature=b57f2b937d837f53894f37663b8f926913447d641e71fc44793c39633013c6f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XFOOZYA%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T064541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDSkriJ6vVKLMcovb16UlSUW7%2F5vdEZcCinWWxfs11OkQIhAKN8b6%2B4R%2BatRoO3Ut%2FdmaLYwaN4uYbP6cgFiz79EiWLKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwVdeQN45wcoyFJnbAq3APv9FyQ4ivy4weA6ys%2B0GAgoZxgr7L1gIVD%2B7dyNbseWGdUUcqs6omYIgHEutv8gvaYwz%2F5rxAdLInym5lCopOvGr02DWlsXr%2FmMivaXY5zVrlG3mVXApcooDnN5UVPpxFv7bUvp5ez400Vq%2BJMFFXKAh4X%2FANlRVIda3%2BwpCQrbprQ%2FwqWyfUPi7kRk3PxXOQxLD%2B1PSNZhtOpxMTe7KPUAK5oRWC2cc%2FKSX7MDKB2ZkSh77h22SHW5LO%2BT1Ld9d%2BHleGiGgKxs%2BUd%2BmnwdJnA4vfheT9Te5ghaeZT9vhCWiCEATXZXI%2Fa2PHpTCr0MLOFDMrI61xa4dE6dUuL6%2FGZ%2B3potNm%2BVKLMJNEKngF1g07ZrppUToXVKw1MR1eCWm786lDT69Aze1DbNzxQ2m6d%2BM63zz5oqQNsGopLwvFdGMWHaLxZ2weP2OWv9VT5GSYFqn4JAZ8MSgnJiJ0eiSi4DkkOZjUR1uxnzw%2F3gJ226T6Fsv0llpMfVggiUfCLcyy%2B5J8bUrhaZLYAM4OA14ieox5Nmd1xNnfglnrCWnaudNz%2Fh0ImoeFst21gpP2Jpvih5QRYWUd4ql5sr1Kfa65PfeVQwCdewSaweJJ0K98pCszujAcNENHzOqlaYjCQ0urTBjqkAXcW3ypiYf0AIND%2BdQA3TFGRzxMxlQsVnzvI5Q5xQXX%2Fmm47onLSvvOW2wha6RdBvfvNjtRfkwuyQPP2BgtvTIrEMkJJ25HDzzyjZFg1xOepDHH3A0xc%2BKE%2BxgCdH%2FNfhNveolZs4C7%2FaiGUSs4Rl%2FO64wIEowK8Z6ddnBPqZveveb6bwq8ARISVOcmjdkKPVFRKU8DZAsqmc1uu5iyMPB6K7AOr&X-Amz-Signature=55d161538a82780d5efb9eb141862e0f058815f0cf4f84ab8e9f865774642606&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XFOOZYA%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T064541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDSkriJ6vVKLMcovb16UlSUW7%2F5vdEZcCinWWxfs11OkQIhAKN8b6%2B4R%2BatRoO3Ut%2FdmaLYwaN4uYbP6cgFiz79EiWLKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwVdeQN45wcoyFJnbAq3APv9FyQ4ivy4weA6ys%2B0GAgoZxgr7L1gIVD%2B7dyNbseWGdUUcqs6omYIgHEutv8gvaYwz%2F5rxAdLInym5lCopOvGr02DWlsXr%2FmMivaXY5zVrlG3mVXApcooDnN5UVPpxFv7bUvp5ez400Vq%2BJMFFXKAh4X%2FANlRVIda3%2BwpCQrbprQ%2FwqWyfUPi7kRk3PxXOQxLD%2B1PSNZhtOpxMTe7KPUAK5oRWC2cc%2FKSX7MDKB2ZkSh77h22SHW5LO%2BT1Ld9d%2BHleGiGgKxs%2BUd%2BmnwdJnA4vfheT9Te5ghaeZT9vhCWiCEATXZXI%2Fa2PHpTCr0MLOFDMrI61xa4dE6dUuL6%2FGZ%2B3potNm%2BVKLMJNEKngF1g07ZrppUToXVKw1MR1eCWm786lDT69Aze1DbNzxQ2m6d%2BM63zz5oqQNsGopLwvFdGMWHaLxZ2weP2OWv9VT5GSYFqn4JAZ8MSgnJiJ0eiSi4DkkOZjUR1uxnzw%2F3gJ226T6Fsv0llpMfVggiUfCLcyy%2B5J8bUrhaZLYAM4OA14ieox5Nmd1xNnfglnrCWnaudNz%2Fh0ImoeFst21gpP2Jpvih5QRYWUd4ql5sr1Kfa65PfeVQwCdewSaweJJ0K98pCszujAcNENHzOqlaYjCQ0urTBjqkAXcW3ypiYf0AIND%2BdQA3TFGRzxMxlQsVnzvI5Q5xQXX%2Fmm47onLSvvOW2wha6RdBvfvNjtRfkwuyQPP2BgtvTIrEMkJJ25HDzzyjZFg1xOepDHH3A0xc%2BKE%2BxgCdH%2FNfhNveolZs4C7%2FaiGUSs4Rl%2FO64wIEowK8Z6ddnBPqZveveb6bwq8ARISVOcmjdkKPVFRKU8DZAsqmc1uu5iyMPB6K7AOr&X-Amz-Signature=5b0fc90d76daf607c551bfd0d7711ed66a938e8c950c867b6ece0366f3f09dd0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XFOOZYA%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T064541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDSkriJ6vVKLMcovb16UlSUW7%2F5vdEZcCinWWxfs11OkQIhAKN8b6%2B4R%2BatRoO3Ut%2FdmaLYwaN4uYbP6cgFiz79EiWLKogECK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwVdeQN45wcoyFJnbAq3APv9FyQ4ivy4weA6ys%2B0GAgoZxgr7L1gIVD%2B7dyNbseWGdUUcqs6omYIgHEutv8gvaYwz%2F5rxAdLInym5lCopOvGr02DWlsXr%2FmMivaXY5zVrlG3mVXApcooDnN5UVPpxFv7bUvp5ez400Vq%2BJMFFXKAh4X%2FANlRVIda3%2BwpCQrbprQ%2FwqWyfUPi7kRk3PxXOQxLD%2B1PSNZhtOpxMTe7KPUAK5oRWC2cc%2FKSX7MDKB2ZkSh77h22SHW5LO%2BT1Ld9d%2BHleGiGgKxs%2BUd%2BmnwdJnA4vfheT9Te5ghaeZT9vhCWiCEATXZXI%2Fa2PHpTCr0MLOFDMrI61xa4dE6dUuL6%2FGZ%2B3potNm%2BVKLMJNEKngF1g07ZrppUToXVKw1MR1eCWm786lDT69Aze1DbNzxQ2m6d%2BM63zz5oqQNsGopLwvFdGMWHaLxZ2weP2OWv9VT5GSYFqn4JAZ8MSgnJiJ0eiSi4DkkOZjUR1uxnzw%2F3gJ226T6Fsv0llpMfVggiUfCLcyy%2B5J8bUrhaZLYAM4OA14ieox5Nmd1xNnfglnrCWnaudNz%2Fh0ImoeFst21gpP2Jpvih5QRYWUd4ql5sr1Kfa65PfeVQwCdewSaweJJ0K98pCszujAcNENHzOqlaYjCQ0urTBjqkAXcW3ypiYf0AIND%2BdQA3TFGRzxMxlQsVnzvI5Q5xQXX%2Fmm47onLSvvOW2wha6RdBvfvNjtRfkwuyQPP2BgtvTIrEMkJJ25HDzzyjZFg1xOepDHH3A0xc%2BKE%2BxgCdH%2FNfhNveolZs4C7%2FaiGUSs4Rl%2FO64wIEowK8Z6ddnBPqZveveb6bwq8ARISVOcmjdkKPVFRKU8DZAsqmc1uu5iyMPB6K7AOr&X-Amz-Signature=73d8980b265a9786bf40e33bdc1d3e6f13c00d97e5ec138d481c74e5e6442799&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
