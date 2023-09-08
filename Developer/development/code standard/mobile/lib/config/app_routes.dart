import 'package:flutter/material.dart';
import 'package:tooling/features/authentication/router/auth_routes.dart';
import 'package:tooling/features/example/example_routes.dart';
import 'package:tooling/features/example/screen/example_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Map<String, Widget Function(BuildContext)> appRoutes = {
  /// Example Navigator.pushNamed( context, '/' );
  '/': (context) => const ExampleScreen(),
  ...exampleRoutes,
  ...authRoutes,
};