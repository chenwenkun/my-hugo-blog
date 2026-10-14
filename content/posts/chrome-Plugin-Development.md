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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665RT772XJ%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T160757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGVw%2BYcnvdmJB8n4eAdcVAMcLwiHy0sl7CauUat%2BnLRvAiEAi%2FWcWuL5GFPWRiciACdIkbcSs11Kw3UfFQXeVy3XbWoqiAQItf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHMrAQo353Obc0keECrcA%2FeiuT5qZUrG8FLkMj52iuacIl2BEvV8JoKs0nc9raqLajDEhiOllXGqryh3e%2BhCFy9zanONsWux6987wJVWtf%2FRNnK4YjGJpDAZQRJ8iFSBn7zELvlpcD2EbJblR%2BILrSBoIbd8D6M0M7g2NxmsigRdbtm2nmFDg%2FQed%2F6Z96fIif4Jvz%2BMN5w7%2FQCXSJIDSCirs7pUiYMe5i2DTGSrs%2FqKB0q3MUhHT8%2Bk4kJoCaGG0kggK9z7p6tqv2gqtuy4OUr%2BWXam%2B4leFUV1ub%2FB7tz%2FQharqCRUY%2B5gmPybO%2FCJLzV42UzJFp%2BFoDdqcgortd9zI3AMOMiYi4mjpJN%2Fd5sSiKzwEqCvSBbhkhjclvrN0g3q7Ut5ysRpTdNNEczY9kJPSvuIY4WL4Fk2cTYl%2F7W2zuHqRjheFm9cps8W8T3z3ZBYHHtXJO9sstFofifUxpQwWxfInlk3xi03fYfBGZDPyOCY2DxATQdhZr58XU9bBenWPNvVCK7MoEFvp32raPJ9%2Bi7VHE6%2F4qSLUtSkmjdnFp92%2FpsdlCJQSjjK8eSStHtuYpJAHh3fts8rEZlV06Mjv46moAwDxf46n%2BiwNJGn4BBpuNl2auiUQhPyguemPWGGgjqbBVqmOKOWMOLqvdYGOqUBdjpES%2Fn6QsIP%2Fdfd9GA4%2BHCE9f%2F%2FceFtXQ%2BUBbvqW6m9ZnK1HOvLg59wcq1d08yxUUostT2LQOrm1ztxpRs0OxsVX84cy6ZjzdbJh568K2HzBjgqBYrzC76bDV8OaH1aAq84jSC43G0cInTCQjP3R22WMmPqVhyDeNeeXJeAy7UG8o1FvAFOA3cN1%2F9cMhhSBasYhIFJZkOBgMjLlRX50pw8PsmF&X-Amz-Signature=8a2e952b62a9751de965d6669160a36ac2c71d915c43820e89fc2e929eec69fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665RT772XJ%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T160757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGVw%2BYcnvdmJB8n4eAdcVAMcLwiHy0sl7CauUat%2BnLRvAiEAi%2FWcWuL5GFPWRiciACdIkbcSs11Kw3UfFQXeVy3XbWoqiAQItf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHMrAQo353Obc0keECrcA%2FeiuT5qZUrG8FLkMj52iuacIl2BEvV8JoKs0nc9raqLajDEhiOllXGqryh3e%2BhCFy9zanONsWux6987wJVWtf%2FRNnK4YjGJpDAZQRJ8iFSBn7zELvlpcD2EbJblR%2BILrSBoIbd8D6M0M7g2NxmsigRdbtm2nmFDg%2FQed%2F6Z96fIif4Jvz%2BMN5w7%2FQCXSJIDSCirs7pUiYMe5i2DTGSrs%2FqKB0q3MUhHT8%2Bk4kJoCaGG0kggK9z7p6tqv2gqtuy4OUr%2BWXam%2B4leFUV1ub%2FB7tz%2FQharqCRUY%2B5gmPybO%2FCJLzV42UzJFp%2BFoDdqcgortd9zI3AMOMiYi4mjpJN%2Fd5sSiKzwEqCvSBbhkhjclvrN0g3q7Ut5ysRpTdNNEczY9kJPSvuIY4WL4Fk2cTYl%2F7W2zuHqRjheFm9cps8W8T3z3ZBYHHtXJO9sstFofifUxpQwWxfInlk3xi03fYfBGZDPyOCY2DxATQdhZr58XU9bBenWPNvVCK7MoEFvp32raPJ9%2Bi7VHE6%2F4qSLUtSkmjdnFp92%2FpsdlCJQSjjK8eSStHtuYpJAHh3fts8rEZlV06Mjv46moAwDxf46n%2BiwNJGn4BBpuNl2auiUQhPyguemPWGGgjqbBVqmOKOWMOLqvdYGOqUBdjpES%2Fn6QsIP%2Fdfd9GA4%2BHCE9f%2F%2FceFtXQ%2BUBbvqW6m9ZnK1HOvLg59wcq1d08yxUUostT2LQOrm1ztxpRs0OxsVX84cy6ZjzdbJh568K2HzBjgqBYrzC76bDV8OaH1aAq84jSC43G0cInTCQjP3R22WMmPqVhyDeNeeXJeAy7UG8o1FvAFOA3cN1%2F9cMhhSBasYhIFJZkOBgMjLlRX50pw8PsmF&X-Amz-Signature=5398bffce45afed256ad765cf6ed9d74ecdc9ed475b156cce05429e95ce78d48&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665RT772XJ%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T160757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGVw%2BYcnvdmJB8n4eAdcVAMcLwiHy0sl7CauUat%2BnLRvAiEAi%2FWcWuL5GFPWRiciACdIkbcSs11Kw3UfFQXeVy3XbWoqiAQItf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHMrAQo353Obc0keECrcA%2FeiuT5qZUrG8FLkMj52iuacIl2BEvV8JoKs0nc9raqLajDEhiOllXGqryh3e%2BhCFy9zanONsWux6987wJVWtf%2FRNnK4YjGJpDAZQRJ8iFSBn7zELvlpcD2EbJblR%2BILrSBoIbd8D6M0M7g2NxmsigRdbtm2nmFDg%2FQed%2F6Z96fIif4Jvz%2BMN5w7%2FQCXSJIDSCirs7pUiYMe5i2DTGSrs%2FqKB0q3MUhHT8%2Bk4kJoCaGG0kggK9z7p6tqv2gqtuy4OUr%2BWXam%2B4leFUV1ub%2FB7tz%2FQharqCRUY%2B5gmPybO%2FCJLzV42UzJFp%2BFoDdqcgortd9zI3AMOMiYi4mjpJN%2Fd5sSiKzwEqCvSBbhkhjclvrN0g3q7Ut5ysRpTdNNEczY9kJPSvuIY4WL4Fk2cTYl%2F7W2zuHqRjheFm9cps8W8T3z3ZBYHHtXJO9sstFofifUxpQwWxfInlk3xi03fYfBGZDPyOCY2DxATQdhZr58XU9bBenWPNvVCK7MoEFvp32raPJ9%2Bi7VHE6%2F4qSLUtSkmjdnFp92%2FpsdlCJQSjjK8eSStHtuYpJAHh3fts8rEZlV06Mjv46moAwDxf46n%2BiwNJGn4BBpuNl2auiUQhPyguemPWGGgjqbBVqmOKOWMOLqvdYGOqUBdjpES%2Fn6QsIP%2Fdfd9GA4%2BHCE9f%2F%2FceFtXQ%2BUBbvqW6m9ZnK1HOvLg59wcq1d08yxUUostT2LQOrm1ztxpRs0OxsVX84cy6ZjzdbJh568K2HzBjgqBYrzC76bDV8OaH1aAq84jSC43G0cInTCQjP3R22WMmPqVhyDeNeeXJeAy7UG8o1FvAFOA3cN1%2F9cMhhSBasYhIFJZkOBgMjLlRX50pw8PsmF&X-Amz-Signature=6957a786f11ba405e49ee40a590612ba89e4a8f88e6a010a88a3fdcacd621eb4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665RT772XJ%2F20261014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261014T160757Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIGVw%2BYcnvdmJB8n4eAdcVAMcLwiHy0sl7CauUat%2BnLRvAiEAi%2FWcWuL5GFPWRiciACdIkbcSs11Kw3UfFQXeVy3XbWoqiAQItf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHMrAQo353Obc0keECrcA%2FeiuT5qZUrG8FLkMj52iuacIl2BEvV8JoKs0nc9raqLajDEhiOllXGqryh3e%2BhCFy9zanONsWux6987wJVWtf%2FRNnK4YjGJpDAZQRJ8iFSBn7zELvlpcD2EbJblR%2BILrSBoIbd8D6M0M7g2NxmsigRdbtm2nmFDg%2FQed%2F6Z96fIif4Jvz%2BMN5w7%2FQCXSJIDSCirs7pUiYMe5i2DTGSrs%2FqKB0q3MUhHT8%2Bk4kJoCaGG0kggK9z7p6tqv2gqtuy4OUr%2BWXam%2B4leFUV1ub%2FB7tz%2FQharqCRUY%2B5gmPybO%2FCJLzV42UzJFp%2BFoDdqcgortd9zI3AMOMiYi4mjpJN%2Fd5sSiKzwEqCvSBbhkhjclvrN0g3q7Ut5ysRpTdNNEczY9kJPSvuIY4WL4Fk2cTYl%2F7W2zuHqRjheFm9cps8W8T3z3ZBYHHtXJO9sstFofifUxpQwWxfInlk3xi03fYfBGZDPyOCY2DxATQdhZr58XU9bBenWPNvVCK7MoEFvp32raPJ9%2Bi7VHE6%2F4qSLUtSkmjdnFp92%2FpsdlCJQSjjK8eSStHtuYpJAHh3fts8rEZlV06Mjv46moAwDxf46n%2BiwNJGn4BBpuNl2auiUQhPyguemPWGGgjqbBVqmOKOWMOLqvdYGOqUBdjpES%2Fn6QsIP%2Fdfd9GA4%2BHCE9f%2F%2FceFtXQ%2BUBbvqW6m9ZnK1HOvLg59wcq1d08yxUUostT2LQOrm1ztxpRs0OxsVX84cy6ZjzdbJh568K2HzBjgqBYrzC76bDV8OaH1aAq84jSC43G0cInTCQjP3R22WMmPqVhyDeNeeXJeAy7UG8o1FvAFOA3cN1%2F9cMhhSBasYhIFJZkOBgMjLlRX50pw8PsmF&X-Amz-Signature=62b46ddcff167f2e7749aebf4b992cc9580858453d8a06cfe3c70c5c18153757&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
