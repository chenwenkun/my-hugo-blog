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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JP7OVZZ%2F20261001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261001T220613Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCkvz13hUN94ucaj1JmsOqPtMlqUwxb1wroNsgZEmb9LgIgOwTXusXwQqYXl9uga0X%2Bh%2Bbm%2F5EOVFILJlA0Nq9lZtQqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzxSHx0OHkT6lxaXCrcAwWJqxoRfq%2BoeR9rYeDr9D8jmWg8AlBhZWI7xE%2Bf65PlCzSMsgxSt8Uvyp0N8hORcNF1NZoVUCgqMZiP4P9mgU4aPqSyqTTBMdLr8M5kp8iSYVzy45UeiZByQP8E46ShJUUhZjQrpm39hC5S1LXedaO643dBTON14U5eHE40WNvsPXiriGLMO4ec34Ce3p8%2FnyDl5nlPXPEZET8wmZ%2B0lV7DUTOEHAzDvxiytAdIAhA1r7v0RL9Dmu1YiDCLr00hPfZj3qsuMoXQzDQ0L1jfWQiv0lQIjaJUQEw3YrFj%2FyPZjK%2F4GDwPcOLR2nTmstWyw2kpi6SGqoeRE5kBmw1B%2Fdn6u0%2Fxn8OF3noDn94HU5OmzyHhaezsLADGARZRUQDMBtZ6JQ4bnSUcHdHrheaAs%2FbdsP7gezqgRhSat5659vtUeVeu1uAAskksrKieZZkA%2BxTZZgiSGjU3iGDPQjyG8jB83eKXTDOpVZW43VySaLFo8N0m0lb%2F23taxd5XY6nWEKIPg%2FgJHaBJtw7KZWt3beqWoRcra6%2F%2FyJF%2Fu99FaQdHSr6IGSv9p0ENPklnYRgKLreQ7UTR0l79ia2mKRyzj%2FEmY8ZiOtkFpgYkyoFPF6O%2FETtV%2F4YPxgwhyvjfMNmk%2B9UGOqUB3yurfOsgOWDEfXcv0cI03KR%2B6w6Ho8GfDgOL%2F%2F4AiELJeB7cCmxcn1GpsAwFj5BkCp8ydYKMo7DdTw2gX6VEVUDevH%2BOzaOApGIqhb9JHZXyeKVFP3IDn4nTqaTnS4KQFLGKrlGK8%2BqQVOSghSJiQT4lh3Bq5kTV0ZKu9Z%2Ffxtp%2FPt5VK4pSmXiY8dqhCbfuOfkvBr9c%2FnJQSgrXXki8lTOwpzrz&X-Amz-Signature=81bdb6d2d686da9cc2a14d22105733384f7557caf13458a3eefaf095572c6fd7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JP7OVZZ%2F20261001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261001T220613Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCkvz13hUN94ucaj1JmsOqPtMlqUwxb1wroNsgZEmb9LgIgOwTXusXwQqYXl9uga0X%2Bh%2Bbm%2F5EOVFILJlA0Nq9lZtQqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzxSHx0OHkT6lxaXCrcAwWJqxoRfq%2BoeR9rYeDr9D8jmWg8AlBhZWI7xE%2Bf65PlCzSMsgxSt8Uvyp0N8hORcNF1NZoVUCgqMZiP4P9mgU4aPqSyqTTBMdLr8M5kp8iSYVzy45UeiZByQP8E46ShJUUhZjQrpm39hC5S1LXedaO643dBTON14U5eHE40WNvsPXiriGLMO4ec34Ce3p8%2FnyDl5nlPXPEZET8wmZ%2B0lV7DUTOEHAzDvxiytAdIAhA1r7v0RL9Dmu1YiDCLr00hPfZj3qsuMoXQzDQ0L1jfWQiv0lQIjaJUQEw3YrFj%2FyPZjK%2F4GDwPcOLR2nTmstWyw2kpi6SGqoeRE5kBmw1B%2Fdn6u0%2Fxn8OF3noDn94HU5OmzyHhaezsLADGARZRUQDMBtZ6JQ4bnSUcHdHrheaAs%2FbdsP7gezqgRhSat5659vtUeVeu1uAAskksrKieZZkA%2BxTZZgiSGjU3iGDPQjyG8jB83eKXTDOpVZW43VySaLFo8N0m0lb%2F23taxd5XY6nWEKIPg%2FgJHaBJtw7KZWt3beqWoRcra6%2F%2FyJF%2Fu99FaQdHSr6IGSv9p0ENPklnYRgKLreQ7UTR0l79ia2mKRyzj%2FEmY8ZiOtkFpgYkyoFPF6O%2FETtV%2F4YPxgwhyvjfMNmk%2B9UGOqUB3yurfOsgOWDEfXcv0cI03KR%2B6w6Ho8GfDgOL%2F%2F4AiELJeB7cCmxcn1GpsAwFj5BkCp8ydYKMo7DdTw2gX6VEVUDevH%2BOzaOApGIqhb9JHZXyeKVFP3IDn4nTqaTnS4KQFLGKrlGK8%2BqQVOSghSJiQT4lh3Bq5kTV0ZKu9Z%2Ffxtp%2FPt5VK4pSmXiY8dqhCbfuOfkvBr9c%2FnJQSgrXXki8lTOwpzrz&X-Amz-Signature=c767333854df5345946a9c0ec64e0a7ce22ab85366160acbb2a10cc48ee38087&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JP7OVZZ%2F20261001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261001T220613Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCkvz13hUN94ucaj1JmsOqPtMlqUwxb1wroNsgZEmb9LgIgOwTXusXwQqYXl9uga0X%2Bh%2Bbm%2F5EOVFILJlA0Nq9lZtQqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzxSHx0OHkT6lxaXCrcAwWJqxoRfq%2BoeR9rYeDr9D8jmWg8AlBhZWI7xE%2Bf65PlCzSMsgxSt8Uvyp0N8hORcNF1NZoVUCgqMZiP4P9mgU4aPqSyqTTBMdLr8M5kp8iSYVzy45UeiZByQP8E46ShJUUhZjQrpm39hC5S1LXedaO643dBTON14U5eHE40WNvsPXiriGLMO4ec34Ce3p8%2FnyDl5nlPXPEZET8wmZ%2B0lV7DUTOEHAzDvxiytAdIAhA1r7v0RL9Dmu1YiDCLr00hPfZj3qsuMoXQzDQ0L1jfWQiv0lQIjaJUQEw3YrFj%2FyPZjK%2F4GDwPcOLR2nTmstWyw2kpi6SGqoeRE5kBmw1B%2Fdn6u0%2Fxn8OF3noDn94HU5OmzyHhaezsLADGARZRUQDMBtZ6JQ4bnSUcHdHrheaAs%2FbdsP7gezqgRhSat5659vtUeVeu1uAAskksrKieZZkA%2BxTZZgiSGjU3iGDPQjyG8jB83eKXTDOpVZW43VySaLFo8N0m0lb%2F23taxd5XY6nWEKIPg%2FgJHaBJtw7KZWt3beqWoRcra6%2F%2FyJF%2Fu99FaQdHSr6IGSv9p0ENPklnYRgKLreQ7UTR0l79ia2mKRyzj%2FEmY8ZiOtkFpgYkyoFPF6O%2FETtV%2F4YPxgwhyvjfMNmk%2B9UGOqUB3yurfOsgOWDEfXcv0cI03KR%2B6w6Ho8GfDgOL%2F%2F4AiELJeB7cCmxcn1GpsAwFj5BkCp8ydYKMo7DdTw2gX6VEVUDevH%2BOzaOApGIqhb9JHZXyeKVFP3IDn4nTqaTnS4KQFLGKrlGK8%2BqQVOSghSJiQT4lh3Bq5kTV0ZKu9Z%2Ffxtp%2FPt5VK4pSmXiY8dqhCbfuOfkvBr9c%2FnJQSgrXXki8lTOwpzrz&X-Amz-Signature=347889bce899e9659fe723ac17bb5b40d0d26d7df7df64087601e7872b0b7d86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JP7OVZZ%2F20261001%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261001T220613Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCkvz13hUN94ucaj1JmsOqPtMlqUwxb1wroNsgZEmb9LgIgOwTXusXwQqYXl9uga0X%2Bh%2Bbm%2F5EOVFILJlA0Nq9lZtQqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzxSHx0OHkT6lxaXCrcAwWJqxoRfq%2BoeR9rYeDr9D8jmWg8AlBhZWI7xE%2Bf65PlCzSMsgxSt8Uvyp0N8hORcNF1NZoVUCgqMZiP4P9mgU4aPqSyqTTBMdLr8M5kp8iSYVzy45UeiZByQP8E46ShJUUhZjQrpm39hC5S1LXedaO643dBTON14U5eHE40WNvsPXiriGLMO4ec34Ce3p8%2FnyDl5nlPXPEZET8wmZ%2B0lV7DUTOEHAzDvxiytAdIAhA1r7v0RL9Dmu1YiDCLr00hPfZj3qsuMoXQzDQ0L1jfWQiv0lQIjaJUQEw3YrFj%2FyPZjK%2F4GDwPcOLR2nTmstWyw2kpi6SGqoeRE5kBmw1B%2Fdn6u0%2Fxn8OF3noDn94HU5OmzyHhaezsLADGARZRUQDMBtZ6JQ4bnSUcHdHrheaAs%2FbdsP7gezqgRhSat5659vtUeVeu1uAAskksrKieZZkA%2BxTZZgiSGjU3iGDPQjyG8jB83eKXTDOpVZW43VySaLFo8N0m0lb%2F23taxd5XY6nWEKIPg%2FgJHaBJtw7KZWt3beqWoRcra6%2F%2FyJF%2Fu99FaQdHSr6IGSv9p0ENPklnYRgKLreQ7UTR0l79ia2mKRyzj%2FEmY8ZiOtkFpgYkyoFPF6O%2FETtV%2F4YPxgwhyvjfMNmk%2B9UGOqUB3yurfOsgOWDEfXcv0cI03KR%2B6w6Ho8GfDgOL%2F%2F4AiELJeB7cCmxcn1GpsAwFj5BkCp8ydYKMo7DdTw2gX6VEVUDevH%2BOzaOApGIqhb9JHZXyeKVFP3IDn4nTqaTnS4KQFLGKrlGK8%2BqQVOSghSJiQT4lh3Bq5kTV0ZKu9Z%2Ffxtp%2FPt5VK4pSmXiY8dqhCbfuOfkvBr9c%2FnJQSgrXXki8lTOwpzrz&X-Amz-Signature=edca09f5381de9b8a18b1fcd6223b41eb63eaa1e9f06a982311128b45154f7e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
