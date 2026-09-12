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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TI3P63XL%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T020313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCMwPsKnBfUNpzAnhXvh279nzCJ4TK4NqSM5rhZF1FaTgIgaWFT8%2FLcd%2FwYliyOmIzAsBCSdkPQbL%2FLKvSFp6urQ80qiAQIqf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEu7UhGrrnprQKEBnSrcAymTqrkB7xx0xXwGxOTmR%2FWseFjZ%2BIab3znD%2BA2zN92IKhO2dRk22FZQsJ45ZfetXBEV0GGSxZmdxZqS%2F592Kzfj3890Z%2B9IiA1WhNhWgNXDBwDkaoTR8x9%2FucQti1vCoV4VBmvYaelnABbjSD0EavLH5%2BH%2FSSjTjBhdKnrw6vUkfsm%2BTgf5sZkYhCv3QI1z2rmmrS7Txrtse%2BzvXYZGC72SGK3lSML8fws%2B%2Bi8VpKAbAlse6MEUaSrIlc%2Bafy589QrhramXv6b%2F%2BhqwK%2FmJcFtZjsftXAD3f0j8gNv4CjmU%2FlBbyBLmjGvF7WBc2qL%2F9Yf%2BAhPRi6qu%2B%2FGRSJXHQ7e4kDalepJH%2FZnIdG4IzGwNCDvnKy8Pxy930UEZLx2E5xrBtRsWBHkawDWFTWAi9AdS9chU%2Fom2a37jN97KnmyR3GKP25lzns%2FfyFEqpMea8nKiFFFHKg3b5qeHcV6PtGJu3wLiVK51Yx9u6XoBa31eZHYczO6CkL1s2OW%2FWGFFPR5iel8XVmPzIMKpvmi%2Fp9O0NREQsoRcG2XvKlBJrcrHYgzH%2BfUBNqwTaVcZWgezhgekKMU6q7IflUVeV4eyHdeMhPUQwxz71YLbG8V3%2BwY7WnqLQAs7gjno95U7MIqsktUGOqUBqlpDgrLK%2BR9D9435U%2B2AmKBz%2FqBJcxtKNah%2B7%2B2UBWgCMB8ZYPC2Dg2N%2FwTe%2FqTxo3q7snZsREuZFrJnvF%2Bj82o4D7i4I2e46fqAhbqR5Iml%2BlIdr9fOtzGUIw%2FyGmtXPOdtQ7jIWMZjDXoxFieKKg5htrDjKPEeB%2FHweUOQULFv4HTekFpyBQqyhq0CodJ0z5zsQXk30tVEi4SKHnlkKJr8FlOz&X-Amz-Signature=dc852f0fb26eb5756993af464940148af33f66784647f67c76d2ea53f3ea18a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TI3P63XL%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T020313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCMwPsKnBfUNpzAnhXvh279nzCJ4TK4NqSM5rhZF1FaTgIgaWFT8%2FLcd%2FwYliyOmIzAsBCSdkPQbL%2FLKvSFp6urQ80qiAQIqf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEu7UhGrrnprQKEBnSrcAymTqrkB7xx0xXwGxOTmR%2FWseFjZ%2BIab3znD%2BA2zN92IKhO2dRk22FZQsJ45ZfetXBEV0GGSxZmdxZqS%2F592Kzfj3890Z%2B9IiA1WhNhWgNXDBwDkaoTR8x9%2FucQti1vCoV4VBmvYaelnABbjSD0EavLH5%2BH%2FSSjTjBhdKnrw6vUkfsm%2BTgf5sZkYhCv3QI1z2rmmrS7Txrtse%2BzvXYZGC72SGK3lSML8fws%2B%2Bi8VpKAbAlse6MEUaSrIlc%2Bafy589QrhramXv6b%2F%2BhqwK%2FmJcFtZjsftXAD3f0j8gNv4CjmU%2FlBbyBLmjGvF7WBc2qL%2F9Yf%2BAhPRi6qu%2B%2FGRSJXHQ7e4kDalepJH%2FZnIdG4IzGwNCDvnKy8Pxy930UEZLx2E5xrBtRsWBHkawDWFTWAi9AdS9chU%2Fom2a37jN97KnmyR3GKP25lzns%2FfyFEqpMea8nKiFFFHKg3b5qeHcV6PtGJu3wLiVK51Yx9u6XoBa31eZHYczO6CkL1s2OW%2FWGFFPR5iel8XVmPzIMKpvmi%2Fp9O0NREQsoRcG2XvKlBJrcrHYgzH%2BfUBNqwTaVcZWgezhgekKMU6q7IflUVeV4eyHdeMhPUQwxz71YLbG8V3%2BwY7WnqLQAs7gjno95U7MIqsktUGOqUBqlpDgrLK%2BR9D9435U%2B2AmKBz%2FqBJcxtKNah%2B7%2B2UBWgCMB8ZYPC2Dg2N%2FwTe%2FqTxo3q7snZsREuZFrJnvF%2Bj82o4D7i4I2e46fqAhbqR5Iml%2BlIdr9fOtzGUIw%2FyGmtXPOdtQ7jIWMZjDXoxFieKKg5htrDjKPEeB%2FHweUOQULFv4HTekFpyBQqyhq0CodJ0z5zsQXk30tVEi4SKHnlkKJr8FlOz&X-Amz-Signature=5bac751b372fe147eb7a4cc314cf19d5415bf53196041ba0ad3dfd19da82f470&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TI3P63XL%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T020313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCMwPsKnBfUNpzAnhXvh279nzCJ4TK4NqSM5rhZF1FaTgIgaWFT8%2FLcd%2FwYliyOmIzAsBCSdkPQbL%2FLKvSFp6urQ80qiAQIqf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEu7UhGrrnprQKEBnSrcAymTqrkB7xx0xXwGxOTmR%2FWseFjZ%2BIab3znD%2BA2zN92IKhO2dRk22FZQsJ45ZfetXBEV0GGSxZmdxZqS%2F592Kzfj3890Z%2B9IiA1WhNhWgNXDBwDkaoTR8x9%2FucQti1vCoV4VBmvYaelnABbjSD0EavLH5%2BH%2FSSjTjBhdKnrw6vUkfsm%2BTgf5sZkYhCv3QI1z2rmmrS7Txrtse%2BzvXYZGC72SGK3lSML8fws%2B%2Bi8VpKAbAlse6MEUaSrIlc%2Bafy589QrhramXv6b%2F%2BhqwK%2FmJcFtZjsftXAD3f0j8gNv4CjmU%2FlBbyBLmjGvF7WBc2qL%2F9Yf%2BAhPRi6qu%2B%2FGRSJXHQ7e4kDalepJH%2FZnIdG4IzGwNCDvnKy8Pxy930UEZLx2E5xrBtRsWBHkawDWFTWAi9AdS9chU%2Fom2a37jN97KnmyR3GKP25lzns%2FfyFEqpMea8nKiFFFHKg3b5qeHcV6PtGJu3wLiVK51Yx9u6XoBa31eZHYczO6CkL1s2OW%2FWGFFPR5iel8XVmPzIMKpvmi%2Fp9O0NREQsoRcG2XvKlBJrcrHYgzH%2BfUBNqwTaVcZWgezhgekKMU6q7IflUVeV4eyHdeMhPUQwxz71YLbG8V3%2BwY7WnqLQAs7gjno95U7MIqsktUGOqUBqlpDgrLK%2BR9D9435U%2B2AmKBz%2FqBJcxtKNah%2B7%2B2UBWgCMB8ZYPC2Dg2N%2FwTe%2FqTxo3q7snZsREuZFrJnvF%2Bj82o4D7i4I2e46fqAhbqR5Iml%2BlIdr9fOtzGUIw%2FyGmtXPOdtQ7jIWMZjDXoxFieKKg5htrDjKPEeB%2FHweUOQULFv4HTekFpyBQqyhq0CodJ0z5zsQXk30tVEi4SKHnlkKJr8FlOz&X-Amz-Signature=62dc7d438e9f2dd3272606155d36227c15e62a151adc4623ead4c2e41b382376&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TI3P63XL%2F20260912%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260912T020313Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCMwPsKnBfUNpzAnhXvh279nzCJ4TK4NqSM5rhZF1FaTgIgaWFT8%2FLcd%2FwYliyOmIzAsBCSdkPQbL%2FLKvSFp6urQ80qiAQIqf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDEu7UhGrrnprQKEBnSrcAymTqrkB7xx0xXwGxOTmR%2FWseFjZ%2BIab3znD%2BA2zN92IKhO2dRk22FZQsJ45ZfetXBEV0GGSxZmdxZqS%2F592Kzfj3890Z%2B9IiA1WhNhWgNXDBwDkaoTR8x9%2FucQti1vCoV4VBmvYaelnABbjSD0EavLH5%2BH%2FSSjTjBhdKnrw6vUkfsm%2BTgf5sZkYhCv3QI1z2rmmrS7Txrtse%2BzvXYZGC72SGK3lSML8fws%2B%2Bi8VpKAbAlse6MEUaSrIlc%2Bafy589QrhramXv6b%2F%2BhqwK%2FmJcFtZjsftXAD3f0j8gNv4CjmU%2FlBbyBLmjGvF7WBc2qL%2F9Yf%2BAhPRi6qu%2B%2FGRSJXHQ7e4kDalepJH%2FZnIdG4IzGwNCDvnKy8Pxy930UEZLx2E5xrBtRsWBHkawDWFTWAi9AdS9chU%2Fom2a37jN97KnmyR3GKP25lzns%2FfyFEqpMea8nKiFFFHKg3b5qeHcV6PtGJu3wLiVK51Yx9u6XoBa31eZHYczO6CkL1s2OW%2FWGFFPR5iel8XVmPzIMKpvmi%2Fp9O0NREQsoRcG2XvKlBJrcrHYgzH%2BfUBNqwTaVcZWgezhgekKMU6q7IflUVeV4eyHdeMhPUQwxz71YLbG8V3%2BwY7WnqLQAs7gjno95U7MIqsktUGOqUBqlpDgrLK%2BR9D9435U%2B2AmKBz%2FqBJcxtKNah%2B7%2B2UBWgCMB8ZYPC2Dg2N%2FwTe%2FqTxo3q7snZsREuZFrJnvF%2Bj82o4D7i4I2e46fqAhbqR5Iml%2BlIdr9fOtzGUIw%2FyGmtXPOdtQ7jIWMZjDXoxFieKKg5htrDjKPEeB%2FHweUOQULFv4HTekFpyBQqyhq0CodJ0z5zsQXk30tVEi4SKHnlkKJr8FlOz&X-Amz-Signature=cbb01b679f3e9636c102606c63023618014048aae656334f742825dde6344ecd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
