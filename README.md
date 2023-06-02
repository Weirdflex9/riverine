# Flutter版 Demo App.

本项目包含GetX，国际化，Firebase上传，相册拍照，自动转JSON等。拥有较好的项目结构，比较规范的代码。 


### 运行本项目注意！！！

Support [√] Flutter (Channel stable, 3.10.0).

由于在国内访问Flutter有时可能会受到限制，clone项目后，请勿直接packages get，建议运行如下目录行：
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn  
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn  
flutter packages get
flutter run --release
```

### 项目结构
```
|-- assets              - 静态资源
|   |-- images          - 本地图片
|   |-- lottie          - lottie动画
|-- lib
|   |-- config          - 应用配置
|   |-- entity          - 数据模型
|   |-- generated       - 自动生成
|   |-- http            - 网络请求
|   |-- langs           - 多语言
|   |-- modules         - 页面
|   |   |-- home            - 首页
|   |   |-- login           - 登录
|   |   |-- main            - 容器
|   |   |-- map             - 地图
|   |   |-- profile         - 我的
|   |   |-- scan            - 扫码
|   |-- res             - 公共样式
|   |-- route           - 页面路由
|   |-- store           - 应用内通信
|   |-- util            - 工具类
|   |-- widget          - 自定义组件
|   |-- main.dart       - 应用入口
```

### 关于作者
```
GitHub : [Weirdflex9](https://github.com/Weirdflex9) 
Flutter交流QQ群 &nbsp;&nbsp;: 532403442(群内昵称：菜蛆|宁波|Flutter)
Email &nbsp;&nbsp;: 83962496@qq.com
QQ &nbsp;&nbsp;: 83962496
有任何问题欢迎随时联系我，提issue或加群或联系邮件或加qq~
```


### Android Studio 插件
```
1.FlutterJsonBeanFactory 用来json转model，android studio插件市场里搜索一下，本人觉得挺好用的，比较适配dio网络请求的泛型
2.GetX Getx的脚手架生成工具，android studio插件市场里搜索一下，在此鸣谢作者@小呆呆，使用教程网上一搜就有，很多~
```