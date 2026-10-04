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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YQEAE64%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T203750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJHMEUCIQDx%2BO3V9OON3fkH50wrFs7iOWmH6K8dQR1WS5BoPFT8mQIgbVoltpKy4bygX99n9AE6Fbdfssao0RDNv07S7BUMM4QqiAQIzf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBOjUDNnpdSlIDTSwircAxP0pyH6WazibRrkqOgP34WxwfNnNpBbUuzgVyYd2fYpHP9w8Zo2yiu%2BRF6xbU%2BqoHo08ZkOdckIj9hlvKqgH1d8D32orHscMfUUldgzx%2Fddlx4%2FL1yg%2FU0FzQZyb0pSv1%2FA1G9527GGoELtkqOsTqT2rr%2FjW3YmA0M4voUnxZp6o2Y2b9z2K9BqRrpdxgzubQD6S3PSoAOwEXANeWUS50uFCypV326V0nAKZX1jhjBKjuQlgsHZd%2Bc2wM9cVxxaWt3fBPOuVDul%2BYr8leiiUVWWmW2L1%2B4QrC63ydJ8iMAgSL3soSKQujqNXRfnMTpSBWA1WAJqtX6feccMoiyOUwWhjMwMy59vFd8ElpyITnETLcKn%2B1gavF%2FgftVECWsKViL81eKcuMPFr3eYbrD%2BIvBDNcFS1hXyvVCwkF8BY0ERGj6P8e8fA2WBZuEOatRve6k0LEwU4zZtOsk9WrAEunbmImH%2FuGv2hBtHLDl64jKtxbZKC3hbCrv1SLJJquzsqOSLXBmqTAMJwAizq6CxPMq3%2BprAsaqT2zvQM0Q9Fp4ul3Iiw2r8mCLYqQzhSEEI5jetJu0eNGxEffzZ7sEbNzVwW4fUPeyjrYmGbrmkxH34OUngI%2BmuneaLAxo4MOjeitYGOqUBDbfAITDkH%2Fe5Cuk%2FqDhEI0m4XLwY8PrSt%2FByY9QrnMi5Hov2R9mg2QQAdOfddjG69OMn%2BCAthPsK8WJiht91rdA7dCaZgVZR4t58BQmfmxkSu5B1O%2Bo2f%2F2wO%2BzSVoCZjRTAlLsQ9Vs64urO6BaNhtu5k4gVP5oYqLj%2FSqf%2FJQ%2Bwq%2FGDsGo%2FJxDwO%2Fbwo16MJ0bz%2BflBJvae7g1xTbiHD8eHAF2d&X-Amz-Signature=b17350818c33c4c0db88787c3dfc089dbb549495317241f9f00b971cf5275dd9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YQEAE64%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T203750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJHMEUCIQDx%2BO3V9OON3fkH50wrFs7iOWmH6K8dQR1WS5BoPFT8mQIgbVoltpKy4bygX99n9AE6Fbdfssao0RDNv07S7BUMM4QqiAQIzf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBOjUDNnpdSlIDTSwircAxP0pyH6WazibRrkqOgP34WxwfNnNpBbUuzgVyYd2fYpHP9w8Zo2yiu%2BRF6xbU%2BqoHo08ZkOdckIj9hlvKqgH1d8D32orHscMfUUldgzx%2Fddlx4%2FL1yg%2FU0FzQZyb0pSv1%2FA1G9527GGoELtkqOsTqT2rr%2FjW3YmA0M4voUnxZp6o2Y2b9z2K9BqRrpdxgzubQD6S3PSoAOwEXANeWUS50uFCypV326V0nAKZX1jhjBKjuQlgsHZd%2Bc2wM9cVxxaWt3fBPOuVDul%2BYr8leiiUVWWmW2L1%2B4QrC63ydJ8iMAgSL3soSKQujqNXRfnMTpSBWA1WAJqtX6feccMoiyOUwWhjMwMy59vFd8ElpyITnETLcKn%2B1gavF%2FgftVECWsKViL81eKcuMPFr3eYbrD%2BIvBDNcFS1hXyvVCwkF8BY0ERGj6P8e8fA2WBZuEOatRve6k0LEwU4zZtOsk9WrAEunbmImH%2FuGv2hBtHLDl64jKtxbZKC3hbCrv1SLJJquzsqOSLXBmqTAMJwAizq6CxPMq3%2BprAsaqT2zvQM0Q9Fp4ul3Iiw2r8mCLYqQzhSEEI5jetJu0eNGxEffzZ7sEbNzVwW4fUPeyjrYmGbrmkxH34OUngI%2BmuneaLAxo4MOjeitYGOqUBDbfAITDkH%2Fe5Cuk%2FqDhEI0m4XLwY8PrSt%2FByY9QrnMi5Hov2R9mg2QQAdOfddjG69OMn%2BCAthPsK8WJiht91rdA7dCaZgVZR4t58BQmfmxkSu5B1O%2Bo2f%2F2wO%2BzSVoCZjRTAlLsQ9Vs64urO6BaNhtu5k4gVP5oYqLj%2FSqf%2FJQ%2Bwq%2FGDsGo%2FJxDwO%2Fbwo16MJ0bz%2BflBJvae7g1xTbiHD8eHAF2d&X-Amz-Signature=4a85cde7fc6c334a7ba976c8a41cc75ff8e73b9ad2e487e47c9baca110544790&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YQEAE64%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T203750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJHMEUCIQDx%2BO3V9OON3fkH50wrFs7iOWmH6K8dQR1WS5BoPFT8mQIgbVoltpKy4bygX99n9AE6Fbdfssao0RDNv07S7BUMM4QqiAQIzf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBOjUDNnpdSlIDTSwircAxP0pyH6WazibRrkqOgP34WxwfNnNpBbUuzgVyYd2fYpHP9w8Zo2yiu%2BRF6xbU%2BqoHo08ZkOdckIj9hlvKqgH1d8D32orHscMfUUldgzx%2Fddlx4%2FL1yg%2FU0FzQZyb0pSv1%2FA1G9527GGoELtkqOsTqT2rr%2FjW3YmA0M4voUnxZp6o2Y2b9z2K9BqRrpdxgzubQD6S3PSoAOwEXANeWUS50uFCypV326V0nAKZX1jhjBKjuQlgsHZd%2Bc2wM9cVxxaWt3fBPOuVDul%2BYr8leiiUVWWmW2L1%2B4QrC63ydJ8iMAgSL3soSKQujqNXRfnMTpSBWA1WAJqtX6feccMoiyOUwWhjMwMy59vFd8ElpyITnETLcKn%2B1gavF%2FgftVECWsKViL81eKcuMPFr3eYbrD%2BIvBDNcFS1hXyvVCwkF8BY0ERGj6P8e8fA2WBZuEOatRve6k0LEwU4zZtOsk9WrAEunbmImH%2FuGv2hBtHLDl64jKtxbZKC3hbCrv1SLJJquzsqOSLXBmqTAMJwAizq6CxPMq3%2BprAsaqT2zvQM0Q9Fp4ul3Iiw2r8mCLYqQzhSEEI5jetJu0eNGxEffzZ7sEbNzVwW4fUPeyjrYmGbrmkxH34OUngI%2BmuneaLAxo4MOjeitYGOqUBDbfAITDkH%2Fe5Cuk%2FqDhEI0m4XLwY8PrSt%2FByY9QrnMi5Hov2R9mg2QQAdOfddjG69OMn%2BCAthPsK8WJiht91rdA7dCaZgVZR4t58BQmfmxkSu5B1O%2Bo2f%2F2wO%2BzSVoCZjRTAlLsQ9Vs64urO6BaNhtu5k4gVP5oYqLj%2FSqf%2FJQ%2Bwq%2FGDsGo%2FJxDwO%2Fbwo16MJ0bz%2BflBJvae7g1xTbiHD8eHAF2d&X-Amz-Signature=21d17945661e4e9c5017210009a13b3a933c717d398022522603295bdc0d0800&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663YQEAE64%2F20261004%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261004T203750Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAQaCXVzLXdlc3QtMiJHMEUCIQDx%2BO3V9OON3fkH50wrFs7iOWmH6K8dQR1WS5BoPFT8mQIgbVoltpKy4bygX99n9AE6Fbdfssao0RDNv07S7BUMM4QqiAQIzf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBOjUDNnpdSlIDTSwircAxP0pyH6WazibRrkqOgP34WxwfNnNpBbUuzgVyYd2fYpHP9w8Zo2yiu%2BRF6xbU%2BqoHo08ZkOdckIj9hlvKqgH1d8D32orHscMfUUldgzx%2Fddlx4%2FL1yg%2FU0FzQZyb0pSv1%2FA1G9527GGoELtkqOsTqT2rr%2FjW3YmA0M4voUnxZp6o2Y2b9z2K9BqRrpdxgzubQD6S3PSoAOwEXANeWUS50uFCypV326V0nAKZX1jhjBKjuQlgsHZd%2Bc2wM9cVxxaWt3fBPOuVDul%2BYr8leiiUVWWmW2L1%2B4QrC63ydJ8iMAgSL3soSKQujqNXRfnMTpSBWA1WAJqtX6feccMoiyOUwWhjMwMy59vFd8ElpyITnETLcKn%2B1gavF%2FgftVECWsKViL81eKcuMPFr3eYbrD%2BIvBDNcFS1hXyvVCwkF8BY0ERGj6P8e8fA2WBZuEOatRve6k0LEwU4zZtOsk9WrAEunbmImH%2FuGv2hBtHLDl64jKtxbZKC3hbCrv1SLJJquzsqOSLXBmqTAMJwAizq6CxPMq3%2BprAsaqT2zvQM0Q9Fp4ul3Iiw2r8mCLYqQzhSEEI5jetJu0eNGxEffzZ7sEbNzVwW4fUPeyjrYmGbrmkxH34OUngI%2BmuneaLAxo4MOjeitYGOqUBDbfAITDkH%2Fe5Cuk%2FqDhEI0m4XLwY8PrSt%2FByY9QrnMi5Hov2R9mg2QQAdOfddjG69OMn%2BCAthPsK8WJiht91rdA7dCaZgVZR4t58BQmfmxkSu5B1O%2Bo2f%2F2wO%2BzSVoCZjRTAlLsQ9Vs64urO6BaNhtu5k4gVP5oYqLj%2FSqf%2FJQ%2Bwq%2FGDsGo%2FJxDwO%2Fbwo16MJ0bz%2BflBJvae7g1xTbiHD8eHAF2d&X-Amz-Signature=d2008f417de86d2f5d2928cf802ee801e44e38b063438f7ad7670e7112c74c9e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
