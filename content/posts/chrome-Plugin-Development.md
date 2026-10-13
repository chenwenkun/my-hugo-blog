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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624RJBZYF%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T130810Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDtoVGp4y0%2FDjwXM7NqEn%2Bise860GIPW5RbEVuHBNOPhQIgOQeTq6vRuqNyvWfopB9Y6ZAkm9b0uJUb%2Bxkpp87i%2FxUqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEWmzQ95fFYdLGrRPircAzXEpSEjXyvNoNNy0nyjxlD35FjNwfyIDZuf2eQa3OqHtEv8V%2FV9Z%2BamwLVJXxABtxgUYDrb4jliCgcTCMseSAcHkRS6hUWQboMcaQeISuAJD44y3FlIfVcYd4txRtbbULhob%2BNQDZEZHA1w%2BCzgkXWxH9tnOqEaLO%2FSq3o8ef9gxWX3QDeDprY5NPJRQxxBUMzG7nuoueb47Xiag4tPKucp%2FDb3xN39IkNCobecwuriIrRpDKt%2BtJLU0Ih5pkRAthlTss4FsQ42V3nkNyzDWpzLPtad%2FczD94fwHx8wztwbn7W8qehLMBpi0GoKjfi0tER2rhoPG2xy70be31AHXfJKIK2NSGYF5h%2Bf8zP1pEl%2Fc4Lo7qtopZKtY0v4TGEEMjSvQxJXEmE3T643JqbAHS%2BStCuJZKzmFb2v5RvjVoV0LH6kJRae%2FpglxOhC8EnqlSB1pUUolhPJwhLrUkr0wy326WgrCebfUQHtAanKCXRWrdwKpAYqGoWyN7X7ZPU5kyaOHMfijPfMXCex5XDi8f6yWYs1AOf6PLlg5%2BH7anqozVnn8fQ7C2uAYxRDHxuRzl8JP7QK%2Fi97hmv%2Bv%2FCFAPxs%2Bg6jBSjq07B6OUUqCIhkI8QsAKFYz2hYdJmgMNuvuNYGOqUB7eefVf19ZMTK64HExIGWdNos5bLWRiBokwYnuLCLSTfo60VSQeC%2BJAwzYAGbGlrmMTR%2F3xwuK9IIg3A7CaUAmqX2x%2F91o1s9IA6BA7HyD%2BcZzqC%2FdIhsMtoQyPzbHonhveZx8%2Bvloaqs69kBKI4da6bPrFhANdCiyhJJFpVCLYTpT4EsJ4Rb%2BG8470OXwNEQpmkyjp8qJJ02451PFNWHMYhF0H7U&X-Amz-Signature=91a50cbd25294fe48f485bd505cf173d54447c5534a5a5f7b9bfacc7bef0f108&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624RJBZYF%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T130810Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDtoVGp4y0%2FDjwXM7NqEn%2Bise860GIPW5RbEVuHBNOPhQIgOQeTq6vRuqNyvWfopB9Y6ZAkm9b0uJUb%2Bxkpp87i%2FxUqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEWmzQ95fFYdLGrRPircAzXEpSEjXyvNoNNy0nyjxlD35FjNwfyIDZuf2eQa3OqHtEv8V%2FV9Z%2BamwLVJXxABtxgUYDrb4jliCgcTCMseSAcHkRS6hUWQboMcaQeISuAJD44y3FlIfVcYd4txRtbbULhob%2BNQDZEZHA1w%2BCzgkXWxH9tnOqEaLO%2FSq3o8ef9gxWX3QDeDprY5NPJRQxxBUMzG7nuoueb47Xiag4tPKucp%2FDb3xN39IkNCobecwuriIrRpDKt%2BtJLU0Ih5pkRAthlTss4FsQ42V3nkNyzDWpzLPtad%2FczD94fwHx8wztwbn7W8qehLMBpi0GoKjfi0tER2rhoPG2xy70be31AHXfJKIK2NSGYF5h%2Bf8zP1pEl%2Fc4Lo7qtopZKtY0v4TGEEMjSvQxJXEmE3T643JqbAHS%2BStCuJZKzmFb2v5RvjVoV0LH6kJRae%2FpglxOhC8EnqlSB1pUUolhPJwhLrUkr0wy326WgrCebfUQHtAanKCXRWrdwKpAYqGoWyN7X7ZPU5kyaOHMfijPfMXCex5XDi8f6yWYs1AOf6PLlg5%2BH7anqozVnn8fQ7C2uAYxRDHxuRzl8JP7QK%2Fi97hmv%2Bv%2FCFAPxs%2Bg6jBSjq07B6OUUqCIhkI8QsAKFYz2hYdJmgMNuvuNYGOqUB7eefVf19ZMTK64HExIGWdNos5bLWRiBokwYnuLCLSTfo60VSQeC%2BJAwzYAGbGlrmMTR%2F3xwuK9IIg3A7CaUAmqX2x%2F91o1s9IA6BA7HyD%2BcZzqC%2FdIhsMtoQyPzbHonhveZx8%2Bvloaqs69kBKI4da6bPrFhANdCiyhJJFpVCLYTpT4EsJ4Rb%2BG8470OXwNEQpmkyjp8qJJ02451PFNWHMYhF0H7U&X-Amz-Signature=e35a9e2b0f1e7d1246c17d75cdc6db02d5e2663c80b46f6d1f9b14397734f1af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624RJBZYF%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T130810Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDtoVGp4y0%2FDjwXM7NqEn%2Bise860GIPW5RbEVuHBNOPhQIgOQeTq6vRuqNyvWfopB9Y6ZAkm9b0uJUb%2Bxkpp87i%2FxUqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEWmzQ95fFYdLGrRPircAzXEpSEjXyvNoNNy0nyjxlD35FjNwfyIDZuf2eQa3OqHtEv8V%2FV9Z%2BamwLVJXxABtxgUYDrb4jliCgcTCMseSAcHkRS6hUWQboMcaQeISuAJD44y3FlIfVcYd4txRtbbULhob%2BNQDZEZHA1w%2BCzgkXWxH9tnOqEaLO%2FSq3o8ef9gxWX3QDeDprY5NPJRQxxBUMzG7nuoueb47Xiag4tPKucp%2FDb3xN39IkNCobecwuriIrRpDKt%2BtJLU0Ih5pkRAthlTss4FsQ42V3nkNyzDWpzLPtad%2FczD94fwHx8wztwbn7W8qehLMBpi0GoKjfi0tER2rhoPG2xy70be31AHXfJKIK2NSGYF5h%2Bf8zP1pEl%2Fc4Lo7qtopZKtY0v4TGEEMjSvQxJXEmE3T643JqbAHS%2BStCuJZKzmFb2v5RvjVoV0LH6kJRae%2FpglxOhC8EnqlSB1pUUolhPJwhLrUkr0wy326WgrCebfUQHtAanKCXRWrdwKpAYqGoWyN7X7ZPU5kyaOHMfijPfMXCex5XDi8f6yWYs1AOf6PLlg5%2BH7anqozVnn8fQ7C2uAYxRDHxuRzl8JP7QK%2Fi97hmv%2Bv%2FCFAPxs%2Bg6jBSjq07B6OUUqCIhkI8QsAKFYz2hYdJmgMNuvuNYGOqUB7eefVf19ZMTK64HExIGWdNos5bLWRiBokwYnuLCLSTfo60VSQeC%2BJAwzYAGbGlrmMTR%2F3xwuK9IIg3A7CaUAmqX2x%2F91o1s9IA6BA7HyD%2BcZzqC%2FdIhsMtoQyPzbHonhveZx8%2Bvloaqs69kBKI4da6bPrFhANdCiyhJJFpVCLYTpT4EsJ4Rb%2BG8470OXwNEQpmkyjp8qJJ02451PFNWHMYhF0H7U&X-Amz-Signature=9e931ed7ae4da3ea5e140bb51b0ce44b01d645c7903579bbc9edded11afe5015&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46624RJBZYF%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T130810Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDtoVGp4y0%2FDjwXM7NqEn%2Bise860GIPW5RbEVuHBNOPhQIgOQeTq6vRuqNyvWfopB9Y6ZAkm9b0uJUb%2Bxkpp87i%2FxUqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEWmzQ95fFYdLGrRPircAzXEpSEjXyvNoNNy0nyjxlD35FjNwfyIDZuf2eQa3OqHtEv8V%2FV9Z%2BamwLVJXxABtxgUYDrb4jliCgcTCMseSAcHkRS6hUWQboMcaQeISuAJD44y3FlIfVcYd4txRtbbULhob%2BNQDZEZHA1w%2BCzgkXWxH9tnOqEaLO%2FSq3o8ef9gxWX3QDeDprY5NPJRQxxBUMzG7nuoueb47Xiag4tPKucp%2FDb3xN39IkNCobecwuriIrRpDKt%2BtJLU0Ih5pkRAthlTss4FsQ42V3nkNyzDWpzLPtad%2FczD94fwHx8wztwbn7W8qehLMBpi0GoKjfi0tER2rhoPG2xy70be31AHXfJKIK2NSGYF5h%2Bf8zP1pEl%2Fc4Lo7qtopZKtY0v4TGEEMjSvQxJXEmE3T643JqbAHS%2BStCuJZKzmFb2v5RvjVoV0LH6kJRae%2FpglxOhC8EnqlSB1pUUolhPJwhLrUkr0wy326WgrCebfUQHtAanKCXRWrdwKpAYqGoWyN7X7ZPU5kyaOHMfijPfMXCex5XDi8f6yWYs1AOf6PLlg5%2BH7anqozVnn8fQ7C2uAYxRDHxuRzl8JP7QK%2Fi97hmv%2Bv%2FCFAPxs%2Bg6jBSjq07B6OUUqCIhkI8QsAKFYz2hYdJmgMNuvuNYGOqUB7eefVf19ZMTK64HExIGWdNos5bLWRiBokwYnuLCLSTfo60VSQeC%2BJAwzYAGbGlrmMTR%2F3xwuK9IIg3A7CaUAmqX2x%2F91o1s9IA6BA7HyD%2BcZzqC%2FdIhsMtoQyPzbHonhveZx8%2Bvloaqs69kBKI4da6bPrFhANdCiyhJJFpVCLYTpT4EsJ4Rb%2BG8470OXwNEQpmkyjp8qJJ02451PFNWHMYhF0H7U&X-Amz-Signature=77686ad93555433ef437fc51faae8d7cb37aeed1463af9bc134030727a1a2801&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
