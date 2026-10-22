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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663NBUBTKS%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T205730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIF2qmpyze5tT%2FNSLuTGlvST2%2BgC9n0LOXKKniEovJ6ZCAiEAsOXJcxaaU4hsJbeM7ceiubOiYlsQL3U3CaFUeRVSxK8q%2FwMIehAAGgw2Mzc0MjMxODM4MDUiDLNrp7Bqfpr%2BnjbodircA42ANTcygdzbFF5FOnodz1Sp%2B1aQvH%2B%2Ftdqd%2BXsyiCy2HQR%2FSeUTk6RTgsrYIt1jAT%2BHb6Z2FxzNxCBH1f3wgIN9nb3xLgToQ6oDNIAsBpb78fv9gGAayeI4WgHElXk8fAhkmvE3Rh4gTQ3t5GMCz5sdjpS81KhjW44vUwFuDDuja7l18PrDzr5wXcyD8Tr7eLUdQCdA9Z6jSINGGYf8kSaPeZPPvChnZLzZB7PghRWIIIrR0viH0cd36gUERjcpZwwvRUfHCwySpg%2BcRAQSByPHny2sx%2B%2FrT%2Bw%2F8rHn5DusEuHmPfOu%2B2%2Fq29Otrc5k%2BoPn4J4rCfgQQsMxBtUG%2BML3UlL6LdliLyAIb3ZkCJkB7RQSEW0H6gtLvVzTGHNQRe785nYf%2FHTqnivZgb%2BGazbq8YKqPhfrLTdlIcqIs9Jn2U4zEK%2BD6shZ5NBTOAfSLiaSV7pTo9Eu%2F%2Bs%2BvbAWgTIV%2FL7HjaJ99UBvyGYNMpuchTAQK9mydrknJfSeZ8EXRt9AJhnNaFTmVR%2Fl4R52e%2BJM4zqoNiAWkr4HbG8n37WWW0oAgtv6aivIuTyazmXRPDa2V%2BZTXJUCaGVCbh9JHcStum5hzO2V2fjrY82p39mPIuvFiaEbjRbrSkNJMNyE6dYGOqUB4N4H516JAebNmuJfuJT0%2F7luYnz17QSDbRQVh8WXbLxDLRab4yAjwF9h%2F5rix7xodms6S2syaFjVNoFoReWdpmT90I%2BaiHG8Is4VBb2Ra9u1Hi%2FgUV2VmZVa93qg%2BUdqOImgURMWA4V0yNhXBjVzc2H4IiVIQ1I%2FsAbfr%2Bw7dAFGAPDe0tk1EYcX6m%2Fky6Aj%2FD9S4C3Nyc5B1fm3TBm5pWV8%2BEUV&X-Amz-Signature=f1ed6d946fb8b1b77d262366726477af6673dc9027bb62223a02c225cff6fade&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663NBUBTKS%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T205730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIF2qmpyze5tT%2FNSLuTGlvST2%2BgC9n0LOXKKniEovJ6ZCAiEAsOXJcxaaU4hsJbeM7ceiubOiYlsQL3U3CaFUeRVSxK8q%2FwMIehAAGgw2Mzc0MjMxODM4MDUiDLNrp7Bqfpr%2BnjbodircA42ANTcygdzbFF5FOnodz1Sp%2B1aQvH%2B%2Ftdqd%2BXsyiCy2HQR%2FSeUTk6RTgsrYIt1jAT%2BHb6Z2FxzNxCBH1f3wgIN9nb3xLgToQ6oDNIAsBpb78fv9gGAayeI4WgHElXk8fAhkmvE3Rh4gTQ3t5GMCz5sdjpS81KhjW44vUwFuDDuja7l18PrDzr5wXcyD8Tr7eLUdQCdA9Z6jSINGGYf8kSaPeZPPvChnZLzZB7PghRWIIIrR0viH0cd36gUERjcpZwwvRUfHCwySpg%2BcRAQSByPHny2sx%2B%2FrT%2Bw%2F8rHn5DusEuHmPfOu%2B2%2Fq29Otrc5k%2BoPn4J4rCfgQQsMxBtUG%2BML3UlL6LdliLyAIb3ZkCJkB7RQSEW0H6gtLvVzTGHNQRe785nYf%2FHTqnivZgb%2BGazbq8YKqPhfrLTdlIcqIs9Jn2U4zEK%2BD6shZ5NBTOAfSLiaSV7pTo9Eu%2F%2Bs%2BvbAWgTIV%2FL7HjaJ99UBvyGYNMpuchTAQK9mydrknJfSeZ8EXRt9AJhnNaFTmVR%2Fl4R52e%2BJM4zqoNiAWkr4HbG8n37WWW0oAgtv6aivIuTyazmXRPDa2V%2BZTXJUCaGVCbh9JHcStum5hzO2V2fjrY82p39mPIuvFiaEbjRbrSkNJMNyE6dYGOqUB4N4H516JAebNmuJfuJT0%2F7luYnz17QSDbRQVh8WXbLxDLRab4yAjwF9h%2F5rix7xodms6S2syaFjVNoFoReWdpmT90I%2BaiHG8Is4VBb2Ra9u1Hi%2FgUV2VmZVa93qg%2BUdqOImgURMWA4V0yNhXBjVzc2H4IiVIQ1I%2FsAbfr%2Bw7dAFGAPDe0tk1EYcX6m%2Fky6Aj%2FD9S4C3Nyc5B1fm3TBm5pWV8%2BEUV&X-Amz-Signature=3ec034935e75ff627bdcd9653d3c9434bf5b1c4d021d4028178616692a01d875&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663NBUBTKS%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T205730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIF2qmpyze5tT%2FNSLuTGlvST2%2BgC9n0LOXKKniEovJ6ZCAiEAsOXJcxaaU4hsJbeM7ceiubOiYlsQL3U3CaFUeRVSxK8q%2FwMIehAAGgw2Mzc0MjMxODM4MDUiDLNrp7Bqfpr%2BnjbodircA42ANTcygdzbFF5FOnodz1Sp%2B1aQvH%2B%2Ftdqd%2BXsyiCy2HQR%2FSeUTk6RTgsrYIt1jAT%2BHb6Z2FxzNxCBH1f3wgIN9nb3xLgToQ6oDNIAsBpb78fv9gGAayeI4WgHElXk8fAhkmvE3Rh4gTQ3t5GMCz5sdjpS81KhjW44vUwFuDDuja7l18PrDzr5wXcyD8Tr7eLUdQCdA9Z6jSINGGYf8kSaPeZPPvChnZLzZB7PghRWIIIrR0viH0cd36gUERjcpZwwvRUfHCwySpg%2BcRAQSByPHny2sx%2B%2FrT%2Bw%2F8rHn5DusEuHmPfOu%2B2%2Fq29Otrc5k%2BoPn4J4rCfgQQsMxBtUG%2BML3UlL6LdliLyAIb3ZkCJkB7RQSEW0H6gtLvVzTGHNQRe785nYf%2FHTqnivZgb%2BGazbq8YKqPhfrLTdlIcqIs9Jn2U4zEK%2BD6shZ5NBTOAfSLiaSV7pTo9Eu%2F%2Bs%2BvbAWgTIV%2FL7HjaJ99UBvyGYNMpuchTAQK9mydrknJfSeZ8EXRt9AJhnNaFTmVR%2Fl4R52e%2BJM4zqoNiAWkr4HbG8n37WWW0oAgtv6aivIuTyazmXRPDa2V%2BZTXJUCaGVCbh9JHcStum5hzO2V2fjrY82p39mPIuvFiaEbjRbrSkNJMNyE6dYGOqUB4N4H516JAebNmuJfuJT0%2F7luYnz17QSDbRQVh8WXbLxDLRab4yAjwF9h%2F5rix7xodms6S2syaFjVNoFoReWdpmT90I%2BaiHG8Is4VBb2Ra9u1Hi%2FgUV2VmZVa93qg%2BUdqOImgURMWA4V0yNhXBjVzc2H4IiVIQ1I%2FsAbfr%2Bw7dAFGAPDe0tk1EYcX6m%2Fky6Aj%2FD9S4C3Nyc5B1fm3TBm5pWV8%2BEUV&X-Amz-Signature=d6ca60f9addd6003b7ac0d2472114a6052bca5bd01eddab72d7730ec44ef04e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663NBUBTKS%2F20261022%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261022T205730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIF2qmpyze5tT%2FNSLuTGlvST2%2BgC9n0LOXKKniEovJ6ZCAiEAsOXJcxaaU4hsJbeM7ceiubOiYlsQL3U3CaFUeRVSxK8q%2FwMIehAAGgw2Mzc0MjMxODM4MDUiDLNrp7Bqfpr%2BnjbodircA42ANTcygdzbFF5FOnodz1Sp%2B1aQvH%2B%2Ftdqd%2BXsyiCy2HQR%2FSeUTk6RTgsrYIt1jAT%2BHb6Z2FxzNxCBH1f3wgIN9nb3xLgToQ6oDNIAsBpb78fv9gGAayeI4WgHElXk8fAhkmvE3Rh4gTQ3t5GMCz5sdjpS81KhjW44vUwFuDDuja7l18PrDzr5wXcyD8Tr7eLUdQCdA9Z6jSINGGYf8kSaPeZPPvChnZLzZB7PghRWIIIrR0viH0cd36gUERjcpZwwvRUfHCwySpg%2BcRAQSByPHny2sx%2B%2FrT%2Bw%2F8rHn5DusEuHmPfOu%2B2%2Fq29Otrc5k%2BoPn4J4rCfgQQsMxBtUG%2BML3UlL6LdliLyAIb3ZkCJkB7RQSEW0H6gtLvVzTGHNQRe785nYf%2FHTqnivZgb%2BGazbq8YKqPhfrLTdlIcqIs9Jn2U4zEK%2BD6shZ5NBTOAfSLiaSV7pTo9Eu%2F%2Bs%2BvbAWgTIV%2FL7HjaJ99UBvyGYNMpuchTAQK9mydrknJfSeZ8EXRt9AJhnNaFTmVR%2Fl4R52e%2BJM4zqoNiAWkr4HbG8n37WWW0oAgtv6aivIuTyazmXRPDa2V%2BZTXJUCaGVCbh9JHcStum5hzO2V2fjrY82p39mPIuvFiaEbjRbrSkNJMNyE6dYGOqUB4N4H516JAebNmuJfuJT0%2F7luYnz17QSDbRQVh8WXbLxDLRab4yAjwF9h%2F5rix7xodms6S2syaFjVNoFoReWdpmT90I%2BaiHG8Is4VBb2Ra9u1Hi%2FgUV2VmZVa93qg%2BUdqOImgURMWA4V0yNhXBjVzc2H4IiVIQ1I%2FsAbfr%2Bw7dAFGAPDe0tk1EYcX6m%2Fky6Aj%2FD9S4C3Nyc5B1fm3TBm5pWV8%2BEUV&X-Amz-Signature=0445e78976767a007601ef6c3be56836de2c9ac9febdd63b79ccc8f8bc1a34cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
