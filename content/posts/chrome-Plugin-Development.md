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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662O3KX7YC%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T154431Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHLGSeud%2FbNskczU5jOUCc4mm5uqKyKMvLuqz5pXlWylAiEA%2FjDcwsBG558RZBSAAK%2BeoxxoIGrDSTWyb5mdfuRyE3cqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH%2BUVj3rmYhV764wlircA7M4DyBw0FgeTQvBEmQKylSNrLXycX1p5ySseulPtPCHijK2FUfFUkZfxdkfGCFQVFGa3J0dCLbzSCuSQKvcf1hMlaJT2QnDXRSocLqixIG7dTO%2BYyIbAmuOcj0nklF2rejCloEHcnxLVIV3jXbkrBbnmDlcCrkxr%2FgzLm0WQ1b0vhSJbmBkBv%2FHZkJqjQVYgKonnZTgRNnOArdaO8s3UhpAco59MPP5Zps2U%2Bj8gm5fGskteoBeJiFjaaujWgV61%2FS7niMX44IqR6rkJjI1PnV%2BuES7i1oOpLGxVFjfjcdZ3f%2B62a6Wrciiy9yq7bHnfJpZDF84DSkN4U7yDJXU4S4d58eEDDNbdLmVy9fsv4Vhl54R6YW4YgQPFZJEMeJsQxLauYBxt%2BWDj8%2FTFXs%2FzQQWjmqzZQisrw69iPOqd9ijQePo%2FIzdThv9Q1727Vf%2FqciiPO2g2hHSeMJwSpED6kbxTS99%2BHSh7gKb22TAvgYDTSNzmQ7sFutgG8nqD523YseUSec3NZ9x%2FUJfpVP3DBqF1M1ujJipc1TDpCykaXCUesMhkm7iRv9Zri2S4XQNolH8H9VFP7p8z3VohtCj%2Fw7RKZXHrEbuJ1qvYfI5VhMFg0COHuGmjNMwD8vTMOKEz9UGOqUBAAZbhyiQFJwP0fzObm66zDTb%2FQj4S%2FOW6gMl1sOVYIzhth9lhQoGuC4VmqBn1qfLUMBO%2BoDxd1FNfh0bFcZsZlSDyFjO2rrOvGk5I5ptcV8yjWZH4iUg%2Bq%2BbVXfZMx3cFmHcZUNSVYED8eS9fC9E5Aa7tHcZ70ATY6eJU19CIJyff4JXiH3y72i%2Fg04g9dJC83GNZBzbuvbfvXFxq9g4Wp1bzZLT&X-Amz-Signature=ecb51702ff8a7a3f769146b6f3ded6db1f2accbbb9f4fea8362969abf0b51325&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662O3KX7YC%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T154431Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHLGSeud%2FbNskczU5jOUCc4mm5uqKyKMvLuqz5pXlWylAiEA%2FjDcwsBG558RZBSAAK%2BeoxxoIGrDSTWyb5mdfuRyE3cqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH%2BUVj3rmYhV764wlircA7M4DyBw0FgeTQvBEmQKylSNrLXycX1p5ySseulPtPCHijK2FUfFUkZfxdkfGCFQVFGa3J0dCLbzSCuSQKvcf1hMlaJT2QnDXRSocLqixIG7dTO%2BYyIbAmuOcj0nklF2rejCloEHcnxLVIV3jXbkrBbnmDlcCrkxr%2FgzLm0WQ1b0vhSJbmBkBv%2FHZkJqjQVYgKonnZTgRNnOArdaO8s3UhpAco59MPP5Zps2U%2Bj8gm5fGskteoBeJiFjaaujWgV61%2FS7niMX44IqR6rkJjI1PnV%2BuES7i1oOpLGxVFjfjcdZ3f%2B62a6Wrciiy9yq7bHnfJpZDF84DSkN4U7yDJXU4S4d58eEDDNbdLmVy9fsv4Vhl54R6YW4YgQPFZJEMeJsQxLauYBxt%2BWDj8%2FTFXs%2FzQQWjmqzZQisrw69iPOqd9ijQePo%2FIzdThv9Q1727Vf%2FqciiPO2g2hHSeMJwSpED6kbxTS99%2BHSh7gKb22TAvgYDTSNzmQ7sFutgG8nqD523YseUSec3NZ9x%2FUJfpVP3DBqF1M1ujJipc1TDpCykaXCUesMhkm7iRv9Zri2S4XQNolH8H9VFP7p8z3VohtCj%2Fw7RKZXHrEbuJ1qvYfI5VhMFg0COHuGmjNMwD8vTMOKEz9UGOqUBAAZbhyiQFJwP0fzObm66zDTb%2FQj4S%2FOW6gMl1sOVYIzhth9lhQoGuC4VmqBn1qfLUMBO%2BoDxd1FNfh0bFcZsZlSDyFjO2rrOvGk5I5ptcV8yjWZH4iUg%2Bq%2BbVXfZMx3cFmHcZUNSVYED8eS9fC9E5Aa7tHcZ70ATY6eJU19CIJyff4JXiH3y72i%2Fg04g9dJC83GNZBzbuvbfvXFxq9g4Wp1bzZLT&X-Amz-Signature=2abff4e629d422319c792f00059b949939e56328da4fa9683637d6febb2e2ea0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662O3KX7YC%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T154431Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHLGSeud%2FbNskczU5jOUCc4mm5uqKyKMvLuqz5pXlWylAiEA%2FjDcwsBG558RZBSAAK%2BeoxxoIGrDSTWyb5mdfuRyE3cqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH%2BUVj3rmYhV764wlircA7M4DyBw0FgeTQvBEmQKylSNrLXycX1p5ySseulPtPCHijK2FUfFUkZfxdkfGCFQVFGa3J0dCLbzSCuSQKvcf1hMlaJT2QnDXRSocLqixIG7dTO%2BYyIbAmuOcj0nklF2rejCloEHcnxLVIV3jXbkrBbnmDlcCrkxr%2FgzLm0WQ1b0vhSJbmBkBv%2FHZkJqjQVYgKonnZTgRNnOArdaO8s3UhpAco59MPP5Zps2U%2Bj8gm5fGskteoBeJiFjaaujWgV61%2FS7niMX44IqR6rkJjI1PnV%2BuES7i1oOpLGxVFjfjcdZ3f%2B62a6Wrciiy9yq7bHnfJpZDF84DSkN4U7yDJXU4S4d58eEDDNbdLmVy9fsv4Vhl54R6YW4YgQPFZJEMeJsQxLauYBxt%2BWDj8%2FTFXs%2FzQQWjmqzZQisrw69iPOqd9ijQePo%2FIzdThv9Q1727Vf%2FqciiPO2g2hHSeMJwSpED6kbxTS99%2BHSh7gKb22TAvgYDTSNzmQ7sFutgG8nqD523YseUSec3NZ9x%2FUJfpVP3DBqF1M1ujJipc1TDpCykaXCUesMhkm7iRv9Zri2S4XQNolH8H9VFP7p8z3VohtCj%2Fw7RKZXHrEbuJ1qvYfI5VhMFg0COHuGmjNMwD8vTMOKEz9UGOqUBAAZbhyiQFJwP0fzObm66zDTb%2FQj4S%2FOW6gMl1sOVYIzhth9lhQoGuC4VmqBn1qfLUMBO%2BoDxd1FNfh0bFcZsZlSDyFjO2rrOvGk5I5ptcV8yjWZH4iUg%2Bq%2BbVXfZMx3cFmHcZUNSVYED8eS9fC9E5Aa7tHcZ70ATY6eJU19CIJyff4JXiH3y72i%2Fg04g9dJC83GNZBzbuvbfvXFxq9g4Wp1bzZLT&X-Amz-Signature=dfee00dc2e9e14e1664a38f888764ed1b2ae7cb655a9042006830e8fa781c059&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662O3KX7YC%2F20260923%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260923T154431Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIHLGSeud%2FbNskczU5jOUCc4mm5uqKyKMvLuqz5pXlWylAiEA%2FjDcwsBG558RZBSAAK%2BeoxxoIGrDSTWyb5mdfuRyE3cqiAQIvf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDH%2BUVj3rmYhV764wlircA7M4DyBw0FgeTQvBEmQKylSNrLXycX1p5ySseulPtPCHijK2FUfFUkZfxdkfGCFQVFGa3J0dCLbzSCuSQKvcf1hMlaJT2QnDXRSocLqixIG7dTO%2BYyIbAmuOcj0nklF2rejCloEHcnxLVIV3jXbkrBbnmDlcCrkxr%2FgzLm0WQ1b0vhSJbmBkBv%2FHZkJqjQVYgKonnZTgRNnOArdaO8s3UhpAco59MPP5Zps2U%2Bj8gm5fGskteoBeJiFjaaujWgV61%2FS7niMX44IqR6rkJjI1PnV%2BuES7i1oOpLGxVFjfjcdZ3f%2B62a6Wrciiy9yq7bHnfJpZDF84DSkN4U7yDJXU4S4d58eEDDNbdLmVy9fsv4Vhl54R6YW4YgQPFZJEMeJsQxLauYBxt%2BWDj8%2FTFXs%2FzQQWjmqzZQisrw69iPOqd9ijQePo%2FIzdThv9Q1727Vf%2FqciiPO2g2hHSeMJwSpED6kbxTS99%2BHSh7gKb22TAvgYDTSNzmQ7sFutgG8nqD523YseUSec3NZ9x%2FUJfpVP3DBqF1M1ujJipc1TDpCykaXCUesMhkm7iRv9Zri2S4XQNolH8H9VFP7p8z3VohtCj%2Fw7RKZXHrEbuJ1qvYfI5VhMFg0COHuGmjNMwD8vTMOKEz9UGOqUBAAZbhyiQFJwP0fzObm66zDTb%2FQj4S%2FOW6gMl1sOVYIzhth9lhQoGuC4VmqBn1qfLUMBO%2BoDxd1FNfh0bFcZsZlSDyFjO2rrOvGk5I5ptcV8yjWZH4iUg%2Bq%2BbVXfZMx3cFmHcZUNSVYED8eS9fC9E5Aa7tHcZ70ATY6eJU19CIJyff4JXiH3y72i%2Fg04g9dJC83GNZBzbuvbfvXFxq9g4Wp1bzZLT&X-Amz-Signature=158d80f81eaec675d62f38b0879e620ee16c584915354d9e7f1180fa0acf1007&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
