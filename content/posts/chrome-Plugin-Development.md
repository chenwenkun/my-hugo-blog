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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662BLD7V6G%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T225957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCICcHEbwDHWSMceisQavx2kdS%2FczqLNg7AmW7L1agxVQkAiAwZvBQbOPw3awvj8bAYuzUjMD2ZOpADwDVOL8uwlauPiqIBAjN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJn39NkVSfbUFl8FJKtwDlqG8oaZKmt46hFzD0nGh%2FIwFdjtuljRY8hipWmCN2E%2F0y3gVDgtpNCNy3euF2N1x%2FmWyJPJdpNTPUw7Uw3Way23g2ye6JLUzt2eM6r0g4lF92nlQCKpWQmgeZ4t5Tc95yz4HbbmShaVgTKUuRoC24Uiio9bKiDS25UtZ8X0olatj0Y1NkHY4EuFra9OYYRmnAMTAIoAy7bmy4KdnmdYaAqtV3T67PfCxuM%2FJ%2BfNR7TsyGHlY6Jm1Gui3jc2rrGII6KOF%2BxTNlthBFMIn5388XNhWXvWyjz562d2Q%2F5BcNKKiYQW3LuvzZZIlX%2ByIu2Q6izmyPK%2FeotVH6p%2BANVP79q33WAxuGSnSMI6hABmBWLD0d0pwlhUrGKLeaNGuOgv9Ioh9Ha1ovjwOHvocwKgZKwxd58U0oIGuo%2FxQ80K1njDHhhxo91lcQP9pFvsk7sAeDLpUm%2FHdIViTlNteuSiAqmAaSb24fGRUXeGLFA%2B3cu0HsdkJ2hN2G3HnVIxe7YF0NArXWBa3eSdO7jW%2Foe1%2FLTjKli6puYZFDUOZ90m%2FLUS8S8%2FwyGo0eAqNDZjAnSXwQX9GUryU3P%2BI41MQmqsd%2F9JKZZR%2FSWKK%2FARUDjOO5%2F%2Buyi1s%2BKqhPz6IDfcwt8Kz1wY6pgEJPM0tPalhh9OP2BYttXawC%2BvLjX%2Bu7Tllz4pk764wh%2FobpB6KHovWwVPd8JmWAGpDSNgLqIelEqE4x3qLbre83lz0CxDOqJINzEUFBT8LJwojrjmOa4fcxgmPr%2BO6J%2BzBnAK%2Bt15A2ACl4xTsXP48Vuwoe6dGTUUMnZJgp2kVTMXoi4kr42GDCbu8Tq7rciFFBh8m8ozKtcUobxiBzmVWo%2FdqDERQ&X-Amz-Signature=1ae1642ed854bb07272c56b14b914562fa54b01e1f7903c4b38338085d34912b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662BLD7V6G%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T225957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCICcHEbwDHWSMceisQavx2kdS%2FczqLNg7AmW7L1agxVQkAiAwZvBQbOPw3awvj8bAYuzUjMD2ZOpADwDVOL8uwlauPiqIBAjN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJn39NkVSfbUFl8FJKtwDlqG8oaZKmt46hFzD0nGh%2FIwFdjtuljRY8hipWmCN2E%2F0y3gVDgtpNCNy3euF2N1x%2FmWyJPJdpNTPUw7Uw3Way23g2ye6JLUzt2eM6r0g4lF92nlQCKpWQmgeZ4t5Tc95yz4HbbmShaVgTKUuRoC24Uiio9bKiDS25UtZ8X0olatj0Y1NkHY4EuFra9OYYRmnAMTAIoAy7bmy4KdnmdYaAqtV3T67PfCxuM%2FJ%2BfNR7TsyGHlY6Jm1Gui3jc2rrGII6KOF%2BxTNlthBFMIn5388XNhWXvWyjz562d2Q%2F5BcNKKiYQW3LuvzZZIlX%2ByIu2Q6izmyPK%2FeotVH6p%2BANVP79q33WAxuGSnSMI6hABmBWLD0d0pwlhUrGKLeaNGuOgv9Ioh9Ha1ovjwOHvocwKgZKwxd58U0oIGuo%2FxQ80K1njDHhhxo91lcQP9pFvsk7sAeDLpUm%2FHdIViTlNteuSiAqmAaSb24fGRUXeGLFA%2B3cu0HsdkJ2hN2G3HnVIxe7YF0NArXWBa3eSdO7jW%2Foe1%2FLTjKli6puYZFDUOZ90m%2FLUS8S8%2FwyGo0eAqNDZjAnSXwQX9GUryU3P%2BI41MQmqsd%2F9JKZZR%2FSWKK%2FARUDjOO5%2F%2Buyi1s%2BKqhPz6IDfcwt8Kz1wY6pgEJPM0tPalhh9OP2BYttXawC%2BvLjX%2Bu7Tllz4pk764wh%2FobpB6KHovWwVPd8JmWAGpDSNgLqIelEqE4x3qLbre83lz0CxDOqJINzEUFBT8LJwojrjmOa4fcxgmPr%2BO6J%2BzBnAK%2Bt15A2ACl4xTsXP48Vuwoe6dGTUUMnZJgp2kVTMXoi4kr42GDCbu8Tq7rciFFBh8m8ozKtcUobxiBzmVWo%2FdqDERQ&X-Amz-Signature=bb74ced1137e9532e3c67586375112e40266e42ffb9e4d53da2da13146519ed8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662BLD7V6G%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T225957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCICcHEbwDHWSMceisQavx2kdS%2FczqLNg7AmW7L1agxVQkAiAwZvBQbOPw3awvj8bAYuzUjMD2ZOpADwDVOL8uwlauPiqIBAjN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJn39NkVSfbUFl8FJKtwDlqG8oaZKmt46hFzD0nGh%2FIwFdjtuljRY8hipWmCN2E%2F0y3gVDgtpNCNy3euF2N1x%2FmWyJPJdpNTPUw7Uw3Way23g2ye6JLUzt2eM6r0g4lF92nlQCKpWQmgeZ4t5Tc95yz4HbbmShaVgTKUuRoC24Uiio9bKiDS25UtZ8X0olatj0Y1NkHY4EuFra9OYYRmnAMTAIoAy7bmy4KdnmdYaAqtV3T67PfCxuM%2FJ%2BfNR7TsyGHlY6Jm1Gui3jc2rrGII6KOF%2BxTNlthBFMIn5388XNhWXvWyjz562d2Q%2F5BcNKKiYQW3LuvzZZIlX%2ByIu2Q6izmyPK%2FeotVH6p%2BANVP79q33WAxuGSnSMI6hABmBWLD0d0pwlhUrGKLeaNGuOgv9Ioh9Ha1ovjwOHvocwKgZKwxd58U0oIGuo%2FxQ80K1njDHhhxo91lcQP9pFvsk7sAeDLpUm%2FHdIViTlNteuSiAqmAaSb24fGRUXeGLFA%2B3cu0HsdkJ2hN2G3HnVIxe7YF0NArXWBa3eSdO7jW%2Foe1%2FLTjKli6puYZFDUOZ90m%2FLUS8S8%2FwyGo0eAqNDZjAnSXwQX9GUryU3P%2BI41MQmqsd%2F9JKZZR%2FSWKK%2FARUDjOO5%2F%2Buyi1s%2BKqhPz6IDfcwt8Kz1wY6pgEJPM0tPalhh9OP2BYttXawC%2BvLjX%2Bu7Tllz4pk764wh%2FobpB6KHovWwVPd8JmWAGpDSNgLqIelEqE4x3qLbre83lz0CxDOqJINzEUFBT8LJwojrjmOa4fcxgmPr%2BO6J%2BzBnAK%2Bt15A2ACl4xTsXP48Vuwoe6dGTUUMnZJgp2kVTMXoi4kr42GDCbu8Tq7rciFFBh8m8ozKtcUobxiBzmVWo%2FdqDERQ&X-Amz-Signature=fb0060bbac37c63c6591435c17a0763ba5249c26cfa52db866af4c3013e45884&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662BLD7V6G%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T225957Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJGMEQCICcHEbwDHWSMceisQavx2kdS%2FczqLNg7AmW7L1agxVQkAiAwZvBQbOPw3awvj8bAYuzUjMD2ZOpADwDVOL8uwlauPiqIBAjN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMJn39NkVSfbUFl8FJKtwDlqG8oaZKmt46hFzD0nGh%2FIwFdjtuljRY8hipWmCN2E%2F0y3gVDgtpNCNy3euF2N1x%2FmWyJPJdpNTPUw7Uw3Way23g2ye6JLUzt2eM6r0g4lF92nlQCKpWQmgeZ4t5Tc95yz4HbbmShaVgTKUuRoC24Uiio9bKiDS25UtZ8X0olatj0Y1NkHY4EuFra9OYYRmnAMTAIoAy7bmy4KdnmdYaAqtV3T67PfCxuM%2FJ%2BfNR7TsyGHlY6Jm1Gui3jc2rrGII6KOF%2BxTNlthBFMIn5388XNhWXvWyjz562d2Q%2F5BcNKKiYQW3LuvzZZIlX%2ByIu2Q6izmyPK%2FeotVH6p%2BANVP79q33WAxuGSnSMI6hABmBWLD0d0pwlhUrGKLeaNGuOgv9Ioh9Ha1ovjwOHvocwKgZKwxd58U0oIGuo%2FxQ80K1njDHhhxo91lcQP9pFvsk7sAeDLpUm%2FHdIViTlNteuSiAqmAaSb24fGRUXeGLFA%2B3cu0HsdkJ2hN2G3HnVIxe7YF0NArXWBa3eSdO7jW%2Foe1%2FLTjKli6puYZFDUOZ90m%2FLUS8S8%2FwyGo0eAqNDZjAnSXwQX9GUryU3P%2BI41MQmqsd%2F9JKZZR%2FSWKK%2FARUDjOO5%2F%2Buyi1s%2BKqhPz6IDfcwt8Kz1wY6pgEJPM0tPalhh9OP2BYttXawC%2BvLjX%2Bu7Tllz4pk764wh%2FobpB6KHovWwVPd8JmWAGpDSNgLqIelEqE4x3qLbre83lz0CxDOqJINzEUFBT8LJwojrjmOa4fcxgmPr%2BO6J%2BzBnAK%2Bt15A2ACl4xTsXP48Vuwoe6dGTUUMnZJgp2kVTMXoi4kr42GDCbu8Tq7rciFFBh8m8ozKtcUobxiBzmVWo%2FdqDERQ&X-Amz-Signature=0e7d8fbab60af45ad0128c248bcf21ba002ea3a676236182ee2b30418c2ad11c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
