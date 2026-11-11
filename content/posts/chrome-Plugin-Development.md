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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZ3MN75B%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T130916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDXGSaBZcU%2FBTvHVNXe4L%2BZqoGx0GwQVwMiJfrtitR0iAIhAMQnIvRbVQ9WvNK7232wmHWiCg0Qsy%2BDh%2BqQjbAnhZVWKv8DCFUQABoMNjM3NDIzMTgzODA1Igz3ebY3JFNUAynXa5gq3AN7YcwqSXBW2HddOnyS8aDGjUNmwuqWYS%2BvlLTglLtSsxSkgSq3bqgkMoGeefgj2hsWbNfTioja9SGb1zXkTi5HlTH72J2MQWOTP7pktIkFzlD43xyrGa%2B2hdz4A09AlA4AINnm6tTRbg3yMoDL1phVKgSDxohva42NRrz6O2GcKNTqv%2B5%2F6BmNVwRfNedW6822PlMzil%2Btz6ZY2IvNAScSJvXyLty7rLCuM0boegwjCmI9JzNxgupe%2BrJequ%2F%2BRnm8rXHDjhAfRg1U45pzVSqYv5mlg7hH2F0myiltGxeXYb4VyrRYbB8unw8Q2PNCR4GAbiExWQvku8Pg9S8HZrlFMC3menzNHfveeghRcRTup28Kkcea4ETHdH%2BFGgTCR63Ch3OKdpfnVJY6SM%2FpFc42bacx6k1r8vc%2BkBy8C3VhDMU4yIThANYwGgwOXaaZaJHucF0Mlx8sSaeeraugYE0ur2q%2FP3D70DI%2FclQKmbXPKGmuSmMp1AG%2FhEIZ%2FS8QGvRR9x%2Bg1AQ9uP%2Fs8Bt3tGjQRDAn%2FsuXVDy4WwimEGDkYbOabQ5E3gbWdC00ukgbduhT7Zfd3Msuu7KmYA7kGswVB39MIoyJxVmpA7EmCXMDu7dsz86sqm39McLk%2BTCkqNHXBjqkAVVcJ4CYGlahhqV9crFLaPF5dMNgrNbm8LdWMlmKMKNjSZp%2F%2BYXKW7IM%2BbjQZCvET7jkfKHphPbEn4LY5%2Fqa2AEPlT%2Feg%2FfDi6ZJs78EerDYTN2xh2%2Brua8ixxtHG1Lp3m63llQX5BAhhiQKtsxHyRcc8sxggZTKBTV8vx%2BcPslHrHZtE9Gh2NxiwNMHuWQTECg3DQ4H24wSGyMj7Bv0uk3ZdGyZ&X-Amz-Signature=631896aa7e114a6f51033d8db5591983e403a98cffa715df7fd3390372d831f5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZ3MN75B%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T130916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDXGSaBZcU%2FBTvHVNXe4L%2BZqoGx0GwQVwMiJfrtitR0iAIhAMQnIvRbVQ9WvNK7232wmHWiCg0Qsy%2BDh%2BqQjbAnhZVWKv8DCFUQABoMNjM3NDIzMTgzODA1Igz3ebY3JFNUAynXa5gq3AN7YcwqSXBW2HddOnyS8aDGjUNmwuqWYS%2BvlLTglLtSsxSkgSq3bqgkMoGeefgj2hsWbNfTioja9SGb1zXkTi5HlTH72J2MQWOTP7pktIkFzlD43xyrGa%2B2hdz4A09AlA4AINnm6tTRbg3yMoDL1phVKgSDxohva42NRrz6O2GcKNTqv%2B5%2F6BmNVwRfNedW6822PlMzil%2Btz6ZY2IvNAScSJvXyLty7rLCuM0boegwjCmI9JzNxgupe%2BrJequ%2F%2BRnm8rXHDjhAfRg1U45pzVSqYv5mlg7hH2F0myiltGxeXYb4VyrRYbB8unw8Q2PNCR4GAbiExWQvku8Pg9S8HZrlFMC3menzNHfveeghRcRTup28Kkcea4ETHdH%2BFGgTCR63Ch3OKdpfnVJY6SM%2FpFc42bacx6k1r8vc%2BkBy8C3VhDMU4yIThANYwGgwOXaaZaJHucF0Mlx8sSaeeraugYE0ur2q%2FP3D70DI%2FclQKmbXPKGmuSmMp1AG%2FhEIZ%2FS8QGvRR9x%2Bg1AQ9uP%2Fs8Bt3tGjQRDAn%2FsuXVDy4WwimEGDkYbOabQ5E3gbWdC00ukgbduhT7Zfd3Msuu7KmYA7kGswVB39MIoyJxVmpA7EmCXMDu7dsz86sqm39McLk%2BTCkqNHXBjqkAVVcJ4CYGlahhqV9crFLaPF5dMNgrNbm8LdWMlmKMKNjSZp%2F%2BYXKW7IM%2BbjQZCvET7jkfKHphPbEn4LY5%2Fqa2AEPlT%2Feg%2FfDi6ZJs78EerDYTN2xh2%2Brua8ixxtHG1Lp3m63llQX5BAhhiQKtsxHyRcc8sxggZTKBTV8vx%2BcPslHrHZtE9Gh2NxiwNMHuWQTECg3DQ4H24wSGyMj7Bv0uk3ZdGyZ&X-Amz-Signature=37f6e591093b300c8c0ad78abfded396a35a26472dd5aa2ef14eccb417db9c6b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZ3MN75B%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T130916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDXGSaBZcU%2FBTvHVNXe4L%2BZqoGx0GwQVwMiJfrtitR0iAIhAMQnIvRbVQ9WvNK7232wmHWiCg0Qsy%2BDh%2BqQjbAnhZVWKv8DCFUQABoMNjM3NDIzMTgzODA1Igz3ebY3JFNUAynXa5gq3AN7YcwqSXBW2HddOnyS8aDGjUNmwuqWYS%2BvlLTglLtSsxSkgSq3bqgkMoGeefgj2hsWbNfTioja9SGb1zXkTi5HlTH72J2MQWOTP7pktIkFzlD43xyrGa%2B2hdz4A09AlA4AINnm6tTRbg3yMoDL1phVKgSDxohva42NRrz6O2GcKNTqv%2B5%2F6BmNVwRfNedW6822PlMzil%2Btz6ZY2IvNAScSJvXyLty7rLCuM0boegwjCmI9JzNxgupe%2BrJequ%2F%2BRnm8rXHDjhAfRg1U45pzVSqYv5mlg7hH2F0myiltGxeXYb4VyrRYbB8unw8Q2PNCR4GAbiExWQvku8Pg9S8HZrlFMC3menzNHfveeghRcRTup28Kkcea4ETHdH%2BFGgTCR63Ch3OKdpfnVJY6SM%2FpFc42bacx6k1r8vc%2BkBy8C3VhDMU4yIThANYwGgwOXaaZaJHucF0Mlx8sSaeeraugYE0ur2q%2FP3D70DI%2FclQKmbXPKGmuSmMp1AG%2FhEIZ%2FS8QGvRR9x%2Bg1AQ9uP%2Fs8Bt3tGjQRDAn%2FsuXVDy4WwimEGDkYbOabQ5E3gbWdC00ukgbduhT7Zfd3Msuu7KmYA7kGswVB39MIoyJxVmpA7EmCXMDu7dsz86sqm39McLk%2BTCkqNHXBjqkAVVcJ4CYGlahhqV9crFLaPF5dMNgrNbm8LdWMlmKMKNjSZp%2F%2BYXKW7IM%2BbjQZCvET7jkfKHphPbEn4LY5%2Fqa2AEPlT%2Feg%2FfDi6ZJs78EerDYTN2xh2%2Brua8ixxtHG1Lp3m63llQX5BAhhiQKtsxHyRcc8sxggZTKBTV8vx%2BcPslHrHZtE9Gh2NxiwNMHuWQTECg3DQ4H24wSGyMj7Bv0uk3ZdGyZ&X-Amz-Signature=9f637e87e9a69b39a0fff6d3fc6b473d8e8d98a497747ff84418a2be67017879&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UZ3MN75B%2F20261111%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261111T130916Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDXGSaBZcU%2FBTvHVNXe4L%2BZqoGx0GwQVwMiJfrtitR0iAIhAMQnIvRbVQ9WvNK7232wmHWiCg0Qsy%2BDh%2BqQjbAnhZVWKv8DCFUQABoMNjM3NDIzMTgzODA1Igz3ebY3JFNUAynXa5gq3AN7YcwqSXBW2HddOnyS8aDGjUNmwuqWYS%2BvlLTglLtSsxSkgSq3bqgkMoGeefgj2hsWbNfTioja9SGb1zXkTi5HlTH72J2MQWOTP7pktIkFzlD43xyrGa%2B2hdz4A09AlA4AINnm6tTRbg3yMoDL1phVKgSDxohva42NRrz6O2GcKNTqv%2B5%2F6BmNVwRfNedW6822PlMzil%2Btz6ZY2IvNAScSJvXyLty7rLCuM0boegwjCmI9JzNxgupe%2BrJequ%2F%2BRnm8rXHDjhAfRg1U45pzVSqYv5mlg7hH2F0myiltGxeXYb4VyrRYbB8unw8Q2PNCR4GAbiExWQvku8Pg9S8HZrlFMC3menzNHfveeghRcRTup28Kkcea4ETHdH%2BFGgTCR63Ch3OKdpfnVJY6SM%2FpFc42bacx6k1r8vc%2BkBy8C3VhDMU4yIThANYwGgwOXaaZaJHucF0Mlx8sSaeeraugYE0ur2q%2FP3D70DI%2FclQKmbXPKGmuSmMp1AG%2FhEIZ%2FS8QGvRR9x%2Bg1AQ9uP%2Fs8Bt3tGjQRDAn%2FsuXVDy4WwimEGDkYbOabQ5E3gbWdC00ukgbduhT7Zfd3Msuu7KmYA7kGswVB39MIoyJxVmpA7EmCXMDu7dsz86sqm39McLk%2BTCkqNHXBjqkAVVcJ4CYGlahhqV9crFLaPF5dMNgrNbm8LdWMlmKMKNjSZp%2F%2BYXKW7IM%2BbjQZCvET7jkfKHphPbEn4LY5%2Fqa2AEPlT%2Feg%2FfDi6ZJs78EerDYTN2xh2%2Brua8ixxtHG1Lp3m63llQX5BAhhiQKtsxHyRcc8sxggZTKBTV8vx%2BcPslHrHZtE9Gh2NxiwNMHuWQTECg3DQ4H24wSGyMj7Bv0uk3ZdGyZ&X-Amz-Signature=d183a7e8465da72cbe8bce8e9fd4f6963fb903864b2a016bdce6a54acd3ded99&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
