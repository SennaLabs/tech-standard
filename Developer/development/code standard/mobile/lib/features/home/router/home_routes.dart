import 'package:flutter/material.dart';
import 'package:tooling/features/home/screen/home_screen.dart';

part 'home_arguments.dart';

Map<String, Widget Function(BuildContext)> homeRoutes = {
  "/home": (context) {
    final args = ModalRoute.of(context)?.settings.arguments as HomeArguments?;

    return const HomeScreen();
  },
};
