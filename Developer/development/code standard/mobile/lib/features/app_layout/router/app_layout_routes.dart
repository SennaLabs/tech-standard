import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tooling/features/home/cubit/home_cubit.dart';
import 'package:tooling/features/home/screen/home_screen.dart';

Map<String, Widget Function(BuildContext)> appLayoutRoutes = {
  "/home": (context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeScreen(),
    );
  },
  // "/book-shelf": (context)
};
