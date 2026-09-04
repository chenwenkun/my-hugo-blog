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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WBUBDNZY%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T200025Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJIMEYCIQD0FJ%2BV7LK%2BfCah9OmpA77deiPtLe6dmomPuy%2BYy0jKhwIhAOIl4WGL8qY0yjcI2S5s6y%2F%2B%2FdCi%2Fkh4Dt0BOJEOrdQoKogECP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVbmO%2BgadCO%2BoODagq3AOHwZKDjljnD6pnXchXEOywdWnRc1G7FzDGwCkDP1wdn2hCQRBGrvyBnNk%2BmZvD0JZkTcUn2vdX8SHwm39Ej9V1Mm8Bp23WQH4J0P64%2FmiXuXtlBeBhdcMOBOI6p6lxhof0QyQq89QzddNFk6%2FiQXcyBOPBy%2BNcCC55PiE1jbJa8fTfcwjp4hTgTrwgc8Z0NqffzHxzf7GtlQ7Ya5hyddd0ATetGxvcI%2FPVEpfbV03j8ije3%2BQahA9rH%2BjS5kclLoOxNIFLKO2lL9Q6xMuVsHg746fjwB09yWdJJSPe0yguDdxzgaGi0FHmYNjKSv4lf7G0be5unrbLtLe4ojbKpm%2B%2Bb%2BT0%2FfPVmQXYtf3ED1C9P8L5jcptjqXXJce2WzNlEdir1X9QoeWhsSg%2Bp07xZYim8VQjNCg9uwxT1yUrKr3X7PtADMuFUcooCoRa9tWhTuOdj5%2Fsd5S6Q%2B950ol0B1XZ36B%2BiNJ7nDng1LXeCNY%2B6rPGGsIPcyCRCOAVhHZ0D%2B0PY9JVhxECDEuNUn0zSVvqCJmm3SP2DtldeadcTjcagD3v0OeoRS3VNZ%2FC9RTkprUU7PrRlCF6X8ar%2BYlR8kw%2FuNDZ5BnsXs0lqBdaafAM7snGndX3MVpAzd5CmzCzvuzUBjqkAXEkas6RxBZEr34jV8C%2BcyhSPVry5ASW90%2FiFNUhhfrFN5ODhrbbEqC4xE9VEssL4zZKTueHE%2B36OJRZWie4zVSUBum1enLvXyW66G8EiHNFGOKfmKE6ANdFz%2Fz4akIRtlqY8MBPB76EZoi41WhMjX%2F9CH0kqMpd4aGJ55iTU4jSHR0xlZHwRtz3L6GXx8g4g8yCBexIStLPewtLYPJS65JA3YaP&X-Amz-Signature=620cd93a384e0ab51f6ec1b91a466ad4b65014fdae9fd5ae07da21c7b28506c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WBUBDNZY%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T200025Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJIMEYCIQD0FJ%2BV7LK%2BfCah9OmpA77deiPtLe6dmomPuy%2BYy0jKhwIhAOIl4WGL8qY0yjcI2S5s6y%2F%2B%2FdCi%2Fkh4Dt0BOJEOrdQoKogECP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVbmO%2BgadCO%2BoODagq3AOHwZKDjljnD6pnXchXEOywdWnRc1G7FzDGwCkDP1wdn2hCQRBGrvyBnNk%2BmZvD0JZkTcUn2vdX8SHwm39Ej9V1Mm8Bp23WQH4J0P64%2FmiXuXtlBeBhdcMOBOI6p6lxhof0QyQq89QzddNFk6%2FiQXcyBOPBy%2BNcCC55PiE1jbJa8fTfcwjp4hTgTrwgc8Z0NqffzHxzf7GtlQ7Ya5hyddd0ATetGxvcI%2FPVEpfbV03j8ije3%2BQahA9rH%2BjS5kclLoOxNIFLKO2lL9Q6xMuVsHg746fjwB09yWdJJSPe0yguDdxzgaGi0FHmYNjKSv4lf7G0be5unrbLtLe4ojbKpm%2B%2Bb%2BT0%2FfPVmQXYtf3ED1C9P8L5jcptjqXXJce2WzNlEdir1X9QoeWhsSg%2Bp07xZYim8VQjNCg9uwxT1yUrKr3X7PtADMuFUcooCoRa9tWhTuOdj5%2Fsd5S6Q%2B950ol0B1XZ36B%2BiNJ7nDng1LXeCNY%2B6rPGGsIPcyCRCOAVhHZ0D%2B0PY9JVhxECDEuNUn0zSVvqCJmm3SP2DtldeadcTjcagD3v0OeoRS3VNZ%2FC9RTkprUU7PrRlCF6X8ar%2BYlR8kw%2FuNDZ5BnsXs0lqBdaafAM7snGndX3MVpAzd5CmzCzvuzUBjqkAXEkas6RxBZEr34jV8C%2BcyhSPVry5ASW90%2FiFNUhhfrFN5ODhrbbEqC4xE9VEssL4zZKTueHE%2B36OJRZWie4zVSUBum1enLvXyW66G8EiHNFGOKfmKE6ANdFz%2Fz4akIRtlqY8MBPB76EZoi41WhMjX%2F9CH0kqMpd4aGJ55iTU4jSHR0xlZHwRtz3L6GXx8g4g8yCBexIStLPewtLYPJS65JA3YaP&X-Amz-Signature=bfb8bf8122a8b4d01c99e9f865115954e9af52aa57f5131770143afaf835395a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WBUBDNZY%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T200025Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJIMEYCIQD0FJ%2BV7LK%2BfCah9OmpA77deiPtLe6dmomPuy%2BYy0jKhwIhAOIl4WGL8qY0yjcI2S5s6y%2F%2B%2FdCi%2Fkh4Dt0BOJEOrdQoKogECP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVbmO%2BgadCO%2BoODagq3AOHwZKDjljnD6pnXchXEOywdWnRc1G7FzDGwCkDP1wdn2hCQRBGrvyBnNk%2BmZvD0JZkTcUn2vdX8SHwm39Ej9V1Mm8Bp23WQH4J0P64%2FmiXuXtlBeBhdcMOBOI6p6lxhof0QyQq89QzddNFk6%2FiQXcyBOPBy%2BNcCC55PiE1jbJa8fTfcwjp4hTgTrwgc8Z0NqffzHxzf7GtlQ7Ya5hyddd0ATetGxvcI%2FPVEpfbV03j8ije3%2BQahA9rH%2BjS5kclLoOxNIFLKO2lL9Q6xMuVsHg746fjwB09yWdJJSPe0yguDdxzgaGi0FHmYNjKSv4lf7G0be5unrbLtLe4ojbKpm%2B%2Bb%2BT0%2FfPVmQXYtf3ED1C9P8L5jcptjqXXJce2WzNlEdir1X9QoeWhsSg%2Bp07xZYim8VQjNCg9uwxT1yUrKr3X7PtADMuFUcooCoRa9tWhTuOdj5%2Fsd5S6Q%2B950ol0B1XZ36B%2BiNJ7nDng1LXeCNY%2B6rPGGsIPcyCRCOAVhHZ0D%2B0PY9JVhxECDEuNUn0zSVvqCJmm3SP2DtldeadcTjcagD3v0OeoRS3VNZ%2FC9RTkprUU7PrRlCF6X8ar%2BYlR8kw%2FuNDZ5BnsXs0lqBdaafAM7snGndX3MVpAzd5CmzCzvuzUBjqkAXEkas6RxBZEr34jV8C%2BcyhSPVry5ASW90%2FiFNUhhfrFN5ODhrbbEqC4xE9VEssL4zZKTueHE%2B36OJRZWie4zVSUBum1enLvXyW66G8EiHNFGOKfmKE6ANdFz%2Fz4akIRtlqY8MBPB76EZoi41WhMjX%2F9CH0kqMpd4aGJ55iTU4jSHR0xlZHwRtz3L6GXx8g4g8yCBexIStLPewtLYPJS65JA3YaP&X-Amz-Signature=a06846b174707f034d1a3b9f754d953638d817446402f02a40cc010dc1268db4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WBUBDNZY%2F20260904%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260904T200025Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDQaCXVzLXdlc3QtMiJIMEYCIQD0FJ%2BV7LK%2BfCah9OmpA77deiPtLe6dmomPuy%2BYy0jKhwIhAOIl4WGL8qY0yjcI2S5s6y%2F%2B%2FdCi%2Fkh4Dt0BOJEOrdQoKogECP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVbmO%2BgadCO%2BoODagq3AOHwZKDjljnD6pnXchXEOywdWnRc1G7FzDGwCkDP1wdn2hCQRBGrvyBnNk%2BmZvD0JZkTcUn2vdX8SHwm39Ej9V1Mm8Bp23WQH4J0P64%2FmiXuXtlBeBhdcMOBOI6p6lxhof0QyQq89QzddNFk6%2FiQXcyBOPBy%2BNcCC55PiE1jbJa8fTfcwjp4hTgTrwgc8Z0NqffzHxzf7GtlQ7Ya5hyddd0ATetGxvcI%2FPVEpfbV03j8ije3%2BQahA9rH%2BjS5kclLoOxNIFLKO2lL9Q6xMuVsHg746fjwB09yWdJJSPe0yguDdxzgaGi0FHmYNjKSv4lf7G0be5unrbLtLe4ojbKpm%2B%2Bb%2BT0%2FfPVmQXYtf3ED1C9P8L5jcptjqXXJce2WzNlEdir1X9QoeWhsSg%2Bp07xZYim8VQjNCg9uwxT1yUrKr3X7PtADMuFUcooCoRa9tWhTuOdj5%2Fsd5S6Q%2B950ol0B1XZ36B%2BiNJ7nDng1LXeCNY%2B6rPGGsIPcyCRCOAVhHZ0D%2B0PY9JVhxECDEuNUn0zSVvqCJmm3SP2DtldeadcTjcagD3v0OeoRS3VNZ%2FC9RTkprUU7PrRlCF6X8ar%2BYlR8kw%2FuNDZ5BnsXs0lqBdaafAM7snGndX3MVpAzd5CmzCzvuzUBjqkAXEkas6RxBZEr34jV8C%2BcyhSPVry5ASW90%2FiFNUhhfrFN5ODhrbbEqC4xE9VEssL4zZKTueHE%2B36OJRZWie4zVSUBum1enLvXyW66G8EiHNFGOKfmKE6ANdFz%2Fz4akIRtlqY8MBPB76EZoi41WhMjX%2F9CH0kqMpd4aGJ55iTU4jSHR0xlZHwRtz3L6GXx8g4g8yCBexIStLPewtLYPJS65JA3YaP&X-Amz-Signature=bfa573c7a881cdd40ad6c7f5de9a904fa907b235414e372bb3bd00fb087b7569&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
