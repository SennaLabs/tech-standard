part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class HandleExampleSaveProfileNameEvent extends ProfileEvent {
  HandleExampleSaveProfileNameEvent({required this.profileName});

  final String profileName;
}
