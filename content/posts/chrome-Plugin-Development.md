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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QBIH3KN7%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T182332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB2S%2B%2BiY5i4WZUs5PVqSeLMUIvRdgDbNseUh5rtUMFixAiBF9sRpKrRlDYtUTN%2Bak9%2BcNyjjdl22unce9cnEy7pofyqIBAiK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMM2%2Bu50lFT6R37FxTKtwDa%2FnePazg%2F%2FZmdmOcxXLdWWMXCBn38dvyVjAyj5F7xGA0MF2BY0%2FWE0NGXpffPP17nRQMvCQ2Iupo1Ng19tj5Ed865cC3zPjf6D49DNm8JyfVfPxqhLNCkDtBZomG%2FE1fxka5XrJoYpQZ%2F11Rg1ISzDVcb8UUUwjQjWzLfiLtT2Eoz%2Bxdl%2F9rcDSZ7DkFhztHxYsKjf53SvYOOAMjsN2jBOyCOqZiASWGdoN5RxwBWwoawjzrmnEg2Y9DHF6yqt0sb%2BtoDxEuFHmiVCu3NwxL6EYuk8WM9Jzz%2BpcL2bZcfq1yaaWgjtDF7JBui71vAXmEGw7Jd2taMzBZP%2BKPsKdKoC3ZYA%2BSzm%2Fq6UJ6JBY2cXnHGeiwj0Lmcq2F31J37lIQiPWvE6z4NbFBUmJ%2Bcrzi0HVe3BI76r5OiDRvOeMEifGqruTqmsCvkYS36l%2FWRc5kaVpGJ947TaWkVqNotrKJFUcb0vGZWuN8lvS7mmC%2FVxnnd9q9MP13OhR63qnBeQh3YjxlHJYk8ex8wWd%2Bx3cZvy4vNCz9GEgZy8fO8Ixx6b6OLqkBeLd49%2BjH6WKobP2%2B1Hlj841t8On4L5zsaf%2BR5dgADohUpuHyG08ae8D5awDQEsbcHGa6aqqKt2cwydfi0wY6pgH68i0%2FgVSh0xQULrJW8hBji47lm3XEDxTaemBHByL6Bo0QecWnQ%2FtKgFswIBVaS5dQSiVpG7zeK6zxHszJUARZmCTNDUUgvW6OaTtItTmgCm%2F%2BP5lL%2BMGUxfiq15gmziiuIM5iHPH2wxtLR1sfPOeYJCugnL3NEVLZUblvOww9WlQ8NboedoqGnFWBcuPN9TWsZJzKwaHPA1WJ63Pb1nTQ9n0JHWEc&X-Amz-Signature=1a97da335c97e66a46d2affc74e22729c78d941ee040cea57c199582c0080675&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QBIH3KN7%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T182332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB2S%2B%2BiY5i4WZUs5PVqSeLMUIvRdgDbNseUh5rtUMFixAiBF9sRpKrRlDYtUTN%2Bak9%2BcNyjjdl22unce9cnEy7pofyqIBAiK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMM2%2Bu50lFT6R37FxTKtwDa%2FnePazg%2F%2FZmdmOcxXLdWWMXCBn38dvyVjAyj5F7xGA0MF2BY0%2FWE0NGXpffPP17nRQMvCQ2Iupo1Ng19tj5Ed865cC3zPjf6D49DNm8JyfVfPxqhLNCkDtBZomG%2FE1fxka5XrJoYpQZ%2F11Rg1ISzDVcb8UUUwjQjWzLfiLtT2Eoz%2Bxdl%2F9rcDSZ7DkFhztHxYsKjf53SvYOOAMjsN2jBOyCOqZiASWGdoN5RxwBWwoawjzrmnEg2Y9DHF6yqt0sb%2BtoDxEuFHmiVCu3NwxL6EYuk8WM9Jzz%2BpcL2bZcfq1yaaWgjtDF7JBui71vAXmEGw7Jd2taMzBZP%2BKPsKdKoC3ZYA%2BSzm%2Fq6UJ6JBY2cXnHGeiwj0Lmcq2F31J37lIQiPWvE6z4NbFBUmJ%2Bcrzi0HVe3BI76r5OiDRvOeMEifGqruTqmsCvkYS36l%2FWRc5kaVpGJ947TaWkVqNotrKJFUcb0vGZWuN8lvS7mmC%2FVxnnd9q9MP13OhR63qnBeQh3YjxlHJYk8ex8wWd%2Bx3cZvy4vNCz9GEgZy8fO8Ixx6b6OLqkBeLd49%2BjH6WKobP2%2B1Hlj841t8On4L5zsaf%2BR5dgADohUpuHyG08ae8D5awDQEsbcHGa6aqqKt2cwydfi0wY6pgH68i0%2FgVSh0xQULrJW8hBji47lm3XEDxTaemBHByL6Bo0QecWnQ%2FtKgFswIBVaS5dQSiVpG7zeK6zxHszJUARZmCTNDUUgvW6OaTtItTmgCm%2F%2BP5lL%2BMGUxfiq15gmziiuIM5iHPH2wxtLR1sfPOeYJCugnL3NEVLZUblvOww9WlQ8NboedoqGnFWBcuPN9TWsZJzKwaHPA1WJ63Pb1nTQ9n0JHWEc&X-Amz-Signature=22b95042e2ef1c0476708f4080c939f7d169ac1bc5778fbafe265ff843ba5c10&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QBIH3KN7%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T182332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB2S%2B%2BiY5i4WZUs5PVqSeLMUIvRdgDbNseUh5rtUMFixAiBF9sRpKrRlDYtUTN%2Bak9%2BcNyjjdl22unce9cnEy7pofyqIBAiK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMM2%2Bu50lFT6R37FxTKtwDa%2FnePazg%2F%2FZmdmOcxXLdWWMXCBn38dvyVjAyj5F7xGA0MF2BY0%2FWE0NGXpffPP17nRQMvCQ2Iupo1Ng19tj5Ed865cC3zPjf6D49DNm8JyfVfPxqhLNCkDtBZomG%2FE1fxka5XrJoYpQZ%2F11Rg1ISzDVcb8UUUwjQjWzLfiLtT2Eoz%2Bxdl%2F9rcDSZ7DkFhztHxYsKjf53SvYOOAMjsN2jBOyCOqZiASWGdoN5RxwBWwoawjzrmnEg2Y9DHF6yqt0sb%2BtoDxEuFHmiVCu3NwxL6EYuk8WM9Jzz%2BpcL2bZcfq1yaaWgjtDF7JBui71vAXmEGw7Jd2taMzBZP%2BKPsKdKoC3ZYA%2BSzm%2Fq6UJ6JBY2cXnHGeiwj0Lmcq2F31J37lIQiPWvE6z4NbFBUmJ%2Bcrzi0HVe3BI76r5OiDRvOeMEifGqruTqmsCvkYS36l%2FWRc5kaVpGJ947TaWkVqNotrKJFUcb0vGZWuN8lvS7mmC%2FVxnnd9q9MP13OhR63qnBeQh3YjxlHJYk8ex8wWd%2Bx3cZvy4vNCz9GEgZy8fO8Ixx6b6OLqkBeLd49%2BjH6WKobP2%2B1Hlj841t8On4L5zsaf%2BR5dgADohUpuHyG08ae8D5awDQEsbcHGa6aqqKt2cwydfi0wY6pgH68i0%2FgVSh0xQULrJW8hBji47lm3XEDxTaemBHByL6Bo0QecWnQ%2FtKgFswIBVaS5dQSiVpG7zeK6zxHszJUARZmCTNDUUgvW6OaTtItTmgCm%2F%2BP5lL%2BMGUxfiq15gmziiuIM5iHPH2wxtLR1sfPOeYJCugnL3NEVLZUblvOww9WlQ8NboedoqGnFWBcuPN9TWsZJzKwaHPA1WJ63Pb1nTQ9n0JHWEc&X-Amz-Signature=9d20af8a3a80940c88ac7dd6a38b4fd52c64a358383ed9287a17d4ce5bb6c308&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QBIH3KN7%2F20260809%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260809T182332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB2S%2B%2BiY5i4WZUs5PVqSeLMUIvRdgDbNseUh5rtUMFixAiBF9sRpKrRlDYtUTN%2Bak9%2BcNyjjdl22unce9cnEy7pofyqIBAiK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMM2%2Bu50lFT6R37FxTKtwDa%2FnePazg%2F%2FZmdmOcxXLdWWMXCBn38dvyVjAyj5F7xGA0MF2BY0%2FWE0NGXpffPP17nRQMvCQ2Iupo1Ng19tj5Ed865cC3zPjf6D49DNm8JyfVfPxqhLNCkDtBZomG%2FE1fxka5XrJoYpQZ%2F11Rg1ISzDVcb8UUUwjQjWzLfiLtT2Eoz%2Bxdl%2F9rcDSZ7DkFhztHxYsKjf53SvYOOAMjsN2jBOyCOqZiASWGdoN5RxwBWwoawjzrmnEg2Y9DHF6yqt0sb%2BtoDxEuFHmiVCu3NwxL6EYuk8WM9Jzz%2BpcL2bZcfq1yaaWgjtDF7JBui71vAXmEGw7Jd2taMzBZP%2BKPsKdKoC3ZYA%2BSzm%2Fq6UJ6JBY2cXnHGeiwj0Lmcq2F31J37lIQiPWvE6z4NbFBUmJ%2Bcrzi0HVe3BI76r5OiDRvOeMEifGqruTqmsCvkYS36l%2FWRc5kaVpGJ947TaWkVqNotrKJFUcb0vGZWuN8lvS7mmC%2FVxnnd9q9MP13OhR63qnBeQh3YjxlHJYk8ex8wWd%2Bx3cZvy4vNCz9GEgZy8fO8Ixx6b6OLqkBeLd49%2BjH6WKobP2%2B1Hlj841t8On4L5zsaf%2BR5dgADohUpuHyG08ae8D5awDQEsbcHGa6aqqKt2cwydfi0wY6pgH68i0%2FgVSh0xQULrJW8hBji47lm3XEDxTaemBHByL6Bo0QecWnQ%2FtKgFswIBVaS5dQSiVpG7zeK6zxHszJUARZmCTNDUUgvW6OaTtItTmgCm%2F%2BP5lL%2BMGUxfiq15gmziiuIM5iHPH2wxtLR1sfPOeYJCugnL3NEVLZUblvOww9WlQ8NboedoqGnFWBcuPN9TWsZJzKwaHPA1WJ63Pb1nTQ9n0JHWEc&X-Amz-Signature=f7621d67e5e595002b76a6555844b8d385168ed98031d4aa5a49153fb5d65498&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
