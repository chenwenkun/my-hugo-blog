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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XDT5VIMF%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T155736Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC4uEVLs1BohRyXd%2BN0GGhyL1b61eTNDkxyMAxww9G8XgIhAIM%2BeiTyFJxcm2jvNMH7bh6Kjf%2BSR3AwR3%2BLYC823AcNKv8DCGYQABoMNjM3NDIzMTgzODA1Igwscv2fP4nlBMat9Yoq3AOyTU7%2FGwMYMrzj21cAshb2NRCyf4cwo7tsOWmiQeJ2aD2bTHgp1mIsILrence84MbFHpwE0esCs1EXczzYhA%2FfD%2BBigqawLbEZmnIz%2FpYkLqYbxWJHYsH6UTZJucsqNC0kGEOJlhRxElFqcM8fFsqKeYhsWnwCxiW7jHcxNsil95MyYKIsucm%2Fs7I4B9fKR5u%2BO5AXFlpzff33MtLY9bf2nFcDRRKxCd6%2FTCobh2Vk%2BBSRAXf4lI%2BjbyKOxrlBEtDvKLZc4nzFu5%2FbuVOx7o0NTbEJBjsXDhQVocY%2FnOMp97jztHdm9BdF%2BxNSuY8LxkdNTMlkYiwrOhqIxPqw%2BVB%2BzQl7XrX8CvA0tucUJzubYFexIU0%2FadDj80D84%2BJZcbvhssBgrfqeox9UdbZ7Uoz4QIvNQ52%2BfOaiN4GTha8tDzozupUXGmanv2%2BtY5iL8DKkBetU6lNhteUX%2B33nB%2BL%2BSqM883VALC0Lxq49akK76hxHcMrBDZLO6DNfGk2BfkjTuQf9wujWRm4UZIFOgret5pJ%2BxJqWZGtBDsLwhJLtwEnc0Vmeb1MzbEziB5mQkbtavouonDl6Om88h7Fr9b0Bpc1RzfvRijQW1RIrQkMANN2S%2BjNiUYFULlMSPDCCusvUBjqkAZ34EVa12vdgioz0nPQOwcdSFXvwQBOHgu%2FwsLrq8tAMzUn%2FyARNZdbj0YaJvASd9Bs5%2Fv5rBzqcGXjwn7sXrKZGy3hab2CS%2FmDNvAnP%2BiVKG54Km83BSHtN3m2bv%2BBbegp7p97AN7fHLw%2BEuZXYf1mjbrLA%2B5HAjfsM0c1sdaFSgdti%2BRMG6gHNo0j6wTa3%2BXuPbQ3LC%2FIGtcKjSyGf4POiVFz%2B&X-Amz-Signature=33830c6208d2f2e8f0b999c7fb05bbfb31aa73c6236087a5c315986a8217291b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XDT5VIMF%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T155736Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC4uEVLs1BohRyXd%2BN0GGhyL1b61eTNDkxyMAxww9G8XgIhAIM%2BeiTyFJxcm2jvNMH7bh6Kjf%2BSR3AwR3%2BLYC823AcNKv8DCGYQABoMNjM3NDIzMTgzODA1Igwscv2fP4nlBMat9Yoq3AOyTU7%2FGwMYMrzj21cAshb2NRCyf4cwo7tsOWmiQeJ2aD2bTHgp1mIsILrence84MbFHpwE0esCs1EXczzYhA%2FfD%2BBigqawLbEZmnIz%2FpYkLqYbxWJHYsH6UTZJucsqNC0kGEOJlhRxElFqcM8fFsqKeYhsWnwCxiW7jHcxNsil95MyYKIsucm%2Fs7I4B9fKR5u%2BO5AXFlpzff33MtLY9bf2nFcDRRKxCd6%2FTCobh2Vk%2BBSRAXf4lI%2BjbyKOxrlBEtDvKLZc4nzFu5%2FbuVOx7o0NTbEJBjsXDhQVocY%2FnOMp97jztHdm9BdF%2BxNSuY8LxkdNTMlkYiwrOhqIxPqw%2BVB%2BzQl7XrX8CvA0tucUJzubYFexIU0%2FadDj80D84%2BJZcbvhssBgrfqeox9UdbZ7Uoz4QIvNQ52%2BfOaiN4GTha8tDzozupUXGmanv2%2BtY5iL8DKkBetU6lNhteUX%2B33nB%2BL%2BSqM883VALC0Lxq49akK76hxHcMrBDZLO6DNfGk2BfkjTuQf9wujWRm4UZIFOgret5pJ%2BxJqWZGtBDsLwhJLtwEnc0Vmeb1MzbEziB5mQkbtavouonDl6Om88h7Fr9b0Bpc1RzfvRijQW1RIrQkMANN2S%2BjNiUYFULlMSPDCCusvUBjqkAZ34EVa12vdgioz0nPQOwcdSFXvwQBOHgu%2FwsLrq8tAMzUn%2FyARNZdbj0YaJvASd9Bs5%2Fv5rBzqcGXjwn7sXrKZGy3hab2CS%2FmDNvAnP%2BiVKG54Km83BSHtN3m2bv%2BBbegp7p97AN7fHLw%2BEuZXYf1mjbrLA%2B5HAjfsM0c1sdaFSgdti%2BRMG6gHNo0j6wTa3%2BXuPbQ3LC%2FIGtcKjSyGf4POiVFz%2B&X-Amz-Signature=084f6f69540837afb23f4654456652a0905b1e55d5a78a245fd7572175498355&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XDT5VIMF%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T155736Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC4uEVLs1BohRyXd%2BN0GGhyL1b61eTNDkxyMAxww9G8XgIhAIM%2BeiTyFJxcm2jvNMH7bh6Kjf%2BSR3AwR3%2BLYC823AcNKv8DCGYQABoMNjM3NDIzMTgzODA1Igwscv2fP4nlBMat9Yoq3AOyTU7%2FGwMYMrzj21cAshb2NRCyf4cwo7tsOWmiQeJ2aD2bTHgp1mIsILrence84MbFHpwE0esCs1EXczzYhA%2FfD%2BBigqawLbEZmnIz%2FpYkLqYbxWJHYsH6UTZJucsqNC0kGEOJlhRxElFqcM8fFsqKeYhsWnwCxiW7jHcxNsil95MyYKIsucm%2Fs7I4B9fKR5u%2BO5AXFlpzff33MtLY9bf2nFcDRRKxCd6%2FTCobh2Vk%2BBSRAXf4lI%2BjbyKOxrlBEtDvKLZc4nzFu5%2FbuVOx7o0NTbEJBjsXDhQVocY%2FnOMp97jztHdm9BdF%2BxNSuY8LxkdNTMlkYiwrOhqIxPqw%2BVB%2BzQl7XrX8CvA0tucUJzubYFexIU0%2FadDj80D84%2BJZcbvhssBgrfqeox9UdbZ7Uoz4QIvNQ52%2BfOaiN4GTha8tDzozupUXGmanv2%2BtY5iL8DKkBetU6lNhteUX%2B33nB%2BL%2BSqM883VALC0Lxq49akK76hxHcMrBDZLO6DNfGk2BfkjTuQf9wujWRm4UZIFOgret5pJ%2BxJqWZGtBDsLwhJLtwEnc0Vmeb1MzbEziB5mQkbtavouonDl6Om88h7Fr9b0Bpc1RzfvRijQW1RIrQkMANN2S%2BjNiUYFULlMSPDCCusvUBjqkAZ34EVa12vdgioz0nPQOwcdSFXvwQBOHgu%2FwsLrq8tAMzUn%2FyARNZdbj0YaJvASd9Bs5%2Fv5rBzqcGXjwn7sXrKZGy3hab2CS%2FmDNvAnP%2BiVKG54Km83BSHtN3m2bv%2BBbegp7p97AN7fHLw%2BEuZXYf1mjbrLA%2B5HAjfsM0c1sdaFSgdti%2BRMG6gHNo0j6wTa3%2BXuPbQ3LC%2FIGtcKjSyGf4POiVFz%2B&X-Amz-Signature=64700fed745b31e3e369818aa2535856271687ea28adc95e8480be2512293413&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XDT5VIMF%2F20260829%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260829T155736Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC4uEVLs1BohRyXd%2BN0GGhyL1b61eTNDkxyMAxww9G8XgIhAIM%2BeiTyFJxcm2jvNMH7bh6Kjf%2BSR3AwR3%2BLYC823AcNKv8DCGYQABoMNjM3NDIzMTgzODA1Igwscv2fP4nlBMat9Yoq3AOyTU7%2FGwMYMrzj21cAshb2NRCyf4cwo7tsOWmiQeJ2aD2bTHgp1mIsILrence84MbFHpwE0esCs1EXczzYhA%2FfD%2BBigqawLbEZmnIz%2FpYkLqYbxWJHYsH6UTZJucsqNC0kGEOJlhRxElFqcM8fFsqKeYhsWnwCxiW7jHcxNsil95MyYKIsucm%2Fs7I4B9fKR5u%2BO5AXFlpzff33MtLY9bf2nFcDRRKxCd6%2FTCobh2Vk%2BBSRAXf4lI%2BjbyKOxrlBEtDvKLZc4nzFu5%2FbuVOx7o0NTbEJBjsXDhQVocY%2FnOMp97jztHdm9BdF%2BxNSuY8LxkdNTMlkYiwrOhqIxPqw%2BVB%2BzQl7XrX8CvA0tucUJzubYFexIU0%2FadDj80D84%2BJZcbvhssBgrfqeox9UdbZ7Uoz4QIvNQ52%2BfOaiN4GTha8tDzozupUXGmanv2%2BtY5iL8DKkBetU6lNhteUX%2B33nB%2BL%2BSqM883VALC0Lxq49akK76hxHcMrBDZLO6DNfGk2BfkjTuQf9wujWRm4UZIFOgret5pJ%2BxJqWZGtBDsLwhJLtwEnc0Vmeb1MzbEziB5mQkbtavouonDl6Om88h7Fr9b0Bpc1RzfvRijQW1RIrQkMANN2S%2BjNiUYFULlMSPDCCusvUBjqkAZ34EVa12vdgioz0nPQOwcdSFXvwQBOHgu%2FwsLrq8tAMzUn%2FyARNZdbj0YaJvASd9Bs5%2Fv5rBzqcGXjwn7sXrKZGy3hab2CS%2FmDNvAnP%2BiVKG54Km83BSHtN3m2bv%2BBbegp7p97AN7fHLw%2BEuZXYf1mjbrLA%2B5HAjfsM0c1sdaFSgdti%2BRMG6gHNo0j6wTa3%2BXuPbQ3LC%2FIGtcKjSyGf4POiVFz%2B&X-Amz-Signature=fe0d85ed39d711ab6b5c2bf4014b38390e9230d372195d69f5f53b4af962529f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
