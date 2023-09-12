import 'package:flutter/material.dart';
import 'package:tooling/features/app_layout/app_layout.dart';
import 'package:tooling/features/authentication/router/auth_routes.dart';
import 'package:tooling/features/home/router/home_routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Map<String, Widget Function(BuildContext)> appRoutes = {
  /// Example Navigator.pushNamed( context, '/' );
  '/': (context) => const AppLayout(),
  ...authRoutes,
  ...homeRoutes,
};