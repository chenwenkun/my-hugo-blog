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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665MADTRY4%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T181334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCLx%2FcRW9UuhbLTkvozvm3NIrj32TfJeofqYUjMnrOA5wIhAIzoTI4Em953bN2kxD9vvnYLjjU%2B5BJhqDUshYnuZDJlKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzuSalqgtsXt2047usq3APj%2FQ9d0wPd34A2B1avLyzDruZR3l4F1oSZG1JQy9lCYB0BHr6pv%2BehRPKHaMLtfP5TbCjh4izk0X9m61%2FwBpd%2BI8F53uXAJ4YYL2Pxhr9h5pUv7Bz%2F308xvFgJUnXpVVhYDYNHFjfxomqdzxV1CaWY1eVpekvQTwzVpLB%2FaBdqiLJYngZrfBodA1De3tR4SM9ukYY%2F%2Blk2FxoPMQgwjpXDgMouw8fuYMinPzFzusq5RooPUjAsKedbaB0VGSqbMaHFx961xSxrHMX97f8%2FyVT9u453Yn1LpwUmRRKdmBZaG6I%2FCKSRoV2xPYHkJ%2FiERwSTuP37p5uSfBQijPrPwwvonHdQBqUFMOkdQ2wbBGBxrq7wNgr4RrKmw8zB2JM9SRP45vloRf43Ect4wTM4djkdJrHMKc%2Bg94qhqba3ghAHuScZq2NMJUdiehbSr8ddEgIi0fgM%2FS3dg7ihvp9xFdFSis4%2B5JAkulobEumvsUtbt0Ui0lJWm%2B%2FscPtuozkwpLyOgso0EFbLZJ%2FUFctrFohJ1fOyJBNE0uXM7RBxHl%2FNRJWG8Fm0WW7lPhsJV7UnlJzmIwe82NJfQIZXZ1bzOnZu7jtSoEB%2FiqP8BTFwby4%2BsGq4Q2D2%2B5A125KLNjCisqfUBjqkATpZN4xsn42rbQ%2FaTnIAb1muSrQV5jJa%2B0vOExCn8hRBZYJAiUyb8nZS92OExPPfymL%2BWqj79r0dR7Jnx65htV6bB9ZE6G3lK2iXbQ2o0sJE36u8RhccUPnTHcnGh80RoUhuV8%2FvCdL4y6AFi9KLCyccciUcPff61CfOBQk88Wlq5sWSY56YevRw0VQsqsnPCt72y%2B4aQ%2BNxKyKqkuhW7%2FfPQ1uf&X-Amz-Signature=ad9576c350b6ed134d7207060452eb58b65c8ec67549f0e194249e3f6b97d5b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665MADTRY4%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T181334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCLx%2FcRW9UuhbLTkvozvm3NIrj32TfJeofqYUjMnrOA5wIhAIzoTI4Em953bN2kxD9vvnYLjjU%2B5BJhqDUshYnuZDJlKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzuSalqgtsXt2047usq3APj%2FQ9d0wPd34A2B1avLyzDruZR3l4F1oSZG1JQy9lCYB0BHr6pv%2BehRPKHaMLtfP5TbCjh4izk0X9m61%2FwBpd%2BI8F53uXAJ4YYL2Pxhr9h5pUv7Bz%2F308xvFgJUnXpVVhYDYNHFjfxomqdzxV1CaWY1eVpekvQTwzVpLB%2FaBdqiLJYngZrfBodA1De3tR4SM9ukYY%2F%2Blk2FxoPMQgwjpXDgMouw8fuYMinPzFzusq5RooPUjAsKedbaB0VGSqbMaHFx961xSxrHMX97f8%2FyVT9u453Yn1LpwUmRRKdmBZaG6I%2FCKSRoV2xPYHkJ%2FiERwSTuP37p5uSfBQijPrPwwvonHdQBqUFMOkdQ2wbBGBxrq7wNgr4RrKmw8zB2JM9SRP45vloRf43Ect4wTM4djkdJrHMKc%2Bg94qhqba3ghAHuScZq2NMJUdiehbSr8ddEgIi0fgM%2FS3dg7ihvp9xFdFSis4%2B5JAkulobEumvsUtbt0Ui0lJWm%2B%2FscPtuozkwpLyOgso0EFbLZJ%2FUFctrFohJ1fOyJBNE0uXM7RBxHl%2FNRJWG8Fm0WW7lPhsJV7UnlJzmIwe82NJfQIZXZ1bzOnZu7jtSoEB%2FiqP8BTFwby4%2BsGq4Q2D2%2B5A125KLNjCisqfUBjqkATpZN4xsn42rbQ%2FaTnIAb1muSrQV5jJa%2B0vOExCn8hRBZYJAiUyb8nZS92OExPPfymL%2BWqj79r0dR7Jnx65htV6bB9ZE6G3lK2iXbQ2o0sJE36u8RhccUPnTHcnGh80RoUhuV8%2FvCdL4y6AFi9KLCyccciUcPff61CfOBQk88Wlq5sWSY56YevRw0VQsqsnPCt72y%2B4aQ%2BNxKyKqkuhW7%2FfPQ1uf&X-Amz-Signature=a05a48a05b4aac846c4f5a5276d080ffdd4caa6fb96265effc7a88c40966b689&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665MADTRY4%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T181334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCLx%2FcRW9UuhbLTkvozvm3NIrj32TfJeofqYUjMnrOA5wIhAIzoTI4Em953bN2kxD9vvnYLjjU%2B5BJhqDUshYnuZDJlKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzuSalqgtsXt2047usq3APj%2FQ9d0wPd34A2B1avLyzDruZR3l4F1oSZG1JQy9lCYB0BHr6pv%2BehRPKHaMLtfP5TbCjh4izk0X9m61%2FwBpd%2BI8F53uXAJ4YYL2Pxhr9h5pUv7Bz%2F308xvFgJUnXpVVhYDYNHFjfxomqdzxV1CaWY1eVpekvQTwzVpLB%2FaBdqiLJYngZrfBodA1De3tR4SM9ukYY%2F%2Blk2FxoPMQgwjpXDgMouw8fuYMinPzFzusq5RooPUjAsKedbaB0VGSqbMaHFx961xSxrHMX97f8%2FyVT9u453Yn1LpwUmRRKdmBZaG6I%2FCKSRoV2xPYHkJ%2FiERwSTuP37p5uSfBQijPrPwwvonHdQBqUFMOkdQ2wbBGBxrq7wNgr4RrKmw8zB2JM9SRP45vloRf43Ect4wTM4djkdJrHMKc%2Bg94qhqba3ghAHuScZq2NMJUdiehbSr8ddEgIi0fgM%2FS3dg7ihvp9xFdFSis4%2B5JAkulobEumvsUtbt0Ui0lJWm%2B%2FscPtuozkwpLyOgso0EFbLZJ%2FUFctrFohJ1fOyJBNE0uXM7RBxHl%2FNRJWG8Fm0WW7lPhsJV7UnlJzmIwe82NJfQIZXZ1bzOnZu7jtSoEB%2FiqP8BTFwby4%2BsGq4Q2D2%2B5A125KLNjCisqfUBjqkATpZN4xsn42rbQ%2FaTnIAb1muSrQV5jJa%2B0vOExCn8hRBZYJAiUyb8nZS92OExPPfymL%2BWqj79r0dR7Jnx65htV6bB9ZE6G3lK2iXbQ2o0sJE36u8RhccUPnTHcnGh80RoUhuV8%2FvCdL4y6AFi9KLCyccciUcPff61CfOBQk88Wlq5sWSY56YevRw0VQsqsnPCt72y%2B4aQ%2BNxKyKqkuhW7%2FfPQ1uf&X-Amz-Signature=9b2d4f400c7285cc75d8b5efb0b98de964011e49eb5ba560fdf60d0d1e9bd36d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665MADTRY4%2F20260822%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260822T181334Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCLx%2FcRW9UuhbLTkvozvm3NIrj32TfJeofqYUjMnrOA5wIhAIzoTI4Em953bN2kxD9vvnYLjjU%2B5BJhqDUshYnuZDJlKogECML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzuSalqgtsXt2047usq3APj%2FQ9d0wPd34A2B1avLyzDruZR3l4F1oSZG1JQy9lCYB0BHr6pv%2BehRPKHaMLtfP5TbCjh4izk0X9m61%2FwBpd%2BI8F53uXAJ4YYL2Pxhr9h5pUv7Bz%2F308xvFgJUnXpVVhYDYNHFjfxomqdzxV1CaWY1eVpekvQTwzVpLB%2FaBdqiLJYngZrfBodA1De3tR4SM9ukYY%2F%2Blk2FxoPMQgwjpXDgMouw8fuYMinPzFzusq5RooPUjAsKedbaB0VGSqbMaHFx961xSxrHMX97f8%2FyVT9u453Yn1LpwUmRRKdmBZaG6I%2FCKSRoV2xPYHkJ%2FiERwSTuP37p5uSfBQijPrPwwvonHdQBqUFMOkdQ2wbBGBxrq7wNgr4RrKmw8zB2JM9SRP45vloRf43Ect4wTM4djkdJrHMKc%2Bg94qhqba3ghAHuScZq2NMJUdiehbSr8ddEgIi0fgM%2FS3dg7ihvp9xFdFSis4%2B5JAkulobEumvsUtbt0Ui0lJWm%2B%2FscPtuozkwpLyOgso0EFbLZJ%2FUFctrFohJ1fOyJBNE0uXM7RBxHl%2FNRJWG8Fm0WW7lPhsJV7UnlJzmIwe82NJfQIZXZ1bzOnZu7jtSoEB%2FiqP8BTFwby4%2BsGq4Q2D2%2B5A125KLNjCisqfUBjqkATpZN4xsn42rbQ%2FaTnIAb1muSrQV5jJa%2B0vOExCn8hRBZYJAiUyb8nZS92OExPPfymL%2BWqj79r0dR7Jnx65htV6bB9ZE6G3lK2iXbQ2o0sJE36u8RhccUPnTHcnGh80RoUhuV8%2FvCdL4y6AFi9KLCyccciUcPff61CfOBQk88Wlq5sWSY56YevRw0VQsqsnPCt72y%2B4aQ%2BNxKyKqkuhW7%2FfPQ1uf&X-Amz-Signature=b1978a0ca83add09bebaf7ba7a889cc96be0f5af82dfdfd70bc65226d9d58d53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
