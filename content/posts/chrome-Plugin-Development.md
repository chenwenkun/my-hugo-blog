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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5EW4ZNL%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T014317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDFH0ER3NaDxObRiOn79k%2BCzlkcdInkF%2Buxx4Z7rIUWKgIhAJuPM1w7AThueEhWzfGRcOlnm%2BUoEQRjSqgz6fLSrPVxKogECJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzwYvCR62OEDaBWgpsq3APwFNvszCk335JtRZCV%2B9uEtqP%2BEHoJkFVCWcT8YHR3hhI2sTDLWC23kg72uaagLfGGp0EvW%2FVtmodcb78tXmYxNYddq5%2FJrlstx%2BM%2BOzqBn11wrvfw1ljiK0kqJCrPQpQU1T6f2yn8nP2cIcgelKoLEwUyY2ZdqJh9BrYksPYj3u%2B6WmR5hU2FQ1OLwuB5O4ZBnsWeh6h3wCK6IY33AuMzAR2BVH5OZ0TxGux8TZnKqO4aQ2dp7L8OxmlgvI%2B20u6%2FOlJF%2FcBynr%2BkyOCWOtLl%2BJjXVGAgcz3Dm2HVBPNmR7jalfys2sIB4YxERZghqPzmT9iyy%2BK3ztKhG2rLVES8%2ByGXKQ9RnKRl70E%2BCS6Z5YDJOjkhuRpTDxajmqpESQeya4NnQr%2F0p7e1KRAeWnJk3CmmX8Zx2YoRZ2am4rAbAo23eUxburQRn1xPYB%2BaNCvUxxvErp04VyazrOJSoCvrx5aTejqiYzqfC6cou9oVeR%2B7B9AXg3cSILJpue0J7fcdqLfKYkCAPFmKPoqpcs7D%2BK9JhvF0MPSAd%2B%2FZZZXzvEWpVcfcQW%2Fs5TX3XVQnE2JRIqaaCYLE249Er6ab52QD0dDNT1QExP7XdqY%2BAxDX8RrKKmdRyK84e753PjDsxpjYBjqkAaX94Vdf1VoD8209z0PvhFPDPuUZjFNfeCFzJbKoXLttkK0j3lmTFjyPtDiIYBgoq2cLDhMY2UTPlqJYiAclua5XjU5w71j%2BDSmPVXD2HIImrf2c%2FulJGgPgaFAIHT1FSyjIwcZ%2FVMHVETaA7%2BiureuMc%2BehqIP7GJrbF5WB4F8tMSEaMHO0EFSDJ590%2BbZiTXkGDQPg%2BKNrNYY09KmVgNeF1h1i&X-Amz-Signature=2a7e14f33046efa24924cced0810ef82c7cb5c6ad18c62c00a7bff36932dba8d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5EW4ZNL%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T014317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDFH0ER3NaDxObRiOn79k%2BCzlkcdInkF%2Buxx4Z7rIUWKgIhAJuPM1w7AThueEhWzfGRcOlnm%2BUoEQRjSqgz6fLSrPVxKogECJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzwYvCR62OEDaBWgpsq3APwFNvszCk335JtRZCV%2B9uEtqP%2BEHoJkFVCWcT8YHR3hhI2sTDLWC23kg72uaagLfGGp0EvW%2FVtmodcb78tXmYxNYddq5%2FJrlstx%2BM%2BOzqBn11wrvfw1ljiK0kqJCrPQpQU1T6f2yn8nP2cIcgelKoLEwUyY2ZdqJh9BrYksPYj3u%2B6WmR5hU2FQ1OLwuB5O4ZBnsWeh6h3wCK6IY33AuMzAR2BVH5OZ0TxGux8TZnKqO4aQ2dp7L8OxmlgvI%2B20u6%2FOlJF%2FcBynr%2BkyOCWOtLl%2BJjXVGAgcz3Dm2HVBPNmR7jalfys2sIB4YxERZghqPzmT9iyy%2BK3ztKhG2rLVES8%2ByGXKQ9RnKRl70E%2BCS6Z5YDJOjkhuRpTDxajmqpESQeya4NnQr%2F0p7e1KRAeWnJk3CmmX8Zx2YoRZ2am4rAbAo23eUxburQRn1xPYB%2BaNCvUxxvErp04VyazrOJSoCvrx5aTejqiYzqfC6cou9oVeR%2B7B9AXg3cSILJpue0J7fcdqLfKYkCAPFmKPoqpcs7D%2BK9JhvF0MPSAd%2B%2FZZZXzvEWpVcfcQW%2Fs5TX3XVQnE2JRIqaaCYLE249Er6ab52QD0dDNT1QExP7XdqY%2BAxDX8RrKKmdRyK84e753PjDsxpjYBjqkAaX94Vdf1VoD8209z0PvhFPDPuUZjFNfeCFzJbKoXLttkK0j3lmTFjyPtDiIYBgoq2cLDhMY2UTPlqJYiAclua5XjU5w71j%2BDSmPVXD2HIImrf2c%2FulJGgPgaFAIHT1FSyjIwcZ%2FVMHVETaA7%2BiureuMc%2BehqIP7GJrbF5WB4F8tMSEaMHO0EFSDJ590%2BbZiTXkGDQPg%2BKNrNYY09KmVgNeF1h1i&X-Amz-Signature=e9505d7707a52c50fdf5c3690306d4ba10c5d8d6c8cc00b2df9de4cf27751bd1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5EW4ZNL%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T014317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDFH0ER3NaDxObRiOn79k%2BCzlkcdInkF%2Buxx4Z7rIUWKgIhAJuPM1w7AThueEhWzfGRcOlnm%2BUoEQRjSqgz6fLSrPVxKogECJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzwYvCR62OEDaBWgpsq3APwFNvszCk335JtRZCV%2B9uEtqP%2BEHoJkFVCWcT8YHR3hhI2sTDLWC23kg72uaagLfGGp0EvW%2FVtmodcb78tXmYxNYddq5%2FJrlstx%2BM%2BOzqBn11wrvfw1ljiK0kqJCrPQpQU1T6f2yn8nP2cIcgelKoLEwUyY2ZdqJh9BrYksPYj3u%2B6WmR5hU2FQ1OLwuB5O4ZBnsWeh6h3wCK6IY33AuMzAR2BVH5OZ0TxGux8TZnKqO4aQ2dp7L8OxmlgvI%2B20u6%2FOlJF%2FcBynr%2BkyOCWOtLl%2BJjXVGAgcz3Dm2HVBPNmR7jalfys2sIB4YxERZghqPzmT9iyy%2BK3ztKhG2rLVES8%2ByGXKQ9RnKRl70E%2BCS6Z5YDJOjkhuRpTDxajmqpESQeya4NnQr%2F0p7e1KRAeWnJk3CmmX8Zx2YoRZ2am4rAbAo23eUxburQRn1xPYB%2BaNCvUxxvErp04VyazrOJSoCvrx5aTejqiYzqfC6cou9oVeR%2B7B9AXg3cSILJpue0J7fcdqLfKYkCAPFmKPoqpcs7D%2BK9JhvF0MPSAd%2B%2FZZZXzvEWpVcfcQW%2Fs5TX3XVQnE2JRIqaaCYLE249Er6ab52QD0dDNT1QExP7XdqY%2BAxDX8RrKKmdRyK84e753PjDsxpjYBjqkAaX94Vdf1VoD8209z0PvhFPDPuUZjFNfeCFzJbKoXLttkK0j3lmTFjyPtDiIYBgoq2cLDhMY2UTPlqJYiAclua5XjU5w71j%2BDSmPVXD2HIImrf2c%2FulJGgPgaFAIHT1FSyjIwcZ%2FVMHVETaA7%2BiureuMc%2BehqIP7GJrbF5WB4F8tMSEaMHO0EFSDJ590%2BbZiTXkGDQPg%2BKNrNYY09KmVgNeF1h1i&X-Amz-Signature=e0040e0c48b50035f3498762d5c5c6ed691e88c4f15d84e6a88ce772259c58e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5EW4ZNL%2F20261125%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261125T014317Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDFH0ER3NaDxObRiOn79k%2BCzlkcdInkF%2Buxx4Z7rIUWKgIhAJuPM1w7AThueEhWzfGRcOlnm%2BUoEQRjSqgz6fLSrPVxKogECJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzwYvCR62OEDaBWgpsq3APwFNvszCk335JtRZCV%2B9uEtqP%2BEHoJkFVCWcT8YHR3hhI2sTDLWC23kg72uaagLfGGp0EvW%2FVtmodcb78tXmYxNYddq5%2FJrlstx%2BM%2BOzqBn11wrvfw1ljiK0kqJCrPQpQU1T6f2yn8nP2cIcgelKoLEwUyY2ZdqJh9BrYksPYj3u%2B6WmR5hU2FQ1OLwuB5O4ZBnsWeh6h3wCK6IY33AuMzAR2BVH5OZ0TxGux8TZnKqO4aQ2dp7L8OxmlgvI%2B20u6%2FOlJF%2FcBynr%2BkyOCWOtLl%2BJjXVGAgcz3Dm2HVBPNmR7jalfys2sIB4YxERZghqPzmT9iyy%2BK3ztKhG2rLVES8%2ByGXKQ9RnKRl70E%2BCS6Z5YDJOjkhuRpTDxajmqpESQeya4NnQr%2F0p7e1KRAeWnJk3CmmX8Zx2YoRZ2am4rAbAo23eUxburQRn1xPYB%2BaNCvUxxvErp04VyazrOJSoCvrx5aTejqiYzqfC6cou9oVeR%2B7B9AXg3cSILJpue0J7fcdqLfKYkCAPFmKPoqpcs7D%2BK9JhvF0MPSAd%2B%2FZZZXzvEWpVcfcQW%2Fs5TX3XVQnE2JRIqaaCYLE249Er6ab52QD0dDNT1QExP7XdqY%2BAxDX8RrKKmdRyK84e753PjDsxpjYBjqkAaX94Vdf1VoD8209z0PvhFPDPuUZjFNfeCFzJbKoXLttkK0j3lmTFjyPtDiIYBgoq2cLDhMY2UTPlqJYiAclua5XjU5w71j%2BDSmPVXD2HIImrf2c%2FulJGgPgaFAIHT1FSyjIwcZ%2FVMHVETaA7%2BiureuMc%2BehqIP7GJrbF5WB4F8tMSEaMHO0EFSDJ590%2BbZiTXkGDQPg%2BKNrNYY09KmVgNeF1h1i&X-Amz-Signature=86f0a5922e6bf0af4536f93d168702bc74a88bb9637bede88755275fb1b32917&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
