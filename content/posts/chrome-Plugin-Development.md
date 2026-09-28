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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZKYGFP6%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T224355Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJIMEYCIQCVJ50Q3zOBgFPqs%2FpojTB91xIaZ1c%2BaFW9gq4V3HiEnwIhAO%2BAlTiFqK%2BL9B5oJY%2FyeNmzJ7oHV55t10oOmkoyvsJsKv8DCDsQABoMNjM3NDIzMTgzODA1Igw67b8Z2TCpq1GJJPoq3AMVAVcjbD5HSx08p4j%2B9ziwNW9%2BNrD%2BDV8rQaZAI4lIYqSvFZUVgGmG8Pavu0tQrFEc8CZ0LOEsBAg3auJ90aaXgY1izNujizdGH4EtsxiRYlsUyRzr1IehhsHxeNCLJV8yQ77wsTviEEfLcyqQ6mCC7Z%2F%2FpF61CHS7kuWS%2FUu4%2B22EMcgWYlrb3W3qDgt8Z3%2BgaLEpU5krK10fEtSP2SiwMumluQIj2s1MFn6YVgP%2BU%2BFdBF5AmvpxT16OGxIzEIAaFdtc4Xjw20PKEmBrMGamCpRvIdJcEYHJdZ1wUDTTQBQvPapMGkgrquoWUIwsdAA827h%2Fn4e5gvf52mbkjagXyd8CYuXX0c9tqVDOmv%2F4snm6MIW%2BU%2BMHSLrnEaaOQw%2Fg12XVmMp1lT1x6%2FX%2BbOj5GE3iI6ooIaViEMUaqWPqsRzeUBhTyT7u9G%2F%2FO0iR2CUddknlbiwrtcboqAPHaXIQjaxkwyiOQAZXx1DImeHcKstMh%2FKJCPy8fU8yPu1%2BXQ0G3jrBAgvyxzlivnXYR38gxVhDoj65pXSzJp91SPTtcNKP4XbvZ%2Fi%2Flvw875k2oZsioiaijBncWs02a7ydPvyyc5V6GiqOEFue%2Bnjy3fMDNMEvJaxVxMh2L%2FgpOjD31erVBjqkAebHluu4dUyZ%2BTz4JTo%2FOQFetI9pffgGFsBUst%2FqNB8HbUqeBibNpg34kAU54V8Bk692c6PMH5LDfEAdlk858jH2aR7ErPwV%2FQx7xhRZL8Ulxc7%2FRrEvQztTWoH1BcFn8h%2FyWViinLwFlCJEvuAECeMvFobuIDXSQIO7Iu9xDX%2BEu%2FeOlaRxhlRcG2abrEZqyYR3figNswkL8dCw0dKoqEPbLeEU&X-Amz-Signature=ff2de9a58784a2fb21a2f0aee3d938d5cceb47a6ddd92a20f16631316b98b0b1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZKYGFP6%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T224355Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJIMEYCIQCVJ50Q3zOBgFPqs%2FpojTB91xIaZ1c%2BaFW9gq4V3HiEnwIhAO%2BAlTiFqK%2BL9B5oJY%2FyeNmzJ7oHV55t10oOmkoyvsJsKv8DCDsQABoMNjM3NDIzMTgzODA1Igw67b8Z2TCpq1GJJPoq3AMVAVcjbD5HSx08p4j%2B9ziwNW9%2BNrD%2BDV8rQaZAI4lIYqSvFZUVgGmG8Pavu0tQrFEc8CZ0LOEsBAg3auJ90aaXgY1izNujizdGH4EtsxiRYlsUyRzr1IehhsHxeNCLJV8yQ77wsTviEEfLcyqQ6mCC7Z%2F%2FpF61CHS7kuWS%2FUu4%2B22EMcgWYlrb3W3qDgt8Z3%2BgaLEpU5krK10fEtSP2SiwMumluQIj2s1MFn6YVgP%2BU%2BFdBF5AmvpxT16OGxIzEIAaFdtc4Xjw20PKEmBrMGamCpRvIdJcEYHJdZ1wUDTTQBQvPapMGkgrquoWUIwsdAA827h%2Fn4e5gvf52mbkjagXyd8CYuXX0c9tqVDOmv%2F4snm6MIW%2BU%2BMHSLrnEaaOQw%2Fg12XVmMp1lT1x6%2FX%2BbOj5GE3iI6ooIaViEMUaqWPqsRzeUBhTyT7u9G%2F%2FO0iR2CUddknlbiwrtcboqAPHaXIQjaxkwyiOQAZXx1DImeHcKstMh%2FKJCPy8fU8yPu1%2BXQ0G3jrBAgvyxzlivnXYR38gxVhDoj65pXSzJp91SPTtcNKP4XbvZ%2Fi%2Flvw875k2oZsioiaijBncWs02a7ydPvyyc5V6GiqOEFue%2Bnjy3fMDNMEvJaxVxMh2L%2FgpOjD31erVBjqkAebHluu4dUyZ%2BTz4JTo%2FOQFetI9pffgGFsBUst%2FqNB8HbUqeBibNpg34kAU54V8Bk692c6PMH5LDfEAdlk858jH2aR7ErPwV%2FQx7xhRZL8Ulxc7%2FRrEvQztTWoH1BcFn8h%2FyWViinLwFlCJEvuAECeMvFobuIDXSQIO7Iu9xDX%2BEu%2FeOlaRxhlRcG2abrEZqyYR3figNswkL8dCw0dKoqEPbLeEU&X-Amz-Signature=b6530b786991d66477374ba838798363b28d715f0e7dde0ba0f00d643ef32198&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZKYGFP6%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T224355Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJIMEYCIQCVJ50Q3zOBgFPqs%2FpojTB91xIaZ1c%2BaFW9gq4V3HiEnwIhAO%2BAlTiFqK%2BL9B5oJY%2FyeNmzJ7oHV55t10oOmkoyvsJsKv8DCDsQABoMNjM3NDIzMTgzODA1Igw67b8Z2TCpq1GJJPoq3AMVAVcjbD5HSx08p4j%2B9ziwNW9%2BNrD%2BDV8rQaZAI4lIYqSvFZUVgGmG8Pavu0tQrFEc8CZ0LOEsBAg3auJ90aaXgY1izNujizdGH4EtsxiRYlsUyRzr1IehhsHxeNCLJV8yQ77wsTviEEfLcyqQ6mCC7Z%2F%2FpF61CHS7kuWS%2FUu4%2B22EMcgWYlrb3W3qDgt8Z3%2BgaLEpU5krK10fEtSP2SiwMumluQIj2s1MFn6YVgP%2BU%2BFdBF5AmvpxT16OGxIzEIAaFdtc4Xjw20PKEmBrMGamCpRvIdJcEYHJdZ1wUDTTQBQvPapMGkgrquoWUIwsdAA827h%2Fn4e5gvf52mbkjagXyd8CYuXX0c9tqVDOmv%2F4snm6MIW%2BU%2BMHSLrnEaaOQw%2Fg12XVmMp1lT1x6%2FX%2BbOj5GE3iI6ooIaViEMUaqWPqsRzeUBhTyT7u9G%2F%2FO0iR2CUddknlbiwrtcboqAPHaXIQjaxkwyiOQAZXx1DImeHcKstMh%2FKJCPy8fU8yPu1%2BXQ0G3jrBAgvyxzlivnXYR38gxVhDoj65pXSzJp91SPTtcNKP4XbvZ%2Fi%2Flvw875k2oZsioiaijBncWs02a7ydPvyyc5V6GiqOEFue%2Bnjy3fMDNMEvJaxVxMh2L%2FgpOjD31erVBjqkAebHluu4dUyZ%2BTz4JTo%2FOQFetI9pffgGFsBUst%2FqNB8HbUqeBibNpg34kAU54V8Bk692c6PMH5LDfEAdlk858jH2aR7ErPwV%2FQx7xhRZL8Ulxc7%2FRrEvQztTWoH1BcFn8h%2FyWViinLwFlCJEvuAECeMvFobuIDXSQIO7Iu9xDX%2BEu%2FeOlaRxhlRcG2abrEZqyYR3figNswkL8dCw0dKoqEPbLeEU&X-Amz-Signature=60628c7fb6f8e320cb4d1104173bce469957daa4253561c7ca90450c5a37111e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZKYGFP6%2F20260928%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260928T224355Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHIaCXVzLXdlc3QtMiJIMEYCIQCVJ50Q3zOBgFPqs%2FpojTB91xIaZ1c%2BaFW9gq4V3HiEnwIhAO%2BAlTiFqK%2BL9B5oJY%2FyeNmzJ7oHV55t10oOmkoyvsJsKv8DCDsQABoMNjM3NDIzMTgzODA1Igw67b8Z2TCpq1GJJPoq3AMVAVcjbD5HSx08p4j%2B9ziwNW9%2BNrD%2BDV8rQaZAI4lIYqSvFZUVgGmG8Pavu0tQrFEc8CZ0LOEsBAg3auJ90aaXgY1izNujizdGH4EtsxiRYlsUyRzr1IehhsHxeNCLJV8yQ77wsTviEEfLcyqQ6mCC7Z%2F%2FpF61CHS7kuWS%2FUu4%2B22EMcgWYlrb3W3qDgt8Z3%2BgaLEpU5krK10fEtSP2SiwMumluQIj2s1MFn6YVgP%2BU%2BFdBF5AmvpxT16OGxIzEIAaFdtc4Xjw20PKEmBrMGamCpRvIdJcEYHJdZ1wUDTTQBQvPapMGkgrquoWUIwsdAA827h%2Fn4e5gvf52mbkjagXyd8CYuXX0c9tqVDOmv%2F4snm6MIW%2BU%2BMHSLrnEaaOQw%2Fg12XVmMp1lT1x6%2FX%2BbOj5GE3iI6ooIaViEMUaqWPqsRzeUBhTyT7u9G%2F%2FO0iR2CUddknlbiwrtcboqAPHaXIQjaxkwyiOQAZXx1DImeHcKstMh%2FKJCPy8fU8yPu1%2BXQ0G3jrBAgvyxzlivnXYR38gxVhDoj65pXSzJp91SPTtcNKP4XbvZ%2Fi%2Flvw875k2oZsioiaijBncWs02a7ydPvyyc5V6GiqOEFue%2Bnjy3fMDNMEvJaxVxMh2L%2FgpOjD31erVBjqkAebHluu4dUyZ%2BTz4JTo%2FOQFetI9pffgGFsBUst%2FqNB8HbUqeBibNpg34kAU54V8Bk692c6PMH5LDfEAdlk858jH2aR7ErPwV%2FQx7xhRZL8Ulxc7%2FRrEvQztTWoH1BcFn8h%2FyWViinLwFlCJEvuAECeMvFobuIDXSQIO7Iu9xDX%2BEu%2FeOlaRxhlRcG2abrEZqyYR3figNswkL8dCw0dKoqEPbLeEU&X-Amz-Signature=bda1eb9355835b116314e27288c28454915414a90eff2bcad7b8eccb1e0ebd58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
