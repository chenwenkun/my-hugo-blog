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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667QPKTS7Z%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T035824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCO6RonWtDxvZ7m2oUDU8eDgG2tWXk0SBNsyrSN%2Bvz7AwIgJDTFjxn9GRNc3%2FzvlwKaFva7CBNbbJdD27%2FNEwIZ5cYqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKtILYe32C%2BIHrnv8yrcA1S7NV0Z33otd64htG0DXytXR5WFvgsBqW9eUU0JZOHAwQaR74WlABKO3D%2BFn2floNtR%2BZiB8y1toq%2FAuF8DaSqS0khghIrNhDRt6mLBd57%2B2424z3Up7oqbq7KDNMxsdPNpMReWrhrb4%2FY%2FD2mDYUoHazTN3ltIwldghMKbeHuqN%2Fs82Q5L3k61fhLa%2BMw4sZP3WDSlsCUjIxGCvwOnEH7JDexvEbUgrSiHvYryDwBuuBBY5aqCYlbWj7C0yGjNECK%2Fy4NDGlSKWxr0jEp9Leg%2FUjJehwnxF%2F1CSzUGJr6lA7UV7MMWD%2FZ7IRa%2FD5jS6mDQz%2B8IiCnqFcljFopiVFwNiHUONPjMz0B9p5YPvBcZibOYLxUdzB1bK%2FA3yb99U2bd%2FrBNcYpZP0mhaNsQT3kLyDlGrd1JRfDMlNdgbVjgR0PCYVMD1DLfTHDLue02Ja%2BgxnGJ%2BEasixrACiN6SZwR35bgMY6cFFg3Jp%2FdjMrDsZRW5DvjQuTABdQShlXfunXbrZYQm7WDJEApKndd1pPZlitpX1OidjYMbVMMWYNLHFhbaFIiCoaeG55mC8u%2BFx%2BHggbth2BoKlDLAcNDFckSDHbfOUs77wptKZHTRdDCNJoaZQh5shWeLgsqMKv23tcGOqUBBYuSAp%2BQg7rYFdpOl6W3z1udIBd5aAd%2BZnSRuk6UQ8S4SxUy19cTcZTo3miZhA%2F07lrRnmzoGoBQAikRojG%2B5Ya7JPLnwzYgpH8SLMb3YqVNGtwcPwQqi%2FufDxK%2BECm4JrfcpjOCVDXpQKafSIyvQsputErnydGUPaOBKC1P0TY98OH0dOP3VI6dJbRSqr0FNAA7A7iTgT7WrbEbljHb4Cla48b8&X-Amz-Signature=2fe8721ddc8d00371a7d46323ef2075fe1277fef4bf7cc2f4c3f92e3f9339e9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667QPKTS7Z%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T035824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCO6RonWtDxvZ7m2oUDU8eDgG2tWXk0SBNsyrSN%2Bvz7AwIgJDTFjxn9GRNc3%2FzvlwKaFva7CBNbbJdD27%2FNEwIZ5cYqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKtILYe32C%2BIHrnv8yrcA1S7NV0Z33otd64htG0DXytXR5WFvgsBqW9eUU0JZOHAwQaR74WlABKO3D%2BFn2floNtR%2BZiB8y1toq%2FAuF8DaSqS0khghIrNhDRt6mLBd57%2B2424z3Up7oqbq7KDNMxsdPNpMReWrhrb4%2FY%2FD2mDYUoHazTN3ltIwldghMKbeHuqN%2Fs82Q5L3k61fhLa%2BMw4sZP3WDSlsCUjIxGCvwOnEH7JDexvEbUgrSiHvYryDwBuuBBY5aqCYlbWj7C0yGjNECK%2Fy4NDGlSKWxr0jEp9Leg%2FUjJehwnxF%2F1CSzUGJr6lA7UV7MMWD%2FZ7IRa%2FD5jS6mDQz%2B8IiCnqFcljFopiVFwNiHUONPjMz0B9p5YPvBcZibOYLxUdzB1bK%2FA3yb99U2bd%2FrBNcYpZP0mhaNsQT3kLyDlGrd1JRfDMlNdgbVjgR0PCYVMD1DLfTHDLue02Ja%2BgxnGJ%2BEasixrACiN6SZwR35bgMY6cFFg3Jp%2FdjMrDsZRW5DvjQuTABdQShlXfunXbrZYQm7WDJEApKndd1pPZlitpX1OidjYMbVMMWYNLHFhbaFIiCoaeG55mC8u%2BFx%2BHggbth2BoKlDLAcNDFckSDHbfOUs77wptKZHTRdDCNJoaZQh5shWeLgsqMKv23tcGOqUBBYuSAp%2BQg7rYFdpOl6W3z1udIBd5aAd%2BZnSRuk6UQ8S4SxUy19cTcZTo3miZhA%2F07lrRnmzoGoBQAikRojG%2B5Ya7JPLnwzYgpH8SLMb3YqVNGtwcPwQqi%2FufDxK%2BECm4JrfcpjOCVDXpQKafSIyvQsputErnydGUPaOBKC1P0TY98OH0dOP3VI6dJbRSqr0FNAA7A7iTgT7WrbEbljHb4Cla48b8&X-Amz-Signature=6d65d0fb20e2df70be0a20dfdd286122f55a95da6edb32cc298ba4b714032f67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667QPKTS7Z%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T035824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCO6RonWtDxvZ7m2oUDU8eDgG2tWXk0SBNsyrSN%2Bvz7AwIgJDTFjxn9GRNc3%2FzvlwKaFva7CBNbbJdD27%2FNEwIZ5cYqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKtILYe32C%2BIHrnv8yrcA1S7NV0Z33otd64htG0DXytXR5WFvgsBqW9eUU0JZOHAwQaR74WlABKO3D%2BFn2floNtR%2BZiB8y1toq%2FAuF8DaSqS0khghIrNhDRt6mLBd57%2B2424z3Up7oqbq7KDNMxsdPNpMReWrhrb4%2FY%2FD2mDYUoHazTN3ltIwldghMKbeHuqN%2Fs82Q5L3k61fhLa%2BMw4sZP3WDSlsCUjIxGCvwOnEH7JDexvEbUgrSiHvYryDwBuuBBY5aqCYlbWj7C0yGjNECK%2Fy4NDGlSKWxr0jEp9Leg%2FUjJehwnxF%2F1CSzUGJr6lA7UV7MMWD%2FZ7IRa%2FD5jS6mDQz%2B8IiCnqFcljFopiVFwNiHUONPjMz0B9p5YPvBcZibOYLxUdzB1bK%2FA3yb99U2bd%2FrBNcYpZP0mhaNsQT3kLyDlGrd1JRfDMlNdgbVjgR0PCYVMD1DLfTHDLue02Ja%2BgxnGJ%2BEasixrACiN6SZwR35bgMY6cFFg3Jp%2FdjMrDsZRW5DvjQuTABdQShlXfunXbrZYQm7WDJEApKndd1pPZlitpX1OidjYMbVMMWYNLHFhbaFIiCoaeG55mC8u%2BFx%2BHggbth2BoKlDLAcNDFckSDHbfOUs77wptKZHTRdDCNJoaZQh5shWeLgsqMKv23tcGOqUBBYuSAp%2BQg7rYFdpOl6W3z1udIBd5aAd%2BZnSRuk6UQ8S4SxUy19cTcZTo3miZhA%2F07lrRnmzoGoBQAikRojG%2B5Ya7JPLnwzYgpH8SLMb3YqVNGtwcPwQqi%2FufDxK%2BECm4JrfcpjOCVDXpQKafSIyvQsputErnydGUPaOBKC1P0TY98OH0dOP3VI6dJbRSqr0FNAA7A7iTgT7WrbEbljHb4Cla48b8&X-Amz-Signature=bd20d4a13d2149e63ade977b0e6300a58e52f35c7c6f706bd03879b72e836bd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667QPKTS7Z%2F20261114%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261114T035824Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCO6RonWtDxvZ7m2oUDU8eDgG2tWXk0SBNsyrSN%2Bvz7AwIgJDTFjxn9GRNc3%2FzvlwKaFva7CBNbbJdD27%2FNEwIZ5cYqiAQIkv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKtILYe32C%2BIHrnv8yrcA1S7NV0Z33otd64htG0DXytXR5WFvgsBqW9eUU0JZOHAwQaR74WlABKO3D%2BFn2floNtR%2BZiB8y1toq%2FAuF8DaSqS0khghIrNhDRt6mLBd57%2B2424z3Up7oqbq7KDNMxsdPNpMReWrhrb4%2FY%2FD2mDYUoHazTN3ltIwldghMKbeHuqN%2Fs82Q5L3k61fhLa%2BMw4sZP3WDSlsCUjIxGCvwOnEH7JDexvEbUgrSiHvYryDwBuuBBY5aqCYlbWj7C0yGjNECK%2Fy4NDGlSKWxr0jEp9Leg%2FUjJehwnxF%2F1CSzUGJr6lA7UV7MMWD%2FZ7IRa%2FD5jS6mDQz%2B8IiCnqFcljFopiVFwNiHUONPjMz0B9p5YPvBcZibOYLxUdzB1bK%2FA3yb99U2bd%2FrBNcYpZP0mhaNsQT3kLyDlGrd1JRfDMlNdgbVjgR0PCYVMD1DLfTHDLue02Ja%2BgxnGJ%2BEasixrACiN6SZwR35bgMY6cFFg3Jp%2FdjMrDsZRW5DvjQuTABdQShlXfunXbrZYQm7WDJEApKndd1pPZlitpX1OidjYMbVMMWYNLHFhbaFIiCoaeG55mC8u%2BFx%2BHggbth2BoKlDLAcNDFckSDHbfOUs77wptKZHTRdDCNJoaZQh5shWeLgsqMKv23tcGOqUBBYuSAp%2BQg7rYFdpOl6W3z1udIBd5aAd%2BZnSRuk6UQ8S4SxUy19cTcZTo3miZhA%2F07lrRnmzoGoBQAikRojG%2B5Ya7JPLnwzYgpH8SLMb3YqVNGtwcPwQqi%2FufDxK%2BECm4JrfcpjOCVDXpQKafSIyvQsputErnydGUPaOBKC1P0TY98OH0dOP3VI6dJbRSqr0FNAA7A7iTgT7WrbEbljHb4Cla48b8&X-Amz-Signature=3426518be74c8b1944313f7be26100d7d76d65436eed966e50ae1e8580d62a95&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
