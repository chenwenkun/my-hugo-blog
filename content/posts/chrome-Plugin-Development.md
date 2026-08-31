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
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/7ca8990d-2ef0-4ad6-8256-c807dbb8b3d5/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AXYZDOG%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T220925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD8Gz8v8RwMk8AKzsPXTn%2FUeHHmP8dH%2BbUGwOWLrHUE4gIgVxqTAgOeHA6UYBwtzjldt12S0YdMRTQmejBqETE2hXoqiAQIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJ0vvkic9lFmAjC0dyrcA7onE7g1IH%2BOc4daqfzDvfN7prWnlxMYW%2B2aYywAd9w9g5aP4HB5I8FALHMymGA2iVl9vXgEadkxDJIXkSON%2FpsZDHFy6J%2FVEe5kH0KkHfXizmBFJxcHIGqv1lLR8G8gzym%2BvWEJXOQi8vtLylDziVfjADRgCsl6HZ4HGDMnBhO%2Fln%2FbLkXICZhvmch23uCSV2sPCplktTDIdhlHJW0xCG7d7x578slL3uZJiGXpa%2FF5Yha7PG%2FoRUORAtVkes4KrT8l6nXjzf3V3eyOK7rdXUiZiQzg477DMtwuvXhZKmQ%2F8%2BeL7yuy%2BZq%2F%2F3yEEdGdGrlFq11dW9veqDBjPZvBrQERDIPpT3hYNVwtFfqoYe3nQXlK50gaeTFC5K05uDa3Cd0lcJvabgzCE8USoivyHBC9XvkVSwSVpeSla6qnUvjuPH6Ft6MGa6hLsqOLXkO9efK7PDakWkFuBqlC8ff6QCfy%2Bxtlao%2F%2Bu7orsYwDToZnXJ5HFxajm6jVYN9IShJy1cg8ppDThIZ%2FymQ14r48pz8%2FeaN4ssGiBmxcgnfrUO4oVLKZz53e8H%2BKSlJyij7gco312FvJ27IGUfShV4G7c%2FXr8PnMWtFkEoba2lDkAqn0gM6Bl%2FCygqeIewtmMJvw19QGOqUBSRrvKH2eYUdLdV%2B1twqnjdT9%2Bl84KY%2BS8FeF3IPiOt1yhNyQ5knQrom71dWkhQOxhIeFnNc3xjs04ACrycTtpUtznLU9NEz3jrTPA3D9Zu4FsHRMdLqsotJcBQp7XOIG1lKNFPyLfHud6rFxYQt%2FLUZBgs%2BpQTcN%2B7MddSUgtL9I3vFSm%2FxfvDAAQOdMLYFSDhwSs5G9YwC6teSiOiHi3yr9f4se&X-Amz-Signature=ff53bd213bc54dfa7a331a82eee65e1883773dbaca585f3f31df80269d7afb8b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 4）禅道测试单自动获取对应字段，批量创建测试单

**用途：**

- 从禅道页面/接口读取字段
- 批量生成测试单，减少人工复制粘贴
![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/1ea39b01-dd1c-4a56-bb09-4fe87447f5c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AXYZDOG%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T220925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD8Gz8v8RwMk8AKzsPXTn%2FUeHHmP8dH%2BbUGwOWLrHUE4gIgVxqTAgOeHA6UYBwtzjldt12S0YdMRTQmejBqETE2hXoqiAQIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJ0vvkic9lFmAjC0dyrcA7onE7g1IH%2BOc4daqfzDvfN7prWnlxMYW%2B2aYywAd9w9g5aP4HB5I8FALHMymGA2iVl9vXgEadkxDJIXkSON%2FpsZDHFy6J%2FVEe5kH0KkHfXizmBFJxcHIGqv1lLR8G8gzym%2BvWEJXOQi8vtLylDziVfjADRgCsl6HZ4HGDMnBhO%2Fln%2FbLkXICZhvmch23uCSV2sPCplktTDIdhlHJW0xCG7d7x578slL3uZJiGXpa%2FF5Yha7PG%2FoRUORAtVkes4KrT8l6nXjzf3V3eyOK7rdXUiZiQzg477DMtwuvXhZKmQ%2F8%2BeL7yuy%2BZq%2F%2F3yEEdGdGrlFq11dW9veqDBjPZvBrQERDIPpT3hYNVwtFfqoYe3nQXlK50gaeTFC5K05uDa3Cd0lcJvabgzCE8USoivyHBC9XvkVSwSVpeSla6qnUvjuPH6Ft6MGa6hLsqOLXkO9efK7PDakWkFuBqlC8ff6QCfy%2Bxtlao%2F%2Bu7orsYwDToZnXJ5HFxajm6jVYN9IShJy1cg8ppDThIZ%2FymQ14r48pz8%2FeaN4ssGiBmxcgnfrUO4oVLKZz53e8H%2BKSlJyij7gco312FvJ27IGUfShV4G7c%2FXr8PnMWtFkEoba2lDkAqn0gM6Bl%2FCygqeIewtmMJvw19QGOqUBSRrvKH2eYUdLdV%2B1twqnjdT9%2Bl84KY%2BS8FeF3IPiOt1yhNyQ5knQrom71dWkhQOxhIeFnNc3xjs04ACrycTtpUtznLU9NEz3jrTPA3D9Zu4FsHRMdLqsotJcBQp7XOIG1lKNFPyLfHud6rFxYQt%2FLUZBgs%2BpQTcN%2B7MddSUgtL9I3vFSm%2FxfvDAAQOdMLYFSDhwSs5G9YwC6teSiOiHi3yr9f4se&X-Amz-Signature=20c8dd00137ebe91d0ba9e0613d7317ad88931a659e4b403ac3f128fda625550&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/fa727f1d-546c-42aa-9508-d8d3d1275bcd/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AXYZDOG%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T220925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD8Gz8v8RwMk8AKzsPXTn%2FUeHHmP8dH%2BbUGwOWLrHUE4gIgVxqTAgOeHA6UYBwtzjldt12S0YdMRTQmejBqETE2hXoqiAQIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJ0vvkic9lFmAjC0dyrcA7onE7g1IH%2BOc4daqfzDvfN7prWnlxMYW%2B2aYywAd9w9g5aP4HB5I8FALHMymGA2iVl9vXgEadkxDJIXkSON%2FpsZDHFy6J%2FVEe5kH0KkHfXizmBFJxcHIGqv1lLR8G8gzym%2BvWEJXOQi8vtLylDziVfjADRgCsl6HZ4HGDMnBhO%2Fln%2FbLkXICZhvmch23uCSV2sPCplktTDIdhlHJW0xCG7d7x578slL3uZJiGXpa%2FF5Yha7PG%2FoRUORAtVkes4KrT8l6nXjzf3V3eyOK7rdXUiZiQzg477DMtwuvXhZKmQ%2F8%2BeL7yuy%2BZq%2F%2F3yEEdGdGrlFq11dW9veqDBjPZvBrQERDIPpT3hYNVwtFfqoYe3nQXlK50gaeTFC5K05uDa3Cd0lcJvabgzCE8USoivyHBC9XvkVSwSVpeSla6qnUvjuPH6Ft6MGa6hLsqOLXkO9efK7PDakWkFuBqlC8ff6QCfy%2Bxtlao%2F%2Bu7orsYwDToZnXJ5HFxajm6jVYN9IShJy1cg8ppDThIZ%2FymQ14r48pz8%2FeaN4ssGiBmxcgnfrUO4oVLKZz53e8H%2BKSlJyij7gco312FvJ27IGUfShV4G7c%2FXr8PnMWtFkEoba2lDkAqn0gM6Bl%2FCygqeIewtmMJvw19QGOqUBSRrvKH2eYUdLdV%2B1twqnjdT9%2Bl84KY%2BS8FeF3IPiOt1yhNyQ5knQrom71dWkhQOxhIeFnNc3xjs04ACrycTtpUtznLU9NEz3jrTPA3D9Zu4FsHRMdLqsotJcBQp7XOIG1lKNFPyLfHud6rFxYQt%2FLUZBgs%2BpQTcN%2B7MddSUgtL9I3vFSm%2FxfvDAAQOdMLYFSDhwSs5G9YwC6teSiOiHi3yr9f4se&X-Amz-Signature=ab96a9cf7f01ace4b997336ca987cb24d0093d30d3bec244543b2d2c8b9ef97d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/c205fb54-92b2-4987-8be3-972b67d27acc/2a374ca8-3be3-4978-8ee1-2331f1db0267/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665AXYZDOG%2F20260831%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260831T220925Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD8Gz8v8RwMk8AKzsPXTn%2FUeHHmP8dH%2BbUGwOWLrHUE4gIgVxqTAgOeHA6UYBwtzjldt12S0YdMRTQmejBqETE2hXoqiAQIn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJ0vvkic9lFmAjC0dyrcA7onE7g1IH%2BOc4daqfzDvfN7prWnlxMYW%2B2aYywAd9w9g5aP4HB5I8FALHMymGA2iVl9vXgEadkxDJIXkSON%2FpsZDHFy6J%2FVEe5kH0KkHfXizmBFJxcHIGqv1lLR8G8gzym%2BvWEJXOQi8vtLylDziVfjADRgCsl6HZ4HGDMnBhO%2Fln%2FbLkXICZhvmch23uCSV2sPCplktTDIdhlHJW0xCG7d7x578slL3uZJiGXpa%2FF5Yha7PG%2FoRUORAtVkes4KrT8l6nXjzf3V3eyOK7rdXUiZiQzg477DMtwuvXhZKmQ%2F8%2BeL7yuy%2BZq%2F%2F3yEEdGdGrlFq11dW9veqDBjPZvBrQERDIPpT3hYNVwtFfqoYe3nQXlK50gaeTFC5K05uDa3Cd0lcJvabgzCE8USoivyHBC9XvkVSwSVpeSla6qnUvjuPH6Ft6MGa6hLsqOLXkO9efK7PDakWkFuBqlC8ff6QCfy%2Bxtlao%2F%2Bu7orsYwDToZnXJ5HFxajm6jVYN9IShJy1cg8ppDThIZ%2FymQ14r48pz8%2FeaN4ssGiBmxcgnfrUO4oVLKZz53e8H%2BKSlJyij7gco312FvJ27IGUfShV4G7c%2FXr8PnMWtFkEoba2lDkAqn0gM6Bl%2FCygqeIewtmMJvw19QGOqUBSRrvKH2eYUdLdV%2B1twqnjdT9%2Bl84KY%2BS8FeF3IPiOt1yhNyQ5knQrom71dWkhQOxhIeFnNc3xjs04ACrycTtpUtznLU9NEz3jrTPA3D9Zu4FsHRMdLqsotJcBQp7XOIG1lKNFPyLfHud6rFxYQt%2FLUZBgs%2BpQTcN%2B7MddSUgtL9I3vFSm%2FxfvDAAQOdMLYFSDhwSs5G9YwC6teSiOiHi3yr9f4se&X-Amz-Signature=531175b7430d5340f65fb35f75af6845a7bf3b13dc7cc4b17922bb07a497c5fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

---

## 待补充（可选）

如果你希望“更像作品展示页”，我可以继续补 2 个部分（需要你提供信息）：

- 插件的安装方式（Chrome Web Store / 手动加载 / 企业分发）
- 每个插件的适用场景与注意事项（例如权限、与公司内网的兼容性）
