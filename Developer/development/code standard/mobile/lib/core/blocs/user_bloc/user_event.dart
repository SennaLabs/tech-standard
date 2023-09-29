part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class HandleUserClickEvent extends UserEvent {
  HandleUserClickEvent();
}
