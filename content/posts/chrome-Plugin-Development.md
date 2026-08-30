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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662U3ZLF4Y%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T021839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICzvIUYZKG%2BX%2FXlJRxDIRlg%2FX%2BPqpFJPWgwAjMb5R4CxAiEAo569jKtwDpMsTTnxrCt%2Bmw16TlWAe8K4MM7oKQ153uQq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDOpfvh7fRvis42O8gCrcA7DMum4vbLCl6v1%2B6vQblZq2hw0Fu4oOPObWqJdD0BJMFLkO0uWr4kU9gMyGP27gbDkNJIvg%2F2IHBlgq6bnhalHAC%2FRyAq0wjKsqH9LyF1fkN9K5nYDGpLim2%2Fj%2FkaCjAT12nYO15wyQYpfSos6%2BWHM%2BVj%2FkpHF6p9tZ28mefH4ukr4i2m2xxEqF1PZy6LrWoR0DGXPJbD%2B%2FRlnrKM0wVOJOJL%2FzgiNm77FH8CkeRHkegFLnudFhqKPZW0o24s0e3xG6IIq3DfrY7Lk4DuTQ7PrZTE%2BmEra0OPPrd4lTIA2GLGRU9bp5Lb7tAVcpvIW4rnAaLaXvknI3vNc%2FosSYy5XKcim67jkXekO7czp8A5sqKzxfulan2vPFAAGzdFPz4KSCygMt6w9gIjMdvGELM3C5w2wT0%2FqdrXsU1RRg2IulKnPhoM3JcCKTiB7zXXSU40msUSmIKZE03wqOeWD%2B3ypookIaPBP6pCjMd%2F6DWBmRDVrFl2Z1dD95kh4izo6sZJ4e4QT9YFCwA7C5Utb5TpzgxfUTVhAEWLv4gEEyUClGPWkyXu87FutT8d%2FiH7Xp41spvspde1s4yMHJnf5BgcUvggbvDrvB5UFOMA%2ByWP%2BLmP8ajoVNhYoOqyfzMLmZztQGOqUBiRCBuqm%2FTOb0IlBVC4D0S4xaOrxlw2ZIr%2B7uZUv6hUC7jUrW6h7NPha3%2BriC7wHtC3AsKnRJx5qSrqdlxZ701m1HbKkHCcTVsUsEK6X7PVoC%2FYQbNeHlCI78SYkj80AlQB8Kyz3MtlleUStUpa76F%2B6MVlAaTNrU5Gw5Jg5ilesH0rfRCzSQwsmtisjeFVHsVJ4eS5x59wnRvNIw0NtDrckkMYVV&X-Amz-Signature=6ebc1c4ef2c4d40badca2a220f33e4146601560ace200dfd9fbb593513ad5f15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662U3ZLF4Y%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T021839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICzvIUYZKG%2BX%2FXlJRxDIRlg%2FX%2BPqpFJPWgwAjMb5R4CxAiEAo569jKtwDpMsTTnxrCt%2Bmw16TlWAe8K4MM7oKQ153uQq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDOpfvh7fRvis42O8gCrcA7DMum4vbLCl6v1%2B6vQblZq2hw0Fu4oOPObWqJdD0BJMFLkO0uWr4kU9gMyGP27gbDkNJIvg%2F2IHBlgq6bnhalHAC%2FRyAq0wjKsqH9LyF1fkN9K5nYDGpLim2%2Fj%2FkaCjAT12nYO15wyQYpfSos6%2BWHM%2BVj%2FkpHF6p9tZ28mefH4ukr4i2m2xxEqF1PZy6LrWoR0DGXPJbD%2B%2FRlnrKM0wVOJOJL%2FzgiNm77FH8CkeRHkegFLnudFhqKPZW0o24s0e3xG6IIq3DfrY7Lk4DuTQ7PrZTE%2BmEra0OPPrd4lTIA2GLGRU9bp5Lb7tAVcpvIW4rnAaLaXvknI3vNc%2FosSYy5XKcim67jkXekO7czp8A5sqKzxfulan2vPFAAGzdFPz4KSCygMt6w9gIjMdvGELM3C5w2wT0%2FqdrXsU1RRg2IulKnPhoM3JcCKTiB7zXXSU40msUSmIKZE03wqOeWD%2B3ypookIaPBP6pCjMd%2F6DWBmRDVrFl2Z1dD95kh4izo6sZJ4e4QT9YFCwA7C5Utb5TpzgxfUTVhAEWLv4gEEyUClGPWkyXu87FutT8d%2FiH7Xp41spvspde1s4yMHJnf5BgcUvggbvDrvB5UFOMA%2ByWP%2BLmP8ajoVNhYoOqyfzMLmZztQGOqUBiRCBuqm%2FTOb0IlBVC4D0S4xaOrxlw2ZIr%2B7uZUv6hUC7jUrW6h7NPha3%2BriC7wHtC3AsKnRJx5qSrqdlxZ701m1HbKkHCcTVsUsEK6X7PVoC%2FYQbNeHlCI78SYkj80AlQB8Kyz3MtlleUStUpa76F%2B6MVlAaTNrU5Gw5Jg5ilesH0rfRCzSQwsmtisjeFVHsVJ4eS5x59wnRvNIw0NtDrckkMYVV&X-Amz-Signature=6a3a2c1993bd1a8eef943a7359ced37f5212e41aaab154b0fcfb01552c9117d4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662U3ZLF4Y%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T021839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICzvIUYZKG%2BX%2FXlJRxDIRlg%2FX%2BPqpFJPWgwAjMb5R4CxAiEAo569jKtwDpMsTTnxrCt%2Bmw16TlWAe8K4MM7oKQ153uQq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDOpfvh7fRvis42O8gCrcA7DMum4vbLCl6v1%2B6vQblZq2hw0Fu4oOPObWqJdD0BJMFLkO0uWr4kU9gMyGP27gbDkNJIvg%2F2IHBlgq6bnhalHAC%2FRyAq0wjKsqH9LyF1fkN9K5nYDGpLim2%2Fj%2FkaCjAT12nYO15wyQYpfSos6%2BWHM%2BVj%2FkpHF6p9tZ28mefH4ukr4i2m2xxEqF1PZy6LrWoR0DGXPJbD%2B%2FRlnrKM0wVOJOJL%2FzgiNm77FH8CkeRHkegFLnudFhqKPZW0o24s0e3xG6IIq3DfrY7Lk4DuTQ7PrZTE%2BmEra0OPPrd4lTIA2GLGRU9bp5Lb7tAVcpvIW4rnAaLaXvknI3vNc%2FosSYy5XKcim67jkXekO7czp8A5sqKzxfulan2vPFAAGzdFPz4KSCygMt6w9gIjMdvGELM3C5w2wT0%2FqdrXsU1RRg2IulKnPhoM3JcCKTiB7zXXSU40msUSmIKZE03wqOeWD%2B3ypookIaPBP6pCjMd%2F6DWBmRDVrFl2Z1dD95kh4izo6sZJ4e4QT9YFCwA7C5Utb5TpzgxfUTVhAEWLv4gEEyUClGPWkyXu87FutT8d%2FiH7Xp41spvspde1s4yMHJnf5BgcUvggbvDrvB5UFOMA%2ByWP%2BLmP8ajoVNhYoOqyfzMLmZztQGOqUBiRCBuqm%2FTOb0IlBVC4D0S4xaOrxlw2ZIr%2B7uZUv6hUC7jUrW6h7NPha3%2BriC7wHtC3AsKnRJx5qSrqdlxZ701m1HbKkHCcTVsUsEK6X7PVoC%2FYQbNeHlCI78SYkj80AlQB8Kyz3MtlleUStUpa76F%2B6MVlAaTNrU5Gw5Jg5ilesH0rfRCzSQwsmtisjeFVHsVJ4eS5x59wnRvNIw0NtDrckkMYVV&X-Amz-Signature=a786d9f9121cb25a8c3eb192909b73cce56ce07b6aca9b54544cfa930c9848a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662U3ZLF4Y%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T021839Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICzvIUYZKG%2BX%2FXlJRxDIRlg%2FX%2BPqpFJPWgwAjMb5R4CxAiEAo569jKtwDpMsTTnxrCt%2Bmw16TlWAe8K4MM7oKQ153uQq%2FwMIcxAAGgw2Mzc0MjMxODM4MDUiDOpfvh7fRvis42O8gCrcA7DMum4vbLCl6v1%2B6vQblZq2hw0Fu4oOPObWqJdD0BJMFLkO0uWr4kU9gMyGP27gbDkNJIvg%2F2IHBlgq6bnhalHAC%2FRyAq0wjKsqH9LyF1fkN9K5nYDGpLim2%2Fj%2FkaCjAT12nYO15wyQYpfSos6%2BWHM%2BVj%2FkpHF6p9tZ28mefH4ukr4i2m2xxEqF1PZy6LrWoR0DGXPJbD%2B%2FRlnrKM0wVOJOJL%2FzgiNm77FH8CkeRHkegFLnudFhqKPZW0o24s0e3xG6IIq3DfrY7Lk4DuTQ7PrZTE%2BmEra0OPPrd4lTIA2GLGRU9bp5Lb7tAVcpvIW4rnAaLaXvknI3vNc%2FosSYy5XKcim67jkXekO7czp8A5sqKzxfulan2vPFAAGzdFPz4KSCygMt6w9gIjMdvGELM3C5w2wT0%2FqdrXsU1RRg2IulKnPhoM3JcCKTiB7zXXSU40msUSmIKZE03wqOeWD%2B3ypookIaPBP6pCjMd%2F6DWBmRDVrFl2Z1dD95kh4izo6sZJ4e4QT9YFCwA7C5Utb5TpzgxfUTVhAEWLv4gEEyUClGPWkyXu87FutT8d%2FiH7Xp41spvspde1s4yMHJnf5BgcUvggbvDrvB5UFOMA%2ByWP%2BLmP8ajoVNhYoOqyfzMLmZztQGOqUBiRCBuqm%2FTOb0IlBVC4D0S4xaOrxlw2ZIr%2B7uZUv6hUC7jUrW6h7NPha3%2BriC7wHtC3AsKnRJx5qSrqdlxZ701m1HbKkHCcTVsUsEK6X7PVoC%2FYQbNeHlCI78SYkj80AlQB8Kyz3MtlleUStUpa76F%2B6MVlAaTNrU5Gw5Jg5ilesH0rfRCzSQwsmtisjeFVHsVJ4eS5x59wnRvNIw0NtDrckkMYVV&X-Amz-Signature=d937a119bb0f1bac80ea4a47b07488280ec831d629d5a64d6c577ae357313270&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
