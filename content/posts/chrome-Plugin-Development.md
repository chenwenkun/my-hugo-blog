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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKKOKRGB%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T224021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRr8gFOldEMOjiIlSduugaKBenta57YmUH4SyzCPDVfAiEA1Z1l5yY1tBjzV8YPmzGg4EpPtvDsAk1tzM1aPiNeBKMqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDKYFeKCe7%2FyqxCVOSrcA06IuO2ha%2Bz8X6edKG1HTHTaF4oV00ftxa96J3BozUFW3FD8ygtK1nYXxsZ%2F3hMkTsmP7pxoU7T63OxrHq9LQB6WeN%2Fvq7gIwR3HpwH3zEWZemAPuj%2F0JcatPvnWrjNfdL188ZMdRKENRCd%2Bg%2FB7yZqbFFsDa%2FTOiAkuViH29j2WP6wGXUw2At6fuYg4giyj75VzgwOjHMAkNy6K%2FYCxcxZz6ehkDI%2Fg334jM7tEZwREY%2B5h10ZXPgVruQpvXH%2BreRvQFCV%2FWL37jutwkkeLOlhvQr3NBvrZgu%2B2hteNacDiR5%2BYSZsB29ph4NBrNvDkr1qbpGYPyMhFZ5lHe8WBrY7y3MQe6OkBrph%2BMqdNRJmPh2WdiFfohrB0SCItWO%2BS1WaCmeBoQ8yp4I6jd%2FE%2BWzrijx7cKfagPzw2n1i5R5MLeylEHZaU%2B%2BqSlJV5EZ%2BxPNRwee8AH2p6uFRClT56H3G0m7fU54jjd5nbkLxURJ1bdpzs8NpvkNGPeW0BIbfL4ScmvnzB9P%2FJ4ju2mTRnPd8jBrf4eV6JN%2B6i%2BaBq7lEOGPmjM6Boahbr4rldqDS4yEZdIM62uS5v149hrvwCbXUvc5x8sU4ACUfUJOnQ%2BmG19oCWmpUswNGpel%2FyMO39qNcGOqUBBNqbDizvEXn1q8AGGMYofcQcTC6ERBmGW7FIJ7xuCvDnLO9WSEJPiYX2PS%2BaPfBU7D8xiU6vmeEQmEiY0%2FUpSkb3I%2BNcvJYK5Vb5ZNoQ7k%2BBH0a7N2dF7PRaGnJNwQPNThL9qns5VwCgyCS5cgbPM%2FEEW%2ForIOwJsRgExcnYmgtnDpCWl8XtGpmMkrXuSvxC8kVmyuKsAz08lTgCnbzPHHsl3dJv&X-Amz-Signature=c0b579c862f8c3398fc8dd8a7951bd8b752689a3c0f621f8fa09ade2e3dc8440&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKKOKRGB%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T224021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRr8gFOldEMOjiIlSduugaKBenta57YmUH4SyzCPDVfAiEA1Z1l5yY1tBjzV8YPmzGg4EpPtvDsAk1tzM1aPiNeBKMqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDKYFeKCe7%2FyqxCVOSrcA06IuO2ha%2Bz8X6edKG1HTHTaF4oV00ftxa96J3BozUFW3FD8ygtK1nYXxsZ%2F3hMkTsmP7pxoU7T63OxrHq9LQB6WeN%2Fvq7gIwR3HpwH3zEWZemAPuj%2F0JcatPvnWrjNfdL188ZMdRKENRCd%2Bg%2FB7yZqbFFsDa%2FTOiAkuViH29j2WP6wGXUw2At6fuYg4giyj75VzgwOjHMAkNy6K%2FYCxcxZz6ehkDI%2Fg334jM7tEZwREY%2B5h10ZXPgVruQpvXH%2BreRvQFCV%2FWL37jutwkkeLOlhvQr3NBvrZgu%2B2hteNacDiR5%2BYSZsB29ph4NBrNvDkr1qbpGYPyMhFZ5lHe8WBrY7y3MQe6OkBrph%2BMqdNRJmPh2WdiFfohrB0SCItWO%2BS1WaCmeBoQ8yp4I6jd%2FE%2BWzrijx7cKfagPzw2n1i5R5MLeylEHZaU%2B%2BqSlJV5EZ%2BxPNRwee8AH2p6uFRClT56H3G0m7fU54jjd5nbkLxURJ1bdpzs8NpvkNGPeW0BIbfL4ScmvnzB9P%2FJ4ju2mTRnPd8jBrf4eV6JN%2B6i%2BaBq7lEOGPmjM6Boahbr4rldqDS4yEZdIM62uS5v149hrvwCbXUvc5x8sU4ACUfUJOnQ%2BmG19oCWmpUswNGpel%2FyMO39qNcGOqUBBNqbDizvEXn1q8AGGMYofcQcTC6ERBmGW7FIJ7xuCvDnLO9WSEJPiYX2PS%2BaPfBU7D8xiU6vmeEQmEiY0%2FUpSkb3I%2BNcvJYK5Vb5ZNoQ7k%2BBH0a7N2dF7PRaGnJNwQPNThL9qns5VwCgyCS5cgbPM%2FEEW%2ForIOwJsRgExcnYmgtnDpCWl8XtGpmMkrXuSvxC8kVmyuKsAz08lTgCnbzPHHsl3dJv&X-Amz-Signature=b662e3ed33287cce8235c9a0b06e17fd1eae292d089a0a6fbb9ba1e677af4362&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKKOKRGB%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T224021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRr8gFOldEMOjiIlSduugaKBenta57YmUH4SyzCPDVfAiEA1Z1l5yY1tBjzV8YPmzGg4EpPtvDsAk1tzM1aPiNeBKMqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDKYFeKCe7%2FyqxCVOSrcA06IuO2ha%2Bz8X6edKG1HTHTaF4oV00ftxa96J3BozUFW3FD8ygtK1nYXxsZ%2F3hMkTsmP7pxoU7T63OxrHq9LQB6WeN%2Fvq7gIwR3HpwH3zEWZemAPuj%2F0JcatPvnWrjNfdL188ZMdRKENRCd%2Bg%2FB7yZqbFFsDa%2FTOiAkuViH29j2WP6wGXUw2At6fuYg4giyj75VzgwOjHMAkNy6K%2FYCxcxZz6ehkDI%2Fg334jM7tEZwREY%2B5h10ZXPgVruQpvXH%2BreRvQFCV%2FWL37jutwkkeLOlhvQr3NBvrZgu%2B2hteNacDiR5%2BYSZsB29ph4NBrNvDkr1qbpGYPyMhFZ5lHe8WBrY7y3MQe6OkBrph%2BMqdNRJmPh2WdiFfohrB0SCItWO%2BS1WaCmeBoQ8yp4I6jd%2FE%2BWzrijx7cKfagPzw2n1i5R5MLeylEHZaU%2B%2BqSlJV5EZ%2BxPNRwee8AH2p6uFRClT56H3G0m7fU54jjd5nbkLxURJ1bdpzs8NpvkNGPeW0BIbfL4ScmvnzB9P%2FJ4ju2mTRnPd8jBrf4eV6JN%2B6i%2BaBq7lEOGPmjM6Boahbr4rldqDS4yEZdIM62uS5v149hrvwCbXUvc5x8sU4ACUfUJOnQ%2BmG19oCWmpUswNGpel%2FyMO39qNcGOqUBBNqbDizvEXn1q8AGGMYofcQcTC6ERBmGW7FIJ7xuCvDnLO9WSEJPiYX2PS%2BaPfBU7D8xiU6vmeEQmEiY0%2FUpSkb3I%2BNcvJYK5Vb5ZNoQ7k%2BBH0a7N2dF7PRaGnJNwQPNThL9qns5VwCgyCS5cgbPM%2FEEW%2ForIOwJsRgExcnYmgtnDpCWl8XtGpmMkrXuSvxC8kVmyuKsAz08lTgCnbzPHHsl3dJv&X-Amz-Signature=df4b85803f68bdbe369958a3285c9b817c0ea4edf75188f111f0fa563c33e0a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TKKOKRGB%2F20261103%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261103T224021Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRr8gFOldEMOjiIlSduugaKBenta57YmUH4SyzCPDVfAiEA1Z1l5yY1tBjzV8YPmzGg4EpPtvDsAk1tzM1aPiNeBKMqiAQInf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDDKYFeKCe7%2FyqxCVOSrcA06IuO2ha%2Bz8X6edKG1HTHTaF4oV00ftxa96J3BozUFW3FD8ygtK1nYXxsZ%2F3hMkTsmP7pxoU7T63OxrHq9LQB6WeN%2Fvq7gIwR3HpwH3zEWZemAPuj%2F0JcatPvnWrjNfdL188ZMdRKENRCd%2Bg%2FB7yZqbFFsDa%2FTOiAkuViH29j2WP6wGXUw2At6fuYg4giyj75VzgwOjHMAkNy6K%2FYCxcxZz6ehkDI%2Fg334jM7tEZwREY%2B5h10ZXPgVruQpvXH%2BreRvQFCV%2FWL37jutwkkeLOlhvQr3NBvrZgu%2B2hteNacDiR5%2BYSZsB29ph4NBrNvDkr1qbpGYPyMhFZ5lHe8WBrY7y3MQe6OkBrph%2BMqdNRJmPh2WdiFfohrB0SCItWO%2BS1WaCmeBoQ8yp4I6jd%2FE%2BWzrijx7cKfagPzw2n1i5R5MLeylEHZaU%2B%2BqSlJV5EZ%2BxPNRwee8AH2p6uFRClT56H3G0m7fU54jjd5nbkLxURJ1bdpzs8NpvkNGPeW0BIbfL4ScmvnzB9P%2FJ4ju2mTRnPd8jBrf4eV6JN%2B6i%2BaBq7lEOGPmjM6Boahbr4rldqDS4yEZdIM62uS5v149hrvwCbXUvc5x8sU4ACUfUJOnQ%2BmG19oCWmpUswNGpel%2FyMO39qNcGOqUBBNqbDizvEXn1q8AGGMYofcQcTC6ERBmGW7FIJ7xuCvDnLO9WSEJPiYX2PS%2BaPfBU7D8xiU6vmeEQmEiY0%2FUpSkb3I%2BNcvJYK5Vb5ZNoQ7k%2BBH0a7N2dF7PRaGnJNwQPNThL9qns5VwCgyCS5cgbPM%2FEEW%2ForIOwJsRgExcnYmgtnDpCWl8XtGpmMkrXuSvxC8kVmyuKsAz08lTgCnbzPHHsl3dJv&X-Amz-Signature=f884ae00a4f54d88aee7839be83028a14c54e3afe271b96092f87e05af8ceab1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
