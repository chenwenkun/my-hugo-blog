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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PLPFKD6%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T031520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBzBBnOt4sIoDk8i%2Bvb8Zm9C1VPwaUMfNxv9EtdU8kABAiEAsTWbNOEuIwAOh%2B99jHWQBbSzqEGkba8%2F5olEqcLyYOQq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDFebUGLiG4zcZenY6CrcA9phSFeIJEk7l2X0BSzH192zqSOd50LhnR%2FVsgBE6ip21qqEE792c4UOhtqPdgi8IaDMri06WWD%2FcyoGWBprc5bheat74CejDO6vYQCj5Zn7jmODceBRMi4XjnOMidzVQ2ylw8M5W91Kp2%2Fy5y5aZZOsL%2BVzrSfuw5VMABUE6Jh6GEUU%2FYXeunUICp1wz9lX2rZdt3DkRPbqc7LKsI1EP7TOFO6gH9vHE0wPBngJuvoLNwaWLe46TH9pt0QAYFt0%2F9IWVRgI6pRRLGeR1b9R0P8zyKPNfLy7SZYwbq%2F%2BTze%2BWlP4IqGig8b2a76U%2Bouoi7Xi0nxyQN2wtGAcmRoTSxJCY%2FXYZ%2BOebsBxdjCOXmNDIBZ7iIsjpcXdAL%2FDwYOVVuKKxxSLrWSxk9fREqpTWCLNpekpuqcQEmMeubdbuFrapoWT6hnY%2F%2F7YL%2FrKdUMQTmWExCqD5oSMBczk1d0lM%2BgRE%2FhG7G2MgE4JqtUsypQvLp42Umoze7LA%2BtTmmltwIRr7cFtMggPzFP8cDYN2%2BRDSZVN9zi79SSWtgn5P2fHyneG1kR7%2FU5DbqNetrMDryUNYrojNIrQz5DAeRO3JOJZvP11BdUjSatYhsPkYvQuJJxKpPZKQhvOseo%2FLMNykptYGOqUBYVJBvk4iUqFVjkGs2NFWncQoBQAXHLjZ5MQMhML6TjFo184dH1%2FAfCA0PXtrG00Aq3Dyf47%2FbVf7a6Ci3x7V%2FyFtcMvGUlEdaOuM%2FmdVh%2B4GkzM%2F%2F%2B%2BVKnw1m6NU%2BQm8i7oSjBq%2BUPPH5pEPfK%2BjLmStsSBsbDMdrWRlAv7f6fB%2FE0huE2SSWVK6SSTT6uCzeat261pj6nyUYlP%2Fv8b0%2ByaT2z54&X-Amz-Signature=e8cead955517db66ef3fae9c87f238d2e896a6b1555bedf7709c93056000c3e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PLPFKD6%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T031520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBzBBnOt4sIoDk8i%2Bvb8Zm9C1VPwaUMfNxv9EtdU8kABAiEAsTWbNOEuIwAOh%2B99jHWQBbSzqEGkba8%2F5olEqcLyYOQq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDFebUGLiG4zcZenY6CrcA9phSFeIJEk7l2X0BSzH192zqSOd50LhnR%2FVsgBE6ip21qqEE792c4UOhtqPdgi8IaDMri06WWD%2FcyoGWBprc5bheat74CejDO6vYQCj5Zn7jmODceBRMi4XjnOMidzVQ2ylw8M5W91Kp2%2Fy5y5aZZOsL%2BVzrSfuw5VMABUE6Jh6GEUU%2FYXeunUICp1wz9lX2rZdt3DkRPbqc7LKsI1EP7TOFO6gH9vHE0wPBngJuvoLNwaWLe46TH9pt0QAYFt0%2F9IWVRgI6pRRLGeR1b9R0P8zyKPNfLy7SZYwbq%2F%2BTze%2BWlP4IqGig8b2a76U%2Bouoi7Xi0nxyQN2wtGAcmRoTSxJCY%2FXYZ%2BOebsBxdjCOXmNDIBZ7iIsjpcXdAL%2FDwYOVVuKKxxSLrWSxk9fREqpTWCLNpekpuqcQEmMeubdbuFrapoWT6hnY%2F%2F7YL%2FrKdUMQTmWExCqD5oSMBczk1d0lM%2BgRE%2FhG7G2MgE4JqtUsypQvLp42Umoze7LA%2BtTmmltwIRr7cFtMggPzFP8cDYN2%2BRDSZVN9zi79SSWtgn5P2fHyneG1kR7%2FU5DbqNetrMDryUNYrojNIrQz5DAeRO3JOJZvP11BdUjSatYhsPkYvQuJJxKpPZKQhvOseo%2FLMNykptYGOqUBYVJBvk4iUqFVjkGs2NFWncQoBQAXHLjZ5MQMhML6TjFo184dH1%2FAfCA0PXtrG00Aq3Dyf47%2FbVf7a6Ci3x7V%2FyFtcMvGUlEdaOuM%2FmdVh%2B4GkzM%2F%2F%2B%2BVKnw1m6NU%2BQm8i7oSjBq%2BUPPH5pEPfK%2BjLmStsSBsbDMdrWRlAv7f6fB%2FE0huE2SSWVK6SSTT6uCzeat261pj6nyUYlP%2Fv8b0%2ByaT2z54&X-Amz-Signature=489bc708a6fc3958ccbfbe564473ed7d764ba9fe37556f3a0ba35ddbb98006b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PLPFKD6%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T031520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBzBBnOt4sIoDk8i%2Bvb8Zm9C1VPwaUMfNxv9EtdU8kABAiEAsTWbNOEuIwAOh%2B99jHWQBbSzqEGkba8%2F5olEqcLyYOQq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDFebUGLiG4zcZenY6CrcA9phSFeIJEk7l2X0BSzH192zqSOd50LhnR%2FVsgBE6ip21qqEE792c4UOhtqPdgi8IaDMri06WWD%2FcyoGWBprc5bheat74CejDO6vYQCj5Zn7jmODceBRMi4XjnOMidzVQ2ylw8M5W91Kp2%2Fy5y5aZZOsL%2BVzrSfuw5VMABUE6Jh6GEUU%2FYXeunUICp1wz9lX2rZdt3DkRPbqc7LKsI1EP7TOFO6gH9vHE0wPBngJuvoLNwaWLe46TH9pt0QAYFt0%2F9IWVRgI6pRRLGeR1b9R0P8zyKPNfLy7SZYwbq%2F%2BTze%2BWlP4IqGig8b2a76U%2Bouoi7Xi0nxyQN2wtGAcmRoTSxJCY%2FXYZ%2BOebsBxdjCOXmNDIBZ7iIsjpcXdAL%2FDwYOVVuKKxxSLrWSxk9fREqpTWCLNpekpuqcQEmMeubdbuFrapoWT6hnY%2F%2F7YL%2FrKdUMQTmWExCqD5oSMBczk1d0lM%2BgRE%2FhG7G2MgE4JqtUsypQvLp42Umoze7LA%2BtTmmltwIRr7cFtMggPzFP8cDYN2%2BRDSZVN9zi79SSWtgn5P2fHyneG1kR7%2FU5DbqNetrMDryUNYrojNIrQz5DAeRO3JOJZvP11BdUjSatYhsPkYvQuJJxKpPZKQhvOseo%2FLMNykptYGOqUBYVJBvk4iUqFVjkGs2NFWncQoBQAXHLjZ5MQMhML6TjFo184dH1%2FAfCA0PXtrG00Aq3Dyf47%2FbVf7a6Ci3x7V%2FyFtcMvGUlEdaOuM%2FmdVh%2B4GkzM%2F%2F%2B%2BVKnw1m6NU%2BQm8i7oSjBq%2BUPPH5pEPfK%2BjLmStsSBsbDMdrWRlAv7f6fB%2FE0huE2SSWVK6SSTT6uCzeat261pj6nyUYlP%2Fv8b0%2ByaT2z54&X-Amz-Signature=0ed2e4fb1cc78df6006a1a648df526762ada4b47c06e83d33b14bd0921ba8032&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PLPFKD6%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T031520Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBzBBnOt4sIoDk8i%2Bvb8Zm9C1VPwaUMfNxv9EtdU8kABAiEAsTWbNOEuIwAOh%2B99jHWQBbSzqEGkba8%2F5olEqcLyYOQq%2FwMIShAAGgw2Mzc0MjMxODM4MDUiDFebUGLiG4zcZenY6CrcA9phSFeIJEk7l2X0BSzH192zqSOd50LhnR%2FVsgBE6ip21qqEE792c4UOhtqPdgi8IaDMri06WWD%2FcyoGWBprc5bheat74CejDO6vYQCj5Zn7jmODceBRMi4XjnOMidzVQ2ylw8M5W91Kp2%2Fy5y5aZZOsL%2BVzrSfuw5VMABUE6Jh6GEUU%2FYXeunUICp1wz9lX2rZdt3DkRPbqc7LKsI1EP7TOFO6gH9vHE0wPBngJuvoLNwaWLe46TH9pt0QAYFt0%2F9IWVRgI6pRRLGeR1b9R0P8zyKPNfLy7SZYwbq%2F%2BTze%2BWlP4IqGig8b2a76U%2Bouoi7Xi0nxyQN2wtGAcmRoTSxJCY%2FXYZ%2BOebsBxdjCOXmNDIBZ7iIsjpcXdAL%2FDwYOVVuKKxxSLrWSxk9fREqpTWCLNpekpuqcQEmMeubdbuFrapoWT6hnY%2F%2F7YL%2FrKdUMQTmWExCqD5oSMBczk1d0lM%2BgRE%2FhG7G2MgE4JqtUsypQvLp42Umoze7LA%2BtTmmltwIRr7cFtMggPzFP8cDYN2%2BRDSZVN9zi79SSWtgn5P2fHyneG1kR7%2FU5DbqNetrMDryUNYrojNIrQz5DAeRO3JOJZvP11BdUjSatYhsPkYvQuJJxKpPZKQhvOseo%2FLMNykptYGOqUBYVJBvk4iUqFVjkGs2NFWncQoBQAXHLjZ5MQMhML6TjFo184dH1%2FAfCA0PXtrG00Aq3Dyf47%2FbVf7a6Ci3x7V%2FyFtcMvGUlEdaOuM%2FmdVh%2B4GkzM%2F%2F%2B%2BVKnw1m6NU%2BQm8i7oSjBq%2BUPPH5pEPfK%2BjLmStsSBsbDMdrWRlAv7f6fB%2FE0huE2SSWVK6SSTT6uCzeat261pj6nyUYlP%2Fv8b0%2ByaT2z54&X-Amz-Signature=805f48df9875372ebfe83144830a9d07a7f46a811a1c6e286e48fa7efcdd8fa6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
