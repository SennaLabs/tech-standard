part of 'profile_bloc.dart';

enum ProfileStatus { initial, success, failure, loading, restate }

class ProfileState extends Equatable {
  final ProfileModel profile;
  final ProfileStatus status;

  const ProfileState({
    this.profile = const ProfileModel(),
    this.status = ProfileStatus.initial,
  });

  ProfileState copyWith({
    ProfileModel? profile,
    ProfileStatus? status,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      status: status ?? this.status,
    );
  }

  factory ProfileState.fromJson(Map<String, dynamic> json) {
    return ProfileState(
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      status: ProfileStatus.values
          .firstWhere((item) => item.name.toString() == json['status'] as String),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'profile': profile.toJson(),
      'status': status.name,
    };
  }

  @override
  List<Object?> get props => [profile, status];
}
