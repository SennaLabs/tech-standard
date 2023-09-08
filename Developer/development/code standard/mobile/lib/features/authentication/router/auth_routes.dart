import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tooling/features/authentication/login/cubit/login_cubit.dart';

import '../login/screen/login_screen.dart';
import '../register/screen/register_screen.dart';

part 'auth_arguments.dart';

Map<String, Widget Function(BuildContext)> authRoutes = {
  "/login": (context) {
    final args = ModalRoute.of(context)?.settings.arguments as LoginArguments?;

    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: const LoginScreen(),
    );
  },
  "/register": (context) {
    return const RegisterScreen();
  }
};