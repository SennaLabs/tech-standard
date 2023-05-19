import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    @Default(0) @JsonKey(name: 'albumId') int albumId,
    @Default(0) int id,
    @Default('') String title,
    @Default('') String url,
    @Default('') @JsonKey(name: 'thumbnailUrl') String thumbnailUrl,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}
