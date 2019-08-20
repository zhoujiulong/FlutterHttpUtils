import 'package:json_annotation/json_annotation.dart';

part 'music.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Music extends Object {
  Music(
      {this.channel, this.title, this.count, this.ch_name, this.artistid, this.avatar, this.channelid, this.songlist});

  String channel;
  String title;
  int count;
  String ch_name;
  String artistid;
  String avatar;
  int channelid;
  List<Song> songlist;

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);

  Map<String, dynamic> toJson() => _$MusicToJson(this);
}

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Song {
  Song(
      {this.all_rate,
      this.charge,
      this.method,
      this.artist,
      this.thumb,
      this.all_artist_id,
      this.resource_type,
      this.havehigh,
      this.title,
      this.songid,
      this.artist_id,
      this.flow});

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

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}
