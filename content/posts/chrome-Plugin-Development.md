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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WNEDMFGI%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T104258Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQDN%2Bu0s0lj%2BUM0VzZAy%2FYNPkqKiDjn%2FEWOJicUllpPXJwIgT1m7YOzgqYev9sm759ihS6PIlNli6CkW1XL14v2RhiYqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFdsa2YAmkbiwXYanCrcA4J%2FABdBdGD4qhtx9A6fazIQMcpR8PNJly3NXDNj50u85sRhqvcZXhUEtbYGjg1EW7hJJjZtTtgbRiScHX%2B5FdsSwk%2BGItLzFgP6hebKrR4FeK2KzOeuVl0s254k0ysUdJ%2BmYmtG49frHttcQA70W%2BsvcsnGbPKm765xcRpUWpOE1ZB7yZEUPqQfwiG3TFwj15iJe8y%2BleW18CoJjdl5x7wz%2Fht6S366NuCsnmBi6RccofZm70UvgDo8cKRlNiWlulLBaI7ITBlKJS98HcIvyOo9c5dOxBgFrDu5bLs9ueCKS4hsxUHWWflAOQs4MN%2F7wTISLjnlW8AC2kkBeh5QnIKMRr6iOY4HyPL8SYlWwClcRDAQltEUH6BE%2B%2FYNL075F44rGmDkDN6g7HDGtmN0TDvtqaq3rFmg5BLB3%2BH5Qq%2FLBWe9WlM4y2sRKo5pZv%2BOq8cVB7CzypQ%2BjoG%2FTM50DqOsY4w%2BgWBkPK3bLKqGoDOgtIrpPuzupY964dC%2Bvn%2B30K5zQxD8Jaehm2vHZt5wmfLAFDeHrLQGrdDP94p9QSVTmcDHDY07%2Bp7GGkX6pRqr5mNIHyVxxEXwD6P9QL3xE5ZKBo%2FUWqUhFG2pIVsC0%2BIkdHArAT4sB6%2FolkClML%2Fe09UGOqUBl6rF2npJmOwwq2A1TjQeC%2FDk9YJG%2BPmrlFgWdYG5QB4yJvcrK2PMPFJrGiS6BFqmaNE%2Fw9Tj9tokDhTBLjHmpQgsjSlZcU2L4dRgJXry%2FzD055pAaASefwqgiR1n4MD9%2BUzYd1xBNQ1f8oD6FnREkaLxxyXXKr3SLf%2F7LxBQUYRwN1eqZfSQJjwmXux%2FXbN10e9C5PfNWxeIPye7UmqFXWvGaj5%2F&X-Amz-Signature=e6b03801bc5bfec20db13bc161b58683d10a7f7cd5b25f7180278f15f552f0a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WNEDMFGI%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T104258Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQDN%2Bu0s0lj%2BUM0VzZAy%2FYNPkqKiDjn%2FEWOJicUllpPXJwIgT1m7YOzgqYev9sm759ihS6PIlNli6CkW1XL14v2RhiYqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFdsa2YAmkbiwXYanCrcA4J%2FABdBdGD4qhtx9A6fazIQMcpR8PNJly3NXDNj50u85sRhqvcZXhUEtbYGjg1EW7hJJjZtTtgbRiScHX%2B5FdsSwk%2BGItLzFgP6hebKrR4FeK2KzOeuVl0s254k0ysUdJ%2BmYmtG49frHttcQA70W%2BsvcsnGbPKm765xcRpUWpOE1ZB7yZEUPqQfwiG3TFwj15iJe8y%2BleW18CoJjdl5x7wz%2Fht6S366NuCsnmBi6RccofZm70UvgDo8cKRlNiWlulLBaI7ITBlKJS98HcIvyOo9c5dOxBgFrDu5bLs9ueCKS4hsxUHWWflAOQs4MN%2F7wTISLjnlW8AC2kkBeh5QnIKMRr6iOY4HyPL8SYlWwClcRDAQltEUH6BE%2B%2FYNL075F44rGmDkDN6g7HDGtmN0TDvtqaq3rFmg5BLB3%2BH5Qq%2FLBWe9WlM4y2sRKo5pZv%2BOq8cVB7CzypQ%2BjoG%2FTM50DqOsY4w%2BgWBkPK3bLKqGoDOgtIrpPuzupY964dC%2Bvn%2B30K5zQxD8Jaehm2vHZt5wmfLAFDeHrLQGrdDP94p9QSVTmcDHDY07%2Bp7GGkX6pRqr5mNIHyVxxEXwD6P9QL3xE5ZKBo%2FUWqUhFG2pIVsC0%2BIkdHArAT4sB6%2FolkClML%2Fe09UGOqUBl6rF2npJmOwwq2A1TjQeC%2FDk9YJG%2BPmrlFgWdYG5QB4yJvcrK2PMPFJrGiS6BFqmaNE%2Fw9Tj9tokDhTBLjHmpQgsjSlZcU2L4dRgJXry%2FzD055pAaASefwqgiR1n4MD9%2BUzYd1xBNQ1f8oD6FnREkaLxxyXXKr3SLf%2F7LxBQUYRwN1eqZfSQJjwmXux%2FXbN10e9C5PfNWxeIPye7UmqFXWvGaj5%2F&X-Amz-Signature=972ff6b189fd24b622361df35c65cfe249f503c4d1909bdc6b10c633986226b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WNEDMFGI%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T104258Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQDN%2Bu0s0lj%2BUM0VzZAy%2FYNPkqKiDjn%2FEWOJicUllpPXJwIgT1m7YOzgqYev9sm759ihS6PIlNli6CkW1XL14v2RhiYqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFdsa2YAmkbiwXYanCrcA4J%2FABdBdGD4qhtx9A6fazIQMcpR8PNJly3NXDNj50u85sRhqvcZXhUEtbYGjg1EW7hJJjZtTtgbRiScHX%2B5FdsSwk%2BGItLzFgP6hebKrR4FeK2KzOeuVl0s254k0ysUdJ%2BmYmtG49frHttcQA70W%2BsvcsnGbPKm765xcRpUWpOE1ZB7yZEUPqQfwiG3TFwj15iJe8y%2BleW18CoJjdl5x7wz%2Fht6S366NuCsnmBi6RccofZm70UvgDo8cKRlNiWlulLBaI7ITBlKJS98HcIvyOo9c5dOxBgFrDu5bLs9ueCKS4hsxUHWWflAOQs4MN%2F7wTISLjnlW8AC2kkBeh5QnIKMRr6iOY4HyPL8SYlWwClcRDAQltEUH6BE%2B%2FYNL075F44rGmDkDN6g7HDGtmN0TDvtqaq3rFmg5BLB3%2BH5Qq%2FLBWe9WlM4y2sRKo5pZv%2BOq8cVB7CzypQ%2BjoG%2FTM50DqOsY4w%2BgWBkPK3bLKqGoDOgtIrpPuzupY964dC%2Bvn%2B30K5zQxD8Jaehm2vHZt5wmfLAFDeHrLQGrdDP94p9QSVTmcDHDY07%2Bp7GGkX6pRqr5mNIHyVxxEXwD6P9QL3xE5ZKBo%2FUWqUhFG2pIVsC0%2BIkdHArAT4sB6%2FolkClML%2Fe09UGOqUBl6rF2npJmOwwq2A1TjQeC%2FDk9YJG%2BPmrlFgWdYG5QB4yJvcrK2PMPFJrGiS6BFqmaNE%2Fw9Tj9tokDhTBLjHmpQgsjSlZcU2L4dRgJXry%2FzD055pAaASefwqgiR1n4MD9%2BUzYd1xBNQ1f8oD6FnREkaLxxyXXKr3SLf%2F7LxBQUYRwN1eqZfSQJjwmXux%2FXbN10e9C5PfNWxeIPye7UmqFXWvGaj5%2F&X-Amz-Signature=d04186f6599a1538098bd277d2d590714cac5f96daf4bc37876fbac1441f48df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WNEDMFGI%2F20260924%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260924T104258Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAoaCXVzLXdlc3QtMiJHMEUCIQDN%2Bu0s0lj%2BUM0VzZAy%2FYNPkqKiDjn%2FEWOJicUllpPXJwIgT1m7YOzgqYev9sm759ihS6PIlNli6CkW1XL14v2RhiYqiAQI0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFdsa2YAmkbiwXYanCrcA4J%2FABdBdGD4qhtx9A6fazIQMcpR8PNJly3NXDNj50u85sRhqvcZXhUEtbYGjg1EW7hJJjZtTtgbRiScHX%2B5FdsSwk%2BGItLzFgP6hebKrR4FeK2KzOeuVl0s254k0ysUdJ%2BmYmtG49frHttcQA70W%2BsvcsnGbPKm765xcRpUWpOE1ZB7yZEUPqQfwiG3TFwj15iJe8y%2BleW18CoJjdl5x7wz%2Fht6S366NuCsnmBi6RccofZm70UvgDo8cKRlNiWlulLBaI7ITBlKJS98HcIvyOo9c5dOxBgFrDu5bLs9ueCKS4hsxUHWWflAOQs4MN%2F7wTISLjnlW8AC2kkBeh5QnIKMRr6iOY4HyPL8SYlWwClcRDAQltEUH6BE%2B%2FYNL075F44rGmDkDN6g7HDGtmN0TDvtqaq3rFmg5BLB3%2BH5Qq%2FLBWe9WlM4y2sRKo5pZv%2BOq8cVB7CzypQ%2BjoG%2FTM50DqOsY4w%2BgWBkPK3bLKqGoDOgtIrpPuzupY964dC%2Bvn%2B30K5zQxD8Jaehm2vHZt5wmfLAFDeHrLQGrdDP94p9QSVTmcDHDY07%2Bp7GGkX6pRqr5mNIHyVxxEXwD6P9QL3xE5ZKBo%2FUWqUhFG2pIVsC0%2BIkdHArAT4sB6%2FolkClML%2Fe09UGOqUBl6rF2npJmOwwq2A1TjQeC%2FDk9YJG%2BPmrlFgWdYG5QB4yJvcrK2PMPFJrGiS6BFqmaNE%2Fw9Tj9tokDhTBLjHmpQgsjSlZcU2L4dRgJXry%2FzD055pAaASefwqgiR1n4MD9%2BUzYd1xBNQ1f8oD6FnREkaLxxyXXKr3SLf%2F7LxBQUYRwN1eqZfSQJjwmXux%2FXbN10e9C5PfNWxeIPye7UmqFXWvGaj5%2F&X-Amz-Signature=0286f3b33b7dd7186bca37a6ec03c9c9d6f8aee1196ab1628a76c4632caaa52c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
