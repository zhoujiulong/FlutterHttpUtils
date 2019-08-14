import 'package:flutter/material.dart';
import 'package:flutter_http_utils/music_broadcasting_details_bean.dart';

import 'http_util/BaseResponse.dart';
import 'http_util/MyHttpUtil.dart';
import 'http_util/RequestListener.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'http utils'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var msg = '点击获取网络数据';
  List<song> songList = List<song>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //列表显示返回的数据
      body: ListView.builder(
        itemCount: songList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: _buildItem(songList[index]),
          );
        },
      ),
      //按钮，点击获取网络数据
      floatingActionButton: FlatButton(
        onPressed: _sendRequest,
        child: Text(msg),
        color: Colors.green,
      ),
    );
  }

  //发送请求
  _sendRequest() {
    MyHttpUtil.instance.post(
        "musicBroadcastingDetails?channelname=public_tuijian_spring",
        RequestListener(
            onSuccessListener: (BaseResponse data) => _onResponseSuccess(data),
            onErrorListener: (BaseResponse errorData) => _onResponseError(errorData)));
  }

  //请求成功
  _onResponseSuccess(BaseResponse data) {
    music_broadcasting_details_bean bean = music_broadcasting_details_bean.fromJson(data.result);
    setState(() {
      msg = "获取网络数据成功，点击重新获取";
      songList = bean.songlist;
    });
  }

  //请求失败
  _onResponseError(BaseResponse data) {
    setState(() {
      msg = "网络请求失败，点击重新获取：${data.message}";
    });
  }

  //创建 item
  Widget _buildItem(song data) {
    if (data == null) data = song();
    String title = data.title != null ? data.title : "未知标题";
    String artist = data.artist != null ? data.artist : "未知艺术家";
    String imgSrc = data.thumb != null ? data.thumb : "";

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          child: Image.network(
            imgSrc,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(artist),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
