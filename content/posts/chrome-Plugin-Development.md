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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SH4I4RA7%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T225842Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDk95bfY9kXbQchHitRpsq77TtgnGPIAxVTWT%2B7bK1qaAIgWrbNJlSj7cySWAkhquEeqvjuZq6cFD2CKlUsgqITVcoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBZAsj3bE26oQz398yrcAx9Xxxv%2BDPSoL1DUjfKc5ymMyV1G0TvWE8EtahbiygbaNjh2USe3SqSnJvtjWIs%2FgPebSmli14Iyd%2FMn1mg48HAoGSJ83BS%2B7T8laZkhS1HwUiTjtYVXYBuAKwMlACODNzIUx5wEuS5KN0LusRMRmhmElAanQC%2FdmoUXIPmQGKTzXq3V9pboeCyiQQGs2P63%2FU5D%2FLPeRv%2BShac3WlTxNn8jxkGScQc7myKrTdHuoOa1lKPzhPAktBrdZN3fSHOHJNpquU2z1Ro%2FuyCNW7JnNhH0Co8PI5CM%2BtVnBU0x27N%2FP4fLUDASlJGYheZPVksv%2Bz3Ik8mizhsJ3iQ0hVzMdC3qRQriWItArkJAa9GiXO2ruPq3QTSkyvxux%2FGXFzzF6VOc0spPwBigch7pixzw1gjDJ2W7wB3i7LGo%2FvLPO9cmFCKaxi8VyhfzIeo9wAAaFzO7wN4QM0XQuQK%2FIZ5gXCMIfRwO0I5ZoBCoIGsIdF%2FCNm9UVa%2FMLVDTDincSw6arzEl6oI%2BOSGg%2FxR%2B6Ok5SnVs9lWLr4Tq7OFJRR1gCApaQewwDZOvJ1lCQaVbmQBQ8Z6wutx7yAXpmpXleCxwYy7k69Gty6m01ziFON8gXRhdHFhE33rKXrSvyAI3MKHQrtcGOqUBy8Do362hemHQne0szm8PMU5B1zL9xb29270Fk0PR%2FvD83i5UwUOpg2g8dQ1Wgu4uWNl1zQnRAGxo5FgTn%2F6cOGey%2F0SsmoZLM6KVCRM6qG0S5xYZc%2BlWGEJQnoG%2B5mgAPJg2W%2B6aZirlWBDAejZezWdfoW7GnWlzKe1Q6Lrw7GzI6tKNH2B52lK8tYB53QSo9RbQrSVgOn5cCbjln4ucFh7UVMvS&X-Amz-Signature=0050d8e1a34d42eafdff9663d84b9bc5e495b5003b0e22754dde763a231a3822&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SH4I4RA7%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T225842Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDk95bfY9kXbQchHitRpsq77TtgnGPIAxVTWT%2B7bK1qaAIgWrbNJlSj7cySWAkhquEeqvjuZq6cFD2CKlUsgqITVcoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBZAsj3bE26oQz398yrcAx9Xxxv%2BDPSoL1DUjfKc5ymMyV1G0TvWE8EtahbiygbaNjh2USe3SqSnJvtjWIs%2FgPebSmli14Iyd%2FMn1mg48HAoGSJ83BS%2B7T8laZkhS1HwUiTjtYVXYBuAKwMlACODNzIUx5wEuS5KN0LusRMRmhmElAanQC%2FdmoUXIPmQGKTzXq3V9pboeCyiQQGs2P63%2FU5D%2FLPeRv%2BShac3WlTxNn8jxkGScQc7myKrTdHuoOa1lKPzhPAktBrdZN3fSHOHJNpquU2z1Ro%2FuyCNW7JnNhH0Co8PI5CM%2BtVnBU0x27N%2FP4fLUDASlJGYheZPVksv%2Bz3Ik8mizhsJ3iQ0hVzMdC3qRQriWItArkJAa9GiXO2ruPq3QTSkyvxux%2FGXFzzF6VOc0spPwBigch7pixzw1gjDJ2W7wB3i7LGo%2FvLPO9cmFCKaxi8VyhfzIeo9wAAaFzO7wN4QM0XQuQK%2FIZ5gXCMIfRwO0I5ZoBCoIGsIdF%2FCNm9UVa%2FMLVDTDincSw6arzEl6oI%2BOSGg%2FxR%2B6Ok5SnVs9lWLr4Tq7OFJRR1gCApaQewwDZOvJ1lCQaVbmQBQ8Z6wutx7yAXpmpXleCxwYy7k69Gty6m01ziFON8gXRhdHFhE33rKXrSvyAI3MKHQrtcGOqUBy8Do362hemHQne0szm8PMU5B1zL9xb29270Fk0PR%2FvD83i5UwUOpg2g8dQ1Wgu4uWNl1zQnRAGxo5FgTn%2F6cOGey%2F0SsmoZLM6KVCRM6qG0S5xYZc%2BlWGEJQnoG%2B5mgAPJg2W%2B6aZirlWBDAejZezWdfoW7GnWlzKe1Q6Lrw7GzI6tKNH2B52lK8tYB53QSo9RbQrSVgOn5cCbjln4ucFh7UVMvS&X-Amz-Signature=4d1b4c81f908adc36ed92b9c7391be1a1c7054875a6502628b7a8603c1f45d16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SH4I4RA7%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T225842Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDk95bfY9kXbQchHitRpsq77TtgnGPIAxVTWT%2B7bK1qaAIgWrbNJlSj7cySWAkhquEeqvjuZq6cFD2CKlUsgqITVcoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBZAsj3bE26oQz398yrcAx9Xxxv%2BDPSoL1DUjfKc5ymMyV1G0TvWE8EtahbiygbaNjh2USe3SqSnJvtjWIs%2FgPebSmli14Iyd%2FMn1mg48HAoGSJ83BS%2B7T8laZkhS1HwUiTjtYVXYBuAKwMlACODNzIUx5wEuS5KN0LusRMRmhmElAanQC%2FdmoUXIPmQGKTzXq3V9pboeCyiQQGs2P63%2FU5D%2FLPeRv%2BShac3WlTxNn8jxkGScQc7myKrTdHuoOa1lKPzhPAktBrdZN3fSHOHJNpquU2z1Ro%2FuyCNW7JnNhH0Co8PI5CM%2BtVnBU0x27N%2FP4fLUDASlJGYheZPVksv%2Bz3Ik8mizhsJ3iQ0hVzMdC3qRQriWItArkJAa9GiXO2ruPq3QTSkyvxux%2FGXFzzF6VOc0spPwBigch7pixzw1gjDJ2W7wB3i7LGo%2FvLPO9cmFCKaxi8VyhfzIeo9wAAaFzO7wN4QM0XQuQK%2FIZ5gXCMIfRwO0I5ZoBCoIGsIdF%2FCNm9UVa%2FMLVDTDincSw6arzEl6oI%2BOSGg%2FxR%2B6Ok5SnVs9lWLr4Tq7OFJRR1gCApaQewwDZOvJ1lCQaVbmQBQ8Z6wutx7yAXpmpXleCxwYy7k69Gty6m01ziFON8gXRhdHFhE33rKXrSvyAI3MKHQrtcGOqUBy8Do362hemHQne0szm8PMU5B1zL9xb29270Fk0PR%2FvD83i5UwUOpg2g8dQ1Wgu4uWNl1zQnRAGxo5FgTn%2F6cOGey%2F0SsmoZLM6KVCRM6qG0S5xYZc%2BlWGEJQnoG%2B5mgAPJg2W%2B6aZirlWBDAejZezWdfoW7GnWlzKe1Q6Lrw7GzI6tKNH2B52lK8tYB53QSo9RbQrSVgOn5cCbjln4ucFh7UVMvS&X-Amz-Signature=55435dd282fcab0a702803c463b10c3088efbfbe3458535b5c677c69a3dcb616&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SH4I4RA7%2F20261104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261104T225842Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDk95bfY9kXbQchHitRpsq77TtgnGPIAxVTWT%2B7bK1qaAIgWrbNJlSj7cySWAkhquEeqvjuZq6cFD2CKlUsgqITVcoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBZAsj3bE26oQz398yrcAx9Xxxv%2BDPSoL1DUjfKc5ymMyV1G0TvWE8EtahbiygbaNjh2USe3SqSnJvtjWIs%2FgPebSmli14Iyd%2FMn1mg48HAoGSJ83BS%2B7T8laZkhS1HwUiTjtYVXYBuAKwMlACODNzIUx5wEuS5KN0LusRMRmhmElAanQC%2FdmoUXIPmQGKTzXq3V9pboeCyiQQGs2P63%2FU5D%2FLPeRv%2BShac3WlTxNn8jxkGScQc7myKrTdHuoOa1lKPzhPAktBrdZN3fSHOHJNpquU2z1Ro%2FuyCNW7JnNhH0Co8PI5CM%2BtVnBU0x27N%2FP4fLUDASlJGYheZPVksv%2Bz3Ik8mizhsJ3iQ0hVzMdC3qRQriWItArkJAa9GiXO2ruPq3QTSkyvxux%2FGXFzzF6VOc0spPwBigch7pixzw1gjDJ2W7wB3i7LGo%2FvLPO9cmFCKaxi8VyhfzIeo9wAAaFzO7wN4QM0XQuQK%2FIZ5gXCMIfRwO0I5ZoBCoIGsIdF%2FCNm9UVa%2FMLVDTDincSw6arzEl6oI%2BOSGg%2FxR%2B6Ok5SnVs9lWLr4Tq7OFJRR1gCApaQewwDZOvJ1lCQaVbmQBQ8Z6wutx7yAXpmpXleCxwYy7k69Gty6m01ziFON8gXRhdHFhE33rKXrSvyAI3MKHQrtcGOqUBy8Do362hemHQne0szm8PMU5B1zL9xb29270Fk0PR%2FvD83i5UwUOpg2g8dQ1Wgu4uWNl1zQnRAGxo5FgTn%2F6cOGey%2F0SsmoZLM6KVCRM6qG0S5xYZc%2BlWGEJQnoG%2B5mgAPJg2W%2B6aZirlWBDAejZezWdfoW7GnWlzKe1Q6Lrw7GzI6tKNH2B52lK8tYB53QSo9RbQrSVgOn5cCbjln4ucFh7UVMvS&X-Amz-Signature=9295825258e23c2ccdb2cd355804cdaa807066f97e4bc8990e7c09f80fe44b9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
