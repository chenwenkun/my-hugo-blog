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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZL6ACSRD%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T182315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJHMEUCIQDevdxgi0o7Zdtkq3Yga4bp16k%2FTjy0Am4Ug%2BRdfymf8AIgCyBKnIsHyEw2BkNgo5n9Ht88OAlbSaiFROqs4UwnruAqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA1slxzWT0BkXnxgZSrcAwEbTmzUjWWcyVhx0DNnxsZhAzGENKJzLrLvhDjTm4QESqDF1yafkV6JXP8uamixC05baw7wKFXD5bZrXC3wvljsb%2B1OgY6pXldSZdPhMa0hNFBEZCGyndPD0VpDZaacomxv4Vao3YsRuoNW8DbBpca1V%2FKWUau6HS%2F8TiGi514lzxe8bPiBujlEhwHbpHbIuwwU9ujMH8%2Br4MlBfcuVocLQEW%2Foog54GtV2Y2zK9xrRZ81gTwED27jj3wAk%2FnXBUNiCnOEWF66XuXvxOEt9oGDz%2BusR6yyhUgteIbQ9%2FHo1UVKFE0CGV%2B7uje57bwNry5dvQw%2FNsEOdqHc7Jp%2FzX%2Bp4%2B4BrI98HbHaicya5if%2BYSuY8lunpvGK9pXB4CeNcLLCK1ieTBY%2FNmcPACDsMNpHcQX7fnvVb8lxb3A7GLnsnGil9IbA5%2BWdL7o0CMrhycyw5jm6%2BaOs6YM5mkvXoi4DgO0jJ%2BixEh5PlutuBuiO%2FQB9BiNJVmEMDcJdj%2BG0PJ%2Bu%2Ff0AA%2B4ljPQDWQoLNTTBTH3uBW0Vr%2FqI2XxdqliFM%2Fzk8HrLFiYVzQuFJt4H6v0WNV7viae%2BseezwkYj%2BJcRU70gk19eji3PowqRWbwEdOSsfhS%2BoeAFa7Q8hMNf9sdQGOqUBLyQU1zLANbnFb6%2B0QwzWJi%2BzcbE2QNb%2B6MNQsxOk8hH%2BpzobKlR%2FV98hyOHqq0v%2Bbg0To%2F%2BbI%2F9TNrD9a7jsZnJgfimFjjihytZcopzF1Ouoq7ab5udqRZWwzrNPw0J65a72XrFrUCLK%2BpL1kOHS7t%2BP%2BhtLHJwmegIEVRbmj8svl1Tjv7f1TZ7cflxH6lIIqZOAsy1qYrYWyEsopnGaIqWzdtcF&X-Amz-Signature=277b93188ef76d24c62fb2185cefae8858e735ccf4918a1b2b7bebdc1a6de41f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZL6ACSRD%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T182315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJHMEUCIQDevdxgi0o7Zdtkq3Yga4bp16k%2FTjy0Am4Ug%2BRdfymf8AIgCyBKnIsHyEw2BkNgo5n9Ht88OAlbSaiFROqs4UwnruAqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA1slxzWT0BkXnxgZSrcAwEbTmzUjWWcyVhx0DNnxsZhAzGENKJzLrLvhDjTm4QESqDF1yafkV6JXP8uamixC05baw7wKFXD5bZrXC3wvljsb%2B1OgY6pXldSZdPhMa0hNFBEZCGyndPD0VpDZaacomxv4Vao3YsRuoNW8DbBpca1V%2FKWUau6HS%2F8TiGi514lzxe8bPiBujlEhwHbpHbIuwwU9ujMH8%2Br4MlBfcuVocLQEW%2Foog54GtV2Y2zK9xrRZ81gTwED27jj3wAk%2FnXBUNiCnOEWF66XuXvxOEt9oGDz%2BusR6yyhUgteIbQ9%2FHo1UVKFE0CGV%2B7uje57bwNry5dvQw%2FNsEOdqHc7Jp%2FzX%2Bp4%2B4BrI98HbHaicya5if%2BYSuY8lunpvGK9pXB4CeNcLLCK1ieTBY%2FNmcPACDsMNpHcQX7fnvVb8lxb3A7GLnsnGil9IbA5%2BWdL7o0CMrhycyw5jm6%2BaOs6YM5mkvXoi4DgO0jJ%2BixEh5PlutuBuiO%2FQB9BiNJVmEMDcJdj%2BG0PJ%2Bu%2Ff0AA%2B4ljPQDWQoLNTTBTH3uBW0Vr%2FqI2XxdqliFM%2Fzk8HrLFiYVzQuFJt4H6v0WNV7viae%2BseezwkYj%2BJcRU70gk19eji3PowqRWbwEdOSsfhS%2BoeAFa7Q8hMNf9sdQGOqUBLyQU1zLANbnFb6%2B0QwzWJi%2BzcbE2QNb%2B6MNQsxOk8hH%2BpzobKlR%2FV98hyOHqq0v%2Bbg0To%2F%2BbI%2F9TNrD9a7jsZnJgfimFjjihytZcopzF1Ouoq7ab5udqRZWwzrNPw0J65a72XrFrUCLK%2BpL1kOHS7t%2BP%2BhtLHJwmegIEVRbmj8svl1Tjv7f1TZ7cflxH6lIIqZOAsy1qYrYWyEsopnGaIqWzdtcF&X-Amz-Signature=db466236d78ac02971e11a08613b68e02e8627043783da6cd4e668eb5e054ad7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZL6ACSRD%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T182315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJHMEUCIQDevdxgi0o7Zdtkq3Yga4bp16k%2FTjy0Am4Ug%2BRdfymf8AIgCyBKnIsHyEw2BkNgo5n9Ht88OAlbSaiFROqs4UwnruAqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA1slxzWT0BkXnxgZSrcAwEbTmzUjWWcyVhx0DNnxsZhAzGENKJzLrLvhDjTm4QESqDF1yafkV6JXP8uamixC05baw7wKFXD5bZrXC3wvljsb%2B1OgY6pXldSZdPhMa0hNFBEZCGyndPD0VpDZaacomxv4Vao3YsRuoNW8DbBpca1V%2FKWUau6HS%2F8TiGi514lzxe8bPiBujlEhwHbpHbIuwwU9ujMH8%2Br4MlBfcuVocLQEW%2Foog54GtV2Y2zK9xrRZ81gTwED27jj3wAk%2FnXBUNiCnOEWF66XuXvxOEt9oGDz%2BusR6yyhUgteIbQ9%2FHo1UVKFE0CGV%2B7uje57bwNry5dvQw%2FNsEOdqHc7Jp%2FzX%2Bp4%2B4BrI98HbHaicya5if%2BYSuY8lunpvGK9pXB4CeNcLLCK1ieTBY%2FNmcPACDsMNpHcQX7fnvVb8lxb3A7GLnsnGil9IbA5%2BWdL7o0CMrhycyw5jm6%2BaOs6YM5mkvXoi4DgO0jJ%2BixEh5PlutuBuiO%2FQB9BiNJVmEMDcJdj%2BG0PJ%2Bu%2Ff0AA%2B4ljPQDWQoLNTTBTH3uBW0Vr%2FqI2XxdqliFM%2Fzk8HrLFiYVzQuFJt4H6v0WNV7viae%2BseezwkYj%2BJcRU70gk19eji3PowqRWbwEdOSsfhS%2BoeAFa7Q8hMNf9sdQGOqUBLyQU1zLANbnFb6%2B0QwzWJi%2BzcbE2QNb%2B6MNQsxOk8hH%2BpzobKlR%2FV98hyOHqq0v%2Bbg0To%2F%2BbI%2F9TNrD9a7jsZnJgfimFjjihytZcopzF1Ouoq7ab5udqRZWwzrNPw0J65a72XrFrUCLK%2BpL1kOHS7t%2BP%2BhtLHJwmegIEVRbmj8svl1Tjv7f1TZ7cflxH6lIIqZOAsy1qYrYWyEsopnGaIqWzdtcF&X-Amz-Signature=8480d779253ff825f402c9607d8279cdc5b52f5572511c3021cf7dfd7f242425&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZL6ACSRD%2F20260824%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260824T182315Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECoaCXVzLXdlc3QtMiJHMEUCIQDevdxgi0o7Zdtkq3Yga4bp16k%2FTjy0Am4Ug%2BRdfymf8AIgCyBKnIsHyEw2BkNgo5n9Ht88OAlbSaiFROqs4UwnruAqiAQI8v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDA1slxzWT0BkXnxgZSrcAwEbTmzUjWWcyVhx0DNnxsZhAzGENKJzLrLvhDjTm4QESqDF1yafkV6JXP8uamixC05baw7wKFXD5bZrXC3wvljsb%2B1OgY6pXldSZdPhMa0hNFBEZCGyndPD0VpDZaacomxv4Vao3YsRuoNW8DbBpca1V%2FKWUau6HS%2F8TiGi514lzxe8bPiBujlEhwHbpHbIuwwU9ujMH8%2Br4MlBfcuVocLQEW%2Foog54GtV2Y2zK9xrRZ81gTwED27jj3wAk%2FnXBUNiCnOEWF66XuXvxOEt9oGDz%2BusR6yyhUgteIbQ9%2FHo1UVKFE0CGV%2B7uje57bwNry5dvQw%2FNsEOdqHc7Jp%2FzX%2Bp4%2B4BrI98HbHaicya5if%2BYSuY8lunpvGK9pXB4CeNcLLCK1ieTBY%2FNmcPACDsMNpHcQX7fnvVb8lxb3A7GLnsnGil9IbA5%2BWdL7o0CMrhycyw5jm6%2BaOs6YM5mkvXoi4DgO0jJ%2BixEh5PlutuBuiO%2FQB9BiNJVmEMDcJdj%2BG0PJ%2Bu%2Ff0AA%2B4ljPQDWQoLNTTBTH3uBW0Vr%2FqI2XxdqliFM%2Fzk8HrLFiYVzQuFJt4H6v0WNV7viae%2BseezwkYj%2BJcRU70gk19eji3PowqRWbwEdOSsfhS%2BoeAFa7Q8hMNf9sdQGOqUBLyQU1zLANbnFb6%2B0QwzWJi%2BzcbE2QNb%2B6MNQsxOk8hH%2BpzobKlR%2FV98hyOHqq0v%2Bbg0To%2F%2BbI%2F9TNrD9a7jsZnJgfimFjjihytZcopzF1Ouoq7ab5udqRZWwzrNPw0J65a72XrFrUCLK%2BpL1kOHS7t%2BP%2BhtLHJwmegIEVRbmj8svl1Tjv7f1TZ7cflxH6lIIqZOAsy1qYrYWyEsopnGaIqWzdtcF&X-Amz-Signature=cc95ef4fed83d1778c54f5e0b2560ed1e5355b42fa7402f7f9e3100b33ab0db2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
