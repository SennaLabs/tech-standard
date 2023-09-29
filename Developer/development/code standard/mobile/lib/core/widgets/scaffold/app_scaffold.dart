import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tooling/core/extension/extensions.dart';
import 'package:tooling/core/theme/app_theme.dart';
import 'package:tooling/features/app_layout/app_layout.dart';
import 'package:tooling/features/app_layout/cubit/app_layout_cubit.dart';

part "src/bottom_navigation_bar.dart";

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    this.isMainState = false,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  }) : super(key: key);

  final bool isMainState;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment = AlignmentDirectional.centerEnd;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final void Function(bool)? onEndDrawerChanged;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

  factory AppScaffold.main({
    required Widget body,
    required Widget bottomNavigationBar,
  }) {
    return AppScaffold(
      isMainState: true,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    // bloc selector handle state change and rebuild widget
    // ignore: unused_local_variable
    final hasIndex = context.select((AppLayoutCubit b) => b.state.bottomBarIndex >= 0);

    // use when need to get state from cubit and rebuild widget but not handle state change
    // ignore: unused_local_variable
    final bottomBarIndex = context.watch<AppLayoutCubit>().state.bottomBarIndex;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: BlocSelector<AppLayoutCubit, AppLayoutState, int>(
          selector: (state) => state.bottomBarIndex,
          builder: (context, index) {
            String title =
                AppLayoutBottomNavigationBar._items.elementAt(index).label ?? "Tech Standard";
            return Text(
              title,
              style: AppTheme.font.mitrS22.copyWith(
                color: AppTheme.color.mainWhiteColor,
              ),
            );
          },
        ),
      ),
      body: SizedBox(
        width: context.mediaSize.width,
        height: context.mediaSize.height,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterAlignment: persistentFooterAlignment,
      persistentFooterButtons: persistentFooterButtons,
      drawer: drawer,
      endDrawer: endDrawer,
      onDrawerChanged: onDrawerChanged,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
    );
  }
}
