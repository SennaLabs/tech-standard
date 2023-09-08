import 'package:freezed_annotation/freezed_annotation.dart';

part "penname_model.freezed.dart";

part "penname_model.g.dart";

@freezed
class PenNameModel with _$PenNameModel {
  const factory PenNameModel({
    int? id,
    String? firstPenName,
    String? secondPenName,
    String? facebookLink,
    String? twitterLink,
    int? totalFollower,
    int? totalBook,
    int? totalBookshelf,
    int? totalRead,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    bool? isFollowed,
    bool? isChecked,
  }) = _PenNameModel;

  factory PenNameModel.fromJson(Map<String, Object?> json) => _$PenNameModelFromJson(json);
}