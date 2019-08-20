// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Music _$MusicFromJson(Map<String, dynamic> json) {
  return Music(
      channel: json['channel'] as String,
      title: json['title'] as String,
      count: json['count'] as int,
      ch_name: json['ch_name'] as String,
      artistid: json['artistid'] as String,
      avatar: json['avatar'] as String,
      channelid: json['channelid'] as int,
      songlist: (json['songlist'] as List)
          ?.map((e) =>
              e == null ? null : Song.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MusicToJson(Music instance) => <String, dynamic>{
      'channel': instance.channel,
      'title': instance.title,
      'count': instance.count,
      'ch_name': instance.ch_name,
      'artistid': instance.artistid,
      'avatar': instance.avatar,
      'channelid': instance.channelid,
      'songlist': instance.songlist
    };

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
      all_rate: json['all_rate'] as String,
      charge: json['charge'] as int,
      method: json['method'] as int,
      artist: json['artist'] as String,
      thumb: json['thumb'] as String,
      all_artist_id: json['all_artist_id'] as String,
      resource_type: json['resource_type'] as String,
      havehigh: json['havehigh'] as int,
      title: json['title'] as String,
      songid: json['songid'] as String,
      artist_id: json['artist_id'] as String,
      flow: json['flow'] as int);
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'all_rate': instance.all_rate,
      'charge': instance.charge,
      'method': instance.method,
      'artist': instance.artist,
      'thumb': instance.thumb,
      'all_artist_id': instance.all_artist_id,
      'resource_type': instance.resource_type,
      'havehigh': instance.havehigh,
      'title': instance.title,
      'songid': instance.songid,
      'artist_id': instance.artist_id,
      'flow': instance.flow
    };
