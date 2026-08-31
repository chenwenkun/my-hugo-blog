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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF67M7UB%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T021340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC1EXfd5oeSh4GpLv7uR4vb8wmhd983mZwFIUddQdt6dAIgInudMciYyEgAncK4hhagG6FhdGQUJG1n%2B2JlfBMCuIAqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNnZ%2FylNhu%2Fso5FEzSrcAxTT3YE3jdaH5Yt8B95Nr8F%2B99jFP8HNOW9MZbdxqwnu4mRoZ%2FeISw%2FiUMp5Br%2FEpp3g1%2FVBO%2FBPtHosLAC4VFsXjXlvYJE7rUD6yjEhsqLl1knpYiBpZy%2B1OYx%2B9bhaDsdqerDPH76i0MThI7kr7r%2BBUvMH29y4JDEX46I99Eq%2BJ4MFW2QmttNGocfY0Om%2BeBziskGlaJ8V%2BPt2UCQq7f3eT0FQ3JnOgwyhip1nom6oY%2FpWGS%2BqwrE%2FpxHYxto6rBGHMaV0TRfAY3o2ym%2FidzhrOk9pF9lz8PstwjRaDI56A1ilSeLH32bOGQNfH6APQvfT9ZycJUF52vY41uoUa8gp7wRI4ta8ruJ3XOIghXptLLllU7KIGiZqJ1%2BcTkEh7qjt8%2BqmCmWC8ELfCXznfpe8BcIecZa71EhdN3W4Ktfzo9sakZVUYQfQRYapWcTBEXxRrIX6%2ByN3%2FQJxXkJ4%2Bi2nt93ybSIstNQtsQU%2FMTLrMnPz5Sm%2BsMnrU%2FhzN3tVnf2DSqjBXJYj3TQs7aEvtYmMm82W%2Fh3joMRHylMnVRttYzI2JVsQSn15DbkSO6FUqaM9q8DEefbIv5tOVtFE5%2BhjtIdx9FQ3%2FRIOH6LSqqtirOzncJUtlk7udtXKMI2q09QGOqUBfSN3hLGTlXP%2FnvjpKh1ZMCugvSJBroVCHo0kcWRCMvTDiU5ev8wu9lfqW7KB1yDSbQNVCqtuVhvD4nJ85DPJp%2FCdppApB9btZKIS%2B%2BvzaSa0AcVSuTHuzYeuXuhMjnYnMWsUsebG3clhToRv%2BrbHJhOAgcgDTrh1dGJpdnRP5idOFsD3r4Hqw9MJRo3iF7nU2ZOy84r%2BiaFbjn0jjgyu5Jq2wRpZ&X-Amz-Signature=da6eedb6b38f6b834f7263cdf1bfd467056a449a052efdb639d718117f613ec9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF67M7UB%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T021340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC1EXfd5oeSh4GpLv7uR4vb8wmhd983mZwFIUddQdt6dAIgInudMciYyEgAncK4hhagG6FhdGQUJG1n%2B2JlfBMCuIAqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNnZ%2FylNhu%2Fso5FEzSrcAxTT3YE3jdaH5Yt8B95Nr8F%2B99jFP8HNOW9MZbdxqwnu4mRoZ%2FeISw%2FiUMp5Br%2FEpp3g1%2FVBO%2FBPtHosLAC4VFsXjXlvYJE7rUD6yjEhsqLl1knpYiBpZy%2B1OYx%2B9bhaDsdqerDPH76i0MThI7kr7r%2BBUvMH29y4JDEX46I99Eq%2BJ4MFW2QmttNGocfY0Om%2BeBziskGlaJ8V%2BPt2UCQq7f3eT0FQ3JnOgwyhip1nom6oY%2FpWGS%2BqwrE%2FpxHYxto6rBGHMaV0TRfAY3o2ym%2FidzhrOk9pF9lz8PstwjRaDI56A1ilSeLH32bOGQNfH6APQvfT9ZycJUF52vY41uoUa8gp7wRI4ta8ruJ3XOIghXptLLllU7KIGiZqJ1%2BcTkEh7qjt8%2BqmCmWC8ELfCXznfpe8BcIecZa71EhdN3W4Ktfzo9sakZVUYQfQRYapWcTBEXxRrIX6%2ByN3%2FQJxXkJ4%2Bi2nt93ybSIstNQtsQU%2FMTLrMnPz5Sm%2BsMnrU%2FhzN3tVnf2DSqjBXJYj3TQs7aEvtYmMm82W%2Fh3joMRHylMnVRttYzI2JVsQSn15DbkSO6FUqaM9q8DEefbIv5tOVtFE5%2BhjtIdx9FQ3%2FRIOH6LSqqtirOzncJUtlk7udtXKMI2q09QGOqUBfSN3hLGTlXP%2FnvjpKh1ZMCugvSJBroVCHo0kcWRCMvTDiU5ev8wu9lfqW7KB1yDSbQNVCqtuVhvD4nJ85DPJp%2FCdppApB9btZKIS%2B%2BvzaSa0AcVSuTHuzYeuXuhMjnYnMWsUsebG3clhToRv%2BrbHJhOAgcgDTrh1dGJpdnRP5idOFsD3r4Hqw9MJRo3iF7nU2ZOy84r%2BiaFbjn0jjgyu5Jq2wRpZ&X-Amz-Signature=a67f5adba2ae101e509b7d3789b915e8879f53d56c446a01bd302d0c0be011c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF67M7UB%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T021340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC1EXfd5oeSh4GpLv7uR4vb8wmhd983mZwFIUddQdt6dAIgInudMciYyEgAncK4hhagG6FhdGQUJG1n%2B2JlfBMCuIAqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNnZ%2FylNhu%2Fso5FEzSrcAxTT3YE3jdaH5Yt8B95Nr8F%2B99jFP8HNOW9MZbdxqwnu4mRoZ%2FeISw%2FiUMp5Br%2FEpp3g1%2FVBO%2FBPtHosLAC4VFsXjXlvYJE7rUD6yjEhsqLl1knpYiBpZy%2B1OYx%2B9bhaDsdqerDPH76i0MThI7kr7r%2BBUvMH29y4JDEX46I99Eq%2BJ4MFW2QmttNGocfY0Om%2BeBziskGlaJ8V%2BPt2UCQq7f3eT0FQ3JnOgwyhip1nom6oY%2FpWGS%2BqwrE%2FpxHYxto6rBGHMaV0TRfAY3o2ym%2FidzhrOk9pF9lz8PstwjRaDI56A1ilSeLH32bOGQNfH6APQvfT9ZycJUF52vY41uoUa8gp7wRI4ta8ruJ3XOIghXptLLllU7KIGiZqJ1%2BcTkEh7qjt8%2BqmCmWC8ELfCXznfpe8BcIecZa71EhdN3W4Ktfzo9sakZVUYQfQRYapWcTBEXxRrIX6%2ByN3%2FQJxXkJ4%2Bi2nt93ybSIstNQtsQU%2FMTLrMnPz5Sm%2BsMnrU%2FhzN3tVnf2DSqjBXJYj3TQs7aEvtYmMm82W%2Fh3joMRHylMnVRttYzI2JVsQSn15DbkSO6FUqaM9q8DEefbIv5tOVtFE5%2BhjtIdx9FQ3%2FRIOH6LSqqtirOzncJUtlk7udtXKMI2q09QGOqUBfSN3hLGTlXP%2FnvjpKh1ZMCugvSJBroVCHo0kcWRCMvTDiU5ev8wu9lfqW7KB1yDSbQNVCqtuVhvD4nJ85DPJp%2FCdppApB9btZKIS%2B%2BvzaSa0AcVSuTHuzYeuXuhMjnYnMWsUsebG3clhToRv%2BrbHJhOAgcgDTrh1dGJpdnRP5idOFsD3r4Hqw9MJRo3iF7nU2ZOy84r%2BiaFbjn0jjgyu5Jq2wRpZ&X-Amz-Signature=0474bf0030dc259cb2c6c2c75dc3d47a59e2aa9430adce009828e0166a9e482f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WF67M7UB%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T021340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC1EXfd5oeSh4GpLv7uR4vb8wmhd983mZwFIUddQdt6dAIgInudMciYyEgAncK4hhagG6FhdGQUJG1n%2B2JlfBMCuIAqiAQIiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNnZ%2FylNhu%2Fso5FEzSrcAxTT3YE3jdaH5Yt8B95Nr8F%2B99jFP8HNOW9MZbdxqwnu4mRoZ%2FeISw%2FiUMp5Br%2FEpp3g1%2FVBO%2FBPtHosLAC4VFsXjXlvYJE7rUD6yjEhsqLl1knpYiBpZy%2B1OYx%2B9bhaDsdqerDPH76i0MThI7kr7r%2BBUvMH29y4JDEX46I99Eq%2BJ4MFW2QmttNGocfY0Om%2BeBziskGlaJ8V%2BPt2UCQq7f3eT0FQ3JnOgwyhip1nom6oY%2FpWGS%2BqwrE%2FpxHYxto6rBGHMaV0TRfAY3o2ym%2FidzhrOk9pF9lz8PstwjRaDI56A1ilSeLH32bOGQNfH6APQvfT9ZycJUF52vY41uoUa8gp7wRI4ta8ruJ3XOIghXptLLllU7KIGiZqJ1%2BcTkEh7qjt8%2BqmCmWC8ELfCXznfpe8BcIecZa71EhdN3W4Ktfzo9sakZVUYQfQRYapWcTBEXxRrIX6%2ByN3%2FQJxXkJ4%2Bi2nt93ybSIstNQtsQU%2FMTLrMnPz5Sm%2BsMnrU%2FhzN3tVnf2DSqjBXJYj3TQs7aEvtYmMm82W%2Fh3joMRHylMnVRttYzI2JVsQSn15DbkSO6FUqaM9q8DEefbIv5tOVtFE5%2BhjtIdx9FQ3%2FRIOH6LSqqtirOzncJUtlk7udtXKMI2q09QGOqUBfSN3hLGTlXP%2FnvjpKh1ZMCugvSJBroVCHo0kcWRCMvTDiU5ev8wu9lfqW7KB1yDSbQNVCqtuVhvD4nJ85DPJp%2FCdppApB9btZKIS%2B%2BvzaSa0AcVSuTHuzYeuXuhMjnYnMWsUsebG3clhToRv%2BrbHJhOAgcgDTrh1dGJpdnRP5idOFsD3r4Hqw9MJRo3iF7nU2ZOy84r%2BiaFbjn0jjgyu5Jq2wRpZ&X-Amz-Signature=a9bb8fb08d9aef50afb078a47fb70003da17ed714400497c01c537a4d580ee36&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
