import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String? profileName;

  const ProfileModel({this.profileName});

  // update
  ProfileModel copyWith({String? profileName}) {
    return ProfileModel(profileName: profileName ?? this.profileName);
  }

  // convert to json
  Map<String, dynamic> toJson() {
    return {
      'profileName': profileName,
    };
  }

  // convert from json
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      profileName: json['profileName'] as String,
    );
  }

  @override
  List<Object?> get props => [profileName];
}
