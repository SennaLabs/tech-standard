// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penname_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PenNameModel _$$_PenNameModelFromJson(Map<String, dynamic> json) =>
    _$_PenNameModel(
      id: json['id'] as int?,
      firstPenName: json['firstPenName'] as String?,
      secondPenName: json['secondPenName'] as String?,
      facebookLink: json['facebookLink'] as String?,
      twitterLink: json['twitterLink'] as String?,
      totalFollower: json['totalFollower'] as int?,
      totalBook: json['totalBook'] as int?,
      totalBookshelf: json['totalBookshelf'] as int?,
      totalRead: json['totalRead'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      isFollowed: json['isFollowed'] as bool?,
      isChecked: json['isChecked'] as bool?,
    );

Map<String, dynamic> _$$_PenNameModelToJson(_$_PenNameModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstPenName': instance.firstPenName,
      'secondPenName': instance.secondPenName,
      'facebookLink': instance.facebookLink,
      'twitterLink': instance.twitterLink,
      'totalFollower': instance.totalFollower,
      'totalBook': instance.totalBook,
      'totalBookshelf': instance.totalBookshelf,
      'totalRead': instance.totalRead,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'isFollowed': instance.isFollowed,
      'isChecked': instance.isChecked,
    };
