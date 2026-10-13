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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YXIO6WHQ%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T220357Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCezDf%2BE3hIL0RrwlmFF%2B4ZbFGuS0UzxJDSpymDyzIhMgIgG6V1IUmceL35UbF5zjORD0kHix9RdM5W4NEA7%2F1NSIgqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMQtKXi9ful%2BYRkXuSrcA3mId6P21HqhylE9dQviQJzEOILUSeCesX6GyZgww3W3P0FiARZFHkBSGkQR%2B2rzFoou7wbRpJa%2Biq%2FS5kw%2B1HIvJZBS4EDYm0EORmHsI%2FgOaYJnDdYL3dIqyuItnQjATCQzshUCE%2FtzSCQ0osRvzv2w6yq6LYWbQGOwba%2FB%2F2Po4K42kEkEKK32b7qo1FTjuqBC97P7VtMqMag9n06RnDHnIiSXXizOgg960Jd4k6T5W3FKnSAI%2FNpBH3hoaa%2ByN9HesVEPOlK2dp1Iv6JPqLZjMB0dSlx0VDX0QUQPw63GHrNzICPt9Jsezsa0OPX%2FpPNTeNYXun4%2Bh0Dp1gn49TCG%2FuYlZRsFdp70ptwUDfmukivHL7tLkS5zmLhfb%2B24L0QEMqm9axdGYQNNafNi3r9ltjnC9tvE32iw8X7e18u8Fspsd2LPU87ZMk4JUlWNO3BqJTXU2AL4zJDZsIkpb98y4P%2BURbfpUjNmbGBl6dpXt%2BU5wfZsxHgkSLTLe9lv%2FuiqfCifTbg35f%2Ba1H4RSakA57VpDSmSUy5ph%2B2qgZzFZBUhwj2vJKn50Hot6PToXiM3bcJhlyeyCv44fIQGjnpGdoNOQabOv90%2BLHdtKVJeSoUWmi3cdGVrcJzcMMvTutYGOqUBfsNN0EMI5sXfHTIkhEm3WwKPuCcdtcBQARup63bLzg1%2FjcgURyIDHUClWcrPHLQSNvr4NtajozUdXFEvKcWbQ%2BOgQtX2ObGB2UU5Soz%2BLpcSWlopump4wsgxvDQcvphocIeqHKhQrDlNE4gRcwvsRcGy6XaN%2FscSEQOcVtkS5U59jiVZYhUVfOvwdpl4iws%2F%2F%2B0FexjuXb5QzaZnSK1hxu%2FasCRH&X-Amz-Signature=1c5468f0aaf16ec6f5d02a95f704ce392fcc25680c4f1640a87c7712b979f841&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YXIO6WHQ%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T220357Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCezDf%2BE3hIL0RrwlmFF%2B4ZbFGuS0UzxJDSpymDyzIhMgIgG6V1IUmceL35UbF5zjORD0kHix9RdM5W4NEA7%2F1NSIgqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMQtKXi9ful%2BYRkXuSrcA3mId6P21HqhylE9dQviQJzEOILUSeCesX6GyZgww3W3P0FiARZFHkBSGkQR%2B2rzFoou7wbRpJa%2Biq%2FS5kw%2B1HIvJZBS4EDYm0EORmHsI%2FgOaYJnDdYL3dIqyuItnQjATCQzshUCE%2FtzSCQ0osRvzv2w6yq6LYWbQGOwba%2FB%2F2Po4K42kEkEKK32b7qo1FTjuqBC97P7VtMqMag9n06RnDHnIiSXXizOgg960Jd4k6T5W3FKnSAI%2FNpBH3hoaa%2ByN9HesVEPOlK2dp1Iv6JPqLZjMB0dSlx0VDX0QUQPw63GHrNzICPt9Jsezsa0OPX%2FpPNTeNYXun4%2Bh0Dp1gn49TCG%2FuYlZRsFdp70ptwUDfmukivHL7tLkS5zmLhfb%2B24L0QEMqm9axdGYQNNafNi3r9ltjnC9tvE32iw8X7e18u8Fspsd2LPU87ZMk4JUlWNO3BqJTXU2AL4zJDZsIkpb98y4P%2BURbfpUjNmbGBl6dpXt%2BU5wfZsxHgkSLTLe9lv%2FuiqfCifTbg35f%2Ba1H4RSakA57VpDSmSUy5ph%2B2qgZzFZBUhwj2vJKn50Hot6PToXiM3bcJhlyeyCv44fIQGjnpGdoNOQabOv90%2BLHdtKVJeSoUWmi3cdGVrcJzcMMvTutYGOqUBfsNN0EMI5sXfHTIkhEm3WwKPuCcdtcBQARup63bLzg1%2FjcgURyIDHUClWcrPHLQSNvr4NtajozUdXFEvKcWbQ%2BOgQtX2ObGB2UU5Soz%2BLpcSWlopump4wsgxvDQcvphocIeqHKhQrDlNE4gRcwvsRcGy6XaN%2FscSEQOcVtkS5U59jiVZYhUVfOvwdpl4iws%2F%2F%2B0FexjuXb5QzaZnSK1hxu%2FasCRH&X-Amz-Signature=7066280b828db572c4460c7736e176abadff1bbea1033059e83b3770b6dbd303&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YXIO6WHQ%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T220357Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCezDf%2BE3hIL0RrwlmFF%2B4ZbFGuS0UzxJDSpymDyzIhMgIgG6V1IUmceL35UbF5zjORD0kHix9RdM5W4NEA7%2F1NSIgqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMQtKXi9ful%2BYRkXuSrcA3mId6P21HqhylE9dQviQJzEOILUSeCesX6GyZgww3W3P0FiARZFHkBSGkQR%2B2rzFoou7wbRpJa%2Biq%2FS5kw%2B1HIvJZBS4EDYm0EORmHsI%2FgOaYJnDdYL3dIqyuItnQjATCQzshUCE%2FtzSCQ0osRvzv2w6yq6LYWbQGOwba%2FB%2F2Po4K42kEkEKK32b7qo1FTjuqBC97P7VtMqMag9n06RnDHnIiSXXizOgg960Jd4k6T5W3FKnSAI%2FNpBH3hoaa%2ByN9HesVEPOlK2dp1Iv6JPqLZjMB0dSlx0VDX0QUQPw63GHrNzICPt9Jsezsa0OPX%2FpPNTeNYXun4%2Bh0Dp1gn49TCG%2FuYlZRsFdp70ptwUDfmukivHL7tLkS5zmLhfb%2B24L0QEMqm9axdGYQNNafNi3r9ltjnC9tvE32iw8X7e18u8Fspsd2LPU87ZMk4JUlWNO3BqJTXU2AL4zJDZsIkpb98y4P%2BURbfpUjNmbGBl6dpXt%2BU5wfZsxHgkSLTLe9lv%2FuiqfCifTbg35f%2Ba1H4RSakA57VpDSmSUy5ph%2B2qgZzFZBUhwj2vJKn50Hot6PToXiM3bcJhlyeyCv44fIQGjnpGdoNOQabOv90%2BLHdtKVJeSoUWmi3cdGVrcJzcMMvTutYGOqUBfsNN0EMI5sXfHTIkhEm3WwKPuCcdtcBQARup63bLzg1%2FjcgURyIDHUClWcrPHLQSNvr4NtajozUdXFEvKcWbQ%2BOgQtX2ObGB2UU5Soz%2BLpcSWlopump4wsgxvDQcvphocIeqHKhQrDlNE4gRcwvsRcGy6XaN%2FscSEQOcVtkS5U59jiVZYhUVfOvwdpl4iws%2F%2F%2B0FexjuXb5QzaZnSK1hxu%2FasCRH&X-Amz-Signature=4938a500bfa0bad1aa6a114dd47f8df0ff3e968248aad1b87eb69938abd80b46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YXIO6WHQ%2F20261013%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261013T220357Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCezDf%2BE3hIL0RrwlmFF%2B4ZbFGuS0UzxJDSpymDyzIhMgIgG6V1IUmceL35UbF5zjORD0kHix9RdM5W4NEA7%2F1NSIgqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMQtKXi9ful%2BYRkXuSrcA3mId6P21HqhylE9dQviQJzEOILUSeCesX6GyZgww3W3P0FiARZFHkBSGkQR%2B2rzFoou7wbRpJa%2Biq%2FS5kw%2B1HIvJZBS4EDYm0EORmHsI%2FgOaYJnDdYL3dIqyuItnQjATCQzshUCE%2FtzSCQ0osRvzv2w6yq6LYWbQGOwba%2FB%2F2Po4K42kEkEKK32b7qo1FTjuqBC97P7VtMqMag9n06RnDHnIiSXXizOgg960Jd4k6T5W3FKnSAI%2FNpBH3hoaa%2ByN9HesVEPOlK2dp1Iv6JPqLZjMB0dSlx0VDX0QUQPw63GHrNzICPt9Jsezsa0OPX%2FpPNTeNYXun4%2Bh0Dp1gn49TCG%2FuYlZRsFdp70ptwUDfmukivHL7tLkS5zmLhfb%2B24L0QEMqm9axdGYQNNafNi3r9ltjnC9tvE32iw8X7e18u8Fspsd2LPU87ZMk4JUlWNO3BqJTXU2AL4zJDZsIkpb98y4P%2BURbfpUjNmbGBl6dpXt%2BU5wfZsxHgkSLTLe9lv%2FuiqfCifTbg35f%2Ba1H4RSakA57VpDSmSUy5ph%2B2qgZzFZBUhwj2vJKn50Hot6PToXiM3bcJhlyeyCv44fIQGjnpGdoNOQabOv90%2BLHdtKVJeSoUWmi3cdGVrcJzcMMvTutYGOqUBfsNN0EMI5sXfHTIkhEm3WwKPuCcdtcBQARup63bLzg1%2FjcgURyIDHUClWcrPHLQSNvr4NtajozUdXFEvKcWbQ%2BOgQtX2ObGB2UU5Soz%2BLpcSWlopump4wsgxvDQcvphocIeqHKhQrDlNE4gRcwvsRcGy6XaN%2FscSEQOcVtkS5U59jiVZYhUVfOvwdpl4iws%2F%2F%2B0FexjuXb5QzaZnSK1hxu%2FasCRH&X-Amz-Signature=feff8d541d6d44ed2ab748bde52688b756a6806e5467923fc2f131311e946488&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
