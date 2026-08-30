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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VESQRAE%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T154059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDVyw9ldh20w8ZZNWcVSYHMzyghbRt5CZ2tCA%2F27xJ1XwIgBWAUZex068umzmBxNFAIzA%2BCSfuYzmJrp1s7Ns68DQ4q%2FwMIfhAAGgw2Mzc0MjMxODM4MDUiDCIS9faHlwtVOujarircA8KihdGWDkgolODJPhfvTuWNmv4WPWN8J%2B77rxo8xpsfCqV9%2BQruLxiOOIYNi6TRi%2FQgKylhVorUzKv99OftO00ghzc61sSM4ZRbSSYYnDl1LCraeESAQH59gkR2CaZ3u1YHJoNonWvF3Cd8qa7MTCyK3VIpoC%2F1z0fXE%2FaGhEM2F3lMXuULoGpQHC82NZfQBAzRuWGM4dzPfy8Rh8Xyv36p93GjeLZuSYR42CQjWl8xnjf3f1hKu%2FzG%2B3b2go9MWVKqjecjfdsr%2FoyAW98m4YA5bTtgGrA3ympa0ZqLS3%2FSpj8XKi23Gup40Bo%2FUckXsn36te4UqNj7QGjDym1edDMPeMluI4kiLXovvBCWe7HfpLMrKZKpMxudT32U602X%2BVNrCVYDRehlySzBRHzOrqqg7qXCoa36PvVdUmLTPZrIb%2F0EqSOSQ%2Fo%2FClXjmtlILGBv5wpj8Rtvt9V3o3%2FJsKUMy8Wp5sJHHS%2FjmmWremZmHs4FMUYegkNaA5NH5N1UMbrvvh7AF%2F63zHOvOUvWuIx7W2VOHVD0GNlsBlC8dP7ETx5Dn0kIhN2w12LbvvItSOclxV1VfdThx2%2BIBpLEHNSpuBU%2Fs%2BNHHPBM2LMcpOyGYYQqWdt7tIcPYD4GML%2FN0NQGOqUBq8Mc0yIntY3RZ31ItF1ItrtUDk57dW%2FnzA5vEcsacyAdOJ1DYXdbHFV9g%2F9wPVzK5Aoh0uIopMm2d6jNcJ0nppTYcWD6CcuYay1ZBkg%2FnJs4qLOyNizH%2FFTlfHN%2BNKZd0uPPHmfU5fqi%2Byfc6dkVcE9nf7GA4fjX%2BE3C80Oq9O%2B%2BYPQ5SgvoyZ2kmqOvoCBZJPTltLZeiTR8xhfQtYY%2BlTL5FJwr&X-Amz-Signature=3069809ac594a703762458218f2533b133ffe52fb17f3fe6e9d36312f656ee5d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VESQRAE%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T154059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDVyw9ldh20w8ZZNWcVSYHMzyghbRt5CZ2tCA%2F27xJ1XwIgBWAUZex068umzmBxNFAIzA%2BCSfuYzmJrp1s7Ns68DQ4q%2FwMIfhAAGgw2Mzc0MjMxODM4MDUiDCIS9faHlwtVOujarircA8KihdGWDkgolODJPhfvTuWNmv4WPWN8J%2B77rxo8xpsfCqV9%2BQruLxiOOIYNi6TRi%2FQgKylhVorUzKv99OftO00ghzc61sSM4ZRbSSYYnDl1LCraeESAQH59gkR2CaZ3u1YHJoNonWvF3Cd8qa7MTCyK3VIpoC%2F1z0fXE%2FaGhEM2F3lMXuULoGpQHC82NZfQBAzRuWGM4dzPfy8Rh8Xyv36p93GjeLZuSYR42CQjWl8xnjf3f1hKu%2FzG%2B3b2go9MWVKqjecjfdsr%2FoyAW98m4YA5bTtgGrA3ympa0ZqLS3%2FSpj8XKi23Gup40Bo%2FUckXsn36te4UqNj7QGjDym1edDMPeMluI4kiLXovvBCWe7HfpLMrKZKpMxudT32U602X%2BVNrCVYDRehlySzBRHzOrqqg7qXCoa36PvVdUmLTPZrIb%2F0EqSOSQ%2Fo%2FClXjmtlILGBv5wpj8Rtvt9V3o3%2FJsKUMy8Wp5sJHHS%2FjmmWremZmHs4FMUYegkNaA5NH5N1UMbrvvh7AF%2F63zHOvOUvWuIx7W2VOHVD0GNlsBlC8dP7ETx5Dn0kIhN2w12LbvvItSOclxV1VfdThx2%2BIBpLEHNSpuBU%2Fs%2BNHHPBM2LMcpOyGYYQqWdt7tIcPYD4GML%2FN0NQGOqUBq8Mc0yIntY3RZ31ItF1ItrtUDk57dW%2FnzA5vEcsacyAdOJ1DYXdbHFV9g%2F9wPVzK5Aoh0uIopMm2d6jNcJ0nppTYcWD6CcuYay1ZBkg%2FnJs4qLOyNizH%2FFTlfHN%2BNKZd0uPPHmfU5fqi%2Byfc6dkVcE9nf7GA4fjX%2BE3C80Oq9O%2B%2BYPQ5SgvoyZ2kmqOvoCBZJPTltLZeiTR8xhfQtYY%2BlTL5FJwr&X-Amz-Signature=1b5589b0df1d09f3f8e0a166bbb6e1743e7e3ce51c8bb6f8648fd54ccf823e21&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VESQRAE%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T154059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDVyw9ldh20w8ZZNWcVSYHMzyghbRt5CZ2tCA%2F27xJ1XwIgBWAUZex068umzmBxNFAIzA%2BCSfuYzmJrp1s7Ns68DQ4q%2FwMIfhAAGgw2Mzc0MjMxODM4MDUiDCIS9faHlwtVOujarircA8KihdGWDkgolODJPhfvTuWNmv4WPWN8J%2B77rxo8xpsfCqV9%2BQruLxiOOIYNi6TRi%2FQgKylhVorUzKv99OftO00ghzc61sSM4ZRbSSYYnDl1LCraeESAQH59gkR2CaZ3u1YHJoNonWvF3Cd8qa7MTCyK3VIpoC%2F1z0fXE%2FaGhEM2F3lMXuULoGpQHC82NZfQBAzRuWGM4dzPfy8Rh8Xyv36p93GjeLZuSYR42CQjWl8xnjf3f1hKu%2FzG%2B3b2go9MWVKqjecjfdsr%2FoyAW98m4YA5bTtgGrA3ympa0ZqLS3%2FSpj8XKi23Gup40Bo%2FUckXsn36te4UqNj7QGjDym1edDMPeMluI4kiLXovvBCWe7HfpLMrKZKpMxudT32U602X%2BVNrCVYDRehlySzBRHzOrqqg7qXCoa36PvVdUmLTPZrIb%2F0EqSOSQ%2Fo%2FClXjmtlILGBv5wpj8Rtvt9V3o3%2FJsKUMy8Wp5sJHHS%2FjmmWremZmHs4FMUYegkNaA5NH5N1UMbrvvh7AF%2F63zHOvOUvWuIx7W2VOHVD0GNlsBlC8dP7ETx5Dn0kIhN2w12LbvvItSOclxV1VfdThx2%2BIBpLEHNSpuBU%2Fs%2BNHHPBM2LMcpOyGYYQqWdt7tIcPYD4GML%2FN0NQGOqUBq8Mc0yIntY3RZ31ItF1ItrtUDk57dW%2FnzA5vEcsacyAdOJ1DYXdbHFV9g%2F9wPVzK5Aoh0uIopMm2d6jNcJ0nppTYcWD6CcuYay1ZBkg%2FnJs4qLOyNizH%2FFTlfHN%2BNKZd0uPPHmfU5fqi%2Byfc6dkVcE9nf7GA4fjX%2BE3C80Oq9O%2B%2BYPQ5SgvoyZ2kmqOvoCBZJPTltLZeiTR8xhfQtYY%2BlTL5FJwr&X-Amz-Signature=9ed15a2542aff7ef1a066ccd6f6306e38248ab3996fd985336f11d8e53d6c99f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666VESQRAE%2F20260830%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260830T154059Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDVyw9ldh20w8ZZNWcVSYHMzyghbRt5CZ2tCA%2F27xJ1XwIgBWAUZex068umzmBxNFAIzA%2BCSfuYzmJrp1s7Ns68DQ4q%2FwMIfhAAGgw2Mzc0MjMxODM4MDUiDCIS9faHlwtVOujarircA8KihdGWDkgolODJPhfvTuWNmv4WPWN8J%2B77rxo8xpsfCqV9%2BQruLxiOOIYNi6TRi%2FQgKylhVorUzKv99OftO00ghzc61sSM4ZRbSSYYnDl1LCraeESAQH59gkR2CaZ3u1YHJoNonWvF3Cd8qa7MTCyK3VIpoC%2F1z0fXE%2FaGhEM2F3lMXuULoGpQHC82NZfQBAzRuWGM4dzPfy8Rh8Xyv36p93GjeLZuSYR42CQjWl8xnjf3f1hKu%2FzG%2B3b2go9MWVKqjecjfdsr%2FoyAW98m4YA5bTtgGrA3ympa0ZqLS3%2FSpj8XKi23Gup40Bo%2FUckXsn36te4UqNj7QGjDym1edDMPeMluI4kiLXovvBCWe7HfpLMrKZKpMxudT32U602X%2BVNrCVYDRehlySzBRHzOrqqg7qXCoa36PvVdUmLTPZrIb%2F0EqSOSQ%2Fo%2FClXjmtlILGBv5wpj8Rtvt9V3o3%2FJsKUMy8Wp5sJHHS%2FjmmWremZmHs4FMUYegkNaA5NH5N1UMbrvvh7AF%2F63zHOvOUvWuIx7W2VOHVD0GNlsBlC8dP7ETx5Dn0kIhN2w12LbvvItSOclxV1VfdThx2%2BIBpLEHNSpuBU%2Fs%2BNHHPBM2LMcpOyGYYQqWdt7tIcPYD4GML%2FN0NQGOqUBq8Mc0yIntY3RZ31ItF1ItrtUDk57dW%2FnzA5vEcsacyAdOJ1DYXdbHFV9g%2F9wPVzK5Aoh0uIopMm2d6jNcJ0nppTYcWD6CcuYay1ZBkg%2FnJs4qLOyNizH%2FFTlfHN%2BNKZd0uPPHmfU5fqi%2Byfc6dkVcE9nf7GA4fjX%2BE3C80Oq9O%2B%2BYPQ5SgvoyZ2kmqOvoCBZJPTltLZeiTR8xhfQtYY%2BlTL5FJwr&X-Amz-Signature=ad11a4137edee2eb8fc25b4b240aa6d3a49584b907577d2ef35332bdb44c4303&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
