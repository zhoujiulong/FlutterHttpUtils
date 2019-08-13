import 'package:flutter/material.dart';

import 'BaseResponse.dart';

///网络请求监听
class RequestListener {
  RequestListener(this.onSuccessListener, this.onErrorListener);

  //请求成功
  final ValueChanged<BaseResponse> onSuccessListener;
  //请求失败
  final ValueChanged<BaseResponse> onErrorListener;

  void onSuccess(BaseResponse response) {
    onSuccessListener(response);
  }

  void onError(BaseResponse response) {
    onErrorListener(response);
  }
}
