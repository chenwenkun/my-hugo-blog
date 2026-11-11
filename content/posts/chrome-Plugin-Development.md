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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XWU6NUAS%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T034118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICV8TZZTa7P40EyJNTBRTE0eD%2F%2FvrqJQ8KOUvHuCoLUSAiEA6VTxe8Ve1mnjGFemMp%2FcdPFF72RbN22oBcZUr1mQWocq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDEu7jGx8onaMJ%2Fgb5SrcAzpBkR2By9Q2sWAMjA6Mri4I%2BIeIvktrezoNFQQ3gXM%2B9yw%2BaJONZevRhm%2BrSOxLXW3LxhzFmjEYNH1VM%2Fcob1d6xGzg4mLBCKQOyMDFvODb17CTm9O6vSrj%2FD%2Bujq2v7yQTEWsFoQ%2BFpafsG3izt%2FEtp1qpgggIWUtOx5r2EEfnpkJDJp%2FeuY%2BjiXoRg8FA0FmJMTlpVd9m1GCEB8zPRykNQ2eAzbeCjJQ4e%2BhL1G%2Bq15x6IPVWLGvEuprg9FupgMn1l%2BnTFxpZbPfScedtY1Zd1jMz1Ey0iK5Ae6%2FBZsQkWcj82vMY6dJA9C7XhtJquowmIegx0wxqIxu3lMomum4umdcYevWtXFY2W1OWRwYGZaFk3m36OF5Q%2FDDY%2BOK%2Bp2bHBTtEC1Vh1yRF%2FmyMi4xZFGNr3oohzghVqAYR%2FU6TZiaBM6%2FtQrw3NDvqjuqfoiJag252uBP3odsuaPAaOq6oMOSkX1GOyg6Cvra7Bpva7sHzcPiCuzi7V%2BplAwc3btBEvFN8ibyQ1UuijdIIpOObnvpEDs8C1imjr2ACXhCnd%2BgpFuoiiiGWM2VQrSDO8jMF%2BJIJ2ULmm3vXEV%2B60rg%2BifSV2CQVA3INiQM2ZL1BLo4fhP5rm8RQXZyFMIiZz9cGOqUB%2BMacZ04Z%2FvTCJaV9cfySRtX3KjtCpb9DR%2B2K63HHSCUiOdp5kMSlXjAPkIZw8qNCvFktiOJk9UQTKCrw%2Bjc9DwFF5qM226InXNprdjA6OY8sZItMOfQyN33qYWh8vWYpITZn9v8aULygAJ6QlgvMnXJ%2FhgjVqHp1Vl355CFSOgOM9C1fZJpf7Z%2FT3dHIYqHxBtkwJ3flukRQTbOdbWM8gE%2BcOwQp&X-Amz-Signature=394b492183353142d26d5d3654a8f4484d0c0e33c9b6969402b9b82c0029ac40&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XWU6NUAS%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T034118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICV8TZZTa7P40EyJNTBRTE0eD%2F%2FvrqJQ8KOUvHuCoLUSAiEA6VTxe8Ve1mnjGFemMp%2FcdPFF72RbN22oBcZUr1mQWocq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDEu7jGx8onaMJ%2Fgb5SrcAzpBkR2By9Q2sWAMjA6Mri4I%2BIeIvktrezoNFQQ3gXM%2B9yw%2BaJONZevRhm%2BrSOxLXW3LxhzFmjEYNH1VM%2Fcob1d6xGzg4mLBCKQOyMDFvODb17CTm9O6vSrj%2FD%2Bujq2v7yQTEWsFoQ%2BFpafsG3izt%2FEtp1qpgggIWUtOx5r2EEfnpkJDJp%2FeuY%2BjiXoRg8FA0FmJMTlpVd9m1GCEB8zPRykNQ2eAzbeCjJQ4e%2BhL1G%2Bq15x6IPVWLGvEuprg9FupgMn1l%2BnTFxpZbPfScedtY1Zd1jMz1Ey0iK5Ae6%2FBZsQkWcj82vMY6dJA9C7XhtJquowmIegx0wxqIxu3lMomum4umdcYevWtXFY2W1OWRwYGZaFk3m36OF5Q%2FDDY%2BOK%2Bp2bHBTtEC1Vh1yRF%2FmyMi4xZFGNr3oohzghVqAYR%2FU6TZiaBM6%2FtQrw3NDvqjuqfoiJag252uBP3odsuaPAaOq6oMOSkX1GOyg6Cvra7Bpva7sHzcPiCuzi7V%2BplAwc3btBEvFN8ibyQ1UuijdIIpOObnvpEDs8C1imjr2ACXhCnd%2BgpFuoiiiGWM2VQrSDO8jMF%2BJIJ2ULmm3vXEV%2B60rg%2BifSV2CQVA3INiQM2ZL1BLo4fhP5rm8RQXZyFMIiZz9cGOqUB%2BMacZ04Z%2FvTCJaV9cfySRtX3KjtCpb9DR%2B2K63HHSCUiOdp5kMSlXjAPkIZw8qNCvFktiOJk9UQTKCrw%2Bjc9DwFF5qM226InXNprdjA6OY8sZItMOfQyN33qYWh8vWYpITZn9v8aULygAJ6QlgvMnXJ%2FhgjVqHp1Vl355CFSOgOM9C1fZJpf7Z%2FT3dHIYqHxBtkwJ3flukRQTbOdbWM8gE%2BcOwQp&X-Amz-Signature=7f63ba20f86ce73031ade1de3045fef6705a48c2ffe47ed3be179d3c83f3e910&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XWU6NUAS%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T034118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICV8TZZTa7P40EyJNTBRTE0eD%2F%2FvrqJQ8KOUvHuCoLUSAiEA6VTxe8Ve1mnjGFemMp%2FcdPFF72RbN22oBcZUr1mQWocq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDEu7jGx8onaMJ%2Fgb5SrcAzpBkR2By9Q2sWAMjA6Mri4I%2BIeIvktrezoNFQQ3gXM%2B9yw%2BaJONZevRhm%2BrSOxLXW3LxhzFmjEYNH1VM%2Fcob1d6xGzg4mLBCKQOyMDFvODb17CTm9O6vSrj%2FD%2Bujq2v7yQTEWsFoQ%2BFpafsG3izt%2FEtp1qpgggIWUtOx5r2EEfnpkJDJp%2FeuY%2BjiXoRg8FA0FmJMTlpVd9m1GCEB8zPRykNQ2eAzbeCjJQ4e%2BhL1G%2Bq15x6IPVWLGvEuprg9FupgMn1l%2BnTFxpZbPfScedtY1Zd1jMz1Ey0iK5Ae6%2FBZsQkWcj82vMY6dJA9C7XhtJquowmIegx0wxqIxu3lMomum4umdcYevWtXFY2W1OWRwYGZaFk3m36OF5Q%2FDDY%2BOK%2Bp2bHBTtEC1Vh1yRF%2FmyMi4xZFGNr3oohzghVqAYR%2FU6TZiaBM6%2FtQrw3NDvqjuqfoiJag252uBP3odsuaPAaOq6oMOSkX1GOyg6Cvra7Bpva7sHzcPiCuzi7V%2BplAwc3btBEvFN8ibyQ1UuijdIIpOObnvpEDs8C1imjr2ACXhCnd%2BgpFuoiiiGWM2VQrSDO8jMF%2BJIJ2ULmm3vXEV%2B60rg%2BifSV2CQVA3INiQM2ZL1BLo4fhP5rm8RQXZyFMIiZz9cGOqUB%2BMacZ04Z%2FvTCJaV9cfySRtX3KjtCpb9DR%2B2K63HHSCUiOdp5kMSlXjAPkIZw8qNCvFktiOJk9UQTKCrw%2Bjc9DwFF5qM226InXNprdjA6OY8sZItMOfQyN33qYWh8vWYpITZn9v8aULygAJ6QlgvMnXJ%2FhgjVqHp1Vl355CFSOgOM9C1fZJpf7Z%2FT3dHIYqHxBtkwJ3flukRQTbOdbWM8gE%2BcOwQp&X-Amz-Signature=a7fbcb4c1834e7875b44dc168d34843e2e67b174229e4844f7d84c321c3e6a1e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XWU6NUAS%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T034118Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICV8TZZTa7P40EyJNTBRTE0eD%2F%2FvrqJQ8KOUvHuCoLUSAiEA6VTxe8Ve1mnjGFemMp%2FcdPFF72RbN22oBcZUr1mQWocq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDEu7jGx8onaMJ%2Fgb5SrcAzpBkR2By9Q2sWAMjA6Mri4I%2BIeIvktrezoNFQQ3gXM%2B9yw%2BaJONZevRhm%2BrSOxLXW3LxhzFmjEYNH1VM%2Fcob1d6xGzg4mLBCKQOyMDFvODb17CTm9O6vSrj%2FD%2Bujq2v7yQTEWsFoQ%2BFpafsG3izt%2FEtp1qpgggIWUtOx5r2EEfnpkJDJp%2FeuY%2BjiXoRg8FA0FmJMTlpVd9m1GCEB8zPRykNQ2eAzbeCjJQ4e%2BhL1G%2Bq15x6IPVWLGvEuprg9FupgMn1l%2BnTFxpZbPfScedtY1Zd1jMz1Ey0iK5Ae6%2FBZsQkWcj82vMY6dJA9C7XhtJquowmIegx0wxqIxu3lMomum4umdcYevWtXFY2W1OWRwYGZaFk3m36OF5Q%2FDDY%2BOK%2Bp2bHBTtEC1Vh1yRF%2FmyMi4xZFGNr3oohzghVqAYR%2FU6TZiaBM6%2FtQrw3NDvqjuqfoiJag252uBP3odsuaPAaOq6oMOSkX1GOyg6Cvra7Bpva7sHzcPiCuzi7V%2BplAwc3btBEvFN8ibyQ1UuijdIIpOObnvpEDs8C1imjr2ACXhCnd%2BgpFuoiiiGWM2VQrSDO8jMF%2BJIJ2ULmm3vXEV%2B60rg%2BifSV2CQVA3INiQM2ZL1BLo4fhP5rm8RQXZyFMIiZz9cGOqUB%2BMacZ04Z%2FvTCJaV9cfySRtX3KjtCpb9DR%2B2K63HHSCUiOdp5kMSlXjAPkIZw8qNCvFktiOJk9UQTKCrw%2Bjc9DwFF5qM226InXNprdjA6OY8sZItMOfQyN33qYWh8vWYpITZn9v8aULygAJ6QlgvMnXJ%2FhgjVqHp1Vl355CFSOgOM9C1fZJpf7Z%2FT3dHIYqHxBtkwJ3flukRQTbOdbWM8gE%2BcOwQp&X-Amz-Signature=de9143445ce24d3da17acdab59aa449c84ed964d1bddcf3c204cedec16a6d300&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
