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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YLV6C5S6%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T195702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBmK22Gwq0vJTVWOHyzMwz%2B3qxyF64IZqTSemUUnxHpzAiEApqIRwvlt3XbffeqW9d7GB%2FLylHuFCRi4IKaKL%2BDKdXEqiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOCBtFbLWJsiAxvXlyrcA1%2BfWPijSAv770worFE%2F0oac9ajIpzuDO6FLgoLLehx%2BJ2uGkuUR8dRnO2ktfLfgRSIZsRZS8Bh0N%2BE3VstrPPREckSaKNFiIMaiPWBx3D0TBJIraFHnUeZZNuBmKiNhMx3If8Y2joIO9tgDnSwdwREi3li9aBIsow1SLeF3yThtZwiFru3YFxn0lQBH2rTzURMrpjLPwfMzTUfg9tTTWYs2N4Dc9M8xZhdsxEa9Dmc5g%2FPGm3Baztjss4QcgeFlRjisstUeeiedx6PstZLMdPcUtpX7cUn13BE9F49SuBzwRBXn%2FKszHiPEyXM50XGWCcjsX04Clt79cE4o3S8yg1B1j13pW6QaJy4ex3WhbjHrRoGSTKxSzXKbpIZmi19oSXiCp4niqNSBGLE%2Bec3NmwO9YKMXcnWCAODjpzS%2F5EqhmB5S%2BPFxC%2FCzu7Nz5oerdnDIgH%2FkxVoLuBKkLvgWpUaZvJdTMLx%2FHeY%2BW8YiBOWxIib%2F1Q3zn5eRV6c3eaJPNU3vw8ges8hez798Prbn9EdtAa8vbxPMI2Xf6vPRbXsdUwlYg94CjQMnvLowvA26u2kFAFx84KFtMTNEPahjRvMyxgqRtDxUWvUodtP%2B0OZ%2FXU%2Fz2FldxlN9lvbsMO7%2F89YGOqUBqJYksrszP4M%2B1hQJ8CosP2TrMNkRRqI5gEvrtSd89u7%2FcyROtsML1aQQG62s%2B7tZwSGpLKrV5hneiHHWB9HJSUmBolFJMBj%2Bs8icVSs8BLmNOaupdU8wByJAl%2F78zskCaoZs9iaMSB7eigqHEExYit9aLAJSqrOhCzEkakDvoKDk1AAi4baWDHrg5dl23qoDjocMpGH2ga3n3W8v9GFCgE5DUE5t&X-Amz-Signature=a50e4738f0a58c0fc8db43c6fc19004a094d46b1069cd04f53bc82ad3702d48d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YLV6C5S6%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T195702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBmK22Gwq0vJTVWOHyzMwz%2B3qxyF64IZqTSemUUnxHpzAiEApqIRwvlt3XbffeqW9d7GB%2FLylHuFCRi4IKaKL%2BDKdXEqiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOCBtFbLWJsiAxvXlyrcA1%2BfWPijSAv770worFE%2F0oac9ajIpzuDO6FLgoLLehx%2BJ2uGkuUR8dRnO2ktfLfgRSIZsRZS8Bh0N%2BE3VstrPPREckSaKNFiIMaiPWBx3D0TBJIraFHnUeZZNuBmKiNhMx3If8Y2joIO9tgDnSwdwREi3li9aBIsow1SLeF3yThtZwiFru3YFxn0lQBH2rTzURMrpjLPwfMzTUfg9tTTWYs2N4Dc9M8xZhdsxEa9Dmc5g%2FPGm3Baztjss4QcgeFlRjisstUeeiedx6PstZLMdPcUtpX7cUn13BE9F49SuBzwRBXn%2FKszHiPEyXM50XGWCcjsX04Clt79cE4o3S8yg1B1j13pW6QaJy4ex3WhbjHrRoGSTKxSzXKbpIZmi19oSXiCp4niqNSBGLE%2Bec3NmwO9YKMXcnWCAODjpzS%2F5EqhmB5S%2BPFxC%2FCzu7Nz5oerdnDIgH%2FkxVoLuBKkLvgWpUaZvJdTMLx%2FHeY%2BW8YiBOWxIib%2F1Q3zn5eRV6c3eaJPNU3vw8ges8hez798Prbn9EdtAa8vbxPMI2Xf6vPRbXsdUwlYg94CjQMnvLowvA26u2kFAFx84KFtMTNEPahjRvMyxgqRtDxUWvUodtP%2B0OZ%2FXU%2Fz2FldxlN9lvbsMO7%2F89YGOqUBqJYksrszP4M%2B1hQJ8CosP2TrMNkRRqI5gEvrtSd89u7%2FcyROtsML1aQQG62s%2B7tZwSGpLKrV5hneiHHWB9HJSUmBolFJMBj%2Bs8icVSs8BLmNOaupdU8wByJAl%2F78zskCaoZs9iaMSB7eigqHEExYit9aLAJSqrOhCzEkakDvoKDk1AAi4baWDHrg5dl23qoDjocMpGH2ga3n3W8v9GFCgE5DUE5t&X-Amz-Signature=836dcedfe549168013e0602dc77cd4ca673cf196e37ac2dcd12bb11897fe6078&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YLV6C5S6%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T195702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBmK22Gwq0vJTVWOHyzMwz%2B3qxyF64IZqTSemUUnxHpzAiEApqIRwvlt3XbffeqW9d7GB%2FLylHuFCRi4IKaKL%2BDKdXEqiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOCBtFbLWJsiAxvXlyrcA1%2BfWPijSAv770worFE%2F0oac9ajIpzuDO6FLgoLLehx%2BJ2uGkuUR8dRnO2ktfLfgRSIZsRZS8Bh0N%2BE3VstrPPREckSaKNFiIMaiPWBx3D0TBJIraFHnUeZZNuBmKiNhMx3If8Y2joIO9tgDnSwdwREi3li9aBIsow1SLeF3yThtZwiFru3YFxn0lQBH2rTzURMrpjLPwfMzTUfg9tTTWYs2N4Dc9M8xZhdsxEa9Dmc5g%2FPGm3Baztjss4QcgeFlRjisstUeeiedx6PstZLMdPcUtpX7cUn13BE9F49SuBzwRBXn%2FKszHiPEyXM50XGWCcjsX04Clt79cE4o3S8yg1B1j13pW6QaJy4ex3WhbjHrRoGSTKxSzXKbpIZmi19oSXiCp4niqNSBGLE%2Bec3NmwO9YKMXcnWCAODjpzS%2F5EqhmB5S%2BPFxC%2FCzu7Nz5oerdnDIgH%2FkxVoLuBKkLvgWpUaZvJdTMLx%2FHeY%2BW8YiBOWxIib%2F1Q3zn5eRV6c3eaJPNU3vw8ges8hez798Prbn9EdtAa8vbxPMI2Xf6vPRbXsdUwlYg94CjQMnvLowvA26u2kFAFx84KFtMTNEPahjRvMyxgqRtDxUWvUodtP%2B0OZ%2FXU%2Fz2FldxlN9lvbsMO7%2F89YGOqUBqJYksrszP4M%2B1hQJ8CosP2TrMNkRRqI5gEvrtSd89u7%2FcyROtsML1aQQG62s%2B7tZwSGpLKrV5hneiHHWB9HJSUmBolFJMBj%2Bs8icVSs8BLmNOaupdU8wByJAl%2F78zskCaoZs9iaMSB7eigqHEExYit9aLAJSqrOhCzEkakDvoKDk1AAi4baWDHrg5dl23qoDjocMpGH2ga3n3W8v9GFCgE5DUE5t&X-Amz-Signature=4ed23a497ecff6df1dfd2ba6ae14f2d1e8b1a8f7e5fac52aeb9a0dcb4bd5d1e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YLV6C5S6%2F20261024%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261024T195702Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBmK22Gwq0vJTVWOHyzMwz%2B3qxyF64IZqTSemUUnxHpzAiEApqIRwvlt3XbffeqW9d7GB%2FLylHuFCRi4IKaKL%2BDKdXEqiAQIrP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOCBtFbLWJsiAxvXlyrcA1%2BfWPijSAv770worFE%2F0oac9ajIpzuDO6FLgoLLehx%2BJ2uGkuUR8dRnO2ktfLfgRSIZsRZS8Bh0N%2BE3VstrPPREckSaKNFiIMaiPWBx3D0TBJIraFHnUeZZNuBmKiNhMx3If8Y2joIO9tgDnSwdwREi3li9aBIsow1SLeF3yThtZwiFru3YFxn0lQBH2rTzURMrpjLPwfMzTUfg9tTTWYs2N4Dc9M8xZhdsxEa9Dmc5g%2FPGm3Baztjss4QcgeFlRjisstUeeiedx6PstZLMdPcUtpX7cUn13BE9F49SuBzwRBXn%2FKszHiPEyXM50XGWCcjsX04Clt79cE4o3S8yg1B1j13pW6QaJy4ex3WhbjHrRoGSTKxSzXKbpIZmi19oSXiCp4niqNSBGLE%2Bec3NmwO9YKMXcnWCAODjpzS%2F5EqhmB5S%2BPFxC%2FCzu7Nz5oerdnDIgH%2FkxVoLuBKkLvgWpUaZvJdTMLx%2FHeY%2BW8YiBOWxIib%2F1Q3zn5eRV6c3eaJPNU3vw8ges8hez798Prbn9EdtAa8vbxPMI2Xf6vPRbXsdUwlYg94CjQMnvLowvA26u2kFAFx84KFtMTNEPahjRvMyxgqRtDxUWvUodtP%2B0OZ%2FXU%2Fz2FldxlN9lvbsMO7%2F89YGOqUBqJYksrszP4M%2B1hQJ8CosP2TrMNkRRqI5gEvrtSd89u7%2FcyROtsML1aQQG62s%2B7tZwSGpLKrV5hneiHHWB9HJSUmBolFJMBj%2Bs8icVSs8BLmNOaupdU8wByJAl%2F78zskCaoZs9iaMSB7eigqHEExYit9aLAJSqrOhCzEkakDvoKDk1AAi4baWDHrg5dl23qoDjocMpGH2ga3n3W8v9GFCgE5DUE5t&X-Amz-Signature=d8b0519a3eb0f7510d203a6114aefb624f5f151db8b706e796988db38474b561&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
