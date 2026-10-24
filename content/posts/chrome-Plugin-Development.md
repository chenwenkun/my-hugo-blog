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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOGZUEOO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T022559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA3pXYKkGGx6WnJEjLRvoyWRfg13G83qBTmNeCplgmfxAiBP47cZSo%2Bpc6rLjJNqC0RsRENbHLxQoTwfd%2Bdnp7WTCyqIBAia%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOuLCf513vM9ZTasRKtwDDRf9HxabNNpm5LuBB96OzUfpC7N0jz%2F2PBv3CDEoTRJWgTOikb60NJkweV7IZRuNX%2Be8eI3WrkRtDS2jHcX7Ujns%2FjQflNfZbNxe0cR6ElkbpqCMY8QWPwHK5uZtmiYJRR1tvox3pOU6HPS4AfWrbc7x21bsFf0qAP%2BBKxaG3%2Bf5MBFf1wb%2Fbov8IrPi0CH2LUQbmUnDBYV0dsZRQcS0tDAoyRGzVytw7DlgWuMU%2BQeV8wy4QLvrnPqNDi7uKBxdYiNQ81bDMTwGKvkgvecUzvLji5jaUWfXQP1QTlgjrMdoMlYYjhQjsS2uXZxDujHz4TGGQJ1tt6by99AK8mt%2F8dcg1T1DxVWNxbYQCF05of6KmxAkAF49BIB8WpczA4IdXoVGHSUMm9uufA%2BMO3tG3luy4IYFK22GQ2mFimHmB3%2B%2B6uyIik9Wx8DrZo0r4JVVK08KGRnUp6OMYpqZ%2FizvOvQkapeshpv6CoKRXBMRtvNO8u5aGiq3LSt4xjd%2FiVNsh46FI2nTXbhfP9Ij6x2d6ea20XjRo64ZZD64I2%2BeEJXY5%2BHnTGDRcL8ODcBJosPMcTgEcKZ7LLOoR56exFIeM22awUK4d73Dcc4cewQ31ERZwpbD3atB5jzF6bUwzY7w1gY6pgExzzXxBZJxufWQsjqZtqAw7s%2FJfxjT0P0DLZqsfX6u%2FbN0G%2FZIXliPV6vsGXicCzx%2BwmDX41cTPaF4HuE1Iz0Wfznpx8xvrF1WAivlr%2B%2FKn6UXewOAjNaHWeUtodTJ5fJaY9PbpuscHzWOrVwjQr3Cw90gWTTfN1eH07JvE8WLROOGBCB2zuSG9QrFxPCEOglx8foJyVdOgRgw5c%2Bg9aqHMaw%2BnrSB&X-Amz-Signature=319bb9580542893573171901b94af6ebf2e792eea66d193a85e9a87ffb6eca6f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOGZUEOO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T022559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA3pXYKkGGx6WnJEjLRvoyWRfg13G83qBTmNeCplgmfxAiBP47cZSo%2Bpc6rLjJNqC0RsRENbHLxQoTwfd%2Bdnp7WTCyqIBAia%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOuLCf513vM9ZTasRKtwDDRf9HxabNNpm5LuBB96OzUfpC7N0jz%2F2PBv3CDEoTRJWgTOikb60NJkweV7IZRuNX%2Be8eI3WrkRtDS2jHcX7Ujns%2FjQflNfZbNxe0cR6ElkbpqCMY8QWPwHK5uZtmiYJRR1tvox3pOU6HPS4AfWrbc7x21bsFf0qAP%2BBKxaG3%2Bf5MBFf1wb%2Fbov8IrPi0CH2LUQbmUnDBYV0dsZRQcS0tDAoyRGzVytw7DlgWuMU%2BQeV8wy4QLvrnPqNDi7uKBxdYiNQ81bDMTwGKvkgvecUzvLji5jaUWfXQP1QTlgjrMdoMlYYjhQjsS2uXZxDujHz4TGGQJ1tt6by99AK8mt%2F8dcg1T1DxVWNxbYQCF05of6KmxAkAF49BIB8WpczA4IdXoVGHSUMm9uufA%2BMO3tG3luy4IYFK22GQ2mFimHmB3%2B%2B6uyIik9Wx8DrZo0r4JVVK08KGRnUp6OMYpqZ%2FizvOvQkapeshpv6CoKRXBMRtvNO8u5aGiq3LSt4xjd%2FiVNsh46FI2nTXbhfP9Ij6x2d6ea20XjRo64ZZD64I2%2BeEJXY5%2BHnTGDRcL8ODcBJosPMcTgEcKZ7LLOoR56exFIeM22awUK4d73Dcc4cewQ31ERZwpbD3atB5jzF6bUwzY7w1gY6pgExzzXxBZJxufWQsjqZtqAw7s%2FJfxjT0P0DLZqsfX6u%2FbN0G%2FZIXliPV6vsGXicCzx%2BwmDX41cTPaF4HuE1Iz0Wfznpx8xvrF1WAivlr%2B%2FKn6UXewOAjNaHWeUtodTJ5fJaY9PbpuscHzWOrVwjQr3Cw90gWTTfN1eH07JvE8WLROOGBCB2zuSG9QrFxPCEOglx8foJyVdOgRgw5c%2Bg9aqHMaw%2BnrSB&X-Amz-Signature=9ac61982c5739c046448cc0020f3bf4d749839330872e0871a675c1967bad5a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOGZUEOO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T022559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA3pXYKkGGx6WnJEjLRvoyWRfg13G83qBTmNeCplgmfxAiBP47cZSo%2Bpc6rLjJNqC0RsRENbHLxQoTwfd%2Bdnp7WTCyqIBAia%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOuLCf513vM9ZTasRKtwDDRf9HxabNNpm5LuBB96OzUfpC7N0jz%2F2PBv3CDEoTRJWgTOikb60NJkweV7IZRuNX%2Be8eI3WrkRtDS2jHcX7Ujns%2FjQflNfZbNxe0cR6ElkbpqCMY8QWPwHK5uZtmiYJRR1tvox3pOU6HPS4AfWrbc7x21bsFf0qAP%2BBKxaG3%2Bf5MBFf1wb%2Fbov8IrPi0CH2LUQbmUnDBYV0dsZRQcS0tDAoyRGzVytw7DlgWuMU%2BQeV8wy4QLvrnPqNDi7uKBxdYiNQ81bDMTwGKvkgvecUzvLji5jaUWfXQP1QTlgjrMdoMlYYjhQjsS2uXZxDujHz4TGGQJ1tt6by99AK8mt%2F8dcg1T1DxVWNxbYQCF05of6KmxAkAF49BIB8WpczA4IdXoVGHSUMm9uufA%2BMO3tG3luy4IYFK22GQ2mFimHmB3%2B%2B6uyIik9Wx8DrZo0r4JVVK08KGRnUp6OMYpqZ%2FizvOvQkapeshpv6CoKRXBMRtvNO8u5aGiq3LSt4xjd%2FiVNsh46FI2nTXbhfP9Ij6x2d6ea20XjRo64ZZD64I2%2BeEJXY5%2BHnTGDRcL8ODcBJosPMcTgEcKZ7LLOoR56exFIeM22awUK4d73Dcc4cewQ31ERZwpbD3atB5jzF6bUwzY7w1gY6pgExzzXxBZJxufWQsjqZtqAw7s%2FJfxjT0P0DLZqsfX6u%2FbN0G%2FZIXliPV6vsGXicCzx%2BwmDX41cTPaF4HuE1Iz0Wfznpx8xvrF1WAivlr%2B%2FKn6UXewOAjNaHWeUtodTJ5fJaY9PbpuscHzWOrVwjQr3Cw90gWTTfN1eH07JvE8WLROOGBCB2zuSG9QrFxPCEOglx8foJyVdOgRgw5c%2Bg9aqHMaw%2BnrSB&X-Amz-Signature=f58ba9d04ec2e845ebb4a2866965ce838a7ccde850f22b139bbd42ae27bae8b1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UOGZUEOO%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T022559Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA3pXYKkGGx6WnJEjLRvoyWRfg13G83qBTmNeCplgmfxAiBP47cZSo%2Bpc6rLjJNqC0RsRENbHLxQoTwfd%2Bdnp7WTCyqIBAia%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMOuLCf513vM9ZTasRKtwDDRf9HxabNNpm5LuBB96OzUfpC7N0jz%2F2PBv3CDEoTRJWgTOikb60NJkweV7IZRuNX%2Be8eI3WrkRtDS2jHcX7Ujns%2FjQflNfZbNxe0cR6ElkbpqCMY8QWPwHK5uZtmiYJRR1tvox3pOU6HPS4AfWrbc7x21bsFf0qAP%2BBKxaG3%2Bf5MBFf1wb%2Fbov8IrPi0CH2LUQbmUnDBYV0dsZRQcS0tDAoyRGzVytw7DlgWuMU%2BQeV8wy4QLvrnPqNDi7uKBxdYiNQ81bDMTwGKvkgvecUzvLji5jaUWfXQP1QTlgjrMdoMlYYjhQjsS2uXZxDujHz4TGGQJ1tt6by99AK8mt%2F8dcg1T1DxVWNxbYQCF05of6KmxAkAF49BIB8WpczA4IdXoVGHSUMm9uufA%2BMO3tG3luy4IYFK22GQ2mFimHmB3%2B%2B6uyIik9Wx8DrZo0r4JVVK08KGRnUp6OMYpqZ%2FizvOvQkapeshpv6CoKRXBMRtvNO8u5aGiq3LSt4xjd%2FiVNsh46FI2nTXbhfP9Ij6x2d6ea20XjRo64ZZD64I2%2BeEJXY5%2BHnTGDRcL8ODcBJosPMcTgEcKZ7LLOoR56exFIeM22awUK4d73Dcc4cewQ31ERZwpbD3atB5jzF6bUwzY7w1gY6pgExzzXxBZJxufWQsjqZtqAw7s%2FJfxjT0P0DLZqsfX6u%2FbN0G%2FZIXliPV6vsGXicCzx%2BwmDX41cTPaF4HuE1Iz0Wfznpx8xvrF1WAivlr%2B%2FKn6UXewOAjNaHWeUtodTJ5fJaY9PbpuscHzWOrVwjQr3Cw90gWTTfN1eH07JvE8WLROOGBCB2zuSG9QrFxPCEOglx8foJyVdOgRgw5c%2Bg9aqHMaw%2BnrSB&X-Amz-Signature=59b2388c19efd8c7207d94186ff98362ed29e7bd831d6ce1482bf130031671c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
