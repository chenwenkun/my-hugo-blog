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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UI4JXIME%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T095751Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuPVfEtUAbDNAqnfgJrbD7W1vKzg%2FImhxFDWBqW3rK4AIhAJrkCf4JbRIB4mf6QdSQGmdTSAW%2FO5Sa9JlA2UWQyMaIKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyJ9z8y4tv0u2YOub8q3AMTXCVs3IiVwaqIvA%2FJWPb0sMwwecCdTyGpJvMHiWgovqwzqL0Yh295wVT%2FVelhDCLc5N7d2bRP2rIiQR52utHqtky2niU%2BhEu22vVinJwUq7Oc%2FU8WCprO2HstvpNj3TKHiWfDSymaMRy6t%2FdKOOrfwowg3IDsUkuI2xQXldpIF9vt0IuFOqGM0mpi3VPMtHyCii8z0b8q4bkAp05PqMZmhfEjlxPa7%2BNTVM6x8oCJUNU6tQQ38UyTjh1weDR1K8iqxUT%2F40xKIhp52UFk6EiekoTE3YnGaMa31aMBely%2BfzGQcwKh1ZjOzNXaw2aeaAd3MmRMa1OEchjk4c9%2F1gYYsOkLiAwkFe5bcAoLWW2bQ4n6xz%2FY8KS29tWtwhVmGsmQjyNkc0pB%2BgSZ%2B4xuC4E1Eba8fXEQnpE5BwNpPE0DzEc2InPXp5tu4Xr7GUh%2F%2BiQgc7wC0eZH0FkOEvuTBaeIox%2Fw7%2BpU9t1S8u3AVGYZB%2B1s0qWkBYHjf%2BPhpWjGcqNSJ5xYbfXh7rA2zx3g1agZcF%2BG3mx9uCo8phQdgJkd2Viuc4LJK39Mqkz5vYWUwuZseWGbs9qo3wA%2BIcLgcmiy6W5r%2BI6XbRWT9M%2Fmu40X0VoRmap62ijfd89LaTDy8vHWBjqkAbMBP1B%2Fz6NwQrewEMQuQPQRMgJ3OckP%2BczGnaKwViURyv4igeD2H%2B1CRqHfApTzw5Smz6%2FsnuGVfP7YzyptSBgOmS8e87ehLsRF622LDlrJ11fQ02IxZ1S3wVGMPqgp614JQUoM5zMcQa2ablc16cJR8NVMTedaGULOhS5liF7%2FBEARH8RpFFbY%2FSjYaJ2hqYgf04mREs0y%2F2j5DAJW5Tyg1z1M&X-Amz-Signature=e05466101b011b008668e28fa56ac75c65531e716fae0769f733606dd01168e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UI4JXIME%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T095751Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuPVfEtUAbDNAqnfgJrbD7W1vKzg%2FImhxFDWBqW3rK4AIhAJrkCf4JbRIB4mf6QdSQGmdTSAW%2FO5Sa9JlA2UWQyMaIKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyJ9z8y4tv0u2YOub8q3AMTXCVs3IiVwaqIvA%2FJWPb0sMwwecCdTyGpJvMHiWgovqwzqL0Yh295wVT%2FVelhDCLc5N7d2bRP2rIiQR52utHqtky2niU%2BhEu22vVinJwUq7Oc%2FU8WCprO2HstvpNj3TKHiWfDSymaMRy6t%2FdKOOrfwowg3IDsUkuI2xQXldpIF9vt0IuFOqGM0mpi3VPMtHyCii8z0b8q4bkAp05PqMZmhfEjlxPa7%2BNTVM6x8oCJUNU6tQQ38UyTjh1weDR1K8iqxUT%2F40xKIhp52UFk6EiekoTE3YnGaMa31aMBely%2BfzGQcwKh1ZjOzNXaw2aeaAd3MmRMa1OEchjk4c9%2F1gYYsOkLiAwkFe5bcAoLWW2bQ4n6xz%2FY8KS29tWtwhVmGsmQjyNkc0pB%2BgSZ%2B4xuC4E1Eba8fXEQnpE5BwNpPE0DzEc2InPXp5tu4Xr7GUh%2F%2BiQgc7wC0eZH0FkOEvuTBaeIox%2Fw7%2BpU9t1S8u3AVGYZB%2B1s0qWkBYHjf%2BPhpWjGcqNSJ5xYbfXh7rA2zx3g1agZcF%2BG3mx9uCo8phQdgJkd2Viuc4LJK39Mqkz5vYWUwuZseWGbs9qo3wA%2BIcLgcmiy6W5r%2BI6XbRWT9M%2Fmu40X0VoRmap62ijfd89LaTDy8vHWBjqkAbMBP1B%2Fz6NwQrewEMQuQPQRMgJ3OckP%2BczGnaKwViURyv4igeD2H%2B1CRqHfApTzw5Smz6%2FsnuGVfP7YzyptSBgOmS8e87ehLsRF622LDlrJ11fQ02IxZ1S3wVGMPqgp614JQUoM5zMcQa2ablc16cJR8NVMTedaGULOhS5liF7%2FBEARH8RpFFbY%2FSjYaJ2hqYgf04mREs0y%2F2j5DAJW5Tyg1z1M&X-Amz-Signature=8806a8933d7239c528fecc9f31b0ef91b31b7b78b6596842e5178337b81888c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UI4JXIME%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T095751Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuPVfEtUAbDNAqnfgJrbD7W1vKzg%2FImhxFDWBqW3rK4AIhAJrkCf4JbRIB4mf6QdSQGmdTSAW%2FO5Sa9JlA2UWQyMaIKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyJ9z8y4tv0u2YOub8q3AMTXCVs3IiVwaqIvA%2FJWPb0sMwwecCdTyGpJvMHiWgovqwzqL0Yh295wVT%2FVelhDCLc5N7d2bRP2rIiQR52utHqtky2niU%2BhEu22vVinJwUq7Oc%2FU8WCprO2HstvpNj3TKHiWfDSymaMRy6t%2FdKOOrfwowg3IDsUkuI2xQXldpIF9vt0IuFOqGM0mpi3VPMtHyCii8z0b8q4bkAp05PqMZmhfEjlxPa7%2BNTVM6x8oCJUNU6tQQ38UyTjh1weDR1K8iqxUT%2F40xKIhp52UFk6EiekoTE3YnGaMa31aMBely%2BfzGQcwKh1ZjOzNXaw2aeaAd3MmRMa1OEchjk4c9%2F1gYYsOkLiAwkFe5bcAoLWW2bQ4n6xz%2FY8KS29tWtwhVmGsmQjyNkc0pB%2BgSZ%2B4xuC4E1Eba8fXEQnpE5BwNpPE0DzEc2InPXp5tu4Xr7GUh%2F%2BiQgc7wC0eZH0FkOEvuTBaeIox%2Fw7%2BpU9t1S8u3AVGYZB%2B1s0qWkBYHjf%2BPhpWjGcqNSJ5xYbfXh7rA2zx3g1agZcF%2BG3mx9uCo8phQdgJkd2Viuc4LJK39Mqkz5vYWUwuZseWGbs9qo3wA%2BIcLgcmiy6W5r%2BI6XbRWT9M%2Fmu40X0VoRmap62ijfd89LaTDy8vHWBjqkAbMBP1B%2Fz6NwQrewEMQuQPQRMgJ3OckP%2BczGnaKwViURyv4igeD2H%2B1CRqHfApTzw5Smz6%2FsnuGVfP7YzyptSBgOmS8e87ehLsRF622LDlrJ11fQ02IxZ1S3wVGMPqgp614JQUoM5zMcQa2ablc16cJR8NVMTedaGULOhS5liF7%2FBEARH8RpFFbY%2FSjYaJ2hqYgf04mREs0y%2F2j5DAJW5Tyg1z1M&X-Amz-Signature=639aaa27fcc09d3b8cb8d3d956753d51223b715e6c7dc5d60b95c1d7fa9002db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UI4JXIME%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T095751Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDuPVfEtUAbDNAqnfgJrbD7W1vKzg%2FImhxFDWBqW3rK4AIhAJrkCf4JbRIB4mf6QdSQGmdTSAW%2FO5Sa9JlA2UWQyMaIKogECKL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyJ9z8y4tv0u2YOub8q3AMTXCVs3IiVwaqIvA%2FJWPb0sMwwecCdTyGpJvMHiWgovqwzqL0Yh295wVT%2FVelhDCLc5N7d2bRP2rIiQR52utHqtky2niU%2BhEu22vVinJwUq7Oc%2FU8WCprO2HstvpNj3TKHiWfDSymaMRy6t%2FdKOOrfwowg3IDsUkuI2xQXldpIF9vt0IuFOqGM0mpi3VPMtHyCii8z0b8q4bkAp05PqMZmhfEjlxPa7%2BNTVM6x8oCJUNU6tQQ38UyTjh1weDR1K8iqxUT%2F40xKIhp52UFk6EiekoTE3YnGaMa31aMBely%2BfzGQcwKh1ZjOzNXaw2aeaAd3MmRMa1OEchjk4c9%2F1gYYsOkLiAwkFe5bcAoLWW2bQ4n6xz%2FY8KS29tWtwhVmGsmQjyNkc0pB%2BgSZ%2B4xuC4E1Eba8fXEQnpE5BwNpPE0DzEc2InPXp5tu4Xr7GUh%2F%2BiQgc7wC0eZH0FkOEvuTBaeIox%2Fw7%2BpU9t1S8u3AVGYZB%2B1s0qWkBYHjf%2BPhpWjGcqNSJ5xYbfXh7rA2zx3g1agZcF%2BG3mx9uCo8phQdgJkd2Viuc4LJK39Mqkz5vYWUwuZseWGbs9qo3wA%2BIcLgcmiy6W5r%2BI6XbRWT9M%2Fmu40X0VoRmap62ijfd89LaTDy8vHWBjqkAbMBP1B%2Fz6NwQrewEMQuQPQRMgJ3OckP%2BczGnaKwViURyv4igeD2H%2B1CRqHfApTzw5Smz6%2FsnuGVfP7YzyptSBgOmS8e87ehLsRF622LDlrJ11fQ02IxZ1S3wVGMPqgp614JQUoM5zMcQa2ablc16cJR8NVMTedaGULOhS5liF7%2FBEARH8RpFFbY%2FSjYaJ2hqYgf04mREs0y%2F2j5DAJW5Tyg1z1M&X-Amz-Signature=d5ead167d03453c7ad6c29d5c2c2c7d27884da9a4f180cb9bc64750d4e42ed44&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
