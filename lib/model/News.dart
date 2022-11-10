import 'package:freezed_annotation/freezed_annotation.dart';

part 'News.freezed.dart';
part 'News.g.dart';

@freezed
class News with _$News {
  const factory News(
      {required String title,
      required String author,
      required int points,
      required int comments}) = _News;

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);
}
