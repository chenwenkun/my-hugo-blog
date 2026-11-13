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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466REMTB44R%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T040010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC41yw17e12%2F1NV9HZj6X5rySClD%2B7WThDH5B1nGgGRUQIgDZoUk09OPslimDm2D%2BgIEWvN1teS%2F0SxRMC35Y64UAcq%2FwMIfBAAGgw2Mzc0MjMxODM4MDUiDLYG3aYAUogDuvOdgyrcA8RcGIwV3qOALcIUVPvc973o%2FCksQ6ke%2BAy7Xvbo%2FAcIkExLL1Ipvft2ZSwroUHIDFXPU0PHdzP2qQd3NSK0%2B3zPs4bOOuVAr6m97IUcwyLEDWWAF%2F9NA7%2FjW8SN2dDiIP%2BFVakjN2Cl9FB4ypWjS4M1POtTjRF9vrQktrrlzoe17BzPBTAwrkDnIVBM5brDFdMgnbNjUKKwgcWtIbTv0BRM0NNRE23qggZxKp7Z9YsWQMaKhqAS72jXGOuAzkiJDXg3bJDh5ah5J3Lxy0y5g4BDjDhf%2B65ZZfFKZm2Hvca0eq%2Fg13b73oePxXLq8zDVbhw7Z4wa%2FiTFsC789sB%2FWis2I8KoPvqq%2FeWCdJxhKRqJiVjgdj11qr6TzBS3RAz6MOpStV5pybT3yU6sx2kAJlhipigrv0r2Y00fm%2Fi6KbRArZ3UVzUdfjqvwf2ilDd%2BbVctA%2F6PmfgfrcmwF49g43fe86SHhWIr%2BLyOoiB71BDxNoEl2axMzEHGuOvyd0w%2BGhR9tr%2FdSFKI5a5YwQaW1F9YlrGYWfpJiunbkuHdEEi8OQ2Bm%2F%2F8DpMBZldj53IIG2BEZN72TteJzplMKzCAcgVdW7G4L3hJDEnso0Ou54h2%2BT%2BWfX0t89GW64z4MN702dcGOqUBxO29ukwtjuACwD8mfy%2FMUl3Z1M7Mm5R7n3MvLOBQEYbN9Z%2BbXcNfpGbl9GZA1aDUZb8ci8nWFeMWkzYd1dkzc02EdjwD57b1K8i7iaZOfjhCcZooAonJ4ZTv4uu8fwkKYELMUA%2BbJAiU7%2Bjz9SDtRcLZMGwpEt2rlGkzqoK0xyqnYzW9cZAODfjcAc%2FR%2BClDF4nhbD7gqFJNXUYYbmWriJrfxUvb&X-Amz-Signature=f970be2ee059db60cbfe0ed3870c9c59a339aa2190afa30cd9abeb6737954a03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466REMTB44R%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T040010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC41yw17e12%2F1NV9HZj6X5rySClD%2B7WThDH5B1nGgGRUQIgDZoUk09OPslimDm2D%2BgIEWvN1teS%2F0SxRMC35Y64UAcq%2FwMIfBAAGgw2Mzc0MjMxODM4MDUiDLYG3aYAUogDuvOdgyrcA8RcGIwV3qOALcIUVPvc973o%2FCksQ6ke%2BAy7Xvbo%2FAcIkExLL1Ipvft2ZSwroUHIDFXPU0PHdzP2qQd3NSK0%2B3zPs4bOOuVAr6m97IUcwyLEDWWAF%2F9NA7%2FjW8SN2dDiIP%2BFVakjN2Cl9FB4ypWjS4M1POtTjRF9vrQktrrlzoe17BzPBTAwrkDnIVBM5brDFdMgnbNjUKKwgcWtIbTv0BRM0NNRE23qggZxKp7Z9YsWQMaKhqAS72jXGOuAzkiJDXg3bJDh5ah5J3Lxy0y5g4BDjDhf%2B65ZZfFKZm2Hvca0eq%2Fg13b73oePxXLq8zDVbhw7Z4wa%2FiTFsC789sB%2FWis2I8KoPvqq%2FeWCdJxhKRqJiVjgdj11qr6TzBS3RAz6MOpStV5pybT3yU6sx2kAJlhipigrv0r2Y00fm%2Fi6KbRArZ3UVzUdfjqvwf2ilDd%2BbVctA%2F6PmfgfrcmwF49g43fe86SHhWIr%2BLyOoiB71BDxNoEl2axMzEHGuOvyd0w%2BGhR9tr%2FdSFKI5a5YwQaW1F9YlrGYWfpJiunbkuHdEEi8OQ2Bm%2F%2F8DpMBZldj53IIG2BEZN72TteJzplMKzCAcgVdW7G4L3hJDEnso0Ou54h2%2BT%2BWfX0t89GW64z4MN702dcGOqUBxO29ukwtjuACwD8mfy%2FMUl3Z1M7Mm5R7n3MvLOBQEYbN9Z%2BbXcNfpGbl9GZA1aDUZb8ci8nWFeMWkzYd1dkzc02EdjwD57b1K8i7iaZOfjhCcZooAonJ4ZTv4uu8fwkKYELMUA%2BbJAiU7%2Bjz9SDtRcLZMGwpEt2rlGkzqoK0xyqnYzW9cZAODfjcAc%2FR%2BClDF4nhbD7gqFJNXUYYbmWriJrfxUvb&X-Amz-Signature=6798a86c28a55996ff11d52f9ccb260cf73f149e6ae1ac6b292642200d3cafe2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466REMTB44R%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T040010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC41yw17e12%2F1NV9HZj6X5rySClD%2B7WThDH5B1nGgGRUQIgDZoUk09OPslimDm2D%2BgIEWvN1teS%2F0SxRMC35Y64UAcq%2FwMIfBAAGgw2Mzc0MjMxODM4MDUiDLYG3aYAUogDuvOdgyrcA8RcGIwV3qOALcIUVPvc973o%2FCksQ6ke%2BAy7Xvbo%2FAcIkExLL1Ipvft2ZSwroUHIDFXPU0PHdzP2qQd3NSK0%2B3zPs4bOOuVAr6m97IUcwyLEDWWAF%2F9NA7%2FjW8SN2dDiIP%2BFVakjN2Cl9FB4ypWjS4M1POtTjRF9vrQktrrlzoe17BzPBTAwrkDnIVBM5brDFdMgnbNjUKKwgcWtIbTv0BRM0NNRE23qggZxKp7Z9YsWQMaKhqAS72jXGOuAzkiJDXg3bJDh5ah5J3Lxy0y5g4BDjDhf%2B65ZZfFKZm2Hvca0eq%2Fg13b73oePxXLq8zDVbhw7Z4wa%2FiTFsC789sB%2FWis2I8KoPvqq%2FeWCdJxhKRqJiVjgdj11qr6TzBS3RAz6MOpStV5pybT3yU6sx2kAJlhipigrv0r2Y00fm%2Fi6KbRArZ3UVzUdfjqvwf2ilDd%2BbVctA%2F6PmfgfrcmwF49g43fe86SHhWIr%2BLyOoiB71BDxNoEl2axMzEHGuOvyd0w%2BGhR9tr%2FdSFKI5a5YwQaW1F9YlrGYWfpJiunbkuHdEEi8OQ2Bm%2F%2F8DpMBZldj53IIG2BEZN72TteJzplMKzCAcgVdW7G4L3hJDEnso0Ou54h2%2BT%2BWfX0t89GW64z4MN702dcGOqUBxO29ukwtjuACwD8mfy%2FMUl3Z1M7Mm5R7n3MvLOBQEYbN9Z%2BbXcNfpGbl9GZA1aDUZb8ci8nWFeMWkzYd1dkzc02EdjwD57b1K8i7iaZOfjhCcZooAonJ4ZTv4uu8fwkKYELMUA%2BbJAiU7%2Bjz9SDtRcLZMGwpEt2rlGkzqoK0xyqnYzW9cZAODfjcAc%2FR%2BClDF4nhbD7gqFJNXUYYbmWriJrfxUvb&X-Amz-Signature=cf723634d9ba50acbbb09ec0dd42ae47ff96d06c84aca7fcd1dd6d8bdca182c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466REMTB44R%2F20261113%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261113T040010Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC41yw17e12%2F1NV9HZj6X5rySClD%2B7WThDH5B1nGgGRUQIgDZoUk09OPslimDm2D%2BgIEWvN1teS%2F0SxRMC35Y64UAcq%2FwMIfBAAGgw2Mzc0MjMxODM4MDUiDLYG3aYAUogDuvOdgyrcA8RcGIwV3qOALcIUVPvc973o%2FCksQ6ke%2BAy7Xvbo%2FAcIkExLL1Ipvft2ZSwroUHIDFXPU0PHdzP2qQd3NSK0%2B3zPs4bOOuVAr6m97IUcwyLEDWWAF%2F9NA7%2FjW8SN2dDiIP%2BFVakjN2Cl9FB4ypWjS4M1POtTjRF9vrQktrrlzoe17BzPBTAwrkDnIVBM5brDFdMgnbNjUKKwgcWtIbTv0BRM0NNRE23qggZxKp7Z9YsWQMaKhqAS72jXGOuAzkiJDXg3bJDh5ah5J3Lxy0y5g4BDjDhf%2B65ZZfFKZm2Hvca0eq%2Fg13b73oePxXLq8zDVbhw7Z4wa%2FiTFsC789sB%2FWis2I8KoPvqq%2FeWCdJxhKRqJiVjgdj11qr6TzBS3RAz6MOpStV5pybT3yU6sx2kAJlhipigrv0r2Y00fm%2Fi6KbRArZ3UVzUdfjqvwf2ilDd%2BbVctA%2F6PmfgfrcmwF49g43fe86SHhWIr%2BLyOoiB71BDxNoEl2axMzEHGuOvyd0w%2BGhR9tr%2FdSFKI5a5YwQaW1F9YlrGYWfpJiunbkuHdEEi8OQ2Bm%2F%2F8DpMBZldj53IIG2BEZN72TteJzplMKzCAcgVdW7G4L3hJDEnso0Ou54h2%2BT%2BWfX0t89GW64z4MN702dcGOqUBxO29ukwtjuACwD8mfy%2FMUl3Z1M7Mm5R7n3MvLOBQEYbN9Z%2BbXcNfpGbl9GZA1aDUZb8ci8nWFeMWkzYd1dkzc02EdjwD57b1K8i7iaZOfjhCcZooAonJ4ZTv4uu8fwkKYELMUA%2BbJAiU7%2Bjz9SDtRcLZMGwpEt2rlGkzqoK0xyqnYzW9cZAODfjcAc%2FR%2BClDF4nhbD7gqFJNXUYYbmWriJrfxUvb&X-Amz-Signature=1ef0084ae8c1d6a358cabbbf41299492410a1c30868cf588a61631bafa9155ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
