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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3ERJOUK%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T005428Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCGUE%2BoDVJdO9XmHCpEz5OllcdZp%2FT20ryEUBDh8gzApgIgStJghWzoqnBJE6ss0n8AOyrjBf5r32jfydJ66P92swkqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIsXQwzm6Z3CX%2FzfqircA8tC7i%2FOzj8oH3eQ04zbfIeMg2BSEWTnSCebksa2JH6Jny3uKVOlKkqS6gR6w6lSKLB7N0ZXX1go1n%2Fq1VOlWRzpcD6kq8nDUAvG31GnvoJDj1B7I2qp%2BN%2BZCoWOozsnmmhk%2BqonJ%2BA1HjRIOmSxlcEfhhX4ahWLZfqj%2FLcOhV%2BpiIBQLWdgKfnUe5ILv0pyNa6wRZ7eOGgK1FR8Bgab2zCa2Vw06P8gNLSiopa5xL%2B34pAnNm3OZMfKDNB5%2BOMcl1Mwd6fhBHRZOeaMfXrWl9jcFPL%2Bs%2FrzFVALXUpXAPXnfkbw5HjLNP7SKPjhyjwaJEHVtDv3ZYTNnpQ232pyIdDO4WgQoSs0J4WhCFSsiaW7KwPj9VGto0Iqk%2FdQ0yAU9xrZhUUYdEBHqD4tIOQyl0bv2zDpnzTmzt822VqzXYFzOizSmg3rptaB8JGf%2Fbm%2FP1q2zLhQuck7zU3uTBemtYUUo%2FR4he3geU4HJCGC2HPIzkGUptu14vI%2FogiA9luukwdZPeBPYrn5WxbRla%2FqEl%2F5XcNKKgniJl%2FyU%2BQjD3pVTEPzBlzR%2FFgCNTb5N%2BJKtVnyRYnnZxKrimkOcyKIkuckBir3Wxsqoy2loF0dySIurJ08Zxdfa%2FtiqOS0MOra6dMGOqUBSbtl4o8s9cS%2B9FIm77aVtbrVEyTvFW%2FcCNuDAPtKYTb%2B8dwXM3UiWzUJkv0%2B0LOmIf1iGjmtpTmVMkMaAIs3%2FXlg5KDXNCslG7ipZITGcR2xuJ%2BIEaRE2cdKT%2FgAroBvYL49BCc2b5Zw%2FueyylWhShjWzlhl%2BWqpHIuOMssLjazQ01Vb%2FkvQE%2BaIkDXgHIAbC7SuNsj0Q5rXolgE6x4LkOPb6wPA&X-Amz-Signature=e1cb536c83ef0339b739f1008d91397e41fa1a774494f8178242982e8bc371cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3ERJOUK%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T005428Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCGUE%2BoDVJdO9XmHCpEz5OllcdZp%2FT20ryEUBDh8gzApgIgStJghWzoqnBJE6ss0n8AOyrjBf5r32jfydJ66P92swkqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIsXQwzm6Z3CX%2FzfqircA8tC7i%2FOzj8oH3eQ04zbfIeMg2BSEWTnSCebksa2JH6Jny3uKVOlKkqS6gR6w6lSKLB7N0ZXX1go1n%2Fq1VOlWRzpcD6kq8nDUAvG31GnvoJDj1B7I2qp%2BN%2BZCoWOozsnmmhk%2BqonJ%2BA1HjRIOmSxlcEfhhX4ahWLZfqj%2FLcOhV%2BpiIBQLWdgKfnUe5ILv0pyNa6wRZ7eOGgK1FR8Bgab2zCa2Vw06P8gNLSiopa5xL%2B34pAnNm3OZMfKDNB5%2BOMcl1Mwd6fhBHRZOeaMfXrWl9jcFPL%2Bs%2FrzFVALXUpXAPXnfkbw5HjLNP7SKPjhyjwaJEHVtDv3ZYTNnpQ232pyIdDO4WgQoSs0J4WhCFSsiaW7KwPj9VGto0Iqk%2FdQ0yAU9xrZhUUYdEBHqD4tIOQyl0bv2zDpnzTmzt822VqzXYFzOizSmg3rptaB8JGf%2Fbm%2FP1q2zLhQuck7zU3uTBemtYUUo%2FR4he3geU4HJCGC2HPIzkGUptu14vI%2FogiA9luukwdZPeBPYrn5WxbRla%2FqEl%2F5XcNKKgniJl%2FyU%2BQjD3pVTEPzBlzR%2FFgCNTb5N%2BJKtVnyRYnnZxKrimkOcyKIkuckBir3Wxsqoy2loF0dySIurJ08Zxdfa%2FtiqOS0MOra6dMGOqUBSbtl4o8s9cS%2B9FIm77aVtbrVEyTvFW%2FcCNuDAPtKYTb%2B8dwXM3UiWzUJkv0%2B0LOmIf1iGjmtpTmVMkMaAIs3%2FXlg5KDXNCslG7ipZITGcR2xuJ%2BIEaRE2cdKT%2FgAroBvYL49BCc2b5Zw%2FueyylWhShjWzlhl%2BWqpHIuOMssLjazQ01Vb%2FkvQE%2BaIkDXgHIAbC7SuNsj0Q5rXolgE6x4LkOPb6wPA&X-Amz-Signature=1d3102463eee66270205a6e2547d0423ba9951d1c6d0680df4aa698182a55c9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3ERJOUK%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T005428Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCGUE%2BoDVJdO9XmHCpEz5OllcdZp%2FT20ryEUBDh8gzApgIgStJghWzoqnBJE6ss0n8AOyrjBf5r32jfydJ66P92swkqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIsXQwzm6Z3CX%2FzfqircA8tC7i%2FOzj8oH3eQ04zbfIeMg2BSEWTnSCebksa2JH6Jny3uKVOlKkqS6gR6w6lSKLB7N0ZXX1go1n%2Fq1VOlWRzpcD6kq8nDUAvG31GnvoJDj1B7I2qp%2BN%2BZCoWOozsnmmhk%2BqonJ%2BA1HjRIOmSxlcEfhhX4ahWLZfqj%2FLcOhV%2BpiIBQLWdgKfnUe5ILv0pyNa6wRZ7eOGgK1FR8Bgab2zCa2Vw06P8gNLSiopa5xL%2B34pAnNm3OZMfKDNB5%2BOMcl1Mwd6fhBHRZOeaMfXrWl9jcFPL%2Bs%2FrzFVALXUpXAPXnfkbw5HjLNP7SKPjhyjwaJEHVtDv3ZYTNnpQ232pyIdDO4WgQoSs0J4WhCFSsiaW7KwPj9VGto0Iqk%2FdQ0yAU9xrZhUUYdEBHqD4tIOQyl0bv2zDpnzTmzt822VqzXYFzOizSmg3rptaB8JGf%2Fbm%2FP1q2zLhQuck7zU3uTBemtYUUo%2FR4he3geU4HJCGC2HPIzkGUptu14vI%2FogiA9luukwdZPeBPYrn5WxbRla%2FqEl%2F5XcNKKgniJl%2FyU%2BQjD3pVTEPzBlzR%2FFgCNTb5N%2BJKtVnyRYnnZxKrimkOcyKIkuckBir3Wxsqoy2loF0dySIurJ08Zxdfa%2FtiqOS0MOra6dMGOqUBSbtl4o8s9cS%2B9FIm77aVtbrVEyTvFW%2FcCNuDAPtKYTb%2B8dwXM3UiWzUJkv0%2B0LOmIf1iGjmtpTmVMkMaAIs3%2FXlg5KDXNCslG7ipZITGcR2xuJ%2BIEaRE2cdKT%2FgAroBvYL49BCc2b5Zw%2FueyylWhShjWzlhl%2BWqpHIuOMssLjazQ01Vb%2FkvQE%2BaIkDXgHIAbC7SuNsj0Q5rXolgE6x4LkOPb6wPA&X-Amz-Signature=01eff6cb05092bb7bbe2bfa09f48e02b5e2580370acb08253cd599a1bd4ceb57&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q3ERJOUK%2F20260811%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260811T005428Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCGUE%2BoDVJdO9XmHCpEz5OllcdZp%2FT20ryEUBDh8gzApgIgStJghWzoqnBJE6ss0n8AOyrjBf5r32jfydJ66P92swkqiAQIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIsXQwzm6Z3CX%2FzfqircA8tC7i%2FOzj8oH3eQ04zbfIeMg2BSEWTnSCebksa2JH6Jny3uKVOlKkqS6gR6w6lSKLB7N0ZXX1go1n%2Fq1VOlWRzpcD6kq8nDUAvG31GnvoJDj1B7I2qp%2BN%2BZCoWOozsnmmhk%2BqonJ%2BA1HjRIOmSxlcEfhhX4ahWLZfqj%2FLcOhV%2BpiIBQLWdgKfnUe5ILv0pyNa6wRZ7eOGgK1FR8Bgab2zCa2Vw06P8gNLSiopa5xL%2B34pAnNm3OZMfKDNB5%2BOMcl1Mwd6fhBHRZOeaMfXrWl9jcFPL%2Bs%2FrzFVALXUpXAPXnfkbw5HjLNP7SKPjhyjwaJEHVtDv3ZYTNnpQ232pyIdDO4WgQoSs0J4WhCFSsiaW7KwPj9VGto0Iqk%2FdQ0yAU9xrZhUUYdEBHqD4tIOQyl0bv2zDpnzTmzt822VqzXYFzOizSmg3rptaB8JGf%2Fbm%2FP1q2zLhQuck7zU3uTBemtYUUo%2FR4he3geU4HJCGC2HPIzkGUptu14vI%2FogiA9luukwdZPeBPYrn5WxbRla%2FqEl%2F5XcNKKgniJl%2FyU%2BQjD3pVTEPzBlzR%2FFgCNTb5N%2BJKtVnyRYnnZxKrimkOcyKIkuckBir3Wxsqoy2loF0dySIurJ08Zxdfa%2FtiqOS0MOra6dMGOqUBSbtl4o8s9cS%2B9FIm77aVtbrVEyTvFW%2FcCNuDAPtKYTb%2B8dwXM3UiWzUJkv0%2B0LOmIf1iGjmtpTmVMkMaAIs3%2FXlg5KDXNCslG7ipZITGcR2xuJ%2BIEaRE2cdKT%2FgAroBvYL49BCc2b5Zw%2FueyylWhShjWzlhl%2BWqpHIuOMssLjazQ01Vb%2FkvQE%2BaIkDXgHIAbC7SuNsj0Q5rXolgE6x4LkOPb6wPA&X-Amz-Signature=a36f0d2127a9d436f03b4bbd8f14a6a84072213565a46ee32cb1a5b2777528d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
