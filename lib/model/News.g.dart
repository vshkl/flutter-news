// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_News _$$_NewsFromJson(Map<String, dynamic> json) => _$_News(
      title: json['title'] as String,
      author: json['author'] as String,
      points: json['points'] as int,
      comments: json['num_comments'] as int,
    );

Map<String, dynamic> _$$_NewsToJson(_$_News instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'points': instance.points,
      'num_comments': instance.comments,
    };
