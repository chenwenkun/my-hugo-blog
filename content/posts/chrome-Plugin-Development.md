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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X565ZX5Q%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T152339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvW9fZm8uEm%2B3mtKIwIngoiGvmzKn4bmOzQTkHOQVNaAIgQCKhbnK8amjqd1oLC2wloIO4FBDHtFSW0Ztz1pwC%2BCcqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJpIhxgExkBpB1gpSSrcA4sdK8r969cvUyTUPmin3wjDu9Ck6Vul1IxMeIHRQ%2F59CMGXwvEh6QzehHBUZk383KVlfuXinkLpvACJrBut8L691vpwHScs90l3Ock03aNsfWVmSEQxzAKLD2KXaz%2FyG3gV9PAuUtM2hFMHEHeYRSomMSqi7ssenpWccycGt3McnftGaMxbWpx1no0IO2ZHqhS4o571TydD65QDPYrCrv7GmIGoueEJrGZpNC1cVP25eCvPnwma8joRQwcDT8%2BZ8ggDJ5XUJ7L8VO49pWzmPgAlOQzC2hlUc7e%2Fyczj1rHGo92eF5oSZ8P%2BxtpIyNQRJmV5TGxkcbO9c5NjN980kSUfQgRUY9TKbe6LJ0zUyV%2FrU92jGWrSV%2F%2FIkLKGkl%2FiyliwYgxmUtgs03CgIwzB%2Fgy%2BDJje5T1nAHdww3XNXRU5OPOMkJ2kQBb%2BGMrb1wz%2BJIE0NdVy2qlJPJ7Pqr0pWX5jRmSJiinuqMEv0CLoQ9Ei%2BQH1nS228vhCoy5UnBEkQnJKn5PbBs0moMHehy9ZRQN%2FhDik%2BmY80cpLZLry8%2F6YjhFAwDQR%2BdfZR%2BTCmqzgbvkY0nL2QhhfJOrpMx411WOryWpNi%2BsUjzPu%2BpWZ7QW4f%2B3n%2FcW8oz8PvGFAMLy6hNYGOqUBy1dJx6%2BvkZywmKFBs1FLeWRCCwsusTfqQlA0FfpTunvGO%2B5z8s4P8wsVv6FURutQW%2BSnu4J6kOgJMb1F2p3aV%2Buus%2FUqAEe3ut0%2BnPF8Ydsu10J9Gg4%2Fj9Nx%2BP9%2BDqRklq%2F4Em9QBBEkcgHz3XgBdAebS9NlE0ZcEsJVURAcTnOJ3JlgzC2ziKiq3VCqMBF7kabmLJerDv1assuDyLay%2FgAMXEJy&X-Amz-Signature=f5f91f531e5e8591d59dff33cd3142dec1726ac7a6855939c34b8cb96a7fa597&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X565ZX5Q%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T152339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvW9fZm8uEm%2B3mtKIwIngoiGvmzKn4bmOzQTkHOQVNaAIgQCKhbnK8amjqd1oLC2wloIO4FBDHtFSW0Ztz1pwC%2BCcqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJpIhxgExkBpB1gpSSrcA4sdK8r969cvUyTUPmin3wjDu9Ck6Vul1IxMeIHRQ%2F59CMGXwvEh6QzehHBUZk383KVlfuXinkLpvACJrBut8L691vpwHScs90l3Ock03aNsfWVmSEQxzAKLD2KXaz%2FyG3gV9PAuUtM2hFMHEHeYRSomMSqi7ssenpWccycGt3McnftGaMxbWpx1no0IO2ZHqhS4o571TydD65QDPYrCrv7GmIGoueEJrGZpNC1cVP25eCvPnwma8joRQwcDT8%2BZ8ggDJ5XUJ7L8VO49pWzmPgAlOQzC2hlUc7e%2Fyczj1rHGo92eF5oSZ8P%2BxtpIyNQRJmV5TGxkcbO9c5NjN980kSUfQgRUY9TKbe6LJ0zUyV%2FrU92jGWrSV%2F%2FIkLKGkl%2FiyliwYgxmUtgs03CgIwzB%2Fgy%2BDJje5T1nAHdww3XNXRU5OPOMkJ2kQBb%2BGMrb1wz%2BJIE0NdVy2qlJPJ7Pqr0pWX5jRmSJiinuqMEv0CLoQ9Ei%2BQH1nS228vhCoy5UnBEkQnJKn5PbBs0moMHehy9ZRQN%2FhDik%2BmY80cpLZLry8%2F6YjhFAwDQR%2BdfZR%2BTCmqzgbvkY0nL2QhhfJOrpMx411WOryWpNi%2BsUjzPu%2BpWZ7QW4f%2B3n%2FcW8oz8PvGFAMLy6hNYGOqUBy1dJx6%2BvkZywmKFBs1FLeWRCCwsusTfqQlA0FfpTunvGO%2B5z8s4P8wsVv6FURutQW%2BSnu4J6kOgJMb1F2p3aV%2Buus%2FUqAEe3ut0%2BnPF8Ydsu10J9Gg4%2Fj9Nx%2BP9%2BDqRklq%2F4Em9QBBEkcgHz3XgBdAebS9NlE0ZcEsJVURAcTnOJ3JlgzC2ziKiq3VCqMBF7kabmLJerDv1assuDyLay%2FgAMXEJy&X-Amz-Signature=6cd3694f3f75ccfd6e7624129ca7f800b8d5321fc21065078e929b12f73dd1c1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X565ZX5Q%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T152339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvW9fZm8uEm%2B3mtKIwIngoiGvmzKn4bmOzQTkHOQVNaAIgQCKhbnK8amjqd1oLC2wloIO4FBDHtFSW0Ztz1pwC%2BCcqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJpIhxgExkBpB1gpSSrcA4sdK8r969cvUyTUPmin3wjDu9Ck6Vul1IxMeIHRQ%2F59CMGXwvEh6QzehHBUZk383KVlfuXinkLpvACJrBut8L691vpwHScs90l3Ock03aNsfWVmSEQxzAKLD2KXaz%2FyG3gV9PAuUtM2hFMHEHeYRSomMSqi7ssenpWccycGt3McnftGaMxbWpx1no0IO2ZHqhS4o571TydD65QDPYrCrv7GmIGoueEJrGZpNC1cVP25eCvPnwma8joRQwcDT8%2BZ8ggDJ5XUJ7L8VO49pWzmPgAlOQzC2hlUc7e%2Fyczj1rHGo92eF5oSZ8P%2BxtpIyNQRJmV5TGxkcbO9c5NjN980kSUfQgRUY9TKbe6LJ0zUyV%2FrU92jGWrSV%2F%2FIkLKGkl%2FiyliwYgxmUtgs03CgIwzB%2Fgy%2BDJje5T1nAHdww3XNXRU5OPOMkJ2kQBb%2BGMrb1wz%2BJIE0NdVy2qlJPJ7Pqr0pWX5jRmSJiinuqMEv0CLoQ9Ei%2BQH1nS228vhCoy5UnBEkQnJKn5PbBs0moMHehy9ZRQN%2FhDik%2BmY80cpLZLry8%2F6YjhFAwDQR%2BdfZR%2BTCmqzgbvkY0nL2QhhfJOrpMx411WOryWpNi%2BsUjzPu%2BpWZ7QW4f%2B3n%2FcW8oz8PvGFAMLy6hNYGOqUBy1dJx6%2BvkZywmKFBs1FLeWRCCwsusTfqQlA0FfpTunvGO%2B5z8s4P8wsVv6FURutQW%2BSnu4J6kOgJMb1F2p3aV%2Buus%2FUqAEe3ut0%2BnPF8Ydsu10J9Gg4%2Fj9Nx%2BP9%2BDqRklq%2F4Em9QBBEkcgHz3XgBdAebS9NlE0ZcEsJVURAcTnOJ3JlgzC2ziKiq3VCqMBF7kabmLJerDv1assuDyLay%2FgAMXEJy&X-Amz-Signature=754dc04e5ccfb7717831abd7e40859141e0a3916dfe6c45e89360999b0b14d75&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X565ZX5Q%2F20261003%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261003T152339Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQDvW9fZm8uEm%2B3mtKIwIngoiGvmzKn4bmOzQTkHOQVNaAIgQCKhbnK8amjqd1oLC2wloIO4FBDHtFSW0Ztz1pwC%2BCcqiAQIsP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJpIhxgExkBpB1gpSSrcA4sdK8r969cvUyTUPmin3wjDu9Ck6Vul1IxMeIHRQ%2F59CMGXwvEh6QzehHBUZk383KVlfuXinkLpvACJrBut8L691vpwHScs90l3Ock03aNsfWVmSEQxzAKLD2KXaz%2FyG3gV9PAuUtM2hFMHEHeYRSomMSqi7ssenpWccycGt3McnftGaMxbWpx1no0IO2ZHqhS4o571TydD65QDPYrCrv7GmIGoueEJrGZpNC1cVP25eCvPnwma8joRQwcDT8%2BZ8ggDJ5XUJ7L8VO49pWzmPgAlOQzC2hlUc7e%2Fyczj1rHGo92eF5oSZ8P%2BxtpIyNQRJmV5TGxkcbO9c5NjN980kSUfQgRUY9TKbe6LJ0zUyV%2FrU92jGWrSV%2F%2FIkLKGkl%2FiyliwYgxmUtgs03CgIwzB%2Fgy%2BDJje5T1nAHdww3XNXRU5OPOMkJ2kQBb%2BGMrb1wz%2BJIE0NdVy2qlJPJ7Pqr0pWX5jRmSJiinuqMEv0CLoQ9Ei%2BQH1nS228vhCoy5UnBEkQnJKn5PbBs0moMHehy9ZRQN%2FhDik%2BmY80cpLZLry8%2F6YjhFAwDQR%2BdfZR%2BTCmqzgbvkY0nL2QhhfJOrpMx411WOryWpNi%2BsUjzPu%2BpWZ7QW4f%2B3n%2FcW8oz8PvGFAMLy6hNYGOqUBy1dJx6%2BvkZywmKFBs1FLeWRCCwsusTfqQlA0FfpTunvGO%2B5z8s4P8wsVv6FURutQW%2BSnu4J6kOgJMb1F2p3aV%2Buus%2FUqAEe3ut0%2BnPF8Ydsu10J9Gg4%2Fj9Nx%2BP9%2BDqRklq%2F4Em9QBBEkcgHz3XgBdAebS9NlE0ZcEsJVURAcTnOJ3JlgzC2ziKiq3VCqMBF7kabmLJerDv1assuDyLay%2FgAMXEJy&X-Amz-Signature=142bb65acf9c83a19fda594827e58c47000ea4007e41d1d4cbe31de1d3ec0adc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
