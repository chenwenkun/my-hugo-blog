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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SFKAUWLV%2F20261107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261107T211232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJHMEUCIQDEIV62PRlmekDaUhhx24LUP8T8n9r3ZvYWmzXVaWWwhAIgY83oHamAKTaBoW58J00GE859FKfKYUf0asZpVnwzcwYqiAQI%2Ff%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCLgGMMVMikPumvcfyrcA%2BguZ7QQ6f%2F0fhuMdBve5m6SkLplWjtvKnuXM0ycGMgRYNRhF3VIo4X1KNlZb7CY1KeMEkRhnz0Ist97I0yCMVQYFaZjpN7fRW1hj4DW5%2BjFrD6qT4dJEkCPHExoYIbcN27nixTmgLXssVkSrM%2FAhvf4vklYjW6WQHic6yRIBcMTbiECOxXd8mMc%2B%2Boc%2BIwZsr6xTm42grUcn7qGyAVdmBElCeFEV%2F2cwOA3OB9hZvP%2BdExvG%2BjQqtXtNbTw%2FBzROwLB%2FyeQ8trHVIfkNM2bSaAQjTyeNG25uxDyh%2FLDZEvTZ3u1m9RsdvF9y3TrOPKp856oGxNrPMVqdbtO72sQa876eFVWj7nbANhsGYQrCNhuZaPWAAndclRHnz1km0gBtsGLOW%2FetvZrkXoaIp%2Fq0H%2BGDIY%2B4uj%2BppGp7Qmkigqil%2F9sK0R%2FdKrzhfAWNlhRrWPXAiWxDzOBGnmZzrm5Yjux%2FZns6y00E5N42yfZWFLKlIMkEF2564%2FZLXRtFJqAeuASxyCjqf12zAw5LZf9qOxhIgkgXgpw58t89YxwS8L6wxYzdhJQISZD0iUl62jvGCf%2Bj%2Bd27q57%2FzPcE6S3lOEebb8bVDYm%2FCftbRiOkTXuufDp5joZx1FSth2pMO%2F8vdcGOqUB5lImWXnqO4m9hlxFWRiLuzSQYqtBKIVgEGrWWuz%2FZhN5raLht89r8cVsmiO%2BnYNOLK2SI1gCF6jyqEa1XqulyTwKjZy%2BB6FKmtbDyjfAcF%2B9V2pn1HR5zjRQR71n0XKfub4mOgDBNxkuyEQNDjzyzpIXoTDqJQg3%2BS7afP%2BfpwwBNwgl4zofxIt0r71TZbSI8KOGw%2BALmutWUYvgwjfNAOJkx4yE&X-Amz-Signature=4cd32a1a4132d5b5b78a967b34bd7522bb943b751fc63019959ddf16415f215a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SFKAUWLV%2F20261107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261107T211232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJHMEUCIQDEIV62PRlmekDaUhhx24LUP8T8n9r3ZvYWmzXVaWWwhAIgY83oHamAKTaBoW58J00GE859FKfKYUf0asZpVnwzcwYqiAQI%2Ff%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCLgGMMVMikPumvcfyrcA%2BguZ7QQ6f%2F0fhuMdBve5m6SkLplWjtvKnuXM0ycGMgRYNRhF3VIo4X1KNlZb7CY1KeMEkRhnz0Ist97I0yCMVQYFaZjpN7fRW1hj4DW5%2BjFrD6qT4dJEkCPHExoYIbcN27nixTmgLXssVkSrM%2FAhvf4vklYjW6WQHic6yRIBcMTbiECOxXd8mMc%2B%2Boc%2BIwZsr6xTm42grUcn7qGyAVdmBElCeFEV%2F2cwOA3OB9hZvP%2BdExvG%2BjQqtXtNbTw%2FBzROwLB%2FyeQ8trHVIfkNM2bSaAQjTyeNG25uxDyh%2FLDZEvTZ3u1m9RsdvF9y3TrOPKp856oGxNrPMVqdbtO72sQa876eFVWj7nbANhsGYQrCNhuZaPWAAndclRHnz1km0gBtsGLOW%2FetvZrkXoaIp%2Fq0H%2BGDIY%2B4uj%2BppGp7Qmkigqil%2F9sK0R%2FdKrzhfAWNlhRrWPXAiWxDzOBGnmZzrm5Yjux%2FZns6y00E5N42yfZWFLKlIMkEF2564%2FZLXRtFJqAeuASxyCjqf12zAw5LZf9qOxhIgkgXgpw58t89YxwS8L6wxYzdhJQISZD0iUl62jvGCf%2Bj%2Bd27q57%2FzPcE6S3lOEebb8bVDYm%2FCftbRiOkTXuufDp5joZx1FSth2pMO%2F8vdcGOqUB5lImWXnqO4m9hlxFWRiLuzSQYqtBKIVgEGrWWuz%2FZhN5raLht89r8cVsmiO%2BnYNOLK2SI1gCF6jyqEa1XqulyTwKjZy%2BB6FKmtbDyjfAcF%2B9V2pn1HR5zjRQR71n0XKfub4mOgDBNxkuyEQNDjzyzpIXoTDqJQg3%2BS7afP%2BfpwwBNwgl4zofxIt0r71TZbSI8KOGw%2BALmutWUYvgwjfNAOJkx4yE&X-Amz-Signature=cc3146b103c82a991c6ffc8213dde4da7a137e4a7e5e37a3fce23207ed4b1324&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SFKAUWLV%2F20261107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261107T211232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJHMEUCIQDEIV62PRlmekDaUhhx24LUP8T8n9r3ZvYWmzXVaWWwhAIgY83oHamAKTaBoW58J00GE859FKfKYUf0asZpVnwzcwYqiAQI%2Ff%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCLgGMMVMikPumvcfyrcA%2BguZ7QQ6f%2F0fhuMdBve5m6SkLplWjtvKnuXM0ycGMgRYNRhF3VIo4X1KNlZb7CY1KeMEkRhnz0Ist97I0yCMVQYFaZjpN7fRW1hj4DW5%2BjFrD6qT4dJEkCPHExoYIbcN27nixTmgLXssVkSrM%2FAhvf4vklYjW6WQHic6yRIBcMTbiECOxXd8mMc%2B%2Boc%2BIwZsr6xTm42grUcn7qGyAVdmBElCeFEV%2F2cwOA3OB9hZvP%2BdExvG%2BjQqtXtNbTw%2FBzROwLB%2FyeQ8trHVIfkNM2bSaAQjTyeNG25uxDyh%2FLDZEvTZ3u1m9RsdvF9y3TrOPKp856oGxNrPMVqdbtO72sQa876eFVWj7nbANhsGYQrCNhuZaPWAAndclRHnz1km0gBtsGLOW%2FetvZrkXoaIp%2Fq0H%2BGDIY%2B4uj%2BppGp7Qmkigqil%2F9sK0R%2FdKrzhfAWNlhRrWPXAiWxDzOBGnmZzrm5Yjux%2FZns6y00E5N42yfZWFLKlIMkEF2564%2FZLXRtFJqAeuASxyCjqf12zAw5LZf9qOxhIgkgXgpw58t89YxwS8L6wxYzdhJQISZD0iUl62jvGCf%2Bj%2Bd27q57%2FzPcE6S3lOEebb8bVDYm%2FCftbRiOkTXuufDp5joZx1FSth2pMO%2F8vdcGOqUB5lImWXnqO4m9hlxFWRiLuzSQYqtBKIVgEGrWWuz%2FZhN5raLht89r8cVsmiO%2BnYNOLK2SI1gCF6jyqEa1XqulyTwKjZy%2BB6FKmtbDyjfAcF%2B9V2pn1HR5zjRQR71n0XKfub4mOgDBNxkuyEQNDjzyzpIXoTDqJQg3%2BS7afP%2BfpwwBNwgl4zofxIt0r71TZbSI8KOGw%2BALmutWUYvgwjfNAOJkx4yE&X-Amz-Signature=3c8feee382f9eb95fdf4169f0308233ec05130f3f3caac470f29572f83dbd2af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SFKAUWLV%2F20261107%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261107T211232Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJHMEUCIQDEIV62PRlmekDaUhhx24LUP8T8n9r3ZvYWmzXVaWWwhAIgY83oHamAKTaBoW58J00GE859FKfKYUf0asZpVnwzcwYqiAQI%2Ff%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCLgGMMVMikPumvcfyrcA%2BguZ7QQ6f%2F0fhuMdBve5m6SkLplWjtvKnuXM0ycGMgRYNRhF3VIo4X1KNlZb7CY1KeMEkRhnz0Ist97I0yCMVQYFaZjpN7fRW1hj4DW5%2BjFrD6qT4dJEkCPHExoYIbcN27nixTmgLXssVkSrM%2FAhvf4vklYjW6WQHic6yRIBcMTbiECOxXd8mMc%2B%2Boc%2BIwZsr6xTm42grUcn7qGyAVdmBElCeFEV%2F2cwOA3OB9hZvP%2BdExvG%2BjQqtXtNbTw%2FBzROwLB%2FyeQ8trHVIfkNM2bSaAQjTyeNG25uxDyh%2FLDZEvTZ3u1m9RsdvF9y3TrOPKp856oGxNrPMVqdbtO72sQa876eFVWj7nbANhsGYQrCNhuZaPWAAndclRHnz1km0gBtsGLOW%2FetvZrkXoaIp%2Fq0H%2BGDIY%2B4uj%2BppGp7Qmkigqil%2F9sK0R%2FdKrzhfAWNlhRrWPXAiWxDzOBGnmZzrm5Yjux%2FZns6y00E5N42yfZWFLKlIMkEF2564%2FZLXRtFJqAeuASxyCjqf12zAw5LZf9qOxhIgkgXgpw58t89YxwS8L6wxYzdhJQISZD0iUl62jvGCf%2Bj%2Bd27q57%2FzPcE6S3lOEebb8bVDYm%2FCftbRiOkTXuufDp5joZx1FSth2pMO%2F8vdcGOqUB5lImWXnqO4m9hlxFWRiLuzSQYqtBKIVgEGrWWuz%2FZhN5raLht89r8cVsmiO%2BnYNOLK2SI1gCF6jyqEa1XqulyTwKjZy%2BB6FKmtbDyjfAcF%2B9V2pn1HR5zjRQR71n0XKfub4mOgDBNxkuyEQNDjzyzpIXoTDqJQg3%2BS7afP%2BfpwwBNwgl4zofxIt0r71TZbSI8KOGw%2BALmutWUYvgwjfNAOJkx4yE&X-Amz-Signature=25b017f18bc326814265f04fe3622aadef9d73440f8a3cd63eb49be3718e169f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
