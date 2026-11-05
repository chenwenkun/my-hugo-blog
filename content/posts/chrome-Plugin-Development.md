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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663LEPHYMT%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T040811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFW7XMgS5%2FUnIg0d5%2FFsChWG7lL6Sq7Vl1k3HpY3yWDjAiEAw0k3gFQWGhzlH7pfHaif2glcUreVM5SBu5ZtPvmSJ%2FYqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKijzeWmt5l8HjQ5OyrcAx%2FYDEJ463R%2B459g2EGQ5%2FdAKGl0FdHBAPf1l1ZUmmnngCAvHDQPEVQfuWjcT3q4KXPaL8QgEqA8vLuyXDz%2BC3%2BD3CuVx1DCMF3PxVg6bXXkVGKvYZ7TlwwqZ3qCd9X4XyzGNegYtM0%2FnQpZiZPA6k8VdCrwtcjs7mfbvEqOj1bZzsT7zQtLSJ1B6ifhOxnPkc20XLlsSdFN%2F%2B3cqa1Elqz80df3NxGVkU9Cjypo2XGzuRD13B%2BBnGshYjTEk9jRnhBVo08QFM20f1E4OVJOdWXccSUXE66u38kAiEuXUD10LWwakA2zAeirh5jcFaBu%2FXVeHbEdkU4n0Q6x23btYCftO66213eS3hjybHpfZZ30rmrLnuRMuaF9m0z2vfmWYJenjubrnJOs565eKI0JlospegjxDvGR2P%2F8jlKjtdmS8ii9EoW9LmS%2BEh0EABAAxsTZTw5ci1C847tTCarqzEgBSuLo%2FjeWGtdsmmjnDFOpl174lO4xM8Rp%2F%2FcfVU%2BCHJN0KWz%2Bp0ovpFF%2FUL7OkpnU3E%2FH3EoiaQEvY7dmtxUrfUN%2FOJCi8TLnUS3Kg1WinmtYyIQGq04kRfvEqUeYG91hsFbljoAhVz4yFBMGJfWdu%2FXc4DtPlv%2B0AyiLMLvLr9cGOqUBKxdI%2BjMx%2BbnpucrT5FLyr8JtbAtAhPwofN369mz6tC8cbeRdWuCU%2BU8LaY%2BkaLiQ8XD56pAh9cEI%2BQ2lcEMTW%2Flp6fSont6%2Ba%2FTrDMVpo%2FXsArro6WSOLljiKQC140YESn148yVhWpf6pi2%2ByK0GE1WR84SuXwowFiPygVUdqyavMp9T%2BnpdR7tVDv0IpTlueWcWOCZD%2F15lIY5uSbPzUhMsobaq&X-Amz-Signature=e011f79acc90acfcbd76e5200eea5792f82214ad23cb687f07d358ec2202507a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663LEPHYMT%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T040811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFW7XMgS5%2FUnIg0d5%2FFsChWG7lL6Sq7Vl1k3HpY3yWDjAiEAw0k3gFQWGhzlH7pfHaif2glcUreVM5SBu5ZtPvmSJ%2FYqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKijzeWmt5l8HjQ5OyrcAx%2FYDEJ463R%2B459g2EGQ5%2FdAKGl0FdHBAPf1l1ZUmmnngCAvHDQPEVQfuWjcT3q4KXPaL8QgEqA8vLuyXDz%2BC3%2BD3CuVx1DCMF3PxVg6bXXkVGKvYZ7TlwwqZ3qCd9X4XyzGNegYtM0%2FnQpZiZPA6k8VdCrwtcjs7mfbvEqOj1bZzsT7zQtLSJ1B6ifhOxnPkc20XLlsSdFN%2F%2B3cqa1Elqz80df3NxGVkU9Cjypo2XGzuRD13B%2BBnGshYjTEk9jRnhBVo08QFM20f1E4OVJOdWXccSUXE66u38kAiEuXUD10LWwakA2zAeirh5jcFaBu%2FXVeHbEdkU4n0Q6x23btYCftO66213eS3hjybHpfZZ30rmrLnuRMuaF9m0z2vfmWYJenjubrnJOs565eKI0JlospegjxDvGR2P%2F8jlKjtdmS8ii9EoW9LmS%2BEh0EABAAxsTZTw5ci1C847tTCarqzEgBSuLo%2FjeWGtdsmmjnDFOpl174lO4xM8Rp%2F%2FcfVU%2BCHJN0KWz%2Bp0ovpFF%2FUL7OkpnU3E%2FH3EoiaQEvY7dmtxUrfUN%2FOJCi8TLnUS3Kg1WinmtYyIQGq04kRfvEqUeYG91hsFbljoAhVz4yFBMGJfWdu%2FXc4DtPlv%2B0AyiLMLvLr9cGOqUBKxdI%2BjMx%2BbnpucrT5FLyr8JtbAtAhPwofN369mz6tC8cbeRdWuCU%2BU8LaY%2BkaLiQ8XD56pAh9cEI%2BQ2lcEMTW%2Flp6fSont6%2Ba%2FTrDMVpo%2FXsArro6WSOLljiKQC140YESn148yVhWpf6pi2%2ByK0GE1WR84SuXwowFiPygVUdqyavMp9T%2BnpdR7tVDv0IpTlueWcWOCZD%2F15lIY5uSbPzUhMsobaq&X-Amz-Signature=5007bbd022ec3075f4adfa3d07832f3c0ccff43be34404f2bbd8c197f7df7413&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663LEPHYMT%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T040811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFW7XMgS5%2FUnIg0d5%2FFsChWG7lL6Sq7Vl1k3HpY3yWDjAiEAw0k3gFQWGhzlH7pfHaif2glcUreVM5SBu5ZtPvmSJ%2FYqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKijzeWmt5l8HjQ5OyrcAx%2FYDEJ463R%2B459g2EGQ5%2FdAKGl0FdHBAPf1l1ZUmmnngCAvHDQPEVQfuWjcT3q4KXPaL8QgEqA8vLuyXDz%2BC3%2BD3CuVx1DCMF3PxVg6bXXkVGKvYZ7TlwwqZ3qCd9X4XyzGNegYtM0%2FnQpZiZPA6k8VdCrwtcjs7mfbvEqOj1bZzsT7zQtLSJ1B6ifhOxnPkc20XLlsSdFN%2F%2B3cqa1Elqz80df3NxGVkU9Cjypo2XGzuRD13B%2BBnGshYjTEk9jRnhBVo08QFM20f1E4OVJOdWXccSUXE66u38kAiEuXUD10LWwakA2zAeirh5jcFaBu%2FXVeHbEdkU4n0Q6x23btYCftO66213eS3hjybHpfZZ30rmrLnuRMuaF9m0z2vfmWYJenjubrnJOs565eKI0JlospegjxDvGR2P%2F8jlKjtdmS8ii9EoW9LmS%2BEh0EABAAxsTZTw5ci1C847tTCarqzEgBSuLo%2FjeWGtdsmmjnDFOpl174lO4xM8Rp%2F%2FcfVU%2BCHJN0KWz%2Bp0ovpFF%2FUL7OkpnU3E%2FH3EoiaQEvY7dmtxUrfUN%2FOJCi8TLnUS3Kg1WinmtYyIQGq04kRfvEqUeYG91hsFbljoAhVz4yFBMGJfWdu%2FXc4DtPlv%2B0AyiLMLvLr9cGOqUBKxdI%2BjMx%2BbnpucrT5FLyr8JtbAtAhPwofN369mz6tC8cbeRdWuCU%2BU8LaY%2BkaLiQ8XD56pAh9cEI%2BQ2lcEMTW%2Flp6fSont6%2Ba%2FTrDMVpo%2FXsArro6WSOLljiKQC140YESn148yVhWpf6pi2%2ByK0GE1WR84SuXwowFiPygVUdqyavMp9T%2BnpdR7tVDv0IpTlueWcWOCZD%2F15lIY5uSbPzUhMsobaq&X-Amz-Signature=e18f8945c2866703f9e0c492e48f52ea6255dfcec195f998096fdf5f3a88e3e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663LEPHYMT%2F20261105%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20261105T040811Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFW7XMgS5%2FUnIg0d5%2FFsChWG7lL6Sq7Vl1k3HpY3yWDjAiEAw0k3gFQWGhzlH7pfHaif2glcUreVM5SBu5ZtPvmSJ%2FYqiAQIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKijzeWmt5l8HjQ5OyrcAx%2FYDEJ463R%2B459g2EGQ5%2FdAKGl0FdHBAPf1l1ZUmmnngCAvHDQPEVQfuWjcT3q4KXPaL8QgEqA8vLuyXDz%2BC3%2BD3CuVx1DCMF3PxVg6bXXkVGKvYZ7TlwwqZ3qCd9X4XyzGNegYtM0%2FnQpZiZPA6k8VdCrwtcjs7mfbvEqOj1bZzsT7zQtLSJ1B6ifhOxnPkc20XLlsSdFN%2F%2B3cqa1Elqz80df3NxGVkU9Cjypo2XGzuRD13B%2BBnGshYjTEk9jRnhBVo08QFM20f1E4OVJOdWXccSUXE66u38kAiEuXUD10LWwakA2zAeirh5jcFaBu%2FXVeHbEdkU4n0Q6x23btYCftO66213eS3hjybHpfZZ30rmrLnuRMuaF9m0z2vfmWYJenjubrnJOs565eKI0JlospegjxDvGR2P%2F8jlKjtdmS8ii9EoW9LmS%2BEh0EABAAxsTZTw5ci1C847tTCarqzEgBSuLo%2FjeWGtdsmmjnDFOpl174lO4xM8Rp%2F%2FcfVU%2BCHJN0KWz%2Bp0ovpFF%2FUL7OkpnU3E%2FH3EoiaQEvY7dmtxUrfUN%2FOJCi8TLnUS3Kg1WinmtYyIQGq04kRfvEqUeYG91hsFbljoAhVz4yFBMGJfWdu%2FXc4DtPlv%2B0AyiLMLvLr9cGOqUBKxdI%2BjMx%2BbnpucrT5FLyr8JtbAtAhPwofN369mz6tC8cbeRdWuCU%2BU8LaY%2BkaLiQ8XD56pAh9cEI%2BQ2lcEMTW%2Flp6fSont6%2Ba%2FTrDMVpo%2FXsArro6WSOLljiKQC140YESn148yVhWpf6pi2%2ByK0GE1WR84SuXwowFiPygVUdqyavMp9T%2BnpdR7tVDv0IpTlueWcWOCZD%2F15lIY5uSbPzUhMsobaq&X-Amz-Signature=399b8989d62cb64c90fdcbc89d7225212fb962ac7ace1b561a4bc99a1374fd9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
