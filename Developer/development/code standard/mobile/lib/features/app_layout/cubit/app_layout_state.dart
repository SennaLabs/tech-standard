part of 'app_layout_cubit.dart';

class AppLayoutState extends Equatable {
  final int bottomBarIndex;

  const AppLayoutState({
    this.bottomBarIndex = 0,
  });

  AppLayoutState copyWith({
    int? bottomBarIndex,
  }) {
    return AppLayoutState(
      bottomBarIndex: bottomBarIndex ?? this.bottomBarIndex,
    );
  }

  @override
  List<Object?> get props => [bottomBarIndex];
}
