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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTKV7CVP%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T120541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD10k6z8heGsaFYF5S0PJbuhlriyPbOGd2mEkCCCwE8RQIgT5eTY%2BXF6bmpRn8vG%2BQyvbXhbq9FoRECMrS1fq8M%2FRgqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM%2BQlguDdxK7UtDbbSrcA91KgYnprIcw%2BXf%2Fw7s%2BW9IjEhZY1GZGv7DpBDYibe0OgMmpgXwBpxJg8GfgCF%2FOUVxYasxYhNK9E0754qSMw4jilhnm%2Fu4ZBcyCwcPJQo92rR85%2BOxOFh7oqdfaqk1d7jgmFQesqxQ8E9svrot6Bj2YYMtnvQI08C%2FOTiuKG0omSgUFH8HhKuPe0GxxC7xsUFndjfN17WQpWP5Dp6jGmjRr7FVln8ZA%2BOeEk1KPCltii9GmkOrX4N8iEfMJt4vqtUybQXbpACyN8XusracKK9ifBCTEEgouQl%2FwJojrrZ0%2BDY5It%2BmbcWBh7qDYGseiWWdu3j6dQmpVeU2h4lhDfr6fL5ML7HsaQD40b1XfZZSAZzXIy2eajEkedYvjY4Ib%2FrJMOr5cnaqctMxrDXTgzrVHLqpKzU%2FKB4TF6R4HHqbOKNJ70EjVA6WaVK6UN2X8T5hBnFyxELOYbpGu4wClyMPKs81CmVMaPVXTu7gWAVIJlyReTwIkNnbySe2bbtpGjdCWJEDx%2B0UO%2B8qFSReZVMGnLaG8aZJfxuWvVvzDNnKLjltfX9HsnuzrBEmTNBmt4SkRSEVcO4FF6jej3Z%2FEJTSYCz1OWTPnH5UhtDqc%2FX56ioKZu4TeTm2j373FMM691dQGOqUBDHilC3EIAourA2yBVdE3l8iqSrTByMQksI4icEP3GG4p3aikU6U%2BlWg1su2hVO3ywJ%2FF2tWxYRM5QNz9%2Fc%2FADOrJlc4UIYc7T3x9GBxJqH5aWc171%2BMfqx2jE%2BztUYxJL%2FEw%2FiuP0%2F2W3V7Fy5wJunLdQmxftPKdrcVHzLUoOT8MkophwPMSyh1IpManxqx7hVARbYBbef5voJCHEKRrPy7krfwe&X-Amz-Signature=f4acafdf6b9c56db093267ba9a56fda79dd0b573649494e5e1805447d2fc00d9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTKV7CVP%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T120541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD10k6z8heGsaFYF5S0PJbuhlriyPbOGd2mEkCCCwE8RQIgT5eTY%2BXF6bmpRn8vG%2BQyvbXhbq9FoRECMrS1fq8M%2FRgqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM%2BQlguDdxK7UtDbbSrcA91KgYnprIcw%2BXf%2Fw7s%2BW9IjEhZY1GZGv7DpBDYibe0OgMmpgXwBpxJg8GfgCF%2FOUVxYasxYhNK9E0754qSMw4jilhnm%2Fu4ZBcyCwcPJQo92rR85%2BOxOFh7oqdfaqk1d7jgmFQesqxQ8E9svrot6Bj2YYMtnvQI08C%2FOTiuKG0omSgUFH8HhKuPe0GxxC7xsUFndjfN17WQpWP5Dp6jGmjRr7FVln8ZA%2BOeEk1KPCltii9GmkOrX4N8iEfMJt4vqtUybQXbpACyN8XusracKK9ifBCTEEgouQl%2FwJojrrZ0%2BDY5It%2BmbcWBh7qDYGseiWWdu3j6dQmpVeU2h4lhDfr6fL5ML7HsaQD40b1XfZZSAZzXIy2eajEkedYvjY4Ib%2FrJMOr5cnaqctMxrDXTgzrVHLqpKzU%2FKB4TF6R4HHqbOKNJ70EjVA6WaVK6UN2X8T5hBnFyxELOYbpGu4wClyMPKs81CmVMaPVXTu7gWAVIJlyReTwIkNnbySe2bbtpGjdCWJEDx%2B0UO%2B8qFSReZVMGnLaG8aZJfxuWvVvzDNnKLjltfX9HsnuzrBEmTNBmt4SkRSEVcO4FF6jej3Z%2FEJTSYCz1OWTPnH5UhtDqc%2FX56ioKZu4TeTm2j373FMM691dQGOqUBDHilC3EIAourA2yBVdE3l8iqSrTByMQksI4icEP3GG4p3aikU6U%2BlWg1su2hVO3ywJ%2FF2tWxYRM5QNz9%2Fc%2FADOrJlc4UIYc7T3x9GBxJqH5aWc171%2BMfqx2jE%2BztUYxJL%2FEw%2FiuP0%2F2W3V7Fy5wJunLdQmxftPKdrcVHzLUoOT8MkophwPMSyh1IpManxqx7hVARbYBbef5voJCHEKRrPy7krfwe&X-Amz-Signature=49c4cc55944459f4b14eca31ca81e3fc6137337e4b8200f907734b1071d222b4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTKV7CVP%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T120541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD10k6z8heGsaFYF5S0PJbuhlriyPbOGd2mEkCCCwE8RQIgT5eTY%2BXF6bmpRn8vG%2BQyvbXhbq9FoRECMrS1fq8M%2FRgqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM%2BQlguDdxK7UtDbbSrcA91KgYnprIcw%2BXf%2Fw7s%2BW9IjEhZY1GZGv7DpBDYibe0OgMmpgXwBpxJg8GfgCF%2FOUVxYasxYhNK9E0754qSMw4jilhnm%2Fu4ZBcyCwcPJQo92rR85%2BOxOFh7oqdfaqk1d7jgmFQesqxQ8E9svrot6Bj2YYMtnvQI08C%2FOTiuKG0omSgUFH8HhKuPe0GxxC7xsUFndjfN17WQpWP5Dp6jGmjRr7FVln8ZA%2BOeEk1KPCltii9GmkOrX4N8iEfMJt4vqtUybQXbpACyN8XusracKK9ifBCTEEgouQl%2FwJojrrZ0%2BDY5It%2BmbcWBh7qDYGseiWWdu3j6dQmpVeU2h4lhDfr6fL5ML7HsaQD40b1XfZZSAZzXIy2eajEkedYvjY4Ib%2FrJMOr5cnaqctMxrDXTgzrVHLqpKzU%2FKB4TF6R4HHqbOKNJ70EjVA6WaVK6UN2X8T5hBnFyxELOYbpGu4wClyMPKs81CmVMaPVXTu7gWAVIJlyReTwIkNnbySe2bbtpGjdCWJEDx%2B0UO%2B8qFSReZVMGnLaG8aZJfxuWvVvzDNnKLjltfX9HsnuzrBEmTNBmt4SkRSEVcO4FF6jej3Z%2FEJTSYCz1OWTPnH5UhtDqc%2FX56ioKZu4TeTm2j373FMM691dQGOqUBDHilC3EIAourA2yBVdE3l8iqSrTByMQksI4icEP3GG4p3aikU6U%2BlWg1su2hVO3ywJ%2FF2tWxYRM5QNz9%2Fc%2FADOrJlc4UIYc7T3x9GBxJqH5aWc171%2BMfqx2jE%2BztUYxJL%2FEw%2FiuP0%2F2W3V7Fy5wJunLdQmxftPKdrcVHzLUoOT8MkophwPMSyh1IpManxqx7hVARbYBbef5voJCHEKRrPy7krfwe&X-Amz-Signature=24dc4560305c585fda5db24cce59c824e0f673bbc8cdaec5a146e2e766048e52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTKV7CVP%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T120541Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD10k6z8heGsaFYF5S0PJbuhlriyPbOGd2mEkCCCwE8RQIgT5eTY%2BXF6bmpRn8vG%2BQyvbXhbq9FoRECMrS1fq8M%2FRgqiAQIlP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDM%2BQlguDdxK7UtDbbSrcA91KgYnprIcw%2BXf%2Fw7s%2BW9IjEhZY1GZGv7DpBDYibe0OgMmpgXwBpxJg8GfgCF%2FOUVxYasxYhNK9E0754qSMw4jilhnm%2Fu4ZBcyCwcPJQo92rR85%2BOxOFh7oqdfaqk1d7jgmFQesqxQ8E9svrot6Bj2YYMtnvQI08C%2FOTiuKG0omSgUFH8HhKuPe0GxxC7xsUFndjfN17WQpWP5Dp6jGmjRr7FVln8ZA%2BOeEk1KPCltii9GmkOrX4N8iEfMJt4vqtUybQXbpACyN8XusracKK9ifBCTEEgouQl%2FwJojrrZ0%2BDY5It%2BmbcWBh7qDYGseiWWdu3j6dQmpVeU2h4lhDfr6fL5ML7HsaQD40b1XfZZSAZzXIy2eajEkedYvjY4Ib%2FrJMOr5cnaqctMxrDXTgzrVHLqpKzU%2FKB4TF6R4HHqbOKNJ70EjVA6WaVK6UN2X8T5hBnFyxELOYbpGu4wClyMPKs81CmVMaPVXTu7gWAVIJlyReTwIkNnbySe2bbtpGjdCWJEDx%2B0UO%2B8qFSReZVMGnLaG8aZJfxuWvVvzDNnKLjltfX9HsnuzrBEmTNBmt4SkRSEVcO4FF6jej3Z%2FEJTSYCz1OWTPnH5UhtDqc%2FX56ioKZu4TeTm2j373FMM691dQGOqUBDHilC3EIAourA2yBVdE3l8iqSrTByMQksI4icEP3GG4p3aikU6U%2BlWg1su2hVO3ywJ%2FF2tWxYRM5QNz9%2Fc%2FADOrJlc4UIYc7T3x9GBxJqH5aWc171%2BMfqx2jE%2BztUYxJL%2FEw%2FiuP0%2F2W3V7Fy5wJunLdQmxftPKdrcVHzLUoOT8MkophwPMSyh1IpManxqx7hVARbYBbef5voJCHEKRrPy7krfwe&X-Amz-Signature=27a8664e74ad41b3baeab7d14d86de79410888e3ac385880caca57f697ddb34d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
