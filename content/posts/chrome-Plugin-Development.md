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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667AORPSSC%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T114628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYkeleNETg4OxN%2BozJLU3YplrrZjs3dD5FDtn93CChygIgBv6b0%2FKKSqxLw8qnGXQJ4NkaA03bRWY%2BsYBFAxhii3Mq%2FwMIaxAAGgw2Mzc0MjMxODM4MDUiDGIs5quHr%2FGh%2B1cH4SrcA%2B%2FIis9gTO37xab%2FbyW6XKxEiwtpwxIFP3MA15rzZRFjyDUz1KIIVGb7Nmc0lbGE3%2FQmbdgqfIqmLGY528N%2F%2BuFQhV77canmivDY4Rtuv%2FISYAqkraOWqmEfKs72GNVRwotglYzkXcwvinoeDymE4J%2F%2F7bdmRVXTgZLe5WPI5DFFFUGK06eBjU4CcX0V7eaiJUSJV4rxzhGOezsV0LDCn4N5SlZ23%2BoWQSwnui9TMoKiUOFYy5DcuebmZJ0qw8da4lxOwLPoF268qZQspDVpHfPnbzf%2BlLrMh70a5lN6jvvCvxAxaUkWFufyy6l9614EgKumQSEhkltfYR1iekHNIPqrW5SdtyKm%2FETls85fbdCqvcivXEMDj9QIgHaQs8wPj2tSpyZiCIF97i8j%2Br25RMWwPzKf5OLPYPpRt%2FhrdvRcfes0Rus80ZUcfo%2BIJKL9Dzy2gac9Faj99n8QIpjx8ZELEksoSTI1UAD6hVnZfWwLxqVkgF628RnaHwMPdF8i%2Fez1x743%2BwP%2FaBo5X%2BzKYXRF2Iow1y7teKaA7aG9iQkMiPGilSuMVVlGPOXAi9kvXP5ZXZ3yDg7VDTTPBi8IGPfh1rhXqGGPX5N8jmdjxGkFctvg3qG5O3kXtF8xMJrWrdYGOqUBqkUKIEMZfOjxmF1xw9FMr3v2VNG%2F2PNBy8A%2FDASOafMXMIhn2djLpz4LMOiGyiSwzYeONiYWZ1j9gSi84R3F5%2FShyLoMh8adL0m2%2F9Hvn1ouTQoBRlF5Yhfj9LQgggqofu47ErxLfk1UyD3ZTFoQFiPVrS%2FLrwwu9FFHxtcnHFblKEOxaadb3Vj%2FJKJrooKTcQj2oGbe9sHqlVXow8aVKVRrwZfl&X-Amz-Signature=ea2908ada3421ed347ba7ebd9760909a627f46df40200894cae70ef26a23caa0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667AORPSSC%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T114628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYkeleNETg4OxN%2BozJLU3YplrrZjs3dD5FDtn93CChygIgBv6b0%2FKKSqxLw8qnGXQJ4NkaA03bRWY%2BsYBFAxhii3Mq%2FwMIaxAAGgw2Mzc0MjMxODM4MDUiDGIs5quHr%2FGh%2B1cH4SrcA%2B%2FIis9gTO37xab%2FbyW6XKxEiwtpwxIFP3MA15rzZRFjyDUz1KIIVGb7Nmc0lbGE3%2FQmbdgqfIqmLGY528N%2F%2BuFQhV77canmivDY4Rtuv%2FISYAqkraOWqmEfKs72GNVRwotglYzkXcwvinoeDymE4J%2F%2F7bdmRVXTgZLe5WPI5DFFFUGK06eBjU4CcX0V7eaiJUSJV4rxzhGOezsV0LDCn4N5SlZ23%2BoWQSwnui9TMoKiUOFYy5DcuebmZJ0qw8da4lxOwLPoF268qZQspDVpHfPnbzf%2BlLrMh70a5lN6jvvCvxAxaUkWFufyy6l9614EgKumQSEhkltfYR1iekHNIPqrW5SdtyKm%2FETls85fbdCqvcivXEMDj9QIgHaQs8wPj2tSpyZiCIF97i8j%2Br25RMWwPzKf5OLPYPpRt%2FhrdvRcfes0Rus80ZUcfo%2BIJKL9Dzy2gac9Faj99n8QIpjx8ZELEksoSTI1UAD6hVnZfWwLxqVkgF628RnaHwMPdF8i%2Fez1x743%2BwP%2FaBo5X%2BzKYXRF2Iow1y7teKaA7aG9iQkMiPGilSuMVVlGPOXAi9kvXP5ZXZ3yDg7VDTTPBi8IGPfh1rhXqGGPX5N8jmdjxGkFctvg3qG5O3kXtF8xMJrWrdYGOqUBqkUKIEMZfOjxmF1xw9FMr3v2VNG%2F2PNBy8A%2FDASOafMXMIhn2djLpz4LMOiGyiSwzYeONiYWZ1j9gSi84R3F5%2FShyLoMh8adL0m2%2F9Hvn1ouTQoBRlF5Yhfj9LQgggqofu47ErxLfk1UyD3ZTFoQFiPVrS%2FLrwwu9FFHxtcnHFblKEOxaadb3Vj%2FJKJrooKTcQj2oGbe9sHqlVXow8aVKVRrwZfl&X-Amz-Signature=1bcbe93458b21a46157306a418d712db8e1822e56d91cf38828524191651707e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667AORPSSC%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T114628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYkeleNETg4OxN%2BozJLU3YplrrZjs3dD5FDtn93CChygIgBv6b0%2FKKSqxLw8qnGXQJ4NkaA03bRWY%2BsYBFAxhii3Mq%2FwMIaxAAGgw2Mzc0MjMxODM4MDUiDGIs5quHr%2FGh%2B1cH4SrcA%2B%2FIis9gTO37xab%2FbyW6XKxEiwtpwxIFP3MA15rzZRFjyDUz1KIIVGb7Nmc0lbGE3%2FQmbdgqfIqmLGY528N%2F%2BuFQhV77canmivDY4Rtuv%2FISYAqkraOWqmEfKs72GNVRwotglYzkXcwvinoeDymE4J%2F%2F7bdmRVXTgZLe5WPI5DFFFUGK06eBjU4CcX0V7eaiJUSJV4rxzhGOezsV0LDCn4N5SlZ23%2BoWQSwnui9TMoKiUOFYy5DcuebmZJ0qw8da4lxOwLPoF268qZQspDVpHfPnbzf%2BlLrMh70a5lN6jvvCvxAxaUkWFufyy6l9614EgKumQSEhkltfYR1iekHNIPqrW5SdtyKm%2FETls85fbdCqvcivXEMDj9QIgHaQs8wPj2tSpyZiCIF97i8j%2Br25RMWwPzKf5OLPYPpRt%2FhrdvRcfes0Rus80ZUcfo%2BIJKL9Dzy2gac9Faj99n8QIpjx8ZELEksoSTI1UAD6hVnZfWwLxqVkgF628RnaHwMPdF8i%2Fez1x743%2BwP%2FaBo5X%2BzKYXRF2Iow1y7teKaA7aG9iQkMiPGilSuMVVlGPOXAi9kvXP5ZXZ3yDg7VDTTPBi8IGPfh1rhXqGGPX5N8jmdjxGkFctvg3qG5O3kXtF8xMJrWrdYGOqUBqkUKIEMZfOjxmF1xw9FMr3v2VNG%2F2PNBy8A%2FDASOafMXMIhn2djLpz4LMOiGyiSwzYeONiYWZ1j9gSi84R3F5%2FShyLoMh8adL0m2%2F9Hvn1ouTQoBRlF5Yhfj9LQgggqofu47ErxLfk1UyD3ZTFoQFiPVrS%2FLrwwu9FFHxtcnHFblKEOxaadb3Vj%2FJKJrooKTcQj2oGbe9sHqlVXow8aVKVRrwZfl&X-Amz-Signature=bc5ada429d26e1cc7c26522e7b5c852cb043e079243b5ae3eef8bdc454440d64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667AORPSSC%2F20261011%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261011T114628Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYkeleNETg4OxN%2BozJLU3YplrrZjs3dD5FDtn93CChygIgBv6b0%2FKKSqxLw8qnGXQJ4NkaA03bRWY%2BsYBFAxhii3Mq%2FwMIaxAAGgw2Mzc0MjMxODM4MDUiDGIs5quHr%2FGh%2B1cH4SrcA%2B%2FIis9gTO37xab%2FbyW6XKxEiwtpwxIFP3MA15rzZRFjyDUz1KIIVGb7Nmc0lbGE3%2FQmbdgqfIqmLGY528N%2F%2BuFQhV77canmivDY4Rtuv%2FISYAqkraOWqmEfKs72GNVRwotglYzkXcwvinoeDymE4J%2F%2F7bdmRVXTgZLe5WPI5DFFFUGK06eBjU4CcX0V7eaiJUSJV4rxzhGOezsV0LDCn4N5SlZ23%2BoWQSwnui9TMoKiUOFYy5DcuebmZJ0qw8da4lxOwLPoF268qZQspDVpHfPnbzf%2BlLrMh70a5lN6jvvCvxAxaUkWFufyy6l9614EgKumQSEhkltfYR1iekHNIPqrW5SdtyKm%2FETls85fbdCqvcivXEMDj9QIgHaQs8wPj2tSpyZiCIF97i8j%2Br25RMWwPzKf5OLPYPpRt%2FhrdvRcfes0Rus80ZUcfo%2BIJKL9Dzy2gac9Faj99n8QIpjx8ZELEksoSTI1UAD6hVnZfWwLxqVkgF628RnaHwMPdF8i%2Fez1x743%2BwP%2FaBo5X%2BzKYXRF2Iow1y7teKaA7aG9iQkMiPGilSuMVVlGPOXAi9kvXP5ZXZ3yDg7VDTTPBi8IGPfh1rhXqGGPX5N8jmdjxGkFctvg3qG5O3kXtF8xMJrWrdYGOqUBqkUKIEMZfOjxmF1xw9FMr3v2VNG%2F2PNBy8A%2FDASOafMXMIhn2djLpz4LMOiGyiSwzYeONiYWZ1j9gSi84R3F5%2FShyLoMh8adL0m2%2F9Hvn1ouTQoBRlF5Yhfj9LQgggqofu47ErxLfk1UyD3ZTFoQFiPVrS%2FLrwwu9FFHxtcnHFblKEOxaadb3Vj%2FJKJrooKTcQj2oGbe9sHqlVXow8aVKVRrwZfl&X-Amz-Signature=2bf62811b4e7919f847787f6f3f2dc2a1223e7485c0e923bef026f6b0fbfa1ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
