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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T4OLJUZH%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T034323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCOKv2SSCUwI7ZUHeXBA2Bd3mvX2C7LH5pRSKEYzArCIAIgUTipknNIjj7r3Hi9m6rof6r8vLdHAQtHO40J7SXPA10qiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPQCrDgdOyPDyD7GwSrcAwstY0OyInW7bg6WA0fgPYItPiLu3hV%2BIwa86JjooikXGVRQZN34khy5TdNL2QvMPhaM%2F1yCAuqhYJC3l7CIPKK9%2BgI9dXeTdg3aan1gAAOA%2FBQ6fU0Ao4rNII5R8FBT%2FzUY0aimjHBGwAAguWJnqFh1ZBDs9esnSEolKFD6lnSq%2FqQIDih9e6jL%2FUxWMjngSh73%2Fyq501V576hdNmgcbCj%2Bp1dNTgJ%2BgJfF6GS9D6EFMz%2FDrHQuCzZl1tolW9Cuu%2BsixHVkvAjwAw2fN%2BuQpMPLlvcZFeiXNwFH6%2B9R7%2BmH0wPUjzKn9grJteXMMfSldX04wxa%2FFFxEtptonreURbuCt2oSF0CwAv7EMPCwixqt7KUv8uPq%2FnXqcGPv0%2B2rgwuclKISF20Q7sB0oY2sMw8osm7xViSOf6rT8%2Fy6hbvnnMfc3OlnMmm51PlR3pIWX5EmHzN8xjcQKrbojXFBhpRRRnoJnU57u4tAxyhLSY3X4%2BMeYRR77zdG%2Feb1E%2FyoTTBAZuMZHrXqRqa8Rc%2F4KWsAqBmz4MtuCmXxmFGo%2BPW9HoMJlqY8doQsGBpdpuB6CUxlRJY%2F22OjONouGAAe%2FDpUqQCGxBpv6OVN4OrKdJwMd56peU9%2B9DRfw2ktMK%2FC5NcGOqUBl5Sy4h0dPzv7yCS0rML3qBtXrgy5nQB3xKxAPV9WCFwFefr3nasdDxwPDog6usoZ3NfgmD6sWZr%2BP4WwLl9ZVUdmNSNsVXLcZ6ZK41renWmmTBRmsGnnrDXF%2B0jyfaFrVAljT8qxxrPMlpFO0i5p6Js9l0gCvMlKPoFxae8Ct%2FWlyJgyV8zKPDuWu9v5yejanob0wWyTR4BC5JExIFi7DKmMi5uF&X-Amz-Signature=34383768115a030ba6af4d20ac557324abe930462f860ee3812429ffc11a9125&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T4OLJUZH%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T034323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCOKv2SSCUwI7ZUHeXBA2Bd3mvX2C7LH5pRSKEYzArCIAIgUTipknNIjj7r3Hi9m6rof6r8vLdHAQtHO40J7SXPA10qiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPQCrDgdOyPDyD7GwSrcAwstY0OyInW7bg6WA0fgPYItPiLu3hV%2BIwa86JjooikXGVRQZN34khy5TdNL2QvMPhaM%2F1yCAuqhYJC3l7CIPKK9%2BgI9dXeTdg3aan1gAAOA%2FBQ6fU0Ao4rNII5R8FBT%2FzUY0aimjHBGwAAguWJnqFh1ZBDs9esnSEolKFD6lnSq%2FqQIDih9e6jL%2FUxWMjngSh73%2Fyq501V576hdNmgcbCj%2Bp1dNTgJ%2BgJfF6GS9D6EFMz%2FDrHQuCzZl1tolW9Cuu%2BsixHVkvAjwAw2fN%2BuQpMPLlvcZFeiXNwFH6%2B9R7%2BmH0wPUjzKn9grJteXMMfSldX04wxa%2FFFxEtptonreURbuCt2oSF0CwAv7EMPCwixqt7KUv8uPq%2FnXqcGPv0%2B2rgwuclKISF20Q7sB0oY2sMw8osm7xViSOf6rT8%2Fy6hbvnnMfc3OlnMmm51PlR3pIWX5EmHzN8xjcQKrbojXFBhpRRRnoJnU57u4tAxyhLSY3X4%2BMeYRR77zdG%2Feb1E%2FyoTTBAZuMZHrXqRqa8Rc%2F4KWsAqBmz4MtuCmXxmFGo%2BPW9HoMJlqY8doQsGBpdpuB6CUxlRJY%2F22OjONouGAAe%2FDpUqQCGxBpv6OVN4OrKdJwMd56peU9%2B9DRfw2ktMK%2FC5NcGOqUBl5Sy4h0dPzv7yCS0rML3qBtXrgy5nQB3xKxAPV9WCFwFefr3nasdDxwPDog6usoZ3NfgmD6sWZr%2BP4WwLl9ZVUdmNSNsVXLcZ6ZK41renWmmTBRmsGnnrDXF%2B0jyfaFrVAljT8qxxrPMlpFO0i5p6Js9l0gCvMlKPoFxae8Ct%2FWlyJgyV8zKPDuWu9v5yejanob0wWyTR4BC5JExIFi7DKmMi5uF&X-Amz-Signature=06df4864e147578d5e8722bf79b596af36327b8131406a5e1d61884eb400eb40&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T4OLJUZH%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T034323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCOKv2SSCUwI7ZUHeXBA2Bd3mvX2C7LH5pRSKEYzArCIAIgUTipknNIjj7r3Hi9m6rof6r8vLdHAQtHO40J7SXPA10qiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPQCrDgdOyPDyD7GwSrcAwstY0OyInW7bg6WA0fgPYItPiLu3hV%2BIwa86JjooikXGVRQZN34khy5TdNL2QvMPhaM%2F1yCAuqhYJC3l7CIPKK9%2BgI9dXeTdg3aan1gAAOA%2FBQ6fU0Ao4rNII5R8FBT%2FzUY0aimjHBGwAAguWJnqFh1ZBDs9esnSEolKFD6lnSq%2FqQIDih9e6jL%2FUxWMjngSh73%2Fyq501V576hdNmgcbCj%2Bp1dNTgJ%2BgJfF6GS9D6EFMz%2FDrHQuCzZl1tolW9Cuu%2BsixHVkvAjwAw2fN%2BuQpMPLlvcZFeiXNwFH6%2B9R7%2BmH0wPUjzKn9grJteXMMfSldX04wxa%2FFFxEtptonreURbuCt2oSF0CwAv7EMPCwixqt7KUv8uPq%2FnXqcGPv0%2B2rgwuclKISF20Q7sB0oY2sMw8osm7xViSOf6rT8%2Fy6hbvnnMfc3OlnMmm51PlR3pIWX5EmHzN8xjcQKrbojXFBhpRRRnoJnU57u4tAxyhLSY3X4%2BMeYRR77zdG%2Feb1E%2FyoTTBAZuMZHrXqRqa8Rc%2F4KWsAqBmz4MtuCmXxmFGo%2BPW9HoMJlqY8doQsGBpdpuB6CUxlRJY%2F22OjONouGAAe%2FDpUqQCGxBpv6OVN4OrKdJwMd56peU9%2B9DRfw2ktMK%2FC5NcGOqUBl5Sy4h0dPzv7yCS0rML3qBtXrgy5nQB3xKxAPV9WCFwFefr3nasdDxwPDog6usoZ3NfgmD6sWZr%2BP4WwLl9ZVUdmNSNsVXLcZ6ZK41renWmmTBRmsGnnrDXF%2B0jyfaFrVAljT8qxxrPMlpFO0i5p6Js9l0gCvMlKPoFxae8Ct%2FWlyJgyV8zKPDuWu9v5yejanob0wWyTR4BC5JExIFi7DKmMi5uF&X-Amz-Signature=071667cc9863ff7102a7097951f079dc01b865fcddc3475cc91cc929674b7f71&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T4OLJUZH%2F20261115%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261115T034323Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCOKv2SSCUwI7ZUHeXBA2Bd3mvX2C7LH5pRSKEYzArCIAIgUTipknNIjj7r3Hi9m6rof6r8vLdHAQtHO40J7SXPA10qiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPQCrDgdOyPDyD7GwSrcAwstY0OyInW7bg6WA0fgPYItPiLu3hV%2BIwa86JjooikXGVRQZN34khy5TdNL2QvMPhaM%2F1yCAuqhYJC3l7CIPKK9%2BgI9dXeTdg3aan1gAAOA%2FBQ6fU0Ao4rNII5R8FBT%2FzUY0aimjHBGwAAguWJnqFh1ZBDs9esnSEolKFD6lnSq%2FqQIDih9e6jL%2FUxWMjngSh73%2Fyq501V576hdNmgcbCj%2Bp1dNTgJ%2BgJfF6GS9D6EFMz%2FDrHQuCzZl1tolW9Cuu%2BsixHVkvAjwAw2fN%2BuQpMPLlvcZFeiXNwFH6%2B9R7%2BmH0wPUjzKn9grJteXMMfSldX04wxa%2FFFxEtptonreURbuCt2oSF0CwAv7EMPCwixqt7KUv8uPq%2FnXqcGPv0%2B2rgwuclKISF20Q7sB0oY2sMw8osm7xViSOf6rT8%2Fy6hbvnnMfc3OlnMmm51PlR3pIWX5EmHzN8xjcQKrbojXFBhpRRRnoJnU57u4tAxyhLSY3X4%2BMeYRR77zdG%2Feb1E%2FyoTTBAZuMZHrXqRqa8Rc%2F4KWsAqBmz4MtuCmXxmFGo%2BPW9HoMJlqY8doQsGBpdpuB6CUxlRJY%2F22OjONouGAAe%2FDpUqQCGxBpv6OVN4OrKdJwMd56peU9%2B9DRfw2ktMK%2FC5NcGOqUBl5Sy4h0dPzv7yCS0rML3qBtXrgy5nQB3xKxAPV9WCFwFefr3nasdDxwPDog6usoZ3NfgmD6sWZr%2BP4WwLl9ZVUdmNSNsVXLcZ6ZK41renWmmTBRmsGnnrDXF%2B0jyfaFrVAljT8qxxrPMlpFO0i5p6Js9l0gCvMlKPoFxae8Ct%2FWlyJgyV8zKPDuWu9v5yejanob0wWyTR4BC5JExIFi7DKmMi5uF&X-Amz-Signature=00d06e11c3a2eae1864d7cad26622f3d5916a14915bab15b9a51b907f4d062c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
