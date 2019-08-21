import 'package:flutter_http_utils/bean/music.dart';
import 'package:flutter_http_utils/http_util/base_response.dart';
import 'package:flutter_http_utils/http_util/my_http_util.dart';
import 'package:flutter_http_utils/http_util/request_listener.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

///music 业务处理
class MusicBloc implements BlocBase {

  BehaviorSubject<Music> _musicSubject = BehaviorSubject<Music>();

  Sink<Music> get _musicSink => _musicSubject.sink;

  Stream<Music> get musicStream => _musicSubject.stream;

  //发送请求
  getMusic() {
    MyHttpUtil.instance.post(
        "musicBroadcastingDetails?channelname=public_tuijian_spring",
        RequestListener(
            onSuccessListener: (BaseResponse data) => _onResponseSuccess(data),
            onErrorListener: (BaseResponse errorData) => _onResponseError(errorData)));
  }

  //请求成功
  _onResponseSuccess(BaseResponse data) {
    Music bean = Music.fromJson(data.result);
    _musicSink.add(bean);
  }

  //请求失败
  _onResponseError(BaseResponse data) {
    _musicSink.add(null);
  }

  @override
  void dispose() {
    _musicSubject.close();
  }

}