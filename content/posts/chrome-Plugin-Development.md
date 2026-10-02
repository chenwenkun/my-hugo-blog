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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RL4IJJJS%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T170000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEny0ctle%2BFFUNecd3DP8wZPPBkmaKXkIjSV6YB3LpokAiBkGiBxyK8QOcGCj09Tadb2UJnPtpTgGZPm5PvI10NfAiqIBAiZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMcxdU%2BeOZikr6WwqdKtwDT0pvtnZmQs31nuGfs4d5r5OfxjqENaCJ%2BuvJoGWlrQd40FbNX9oKDa8Zz%2BPhmzujdgXC3btAHm%2BvJqliQDKSlrsZqV35Mk%2FTGtX9apFZtDFjfgofgaRhUvU%2FfJ8ga5c0x32zbxBeWOCcJIAG88cul4JmphzDYNFZM39xwI9CBTSz5Xg06Cu%2BwpyWFRmQiPJhapQKrD4ivSk%2Bhobtn%2F4ZdyOqijdUqqs6mWvEuQBDmWqD0GkgKWvPy4YBikr%2F9ZMMVqjJAM3PGkaOCHi7pibnSrc82L%2BhoQCWaO8uMDOYrcq%2BtL1Y6UCD6hUlhBmx2ridmK3X53vE6po0uFEh%2Bj6Kx6ArYq7woPSSSV31CWcIE0WepCb70ajHRtap9usaMBiyo7fNN%2FlUKx9UVLCXqJxOs2omzP7BkTNfXh5aRggM2rfewFLQFh397B6wLonZ8s1RgZd8RR2NUNi0mAIhPTn51dPMtOkiYocSnF3yulytKkkycc4wBTQXyy%2F9a9XcBNONnBY%2BE657r2j5WPDyRgQOJrnDvZqKbmHwoHORV4t0fXSdtjmO%2F8ORU59f1qIjoc6okCVaZKldGX6OB9erObEZnP9kPkjy%2F%2BaBi%2B3hJFrB9sITEySLMV4Iq55MaWUwnbb%2F1QY6pgH%2Bi1gR2B7J%2Btu9XWSL%2Fn0jxcqTYENK9ctjXWD8fSD2yKtMbupqgFUWT0LAO007BoY%2BNk83d%2B5bsEnuVvH0ZNQMy8IFePEBRl8U63Ba7NQVEtXzoEZnkIiK04n3bGAj2SdlZzdnfQznBP3AbM%2BLlrV9V89wpDNNnkIChzNGaCnRwFAdnO%2BTDR4%2F9S7g9KK2SUKjork%2BrD9Tyvh8JMNLMyye45ACtU%2BA&X-Amz-Signature=96f5e6f3b72d4645a213b49db223d4dafdc200b2630fc709991ec4ee5971135e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RL4IJJJS%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T170000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEny0ctle%2BFFUNecd3DP8wZPPBkmaKXkIjSV6YB3LpokAiBkGiBxyK8QOcGCj09Tadb2UJnPtpTgGZPm5PvI10NfAiqIBAiZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMcxdU%2BeOZikr6WwqdKtwDT0pvtnZmQs31nuGfs4d5r5OfxjqENaCJ%2BuvJoGWlrQd40FbNX9oKDa8Zz%2BPhmzujdgXC3btAHm%2BvJqliQDKSlrsZqV35Mk%2FTGtX9apFZtDFjfgofgaRhUvU%2FfJ8ga5c0x32zbxBeWOCcJIAG88cul4JmphzDYNFZM39xwI9CBTSz5Xg06Cu%2BwpyWFRmQiPJhapQKrD4ivSk%2Bhobtn%2F4ZdyOqijdUqqs6mWvEuQBDmWqD0GkgKWvPy4YBikr%2F9ZMMVqjJAM3PGkaOCHi7pibnSrc82L%2BhoQCWaO8uMDOYrcq%2BtL1Y6UCD6hUlhBmx2ridmK3X53vE6po0uFEh%2Bj6Kx6ArYq7woPSSSV31CWcIE0WepCb70ajHRtap9usaMBiyo7fNN%2FlUKx9UVLCXqJxOs2omzP7BkTNfXh5aRggM2rfewFLQFh397B6wLonZ8s1RgZd8RR2NUNi0mAIhPTn51dPMtOkiYocSnF3yulytKkkycc4wBTQXyy%2F9a9XcBNONnBY%2BE657r2j5WPDyRgQOJrnDvZqKbmHwoHORV4t0fXSdtjmO%2F8ORU59f1qIjoc6okCVaZKldGX6OB9erObEZnP9kPkjy%2F%2BaBi%2B3hJFrB9sITEySLMV4Iq55MaWUwnbb%2F1QY6pgH%2Bi1gR2B7J%2Btu9XWSL%2Fn0jxcqTYENK9ctjXWD8fSD2yKtMbupqgFUWT0LAO007BoY%2BNk83d%2B5bsEnuVvH0ZNQMy8IFePEBRl8U63Ba7NQVEtXzoEZnkIiK04n3bGAj2SdlZzdnfQznBP3AbM%2BLlrV9V89wpDNNnkIChzNGaCnRwFAdnO%2BTDR4%2F9S7g9KK2SUKjork%2BrD9Tyvh8JMNLMyye45ACtU%2BA&X-Amz-Signature=4bb593b66e654d816743573f155d46e3301734b4369d3c79202714dd515ef77c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RL4IJJJS%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T170000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEny0ctle%2BFFUNecd3DP8wZPPBkmaKXkIjSV6YB3LpokAiBkGiBxyK8QOcGCj09Tadb2UJnPtpTgGZPm5PvI10NfAiqIBAiZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMcxdU%2BeOZikr6WwqdKtwDT0pvtnZmQs31nuGfs4d5r5OfxjqENaCJ%2BuvJoGWlrQd40FbNX9oKDa8Zz%2BPhmzujdgXC3btAHm%2BvJqliQDKSlrsZqV35Mk%2FTGtX9apFZtDFjfgofgaRhUvU%2FfJ8ga5c0x32zbxBeWOCcJIAG88cul4JmphzDYNFZM39xwI9CBTSz5Xg06Cu%2BwpyWFRmQiPJhapQKrD4ivSk%2Bhobtn%2F4ZdyOqijdUqqs6mWvEuQBDmWqD0GkgKWvPy4YBikr%2F9ZMMVqjJAM3PGkaOCHi7pibnSrc82L%2BhoQCWaO8uMDOYrcq%2BtL1Y6UCD6hUlhBmx2ridmK3X53vE6po0uFEh%2Bj6Kx6ArYq7woPSSSV31CWcIE0WepCb70ajHRtap9usaMBiyo7fNN%2FlUKx9UVLCXqJxOs2omzP7BkTNfXh5aRggM2rfewFLQFh397B6wLonZ8s1RgZd8RR2NUNi0mAIhPTn51dPMtOkiYocSnF3yulytKkkycc4wBTQXyy%2F9a9XcBNONnBY%2BE657r2j5WPDyRgQOJrnDvZqKbmHwoHORV4t0fXSdtjmO%2F8ORU59f1qIjoc6okCVaZKldGX6OB9erObEZnP9kPkjy%2F%2BaBi%2B3hJFrB9sITEySLMV4Iq55MaWUwnbb%2F1QY6pgH%2Bi1gR2B7J%2Btu9XWSL%2Fn0jxcqTYENK9ctjXWD8fSD2yKtMbupqgFUWT0LAO007BoY%2BNk83d%2B5bsEnuVvH0ZNQMy8IFePEBRl8U63Ba7NQVEtXzoEZnkIiK04n3bGAj2SdlZzdnfQznBP3AbM%2BLlrV9V89wpDNNnkIChzNGaCnRwFAdnO%2BTDR4%2F9S7g9KK2SUKjork%2BrD9Tyvh8JMNLMyye45ACtU%2BA&X-Amz-Signature=fe66dbcd2d9c70c2c158ec26880a4ef6952683671b6d586cf4ccbe72068a22bf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RL4IJJJS%2F20261002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261002T170000Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEny0ctle%2BFFUNecd3DP8wZPPBkmaKXkIjSV6YB3LpokAiBkGiBxyK8QOcGCj09Tadb2UJnPtpTgGZPm5PvI10NfAiqIBAiZ%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMcxdU%2BeOZikr6WwqdKtwDT0pvtnZmQs31nuGfs4d5r5OfxjqENaCJ%2BuvJoGWlrQd40FbNX9oKDa8Zz%2BPhmzujdgXC3btAHm%2BvJqliQDKSlrsZqV35Mk%2FTGtX9apFZtDFjfgofgaRhUvU%2FfJ8ga5c0x32zbxBeWOCcJIAG88cul4JmphzDYNFZM39xwI9CBTSz5Xg06Cu%2BwpyWFRmQiPJhapQKrD4ivSk%2Bhobtn%2F4ZdyOqijdUqqs6mWvEuQBDmWqD0GkgKWvPy4YBikr%2F9ZMMVqjJAM3PGkaOCHi7pibnSrc82L%2BhoQCWaO8uMDOYrcq%2BtL1Y6UCD6hUlhBmx2ridmK3X53vE6po0uFEh%2Bj6Kx6ArYq7woPSSSV31CWcIE0WepCb70ajHRtap9usaMBiyo7fNN%2FlUKx9UVLCXqJxOs2omzP7BkTNfXh5aRggM2rfewFLQFh397B6wLonZ8s1RgZd8RR2NUNi0mAIhPTn51dPMtOkiYocSnF3yulytKkkycc4wBTQXyy%2F9a9XcBNONnBY%2BE657r2j5WPDyRgQOJrnDvZqKbmHwoHORV4t0fXSdtjmO%2F8ORU59f1qIjoc6okCVaZKldGX6OB9erObEZnP9kPkjy%2F%2BaBi%2B3hJFrB9sITEySLMV4Iq55MaWUwnbb%2F1QY6pgH%2Bi1gR2B7J%2Btu9XWSL%2Fn0jxcqTYENK9ctjXWD8fSD2yKtMbupqgFUWT0LAO007BoY%2BNk83d%2B5bsEnuVvH0ZNQMy8IFePEBRl8U63Ba7NQVEtXzoEZnkIiK04n3bGAj2SdlZzdnfQznBP3AbM%2BLlrV9V89wpDNNnkIChzNGaCnRwFAdnO%2BTDR4%2F9S7g9KK2SUKjork%2BrD9Tyvh8JMNLMyye45ACtU%2BA&X-Amz-Signature=b304ea3607e7a367f050976e39627c6ad19de253ca7547718d7e0296e8b87a58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
