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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMO3R63X%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T063311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDPQLQsAmCp7DkUnX6U%2F9IJbeWom3ucSdg23HtinhQaKwIgPxANOE1ZvIMg%2F9%2FkULrsBG%2FWrUn7Eqecp5c0Vxb2HXEq%2FwMIZhAAGgw2Mzc0MjMxODM4MDUiDAoXdrpO21nk2xDaaSrcA3PTghl96uzxmg%2BuADxbweka9cN1PF1rrGF%2FGIXNuq8wOZAz6vZgw8zIM2RTAzl0bbMj27jMAILLGStRPynbntxXxmerasPYrIUs%2FjMKnv0Qu6CgENaMPXGZ9U%2FdXKH0ht3fplHT0f5bfLMFMXDGkPviM%2Fhl4RnKtR7kaqYE9SogcWoeKmxLsFnTmgjIx7HrE0Q8fXXu7OD%2F3nEaaCk93oL4vdZ3tRbHnoGn35bJ1uvxMGEtsLwxtDDf%2FGsuZMk%2Fi2cShWsRznz90hwhl8%2Frba%2Bg79mMMfm4TNcbPL5xcI7c2osZI1IhLl%2BqEt8UvRnhL2BWT%2BvvuEh7acnXP1WQlXsCqvi0p92IJZt7Zd5rpIsKN1KuSJWZt8hBnl%2Bt7HVAKXV85jyTJpW1cNQmH0hVPcPhgF4wV5jN5NSfB1PhzBMfblayFCB9db%2FonIA6zGm7lQZWq3XNbKyIHTZ8EOr9oZ%2FccKbUZuvMuuwF%2FlxkPyxr%2FnrSkycvtsV2ULn0Kh0qyzOp%2BXNwRx8bs8j5d5SKWK9cYuU2g7FgvrWEBfCNa6MC%2Bmn1726XhSz07px6tmMZFFgQE%2F3pJdEyfVj2u5ULj4kK2bsI6tu%2BsUmvQvH8dckQ4mjlu%2B8dmOK6T53fMO%2Fu2tMGOqUBknA%2FXIsW4c2DWfqMh%2FV%2Bn7r4eHJv48K8VReqcw27Ute4yH1W2vMufDl44JeTAZmoSuTGZ0rl28jEbZWJnwnZ5Iy5fvSgUKTPq%2BmwMckIXaGG7gDm6c%2BlC8Omw6OvZ6L%2Be93NvD3ldahnSs8XOxRYJNBarE1tYOAca3MgFs9YdqK0mp9F9Tus6IPRW6kSmeqGjchUAQItV6QFqQsGWKSY44YXJyIk&X-Amz-Signature=cc8cd6e54f0b51e33608c201b1d3a423f9a69803ccc863dc70074ab9db2e5c0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMO3R63X%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T063311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDPQLQsAmCp7DkUnX6U%2F9IJbeWom3ucSdg23HtinhQaKwIgPxANOE1ZvIMg%2F9%2FkULrsBG%2FWrUn7Eqecp5c0Vxb2HXEq%2FwMIZhAAGgw2Mzc0MjMxODM4MDUiDAoXdrpO21nk2xDaaSrcA3PTghl96uzxmg%2BuADxbweka9cN1PF1rrGF%2FGIXNuq8wOZAz6vZgw8zIM2RTAzl0bbMj27jMAILLGStRPynbntxXxmerasPYrIUs%2FjMKnv0Qu6CgENaMPXGZ9U%2FdXKH0ht3fplHT0f5bfLMFMXDGkPviM%2Fhl4RnKtR7kaqYE9SogcWoeKmxLsFnTmgjIx7HrE0Q8fXXu7OD%2F3nEaaCk93oL4vdZ3tRbHnoGn35bJ1uvxMGEtsLwxtDDf%2FGsuZMk%2Fi2cShWsRznz90hwhl8%2Frba%2Bg79mMMfm4TNcbPL5xcI7c2osZI1IhLl%2BqEt8UvRnhL2BWT%2BvvuEh7acnXP1WQlXsCqvi0p92IJZt7Zd5rpIsKN1KuSJWZt8hBnl%2Bt7HVAKXV85jyTJpW1cNQmH0hVPcPhgF4wV5jN5NSfB1PhzBMfblayFCB9db%2FonIA6zGm7lQZWq3XNbKyIHTZ8EOr9oZ%2FccKbUZuvMuuwF%2FlxkPyxr%2FnrSkycvtsV2ULn0Kh0qyzOp%2BXNwRx8bs8j5d5SKWK9cYuU2g7FgvrWEBfCNa6MC%2Bmn1726XhSz07px6tmMZFFgQE%2F3pJdEyfVj2u5ULj4kK2bsI6tu%2BsUmvQvH8dckQ4mjlu%2B8dmOK6T53fMO%2Fu2tMGOqUBknA%2FXIsW4c2DWfqMh%2FV%2Bn7r4eHJv48K8VReqcw27Ute4yH1W2vMufDl44JeTAZmoSuTGZ0rl28jEbZWJnwnZ5Iy5fvSgUKTPq%2BmwMckIXaGG7gDm6c%2BlC8Omw6OvZ6L%2Be93NvD3ldahnSs8XOxRYJNBarE1tYOAca3MgFs9YdqK0mp9F9Tus6IPRW6kSmeqGjchUAQItV6QFqQsGWKSY44YXJyIk&X-Amz-Signature=9e8fb59010ef52dfdde557deb444c7e39ce95e625fad3fd4cbe0225f82c2efdb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMO3R63X%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T063311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDPQLQsAmCp7DkUnX6U%2F9IJbeWom3ucSdg23HtinhQaKwIgPxANOE1ZvIMg%2F9%2FkULrsBG%2FWrUn7Eqecp5c0Vxb2HXEq%2FwMIZhAAGgw2Mzc0MjMxODM4MDUiDAoXdrpO21nk2xDaaSrcA3PTghl96uzxmg%2BuADxbweka9cN1PF1rrGF%2FGIXNuq8wOZAz6vZgw8zIM2RTAzl0bbMj27jMAILLGStRPynbntxXxmerasPYrIUs%2FjMKnv0Qu6CgENaMPXGZ9U%2FdXKH0ht3fplHT0f5bfLMFMXDGkPviM%2Fhl4RnKtR7kaqYE9SogcWoeKmxLsFnTmgjIx7HrE0Q8fXXu7OD%2F3nEaaCk93oL4vdZ3tRbHnoGn35bJ1uvxMGEtsLwxtDDf%2FGsuZMk%2Fi2cShWsRznz90hwhl8%2Frba%2Bg79mMMfm4TNcbPL5xcI7c2osZI1IhLl%2BqEt8UvRnhL2BWT%2BvvuEh7acnXP1WQlXsCqvi0p92IJZt7Zd5rpIsKN1KuSJWZt8hBnl%2Bt7HVAKXV85jyTJpW1cNQmH0hVPcPhgF4wV5jN5NSfB1PhzBMfblayFCB9db%2FonIA6zGm7lQZWq3XNbKyIHTZ8EOr9oZ%2FccKbUZuvMuuwF%2FlxkPyxr%2FnrSkycvtsV2ULn0Kh0qyzOp%2BXNwRx8bs8j5d5SKWK9cYuU2g7FgvrWEBfCNa6MC%2Bmn1726XhSz07px6tmMZFFgQE%2F3pJdEyfVj2u5ULj4kK2bsI6tu%2BsUmvQvH8dckQ4mjlu%2B8dmOK6T53fMO%2Fu2tMGOqUBknA%2FXIsW4c2DWfqMh%2FV%2Bn7r4eHJv48K8VReqcw27Ute4yH1W2vMufDl44JeTAZmoSuTGZ0rl28jEbZWJnwnZ5Iy5fvSgUKTPq%2BmwMckIXaGG7gDm6c%2BlC8Omw6OvZ6L%2Be93NvD3ldahnSs8XOxRYJNBarE1tYOAca3MgFs9YdqK0mp9F9Tus6IPRW6kSmeqGjchUAQItV6QFqQsGWKSY44YXJyIk&X-Amz-Signature=5ce9265b24246fc7daef08cbc1f09e84c0b8ed4544554c78c62a7ffb51ed1626&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMO3R63X%2F20260808%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260808T063311Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDPQLQsAmCp7DkUnX6U%2F9IJbeWom3ucSdg23HtinhQaKwIgPxANOE1ZvIMg%2F9%2FkULrsBG%2FWrUn7Eqecp5c0Vxb2HXEq%2FwMIZhAAGgw2Mzc0MjMxODM4MDUiDAoXdrpO21nk2xDaaSrcA3PTghl96uzxmg%2BuADxbweka9cN1PF1rrGF%2FGIXNuq8wOZAz6vZgw8zIM2RTAzl0bbMj27jMAILLGStRPynbntxXxmerasPYrIUs%2FjMKnv0Qu6CgENaMPXGZ9U%2FdXKH0ht3fplHT0f5bfLMFMXDGkPviM%2Fhl4RnKtR7kaqYE9SogcWoeKmxLsFnTmgjIx7HrE0Q8fXXu7OD%2F3nEaaCk93oL4vdZ3tRbHnoGn35bJ1uvxMGEtsLwxtDDf%2FGsuZMk%2Fi2cShWsRznz90hwhl8%2Frba%2Bg79mMMfm4TNcbPL5xcI7c2osZI1IhLl%2BqEt8UvRnhL2BWT%2BvvuEh7acnXP1WQlXsCqvi0p92IJZt7Zd5rpIsKN1KuSJWZt8hBnl%2Bt7HVAKXV85jyTJpW1cNQmH0hVPcPhgF4wV5jN5NSfB1PhzBMfblayFCB9db%2FonIA6zGm7lQZWq3XNbKyIHTZ8EOr9oZ%2FccKbUZuvMuuwF%2FlxkPyxr%2FnrSkycvtsV2ULn0Kh0qyzOp%2BXNwRx8bs8j5d5SKWK9cYuU2g7FgvrWEBfCNa6MC%2Bmn1726XhSz07px6tmMZFFgQE%2F3pJdEyfVj2u5ULj4kK2bsI6tu%2BsUmvQvH8dckQ4mjlu%2B8dmOK6T53fMO%2Fu2tMGOqUBknA%2FXIsW4c2DWfqMh%2FV%2Bn7r4eHJv48K8VReqcw27Ute4yH1W2vMufDl44JeTAZmoSuTGZ0rl28jEbZWJnwnZ5Iy5fvSgUKTPq%2BmwMckIXaGG7gDm6c%2BlC8Omw6OvZ6L%2Be93NvD3ldahnSs8XOxRYJNBarE1tYOAca3MgFs9YdqK0mp9F9Tus6IPRW6kSmeqGjchUAQItV6QFqQsGWKSY44YXJyIk&X-Amz-Signature=88f5503aeab9905b10c694ecf7c9a8f7b68f7f9c99d1fe511da94dfdb6eedda2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
