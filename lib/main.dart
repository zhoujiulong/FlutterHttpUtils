import 'package:flutter/material.dart';
import 'package:flutter_http_utils/bean/music.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/music_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MusicBloc>(
      bloc: MusicBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MusicBloc bloc = BlocProvider.of<MusicBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("http util"),
      ),
      body: StreamBuilder(
          stream: bloc.musicStream,
          builder: (BuildContext context, AsyncSnapshot<Music> snapshot) {
            //如果数据为空则返回获取数据按钮
            if (snapshot.data == null) {
              return Center(
                child: FlatButton(
                  onPressed: () {
                    bloc.getMusic();
                  },
                  child: Text('点击获取网络数据'),
                  color: Colors.green,
                ),
              );
            }
            //列表显示返回的数据
            return ListView.builder(
              itemCount: snapshot.data.songlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: _buildItem(snapshot.data.songlist[index]),
                );
              },
            );
          }),
    );
  }

  //创建 item
  Widget _buildItem(Song data) {
    if (data == null) data = Song();
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
