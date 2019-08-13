class music_broadcasting_details_bean extends Object {

  music_broadcasting_details_bean();

  String channel;
  String title;
  int count;
  String ch_name;
  String artistid;
  String avatar;
  int channelid;
  List<song> songlist;

  factory music_broadcasting_details_bean.fromJson(Map<String, dynamic> json) {

    music_broadcasting_details_bean bean = music_broadcasting_details_bean();
    bean.channel = json["channel"];
    bean.title = json["title"];
    bean.count = json["count"];
    bean.ch_name = json["ch_name"];
    bean.artistid = json["artistid"];
    bean.avatar = json["avatar"];
    bean.channelid = json["channelid"];

    var list = json['songlist'] as List;
    List<song> songlist = list.map((i) => song.fromJson(i)).toList();
    bean.songlist = songlist;

    return bean;
  }
}

class song {

  song();

  String all_rate;
  int charge;
  int method;
  String artist;
  String thumb;
  String all_artist_id;
  String resource_type;
  int havehigh;
  String title;
  String songid;
  String artist_id;
  int flow;

  song.fromJson(Map<String, dynamic> json)
      : this.all_rate = json["all_rate"],
        this.charge = json["charge"],
        this.method = json["method"],
        this.artist = json["artist"],
        this.thumb = json["thumb"],
        this.all_artist_id = json["all_artist_id"],
        this.resource_type = json["resource_type"],
        this.havehigh = json["havehigh"],
        this.title = json["title"],
        this.songid = json["songid"],
        this.artist_id = json["artist_id"],
        this.flow = json["flow"];
}































