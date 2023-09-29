import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });

    //example handle user click delay 300ms
    on<HandleUserClickEvent>(
      _mapUserClickEventToState,
      transformer: (events, mapper) =>
          events.debounceTime(const Duration(milliseconds: 300)).asyncExpand(mapper),
    );
  }

  void _mapUserClickEventToState(HandleUserClickEvent event, emit) {}
}
