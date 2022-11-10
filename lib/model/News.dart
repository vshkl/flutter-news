import 'package:freezed_annotation/freezed_annotation.dart';

part 'News.freezed.dart';
part 'News.g.dart';

@freezed
class News with _$News {
  const factory News(
      {required String title,
      required String author,
      required int points,
      @JsonKey(name: 'num_comments') required int comments}) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
