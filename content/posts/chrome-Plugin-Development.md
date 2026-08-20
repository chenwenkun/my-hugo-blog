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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TSHCWIFU%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T182148Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA4f9Arb0TPQtd7wtzGcOhqTR6Sp4BzzwUAeNuJG4Z8fAiAcoNzIpdlFFVxLqVmd4paaBcGcgTH3mNjkOjJiG8XoRSqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv1QemOJAhZX1FrhyKtwDvf3%2BBCeDcKOYrIyaRUq%2BBiOUvA7746SieQMVfkDO2WjJda9JhshUmF88q1dw7Ua5N2gwSuCeAgICSBaeUdS5zxnWimTKNcyaQCaAiKdaMcEFbaPw0uuKwhzzc8wzS0q5D84MlmPcifnw4q9R3d%2BjOs6OdGpThp9M%2Bo1%2FaijOSuGjtBkLEOzZKnDU%2F7uNFvN9XpCuKj3ML1C4PbdO9zgi1utOsyewLytkEazM1RHcqCNmRSZtl18uMJouk5%2BPTnB5m9WFDjcuAnd7iDSNzUfo8252M5YcdkoeKqKms%2F%2BNcxrK8%2Bv%2F3GmQj%2FhPrbjIYciCUvUPgA5bzbnzDqODFgXRUk4u2C5bsXWCqEcE24Qaa4zbZmULEivO9%2BY1RBoPvBBvZwADI5nvBmebqSdZxPXXXNhuIdBUcEUUoaZ6Oj1u%2Fe1uBaohZa1s%2FqURR0t86rxbwBfhMJC1Hzxwjqs170AXI2mCuraEj8zoV9%2BGns4l2vuo2Ayjy%2BBomPoQEOLKtueHsUV7%2FC7e1mlEJoqRHpDVeT1UlQ3IEOqZ%2BcV6c7%2Buj8X6KtK%2Fofj85BKXUXo8jhuxe0gh7t8HzbpqsDjGM8UB5Zg9VNgM1CXAgejhGW6xQ6SezR8eZQ2b8Q6mTkgw%2BuOc1AY6pgGUadTN0TvHXTCWbmE13VHdFNn102LaqdktxZ3kq2IVrkUANsQWtXy%2BsMv5bg6yHqR71X91L6iAo5QZpLght38bdHp6pDOhpW%2BTr3OkLVy1dQWEo5qOwrvkGJS5BigEZyWqPBA3bOpXR1ZmTzqPABD%2F0VKRE%2FHXmnBlA1qP%2FWG6N5uD7L%2BO81Vb59Vhv%2BcywcviZCxg5M%2FCmqgmidk%2BGYEhvDM9nLAf&X-Amz-Signature=e8e8ca98926d159004073f0a9e74c7be1e5cf15517f9a0553cd6c1e7e6d49466&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TSHCWIFU%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T182148Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA4f9Arb0TPQtd7wtzGcOhqTR6Sp4BzzwUAeNuJG4Z8fAiAcoNzIpdlFFVxLqVmd4paaBcGcgTH3mNjkOjJiG8XoRSqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv1QemOJAhZX1FrhyKtwDvf3%2BBCeDcKOYrIyaRUq%2BBiOUvA7746SieQMVfkDO2WjJda9JhshUmF88q1dw7Ua5N2gwSuCeAgICSBaeUdS5zxnWimTKNcyaQCaAiKdaMcEFbaPw0uuKwhzzc8wzS0q5D84MlmPcifnw4q9R3d%2BjOs6OdGpThp9M%2Bo1%2FaijOSuGjtBkLEOzZKnDU%2F7uNFvN9XpCuKj3ML1C4PbdO9zgi1utOsyewLytkEazM1RHcqCNmRSZtl18uMJouk5%2BPTnB5m9WFDjcuAnd7iDSNzUfo8252M5YcdkoeKqKms%2F%2BNcxrK8%2Bv%2F3GmQj%2FhPrbjIYciCUvUPgA5bzbnzDqODFgXRUk4u2C5bsXWCqEcE24Qaa4zbZmULEivO9%2BY1RBoPvBBvZwADI5nvBmebqSdZxPXXXNhuIdBUcEUUoaZ6Oj1u%2Fe1uBaohZa1s%2FqURR0t86rxbwBfhMJC1Hzxwjqs170AXI2mCuraEj8zoV9%2BGns4l2vuo2Ayjy%2BBomPoQEOLKtueHsUV7%2FC7e1mlEJoqRHpDVeT1UlQ3IEOqZ%2BcV6c7%2Buj8X6KtK%2Fofj85BKXUXo8jhuxe0gh7t8HzbpqsDjGM8UB5Zg9VNgM1CXAgejhGW6xQ6SezR8eZQ2b8Q6mTkgw%2BuOc1AY6pgGUadTN0TvHXTCWbmE13VHdFNn102LaqdktxZ3kq2IVrkUANsQWtXy%2BsMv5bg6yHqR71X91L6iAo5QZpLght38bdHp6pDOhpW%2BTr3OkLVy1dQWEo5qOwrvkGJS5BigEZyWqPBA3bOpXR1ZmTzqPABD%2F0VKRE%2FHXmnBlA1qP%2FWG6N5uD7L%2BO81Vb59Vhv%2BcywcviZCxg5M%2FCmqgmidk%2BGYEhvDM9nLAf&X-Amz-Signature=b9897d78f71886635ede45b9bbec1ebab067be8416b82f5ec11d955dde9ae6cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TSHCWIFU%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T182148Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA4f9Arb0TPQtd7wtzGcOhqTR6Sp4BzzwUAeNuJG4Z8fAiAcoNzIpdlFFVxLqVmd4paaBcGcgTH3mNjkOjJiG8XoRSqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv1QemOJAhZX1FrhyKtwDvf3%2BBCeDcKOYrIyaRUq%2BBiOUvA7746SieQMVfkDO2WjJda9JhshUmF88q1dw7Ua5N2gwSuCeAgICSBaeUdS5zxnWimTKNcyaQCaAiKdaMcEFbaPw0uuKwhzzc8wzS0q5D84MlmPcifnw4q9R3d%2BjOs6OdGpThp9M%2Bo1%2FaijOSuGjtBkLEOzZKnDU%2F7uNFvN9XpCuKj3ML1C4PbdO9zgi1utOsyewLytkEazM1RHcqCNmRSZtl18uMJouk5%2BPTnB5m9WFDjcuAnd7iDSNzUfo8252M5YcdkoeKqKms%2F%2BNcxrK8%2Bv%2F3GmQj%2FhPrbjIYciCUvUPgA5bzbnzDqODFgXRUk4u2C5bsXWCqEcE24Qaa4zbZmULEivO9%2BY1RBoPvBBvZwADI5nvBmebqSdZxPXXXNhuIdBUcEUUoaZ6Oj1u%2Fe1uBaohZa1s%2FqURR0t86rxbwBfhMJC1Hzxwjqs170AXI2mCuraEj8zoV9%2BGns4l2vuo2Ayjy%2BBomPoQEOLKtueHsUV7%2FC7e1mlEJoqRHpDVeT1UlQ3IEOqZ%2BcV6c7%2Buj8X6KtK%2Fofj85BKXUXo8jhuxe0gh7t8HzbpqsDjGM8UB5Zg9VNgM1CXAgejhGW6xQ6SezR8eZQ2b8Q6mTkgw%2BuOc1AY6pgGUadTN0TvHXTCWbmE13VHdFNn102LaqdktxZ3kq2IVrkUANsQWtXy%2BsMv5bg6yHqR71X91L6iAo5QZpLght38bdHp6pDOhpW%2BTr3OkLVy1dQWEo5qOwrvkGJS5BigEZyWqPBA3bOpXR1ZmTzqPABD%2F0VKRE%2FHXmnBlA1qP%2FWG6N5uD7L%2BO81Vb59Vhv%2BcywcviZCxg5M%2FCmqgmidk%2BGYEhvDM9nLAf&X-Amz-Signature=d9db35ae1dda0629ba180f6bbe59a7df0a162538feb71e9f527c09e207a539c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TSHCWIFU%2F20260820%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260820T182148Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIA4f9Arb0TPQtd7wtzGcOhqTR6Sp4BzzwUAeNuJG4Z8fAiAcoNzIpdlFFVxLqVmd4paaBcGcgTH3mNjkOjJiG8XoRSqIBAiS%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv1QemOJAhZX1FrhyKtwDvf3%2BBCeDcKOYrIyaRUq%2BBiOUvA7746SieQMVfkDO2WjJda9JhshUmF88q1dw7Ua5N2gwSuCeAgICSBaeUdS5zxnWimTKNcyaQCaAiKdaMcEFbaPw0uuKwhzzc8wzS0q5D84MlmPcifnw4q9R3d%2BjOs6OdGpThp9M%2Bo1%2FaijOSuGjtBkLEOzZKnDU%2F7uNFvN9XpCuKj3ML1C4PbdO9zgi1utOsyewLytkEazM1RHcqCNmRSZtl18uMJouk5%2BPTnB5m9WFDjcuAnd7iDSNzUfo8252M5YcdkoeKqKms%2F%2BNcxrK8%2Bv%2F3GmQj%2FhPrbjIYciCUvUPgA5bzbnzDqODFgXRUk4u2C5bsXWCqEcE24Qaa4zbZmULEivO9%2BY1RBoPvBBvZwADI5nvBmebqSdZxPXXXNhuIdBUcEUUoaZ6Oj1u%2Fe1uBaohZa1s%2FqURR0t86rxbwBfhMJC1Hzxwjqs170AXI2mCuraEj8zoV9%2BGns4l2vuo2Ayjy%2BBomPoQEOLKtueHsUV7%2FC7e1mlEJoqRHpDVeT1UlQ3IEOqZ%2BcV6c7%2Buj8X6KtK%2Fofj85BKXUXo8jhuxe0gh7t8HzbpqsDjGM8UB5Zg9VNgM1CXAgejhGW6xQ6SezR8eZQ2b8Q6mTkgw%2BuOc1AY6pgGUadTN0TvHXTCWbmE13VHdFNn102LaqdktxZ3kq2IVrkUANsQWtXy%2BsMv5bg6yHqR71X91L6iAo5QZpLght38bdHp6pDOhpW%2BTr3OkLVy1dQWEo5qOwrvkGJS5BigEZyWqPBA3bOpXR1ZmTzqPABD%2F0VKRE%2FHXmnBlA1qP%2FWG6N5uD7L%2BO81Vb59Vhv%2BcywcviZCxg5M%2FCmqgmidk%2BGYEhvDM9nLAf&X-Amz-Signature=daec057ee740e1325bbe309639374ac7d7743f0c2281a8a90e7ad70132938bb1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
