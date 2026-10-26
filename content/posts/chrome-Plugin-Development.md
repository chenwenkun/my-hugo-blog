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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667DICIBTI%2F20261026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261026T114934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJHMEUCIB9ADZ%2F5ytUFvNZmJPE1664WqNZfxCLh8nRP3YMSHJNlAiEAm7WhTc%2BmpqCrjrW8BiVSHUOxKTLOz2rHi9Pj1jhHC4wqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCcR869b0NDYAXDoTCrcA20temHarMnaOCv5BOuGwut9V0ndWcF146LUi%2FC9Yo7EMG49CU4dQuoxwUStcRKd9AbDtLrGgv43q7myG3UE%2BheTu1CcytNiEgyOMSe6tYEPjc66fpbu5rmOAayETq9ETP14vi2niqy10wr12kJd4KmcqfPLtR0kWixlWFRVBpMJoSf9PYf67zZw7%2FcXsD8TBVhmjwn6O%2B%2BNnVp8gcfkIB5ftkFV%2FapQhk%2BAYR48kHnWtJX1%2FYvMjiudhjo0PQADK6EUd8ro9RbXsChozwmnfSfclA1sO0gaozjv1iTzsoTDHrynVbnRyAF1IM%2FWJUGimfXX8BES7Vb%2FKIhszG250K3jcekUn3RyjB%2BI8DVGhdQbVMNmyXnb8SZrvyu%2Bm6X0HF8TP4YQCpAhUFi44tB2ekyU54ZjTcPtaGpPG2PLN0cyyY%2FWgz2wUO39g2cq2%2Fek%2BXaak0PlrbbCjktE65MQKglPs9cBFhTEKG8oxAIi07Q8I3KvCRB3SGfatauq8U3kHqkh0ZjnKjYYwlDMR7pnYomRSl%2FheDW8D6PefMXNm5hY2wsSlaqrWEWAzMrqajWyrpIo6QCcZ9s5Qb8qhgwuDccLsJQY%2B2rAqfHcfYz9CBUpCyFV%2FPDmwM3%2FxUb5MKbm%2FNYGOqUB5BjLh%2B%2BbZPtLd4th0wSA6PyOkldK4z%2FgUGl9KJTtI6pDqF5FQ28zyo%2Bk4p6HA5MhyDxsQbnwLjmZjyFvXLIohc5cCVZgE%2FYWs3BovXOzDdOTQrlk51bqQHeyLsA1POU8KiLkTSz1klOGXgO2GMMY0K%2FPVTuQ8%2Bt7W%2FrD0nlHa9bFF%2FL3QynAMUENk42RpmsPrxOEBChp8ftu1rt4hD2ZvjI42Wku&X-Amz-Signature=8ffbe3d7f3a2f019c75a1b75737c87ba76d4ccd13a9fdbad4d79d907b532c881&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667DICIBTI%2F20261026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261026T114934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJHMEUCIB9ADZ%2F5ytUFvNZmJPE1664WqNZfxCLh8nRP3YMSHJNlAiEAm7WhTc%2BmpqCrjrW8BiVSHUOxKTLOz2rHi9Pj1jhHC4wqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCcR869b0NDYAXDoTCrcA20temHarMnaOCv5BOuGwut9V0ndWcF146LUi%2FC9Yo7EMG49CU4dQuoxwUStcRKd9AbDtLrGgv43q7myG3UE%2BheTu1CcytNiEgyOMSe6tYEPjc66fpbu5rmOAayETq9ETP14vi2niqy10wr12kJd4KmcqfPLtR0kWixlWFRVBpMJoSf9PYf67zZw7%2FcXsD8TBVhmjwn6O%2B%2BNnVp8gcfkIB5ftkFV%2FapQhk%2BAYR48kHnWtJX1%2FYvMjiudhjo0PQADK6EUd8ro9RbXsChozwmnfSfclA1sO0gaozjv1iTzsoTDHrynVbnRyAF1IM%2FWJUGimfXX8BES7Vb%2FKIhszG250K3jcekUn3RyjB%2BI8DVGhdQbVMNmyXnb8SZrvyu%2Bm6X0HF8TP4YQCpAhUFi44tB2ekyU54ZjTcPtaGpPG2PLN0cyyY%2FWgz2wUO39g2cq2%2Fek%2BXaak0PlrbbCjktE65MQKglPs9cBFhTEKG8oxAIi07Q8I3KvCRB3SGfatauq8U3kHqkh0ZjnKjYYwlDMR7pnYomRSl%2FheDW8D6PefMXNm5hY2wsSlaqrWEWAzMrqajWyrpIo6QCcZ9s5Qb8qhgwuDccLsJQY%2B2rAqfHcfYz9CBUpCyFV%2FPDmwM3%2FxUb5MKbm%2FNYGOqUB5BjLh%2B%2BbZPtLd4th0wSA6PyOkldK4z%2FgUGl9KJTtI6pDqF5FQ28zyo%2Bk4p6HA5MhyDxsQbnwLjmZjyFvXLIohc5cCVZgE%2FYWs3BovXOzDdOTQrlk51bqQHeyLsA1POU8KiLkTSz1klOGXgO2GMMY0K%2FPVTuQ8%2Bt7W%2FrD0nlHa9bFF%2FL3QynAMUENk42RpmsPrxOEBChp8ftu1rt4hD2ZvjI42Wku&X-Amz-Signature=fc39f08e5a7d562ba273307de20c4235d4eb85568845c16ea94ce47c76c15084&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667DICIBTI%2F20261026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261026T114934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJHMEUCIB9ADZ%2F5ytUFvNZmJPE1664WqNZfxCLh8nRP3YMSHJNlAiEAm7WhTc%2BmpqCrjrW8BiVSHUOxKTLOz2rHi9Pj1jhHC4wqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCcR869b0NDYAXDoTCrcA20temHarMnaOCv5BOuGwut9V0ndWcF146LUi%2FC9Yo7EMG49CU4dQuoxwUStcRKd9AbDtLrGgv43q7myG3UE%2BheTu1CcytNiEgyOMSe6tYEPjc66fpbu5rmOAayETq9ETP14vi2niqy10wr12kJd4KmcqfPLtR0kWixlWFRVBpMJoSf9PYf67zZw7%2FcXsD8TBVhmjwn6O%2B%2BNnVp8gcfkIB5ftkFV%2FapQhk%2BAYR48kHnWtJX1%2FYvMjiudhjo0PQADK6EUd8ro9RbXsChozwmnfSfclA1sO0gaozjv1iTzsoTDHrynVbnRyAF1IM%2FWJUGimfXX8BES7Vb%2FKIhszG250K3jcekUn3RyjB%2BI8DVGhdQbVMNmyXnb8SZrvyu%2Bm6X0HF8TP4YQCpAhUFi44tB2ekyU54ZjTcPtaGpPG2PLN0cyyY%2FWgz2wUO39g2cq2%2Fek%2BXaak0PlrbbCjktE65MQKglPs9cBFhTEKG8oxAIi07Q8I3KvCRB3SGfatauq8U3kHqkh0ZjnKjYYwlDMR7pnYomRSl%2FheDW8D6PefMXNm5hY2wsSlaqrWEWAzMrqajWyrpIo6QCcZ9s5Qb8qhgwuDccLsJQY%2B2rAqfHcfYz9CBUpCyFV%2FPDmwM3%2FxUb5MKbm%2FNYGOqUB5BjLh%2B%2BbZPtLd4th0wSA6PyOkldK4z%2FgUGl9KJTtI6pDqF5FQ28zyo%2Bk4p6HA5MhyDxsQbnwLjmZjyFvXLIohc5cCVZgE%2FYWs3BovXOzDdOTQrlk51bqQHeyLsA1POU8KiLkTSz1klOGXgO2GMMY0K%2FPVTuQ8%2Bt7W%2FrD0nlHa9bFF%2FL3QynAMUENk42RpmsPrxOEBChp8ftu1rt4hD2ZvjI42Wku&X-Amz-Signature=b836e995ac1a91f1a7cabd1c7a236cb78c41fe790507611076515050e060ef96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667DICIBTI%2F20261026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261026T114934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAsaCXVzLXdlc3QtMiJHMEUCIB9ADZ%2F5ytUFvNZmJPE1664WqNZfxCLh8nRP3YMSHJNlAiEAm7WhTc%2BmpqCrjrW8BiVSHUOxKTLOz2rHi9Pj1jhHC4wqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCcR869b0NDYAXDoTCrcA20temHarMnaOCv5BOuGwut9V0ndWcF146LUi%2FC9Yo7EMG49CU4dQuoxwUStcRKd9AbDtLrGgv43q7myG3UE%2BheTu1CcytNiEgyOMSe6tYEPjc66fpbu5rmOAayETq9ETP14vi2niqy10wr12kJd4KmcqfPLtR0kWixlWFRVBpMJoSf9PYf67zZw7%2FcXsD8TBVhmjwn6O%2B%2BNnVp8gcfkIB5ftkFV%2FapQhk%2BAYR48kHnWtJX1%2FYvMjiudhjo0PQADK6EUd8ro9RbXsChozwmnfSfclA1sO0gaozjv1iTzsoTDHrynVbnRyAF1IM%2FWJUGimfXX8BES7Vb%2FKIhszG250K3jcekUn3RyjB%2BI8DVGhdQbVMNmyXnb8SZrvyu%2Bm6X0HF8TP4YQCpAhUFi44tB2ekyU54ZjTcPtaGpPG2PLN0cyyY%2FWgz2wUO39g2cq2%2Fek%2BXaak0PlrbbCjktE65MQKglPs9cBFhTEKG8oxAIi07Q8I3KvCRB3SGfatauq8U3kHqkh0ZjnKjYYwlDMR7pnYomRSl%2FheDW8D6PefMXNm5hY2wsSlaqrWEWAzMrqajWyrpIo6QCcZ9s5Qb8qhgwuDccLsJQY%2B2rAqfHcfYz9CBUpCyFV%2FPDmwM3%2FxUb5MKbm%2FNYGOqUB5BjLh%2B%2BbZPtLd4th0wSA6PyOkldK4z%2FgUGl9KJTtI6pDqF5FQ28zyo%2Bk4p6HA5MhyDxsQbnwLjmZjyFvXLIohc5cCVZgE%2FYWs3BovXOzDdOTQrlk51bqQHeyLsA1POU8KiLkTSz1klOGXgO2GMMY0K%2FPVTuQ8%2Bt7W%2FrD0nlHa9bFF%2FL3QynAMUENk42RpmsPrxOEBChp8ftu1rt4hD2ZvjI42Wku&X-Amz-Signature=7df8ae73abbe90eddd1bd4ca155dd92165201860774419ef4e9ac19c05fb74a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
