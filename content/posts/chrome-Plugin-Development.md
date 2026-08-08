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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BTRLK2K%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T004946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDl%2BAiFMAb3JS3QmxUXdNBv7Unv0JQIwtp4vhqLCCzhXAIgfmre9PBOpO8yWUuU0Wf%2BopGjhlF8s9%2FcquSmknFt78Yq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDEUzHRBfAmJWdnpXfCrcAz9fHmRrbBZBGzv2fBTtOFMpT8maBjJ1PiKLHHOkm7qYBwNmQ9KrwagKBGPAmN3Dc8YqhybMhDCMjLefQF71zrI2sHqZ7ELEQSJX4nTpsncYAg%2BjNq01yvopa%2FEPFoRf8W%2Ft%2BVMwqR4q1a277pCg5tYw8nwNWTN%2Be9R2h6dM7%2FLIzHKPaN1%2BZm0ILZFe2SYiszaU2jVmXO3vqqLl1TCEwrarYzdPawezCQOyXVLv%2FwXLn1qegoibVKNJqf9mlT9T8Vwr%2BI8hrq8s1NQ77ME50dcVrxuTLUHM55Mdrqz%2FSrp%2FZUXdEkofGPsGRdiUdK5znw2QY5M5ZuFm043J99xXlvNfBLpCGrV5d8ns1JDdlN2QvhbPOq1VdIRbqs5xV3V%2FmwKoo3mlRYycJ4VQlczNL4VRuNzGW8ibO2KKjP1SyjsyhebSHZzrkm29hq2SRjn%2FV475Vg5aEQcLiYSDNoawu56vMQBj7FcB6%2BsKiqgm4KIVTPvaZio6YgHuB%2BYC1PF1gYp5ZaahBOgA1akH3pW32MvVDCGxei2SLPZDZZUSe7gWjCUcq2Q7Ru9n0J4uFlivShfTI52aprRUWI4JRrjShwUtUtL8i3Y9LopALk7WjO3ri4tG1c%2BrtchmL%2B9xMK7v2dMGOqUBHA%2FW3SjqSnD7py77wQ4I3t9gsJ0e47epkBex1xGW9k0MMOe6jgYFTUot%2F4O82%2BLVH2Zx%2BkmEGxEXv2hAQcckRV8nQ9LWQo4XrSsmqMz4Lix4Zt0SOCftS%2F0BIMPhh%2F%2BeaZZZXY0CLLu5RMhVOm9ECEpuw%2Fm3AuzkVjJRPFLaHmFuYbV9I1U4TyVSVwlOjVnaQ2LjJ2%2BgMOOB3HlXkAIHNbCVUUg0&X-Amz-Signature=3f9546903df7a97d02994fd9e7ddfddfd73c72e6d9b38558200f0e733f1c8f42&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BTRLK2K%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T004946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDl%2BAiFMAb3JS3QmxUXdNBv7Unv0JQIwtp4vhqLCCzhXAIgfmre9PBOpO8yWUuU0Wf%2BopGjhlF8s9%2FcquSmknFt78Yq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDEUzHRBfAmJWdnpXfCrcAz9fHmRrbBZBGzv2fBTtOFMpT8maBjJ1PiKLHHOkm7qYBwNmQ9KrwagKBGPAmN3Dc8YqhybMhDCMjLefQF71zrI2sHqZ7ELEQSJX4nTpsncYAg%2BjNq01yvopa%2FEPFoRf8W%2Ft%2BVMwqR4q1a277pCg5tYw8nwNWTN%2Be9R2h6dM7%2FLIzHKPaN1%2BZm0ILZFe2SYiszaU2jVmXO3vqqLl1TCEwrarYzdPawezCQOyXVLv%2FwXLn1qegoibVKNJqf9mlT9T8Vwr%2BI8hrq8s1NQ77ME50dcVrxuTLUHM55Mdrqz%2FSrp%2FZUXdEkofGPsGRdiUdK5znw2QY5M5ZuFm043J99xXlvNfBLpCGrV5d8ns1JDdlN2QvhbPOq1VdIRbqs5xV3V%2FmwKoo3mlRYycJ4VQlczNL4VRuNzGW8ibO2KKjP1SyjsyhebSHZzrkm29hq2SRjn%2FV475Vg5aEQcLiYSDNoawu56vMQBj7FcB6%2BsKiqgm4KIVTPvaZio6YgHuB%2BYC1PF1gYp5ZaahBOgA1akH3pW32MvVDCGxei2SLPZDZZUSe7gWjCUcq2Q7Ru9n0J4uFlivShfTI52aprRUWI4JRrjShwUtUtL8i3Y9LopALk7WjO3ri4tG1c%2BrtchmL%2B9xMK7v2dMGOqUBHA%2FW3SjqSnD7py77wQ4I3t9gsJ0e47epkBex1xGW9k0MMOe6jgYFTUot%2F4O82%2BLVH2Zx%2BkmEGxEXv2hAQcckRV8nQ9LWQo4XrSsmqMz4Lix4Zt0SOCftS%2F0BIMPhh%2F%2BeaZZZXY0CLLu5RMhVOm9ECEpuw%2Fm3AuzkVjJRPFLaHmFuYbV9I1U4TyVSVwlOjVnaQ2LjJ2%2BgMOOB3HlXkAIHNbCVUUg0&X-Amz-Signature=f1a15cd43eceaba65aa5ac72f98a5780880d44f9799fb2daf939b319526982cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BTRLK2K%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T004946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDl%2BAiFMAb3JS3QmxUXdNBv7Unv0JQIwtp4vhqLCCzhXAIgfmre9PBOpO8yWUuU0Wf%2BopGjhlF8s9%2FcquSmknFt78Yq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDEUzHRBfAmJWdnpXfCrcAz9fHmRrbBZBGzv2fBTtOFMpT8maBjJ1PiKLHHOkm7qYBwNmQ9KrwagKBGPAmN3Dc8YqhybMhDCMjLefQF71zrI2sHqZ7ELEQSJX4nTpsncYAg%2BjNq01yvopa%2FEPFoRf8W%2Ft%2BVMwqR4q1a277pCg5tYw8nwNWTN%2Be9R2h6dM7%2FLIzHKPaN1%2BZm0ILZFe2SYiszaU2jVmXO3vqqLl1TCEwrarYzdPawezCQOyXVLv%2FwXLn1qegoibVKNJqf9mlT9T8Vwr%2BI8hrq8s1NQ77ME50dcVrxuTLUHM55Mdrqz%2FSrp%2FZUXdEkofGPsGRdiUdK5znw2QY5M5ZuFm043J99xXlvNfBLpCGrV5d8ns1JDdlN2QvhbPOq1VdIRbqs5xV3V%2FmwKoo3mlRYycJ4VQlczNL4VRuNzGW8ibO2KKjP1SyjsyhebSHZzrkm29hq2SRjn%2FV475Vg5aEQcLiYSDNoawu56vMQBj7FcB6%2BsKiqgm4KIVTPvaZio6YgHuB%2BYC1PF1gYp5ZaahBOgA1akH3pW32MvVDCGxei2SLPZDZZUSe7gWjCUcq2Q7Ru9n0J4uFlivShfTI52aprRUWI4JRrjShwUtUtL8i3Y9LopALk7WjO3ri4tG1c%2BrtchmL%2B9xMK7v2dMGOqUBHA%2FW3SjqSnD7py77wQ4I3t9gsJ0e47epkBex1xGW9k0MMOe6jgYFTUot%2F4O82%2BLVH2Zx%2BkmEGxEXv2hAQcckRV8nQ9LWQo4XrSsmqMz4Lix4Zt0SOCftS%2F0BIMPhh%2F%2BeaZZZXY0CLLu5RMhVOm9ECEpuw%2Fm3AuzkVjJRPFLaHmFuYbV9I1U4TyVSVwlOjVnaQ2LjJ2%2BgMOOB3HlXkAIHNbCVUUg0&X-Amz-Signature=1c802c95e8cb5d1118b8e895529ac332787376fdb34e47efce411ff22f67cab7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BTRLK2K%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T004946Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDl%2BAiFMAb3JS3QmxUXdNBv7Unv0JQIwtp4vhqLCCzhXAIgfmre9PBOpO8yWUuU0Wf%2BopGjhlF8s9%2FcquSmknFt78Yq%2FwMIYhAAGgw2Mzc0MjMxODM4MDUiDEUzHRBfAmJWdnpXfCrcAz9fHmRrbBZBGzv2fBTtOFMpT8maBjJ1PiKLHHOkm7qYBwNmQ9KrwagKBGPAmN3Dc8YqhybMhDCMjLefQF71zrI2sHqZ7ELEQSJX4nTpsncYAg%2BjNq01yvopa%2FEPFoRf8W%2Ft%2BVMwqR4q1a277pCg5tYw8nwNWTN%2Be9R2h6dM7%2FLIzHKPaN1%2BZm0ILZFe2SYiszaU2jVmXO3vqqLl1TCEwrarYzdPawezCQOyXVLv%2FwXLn1qegoibVKNJqf9mlT9T8Vwr%2BI8hrq8s1NQ77ME50dcVrxuTLUHM55Mdrqz%2FSrp%2FZUXdEkofGPsGRdiUdK5znw2QY5M5ZuFm043J99xXlvNfBLpCGrV5d8ns1JDdlN2QvhbPOq1VdIRbqs5xV3V%2FmwKoo3mlRYycJ4VQlczNL4VRuNzGW8ibO2KKjP1SyjsyhebSHZzrkm29hq2SRjn%2FV475Vg5aEQcLiYSDNoawu56vMQBj7FcB6%2BsKiqgm4KIVTPvaZio6YgHuB%2BYC1PF1gYp5ZaahBOgA1akH3pW32MvVDCGxei2SLPZDZZUSe7gWjCUcq2Q7Ru9n0J4uFlivShfTI52aprRUWI4JRrjShwUtUtL8i3Y9LopALk7WjO3ri4tG1c%2BrtchmL%2B9xMK7v2dMGOqUBHA%2FW3SjqSnD7py77wQ4I3t9gsJ0e47epkBex1xGW9k0MMOe6jgYFTUot%2F4O82%2BLVH2Zx%2BkmEGxEXv2hAQcckRV8nQ9LWQo4XrSsmqMz4Lix4Zt0SOCftS%2F0BIMPhh%2F%2BeaZZZXY0CLLu5RMhVOm9ECEpuw%2Fm3AuzkVjJRPFLaHmFuYbV9I1U4TyVSVwlOjVnaQ2LjJ2%2BgMOOB3HlXkAIHNbCVUUg0&X-Amz-Signature=abafd98dc98cdc54a5f56b827be7d6a09c8ff373e5b8556d98248498fa7a21f2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
