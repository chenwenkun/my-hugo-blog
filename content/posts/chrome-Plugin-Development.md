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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YH7L6QST%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T191237Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJIMEYCIQDml1meveulyjWs0bc86KGmq8MJKb%2FQDXv6XKiP1z08NAIhAMK5qrP%2BI%2FShPv7zqda5YLRps0oXk3aI63M%2Bvni2Le%2BRKv8DCCwQABoMNjM3NDIzMTgzODA1Igz0OyRUbDxmRkukTFMq3AObf%2BrLx9YqUgh9s2KyY0Pslv81%2BQinXQxrgw%2BCEozTW5n1Ec%2FgQGbeL%2FycNOfuqmZKJ8SoWpAOKkt5aKFMsrczrzh%2FjvBcVxdr%2BI%2FGKbsJtJrYJ619s31H9Urc8lrtXbQ4DKZ6Iw7BTsTZwUDK0Od0Hkqr%2Blql0JzXbfpozaKBudDFlR3M3HWCdFPd31mRPApFH%2FEJc73C2ONAOOpRC04DFpa02Z2Lk%2BaRdILmljNHuNzJ7i5woCkbMXCKublSS79mFM0RiK6n2OAxfecAFjul6j7DglMR3b27Zoc7bQosDkP1TRNS4m9oF%2FEiQiVqiMIg3Qe1E6vayRSlvgyjc3Fz5K46aVDjRJvst6nqGOtbFfct6TA%2Fgixa0Gg76bJZxyxmUdKy3lUt7%2BK6bN37HaGM8Un%2B26vscSpOAlET9XLSEwAjPAlvuecJvS%2BiAZszvpFTU2Zf5mVHqgR12qGmV%2FR%2BpXCBwvH8xrE3zgO8YOQ%2F0faDp5X3VdBsvwGw4R3azKJM1z5%2FM3ZmTzXIs0fynTOuYylT4yWU6boo5cTmArSPLLRwRKp0ynOZl%2FracKFK19jw4AEvJJbCfUigu2cJQ1OiCzdipVJXfg2s%2FlJOk5fIgdYq25v7Sa8eOnstFzDygM7TBjqkAYUSfS8IiGpdpAYVj8HGN%2FFIwbZlSqcDQpXmdIh6QPbTXRbxJp3nq7fW5wFRMlpKKBwyhNXs%2FzqCLFGcJ%2FZzjU3OMqcRYXUt1%2BLnO6LiJJBRjtDvIINKisgrt9%2Bl20wqwKaFNXTb4pcoRVL30NimzzBE%2FAqJ7IRqb5toSuq%2BKdtKn9h1CxS2ZjM7Dp8uldinvyDh9v%2FNpfIB%2Bw4%2BNmALO%2BDplY%2Fs&X-Amz-Signature=47cfa79910bdcaab5090801a8729af80977f07f4c19d3910c00e49e0e0f1ade7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YH7L6QST%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T191237Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJIMEYCIQDml1meveulyjWs0bc86KGmq8MJKb%2FQDXv6XKiP1z08NAIhAMK5qrP%2BI%2FShPv7zqda5YLRps0oXk3aI63M%2Bvni2Le%2BRKv8DCCwQABoMNjM3NDIzMTgzODA1Igz0OyRUbDxmRkukTFMq3AObf%2BrLx9YqUgh9s2KyY0Pslv81%2BQinXQxrgw%2BCEozTW5n1Ec%2FgQGbeL%2FycNOfuqmZKJ8SoWpAOKkt5aKFMsrczrzh%2FjvBcVxdr%2BI%2FGKbsJtJrYJ619s31H9Urc8lrtXbQ4DKZ6Iw7BTsTZwUDK0Od0Hkqr%2Blql0JzXbfpozaKBudDFlR3M3HWCdFPd31mRPApFH%2FEJc73C2ONAOOpRC04DFpa02Z2Lk%2BaRdILmljNHuNzJ7i5woCkbMXCKublSS79mFM0RiK6n2OAxfecAFjul6j7DglMR3b27Zoc7bQosDkP1TRNS4m9oF%2FEiQiVqiMIg3Qe1E6vayRSlvgyjc3Fz5K46aVDjRJvst6nqGOtbFfct6TA%2Fgixa0Gg76bJZxyxmUdKy3lUt7%2BK6bN37HaGM8Un%2B26vscSpOAlET9XLSEwAjPAlvuecJvS%2BiAZszvpFTU2Zf5mVHqgR12qGmV%2FR%2BpXCBwvH8xrE3zgO8YOQ%2F0faDp5X3VdBsvwGw4R3azKJM1z5%2FM3ZmTzXIs0fynTOuYylT4yWU6boo5cTmArSPLLRwRKp0ynOZl%2FracKFK19jw4AEvJJbCfUigu2cJQ1OiCzdipVJXfg2s%2FlJOk5fIgdYq25v7Sa8eOnstFzDygM7TBjqkAYUSfS8IiGpdpAYVj8HGN%2FFIwbZlSqcDQpXmdIh6QPbTXRbxJp3nq7fW5wFRMlpKKBwyhNXs%2FzqCLFGcJ%2FZzjU3OMqcRYXUt1%2BLnO6LiJJBRjtDvIINKisgrt9%2Bl20wqwKaFNXTb4pcoRVL30NimzzBE%2FAqJ7IRqb5toSuq%2BKdtKn9h1CxS2ZjM7Dp8uldinvyDh9v%2FNpfIB%2Bw4%2BNmALO%2BDplY%2Fs&X-Amz-Signature=5fddcbe2038d5082a816798a78e6a606509d6b77c9b4c113559350af3b28dec8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YH7L6QST%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T191237Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJIMEYCIQDml1meveulyjWs0bc86KGmq8MJKb%2FQDXv6XKiP1z08NAIhAMK5qrP%2BI%2FShPv7zqda5YLRps0oXk3aI63M%2Bvni2Le%2BRKv8DCCwQABoMNjM3NDIzMTgzODA1Igz0OyRUbDxmRkukTFMq3AObf%2BrLx9YqUgh9s2KyY0Pslv81%2BQinXQxrgw%2BCEozTW5n1Ec%2FgQGbeL%2FycNOfuqmZKJ8SoWpAOKkt5aKFMsrczrzh%2FjvBcVxdr%2BI%2FGKbsJtJrYJ619s31H9Urc8lrtXbQ4DKZ6Iw7BTsTZwUDK0Od0Hkqr%2Blql0JzXbfpozaKBudDFlR3M3HWCdFPd31mRPApFH%2FEJc73C2ONAOOpRC04DFpa02Z2Lk%2BaRdILmljNHuNzJ7i5woCkbMXCKublSS79mFM0RiK6n2OAxfecAFjul6j7DglMR3b27Zoc7bQosDkP1TRNS4m9oF%2FEiQiVqiMIg3Qe1E6vayRSlvgyjc3Fz5K46aVDjRJvst6nqGOtbFfct6TA%2Fgixa0Gg76bJZxyxmUdKy3lUt7%2BK6bN37HaGM8Un%2B26vscSpOAlET9XLSEwAjPAlvuecJvS%2BiAZszvpFTU2Zf5mVHqgR12qGmV%2FR%2BpXCBwvH8xrE3zgO8YOQ%2F0faDp5X3VdBsvwGw4R3azKJM1z5%2FM3ZmTzXIs0fynTOuYylT4yWU6boo5cTmArSPLLRwRKp0ynOZl%2FracKFK19jw4AEvJJbCfUigu2cJQ1OiCzdipVJXfg2s%2FlJOk5fIgdYq25v7Sa8eOnstFzDygM7TBjqkAYUSfS8IiGpdpAYVj8HGN%2FFIwbZlSqcDQpXmdIh6QPbTXRbxJp3nq7fW5wFRMlpKKBwyhNXs%2FzqCLFGcJ%2FZzjU3OMqcRYXUt1%2BLnO6LiJJBRjtDvIINKisgrt9%2Bl20wqwKaFNXTb4pcoRVL30NimzzBE%2FAqJ7IRqb5toSuq%2BKdtKn9h1CxS2ZjM7Dp8uldinvyDh9v%2FNpfIB%2Bw4%2BNmALO%2BDplY%2Fs&X-Amz-Signature=94649ea1077bedd951898356969db839019c9d9b1dace4ec6c2127af3c46e6cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YH7L6QST%2F20260805%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260805T191237Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGMaCXVzLXdlc3QtMiJIMEYCIQDml1meveulyjWs0bc86KGmq8MJKb%2FQDXv6XKiP1z08NAIhAMK5qrP%2BI%2FShPv7zqda5YLRps0oXk3aI63M%2Bvni2Le%2BRKv8DCCwQABoMNjM3NDIzMTgzODA1Igz0OyRUbDxmRkukTFMq3AObf%2BrLx9YqUgh9s2KyY0Pslv81%2BQinXQxrgw%2BCEozTW5n1Ec%2FgQGbeL%2FycNOfuqmZKJ8SoWpAOKkt5aKFMsrczrzh%2FjvBcVxdr%2BI%2FGKbsJtJrYJ619s31H9Urc8lrtXbQ4DKZ6Iw7BTsTZwUDK0Od0Hkqr%2Blql0JzXbfpozaKBudDFlR3M3HWCdFPd31mRPApFH%2FEJc73C2ONAOOpRC04DFpa02Z2Lk%2BaRdILmljNHuNzJ7i5woCkbMXCKublSS79mFM0RiK6n2OAxfecAFjul6j7DglMR3b27Zoc7bQosDkP1TRNS4m9oF%2FEiQiVqiMIg3Qe1E6vayRSlvgyjc3Fz5K46aVDjRJvst6nqGOtbFfct6TA%2Fgixa0Gg76bJZxyxmUdKy3lUt7%2BK6bN37HaGM8Un%2B26vscSpOAlET9XLSEwAjPAlvuecJvS%2BiAZszvpFTU2Zf5mVHqgR12qGmV%2FR%2BpXCBwvH8xrE3zgO8YOQ%2F0faDp5X3VdBsvwGw4R3azKJM1z5%2FM3ZmTzXIs0fynTOuYylT4yWU6boo5cTmArSPLLRwRKp0ynOZl%2FracKFK19jw4AEvJJbCfUigu2cJQ1OiCzdipVJXfg2s%2FlJOk5fIgdYq25v7Sa8eOnstFzDygM7TBjqkAYUSfS8IiGpdpAYVj8HGN%2FFIwbZlSqcDQpXmdIh6QPbTXRbxJp3nq7fW5wFRMlpKKBwyhNXs%2FzqCLFGcJ%2FZzjU3OMqcRYXUt1%2BLnO6LiJJBRjtDvIINKisgrt9%2Bl20wqwKaFNXTb4pcoRVL30NimzzBE%2FAqJ7IRqb5toSuq%2BKdtKn9h1CxS2ZjM7Dp8uldinvyDh9v%2FNpfIB%2Bw4%2BNmALO%2BDplY%2Fs&X-Amz-Signature=5d422e09db8f49ce44f7d0c38135fd3277044758aca6cc6ff444c8e51d635c2e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
