基于 dio 封装的网络请求框架
-------------
### 项目简介
    项目中基本会用到网络请求，flutter 中有 dio 网络请求框架项目地址：https://github.com/flutterchina/dio，
    而在实际开发中我们在请求的时候会添加一些头部信息和后台进行一些校验和一些公共信息的传递如版本号等，同时针对返回的
    信息我们会定义一套数据结构模版如前后台协同定义的状态码，如区分token失效等，所以在开发中我们需要对网络框架进行进
    一步的封装来达到统一处理类似切面编程的效果，同时对网络请求框架进行进一步封装之后也方便后期对网络请求框架的替换，
    因为在实际的使用中我们是可以不引用网络框架代码的。
### 使用方式
    1、在项目中的 pubspec.yaml 文件中添加 dio: 2.1.13 的支持
    2、将本项目中 lib 下 http_util 包考进自己项目中
    3、在需要使用的地方导入 MyHttpUtil.dart、BaseResponse.dart、RequestListener.dart文件
    4、发送请求：
    //Post请求
    _sendPostRequest() {
        MyHttpUtil.instance.post(
            "musicBroadcastingDetails?channelname=public_tuijian_spring",
            RequestListener(
                onSuccessListener: (BaseResponse data) => _onResponseSuccess(data),
                onErrorListener: (BaseResponse errorData) => _onResponseError(errorData)
            )
        );
    }
    
    //Get请求
    _sendGetRequest() {
        MyHttpUtil.instance.get(
            "musicBroadcastingDetails?channelname=public_tuijian_spring",
            RequestListener(
                onSuccessListener: (BaseResponse data) => _onResponseSuccess(data),
                onErrorListener: (BaseResponse errorData) => _onResponseError(errorData)
            )
        );
    }
    5、如果需要添加请求头、拦截器，修改一些参数，在MyHttpUtil.dart中进行修改，参考备注
### 友情提示
    习惯安卓开发的朋友可能习惯来安卓 json 解析的方式，在 flutter 开发时候对 flutter json 解析可能一下不是很适应，
    因为 flutter json 解析需要额外做一些处理，可以参考下面这篇文章
[在 Flutter 中解析复杂的 JSON](https://github.com/xitu/gold-miner/blob/master/TODO1/parsing-complex-json-in-flutter.md)
### demo 代码运行效果如下
  <img src="https://github.com/zhoujiulong/flutter_http_utils/blob/master/img/img_a.png?raw=true" width="30%"/>

