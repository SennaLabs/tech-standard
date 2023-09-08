// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int? ?? 0,
      mobilePin: json['mobilePin'] as String? ?? "",
      avatarImgPath: json['avatarImgPath'] as String? ?? "",
      bannerImgPath: json['bannerImgPath'] as String? ?? "",
      idNumber: json['idNumber'] as String? ?? "",
      fullName: json['fullName'] as String? ?? "",
      email: json['email'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      birthDay: json['birthDay'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      isSubscribe: json['isSubscribe'] as bool? ?? false,
      isAcceptPolicy: json['isAcceptPolicy'] as bool? ?? false,
      isBan: json['isBan'] as bool? ?? false,
      username: json['username'] as String? ?? "",
      displayName: json['displayName'] as String? ?? "",
      facebookLink: json['facebookLink'] as String? ?? "",
      twitterLink: json['twitterLink'] as String? ?? "",
      currentFreeCoin: (json['currentFreeCoin'] as num?)?.toDouble() ?? 0,
      currentPaidCoin: (json['currentPaidCoin'] as num?)?.toDouble() ?? 0,
      profilePageSlug: json['profilePageSlug'] as String? ?? "",
      aboutMe: json['aboutMe'] as String? ?? "",
      allowReadLikeHistory: json['allowReadLikeHistory'] as bool? ?? false,
      allowSendMessage: json['allowSendMessage'] as bool? ?? false,
      allowShowCoinUsage: json['allowShowCoinUsage'] as bool? ?? false,
      totalFollowing: json['totalFollowing'] as int? ?? 0,
      totalFollower: json['totalFollower'] as int? ?? 0,
      totalBook: json['totalBook'] as int? ?? 0,
      totalBookshelf: json['totalBookshelf'] as int? ?? 0,
      totalRead: json['totalRead'] as int? ?? 0,
      usernameEditable: json['usernameEditable'] as bool? ?? false,
      emailEditable: json['emailEditable'] as bool? ?? false,
      ageVerifyRejectedReason: json['ageVerifyRejectedReason'] as String? ?? "",
      idCardImgPath: json['idCardImgPath'] as String? ?? "",
      newBookNotification: json['newBookNotification'] as bool? ?? false,
      newChapterNotification: json['newChapterNotification'] as bool? ?? false,
      contentUpdatedNotification:
          json['contentUpdatedNotification'] as bool? ?? false,
      commentRepliedNotification:
          json['commentRepliedNotification'] as bool? ?? false,
      bookEndedNotification: json['bookEndedNotification'] as bool? ?? false,
      pushNotification: json['pushNotification'] as bool? ?? false,
      mareadsEmailNotification:
          json['mareadsEmailNotification'] as bool? ?? false,
      coinPurchasedEmailNotification:
          json['coinPurchasedEmailNotification'] as bool? ?? false,
      coinUsedEmailNotification:
          json['coinUsedEmailNotification'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? "",
      updatedAt: json['updatedAt'] as String? ?? "",
      subscribedWriterNotification:
          json['subscribedWriterNotification'] as bool? ?? false,
      commentedWriterNotification:
          json['commentedWriterNotification'] as bool? ?? false,
      likedWriterNotification:
          json['likedWriterNotification'] as bool? ?? false,
      taggedWriterNotification:
          json['taggedWriterNotification'] as bool? ?? false,
      supportedWriterNotification:
          json['supportedWriterNotification'] as bool? ?? false,
      pushWriterNotification: json['pushWriterNotification'] as bool? ?? false,
      mareadsEmailWriterNotification:
          json['mareadsEmailWriterNotification'] as bool? ?? false,
      salesSummaryWriterNotification:
          json['salesSummaryWriterNotification'] as bool? ?? false,
      isFollowed: json['isFollowed'] as bool? ?? false,
      isAdmin: json['isAdmin'] as bool? ?? false,
      writingDisabled: json['writingDisabled'] as bool? ?? false,
      penName: (json['penName'] as List<dynamic>?)
              ?.map((e) => PenNameModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PenNameModel>[],
      iosHomeBannerEnable: json['iosHomeBannerEnable'] as bool? ?? false,
      androidHomeBannerEnable:
          json['androidHomeBannerEnable'] as bool? ?? false,
      iosCoinBannerEnable: json['iosCoinBannerEnable'] as bool? ?? false,
      androidCoinBannerEnable:
          json['androidCoinBannerEnable'] as bool? ?? false,
      isPermanentBan: json['isPermanentBan'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobilePin': instance.mobilePin,
      'avatarImgPath': instance.avatarImgPath,
      'bannerImgPath': instance.bannerImgPath,
      'idNumber': instance.idNumber,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'birthDay': instance.birthDay,
      'gender': instance.gender,
      'isSubscribe': instance.isSubscribe,
      'isAcceptPolicy': instance.isAcceptPolicy,
      'isBan': instance.isBan,
      'username': instance.username,
      'displayName': instance.displayName,
      'facebookLink': instance.facebookLink,
      'twitterLink': instance.twitterLink,
      'currentFreeCoin': instance.currentFreeCoin,
      'currentPaidCoin': instance.currentPaidCoin,
      'profilePageSlug': instance.profilePageSlug,
      'aboutMe': instance.aboutMe,
      'allowReadLikeHistory': instance.allowReadLikeHistory,
      'allowSendMessage': instance.allowSendMessage,
      'allowShowCoinUsage': instance.allowShowCoinUsage,
      'totalFollowing': instance.totalFollowing,
      'totalFollower': instance.totalFollower,
      'totalBook': instance.totalBook,
      'totalBookshelf': instance.totalBookshelf,
      'totalRead': instance.totalRead,
      'usernameEditable': instance.usernameEditable,
      'emailEditable': instance.emailEditable,
      'ageVerifyRejectedReason': instance.ageVerifyRejectedReason,
      'idCardImgPath': instance.idCardImgPath,
      'newBookNotification': instance.newBookNotification,
      'newChapterNotification': instance.newChapterNotification,
      'contentUpdatedNotification': instance.contentUpdatedNotification,
      'commentRepliedNotification': instance.commentRepliedNotification,
      'bookEndedNotification': instance.bookEndedNotification,
      'pushNotification': instance.pushNotification,
      'mareadsEmailNotification': instance.mareadsEmailNotification,
      'coinPurchasedEmailNotification': instance.coinPurchasedEmailNotification,
      'coinUsedEmailNotification': instance.coinUsedEmailNotification,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'subscribedWriterNotification': instance.subscribedWriterNotification,
      'commentedWriterNotification': instance.commentedWriterNotification,
      'likedWriterNotification': instance.likedWriterNotification,
      'taggedWriterNotification': instance.taggedWriterNotification,
      'supportedWriterNotification': instance.supportedWriterNotification,
      'pushWriterNotification': instance.pushWriterNotification,
      'mareadsEmailWriterNotification': instance.mareadsEmailWriterNotification,
      'salesSummaryWriterNotification': instance.salesSummaryWriterNotification,
      'isFollowed': instance.isFollowed,
      'isAdmin': instance.isAdmin,
      'writingDisabled': instance.writingDisabled,
      'penName': instance.penName,
      'iosHomeBannerEnable': instance.iosHomeBannerEnable,
      'androidHomeBannerEnable': instance.androidHomeBannerEnable,
      'iosCoinBannerEnable': instance.iosCoinBannerEnable,
      'androidCoinBannerEnable': instance.androidCoinBannerEnable,
      'isPermanentBan': instance.isPermanentBan,
    };
