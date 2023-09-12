import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tooling/core/widgets/scaffold/app_scaffold.dart';
import 'package:tooling/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:tooling/features/home/cubit/home_cubit.dart';
import 'package:tooling/features/home/screen/home_screen.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  static final bottomNavigatorKey = GlobalKey<State<BottomNavigationBar>>();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppLayoutCubit, AppLayoutState, int>(
      selector: (state) => state.bottomBarIndex,
      builder: (context, bottomBarIndex) {
        return AppScaffold.main(
          body: IndexedStack(
            index: bottomBarIndex,
            children: [
              BlocProvider(
                create: (context) => HomeCubit()..fetchDataFromApi(),
                child: const HomeScreen(),
              ),
              const ColoredBox(color: Colors.red),
              const ColoredBox(color: Colors.blue),
              const ColoredBox(color: Colors.orange)
            ],
          ),
          bottomNavigationBar: AppLayoutBottomNavigationBar.main(
            currentIndex: bottomBarIndex,
            onTap: (int index) {
              if (bottomBarIndex != index) {
                context.read<AppLayoutCubit>().onTabChanged(index);
              }
            },
          ),
        );
      },
    );
  }
}
