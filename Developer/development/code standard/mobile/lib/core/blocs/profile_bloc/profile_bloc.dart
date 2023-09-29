import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tooling/core/models/profile/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends HydratedBloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<HandleExampleSaveProfileNameEvent>(_mapExampleSaveProfileNameEventToState);
  }

  void _mapExampleSaveProfileNameEventToState(
      HandleExampleSaveProfileNameEvent event, Emitter emit) {
    ProfileModel user = state.profile.copyWith(profileName: event.profileName);
    emit(state.copyWith(profile: user, status: ProfileStatus.success));
  }

  @override
  ProfileState? fromJson(Map<String, dynamic> json) {
    return ProfileState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ProfileState state) {
    return state.toJson();
  }
}
