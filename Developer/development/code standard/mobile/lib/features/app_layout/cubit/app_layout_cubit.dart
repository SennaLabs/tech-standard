import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(const AppLayoutState());

  void onTabChanged(int index) => emit(state.copyWith(bottomBarIndex: index));
}
