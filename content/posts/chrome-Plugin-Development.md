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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UCZHU4GP%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T163324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYxae2bI9RscMQFXXNVF6zrc7rtX8ac0C5%2FsUsgiu16AIgeW8IhhFcmVDOnX8PD0p7d8Pxdt9dyeMFuZtLg6npKlUq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDEVZcAeQCiiy%2F1r%2FcSrcA%2B%2FO22NDo2jHFQYV0tqiZrwwkuwzYKfKl9y45Hydq8g8cc2nLW0mUPZKtjO1LUwzdEj1L07iWC7tE7yUvmcJ1MMg6%2FU8X4f0HOsmp7as3J2eB%2BsRRvayfzUGXZb0Jpttp2QLyCj8cnFjfPKoJYbUYNBVkmk8%2BZ%2FjNdZgSHgwxAP3VxtwgiwqYpiOZFyiW8X1RZDyTmvoH1ER0n%2F6b6Pg317HfU9l8ip5vDgxoOXKCTDRnr6SKpE3gqXXlM274RIig5e4MUedoH2XVIN7YuW3dk%2FLAd8pS8KYBluuGRavVF3rcuYO4oKBkR9ciykNUGrU%2FQdIiQgkyTMzygucls%2BwDb1TZvT6UOU5%2BDnaS8k9D7B9EX%2Bu2VL%2FpNZttlyvQf8kvEJAlDua9lKKotk1TJj3F2%2FU9kVPmiNYyBNsEiKT8XjJEs1%2FnW1YGybc1shanwc%2FIdPXREo%2FFkAmKggEPUIwYdGxwG%2Bb7HLqsW%2BRxriGyAIqDmn207KfedUkHk6%2Fg%2Bq%2FEU2yKDZ2xXJgaJfuKxtYuQo%2ByuQsEBB3TEIA90q86V5ptEBSxK513MIUJcR2VZwb%2BzCzBqlO0QJ3fPyDTxtzPr62PagbCk%2F0MWYF8MvVWOPHo3CRZI3kkU5LE%2BrUMOC1qdYGOqUBDAjlosGWFyrNtKpjQiA5KjRSFP8nG5f1ajn43Q%2Bbe3CDZ3kFsWNyPOKXeGimmPKy24Xr3eLPplF1CF3D%2FrK6Ex7qaZr9jSo2Q7eQvuoM2Dvw4lpzz%2BlwnQAuo3w9TKj2GuHX5t1BmlV4MBo1XeY6qESAJuRupt5kMUQLTcFBlHVQ6Xj33IcpjtgPNqg6QMWOepBXGRrnbm8%2F5hXX9%2F6Gc52VwS0P&X-Amz-Signature=c2ab8768a6f7fb52b6cbf1acf6eecc9efc8d260a9d4f8d229c4625d6bcf37374&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UCZHU4GP%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T163324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYxae2bI9RscMQFXXNVF6zrc7rtX8ac0C5%2FsUsgiu16AIgeW8IhhFcmVDOnX8PD0p7d8Pxdt9dyeMFuZtLg6npKlUq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDEVZcAeQCiiy%2F1r%2FcSrcA%2B%2FO22NDo2jHFQYV0tqiZrwwkuwzYKfKl9y45Hydq8g8cc2nLW0mUPZKtjO1LUwzdEj1L07iWC7tE7yUvmcJ1MMg6%2FU8X4f0HOsmp7as3J2eB%2BsRRvayfzUGXZb0Jpttp2QLyCj8cnFjfPKoJYbUYNBVkmk8%2BZ%2FjNdZgSHgwxAP3VxtwgiwqYpiOZFyiW8X1RZDyTmvoH1ER0n%2F6b6Pg317HfU9l8ip5vDgxoOXKCTDRnr6SKpE3gqXXlM274RIig5e4MUedoH2XVIN7YuW3dk%2FLAd8pS8KYBluuGRavVF3rcuYO4oKBkR9ciykNUGrU%2FQdIiQgkyTMzygucls%2BwDb1TZvT6UOU5%2BDnaS8k9D7B9EX%2Bu2VL%2FpNZttlyvQf8kvEJAlDua9lKKotk1TJj3F2%2FU9kVPmiNYyBNsEiKT8XjJEs1%2FnW1YGybc1shanwc%2FIdPXREo%2FFkAmKggEPUIwYdGxwG%2Bb7HLqsW%2BRxriGyAIqDmn207KfedUkHk6%2Fg%2Bq%2FEU2yKDZ2xXJgaJfuKxtYuQo%2ByuQsEBB3TEIA90q86V5ptEBSxK513MIUJcR2VZwb%2BzCzBqlO0QJ3fPyDTxtzPr62PagbCk%2F0MWYF8MvVWOPHo3CRZI3kkU5LE%2BrUMOC1qdYGOqUBDAjlosGWFyrNtKpjQiA5KjRSFP8nG5f1ajn43Q%2Bbe3CDZ3kFsWNyPOKXeGimmPKy24Xr3eLPplF1CF3D%2FrK6Ex7qaZr9jSo2Q7eQvuoM2Dvw4lpzz%2BlwnQAuo3w9TKj2GuHX5t1BmlV4MBo1XeY6qESAJuRupt5kMUQLTcFBlHVQ6Xj33IcpjtgPNqg6QMWOepBXGRrnbm8%2F5hXX9%2F6Gc52VwS0P&X-Amz-Signature=0a496810a1fe2084b4960f5918e6d718bdd693f96b4605d95b6e2e576877e0e4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UCZHU4GP%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T163324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYxae2bI9RscMQFXXNVF6zrc7rtX8ac0C5%2FsUsgiu16AIgeW8IhhFcmVDOnX8PD0p7d8Pxdt9dyeMFuZtLg6npKlUq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDEVZcAeQCiiy%2F1r%2FcSrcA%2B%2FO22NDo2jHFQYV0tqiZrwwkuwzYKfKl9y45Hydq8g8cc2nLW0mUPZKtjO1LUwzdEj1L07iWC7tE7yUvmcJ1MMg6%2FU8X4f0HOsmp7as3J2eB%2BsRRvayfzUGXZb0Jpttp2QLyCj8cnFjfPKoJYbUYNBVkmk8%2BZ%2FjNdZgSHgwxAP3VxtwgiwqYpiOZFyiW8X1RZDyTmvoH1ER0n%2F6b6Pg317HfU9l8ip5vDgxoOXKCTDRnr6SKpE3gqXXlM274RIig5e4MUedoH2XVIN7YuW3dk%2FLAd8pS8KYBluuGRavVF3rcuYO4oKBkR9ciykNUGrU%2FQdIiQgkyTMzygucls%2BwDb1TZvT6UOU5%2BDnaS8k9D7B9EX%2Bu2VL%2FpNZttlyvQf8kvEJAlDua9lKKotk1TJj3F2%2FU9kVPmiNYyBNsEiKT8XjJEs1%2FnW1YGybc1shanwc%2FIdPXREo%2FFkAmKggEPUIwYdGxwG%2Bb7HLqsW%2BRxriGyAIqDmn207KfedUkHk6%2Fg%2Bq%2FEU2yKDZ2xXJgaJfuKxtYuQo%2ByuQsEBB3TEIA90q86V5ptEBSxK513MIUJcR2VZwb%2BzCzBqlO0QJ3fPyDTxtzPr62PagbCk%2F0MWYF8MvVWOPHo3CRZI3kkU5LE%2BrUMOC1qdYGOqUBDAjlosGWFyrNtKpjQiA5KjRSFP8nG5f1ajn43Q%2Bbe3CDZ3kFsWNyPOKXeGimmPKy24Xr3eLPplF1CF3D%2FrK6Ex7qaZr9jSo2Q7eQvuoM2Dvw4lpzz%2BlwnQAuo3w9TKj2GuHX5t1BmlV4MBo1XeY6qESAJuRupt5kMUQLTcFBlHVQ6Xj33IcpjtgPNqg6QMWOepBXGRrnbm8%2F5hXX9%2F6Gc52VwS0P&X-Amz-Signature=7dc677ec2e17d00caeb1e73645acd5aeaf2d56a9a4dc8cc045c68bf48311a0cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UCZHU4GP%2F20261010%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261010T163324Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCYxae2bI9RscMQFXXNVF6zrc7rtX8ac0C5%2FsUsgiu16AIgeW8IhhFcmVDOnX8PD0p7d8Pxdt9dyeMFuZtLg6npKlUq%2FwMIWRAAGgw2Mzc0MjMxODM4MDUiDEVZcAeQCiiy%2F1r%2FcSrcA%2B%2FO22NDo2jHFQYV0tqiZrwwkuwzYKfKl9y45Hydq8g8cc2nLW0mUPZKtjO1LUwzdEj1L07iWC7tE7yUvmcJ1MMg6%2FU8X4f0HOsmp7as3J2eB%2BsRRvayfzUGXZb0Jpttp2QLyCj8cnFjfPKoJYbUYNBVkmk8%2BZ%2FjNdZgSHgwxAP3VxtwgiwqYpiOZFyiW8X1RZDyTmvoH1ER0n%2F6b6Pg317HfU9l8ip5vDgxoOXKCTDRnr6SKpE3gqXXlM274RIig5e4MUedoH2XVIN7YuW3dk%2FLAd8pS8KYBluuGRavVF3rcuYO4oKBkR9ciykNUGrU%2FQdIiQgkyTMzygucls%2BwDb1TZvT6UOU5%2BDnaS8k9D7B9EX%2Bu2VL%2FpNZttlyvQf8kvEJAlDua9lKKotk1TJj3F2%2FU9kVPmiNYyBNsEiKT8XjJEs1%2FnW1YGybc1shanwc%2FIdPXREo%2FFkAmKggEPUIwYdGxwG%2Bb7HLqsW%2BRxriGyAIqDmn207KfedUkHk6%2Fg%2Bq%2FEU2yKDZ2xXJgaJfuKxtYuQo%2ByuQsEBB3TEIA90q86V5ptEBSxK513MIUJcR2VZwb%2BzCzBqlO0QJ3fPyDTxtzPr62PagbCk%2F0MWYF8MvVWOPHo3CRZI3kkU5LE%2BrUMOC1qdYGOqUBDAjlosGWFyrNtKpjQiA5KjRSFP8nG5f1ajn43Q%2Bbe3CDZ3kFsWNyPOKXeGimmPKy24Xr3eLPplF1CF3D%2FrK6Ex7qaZr9jSo2Q7eQvuoM2Dvw4lpzz%2BlwnQAuo3w9TKj2GuHX5t1BmlV4MBo1XeY6qESAJuRupt5kMUQLTcFBlHVQ6Xj33IcpjtgPNqg6QMWOepBXGRrnbm8%2F5hXX9%2F6Gc52VwS0P&X-Amz-Signature=f7da2a11cff96506f38a8d3cc6680d27a9da09c34c7745aa60135c87b4664d53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
