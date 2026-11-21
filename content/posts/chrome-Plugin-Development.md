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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655XKIJKD%2F20261121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261121T044313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIAVQS%2BboGBu87RxoWWOv9w%2F%2B9uQIPv1bV1F1Vb2kChx9AiEArxwdrH6ZdeEbrrbTmcLMP1OMvyiJrwvaKO3UwHjoE%2B8q%2FwMIPBAAGgw2Mzc0MjMxODM4MDUiDNlJ8xDNzZfYr65sbCrcA7yHw4NAMI%2FAlRPhugDVuyZjo9iuOfiU8dD6%2FSq%2F2k7TCsJcZ1j7CUBUAuJ15KlEu5x0gsU62Gn9Qjinw%2F%2BB9Radf%2Bt1mhHnL%2F1qsLLkfnTIsQCCB%2F63%2BfZDvHSlH53tOslsc%2Fg4KP52783MnUkP2uAgburXIt%2B7M9QNY9T7lrYKhGQLLB8l19vYGDsO%2FZ%2BSEkHdWGWEYey29uxfyETd%2FjkaWqXKDCXI4MfIilFF%2F8ksIyb34l%2FYLPTowsQjETb2ij%2BXIliUQJvc8hcRKMaito0MIBYt3Z8MRgDdFoJ%2FIwSaJ7QUcImX1tB1lI0xzDLVlroKMWmttGi6qTIspbp6Js5yN97fdSpAAvny%2F3Begg13OQlx08mlp%2Fxrmrs2x6a%2BnNS4hHO2mlocB%2B1k%2BiOqhRTQVFdJ6c7qBLiYlFEqSiv3aceNAuKdEHyz1%2BqW%2Bxzwv39e9vg4uJY3K%2FUF%2F30qONEMwiMgksrhC5WsGWMFgoCMulM5cwV4mPdAhU59GyZoVU6LZNwSQXqtGGwH2x1YVFdFWsZOu5n1rPzLw3lAKzotOKRqXVR7K24W3pKdPvfBv5vcAtNienEDEgxE%2FoOjHfAflH96%2BiPb6iZBDYxGKbfl3RS2IyuIN8dndwyfMPGphNgGOqUBweWEMm%2BnxKdw49wym1yPHc%2FajLK4jSRIJ9mXEGK91CDZn0zvORBPGJAzapWlYjAhNVfgpdFefpSQXALVSyGEu%2FNGNECj3HsRrn3vVVsqU7%2BIMJNbs5LQi1bbE%2F1f9kfz9Dm0FAgPFursVemL5PuEUzvMFbhMptNXGTQvNpTcg4wtSrdXWsJ8PEG4e0xorjq%2F6f0HVdSCoqFQWPwrl624UlJfk%2Fl9&X-Amz-Signature=b9d09f497f02c463e94a19482f77fa04b1a271dbe6b647a40a6fa1b00050eb9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655XKIJKD%2F20261121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261121T044313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIAVQS%2BboGBu87RxoWWOv9w%2F%2B9uQIPv1bV1F1Vb2kChx9AiEArxwdrH6ZdeEbrrbTmcLMP1OMvyiJrwvaKO3UwHjoE%2B8q%2FwMIPBAAGgw2Mzc0MjMxODM4MDUiDNlJ8xDNzZfYr65sbCrcA7yHw4NAMI%2FAlRPhugDVuyZjo9iuOfiU8dD6%2FSq%2F2k7TCsJcZ1j7CUBUAuJ15KlEu5x0gsU62Gn9Qjinw%2F%2BB9Radf%2Bt1mhHnL%2F1qsLLkfnTIsQCCB%2F63%2BfZDvHSlH53tOslsc%2Fg4KP52783MnUkP2uAgburXIt%2B7M9QNY9T7lrYKhGQLLB8l19vYGDsO%2FZ%2BSEkHdWGWEYey29uxfyETd%2FjkaWqXKDCXI4MfIilFF%2F8ksIyb34l%2FYLPTowsQjETb2ij%2BXIliUQJvc8hcRKMaito0MIBYt3Z8MRgDdFoJ%2FIwSaJ7QUcImX1tB1lI0xzDLVlroKMWmttGi6qTIspbp6Js5yN97fdSpAAvny%2F3Begg13OQlx08mlp%2Fxrmrs2x6a%2BnNS4hHO2mlocB%2B1k%2BiOqhRTQVFdJ6c7qBLiYlFEqSiv3aceNAuKdEHyz1%2BqW%2Bxzwv39e9vg4uJY3K%2FUF%2F30qONEMwiMgksrhC5WsGWMFgoCMulM5cwV4mPdAhU59GyZoVU6LZNwSQXqtGGwH2x1YVFdFWsZOu5n1rPzLw3lAKzotOKRqXVR7K24W3pKdPvfBv5vcAtNienEDEgxE%2FoOjHfAflH96%2BiPb6iZBDYxGKbfl3RS2IyuIN8dndwyfMPGphNgGOqUBweWEMm%2BnxKdw49wym1yPHc%2FajLK4jSRIJ9mXEGK91CDZn0zvORBPGJAzapWlYjAhNVfgpdFefpSQXALVSyGEu%2FNGNECj3HsRrn3vVVsqU7%2BIMJNbs5LQi1bbE%2F1f9kfz9Dm0FAgPFursVemL5PuEUzvMFbhMptNXGTQvNpTcg4wtSrdXWsJ8PEG4e0xorjq%2F6f0HVdSCoqFQWPwrl624UlJfk%2Fl9&X-Amz-Signature=ed0a43691fd3199c4c63138b254ccb84456d13247b0ad5f11a973aa4b515940a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655XKIJKD%2F20261121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261121T044313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIAVQS%2BboGBu87RxoWWOv9w%2F%2B9uQIPv1bV1F1Vb2kChx9AiEArxwdrH6ZdeEbrrbTmcLMP1OMvyiJrwvaKO3UwHjoE%2B8q%2FwMIPBAAGgw2Mzc0MjMxODM4MDUiDNlJ8xDNzZfYr65sbCrcA7yHw4NAMI%2FAlRPhugDVuyZjo9iuOfiU8dD6%2FSq%2F2k7TCsJcZ1j7CUBUAuJ15KlEu5x0gsU62Gn9Qjinw%2F%2BB9Radf%2Bt1mhHnL%2F1qsLLkfnTIsQCCB%2F63%2BfZDvHSlH53tOslsc%2Fg4KP52783MnUkP2uAgburXIt%2B7M9QNY9T7lrYKhGQLLB8l19vYGDsO%2FZ%2BSEkHdWGWEYey29uxfyETd%2FjkaWqXKDCXI4MfIilFF%2F8ksIyb34l%2FYLPTowsQjETb2ij%2BXIliUQJvc8hcRKMaito0MIBYt3Z8MRgDdFoJ%2FIwSaJ7QUcImX1tB1lI0xzDLVlroKMWmttGi6qTIspbp6Js5yN97fdSpAAvny%2F3Begg13OQlx08mlp%2Fxrmrs2x6a%2BnNS4hHO2mlocB%2B1k%2BiOqhRTQVFdJ6c7qBLiYlFEqSiv3aceNAuKdEHyz1%2BqW%2Bxzwv39e9vg4uJY3K%2FUF%2F30qONEMwiMgksrhC5WsGWMFgoCMulM5cwV4mPdAhU59GyZoVU6LZNwSQXqtGGwH2x1YVFdFWsZOu5n1rPzLw3lAKzotOKRqXVR7K24W3pKdPvfBv5vcAtNienEDEgxE%2FoOjHfAflH96%2BiPb6iZBDYxGKbfl3RS2IyuIN8dndwyfMPGphNgGOqUBweWEMm%2BnxKdw49wym1yPHc%2FajLK4jSRIJ9mXEGK91CDZn0zvORBPGJAzapWlYjAhNVfgpdFefpSQXALVSyGEu%2FNGNECj3HsRrn3vVVsqU7%2BIMJNbs5LQi1bbE%2F1f9kfz9Dm0FAgPFursVemL5PuEUzvMFbhMptNXGTQvNpTcg4wtSrdXWsJ8PEG4e0xorjq%2F6f0HVdSCoqFQWPwrl624UlJfk%2Fl9&X-Amz-Signature=342e0221773abd9767cb7dfeff9bc29cc9005767b273db909a947eb15c1272c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46655XKIJKD%2F20261121%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261121T044313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHQaCXVzLXdlc3QtMiJHMEUCIAVQS%2BboGBu87RxoWWOv9w%2F%2B9uQIPv1bV1F1Vb2kChx9AiEArxwdrH6ZdeEbrrbTmcLMP1OMvyiJrwvaKO3UwHjoE%2B8q%2FwMIPBAAGgw2Mzc0MjMxODM4MDUiDNlJ8xDNzZfYr65sbCrcA7yHw4NAMI%2FAlRPhugDVuyZjo9iuOfiU8dD6%2FSq%2F2k7TCsJcZ1j7CUBUAuJ15KlEu5x0gsU62Gn9Qjinw%2F%2BB9Radf%2Bt1mhHnL%2F1qsLLkfnTIsQCCB%2F63%2BfZDvHSlH53tOslsc%2Fg4KP52783MnUkP2uAgburXIt%2B7M9QNY9T7lrYKhGQLLB8l19vYGDsO%2FZ%2BSEkHdWGWEYey29uxfyETd%2FjkaWqXKDCXI4MfIilFF%2F8ksIyb34l%2FYLPTowsQjETb2ij%2BXIliUQJvc8hcRKMaito0MIBYt3Z8MRgDdFoJ%2FIwSaJ7QUcImX1tB1lI0xzDLVlroKMWmttGi6qTIspbp6Js5yN97fdSpAAvny%2F3Begg13OQlx08mlp%2Fxrmrs2x6a%2BnNS4hHO2mlocB%2B1k%2BiOqhRTQVFdJ6c7qBLiYlFEqSiv3aceNAuKdEHyz1%2BqW%2Bxzwv39e9vg4uJY3K%2FUF%2F30qONEMwiMgksrhC5WsGWMFgoCMulM5cwV4mPdAhU59GyZoVU6LZNwSQXqtGGwH2x1YVFdFWsZOu5n1rPzLw3lAKzotOKRqXVR7K24W3pKdPvfBv5vcAtNienEDEgxE%2FoOjHfAflH96%2BiPb6iZBDYxGKbfl3RS2IyuIN8dndwyfMPGphNgGOqUBweWEMm%2BnxKdw49wym1yPHc%2FajLK4jSRIJ9mXEGK91CDZn0zvORBPGJAzapWlYjAhNVfgpdFefpSQXALVSyGEu%2FNGNECj3HsRrn3vVVsqU7%2BIMJNbs5LQi1bbE%2F1f9kfz9Dm0FAgPFursVemL5PuEUzvMFbhMptNXGTQvNpTcg4wtSrdXWsJ8PEG4e0xorjq%2F6f0HVdSCoqFQWPwrl624UlJfk%2Fl9&X-Amz-Signature=29fe2479408b33ec8d2f2f3bdba1881ea020325687b868bf368c056f73440312&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
