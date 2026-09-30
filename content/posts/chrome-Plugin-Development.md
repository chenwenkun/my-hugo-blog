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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UTOLTKKG%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T171132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsFydRT%2FhIc58dnQ6pxlycbsZ1q8QeG6%2Ft2N9SzlYm8wIgIZH%2F4Lk3yXz4iWSXMjdo6aLcO3kPGlQFPVfPg1noPrcq%2FwMIaBAAGgw2Mzc0MjMxODM4MDUiDIbh%2BbUqPU2NVOQgSyrcA4tAs94iiRzVoeG5ONAzFsfvrIgDP5DkXnMedWDuu8ZqIHmnoae4UE9FvKa8ybPy8JgORFICmN8rS15u%2Fe43vgOmSHG5RfVSMSAHQ0DFMSp7ZBzi4KDMMWWid%2B3%2BKSvonqgSk1%2F5tPdtXfG3LADUa07rxNMDfaxs5HAVxDNg6baGWycTUSpTWyRuGWvHmGNs9CCZDkUkXCvSB7%2F8kEpY6HCw8604Q09q9U%2FkAR7KN8PMTbfNNMCFoWFZJ7UT7ZPaN6pNIQELIHyrOUEeJHfsDHiY1ee2GoTitbdC%2BYkhjHQSBG81FjT7mR5Q8Am0pWg1nD78jwOw8%2BVXog3huU3MB9CGGws0q4sI5AWwtIGlb1UAASH%2FbW8YrL%2BI3%2B1Zj4UyvrzOuelENgT3bR87oQ%2FBnmh3IdmQ%2FqkxgSICQRZhZZBmBmhyAk9vXlnbP1s4T%2B6vBrz%2BAH1%2BccUGDzJIxlUOQX7a1A2ghyjiCtOdvENN6PEeXlsLHr%2F7pfvGpqqq8rFNrcbhzQsXJrCWwCus6LNXjgh7xe49vSK8DV61AyMETS1aMfoq%2F8WJZXVE29s3jjWnkqN3Xs%2BkrQcS8R0LwS2Tjkco648nsoMvaaPiAKoC1wG29G%2Fgc%2Fji0pglRwucMIHP9NUGOqUBhwhbOScc26Rsw8Oh%2FP4on3LsPAOyOfWsrhdPhgNrxr9pyZmDNCboJHN%2FJ6BoW6MrD9EFaRVVEoTtCQOegVFvm2ZgT9Rt0%2B2Vlmyh%2BoW%2FvwggbUzMw5OGz5iM%2FhmdkI54Ep%2B4nt7fdz%2FYLP6ppwWt5UsdyrfL6Dj2Etntn2Vg%2FitWyksBzyCf2Fh8APQx5x5CaMnUW5GaTTSrtwyk%2FuYE0RZyU%2Bp6&X-Amz-Signature=9e556f1c79cce789b9e088f6310e380a649cf53bde8f0733e54173a8c9b4d2bb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UTOLTKKG%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T171132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsFydRT%2FhIc58dnQ6pxlycbsZ1q8QeG6%2Ft2N9SzlYm8wIgIZH%2F4Lk3yXz4iWSXMjdo6aLcO3kPGlQFPVfPg1noPrcq%2FwMIaBAAGgw2Mzc0MjMxODM4MDUiDIbh%2BbUqPU2NVOQgSyrcA4tAs94iiRzVoeG5ONAzFsfvrIgDP5DkXnMedWDuu8ZqIHmnoae4UE9FvKa8ybPy8JgORFICmN8rS15u%2Fe43vgOmSHG5RfVSMSAHQ0DFMSp7ZBzi4KDMMWWid%2B3%2BKSvonqgSk1%2F5tPdtXfG3LADUa07rxNMDfaxs5HAVxDNg6baGWycTUSpTWyRuGWvHmGNs9CCZDkUkXCvSB7%2F8kEpY6HCw8604Q09q9U%2FkAR7KN8PMTbfNNMCFoWFZJ7UT7ZPaN6pNIQELIHyrOUEeJHfsDHiY1ee2GoTitbdC%2BYkhjHQSBG81FjT7mR5Q8Am0pWg1nD78jwOw8%2BVXog3huU3MB9CGGws0q4sI5AWwtIGlb1UAASH%2FbW8YrL%2BI3%2B1Zj4UyvrzOuelENgT3bR87oQ%2FBnmh3IdmQ%2FqkxgSICQRZhZZBmBmhyAk9vXlnbP1s4T%2B6vBrz%2BAH1%2BccUGDzJIxlUOQX7a1A2ghyjiCtOdvENN6PEeXlsLHr%2F7pfvGpqqq8rFNrcbhzQsXJrCWwCus6LNXjgh7xe49vSK8DV61AyMETS1aMfoq%2F8WJZXVE29s3jjWnkqN3Xs%2BkrQcS8R0LwS2Tjkco648nsoMvaaPiAKoC1wG29G%2Fgc%2Fji0pglRwucMIHP9NUGOqUBhwhbOScc26Rsw8Oh%2FP4on3LsPAOyOfWsrhdPhgNrxr9pyZmDNCboJHN%2FJ6BoW6MrD9EFaRVVEoTtCQOegVFvm2ZgT9Rt0%2B2Vlmyh%2BoW%2FvwggbUzMw5OGz5iM%2FhmdkI54Ep%2B4nt7fdz%2FYLP6ppwWt5UsdyrfL6Dj2Etntn2Vg%2FitWyksBzyCf2Fh8APQx5x5CaMnUW5GaTTSrtwyk%2FuYE0RZyU%2Bp6&X-Amz-Signature=be167010bbcf547fc9549f469881559fa00a9566e70c3c4f2681d2242eb12aed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UTOLTKKG%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T171132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsFydRT%2FhIc58dnQ6pxlycbsZ1q8QeG6%2Ft2N9SzlYm8wIgIZH%2F4Lk3yXz4iWSXMjdo6aLcO3kPGlQFPVfPg1noPrcq%2FwMIaBAAGgw2Mzc0MjMxODM4MDUiDIbh%2BbUqPU2NVOQgSyrcA4tAs94iiRzVoeG5ONAzFsfvrIgDP5DkXnMedWDuu8ZqIHmnoae4UE9FvKa8ybPy8JgORFICmN8rS15u%2Fe43vgOmSHG5RfVSMSAHQ0DFMSp7ZBzi4KDMMWWid%2B3%2BKSvonqgSk1%2F5tPdtXfG3LADUa07rxNMDfaxs5HAVxDNg6baGWycTUSpTWyRuGWvHmGNs9CCZDkUkXCvSB7%2F8kEpY6HCw8604Q09q9U%2FkAR7KN8PMTbfNNMCFoWFZJ7UT7ZPaN6pNIQELIHyrOUEeJHfsDHiY1ee2GoTitbdC%2BYkhjHQSBG81FjT7mR5Q8Am0pWg1nD78jwOw8%2BVXog3huU3MB9CGGws0q4sI5AWwtIGlb1UAASH%2FbW8YrL%2BI3%2B1Zj4UyvrzOuelENgT3bR87oQ%2FBnmh3IdmQ%2FqkxgSICQRZhZZBmBmhyAk9vXlnbP1s4T%2B6vBrz%2BAH1%2BccUGDzJIxlUOQX7a1A2ghyjiCtOdvENN6PEeXlsLHr%2F7pfvGpqqq8rFNrcbhzQsXJrCWwCus6LNXjgh7xe49vSK8DV61AyMETS1aMfoq%2F8WJZXVE29s3jjWnkqN3Xs%2BkrQcS8R0LwS2Tjkco648nsoMvaaPiAKoC1wG29G%2Fgc%2Fji0pglRwucMIHP9NUGOqUBhwhbOScc26Rsw8Oh%2FP4on3LsPAOyOfWsrhdPhgNrxr9pyZmDNCboJHN%2FJ6BoW6MrD9EFaRVVEoTtCQOegVFvm2ZgT9Rt0%2B2Vlmyh%2BoW%2FvwggbUzMw5OGz5iM%2FhmdkI54Ep%2B4nt7fdz%2FYLP6ppwWt5UsdyrfL6Dj2Etntn2Vg%2FitWyksBzyCf2Fh8APQx5x5CaMnUW5GaTTSrtwyk%2FuYE0RZyU%2Bp6&X-Amz-Signature=38ef0f8433f563d499a6519007059e045800c09284396204a89f801f505b2c0b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UTOLTKKG%2F20260930%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260930T171132Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDsFydRT%2FhIc58dnQ6pxlycbsZ1q8QeG6%2Ft2N9SzlYm8wIgIZH%2F4Lk3yXz4iWSXMjdo6aLcO3kPGlQFPVfPg1noPrcq%2FwMIaBAAGgw2Mzc0MjMxODM4MDUiDIbh%2BbUqPU2NVOQgSyrcA4tAs94iiRzVoeG5ONAzFsfvrIgDP5DkXnMedWDuu8ZqIHmnoae4UE9FvKa8ybPy8JgORFICmN8rS15u%2Fe43vgOmSHG5RfVSMSAHQ0DFMSp7ZBzi4KDMMWWid%2B3%2BKSvonqgSk1%2F5tPdtXfG3LADUa07rxNMDfaxs5HAVxDNg6baGWycTUSpTWyRuGWvHmGNs9CCZDkUkXCvSB7%2F8kEpY6HCw8604Q09q9U%2FkAR7KN8PMTbfNNMCFoWFZJ7UT7ZPaN6pNIQELIHyrOUEeJHfsDHiY1ee2GoTitbdC%2BYkhjHQSBG81FjT7mR5Q8Am0pWg1nD78jwOw8%2BVXog3huU3MB9CGGws0q4sI5AWwtIGlb1UAASH%2FbW8YrL%2BI3%2B1Zj4UyvrzOuelENgT3bR87oQ%2FBnmh3IdmQ%2FqkxgSICQRZhZZBmBmhyAk9vXlnbP1s4T%2B6vBrz%2BAH1%2BccUGDzJIxlUOQX7a1A2ghyjiCtOdvENN6PEeXlsLHr%2F7pfvGpqqq8rFNrcbhzQsXJrCWwCus6LNXjgh7xe49vSK8DV61AyMETS1aMfoq%2F8WJZXVE29s3jjWnkqN3Xs%2BkrQcS8R0LwS2Tjkco648nsoMvaaPiAKoC1wG29G%2Fgc%2Fji0pglRwucMIHP9NUGOqUBhwhbOScc26Rsw8Oh%2FP4on3LsPAOyOfWsrhdPhgNrxr9pyZmDNCboJHN%2FJ6BoW6MrD9EFaRVVEoTtCQOegVFvm2ZgT9Rt0%2B2Vlmyh%2BoW%2FvwggbUzMw5OGz5iM%2FhmdkI54Ep%2B4nt7fdz%2FYLP6ppwWt5UsdyrfL6Dj2Etntn2Vg%2FitWyksBzyCf2Fh8APQx5x5CaMnUW5GaTTSrtwyk%2FuYE0RZyU%2Bp6&X-Amz-Signature=4b34f95a81c4ced3f4d6dd744a06bd8148fb062730a316e5a101a53c2cc67395&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
