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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46663I3QH65%2F20261102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261102T140753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDfjT4mr7Jo%2B3JmnmU6BAMQt68%2FFsTgAsHmLg%2B4UdYFAAiEAvf9n62E3vzYBzrpsO2q28MKDVUaly4z9HvwlTIrv%2Fu0q%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDEJgQYLua4qbdqCUiCrcAy%2BlYb2IpVSphLE0HbpEy3y7ftrlcShulvRRYZs9KWXxYRpHdqAWwteDIFEwu3Cx0pmEzmJ4C9%2F%2BY8mHnJU7lMf0kKse6sDwGxj70IDzvBVMV5Cgj7%2FxAhTNd6re9DiCZHCb9JdZFT2OnNZE4ax%2Bj3eAAdbM0%2BmLDRdEhqnLXFdtc4bHPcmEyY3qBs1PPwrtKsM5XNMi1zDDgZHWblCNaXO%2BiyWWm%2BUhKLYotqrZr325yJ01AZ7zCb251b%2Fce2r1SFmhGN7QZ7R5HfheXi01GGtmKK%2Fjkd0%2B4Lbvri3jvMLfF0Uql5hZBMcJQJ2y%2BeWiyhvL0sCECNkorYmL1kHiz7uyhMzlZ9ZsjHLM5%2FMPu0ZxpeOiXRwplWmtvjF8wRKiG3q6Op89o90zJdXHwgBSk%2Fi%2B0GXk79BHWyZooSIYMT0l%2Fm%2BArPrRwe%2FjuoLkh9DvCwKgJuIxroralG%2F%2BOXPsymNQID4bsdd1HojQpAxjgMrvxf5ko99zV1B3tKfy5z4J9w%2F03cJvIX07xxY4ctNlZRC2RpASvbEQM8r28s6uopi%2B9ILXajUAVJufS2sFUX3%2FiuBleOQqE8uGaBs7sIURcjmAcP9iBAkTJ0klAhDMYKrkJFPe8OUsYlWcrtfvMLiBotcGOqUBmJOo6DyV4%2FRJj2c5TBywyc6gZ1jDl4DA9q9W%2BmP0LaOnZ0C2A4jvwIicsJoGZdMmOoHVcPsC8g5EDFq1cSXiQWWo9sxY3CJYgyNblpyjwDzL2WeoJ9N8NAOFLcUzeK89BtfZ3uasAU1VqqhKC%2Flqu%2BXC91W6Cjtmcziok3G9MBkiOY1klrAp1vDNK2bzqNBjCvMrHtHKW2SZg8lFGoIQ71SCwYJD&X-Amz-Signature=a1c824922c104f848a10df0e6cc894d3e686eeb04ecd34723d804a18861a95c1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46663I3QH65%2F20261102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261102T140753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDfjT4mr7Jo%2B3JmnmU6BAMQt68%2FFsTgAsHmLg%2B4UdYFAAiEAvf9n62E3vzYBzrpsO2q28MKDVUaly4z9HvwlTIrv%2Fu0q%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDEJgQYLua4qbdqCUiCrcAy%2BlYb2IpVSphLE0HbpEy3y7ftrlcShulvRRYZs9KWXxYRpHdqAWwteDIFEwu3Cx0pmEzmJ4C9%2F%2BY8mHnJU7lMf0kKse6sDwGxj70IDzvBVMV5Cgj7%2FxAhTNd6re9DiCZHCb9JdZFT2OnNZE4ax%2Bj3eAAdbM0%2BmLDRdEhqnLXFdtc4bHPcmEyY3qBs1PPwrtKsM5XNMi1zDDgZHWblCNaXO%2BiyWWm%2BUhKLYotqrZr325yJ01AZ7zCb251b%2Fce2r1SFmhGN7QZ7R5HfheXi01GGtmKK%2Fjkd0%2B4Lbvri3jvMLfF0Uql5hZBMcJQJ2y%2BeWiyhvL0sCECNkorYmL1kHiz7uyhMzlZ9ZsjHLM5%2FMPu0ZxpeOiXRwplWmtvjF8wRKiG3q6Op89o90zJdXHwgBSk%2Fi%2B0GXk79BHWyZooSIYMT0l%2Fm%2BArPrRwe%2FjuoLkh9DvCwKgJuIxroralG%2F%2BOXPsymNQID4bsdd1HojQpAxjgMrvxf5ko99zV1B3tKfy5z4J9w%2F03cJvIX07xxY4ctNlZRC2RpASvbEQM8r28s6uopi%2B9ILXajUAVJufS2sFUX3%2FiuBleOQqE8uGaBs7sIURcjmAcP9iBAkTJ0klAhDMYKrkJFPe8OUsYlWcrtfvMLiBotcGOqUBmJOo6DyV4%2FRJj2c5TBywyc6gZ1jDl4DA9q9W%2BmP0LaOnZ0C2A4jvwIicsJoGZdMmOoHVcPsC8g5EDFq1cSXiQWWo9sxY3CJYgyNblpyjwDzL2WeoJ9N8NAOFLcUzeK89BtfZ3uasAU1VqqhKC%2Flqu%2BXC91W6Cjtmcziok3G9MBkiOY1klrAp1vDNK2bzqNBjCvMrHtHKW2SZg8lFGoIQ71SCwYJD&X-Amz-Signature=8f42e814b474d8957f680d3813ecb7a520b14d15a24c6b7efcdad9ef8ce0bc0e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46663I3QH65%2F20261102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261102T140753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDfjT4mr7Jo%2B3JmnmU6BAMQt68%2FFsTgAsHmLg%2B4UdYFAAiEAvf9n62E3vzYBzrpsO2q28MKDVUaly4z9HvwlTIrv%2Fu0q%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDEJgQYLua4qbdqCUiCrcAy%2BlYb2IpVSphLE0HbpEy3y7ftrlcShulvRRYZs9KWXxYRpHdqAWwteDIFEwu3Cx0pmEzmJ4C9%2F%2BY8mHnJU7lMf0kKse6sDwGxj70IDzvBVMV5Cgj7%2FxAhTNd6re9DiCZHCb9JdZFT2OnNZE4ax%2Bj3eAAdbM0%2BmLDRdEhqnLXFdtc4bHPcmEyY3qBs1PPwrtKsM5XNMi1zDDgZHWblCNaXO%2BiyWWm%2BUhKLYotqrZr325yJ01AZ7zCb251b%2Fce2r1SFmhGN7QZ7R5HfheXi01GGtmKK%2Fjkd0%2B4Lbvri3jvMLfF0Uql5hZBMcJQJ2y%2BeWiyhvL0sCECNkorYmL1kHiz7uyhMzlZ9ZsjHLM5%2FMPu0ZxpeOiXRwplWmtvjF8wRKiG3q6Op89o90zJdXHwgBSk%2Fi%2B0GXk79BHWyZooSIYMT0l%2Fm%2BArPrRwe%2FjuoLkh9DvCwKgJuIxroralG%2F%2BOXPsymNQID4bsdd1HojQpAxjgMrvxf5ko99zV1B3tKfy5z4J9w%2F03cJvIX07xxY4ctNlZRC2RpASvbEQM8r28s6uopi%2B9ILXajUAVJufS2sFUX3%2FiuBleOQqE8uGaBs7sIURcjmAcP9iBAkTJ0klAhDMYKrkJFPe8OUsYlWcrtfvMLiBotcGOqUBmJOo6DyV4%2FRJj2c5TBywyc6gZ1jDl4DA9q9W%2BmP0LaOnZ0C2A4jvwIicsJoGZdMmOoHVcPsC8g5EDFq1cSXiQWWo9sxY3CJYgyNblpyjwDzL2WeoJ9N8NAOFLcUzeK89BtfZ3uasAU1VqqhKC%2Flqu%2BXC91W6Cjtmcziok3G9MBkiOY1klrAp1vDNK2bzqNBjCvMrHtHKW2SZg8lFGoIQ71SCwYJD&X-Amz-Signature=47042a532b3147d187800a5b908f8fa3cb6bfdc3d56b944d52b45ff93ba7a750&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46663I3QH65%2F20261102%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261102T140753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDfjT4mr7Jo%2B3JmnmU6BAMQt68%2FFsTgAsHmLg%2B4UdYFAAiEAvf9n62E3vzYBzrpsO2q28MKDVUaly4z9HvwlTIrv%2Fu0q%2FwMIfRAAGgw2Mzc0MjMxODM4MDUiDEJgQYLua4qbdqCUiCrcAy%2BlYb2IpVSphLE0HbpEy3y7ftrlcShulvRRYZs9KWXxYRpHdqAWwteDIFEwu3Cx0pmEzmJ4C9%2F%2BY8mHnJU7lMf0kKse6sDwGxj70IDzvBVMV5Cgj7%2FxAhTNd6re9DiCZHCb9JdZFT2OnNZE4ax%2Bj3eAAdbM0%2BmLDRdEhqnLXFdtc4bHPcmEyY3qBs1PPwrtKsM5XNMi1zDDgZHWblCNaXO%2BiyWWm%2BUhKLYotqrZr325yJ01AZ7zCb251b%2Fce2r1SFmhGN7QZ7R5HfheXi01GGtmKK%2Fjkd0%2B4Lbvri3jvMLfF0Uql5hZBMcJQJ2y%2BeWiyhvL0sCECNkorYmL1kHiz7uyhMzlZ9ZsjHLM5%2FMPu0ZxpeOiXRwplWmtvjF8wRKiG3q6Op89o90zJdXHwgBSk%2Fi%2B0GXk79BHWyZooSIYMT0l%2Fm%2BArPrRwe%2FjuoLkh9DvCwKgJuIxroralG%2F%2BOXPsymNQID4bsdd1HojQpAxjgMrvxf5ko99zV1B3tKfy5z4J9w%2F03cJvIX07xxY4ctNlZRC2RpASvbEQM8r28s6uopi%2B9ILXajUAVJufS2sFUX3%2FiuBleOQqE8uGaBs7sIURcjmAcP9iBAkTJ0klAhDMYKrkJFPe8OUsYlWcrtfvMLiBotcGOqUBmJOo6DyV4%2FRJj2c5TBywyc6gZ1jDl4DA9q9W%2BmP0LaOnZ0C2A4jvwIicsJoGZdMmOoHVcPsC8g5EDFq1cSXiQWWo9sxY3CJYgyNblpyjwDzL2WeoJ9N8NAOFLcUzeK89BtfZ3uasAU1VqqhKC%2Flqu%2BXC91W6Cjtmcziok3G9MBkiOY1klrAp1vDNK2bzqNBjCvMrHtHKW2SZg8lFGoIQ71SCwYJD&X-Amz-Signature=6f4c16c9f87108dfea964d26cdc07d74af2e401c254f5007f8b138f4d7c8ecf9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
