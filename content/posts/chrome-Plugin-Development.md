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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUO472FO%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T113247Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDd8OuuRaHk3wfpLsWLVWfwUnAciYzuo08673bVyt1kXgIgcBwh6vdmrl%2BNtLgUl8waFCUSJuduDMHYeOiZgKl67ssqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEjHSY1vTwOKIKjVNyrcA3spMlHniv%2Fkt8kTN2rAIwfW2XyOC0R6Ty7lougaoKgodGe6wV10uLhNEuNOKDL0HoRPaoYaEizgtR2X4VBqRy%2F4uUT3g%2BP7WXQIsQCeW1HLDbc8unkZe21PMIxpH3FD0zjFk8KTKHz40NsPArdNjNd7PKl%2B7aB%2FX3jTJpn3sUPVIXYIDVWssarJhBFEqwiqaKXSr4OgH1%2F8aIPCamd6IvqPG4JM%2BU4SycRqfr9WZOsknDOiJdYCGUbZG0k3aF68Mr8n6qZklHPWKrnQXpg5NDtwAb477OjwJWh6OPhrY4KII%2BcHIcLIC%2FJMxrj3tsd6N1s3DuXJNfKzlcsBrdK8kzCAZaVHqzPPKrPBULPUWNEipkDsntMYhQP5l%2F6W0svN2zJLY0By8g9QuTXhrIg5lOLTRUUFTLD%2FVGS0encwJvkx90r3iTzKmyXlpqZvqodj2qzYSfQHrXOj1jZZLsRGO2qs8UCJSEGqIixZgrBWqDH1wz1QQsRhYc1jxGY56CljGlDl9lZT9DfxLpFqegKwZDeTyix1pClbZB8hEn6EW4vdmnNCSazovF9cSpEYoxFN4Nha8d0hkMkCiameSnOjzkQxUXG8roZGToPU1rjjUtoNwHNCe0ZdifPHGLTjMPP2%2FdUGOqUBXDMCl8%2BcvdfXgGbNVF4nU3y9cGKN%2BXso6MHyvgvKyZAwARTSdjAFMcASowxiSUAxkAfP8fmyXR3g7s4zPtFK5BW3Lg%2BgkAHPl%2FffBLfuUnFryu0HxSN4YlubbWqd4rBOhIOyhreFsM0kgFRSxCGMLML9trCEYp%2F%2BEUkuUaVx1ktzujg7Dxj9efS%2BQ2eh60RspM5Jll8uiAGpDRseL%2BlnEVoB%2FWVA&X-Amz-Signature=975cd1d080067308a290ed1fc349ceb8489bd498f18a1b660b16bb2a9d09f3f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUO472FO%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T113247Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDd8OuuRaHk3wfpLsWLVWfwUnAciYzuo08673bVyt1kXgIgcBwh6vdmrl%2BNtLgUl8waFCUSJuduDMHYeOiZgKl67ssqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEjHSY1vTwOKIKjVNyrcA3spMlHniv%2Fkt8kTN2rAIwfW2XyOC0R6Ty7lougaoKgodGe6wV10uLhNEuNOKDL0HoRPaoYaEizgtR2X4VBqRy%2F4uUT3g%2BP7WXQIsQCeW1HLDbc8unkZe21PMIxpH3FD0zjFk8KTKHz40NsPArdNjNd7PKl%2B7aB%2FX3jTJpn3sUPVIXYIDVWssarJhBFEqwiqaKXSr4OgH1%2F8aIPCamd6IvqPG4JM%2BU4SycRqfr9WZOsknDOiJdYCGUbZG0k3aF68Mr8n6qZklHPWKrnQXpg5NDtwAb477OjwJWh6OPhrY4KII%2BcHIcLIC%2FJMxrj3tsd6N1s3DuXJNfKzlcsBrdK8kzCAZaVHqzPPKrPBULPUWNEipkDsntMYhQP5l%2F6W0svN2zJLY0By8g9QuTXhrIg5lOLTRUUFTLD%2FVGS0encwJvkx90r3iTzKmyXlpqZvqodj2qzYSfQHrXOj1jZZLsRGO2qs8UCJSEGqIixZgrBWqDH1wz1QQsRhYc1jxGY56CljGlDl9lZT9DfxLpFqegKwZDeTyix1pClbZB8hEn6EW4vdmnNCSazovF9cSpEYoxFN4Nha8d0hkMkCiameSnOjzkQxUXG8roZGToPU1rjjUtoNwHNCe0ZdifPHGLTjMPP2%2FdUGOqUBXDMCl8%2BcvdfXgGbNVF4nU3y9cGKN%2BXso6MHyvgvKyZAwARTSdjAFMcASowxiSUAxkAfP8fmyXR3g7s4zPtFK5BW3Lg%2BgkAHPl%2FffBLfuUnFryu0HxSN4YlubbWqd4rBOhIOyhreFsM0kgFRSxCGMLML9trCEYp%2F%2BEUkuUaVx1ktzujg7Dxj9efS%2BQ2eh60RspM5Jll8uiAGpDRseL%2BlnEVoB%2FWVA&X-Amz-Signature=61cb86c3176547faffe9012e9ddef8953f2d93ce992f1c0a5c8e76373de24855&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUO472FO%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T113247Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDd8OuuRaHk3wfpLsWLVWfwUnAciYzuo08673bVyt1kXgIgcBwh6vdmrl%2BNtLgUl8waFCUSJuduDMHYeOiZgKl67ssqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEjHSY1vTwOKIKjVNyrcA3spMlHniv%2Fkt8kTN2rAIwfW2XyOC0R6Ty7lougaoKgodGe6wV10uLhNEuNOKDL0HoRPaoYaEizgtR2X4VBqRy%2F4uUT3g%2BP7WXQIsQCeW1HLDbc8unkZe21PMIxpH3FD0zjFk8KTKHz40NsPArdNjNd7PKl%2B7aB%2FX3jTJpn3sUPVIXYIDVWssarJhBFEqwiqaKXSr4OgH1%2F8aIPCamd6IvqPG4JM%2BU4SycRqfr9WZOsknDOiJdYCGUbZG0k3aF68Mr8n6qZklHPWKrnQXpg5NDtwAb477OjwJWh6OPhrY4KII%2BcHIcLIC%2FJMxrj3tsd6N1s3DuXJNfKzlcsBrdK8kzCAZaVHqzPPKrPBULPUWNEipkDsntMYhQP5l%2F6W0svN2zJLY0By8g9QuTXhrIg5lOLTRUUFTLD%2FVGS0encwJvkx90r3iTzKmyXlpqZvqodj2qzYSfQHrXOj1jZZLsRGO2qs8UCJSEGqIixZgrBWqDH1wz1QQsRhYc1jxGY56CljGlDl9lZT9DfxLpFqegKwZDeTyix1pClbZB8hEn6EW4vdmnNCSazovF9cSpEYoxFN4Nha8d0hkMkCiameSnOjzkQxUXG8roZGToPU1rjjUtoNwHNCe0ZdifPHGLTjMPP2%2FdUGOqUBXDMCl8%2BcvdfXgGbNVF4nU3y9cGKN%2BXso6MHyvgvKyZAwARTSdjAFMcASowxiSUAxkAfP8fmyXR3g7s4zPtFK5BW3Lg%2BgkAHPl%2FffBLfuUnFryu0HxSN4YlubbWqd4rBOhIOyhreFsM0kgFRSxCGMLML9trCEYp%2F%2BEUkuUaVx1ktzujg7Dxj9efS%2BQ2eh60RspM5Jll8uiAGpDRseL%2BlnEVoB%2FWVA&X-Amz-Signature=03fde02608ba4349845389bee866eef83e69128cf65c9b009abff7eda84f2e37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TUO472FO%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T113247Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDd8OuuRaHk3wfpLsWLVWfwUnAciYzuo08673bVyt1kXgIgcBwh6vdmrl%2BNtLgUl8waFCUSJuduDMHYeOiZgKl67ssqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEjHSY1vTwOKIKjVNyrcA3spMlHniv%2Fkt8kTN2rAIwfW2XyOC0R6Ty7lougaoKgodGe6wV10uLhNEuNOKDL0HoRPaoYaEizgtR2X4VBqRy%2F4uUT3g%2BP7WXQIsQCeW1HLDbc8unkZe21PMIxpH3FD0zjFk8KTKHz40NsPArdNjNd7PKl%2B7aB%2FX3jTJpn3sUPVIXYIDVWssarJhBFEqwiqaKXSr4OgH1%2F8aIPCamd6IvqPG4JM%2BU4SycRqfr9WZOsknDOiJdYCGUbZG0k3aF68Mr8n6qZklHPWKrnQXpg5NDtwAb477OjwJWh6OPhrY4KII%2BcHIcLIC%2FJMxrj3tsd6N1s3DuXJNfKzlcsBrdK8kzCAZaVHqzPPKrPBULPUWNEipkDsntMYhQP5l%2F6W0svN2zJLY0By8g9QuTXhrIg5lOLTRUUFTLD%2FVGS0encwJvkx90r3iTzKmyXlpqZvqodj2qzYSfQHrXOj1jZZLsRGO2qs8UCJSEGqIixZgrBWqDH1wz1QQsRhYc1jxGY56CljGlDl9lZT9DfxLpFqegKwZDeTyix1pClbZB8hEn6EW4vdmnNCSazovF9cSpEYoxFN4Nha8d0hkMkCiameSnOjzkQxUXG8roZGToPU1rjjUtoNwHNCe0ZdifPHGLTjMPP2%2FdUGOqUBXDMCl8%2BcvdfXgGbNVF4nU3y9cGKN%2BXso6MHyvgvKyZAwARTSdjAFMcASowxiSUAxkAfP8fmyXR3g7s4zPtFK5BW3Lg%2BgkAHPl%2FffBLfuUnFryu0HxSN4YlubbWqd4rBOhIOyhreFsM0kgFRSxCGMLML9trCEYp%2F%2BEUkuUaVx1ktzujg7Dxj9efS%2BQ2eh60RspM5Jll8uiAGpDRseL%2BlnEVoB%2FWVA&X-Amz-Signature=5e7b944966bd68510cd52200b7908c08a7a10f0bac02dd24940739a9421acb3c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
