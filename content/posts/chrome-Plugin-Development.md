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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZSINL5P%2F20260920%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260920T150334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICitnshgcTdyiecsvEUvOFhYFlIv%2B1WCGhknuZOzIEsgAiEA8MRdSxiykylJqwW6v7FgocHq%2FfdudxpjerPH%2BOHahYwq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDIekeouu5i2yG7iqSCrcA3fb1T%2BSId9Ku0dAiukx%2Fx4ZUKubnF1dzMhDEb3aFwh2VMONRMGdXXuEDz6UvP5FkGFVdtwEkPcEzU7yzLLHxtcJ9O2I%2Bwa3Eo1zCjts9iBQC5jOjFGoQpcnTmcmOQqFZdsHrDM52ax1UmpMwjaAo6FGjkmjOCH%2BqSoYWc6cOmGsDxbWxzXMG6br8gGADdtpeYJGAZJ7hDMoaTv4ATdF3TLD17ZhHOwsxqgTsttRYD%2FrrqJpnLDHqSMQ7niHUt2mvoiEGiS2X43umylRvHCP%2BN5fLqPrpo5F%2Bnlyb7JjK8oWzv3s0eUJfecV7KVtMRl5MO%2BKiRa6lrNze80MZ%2FQf0LH%2Ber10EMgjVX5%2FQCH1v%2F2%2Bi9XUruVQefl8VJA5SsdOm8fLMmiqwo5WVYB%2FyMBK9XpW9DdPOApY7kWSBbGqcVGA%2FNBvfxRl7EwALE6UdJGzoNrvePjdykp6znKXYk6fPf45w%2FWlmJrh0G29%2FEPI5XxLeXlJOn%2Bx6uXhxK8Ib2rj7YrBnI4i7XjEx5VCD3HWlBikd9X4%2Bi8U9a5jxITo2y%2Bx%2BJCCpD8Y5%2B9Iodg39Ky2IMieg%2BF37uLKMjuxMr0W4j3hS5xyQeV3u26bZqEVe0dRskBkwA5UU9QOKarhMLXnv9UGOqUBP6c71LbWqY261hh365NAbL6a7lXXx7xWX%2BNzFXJlXIBNoPLWH8vvSoyaR9pVCL%2BQLYREaOKH71jaoiXgQ%2BcUOyRaf%2B5DleStvb%2FmXmFVO4%2FEFna%2BCW9PG9MwCyTvYlKqspaSadoxUPU8ohdVj%2F8biTjTG5Xw1zG%2FuaeWluvaSMo2muyd%2Bt13Ctp6nVHoxsD3wr%2BL5uvlhjwjYlMGQue4Eby49kLE&X-Amz-Signature=ddfe500ff53ca0df7f48697faf6bf94363f7dde50103a19ea9746271d83d4c09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZSINL5P%2F20260920%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260920T150334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICitnshgcTdyiecsvEUvOFhYFlIv%2B1WCGhknuZOzIEsgAiEA8MRdSxiykylJqwW6v7FgocHq%2FfdudxpjerPH%2BOHahYwq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDIekeouu5i2yG7iqSCrcA3fb1T%2BSId9Ku0dAiukx%2Fx4ZUKubnF1dzMhDEb3aFwh2VMONRMGdXXuEDz6UvP5FkGFVdtwEkPcEzU7yzLLHxtcJ9O2I%2Bwa3Eo1zCjts9iBQC5jOjFGoQpcnTmcmOQqFZdsHrDM52ax1UmpMwjaAo6FGjkmjOCH%2BqSoYWc6cOmGsDxbWxzXMG6br8gGADdtpeYJGAZJ7hDMoaTv4ATdF3TLD17ZhHOwsxqgTsttRYD%2FrrqJpnLDHqSMQ7niHUt2mvoiEGiS2X43umylRvHCP%2BN5fLqPrpo5F%2Bnlyb7JjK8oWzv3s0eUJfecV7KVtMRl5MO%2BKiRa6lrNze80MZ%2FQf0LH%2Ber10EMgjVX5%2FQCH1v%2F2%2Bi9XUruVQefl8VJA5SsdOm8fLMmiqwo5WVYB%2FyMBK9XpW9DdPOApY7kWSBbGqcVGA%2FNBvfxRl7EwALE6UdJGzoNrvePjdykp6znKXYk6fPf45w%2FWlmJrh0G29%2FEPI5XxLeXlJOn%2Bx6uXhxK8Ib2rj7YrBnI4i7XjEx5VCD3HWlBikd9X4%2Bi8U9a5jxITo2y%2Bx%2BJCCpD8Y5%2B9Iodg39Ky2IMieg%2BF37uLKMjuxMr0W4j3hS5xyQeV3u26bZqEVe0dRskBkwA5UU9QOKarhMLXnv9UGOqUBP6c71LbWqY261hh365NAbL6a7lXXx7xWX%2BNzFXJlXIBNoPLWH8vvSoyaR9pVCL%2BQLYREaOKH71jaoiXgQ%2BcUOyRaf%2B5DleStvb%2FmXmFVO4%2FEFna%2BCW9PG9MwCyTvYlKqspaSadoxUPU8ohdVj%2F8biTjTG5Xw1zG%2FuaeWluvaSMo2muyd%2Bt13Ctp6nVHoxsD3wr%2BL5uvlhjwjYlMGQue4Eby49kLE&X-Amz-Signature=606d48e40731b79c402cbaef570671e6f5f100537f4737f7c1eb25b66a62de63&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZSINL5P%2F20260920%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260920T150334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICitnshgcTdyiecsvEUvOFhYFlIv%2B1WCGhknuZOzIEsgAiEA8MRdSxiykylJqwW6v7FgocHq%2FfdudxpjerPH%2BOHahYwq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDIekeouu5i2yG7iqSCrcA3fb1T%2BSId9Ku0dAiukx%2Fx4ZUKubnF1dzMhDEb3aFwh2VMONRMGdXXuEDz6UvP5FkGFVdtwEkPcEzU7yzLLHxtcJ9O2I%2Bwa3Eo1zCjts9iBQC5jOjFGoQpcnTmcmOQqFZdsHrDM52ax1UmpMwjaAo6FGjkmjOCH%2BqSoYWc6cOmGsDxbWxzXMG6br8gGADdtpeYJGAZJ7hDMoaTv4ATdF3TLD17ZhHOwsxqgTsttRYD%2FrrqJpnLDHqSMQ7niHUt2mvoiEGiS2X43umylRvHCP%2BN5fLqPrpo5F%2Bnlyb7JjK8oWzv3s0eUJfecV7KVtMRl5MO%2BKiRa6lrNze80MZ%2FQf0LH%2Ber10EMgjVX5%2FQCH1v%2F2%2Bi9XUruVQefl8VJA5SsdOm8fLMmiqwo5WVYB%2FyMBK9XpW9DdPOApY7kWSBbGqcVGA%2FNBvfxRl7EwALE6UdJGzoNrvePjdykp6znKXYk6fPf45w%2FWlmJrh0G29%2FEPI5XxLeXlJOn%2Bx6uXhxK8Ib2rj7YrBnI4i7XjEx5VCD3HWlBikd9X4%2Bi8U9a5jxITo2y%2Bx%2BJCCpD8Y5%2B9Iodg39Ky2IMieg%2BF37uLKMjuxMr0W4j3hS5xyQeV3u26bZqEVe0dRskBkwA5UU9QOKarhMLXnv9UGOqUBP6c71LbWqY261hh365NAbL6a7lXXx7xWX%2BNzFXJlXIBNoPLWH8vvSoyaR9pVCL%2BQLYREaOKH71jaoiXgQ%2BcUOyRaf%2B5DleStvb%2FmXmFVO4%2FEFna%2BCW9PG9MwCyTvYlKqspaSadoxUPU8ohdVj%2F8biTjTG5Xw1zG%2FuaeWluvaSMo2muyd%2Bt13Ctp6nVHoxsD3wr%2BL5uvlhjwjYlMGQue4Eby49kLE&X-Amz-Signature=b7f7e6f15d002c7e8a675fb9f1af910c813a7fde1666d7318a4a04bbc55ae7cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZZSINL5P%2F20260920%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260920T150334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICitnshgcTdyiecsvEUvOFhYFlIv%2B1WCGhknuZOzIEsgAiEA8MRdSxiykylJqwW6v7FgocHq%2FfdudxpjerPH%2BOHahYwq%2FwMIeBAAGgw2Mzc0MjMxODM4MDUiDIekeouu5i2yG7iqSCrcA3fb1T%2BSId9Ku0dAiukx%2Fx4ZUKubnF1dzMhDEb3aFwh2VMONRMGdXXuEDz6UvP5FkGFVdtwEkPcEzU7yzLLHxtcJ9O2I%2Bwa3Eo1zCjts9iBQC5jOjFGoQpcnTmcmOQqFZdsHrDM52ax1UmpMwjaAo6FGjkmjOCH%2BqSoYWc6cOmGsDxbWxzXMG6br8gGADdtpeYJGAZJ7hDMoaTv4ATdF3TLD17ZhHOwsxqgTsttRYD%2FrrqJpnLDHqSMQ7niHUt2mvoiEGiS2X43umylRvHCP%2BN5fLqPrpo5F%2Bnlyb7JjK8oWzv3s0eUJfecV7KVtMRl5MO%2BKiRa6lrNze80MZ%2FQf0LH%2Ber10EMgjVX5%2FQCH1v%2F2%2Bi9XUruVQefl8VJA5SsdOm8fLMmiqwo5WVYB%2FyMBK9XpW9DdPOApY7kWSBbGqcVGA%2FNBvfxRl7EwALE6UdJGzoNrvePjdykp6znKXYk6fPf45w%2FWlmJrh0G29%2FEPI5XxLeXlJOn%2Bx6uXhxK8Ib2rj7YrBnI4i7XjEx5VCD3HWlBikd9X4%2Bi8U9a5jxITo2y%2Bx%2BJCCpD8Y5%2B9Iodg39Ky2IMieg%2BF37uLKMjuxMr0W4j3hS5xyQeV3u26bZqEVe0dRskBkwA5UU9QOKarhMLXnv9UGOqUBP6c71LbWqY261hh365NAbL6a7lXXx7xWX%2BNzFXJlXIBNoPLWH8vvSoyaR9pVCL%2BQLYREaOKH71jaoiXgQ%2BcUOyRaf%2B5DleStvb%2FmXmFVO4%2FEFna%2BCW9PG9MwCyTvYlKqspaSadoxUPU8ohdVj%2F8biTjTG5Xw1zG%2FuaeWluvaSMo2muyd%2Bt13Ctp6nVHoxsD3wr%2BL5uvlhjwjYlMGQue4Eby49kLE&X-Amz-Signature=c6088cea252140172bf575ff52f9c532766c5edc8acabc137b90f71ef29fd4cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
