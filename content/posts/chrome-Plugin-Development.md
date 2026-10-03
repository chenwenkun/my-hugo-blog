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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUSP3HAK%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T024955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCfFAfqmE9lkTCqN8DYunm%2BoQeGdaNaOYfsgp9rlaOR9gIgW%2FW%2BiSaBDSwcUkqeSvn83KMiYLyfnlpw93T2r7abGa4qiAQIov%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHNm20lsbhGCzooHgSrcA1Cfb04cIWRoswOoeGpBOulfFXUQAPxRZ188QmhqEDvSV2qV0S70TCQq3SnT5CGjbYdtOYCnaCvwKbTgFxolHZe%2FzQTYl1ZIu9buICzlWH4sMMpgmxU%2B3vV8DMF1TVF8f1Wae1%2FmZ8Ho3y4jEMy9I8BM2yDkW2HxHJm6ZuiLVp4SMNYk7C4eA%2FjGHOO1Bn7TePnLDohjjMVgX39gh6NmvVEf6Elh2zCb9bKHyAmPuSAbLyRNkMnI%2FPknKKaI2mUeZN%2FUnBsAjkyRIf1ZJ3DLg921mgb3U4fvUT%2BbY3XEUjlVi4KJ9SCi%2BJI1H%2B%2FRpdeunMKYVB61Y5cWoN%2Bcxpio%2BGfbxf4edJF2JjBekzBvktn%2FMeRNL%2Bt5b%2FKbQ8W%2FzdxRSFEdp%2Bu3TNbF7gYBW062y%2BHdRMOX1Hk1EUJJYA8SM1%2BoVbGiuoUfASi74pi2CFQuodSIluClq56jqGaqaIWLkTA7CJ%2FbCmOTMQK38WFguKDoaUUrOZHS94637CZaN2kl3cQeJdtySKItzxcAGSJmkIznuT4LF97hM0I7dgs9rX7sMl1XxojOtNfvjgLSqiNBCkv35tPIkGPILXyTUtywVJ4mY%2FpAGxqtvEYcrjh1zbjF4YYU%2Bj1m5w6VIa3SMMSkgdYGOqUBlcSSTWC%2F%2FlWVTHAcNuoedTboe3lrUW%2Bd5myt2LDNyQnuZqPGX1aPBknfYJK83TlCl6LTj385K7KjrCJZ1ZgnZlEb%2FZjcEFw8d3EonnFpJUwQBX3R5JGBiMrlOwYt4XhL6jTZ3YQI%2FQyAP3qTqxLY5P963R5Li%2BD3ItT649xGoEt5CGWxEzmLIhNuVqSFC5zRYKjPDPMLFYeQe9vVcMpRhKrVttoy&X-Amz-Signature=0ab688bdb233986de5e7a2b6a5a9ea9e0c551edcaa174ab14f695312bec995e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUSP3HAK%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T024955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCfFAfqmE9lkTCqN8DYunm%2BoQeGdaNaOYfsgp9rlaOR9gIgW%2FW%2BiSaBDSwcUkqeSvn83KMiYLyfnlpw93T2r7abGa4qiAQIov%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHNm20lsbhGCzooHgSrcA1Cfb04cIWRoswOoeGpBOulfFXUQAPxRZ188QmhqEDvSV2qV0S70TCQq3SnT5CGjbYdtOYCnaCvwKbTgFxolHZe%2FzQTYl1ZIu9buICzlWH4sMMpgmxU%2B3vV8DMF1TVF8f1Wae1%2FmZ8Ho3y4jEMy9I8BM2yDkW2HxHJm6ZuiLVp4SMNYk7C4eA%2FjGHOO1Bn7TePnLDohjjMVgX39gh6NmvVEf6Elh2zCb9bKHyAmPuSAbLyRNkMnI%2FPknKKaI2mUeZN%2FUnBsAjkyRIf1ZJ3DLg921mgb3U4fvUT%2BbY3XEUjlVi4KJ9SCi%2BJI1H%2B%2FRpdeunMKYVB61Y5cWoN%2Bcxpio%2BGfbxf4edJF2JjBekzBvktn%2FMeRNL%2Bt5b%2FKbQ8W%2FzdxRSFEdp%2Bu3TNbF7gYBW062y%2BHdRMOX1Hk1EUJJYA8SM1%2BoVbGiuoUfASi74pi2CFQuodSIluClq56jqGaqaIWLkTA7CJ%2FbCmOTMQK38WFguKDoaUUrOZHS94637CZaN2kl3cQeJdtySKItzxcAGSJmkIznuT4LF97hM0I7dgs9rX7sMl1XxojOtNfvjgLSqiNBCkv35tPIkGPILXyTUtywVJ4mY%2FpAGxqtvEYcrjh1zbjF4YYU%2Bj1m5w6VIa3SMMSkgdYGOqUBlcSSTWC%2F%2FlWVTHAcNuoedTboe3lrUW%2Bd5myt2LDNyQnuZqPGX1aPBknfYJK83TlCl6LTj385K7KjrCJZ1ZgnZlEb%2FZjcEFw8d3EonnFpJUwQBX3R5JGBiMrlOwYt4XhL6jTZ3YQI%2FQyAP3qTqxLY5P963R5Li%2BD3ItT649xGoEt5CGWxEzmLIhNuVqSFC5zRYKjPDPMLFYeQe9vVcMpRhKrVttoy&X-Amz-Signature=badd322961e8be266987783fe0e4a7775fbba012e7d1935458fe2ef92cac1d97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUSP3HAK%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T024955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCfFAfqmE9lkTCqN8DYunm%2BoQeGdaNaOYfsgp9rlaOR9gIgW%2FW%2BiSaBDSwcUkqeSvn83KMiYLyfnlpw93T2r7abGa4qiAQIov%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHNm20lsbhGCzooHgSrcA1Cfb04cIWRoswOoeGpBOulfFXUQAPxRZ188QmhqEDvSV2qV0S70TCQq3SnT5CGjbYdtOYCnaCvwKbTgFxolHZe%2FzQTYl1ZIu9buICzlWH4sMMpgmxU%2B3vV8DMF1TVF8f1Wae1%2FmZ8Ho3y4jEMy9I8BM2yDkW2HxHJm6ZuiLVp4SMNYk7C4eA%2FjGHOO1Bn7TePnLDohjjMVgX39gh6NmvVEf6Elh2zCb9bKHyAmPuSAbLyRNkMnI%2FPknKKaI2mUeZN%2FUnBsAjkyRIf1ZJ3DLg921mgb3U4fvUT%2BbY3XEUjlVi4KJ9SCi%2BJI1H%2B%2FRpdeunMKYVB61Y5cWoN%2Bcxpio%2BGfbxf4edJF2JjBekzBvktn%2FMeRNL%2Bt5b%2FKbQ8W%2FzdxRSFEdp%2Bu3TNbF7gYBW062y%2BHdRMOX1Hk1EUJJYA8SM1%2BoVbGiuoUfASi74pi2CFQuodSIluClq56jqGaqaIWLkTA7CJ%2FbCmOTMQK38WFguKDoaUUrOZHS94637CZaN2kl3cQeJdtySKItzxcAGSJmkIznuT4LF97hM0I7dgs9rX7sMl1XxojOtNfvjgLSqiNBCkv35tPIkGPILXyTUtywVJ4mY%2FpAGxqtvEYcrjh1zbjF4YYU%2Bj1m5w6VIa3SMMSkgdYGOqUBlcSSTWC%2F%2FlWVTHAcNuoedTboe3lrUW%2Bd5myt2LDNyQnuZqPGX1aPBknfYJK83TlCl6LTj385K7KjrCJZ1ZgnZlEb%2FZjcEFw8d3EonnFpJUwQBX3R5JGBiMrlOwYt4XhL6jTZ3YQI%2FQyAP3qTqxLY5P963R5Li%2BD3ItT649xGoEt5CGWxEzmLIhNuVqSFC5zRYKjPDPMLFYeQe9vVcMpRhKrVttoy&X-Amz-Signature=16efb987f66126e21b8bf26096341ab65a7cd1c7ca63a6c5ded1fd96e118dd15&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YUSP3HAK%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T024955Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCfFAfqmE9lkTCqN8DYunm%2BoQeGdaNaOYfsgp9rlaOR9gIgW%2FW%2BiSaBDSwcUkqeSvn83KMiYLyfnlpw93T2r7abGa4qiAQIov%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDHNm20lsbhGCzooHgSrcA1Cfb04cIWRoswOoeGpBOulfFXUQAPxRZ188QmhqEDvSV2qV0S70TCQq3SnT5CGjbYdtOYCnaCvwKbTgFxolHZe%2FzQTYl1ZIu9buICzlWH4sMMpgmxU%2B3vV8DMF1TVF8f1Wae1%2FmZ8Ho3y4jEMy9I8BM2yDkW2HxHJm6ZuiLVp4SMNYk7C4eA%2FjGHOO1Bn7TePnLDohjjMVgX39gh6NmvVEf6Elh2zCb9bKHyAmPuSAbLyRNkMnI%2FPknKKaI2mUeZN%2FUnBsAjkyRIf1ZJ3DLg921mgb3U4fvUT%2BbY3XEUjlVi4KJ9SCi%2BJI1H%2B%2FRpdeunMKYVB61Y5cWoN%2Bcxpio%2BGfbxf4edJF2JjBekzBvktn%2FMeRNL%2Bt5b%2FKbQ8W%2FzdxRSFEdp%2Bu3TNbF7gYBW062y%2BHdRMOX1Hk1EUJJYA8SM1%2BoVbGiuoUfASi74pi2CFQuodSIluClq56jqGaqaIWLkTA7CJ%2FbCmOTMQK38WFguKDoaUUrOZHS94637CZaN2kl3cQeJdtySKItzxcAGSJmkIznuT4LF97hM0I7dgs9rX7sMl1XxojOtNfvjgLSqiNBCkv35tPIkGPILXyTUtywVJ4mY%2FpAGxqtvEYcrjh1zbjF4YYU%2Bj1m5w6VIa3SMMSkgdYGOqUBlcSSTWC%2F%2FlWVTHAcNuoedTboe3lrUW%2Bd5myt2LDNyQnuZqPGX1aPBknfYJK83TlCl6LTj385K7KjrCJZ1ZgnZlEb%2FZjcEFw8d3EonnFpJUwQBX3R5JGBiMrlOwYt4XhL6jTZ3YQI%2FQyAP3qTqxLY5P963R5Li%2BD3ItT649xGoEt5CGWxEzmLIhNuVqSFC5zRYKjPDPMLFYeQe9vVcMpRhKrVttoy&X-Amz-Signature=69a6361bcfd7a30599666e21e198426f662f3822840d9c5c1ab722d1742057ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
