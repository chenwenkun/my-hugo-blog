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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UGGXH2KH%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T111348Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJHMEUCIBW%2FAwce5t%2BMIpj2KBrKGPZINY9dS5PelF33SdktuZiFAiEA4YyU%2FkN98SmFQkBzp%2FD8Kjk6%2B5FILyu%2FepuODX%2B807YqiAQI7P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJceRBudTbnvbaGV2SrcA4jyP7Ab5LYTlus%2FVaOznsvvXGWmV%2FaPHEG4ZDQN%2BRPAr7Jegi6G3AWYsYXIxka1l7FX7oi8lGUTVRR%2ByAkFBK6U6lHDCxP5dL46pN%2BhWGnpxhCgZjXga2eHIjRhVOn0WmIUp%2Fi1Ke2TLgmfui3QAlmzOrYhMybVd6PmKQUHleO8b9hbBa%2BRg1ELuHoXJW5vm3%2FTRl71ZZhF0mYOWlm5%2Bewg%2FZGskNvHmIcwxkDo%2FaahFZz3pr71fZ7L0ypPc6ue34OCeO57tYwY%2FEMbZ5hXtGLObA4b0%2BNwdd0y41%2BJI7nbXCiHglg1c9Px1%2FBWE257dGi5jire3bCmWGTJ4EqgzcOVAiCwUy%2F6zpyt80N08xlZtAkXVm39QQjlK5VYKaHrOE6Xv3BTqk2tyw%2FaON7RucSdFCYw0R8l4K3D7hiJs73QBF5UtB0JTz3SqMpeHcizaCpCKQBQIYHSVjJNem%2B9UkbflX1mmgGRIikVYPoNnuqMRQi9NShzHuhxm8dykokMFDMzh9Eer03QtvCkZHjj%2BcJOHaKNBErT502GVPmLJYbUNrN%2Big2GXo%2FryPwl5iPDZT52i%2FCZEm92jmTgbG3I%2BiaCwgnfIaMvCWkF8eKKwtBHmsoNXEUjGavibPp8MLGJgtcGOqUBERjgfaF1MRrtKPscsHtNCMHQdvYFTxnoFgFexlKA5Q9RKOPCZpFt4hot1cl0ub42aMPQD0FohHTKZjc4wY8HA%2FM0g4%2B8A5GwdKln8P%2Ft7gx16U9xClzvbCUhBUiSpc9opxhoiM9EzjeEJCZg%2B4MJ0Saje%2FY70iQN8RFeslKLzFOKZ9tNKui46Np0wnW0D0D2x%2BE8D9kniYz%2BzNFTOqaQVK%2F7qd7Z&X-Amz-Signature=939131d81ddbacd14c11d13d91b4515909544a3be1a6d0d1911b7e473b466b40&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UGGXH2KH%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T111348Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJHMEUCIBW%2FAwce5t%2BMIpj2KBrKGPZINY9dS5PelF33SdktuZiFAiEA4YyU%2FkN98SmFQkBzp%2FD8Kjk6%2B5FILyu%2FepuODX%2B807YqiAQI7P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJceRBudTbnvbaGV2SrcA4jyP7Ab5LYTlus%2FVaOznsvvXGWmV%2FaPHEG4ZDQN%2BRPAr7Jegi6G3AWYsYXIxka1l7FX7oi8lGUTVRR%2ByAkFBK6U6lHDCxP5dL46pN%2BhWGnpxhCgZjXga2eHIjRhVOn0WmIUp%2Fi1Ke2TLgmfui3QAlmzOrYhMybVd6PmKQUHleO8b9hbBa%2BRg1ELuHoXJW5vm3%2FTRl71ZZhF0mYOWlm5%2Bewg%2FZGskNvHmIcwxkDo%2FaahFZz3pr71fZ7L0ypPc6ue34OCeO57tYwY%2FEMbZ5hXtGLObA4b0%2BNwdd0y41%2BJI7nbXCiHglg1c9Px1%2FBWE257dGi5jire3bCmWGTJ4EqgzcOVAiCwUy%2F6zpyt80N08xlZtAkXVm39QQjlK5VYKaHrOE6Xv3BTqk2tyw%2FaON7RucSdFCYw0R8l4K3D7hiJs73QBF5UtB0JTz3SqMpeHcizaCpCKQBQIYHSVjJNem%2B9UkbflX1mmgGRIikVYPoNnuqMRQi9NShzHuhxm8dykokMFDMzh9Eer03QtvCkZHjj%2BcJOHaKNBErT502GVPmLJYbUNrN%2Big2GXo%2FryPwl5iPDZT52i%2FCZEm92jmTgbG3I%2BiaCwgnfIaMvCWkF8eKKwtBHmsoNXEUjGavibPp8MLGJgtcGOqUBERjgfaF1MRrtKPscsHtNCMHQdvYFTxnoFgFexlKA5Q9RKOPCZpFt4hot1cl0ub42aMPQD0FohHTKZjc4wY8HA%2FM0g4%2B8A5GwdKln8P%2Ft7gx16U9xClzvbCUhBUiSpc9opxhoiM9EzjeEJCZg%2B4MJ0Saje%2FY70iQN8RFeslKLzFOKZ9tNKui46Np0wnW0D0D2x%2BE8D9kniYz%2BzNFTOqaQVK%2F7qd7Z&X-Amz-Signature=a2a8c11222a6e2d93d8b4dc07e60222be0d165a77254ebdbfc091c4f076cd04e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UGGXH2KH%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T111348Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJHMEUCIBW%2FAwce5t%2BMIpj2KBrKGPZINY9dS5PelF33SdktuZiFAiEA4YyU%2FkN98SmFQkBzp%2FD8Kjk6%2B5FILyu%2FepuODX%2B807YqiAQI7P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJceRBudTbnvbaGV2SrcA4jyP7Ab5LYTlus%2FVaOznsvvXGWmV%2FaPHEG4ZDQN%2BRPAr7Jegi6G3AWYsYXIxka1l7FX7oi8lGUTVRR%2ByAkFBK6U6lHDCxP5dL46pN%2BhWGnpxhCgZjXga2eHIjRhVOn0WmIUp%2Fi1Ke2TLgmfui3QAlmzOrYhMybVd6PmKQUHleO8b9hbBa%2BRg1ELuHoXJW5vm3%2FTRl71ZZhF0mYOWlm5%2Bewg%2FZGskNvHmIcwxkDo%2FaahFZz3pr71fZ7L0ypPc6ue34OCeO57tYwY%2FEMbZ5hXtGLObA4b0%2BNwdd0y41%2BJI7nbXCiHglg1c9Px1%2FBWE257dGi5jire3bCmWGTJ4EqgzcOVAiCwUy%2F6zpyt80N08xlZtAkXVm39QQjlK5VYKaHrOE6Xv3BTqk2tyw%2FaON7RucSdFCYw0R8l4K3D7hiJs73QBF5UtB0JTz3SqMpeHcizaCpCKQBQIYHSVjJNem%2B9UkbflX1mmgGRIikVYPoNnuqMRQi9NShzHuhxm8dykokMFDMzh9Eer03QtvCkZHjj%2BcJOHaKNBErT502GVPmLJYbUNrN%2Big2GXo%2FryPwl5iPDZT52i%2FCZEm92jmTgbG3I%2BiaCwgnfIaMvCWkF8eKKwtBHmsoNXEUjGavibPp8MLGJgtcGOqUBERjgfaF1MRrtKPscsHtNCMHQdvYFTxnoFgFexlKA5Q9RKOPCZpFt4hot1cl0ub42aMPQD0FohHTKZjc4wY8HA%2FM0g4%2B8A5GwdKln8P%2Ft7gx16U9xClzvbCUhBUiSpc9opxhoiM9EzjeEJCZg%2B4MJ0Saje%2FY70iQN8RFeslKLzFOKZ9tNKui46Np0wnW0D0D2x%2BE8D9kniYz%2BzNFTOqaQVK%2F7qd7Z&X-Amz-Signature=a72a3e44af5fa2be9918cf57a728a63e1a17c3ae4397ef11130c5f79484d8fc3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UGGXH2KH%2F20261027%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261027T111348Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECMaCXVzLXdlc3QtMiJHMEUCIBW%2FAwce5t%2BMIpj2KBrKGPZINY9dS5PelF33SdktuZiFAiEA4YyU%2FkN98SmFQkBzp%2FD8Kjk6%2B5FILyu%2FepuODX%2B807YqiAQI7P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJceRBudTbnvbaGV2SrcA4jyP7Ab5LYTlus%2FVaOznsvvXGWmV%2FaPHEG4ZDQN%2BRPAr7Jegi6G3AWYsYXIxka1l7FX7oi8lGUTVRR%2ByAkFBK6U6lHDCxP5dL46pN%2BhWGnpxhCgZjXga2eHIjRhVOn0WmIUp%2Fi1Ke2TLgmfui3QAlmzOrYhMybVd6PmKQUHleO8b9hbBa%2BRg1ELuHoXJW5vm3%2FTRl71ZZhF0mYOWlm5%2Bewg%2FZGskNvHmIcwxkDo%2FaahFZz3pr71fZ7L0ypPc6ue34OCeO57tYwY%2FEMbZ5hXtGLObA4b0%2BNwdd0y41%2BJI7nbXCiHglg1c9Px1%2FBWE257dGi5jire3bCmWGTJ4EqgzcOVAiCwUy%2F6zpyt80N08xlZtAkXVm39QQjlK5VYKaHrOE6Xv3BTqk2tyw%2FaON7RucSdFCYw0R8l4K3D7hiJs73QBF5UtB0JTz3SqMpeHcizaCpCKQBQIYHSVjJNem%2B9UkbflX1mmgGRIikVYPoNnuqMRQi9NShzHuhxm8dykokMFDMzh9Eer03QtvCkZHjj%2BcJOHaKNBErT502GVPmLJYbUNrN%2Big2GXo%2FryPwl5iPDZT52i%2FCZEm92jmTgbG3I%2BiaCwgnfIaMvCWkF8eKKwtBHmsoNXEUjGavibPp8MLGJgtcGOqUBERjgfaF1MRrtKPscsHtNCMHQdvYFTxnoFgFexlKA5Q9RKOPCZpFt4hot1cl0ub42aMPQD0FohHTKZjc4wY8HA%2FM0g4%2B8A5GwdKln8P%2Ft7gx16U9xClzvbCUhBUiSpc9opxhoiM9EzjeEJCZg%2B4MJ0Saje%2FY70iQN8RFeslKLzFOKZ9tNKui46Np0wnW0D0D2x%2BE8D9kniYz%2BzNFTOqaQVK%2F7qd7Z&X-Amz-Signature=b236530b5751ff5fa14e5650e34fae0a1423b45709dd496c75aec1f4f12bdf27&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
