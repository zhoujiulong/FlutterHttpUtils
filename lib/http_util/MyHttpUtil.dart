import 'package:dio/dio.dart';

import 'BaseResponse.dart';
import 'RequestListener.dart';

///网络请求工具类
class MyHttpUtil {
  static const String GET = "get";
  static const String POST = "post";
  static const int COMMON_REQUEST_ERROR = -1;

  Dio dio;
  static MyHttpUtil _instance;

  ///单例处理
  static MyHttpUtil getInstance() {
    if (_instance == null) {
      _instance = MyHttpUtil();
    }
    return _instance;
  }

  ///做一些初始化操作
  MyHttpUtil() {
    dio = Dio(BaseOptions(
      //项目域名，如果传的 url 是以 http 开头的会忽略此域名
      baseUrl: "https://api.apiopen.top/",
      //请求头
      headers: {'platform': 'android', 'version': 11.0},
      connectTimeout: 10000,
      receiveTimeout: 20000,
    ));
    _addStartHttpInterceptor(dio); //添加请求之前的拦截器
  }

  ///get请求
  ///如果 url 是以 http 开头的则忽略 baseUrl
  get(String url, RequestListener requestListener, {params}) async {
    _requestHttp(url, requestListener, GET, params);
  }

  ///post请求
  ///如果 url 是以 http 开头的则忽略 baseUrl
  post(String url, RequestListener requestListener, {params}) async {
    _requestHttp(url, requestListener, POST, params);
  }

  ///网络请求
  _requestHttp<T>(String url, RequestListener requestListener, [String method, FormData params]) async {
    try {
      Response<Map<String, dynamic>> response;
      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          response = await dio.get<Map<String, dynamic>>(url, queryParameters: params);
        } else {
          response = await dio.get<Map<String, dynamic>>(url);
        }
      } else if (method == POST) {
        if (params != null && params.isNotEmpty) {
          response = await dio.post<Map<String, dynamic>>(url, queryParameters: params);
        } else {
          response = await dio.post<Map<String, dynamic>>(url);
        }
      }

      if (response.statusCode != 200) {
        requestListener.onError(BaseResponse(response.statusCode, "请求失败", Map()));
        return;
      }

      //将返回的数据解析成定义的类，方便操作
      BaseResponse baseResponse = BaseResponse.fromJson(response.data);
      if (baseResponse.result == null) baseResponse.result = Map();
      //根据返回的状态进行处理，如需要添加 token 失效处理
      if (baseResponse.code == 200) {
        requestListener.onSuccess(baseResponse);
      } else {
        requestListener.onError(baseResponse);
      }
    } catch (exception) {
      requestListener.onError(BaseResponse(COMMON_REQUEST_ERROR, "请求失败", Map()));
    }
  }

  ///拦截处理
  _addStartHttpInterceptor(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // 在请求被发送之前做一些事情
      return options;
    }, onResponse: (Response response) {
      // 在返回响应数据之前做一些预处理
      return response;
    }, onError: (DioError e) {
      // 当请求失败时做一些预处理
      return e;
    }));
  }
}
