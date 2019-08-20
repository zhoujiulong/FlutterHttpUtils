///返回对象封装
class BaseResponse {
  BaseResponse(this.code, this.message, this.result);

  //后台返回的错误码
  int code;
  //返回的信息
  String message;
  //返回的数据，需要自己进行处理成自己想要的对象
  Map<String, dynamic> result;

  BaseResponse.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        message = json["message"],
        result = json["result"];
}
