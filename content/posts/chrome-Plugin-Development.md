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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V33OW36X%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T015817Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJIMEYCIQDqnhbwCD4mUOnXl9GVoIsz4zy%2B2PkEV2IfACqqmYmjoQIhAO0WvhOGz0kxnrY1XpYxKZRmDvMzoavC9xzho9almm3bKogECOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyp2Dbu%2FLr424d3j4Mq3APNRKRcAatNWbPhWyq2H1snQUGY7pnK4gkefrCsx5U4mitJFODIjLnYL%2F3rtanc5RrmWM9h%2Bghzhfu3N0YMlYv1WA0POCwtDM9XL8uyDNCSdERr%2BQCyRztHWiIZGA0OUSqjv%2B3kfHJWygOPwsdVWsR2vRAVbYAXudRhLAuP6lPcEOHmQ2ma7LUeGcFKwdPaJ98lCoc6FyD%2Bt2vVCTFutc8WyuJriKWPzJkcWFn9n%2BZV6QtAhGy%2BC0y36BTYKUnJw%2BSVlR%2B6nIgcJ%2FN4%2ByK1ANMMP3tWEeczvPbAjAZAVdM%2FL3AHw4KjY6ZDKajcGuhSgzOZtT8S7t%2FL2cjoK891hhxiqqmBDGBhS93zF13aPYh1utPCcSVWITNyxnR7YWJ8dpu0YNTGFYuYqSCUEVqdievqJ6J%2FzavH%2FFGG6o4IkdtVoEx6iEMhhUgqdaLrPPdqXk2jz%2B8hExnB51LaqgbZqTxpX1y5PEpjpaWfyFR8WphmxVJp3gYUycpzN12NLLlAX6t7r8CsghpTeIqcBJY15jDWZmFA5aeAb%2B%2BWQhb%2FEML7L5TrZWOwC7xBImCqVPNgEIydf0dAg77HhSiwEamBwTOBfC9dbXL%2FdQCKKeZY%2BtxBfXeZz%2FLQiuSB62hrmjDcpejUBjqkARouE%2Fnlcjc5vyknc6tUDEZr42DKBMFgJN3rlXzfJ7Nw8g%2BXQxn5psG1HdjgO06sXzh8xf%2BLWh4lH89vuTZGZFp7io3xW2FkIB20eXFO2FNbhwrfxCxQR78iJTRZBvYRKj6zca4EzSEEvDVv03MgSJ5R0%2BngKXjJnIg%2B5pfUu1qKqPPNC6JJleFaXRFCj7EATciy9RbKYxeKrjVPAcQqBHUGC%2F0f&X-Amz-Signature=cc0eadfdb19704ba2f6555565457c6a7224ccaa07c630fe570b67feb1cf20a2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V33OW36X%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T015817Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJIMEYCIQDqnhbwCD4mUOnXl9GVoIsz4zy%2B2PkEV2IfACqqmYmjoQIhAO0WvhOGz0kxnrY1XpYxKZRmDvMzoavC9xzho9almm3bKogECOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyp2Dbu%2FLr424d3j4Mq3APNRKRcAatNWbPhWyq2H1snQUGY7pnK4gkefrCsx5U4mitJFODIjLnYL%2F3rtanc5RrmWM9h%2Bghzhfu3N0YMlYv1WA0POCwtDM9XL8uyDNCSdERr%2BQCyRztHWiIZGA0OUSqjv%2B3kfHJWygOPwsdVWsR2vRAVbYAXudRhLAuP6lPcEOHmQ2ma7LUeGcFKwdPaJ98lCoc6FyD%2Bt2vVCTFutc8WyuJriKWPzJkcWFn9n%2BZV6QtAhGy%2BC0y36BTYKUnJw%2BSVlR%2B6nIgcJ%2FN4%2ByK1ANMMP3tWEeczvPbAjAZAVdM%2FL3AHw4KjY6ZDKajcGuhSgzOZtT8S7t%2FL2cjoK891hhxiqqmBDGBhS93zF13aPYh1utPCcSVWITNyxnR7YWJ8dpu0YNTGFYuYqSCUEVqdievqJ6J%2FzavH%2FFGG6o4IkdtVoEx6iEMhhUgqdaLrPPdqXk2jz%2B8hExnB51LaqgbZqTxpX1y5PEpjpaWfyFR8WphmxVJp3gYUycpzN12NLLlAX6t7r8CsghpTeIqcBJY15jDWZmFA5aeAb%2B%2BWQhb%2FEML7L5TrZWOwC7xBImCqVPNgEIydf0dAg77HhSiwEamBwTOBfC9dbXL%2FdQCKKeZY%2BtxBfXeZz%2FLQiuSB62hrmjDcpejUBjqkARouE%2Fnlcjc5vyknc6tUDEZr42DKBMFgJN3rlXzfJ7Nw8g%2BXQxn5psG1HdjgO06sXzh8xf%2BLWh4lH89vuTZGZFp7io3xW2FkIB20eXFO2FNbhwrfxCxQR78iJTRZBvYRKj6zca4EzSEEvDVv03MgSJ5R0%2BngKXjJnIg%2B5pfUu1qKqPPNC6JJleFaXRFCj7EATciy9RbKYxeKrjVPAcQqBHUGC%2F0f&X-Amz-Signature=fec40b0170da7cbf8c2357f5451da6307e7d9a0bd00813c8cf0956a930935e43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V33OW36X%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T015817Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJIMEYCIQDqnhbwCD4mUOnXl9GVoIsz4zy%2B2PkEV2IfACqqmYmjoQIhAO0WvhOGz0kxnrY1XpYxKZRmDvMzoavC9xzho9almm3bKogECOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyp2Dbu%2FLr424d3j4Mq3APNRKRcAatNWbPhWyq2H1snQUGY7pnK4gkefrCsx5U4mitJFODIjLnYL%2F3rtanc5RrmWM9h%2Bghzhfu3N0YMlYv1WA0POCwtDM9XL8uyDNCSdERr%2BQCyRztHWiIZGA0OUSqjv%2B3kfHJWygOPwsdVWsR2vRAVbYAXudRhLAuP6lPcEOHmQ2ma7LUeGcFKwdPaJ98lCoc6FyD%2Bt2vVCTFutc8WyuJriKWPzJkcWFn9n%2BZV6QtAhGy%2BC0y36BTYKUnJw%2BSVlR%2B6nIgcJ%2FN4%2ByK1ANMMP3tWEeczvPbAjAZAVdM%2FL3AHw4KjY6ZDKajcGuhSgzOZtT8S7t%2FL2cjoK891hhxiqqmBDGBhS93zF13aPYh1utPCcSVWITNyxnR7YWJ8dpu0YNTGFYuYqSCUEVqdievqJ6J%2FzavH%2FFGG6o4IkdtVoEx6iEMhhUgqdaLrPPdqXk2jz%2B8hExnB51LaqgbZqTxpX1y5PEpjpaWfyFR8WphmxVJp3gYUycpzN12NLLlAX6t7r8CsghpTeIqcBJY15jDWZmFA5aeAb%2B%2BWQhb%2FEML7L5TrZWOwC7xBImCqVPNgEIydf0dAg77HhSiwEamBwTOBfC9dbXL%2FdQCKKeZY%2BtxBfXeZz%2FLQiuSB62hrmjDcpejUBjqkARouE%2Fnlcjc5vyknc6tUDEZr42DKBMFgJN3rlXzfJ7Nw8g%2BXQxn5psG1HdjgO06sXzh8xf%2BLWh4lH89vuTZGZFp7io3xW2FkIB20eXFO2FNbhwrfxCxQR78iJTRZBvYRKj6zca4EzSEEvDVv03MgSJ5R0%2BngKXjJnIg%2B5pfUu1qKqPPNC6JJleFaXRFCj7EATciy9RbKYxeKrjVPAcQqBHUGC%2F0f&X-Amz-Signature=def441090ae337c931f74a5fe882e930be56f0e8ae165eaeed6d2fef9d01933e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V33OW36X%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T015817Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECEaCXVzLXdlc3QtMiJIMEYCIQDqnhbwCD4mUOnXl9GVoIsz4zy%2B2PkEV2IfACqqmYmjoQIhAO0WvhOGz0kxnrY1XpYxKZRmDvMzoavC9xzho9almm3bKogECOr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igyp2Dbu%2FLr424d3j4Mq3APNRKRcAatNWbPhWyq2H1snQUGY7pnK4gkefrCsx5U4mitJFODIjLnYL%2F3rtanc5RrmWM9h%2Bghzhfu3N0YMlYv1WA0POCwtDM9XL8uyDNCSdERr%2BQCyRztHWiIZGA0OUSqjv%2B3kfHJWygOPwsdVWsR2vRAVbYAXudRhLAuP6lPcEOHmQ2ma7LUeGcFKwdPaJ98lCoc6FyD%2Bt2vVCTFutc8WyuJriKWPzJkcWFn9n%2BZV6QtAhGy%2BC0y36BTYKUnJw%2BSVlR%2B6nIgcJ%2FN4%2ByK1ANMMP3tWEeczvPbAjAZAVdM%2FL3AHw4KjY6ZDKajcGuhSgzOZtT8S7t%2FL2cjoK891hhxiqqmBDGBhS93zF13aPYh1utPCcSVWITNyxnR7YWJ8dpu0YNTGFYuYqSCUEVqdievqJ6J%2FzavH%2FFGG6o4IkdtVoEx6iEMhhUgqdaLrPPdqXk2jz%2B8hExnB51LaqgbZqTxpX1y5PEpjpaWfyFR8WphmxVJp3gYUycpzN12NLLlAX6t7r8CsghpTeIqcBJY15jDWZmFA5aeAb%2B%2BWQhb%2FEML7L5TrZWOwC7xBImCqVPNgEIydf0dAg77HhSiwEamBwTOBfC9dbXL%2FdQCKKeZY%2BtxBfXeZz%2FLQiuSB62hrmjDcpejUBjqkARouE%2Fnlcjc5vyknc6tUDEZr42DKBMFgJN3rlXzfJ7Nw8g%2BXQxn5psG1HdjgO06sXzh8xf%2BLWh4lH89vuTZGZFp7io3xW2FkIB20eXFO2FNbhwrfxCxQR78iJTRZBvYRKj6zca4EzSEEvDVv03MgSJ5R0%2BngKXjJnIg%2B5pfUu1qKqPPNC6JJleFaXRFCj7EATciy9RbKYxeKrjVPAcQqBHUGC%2F0f&X-Amz-Signature=1a42ac0df3e75f3e2c0c619ffb504dc22aec7fd1d7966d591b91c6f17a9c2d9d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
