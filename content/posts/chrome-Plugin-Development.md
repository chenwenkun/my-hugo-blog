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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PFAT7Z3%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T094501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB6NOZm%2BEGoXDPZ%2B0OKDaEV48LtdmeJ9BMXQkjGzf4QzAiAGlPXQMb6Vaa3gLzOrvtbQjwn5YMuIdn9pd66gJ2cggiqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtoT%2FKKdg4p580L71KtwDa55BFH7ZvLBfezL3lp3jEG200lkkd7KXHEWp7hUmLsjfoACi%2FbkgdQ4HVjDskDzvHK7UsrTMYr%2BmT%2FXlFpwsYmjviFPbSha5cXt2a07ILeXWk8iQj0IoRtiiUl9%2BMPy7emv6bd75wsMTNuMvekI2G7R1qOtsXArMIevp%2FNTl9btNqh5O7%2FjHPgEvw2cMoydAY5TMKNw24yqa0KwomR64EVu9qUrmteqsjZo1WOYcHHwvBP%2BpTBmJaxQS3XbRMOwHCttM6O1art687b6Fi%2F8A42%2BB50%2BBmajJ%2ByROqEnbiMmfeI1o%2B9R0Ud4jdwXwvdDOpGhUnybCcfh3UrsZ9mEC226TIFtIfQOrfKQG1ywp8zgN9uVXSTB3ujo1MTtRv3cmfvTLaskKOYOwT29eh91vd5Am6JwR9jTSwxVXG1i%2B5ki6WF3Ia%2BmR9tRSUG3TYQvZVZb3RzwwRCieOA0bq100m1khfsp6wygSEqWG2TNjqCOfsfd0mFS6AgDUXl0hdUxLPE5BsyUs%2F85mA9h8Hj9Tb7cEGWdXxuQJf7fiULNL%2FQKKlP1oTuarvf67t5pPAdPSBSDt6vwYLFzOcl5XACR0PVWTh9xYzE1BdczkY2a648KjtAd%2BJpVxPUirLH8wwJ6U1QY6pgGxay1RpRoUR0sQ4IixFi82OBq9MwZdyA%2Fbt9figamEpmau%2BSfo6eQMrTBxRykJs94SzYaMEUWbIg2Kjem1FGgzJx8GRM4J%2BGWSOBqKYySBEuInqWo861NVDVGRm%2FGC5zU1v3tfi%2BZOdrVmCf99UVkHxJ3%2B6a01O2eIZiacaxfrQJY7oX6RJe9fnnzry9SojJmQgbUphf5CK%2BzaGyGCVCtl1oJO2t1u&X-Amz-Signature=15a1d15270b76f74dc79a08f967760e63f92edbdca4281c3f7f824b58db51ff5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PFAT7Z3%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T094501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB6NOZm%2BEGoXDPZ%2B0OKDaEV48LtdmeJ9BMXQkjGzf4QzAiAGlPXQMb6Vaa3gLzOrvtbQjwn5YMuIdn9pd66gJ2cggiqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtoT%2FKKdg4p580L71KtwDa55BFH7ZvLBfezL3lp3jEG200lkkd7KXHEWp7hUmLsjfoACi%2FbkgdQ4HVjDskDzvHK7UsrTMYr%2BmT%2FXlFpwsYmjviFPbSha5cXt2a07ILeXWk8iQj0IoRtiiUl9%2BMPy7emv6bd75wsMTNuMvekI2G7R1qOtsXArMIevp%2FNTl9btNqh5O7%2FjHPgEvw2cMoydAY5TMKNw24yqa0KwomR64EVu9qUrmteqsjZo1WOYcHHwvBP%2BpTBmJaxQS3XbRMOwHCttM6O1art687b6Fi%2F8A42%2BB50%2BBmajJ%2ByROqEnbiMmfeI1o%2B9R0Ud4jdwXwvdDOpGhUnybCcfh3UrsZ9mEC226TIFtIfQOrfKQG1ywp8zgN9uVXSTB3ujo1MTtRv3cmfvTLaskKOYOwT29eh91vd5Am6JwR9jTSwxVXG1i%2B5ki6WF3Ia%2BmR9tRSUG3TYQvZVZb3RzwwRCieOA0bq100m1khfsp6wygSEqWG2TNjqCOfsfd0mFS6AgDUXl0hdUxLPE5BsyUs%2F85mA9h8Hj9Tb7cEGWdXxuQJf7fiULNL%2FQKKlP1oTuarvf67t5pPAdPSBSDt6vwYLFzOcl5XACR0PVWTh9xYzE1BdczkY2a648KjtAd%2BJpVxPUirLH8wwJ6U1QY6pgGxay1RpRoUR0sQ4IixFi82OBq9MwZdyA%2Fbt9figamEpmau%2BSfo6eQMrTBxRykJs94SzYaMEUWbIg2Kjem1FGgzJx8GRM4J%2BGWSOBqKYySBEuInqWo861NVDVGRm%2FGC5zU1v3tfi%2BZOdrVmCf99UVkHxJ3%2B6a01O2eIZiacaxfrQJY7oX6RJe9fnnzry9SojJmQgbUphf5CK%2BzaGyGCVCtl1oJO2t1u&X-Amz-Signature=96534c7b90078043fa8033d396b2b2b1f769066dac878d9fe77c4d81554aa7cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PFAT7Z3%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T094501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB6NOZm%2BEGoXDPZ%2B0OKDaEV48LtdmeJ9BMXQkjGzf4QzAiAGlPXQMb6Vaa3gLzOrvtbQjwn5YMuIdn9pd66gJ2cggiqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtoT%2FKKdg4p580L71KtwDa55BFH7ZvLBfezL3lp3jEG200lkkd7KXHEWp7hUmLsjfoACi%2FbkgdQ4HVjDskDzvHK7UsrTMYr%2BmT%2FXlFpwsYmjviFPbSha5cXt2a07ILeXWk8iQj0IoRtiiUl9%2BMPy7emv6bd75wsMTNuMvekI2G7R1qOtsXArMIevp%2FNTl9btNqh5O7%2FjHPgEvw2cMoydAY5TMKNw24yqa0KwomR64EVu9qUrmteqsjZo1WOYcHHwvBP%2BpTBmJaxQS3XbRMOwHCttM6O1art687b6Fi%2F8A42%2BB50%2BBmajJ%2ByROqEnbiMmfeI1o%2B9R0Ud4jdwXwvdDOpGhUnybCcfh3UrsZ9mEC226TIFtIfQOrfKQG1ywp8zgN9uVXSTB3ujo1MTtRv3cmfvTLaskKOYOwT29eh91vd5Am6JwR9jTSwxVXG1i%2B5ki6WF3Ia%2BmR9tRSUG3TYQvZVZb3RzwwRCieOA0bq100m1khfsp6wygSEqWG2TNjqCOfsfd0mFS6AgDUXl0hdUxLPE5BsyUs%2F85mA9h8Hj9Tb7cEGWdXxuQJf7fiULNL%2FQKKlP1oTuarvf67t5pPAdPSBSDt6vwYLFzOcl5XACR0PVWTh9xYzE1BdczkY2a648KjtAd%2BJpVxPUirLH8wwJ6U1QY6pgGxay1RpRoUR0sQ4IixFi82OBq9MwZdyA%2Fbt9figamEpmau%2BSfo6eQMrTBxRykJs94SzYaMEUWbIg2Kjem1FGgzJx8GRM4J%2BGWSOBqKYySBEuInqWo861NVDVGRm%2FGC5zU1v3tfi%2BZOdrVmCf99UVkHxJ3%2B6a01O2eIZiacaxfrQJY7oX6RJe9fnnzry9SojJmQgbUphf5CK%2BzaGyGCVCtl1oJO2t1u&X-Amz-Signature=37a5888f4465d531b351311ad5dc8396a125883e994dccf99cefff99f33ebb7e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663PFAT7Z3%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T094501Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIB6NOZm%2BEGoXDPZ%2B0OKDaEV48LtdmeJ9BMXQkjGzf4QzAiAGlPXQMb6Vaa3gLzOrvtbQjwn5YMuIdn9pd66gJ2cggiqIBAiy%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMtoT%2FKKdg4p580L71KtwDa55BFH7ZvLBfezL3lp3jEG200lkkd7KXHEWp7hUmLsjfoACi%2FbkgdQ4HVjDskDzvHK7UsrTMYr%2BmT%2FXlFpwsYmjviFPbSha5cXt2a07ILeXWk8iQj0IoRtiiUl9%2BMPy7emv6bd75wsMTNuMvekI2G7R1qOtsXArMIevp%2FNTl9btNqh5O7%2FjHPgEvw2cMoydAY5TMKNw24yqa0KwomR64EVu9qUrmteqsjZo1WOYcHHwvBP%2BpTBmJaxQS3XbRMOwHCttM6O1art687b6Fi%2F8A42%2BB50%2BBmajJ%2ByROqEnbiMmfeI1o%2B9R0Ud4jdwXwvdDOpGhUnybCcfh3UrsZ9mEC226TIFtIfQOrfKQG1ywp8zgN9uVXSTB3ujo1MTtRv3cmfvTLaskKOYOwT29eh91vd5Am6JwR9jTSwxVXG1i%2B5ki6WF3Ia%2BmR9tRSUG3TYQvZVZb3RzwwRCieOA0bq100m1khfsp6wygSEqWG2TNjqCOfsfd0mFS6AgDUXl0hdUxLPE5BsyUs%2F85mA9h8Hj9Tb7cEGWdXxuQJf7fiULNL%2FQKKlP1oTuarvf67t5pPAdPSBSDt6vwYLFzOcl5XACR0PVWTh9xYzE1BdczkY2a648KjtAd%2BJpVxPUirLH8wwJ6U1QY6pgGxay1RpRoUR0sQ4IixFi82OBq9MwZdyA%2Fbt9figamEpmau%2BSfo6eQMrTBxRykJs94SzYaMEUWbIg2Kjem1FGgzJx8GRM4J%2BGWSOBqKYySBEuInqWo861NVDVGRm%2FGC5zU1v3tfi%2BZOdrVmCf99UVkHxJ3%2B6a01O2eIZiacaxfrQJY7oX6RJe9fnnzry9SojJmQgbUphf5CK%2BzaGyGCVCtl1oJO2t1u&X-Amz-Signature=4392a483eb90e5ea59f9afe460ffc599e6637c701a63b9e4887bbdfc3c844c9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
