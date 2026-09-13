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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BMDPTGL%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T104614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCX7SKEiqOBbokNyMypfRBPg73Mzfm80QqTw1Wn2%2BZHRwIhANUrhNL18%2FHf3HOin2hf4tp4o%2F3hqQv7ld2flDPry6DzKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwyDHYsU700ajRVK5gq3ANG5WMIRkA0FTbV94lbRroJsetmlbOuUNMpyp2k06e8sk5IZNZoSE5G4XuT%2BAK6AFkgCJDLsKS7CHmM96h416iTt4HGKwtidIzSCxGbNo4Z45ONmBKiSNpf2I6z70TS1jTpGFvogYfPEYKvKyHfr8Yr2oyMHgiwKFWMVD4JMT%2Bi7Ihea%2BuD%2FFYM%2FBZ4uokVRD2VjB%2Bxl0689%2FmmfQdqLyDX3%2FOVhidwvAuJBKkeb2Izhz7oiKZO99rSwIbb773NlGOT6Hym1TDh%2Fr12ogWcFI%2BlAj9bt%2BUrK058Afj8rV9R8e0GPZyvkZbvNCs7JYjlzd96psDHIIZ%2BD3kfs8xczJlxjeKVRoACnEd%2BnVsczWh8IWxfiFFqzY%2B7kHxYJ1Kj89w%2B7woe%2FMQZUK0lfHYh%2Ba6JSzdQMwbdY7DUCXWtGJH2qFMjKOYdlYpaAuXyBv8tFGsxUWUuVHc%2BoEwT1bGdTLersMszh%2FcFUpXneDKg5d5tUCUcvjXRHJkT5pcoIDeQeerRogB2h7YtAzyuoIckGZ2emAahG%2Fq7jETIhbRvAXnv4l5CcUFCPHLhIiaGUaNqua9LRxEoUHqzNQ7DcTT7kKHVKEmccos3bdFdX75JB7LezMT5CAQp6G2I2edydDCa9JnVBjqkAQ7zS2iSkrkik9cDhF4r5qXl7gsZidw7vB2fVkcmkNR9HtVevg0tdhEuJCV8RXnEc5SLtooq6Zj3FqvaS3nbHGJmdZ8vYa7TItrI4ReZcL3PDDG%2BQakDJgiX%2B1MNWQPopNGgCVer5%2BtQ7iqxCrIAx8KoWbYA27gX%2FM4vdowUotKGO2%2B%2FHxDJ72KaSV1lQVjzr6L8ZuIMKlre4R9omqPo%2BKFRMSaF&X-Amz-Signature=d447fc00ded3586b624a023d99370f48c113f15b6c505389ae3f6c4ff67cf009&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BMDPTGL%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T104614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCX7SKEiqOBbokNyMypfRBPg73Mzfm80QqTw1Wn2%2BZHRwIhANUrhNL18%2FHf3HOin2hf4tp4o%2F3hqQv7ld2flDPry6DzKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwyDHYsU700ajRVK5gq3ANG5WMIRkA0FTbV94lbRroJsetmlbOuUNMpyp2k06e8sk5IZNZoSE5G4XuT%2BAK6AFkgCJDLsKS7CHmM96h416iTt4HGKwtidIzSCxGbNo4Z45ONmBKiSNpf2I6z70TS1jTpGFvogYfPEYKvKyHfr8Yr2oyMHgiwKFWMVD4JMT%2Bi7Ihea%2BuD%2FFYM%2FBZ4uokVRD2VjB%2Bxl0689%2FmmfQdqLyDX3%2FOVhidwvAuJBKkeb2Izhz7oiKZO99rSwIbb773NlGOT6Hym1TDh%2Fr12ogWcFI%2BlAj9bt%2BUrK058Afj8rV9R8e0GPZyvkZbvNCs7JYjlzd96psDHIIZ%2BD3kfs8xczJlxjeKVRoACnEd%2BnVsczWh8IWxfiFFqzY%2B7kHxYJ1Kj89w%2B7woe%2FMQZUK0lfHYh%2Ba6JSzdQMwbdY7DUCXWtGJH2qFMjKOYdlYpaAuXyBv8tFGsxUWUuVHc%2BoEwT1bGdTLersMszh%2FcFUpXneDKg5d5tUCUcvjXRHJkT5pcoIDeQeerRogB2h7YtAzyuoIckGZ2emAahG%2Fq7jETIhbRvAXnv4l5CcUFCPHLhIiaGUaNqua9LRxEoUHqzNQ7DcTT7kKHVKEmccos3bdFdX75JB7LezMT5CAQp6G2I2edydDCa9JnVBjqkAQ7zS2iSkrkik9cDhF4r5qXl7gsZidw7vB2fVkcmkNR9HtVevg0tdhEuJCV8RXnEc5SLtooq6Zj3FqvaS3nbHGJmdZ8vYa7TItrI4ReZcL3PDDG%2BQakDJgiX%2B1MNWQPopNGgCVer5%2BtQ7iqxCrIAx8KoWbYA27gX%2FM4vdowUotKGO2%2B%2FHxDJ72KaSV1lQVjzr6L8ZuIMKlre4R9omqPo%2BKFRMSaF&X-Amz-Signature=c31aeb8dd9810910dfa52f1681bc5c5debb1477956a8ce8f0d44e675b6dd6101&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BMDPTGL%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T104614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCX7SKEiqOBbokNyMypfRBPg73Mzfm80QqTw1Wn2%2BZHRwIhANUrhNL18%2FHf3HOin2hf4tp4o%2F3hqQv7ld2flDPry6DzKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwyDHYsU700ajRVK5gq3ANG5WMIRkA0FTbV94lbRroJsetmlbOuUNMpyp2k06e8sk5IZNZoSE5G4XuT%2BAK6AFkgCJDLsKS7CHmM96h416iTt4HGKwtidIzSCxGbNo4Z45ONmBKiSNpf2I6z70TS1jTpGFvogYfPEYKvKyHfr8Yr2oyMHgiwKFWMVD4JMT%2Bi7Ihea%2BuD%2FFYM%2FBZ4uokVRD2VjB%2Bxl0689%2FmmfQdqLyDX3%2FOVhidwvAuJBKkeb2Izhz7oiKZO99rSwIbb773NlGOT6Hym1TDh%2Fr12ogWcFI%2BlAj9bt%2BUrK058Afj8rV9R8e0GPZyvkZbvNCs7JYjlzd96psDHIIZ%2BD3kfs8xczJlxjeKVRoACnEd%2BnVsczWh8IWxfiFFqzY%2B7kHxYJ1Kj89w%2B7woe%2FMQZUK0lfHYh%2Ba6JSzdQMwbdY7DUCXWtGJH2qFMjKOYdlYpaAuXyBv8tFGsxUWUuVHc%2BoEwT1bGdTLersMszh%2FcFUpXneDKg5d5tUCUcvjXRHJkT5pcoIDeQeerRogB2h7YtAzyuoIckGZ2emAahG%2Fq7jETIhbRvAXnv4l5CcUFCPHLhIiaGUaNqua9LRxEoUHqzNQ7DcTT7kKHVKEmccos3bdFdX75JB7LezMT5CAQp6G2I2edydDCa9JnVBjqkAQ7zS2iSkrkik9cDhF4r5qXl7gsZidw7vB2fVkcmkNR9HtVevg0tdhEuJCV8RXnEc5SLtooq6Zj3FqvaS3nbHGJmdZ8vYa7TItrI4ReZcL3PDDG%2BQakDJgiX%2B1MNWQPopNGgCVer5%2BtQ7iqxCrIAx8KoWbYA27gX%2FM4vdowUotKGO2%2B%2FHxDJ72KaSV1lQVjzr6L8ZuIMKlre4R9omqPo%2BKFRMSaF&X-Amz-Signature=774660502ff521607e2d4d7c07304270ff610dc82e660e91bc71ecb5510a6c85&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663BMDPTGL%2F20260913%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260913T104614Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAMaCXVzLXdlc3QtMiJIMEYCIQCX7SKEiqOBbokNyMypfRBPg73Mzfm80QqTw1Wn2%2BZHRwIhANUrhNL18%2FHf3HOin2hf4tp4o%2F3hqQv7ld2flDPry6DzKogECMz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwyDHYsU700ajRVK5gq3ANG5WMIRkA0FTbV94lbRroJsetmlbOuUNMpyp2k06e8sk5IZNZoSE5G4XuT%2BAK6AFkgCJDLsKS7CHmM96h416iTt4HGKwtidIzSCxGbNo4Z45ONmBKiSNpf2I6z70TS1jTpGFvogYfPEYKvKyHfr8Yr2oyMHgiwKFWMVD4JMT%2Bi7Ihea%2BuD%2FFYM%2FBZ4uokVRD2VjB%2Bxl0689%2FmmfQdqLyDX3%2FOVhidwvAuJBKkeb2Izhz7oiKZO99rSwIbb773NlGOT6Hym1TDh%2Fr12ogWcFI%2BlAj9bt%2BUrK058Afj8rV9R8e0GPZyvkZbvNCs7JYjlzd96psDHIIZ%2BD3kfs8xczJlxjeKVRoACnEd%2BnVsczWh8IWxfiFFqzY%2B7kHxYJ1Kj89w%2B7woe%2FMQZUK0lfHYh%2Ba6JSzdQMwbdY7DUCXWtGJH2qFMjKOYdlYpaAuXyBv8tFGsxUWUuVHc%2BoEwT1bGdTLersMszh%2FcFUpXneDKg5d5tUCUcvjXRHJkT5pcoIDeQeerRogB2h7YtAzyuoIckGZ2emAahG%2Fq7jETIhbRvAXnv4l5CcUFCPHLhIiaGUaNqua9LRxEoUHqzNQ7DcTT7kKHVKEmccos3bdFdX75JB7LezMT5CAQp6G2I2edydDCa9JnVBjqkAQ7zS2iSkrkik9cDhF4r5qXl7gsZidw7vB2fVkcmkNR9HtVevg0tdhEuJCV8RXnEc5SLtooq6Zj3FqvaS3nbHGJmdZ8vYa7TItrI4ReZcL3PDDG%2BQakDJgiX%2B1MNWQPopNGgCVer5%2BtQ7iqxCrIAx8KoWbYA27gX%2FM4vdowUotKGO2%2B%2FHxDJ72KaSV1lQVjzr6L8ZuIMKlre4R9omqPo%2BKFRMSaF&X-Amz-Signature=85de558ed629805351867c0c9397d738b8f13ace2505863857ebcddb1935d880&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
